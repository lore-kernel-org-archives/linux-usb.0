Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455754FDE50
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565737; cv=none; b=OMudfwoPDQMIX2JrJy6/QhHaPknmAqs1mgW5/ktfJKRsHIPD9cwwFJDxs8R3YxlUcXhz7M6iHovJXN3vaFEochnuTyJbKWtWuEghb4A22wKqZ+BoK25j3uYwghCfFp0YsQwkS5SmD3eap2mfGXt6JVIvPmZ9ARrWm2ak0h4iie0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565737; c=relaxed/simple;
	bh=fj/EATdwIgq34QHGqNjGnfNoNpswFV8WiGoD0rVwZZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CW0z/fYGMkQGL+41YmWRU6OxR4o8BzC6AfKysh+QvpMPE+oIPMqUPN4ewYoKtzf/iEFXcst+far4H+39D45qtfbvVL9fuB/0RZvqLD/4pyMy804CaiL8x9UEqnOB+/JU0bGf3otF42fy33h8ABbOSHrZQ8/pEWBCiAaL2iKgkrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBxUgyHi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBxUgyHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789565727; x=1821101727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fj/EATdwIgq34QHGqNjGnfNoNpswFV8WiGoD0rVwZZM=;
  b=nBxUgyHi42HltYr31m0YOHz+y5Y/mp3FiZBgYwNkj7mGJPmoiAgPXyGM
   FVnvv/mxHClilKLGU2P8+UTTCpTbgXDtmPTdny4GVN2TFMS7sJWNLppbF
   uza0MMWa+FyzWO05zs+RsueCI1sdJ/wbds6zsNgaTtkjvgDIsk1Zbo3Cj
   O2rsXFE1PtRBwTRdCS551gzyHJ5oYkZFjaGgU/zzofffaHpn8umaL7S3y
   +Rwo+UagsLOTp8peJyPzo1Ew8XLwPkjlLcbvG4Wp9jXXTf4hi542FyrSj
   cGOiwvKP9k1fytNH1Zjim675uTubzoSoIFMQo9gwQ4NHLj51VKsAtukKW
   w==;
X-CSE-ConnectionGUID: iLTYYihCS5GYhZjvx6Ly8g==
X-CSE-MsgGUID: QtqH1IIhTNW3JgTtNgbrZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89811011"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89811011"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 06:35:21 -0700
X-CSE-ConnectionGUID: dmBtqW31Rd+6lbkNMEVtqQ==
X-CSE-MsgGUID: x9tnBYiGTriEXf8Xm4iyIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="298410845"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 16 Sep 2026 06:35:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E5B309B; Wed, 16 Sep 2026 15:35:18 +0200 (CEST)
Date: Wed, 16 Sep 2026 15:35:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Nils Arnold <ns.arnold@web.de>, linux-usb@vger.kernel.org,
	Sanath.S@amd.com, Basavaraj.Natikar@amd.com, westeri@kernel.org
Subject: Re: AMD Strix Halo USB4: 20/40 Gbit/s negotiation with RJ45 and
 original host-reset patch regression
Message-ID: <20260916133518.GS106095@black.igk.intel.com>
References: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>
 <20260915124904.GK106095@black.igk.intel.com>
 <853b62e8-5b07-43d2-be93-bfbd95f55165@kernel.org>
 <20260916073839.GL106095@black.igk.intel.com>
 <70a3162e-aca7-44b0-9896-423dd8071838@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70a3162e-aca7-44b0-9896-423dd8071838@kernel.org>

On Wed, Sep 16, 2026 at 08:26:07AM -0500, Mario Limonciello wrote:
> On 9/16/26 02:38, Mika Westerberg wrote:
> > Hi,
> > 
> > On Tue, Sep 15, 2026 at 03:42:43PM -0500, Mario Limonciello wrote:
> > > On 9/15/26 07:49, Mika Westerberg wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Sep 15, 2026 at 01:21:39PM +0200, Nils Arnold wrote:
> > > > > Hello Sanath, Mario, Mika and Basavaraj,
> > > > > 
> > > > > I would like to add test evidence from two Strix Halo hosts to this
> > > > > USB4 reset discussion. My reset test used a backport of the ORIGINAL
> > > > > f1de1fc5f632 commit, not the newer deferred-reset implementation.
> > > > > I have not tested the revisions discussed on September 15.
> > > > 
> > > > Okay the last message on the thread I asked if we should revert the commit
> > > > for v7.3-rcX and then try to get the "better" fix into v7.4. At least what
> > > > I understood it seems to solve the issue without the deadlock and killing
> > > > the whole host interface underneath everybody else.
> > > 
> > > FWIW to Nils I left a note on that thread and agree with Mika.
> > > 
> > > > 
> > > > Once we have that patch, you can test and see if that helps in your case
> > > > too. Now that we know AMD guys can CC you when they submit it.
> > > 
> > > One thing I'd like to note though; I would rather that we keep out of tree
> > > modules out of the conversation on the kernel mailing list when it comes to
> > > upstream behavior.
> > > 
> > > There are multiple ways to do xdomain tunnels in the kernel, and we should
> > > collectively fixate our time and energy on bugs related to those instead of
> > > PoC out of tree drivers.
> > 
> > Fully agree. But the same behaviour is with the in-tree Thunderbolt
> > networking and stream (and maybe DMA test) drivers so those should at least
> > be working with the AMD controller without wedging.
> 
> Yes and no.  That out of tree driver might be configured as a module, but at
> least I haven't audited it.  It could be causing other problems too when it
> accesses certain symbols.

Yes agree this but I mean if the issue happens with the in-tree drivers we
should try to fix it the best way possible. And my understanding is that it
happens in your own validation too, right? This is the same AMD controller
wedge issue we are talking about where the fix was just reverted by you and
now you (AMD) are working on better one? Or I'm missing something :)
