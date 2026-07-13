Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5F0343D7B;
	Mon, 13 Jul 2026 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783923522; cv=none; b=CEMDK2Jq83J8pc9sDJAOG5pOsuYGU8PsM+kXIBw7nW3aIykglVgMhr4wv8RtzcmiB1ARpq8coAb5jVO/0WQUICP/18OBr+Cxd/iLzgN79qcylPjf3MTMeoNEzMIUSNEZ2I+E0zvodMoCCqaTnM2E6EI6dsGmOJv0+h9Dv4YhBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783923522; c=relaxed/simple;
	bh=rMxZK78cnd0b0s/qGZjvvd5kDmRnH2wreTiFK72s88E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWWigqfhpnI2szEmLmwo6YAaYHLiT86u8niW7LNJbDXsfvmNfO9zwqPL4hsihWbFctpBzFRAQmmWT+AO9GLY+0Y2csqjOQ+TNwefKXq1u1rKYmZ5QNitri5/A4yR3e4ie1V76Uwe6eSl9IokfzbMcW9WaanjYAPSQOiAfmYnWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1CTp7lvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1CTp7lvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755AF1F000E9;
	Mon, 13 Jul 2026 06:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783923521;
	bh=XG+HZ1MFByBXPVHZo/QaDQxpHvn2f6mbBVv1wW5eIkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1CTp7lvtAJSwT47YPulRETfUcPPfdBGGF8AbhCyUAKoStBsDakCjA0QqNVTPDrSgV
	 TON9Mggpiul5PRTqIANsW5Dw7HQELPvZOLOVs13ZtAmG3KyoZoHj2yEctP9I8RQT4F
	 DqR3CseyLeaMVx/p8JPRmUVnv3+mLC5CCb1SwHyk=
Date: Mon, 13 Jul 2026 08:17:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Sam Day <me@samcday.com>, Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
Message-ID: <2026071306-thinning-flattery-d557@gregkh>
References: <20260710145430.501893-1-ben.dooks@codethink.co.uk>
 <2026071124-gracious-spry-9b7b@gregkh>
 <9f7cbd43-16e1-495e-8f56-9bce8fa5e437@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f7cbd43-16e1-495e-8f56-9bce8fa5e437@codethink.co.uk>

On Mon, Jul 13, 2026 at 07:00:30AM +0100, Ben Dooks wrote:
> On 11/07/2026 06:09, Greg Kroah-Hartman wrote:
> > On Fri, Jul 10, 2026 at 03:54:30PM +0100, Ben Dooks wrote:
> > > The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
> > > the type.
> > > 
> > > Fixes the following sparse warnings:
> > > drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
> > > drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
> > > drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
> > > drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
> > > drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
> > > drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize
> > > 
> > > Fixes: dcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across  usb_ep_autoconfig() call")
> > 
> > This isn't a valid git id :(
> 
> Looks like the b got dropped off the front during copy.
> 
> Fixes: bdcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across
> usb_ep_autoconfig() call")
> 
> commit bdcc03cef0fd8abc6eaeec6ac47e54ae8f8c625f
> Author: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Date:   Thu Jan 31 15:53:40 2019 +0100
> 
>     usb: gadget: f_fs: preserve wMaxPacketSize across usb_ep_autoconfig()
> call
> 
>     usb_ep_autoconfig() treats the passed descriptor as if it were an fs
>     descriptor. In particular, for bulk endpoints, it clips wMaxPacketSize
>     to 64. This patch preserves the original value.
> 
>     Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> 
> 

Great, please fix this up and resend.

thanks,

greg k-h
