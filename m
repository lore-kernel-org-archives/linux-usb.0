Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223135;
	b=G3rCuBgNZCQ2BXY1k5aJ477PUMAJaZ34rdUMxk6dlRRob4QJQb8wsfZcV7wSJWkExHkI
	 oZVf9Z/PK/9GnJGil6Xn8tyKsk0VbM18aaNGh8RhJ17yzZJpsvNy3Lu+0DYC+KeoP6oyw
	 UUfJtgJazn4v72THkr0J8VgpFOat7NM7ZlsjPAhKW7nwb9mmW1Z9Cw6n5TouoIQodnu2O
	 WCVLaX4WBRKphiEMO1Vs00/VHIv6I39Rk/9Tco3dBxPbtbHWaP6QXsem8sh/o9EZ498ge
	 bdThOFOn/bgDq8eMxRFaUrGIhFPZXZ2+fk6i1jGCKmMhOCNHUZazdK3EAB4wp0CqA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ik55Tpqh0TLiUJdm79qyE6BYf83xXC76bMLUlLzVu9E=;
	b=cg1I6RjfWch3RIM4Cj72lXSwPzXF2nIVlUeIAXYdPSU2Z6V+I6LPOVYAePa4UMHKR2ZF
	 KfiTmKGETX1DdLIXcMnR9bcRWpDeClhEGRLXhI44w229LwLmifJJj2ndaA/vvXU7XRRfu
	 zoWjBuNAzKnxrLuZCdlHyyvJ/9wqTarFjfnqAVCrGXcjWFgmmjXB36zB5ziiJeR11baSn
	 h1Wsbh5uegwU08oFkRWSnifhZQEQ4VlG6rT1gQb3Wabqy203fNnqEvlxaNJ0jR7nrvwj9
	 vZTylddy3A5+HwXf1wnOb7LIi0ghXoOEJZnidUAigYJX6ANx0PF1WhxnZfwrXzo8/1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JiK+Aoh0;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0790606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 11:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0790606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JiK+Aoh0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794223135; x=1825759135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+xf///UKyUpIZRkdcwN3cyx7wtKuEDFLlr6ibFoodmY=;
  b=JiK+Aoh03JNUlJjyCjp+BTXB3cj2yKE5nwwYtN/mfE5KeFZqT8GGtxaG
   VMxeerrXkRpMCEdsWQQ/enla1fvSgXY4T/npmg30siRjFAOvYM0MAnQJJ
   cif3MS9nNsmo39vZko2FGX0ZCeTgOnXwoAM6TZqWKUDu3jf16rN4x/akw
   ovp6yo9lPBMueE0ICkXkAIgSH35h2ceRDAl8qrhe+1vkYoXHlhubtn089
   5A6NFcFJzlsrB5kuL8zyrIBVFgv3Qp99Y97U76vrXtNHBudIptMhrUgPH
   B63EvALPskUPH46zQchDvzEYONAznoRlBaDyoNmKbGn7wxFUxVPdVyyPr
   Q==;
X-CSE-ConnectionGUID: lNBEzQC8TjSB71kncuHv3w==
X-CSE-MsgGUID: Cr+7kXLBQImzSCGr5UtPRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2810497"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2810497"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:18:55 -0800
X-CSE-ConnectionGUID: 6oTUGdenS+epyIgk7hnHDg==
X-CSE-MsgGUID: JsC/N+e2S96HE/Qjy9YyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7697774"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2026 03:18:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 18E7199; Mon, 09 Nov 2026 12:18:52 +0100 (CET)
Date: Mon, 9 Nov 2026 12:18:52 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: James Taylor <jrtaylor11@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
Message-ID: <20261109111852.GQ176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1794143745.17311.hermes@gmail.com>

Hi,

