Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35EE3815FA
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991245; cv=none; b=KYWWW+1N+hau8CVLPvZIdtd6GIokgbLva4OXHaU8JgO3Yv3YbfTSNL3e99P3IGCeVtchQi0t6xWAbo0+5bbjA2TsG97kAaZBc1ObOn8aJOYlFgL89NdkCTG1Wsjn9wkq2qbTxNQRBO6yVPOOxEuTZsLUd0wdar7ohbYGSLMs3gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991245; c=relaxed/simple;
	bh=WDo7VJPCrocDbxpYiMt/VVtsaa2HFpbt2pimU7qWCQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkZ5YGynAi4rc05elOPqM7EFy2muSfIjidbDJr9S0ZDm/rcb8n4EnpWqNXa5ovAaEbP0bMgwX4RKVhd03uuiv3FuxVS+4iNpSxh+7HNhIB5eBTJV3KLhaMacLqcw6xAtB8X87KzjiU5DLOCDmFoPka8MwYpYuEDOYRNwy8MU57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lIh/hMqS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lIh/hMqS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A5B1F000E9;
	Thu,  6 Aug 2026 04:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785991244;
	bh=9bDZ/swxWvrILTaiCGMFBtTqnzk5wHYZsaHtjPZtScA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lIh/hMqSvE7TKYVw+JFUUL3rHE9u1DVh+6ajd9O6IvzT1oPXx6zaJ0w11Ev1bIKAz
	 lt03ukeX9oiPuzwrYXtkLzmSeQV1P0uG9hmwtRzPbFFJKiu8otGbZ4VPEXaWbqfA7R
	 kuewRSZR/q9dgZfFRq5dRAGwFZ0iXrkm3LcaHZK4=
Date: Thu, 6 Aug 2026 06:40:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vegom Doster <vegomdoster@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: ch341: add debugfs interface and clean up
Message-ID: <2026080638-zoning-trekker-b568@gregkh>
References: <CACnaG5x_EPK+PGqdrRO-OgOQ3go8EKFdV+R14bKuc9mTS5r31w@mail.gmail.com>
 <CACnaG5z0_QERhbWNJsERJQkDb14ppy7Pkbxgt6WwM6u9h9UhUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnaG5z0_QERhbWNJsERJQkDb14ppy7Pkbxgt6WwM6u9h9UhUg@mail.gmail.com>

On Wed, Aug 05, 2026 at 08:28:00PM +0500, Vegom Doster wrote:
> On Wed, Aug 5, 2026 at 8:27 PM Vegom Doster <vegomdoster@gmail.com> wrote:
> 
> > This patch adds a debugfs interface for the CH341 driver, allowing runtime
> > inspection of chip version, quirks, and line status. It also adds a 'baud'
> > file to test the divisor calculation without hardware.
> >
> > The patch also cleans up magic numbers, removes duplicate code, and fixes
> > several issues:
> > - Replace obsolete usb_control_msg() with usb_control_msg_send/recv
> > - Convert version>0x27 hack to proper CH341_QUIRK_INVERTED_BIT7
> > - Fix baud_rate update in ch341_set_termios (only on success)
> > - Use READ_ONCE/WRITE_ONCE for break_end
> > - Fix error handling in ch341_reset_resume
> > - Add debugfs interface for diagnostics
> >
> > No functional changes are made to the driver's operation.
> >
> > Tested on Arch Linux with Arduino Uno (CH340C, 1a86:7523):
> > - checkpatch: 0 errors, 0 warnings, 0 checks
> > - DTR/RTS (tiocmget/set): PASS
> > - Echo at 9600 and 115200 baud: PASS (byte-per-byte)
> > - Divisor formula for 15 speeds (300..3000000): PASS (error ≤0.16%)
> > - debugfs: tested with custom test script
> >
> > Signed-off-by: nerolocker <vegomdoster@gmail.com>

This shouldn't be quoted, and you need a real name for the signed-off-by
line.

> >

> // SPDX-License-Identifier: GPL-2.0

This isn't a diff, but rather the whole file.

Perhaps take a look at the "how to write a kernel patch" tutorial on
kernelnewbies.org first?

Also, obviously, you have to break this up into smaller pieces to even
be able to get it reviewed :)

And finally, why add a debugfs file at all?  What is it going to be used
for and why is it only needed now, after the driver is very stable?

thanks,

greg k-h
