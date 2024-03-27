Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6D19F12EBC1
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548462; cv=none; b=C/xoTYOzv60s+y89gSr1QuT9fVzDM3atlDs3c21V8O4Dipyf/nV0EmuxudklcB2bYX2DxdoGlri3raIHSqoZaGAr4taOug4e7mWxjkAHTXpHEZJVqDMKctsjS5v2eaBJGDDcGdITvE44TblWmoYLJie9zePC3FaUss5lN8AUttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548462; c=relaxed/simple;
	bh=MSSyi01XOr72DSBQqPD/19BS4L+952ETTs+s/s34g4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4xFWLDv8R7fRn0nppZ+sFy2UrH+EXz+HCzscNEzO+opKa/Afn3egv9VJj7hIhTeqSzuCVlsShakSdhBJ1MCYK184gDX+STjR24YHEe3e5AEaL4LtXeydxyjPJA7MDVvwXdgO1OUwfvuuu6IpitzsIYR0HHZBSDfkwhpcv5p+hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 926719 invoked by uid 1000); 27 Mar 2024 10:07:37 -0400
Date: Wed, 27 Mar 2024 10:07:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Martijn Braam <martijn@brixit.nl>
Cc: linux-usb@vger.kernel.org
Subject: Re: Using a composite device with kernel drivers and libusb at the
 same time
Message-ID: <f7fb34c5-e5c6-4f7f-84f0-1e69312e8774@rowland.harvard.edu>
References: <00c4fd45-dc9f-4197-952e-c7c322b6370c@brixit.nl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00c4fd45-dc9f-4197-952e-c7c322b6370c@brixit.nl>

On Wed, Mar 27, 2024 at 12:33:51PM +0100, Martijn Braam wrote:
> I hope this is an acceptable place to ask this question. I've spend a bit of
> time reverse-engineering the USB protocol for a subset of Blackmagic Design
> video mixers and I have made a userspace implementation to make these
> devices usable in Linux with libusb. This is working great but the roadblock
> I have that I can't find a reasonable solution for is that these devices
> also expose an UVC webcam.

Why is that a roadblock?

> While my control software is active it's not possible to use the UVC webcam
> functionality of the device because with libusb I have to detach the kernel
> from the interfaces to make my userspace access work. As far as I can find
> documented online there's no way to have half a composite device handled by
> kernel drivers and half with userspace drivers in Linux.

Probably the reason it's not mentioned in any documentation is because 
it isn't a problem.  Your libusb program can detach some of the kernel 
drivers while leaving others attached, and then use the interfaces that 
are not controlled by a kernel driver.

Even if you can't make that work, why not just detach all of the 
interfaces and ignore the fact that the device has a UVC webcam?

>  It seems to me the
> only solution is to make a kernel driver to bind to the control interface
> and have that kernel driver pass-through to userspace somehow with a custom
> protocol? If that is the case would such a driver even be supported in
> Linux?

It seems unlikely.  Maybe you should explain your difficulty more fully.

> For reference the device I'm working has these looks like this:
> 
> USB 1-4  [1edb:be55] Blackmagic design Blackmagic Design [serial]
>    Class EF SubClass 02 Protocol 01
>       Interface 0 FF/03/00 Unknown <- Blackmagic USB configuration protocol
>       Interface 1 FF/02/00 Unknown <- Blackmagic USB control protocol (I'm
> using this with libusb)
>       Interface 2 FF/04/00 Unknown <- Unknown
>       Interface 3 FE/01/01 Unknown <- DFU
>       Interface 4 0E/01/01 Blackmagic Design <- UVC camera
>       Interface 5 0E/02/01 Unknown <- UVC camera
>       Interface 6 01/01/00 Blackmagic Design <- ALSA
>       Interface 7 01/02/00 Unknown <- ALSA

Which of these interfaces require a kernel driver?  Does your program 
require any of them besides interface 1?

> If this is not the right place for this question, then where would the right
> place be?

This is definitely the right place.

Alan Stern