On Sun, Nov 08, 2026 at 01:15:45PM +0000, James Taylor wrote:
> Hi,
> 
> (Resend as plain text. The first copy was rejected by the list for HTML.
> Mika, apologies for the duplicate.)
> 
> I'm reporting a link-speed problem on an AMD Phoenix USB4 host with a
> Thunderbolt 5 (Barlow Ridge) device. I think the register data points at
> host firmware, and I'd like to know whether the connection manager has any
> supported way to influence it.
> 
> Setup
> - Host: Minisforum UM890 Pro (AMD Ryzen 9 8945HS / Phoenix, "Pink Sardine"
>   USB4 NHI 1022:1668/1669), BIOS 1.06, AGESA PhoenixPI-FP8-FP7 1.2.0.0a
> - Device: Minisforum DEG2 eGPU dock, Intel JHL9480 (8086:5786), NVM 62.42,
>   vendor 0x41f device 0xd002
> - Cable: StarTech TBLT5MM50CM240W (0.5 m, TB5). One retimer is enumerated:
>   1-0:2.1 vendor=0x7fea device=0x1032
> - Kernel: 7.2.15, software CM, thunderbolt.host_reset=0 (also tested
>   host_reset=1: same result)
> 
> Symptom
> The link always comes up 2 x Gen2 (rx/tx 10.0 Gb/s, 2 lanes),
> usb4_port2/link = "tbt". It's deterministic across replug, host_reset and
> reboots. A USB4 v1 device (ASM2464PD enclosure) on the same host port, with
> a different cable, trains Gen3 x2.
> 
> Registers (debugfs)
> Host 1-0 port2:
>   LANE_ADP_CS_0 = 0x003c01c0   (supported Gen2|Gen3)
>   LANE_ADP_CS_1 = 0x4828003c   (target Gen3, current Gen2, width 2)
>   PORT_CS_18    = 0x00002f00   (TCM set)
>   SB 0x0c LINK_CONF = 03 d3 03
> Device 1-2 port1:
>   LANE_ADP_CS_0 = 0x0cfe01c0   (supported Gen2|Gen3|Gen4)
>   LANE_ADP_CS_1 = 0x4828003e   (target Gen4, current Gen2)
>   PORT_CS_18    = 0x00902f01   (TCM set)
>   SB 0x0c LINK_CONF = 03 f3 1b
> 
> The two LINK_CONF values differ in bit 13. If I map the fields in the USB4
> order (enabling decisions, rsvd, enabling requests, rsvd, bonding, Gen3
> support, RS-FEC Gen2/Gen3, SB channel support, TBT3 speeds, Gen4, asym...),
> the host advertises Gen3 Support = 0 and the device advertises Gen3
> Support = 1. I took the field positions from a protocol-analyser field list
> rather than the spec text, so please correct me if the layout is wrong.
> Under that reading, the host's link characteristics exclude Gen3 even though
> its lane adapter supports and targets Gen3, which would explain Gen2.
> 
> Experiment
> With a thunderbolt.ko built with CONFIG_USB4_DEBUGFS_WRITE:
> - Writing "0x0c 0x03 0xf3 0x03" to 1-0/port2/sb_regs fails with -EIO, and
>   the value is unchanged. So the host router appears to own this register
>   (set by platform/PD firmware).
> - Toggling LANE_ADP_CS_1.LD on 1-0 port2 dropped the link. It did not
>   re-establish when LD was cleared, and recovered only after reloading the
>   driver with host_reset=1. Possibly worth handling separately.
> 
> Questions
> 1. Is my reading of SB LINK_CONF correct, i.e. is the host-side Gen3
>    Support bit what limits this link?
> 2. On AMD USB4 hosts, is there a CM-visible way (router operation, port
>    config, or reset sequence) to make the host re-evaluate Gen3 support, or
>    is this purely platform PD/USB4 firmware (cable/partner VDO handling with
>    TB5 cables)?
> 3. Is this a known issue with Phoenix/Hawk Point hosts and USB4 v2 / TB5
>    devices or cables? (Bugzilla 221822 and 221319 look related but describe
>    different symptoms.)
> 
> I can provide full debugfs dumps, dmesg with thunderbolt.dyndbg, or test
> patches.

Please use tbdump from tbtools [1]. It knows the registers. Something like
this:

https://github.com/intel/tbtools/wiki/Useful-Commands#dump-lane-adapter-capability-for-current-link-capabilities-and-status

Also please provide full dmesg with dynamic debugging enabled.

[1] https://github.com/intel/tbtools
