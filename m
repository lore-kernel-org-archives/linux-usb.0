Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFC9348465;
	Sun, 23 Aug 2026 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488029; cv=none; b=R2jxjcOBwijmdMLNPRW32fQVxI4RrgNBBZXs6ZuJQCk/5Cn1Bp0UH5LgbqTz039HRTe8B1kJxqCoBVD4/PajAeeOXBvfigOVjPtjSzv+0JpMwFxKyQMaROlAfz1RqqkUJasvqJJyDuNHPvXUpBUtjEs/k0TySYK/CZbxauyx8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488029; c=relaxed/simple;
	bh=txxkGAGy5bWunIBFiKGptpFinsQpOAZznBNV5ST03Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWjtLC+XaqtIplCb8wVtOqPW4IGqB/dEd3G473mh8R4o2/KrFj1QTuA36oDfF/VBmP9gA3cCrxjPr5vmoMLmsSFRaQM8ATVOYRm7gwSUpddQCRopiCOUQhqx0+kQg7e/9vxvhohCpWE6Dg1P8qgyB6k9T30sD3pNc7MFzrdKrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rcLASvwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rcLASvwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C01F00A3A;
	Sun, 23 Aug 2026 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787488028;
	bh=vrIRcpLVTgq6oE840soa9mWtPli2PPJjeCrfeKK14Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rcLASvwZUEHThRvpburptR9OPi/gbQOTELYYF1sxtlcv4ZXcOupq/vaUmncUWhbyk
	 WGA3PeNI7gB52rqV/RDXXWt7nHLs4MaKtyfDH8X15z6QXVyysTOm8for1Wngs4Ym64
	 6neD+r0QXXFDz9uRUWgAspAo+9wpILFZXcn1BFTA=
Date: Sun, 23 Aug 2026 14:25:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jihong Min <hurryman2212@gmail.com>
Cc: Stephen Horvath <linux@stevetech.au>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
Message-ID: <2026082304-ebook-expel-d0b7@gregkh>
References: <20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au>
 <391eb22c-e893-4c0d-a4ae-d603d568b12b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <391eb22c-e893-4c0d-a4ae-d603d568b12b@gmail.com>

On Sun, Aug 23, 2026 at 09:23:42PM +0900, Jihong Min wrote:
> Hi,
> 
> On 8/20/26 21:59, Stephen Horvath wrote:
> > It seems the xhci-pci-prom21 module only has IDs for the 800 series
> > chipsets. However, the 600 series chipsets also have Promontory 21
> > chips, so we should add their IDs to the list as well.
> > 
> > I have tested this on my X670 board featuring DID `0x43f7`.
> > 
> > `1022:43f7` also appears on the PCI ID database
> > (https://pci-ids.ucw.cz/read/PC/1022/43f7).
> > Device IDs `0x43f9` (B665) & `0x43fa` (A620) were suggested by Shyam.
> 
> It would be nice to update all the newly added device IDs to the kernel
> documentation as well.

Documentation where exactly?

thanks,

greg k-h
