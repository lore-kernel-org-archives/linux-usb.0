Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808C261B70;
	Mon, 13 Jul 2026 05:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919721; cv=none; b=F5cEv7LUk8L9MOJfvK3ZRMzM4Tayw34mCJVwtkeH+gAewbR8150v0bJMe7Cpl8Dt6Skn7AOYmhIcXgpSxeDyicFkAoDYI6h5AWf9JaIOFR/FrEcqi28+PT5GK4mlt2loYZENUeQvGdRuU/V+LXc+mwj8N1YgN8dqxfh9E89UMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919721; c=relaxed/simple;
	bh=vvKxKmBzBSqjpHz0uozpOPw3BqQW2x2nREskTSk89Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4sBh8QwOpZLpNdZiKHEagjOpO60p3sZnaN4D2FjN5pv1sYE/XCxUY+11M0ecoVWyQGWE3hrwccW/ROXdm7u1qgUd496J5iZl84ajSgnhSZmFNGjsApyqEYHRsYWHjuybDvj4zgyy35fq4E4IuQvES+SAgh0/JbsBhi0W+e2H6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YBGCOqv/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YBGCOqv/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C491F000E9;
	Mon, 13 Jul 2026 05:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783919720;
	bh=AfQrPiDWtsPL9nD+PnuZqqThPhevTDp0SL4ON90Rcck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBGCOqv/iAMzBe8R5e7aq9cX/P4MNuqZbC41ASwdht2NUQ6cCGJYyy8oAo0NGw5BY
	 x9LmUfgk3toK/A7Q++1A7xXPptFiAQoLr9M4903A/B4xh+3bSyf3cFZ038WpfzumDm
	 BDhZfQHhqK0/eKJconvGBtEXyP/+qrjZFXPDYAVg=
Date: Mon, 13 Jul 2026 07:15:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kanishka De Silva <kpskanna1915@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: adutux: fix unlocked read_buffer_length write
 in adu_open() (data race)
Message-ID: <2026071358-illusion-basics-1146@gregkh>
References: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>

On Mon, Jul 13, 2026 at 10:15:05AM +0530, Kanishka De Silva wrote:
> Hi Greg,
> 
> While auditing drivers/usb/misc/adutux.c in Linux 7.1.3, I found that
> adu_open() writes dev->read_buffer_length without holding
> dev->buflock, while every other path that touches this field
> (adu_interrupt_in_callback() and adu_read()) correctly takes buflock
> as documented in the locking comment at the top of the file:
> 
>   * The locking scheme is a vanilla 3-lock:
>   *   adu_device.buflock: A spinlock, covers what IRQs touch.
> 
> adu_open() (drivers/usb/misc/adutux.c:268):
> 
>     /* initialize in direction */
>     dev->read_buffer_length = 0;
> 
> This is reached while holding only adutux_mutex, not buflock. Meanwhile:
> 
> - adu_interrupt_in_callback() (lines 165-196) holds buflock while
> reading and incrementing read_buffer_length from IRQ context.
> - adu_read() (lines 394-404) holds buflock while reading, swapping,
> and zeroing read_buffer_length.
> 
> So two different locks (adutux_mutex vs buflock) are used to protect
> the same field, which is a textbook data race: if an IRQ callback
> increments read_buffer_length concurrently with a re-open() clearing
> it, the increment can be silently lost, corrupting buffer state.
> Repeated open/close under interrupt load can produce stale or dropped
> USB read data from the ADU device.
> 
> I reproduced the race by extracting the exact code paths (locking
> primitives, field layout, and control flow) into a standalone
> userspace program and running it under ThreadSanitizer with pthreads
> simulating the IRQ callback and open() paths concurrently. TSan
> reports the expected data race between the two lock domains on
> read_buffer_length. I'm happy to send the verifier program if useful,
> though I want to be clear it's a userspace reconstruction for
> lock-discipline verification, not the compiled kernel driver itself.
> 
> Suggested fix:
> 
>     static int adu_open(struct inode *inode, struct file *file)
>     {
>     +   unsigned long flags;
>         ...
>     -   dev->read_buffer_length = 0;
>     +   spin_lock_irqsave(&dev->buflock, flags);
>     +   dev->read_buffer_length = 0;
>     +   spin_unlock_irqrestore(&dev->buflock, flags);
> 
> Impact is data corruption / stale reads on the ADU USB device class,
> not memory corruption or privilege escalation, so I'd call this Medium
> severity. Reachable by any unprivileged user who can open
> /dev/usb/adutuxN.
> 
> Happy to send a proper patch with commit message if this looks correct
> to you — let me know if you'd like it in a different form.

Just send a proper patch, you never have to ask if you should do so or
not :)
