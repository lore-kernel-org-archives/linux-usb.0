Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF93C0A13
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077985; cv=none; b=glk8nrWZwirKE/aUdgMJajzvXraNhJMEH8I+x1X3Q5P3gwV/jG910Qa3WtMQNerxSBoRDaCQ37NvTHVJXXdYNSoCwzKFZLk6eWEP+6DCw2DoM6tGyImVzlwNqYQdVu/toexG7tbET8z1MairpXlf95G5loiWPVJq2pS0HRh8V7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077985; c=relaxed/simple;
	bh=a4W3d7msFe7oUSqyPwPOia01Yj9ffh4D43oCAea/GdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEwSP95A015Q6114BiT1zeQI2fR9vO5sOzK/80Nfc+z3Z/qHHVlbnbkHn6FmzfCDRvTjbq1xTvZPwT+XhLx1k9LlT7Hrxl2Ak1a0EkdvKM7gGQpEzq6BuXC1fC3G8rlG0Rw+YRUJliclDSpiYuSh3+3tIGgYUdmSp4+mN8F7QKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VyFF1eJ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VyFF1eJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D78F1F000C5;
	Thu, 15 Oct 2026 15:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792077981;
	bh=dSjlskCGpXMiw4LUy3kLtIbV3v6CzJeD3x8f/Is+z9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VyFF1eJ3JjBVHvlkBowXtNl04M6imT1BV7bI7W3mgeDjSdC8oo+H8QgA9kbH7k8eN
	 329fE6HGTozqg4rnKsokDHfaRzjY1+PqUjMKCkxlIGlvyNAFsXkzPCU3BAxCxVhLfH
	 kmV5rEtwV3JMBZap8lH4FVzcf8zgk06QECQ0gHuk=
Date: Thu, 15 Oct 2026 17:26:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Reid D <skibletz@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: usb: devio: USBFS_XFER_MAX check bypassed for iso urbs due to
 incorrect ordering, potential oob heap write
Message-ID: <2026101546-civic-gorged-3023@gregkh>
References: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>
 <2026101531-secular-entire-f7a4@gregkh>
 <CAGNJ+_0ShEM-G+8p3oHx1uF8rBtC7JyqmyFzswDB50qsW=qwuw@mail.gmail.com>
 <2026101509-reggae-whacking-6598@gregkh>
 <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>
 <747393c4-4824-4a06-9747-3fd74028c2d7@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747393c4-4824-4a06-9747-3fd74028c2d7@rowland.harvard.edu>

On Thu, Oct 15, 2026 at 10:54:31AM -0400, Alan Stern wrote:
> On Thu, Oct 15, 2026 at 08:07:49AM -0400, Reid D wrote:
> > Greg, sorry about that.
> > 
> > The fix moves the USBFS_XFER_MAX check to after totlen is computed so it
> > validates the actual transfer size used for the kmalloc.
> 
> It isn't necessary to do this.  The check you added can never be 
> violated.
> 
> To see why, read the code.  The first thing the USBDEVFS_URB_TYPE_ISO 
> case does is ensure that uurb->number_of_packets <= 128.  The loop that 
> accumulates the individual packet sizes also limits isopkt[u].length to 
> be <= 98304.  Therefore the largest possible buffer size for an 
> isochronous transfer is 128 * 98304 = 12582912.  But USBFS_XFER_MAX is 
> (UINT_MAX / 2 - 1000000) or 2146483648, which is a lot bigger (about 2 
> billion vs. 12 million).  This means the calculated value for 
> uurb->buffer_length cannot exceed USBFS_XFER_MAX.
> 
> The real point of the USBFS_XFER_MAX check is to limit the size of bulk 
> and interrupt transfers.

Awe, you spoiled the test :)

Reid, again, remember that the _BEST_ LLM right now (top of the line,
frontier model, no guardrails) makes up patches that are 50% of the time
wrong.  You MUST have a reproducer to have a LLM be able to prove it, OR
take the time to manually review it yourself.

Best of luck!

greg k-h
