Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689A312831
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553916; cv=none; b=bEHOyKtb0GFpxGQQWbsz1NddbPLYkWC9+mwlcTxss33C2zpKTSFG6e0R8E3fzc6yi16czrYRPucqfrdJxItWJLs+LOSRYQk19cZLSO8Xe1ucOlax+jE1wiCh0/GdO5oiwgSSAFqndrjm24p7a+MIXfCZPCnInXKay7iqPZyOWRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553916; c=relaxed/simple;
	bh=49V4zcK+HTpc2iGBGWm1M2sqyf6gQVX0ZRk8D66h4TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZAZJe5WdqLDBShEWk+IDy48BfWEnunTbN7iJKLvxHZwBJKVprDh5F91A/p5KBnH2y/39vSj6vf40o0ySIEz8JFd8nWMtOyZ3bZZ2VLyWePcGq/1u9v4cszT7SCGwWGUYfh+2Zfb8mgeLFPIGTZE0/XBkGrqnLkGVV5tDecswtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OQYeaw3w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OQYeaw3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA491F000FF;
	Fri,  9 Oct 2026 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791553914;
	bh=rkurvKRzgnka3UMfw49oKp1a8mIe0zhby1y//fJ8MxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OQYeaw3wl9XaA/yfBXF4PBShVnp6c7SiwRuyBU/K424YVybZ+Ql1r77zpxZaKh1dR
	 QIWjr+4U9YXYdxTXYj5335aVH5ek6oG2CBUX2vuLat+0xr1RXBNgH7yz0SWV2Giu9C
	 3SZzEptVgEaQNxS+MWtQMmG7P/NSoVVTWiIaHp+I=
Date: Fri, 9 Oct 2026 15:51:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v7.3-rc7
Message-ID: <2026100936-flagstick-semicolon-e1c3@gregkh>
References: <20261007115859.GR176164@black.igk.intel.com>
 <2026100738-duct-antitoxic-1605@gregkh>
 <20261007131318.GS176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007131318.GS176164@black.igk.intel.com>

On Wed, Oct 07, 2026 at 03:13:18PM +0200, Mika Westerberg wrote:
> On Wed, Oct 07, 2026 at 02:58:06PM +0200, Greg Kroah-Hartman wrote:
> > On Wed, Oct 07, 2026 at 01:58:59PM +0200, Mika Westerberg wrote:
> > > Hi Greg,
> > > 
> > > The following changes since commit 395e9f2967a7ac6898026e8f136c369805dc2fd9:
> > > 
> > >   thunderbolt: Disable CL states for the Anker Prime TB5 dock (2026-09-28 11:34:48 +0200)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc7
> > > 
> > > for you to fetch changes up to 96a8479804e3f7af43e639e9df39f562f1a75fd5:
> > > 
> > >   thunderbolt: Do not RPM complete unrelated subtrees on unplug (2026-10-05 13:31:20 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > thunderbolt: Fix for v7.3-rc7
> > > 
> > > This incluces a single fix to make the runtime PM completion complete
> > > devices that are actually part of the domain. Needed for firmware
> > > connection manager based systems.
> > > 
> > > This has been in linux-next for few days with no reported issues.
> > 
> > Is this a regression or a "new" bugfix?
> 
> It's a new bugfix. It can go to next too if you think it is too late for
> the -rc.

Yeah, it's a bit late, I've taken this for -rc1, thanks.

greg k-h
