Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A19302146
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 04:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619933; cv=none; b=J2VbmU/Dj4sOvoItSXmgCKskV0/Jki35n/ZFMyB++6BecqzuzRP8E0yRK0C1Q98DlbpIMphybIsAetZheMe6Rm/uJlUYSf7zFBv0sdNecbSf2CXY7BpwOkSTsdj9WeGdq+t3cnhRB9B4dY0jyZ5F+913gMbhQ9CtUCNRfOQvN7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619933; c=relaxed/simple;
	bh=X1Maw6YHizyaphGc8hhi5NqlmVrz09GMX62AC3dhNKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNeLPLGMrvAkepVHkvLcZJAt9bqofpyU0BpbHKjy/DzUVIhBB8rzp/3UKjbX3D/pmqnxHoNdTQsLBKKMN3B2rZCkPxaq47mYLEjJiy2A6c6SD5zHnn5CMQi0AqGmDhAYUlMgWnjeaV4PNKRfkIWU+j5IgVx9eSMnfgDgVPaCe+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpnQ4dkj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpnQ4dkj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789619930; x=1821155930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X1Maw6YHizyaphGc8hhi5NqlmVrz09GMX62AC3dhNKE=;
  b=BpnQ4dkjgzbvfnY1NLSMviATASj95ZLR2vdxId08AMINUYd/2zXBGC8c
   OAv2sm8K3lDMxCXrq/ZQj06lATw+Ea865X/Nmu52/MrsBpa0cLIkA8oVp
   xALj2DsWo7VgsxbOoLHZuUs+9Ki7moPWvmEKx+b5cFv3NSdo3zSCQqztf
   kkA2SJnnbh1nFhHW9pcRasIhOQE2flcOLqSkGP//Lr2x4Jkw6DrjhkyI9
   Qzxhnbw6xtQC6QYcs7UVKL0pNLho2wSgNPx4NOWMOn4dKCNK5EoMSTxe3
   WGPoN6SLaNaVJc1hdqWi7rqylAUqeU9xFFY2vnWiaTWp96bzQdawDPrF8
   A==;
X-CSE-ConnectionGUID: hPVRSIiGRFyB89U1edMk7g==
X-CSE-MsgGUID: cKlQu6X4QPm848rfUIblSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88938147"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88938147"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 21:38:50 -0700
X-CSE-ConnectionGUID: faR24b6NTH2vNMu+uFhbPg==
X-CSE-MsgGUID: 3W/G9eYoQ0OuWDjWqMk6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1957576"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 16 Sep 2026 21:38:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 653C499; Thu, 17 Sep 2026 06:38:47 +0200 (CEST)
Date: Thu, 17 Sep 2026 06:38:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ben <benstaples10@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260917043847.GV106095@black.igk.intel.com>
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
 <20260915041958.GE106095@black.igk.intel.com>
 <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com>
 <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com>
 <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
 <20260916075135.GN106095@black.igk.intel.com>
 <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>

Hi,

On Wed, Sep 16, 2026 at 10:18:59PM -0400, Ben wrote:
> Mika,
> 
> The TCM bit is set.
> I have tried two cables. The cablematters premium 40gbps thunderbolt 4
> cable as well as the apple thunderbolt 5 pro cable. Both the 1m
> version. I believe they should be passive.
> 
> > 0x00a2 0x00003701 0b00000000 00000000 00110111 00000001 ..7. PORT_CS_18
> >   [00:07]        0x1 Cable USB4 Version

This tells that the cable does not support USB4 (should be 0x10)

> >   [08:08]        0x1 Bonding Enabled (BE)
> >   [09:09]        0x1 TBT3-Compatible Mode (TCM)

and because of that the link goes into TB3 mode.

Which is really interesting if you say that these are actual TB4+ cables.
Especially the Apple one should definitely be supporting USB4.

> >   [10:10]        0x1 CLx Protocol Support (CPS)
> >   [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
> >   [12:12]        0x1 RS-FEC Enabled (Gen 3) (RE3)
> >   [13:13]        0x1 Router Detected (RD)
> >   [16:16]        0x0 Wake on Connect Status
> >   [17:17]        0x0 Wake on Disconnect Status
> >   [18:18]        0x0 Wake on USB4 Wake Status
> >   [19:19]        0x0 Wake on Inter-Domain Status
> >   [20:20]        0x0 Cable Gen 3 Support (CG3)
> >   [21:21]        0x0 Cable Gen 4 Support (CG4)
> >   [22:22]        0x0 Cable Asymmetric Support (CSA)
> >   [23:23]        0x0 Cable CLx Support (CSC)
> >   [24:24]        0x0 AsymmetricTransitionInProgress (TIP)
> 
> 
> On the options, noted. I will keep them as standard as possible.
> 
>  And yes, this is a PCIe add-in card. I poked around my BIOS a bit and
> was not able to get it to be recognized on boot. All boot provided to
> you were performed with these options set:
> 
> > USB4 (ASM4242 Controller) Support Disabled (mutually exclusive with Thunderbolt Setting)
> > Thunderbolt/USB4 (Intel JHL8540 controller) Support: Enabled
> > Thunderbolt/USB4 (Intel JHL8540 controller) Security Level: No Security
> > Thunderbolt/USB4 (Intel JHL8540 controller) MMIO Resource: Full Size
> > Thunderbolt/USB4 (Intel JHL8540 controller) Wake Up Command: GO2SX

Okay this tells that it actually has support. However, the BIOS itself
might not support the PCIe resource allocation (well that's pretty much
proven already since you booted with the device connected). For your cases
it should be enough though because the BIOS seems to allocate the minimum
and if you are not planning to expand the chain afterwards with more
devices the one on the dock should be working okay (even the xHCI when the
link is TB3). When the link is USB4 you get the same devices through the
USB3 tunnel and PCIe is not even needed because it just contains PCIe
switch that has nothing behind it.

> I also have IOMMU enabled.

Yes that's expected and should be enabled.
