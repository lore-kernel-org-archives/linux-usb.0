Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F554344D9D
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 04:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991307; cv=none; b=Sb+U0j+uiQ8sSetwpH+aaaXA1bawi6bcJaFXJi5JeA3b2Gp2CNzblbQ3TcLIE+/UulWsAzt0hurAEhPg/PeLoYAqoxJOXlfq1259QV9mZ7T/6s9V+PW0U+dcqPJ4rkdUqpq6B1qhRbp9YGaMLH4P8mPqrJ6eOmgMsgJ4q1fkfDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991307; c=relaxed/simple;
	bh=5helDFGCOoqgRgtBfiSbfnqziav7vD3cVtIel8bFd70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FezEOGi0Ja5j94qBpfd3lWlzL+GluSnbq7a1qSSSXXw7dpMN/wCuUliGfAkvZG9jedi+X+08es+eADiSPU/YXkPLFpb241wCdEzoH7Dg0zDs17i8tDL5GQdXS93wBHLURxVeSH87Ne3gmipE7gFIynPgxEnUbfxVB+ZtQKieFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OCeDya94; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OCeDya94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCEC1F000E9;
	Thu,  6 Aug 2026 04:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785991306;
	bh=si1QMsAOeo+ZU1UwK/S8uGjVnSBT0e2iMRwRSID5FlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OCeDya94p95mWH3P5lPrcvm52AURTmSnfXfpQfuxZk+IkPE+/5cVO59soGOjBlc2n
	 A2h2rzeay8LD19kMjmyQP7sWJkTNkgiEcdGoOuEEWC4vo5z2kwYtznJSS0TM8urHgK
	 ws7z6U2dpLePkqrNUsIqssp0wLSIn79Ouy6ru6HI=
Date: Thu, 6 Aug 2026 06:41:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vegom Doster <vegomdoster@gmail.com>
Cc: linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH] usb: serial: ch341: add debugfs interface and clean up
Message-ID: <2026080655-ludicrous-pyromania-cced@gregkh>
References: <CACnaG5x8-y7aOWw=d73pqWyQL36MSjQctJDWuk+r96o-BNhgMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACnaG5x8-y7aOWw=d73pqWyQL36MSjQctJDWuk+r96o-BNhgMw@mail.gmail.com>

On Wed, Aug 05, 2026 at 08:31:00PM +0500, Vegom Doster wrote:
> This patch adds a debugfs interface for the CH341 driver, allowing runtime
> inspection of chip version, quirks, and line status. It also adds a 'baud'
> file to test the divisor calculation without hardware.
> 
> The patch also cleans up magic numbers, removes duplicate code, and fixes
> several issues:
> - Replace obsolete usb_control_msg() with usb_control_msg_send/recv
> - Convert version>0x27 hack to proper CH341_QUIRK_INVERTED_BIT7
> - Fix baud_rate update in ch341_set_termios (only on success)
> - Use READ_ONCE/WRITE_ONCE for break_end
> - Fix error handling in ch341_reset_resume
> - Add debugfs interface for diagnostics
> 
> No functional changes are made to the driver's operation.
> 
> Tested on Arch Linux with Arduino Uno (CH340C, 1a86:7523):
> - checkpatch: 0 errors, 0 warnings, 0 checks
> - DTR/RTS (tiocmget/set): PASS
> - Echo at 9600 and 115200 baud: PASS (byte-per-byte)
> - Divisor formula for 15 speeds (300..3000000): PASS (error ≤0.16%)
> - debugfs: tested with custom test script
> 
> Signed-off-by: nerolocker <vegomdoster@gmail.com>

Better, but my bot says:

--------

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
