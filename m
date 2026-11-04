Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787983;
	b=qOpY8g/UT61LCBDTHNoOgYH3CsBsFD0s/nhWYe3ioOZ3kW1iqPsNbPV5ydAhDDrMsBjC
	 d30cTbfkIY0LeuCgt7o3F9vqbboFyGERJjnMD/ZxdhcY4ICXT134pui4K2ThYvRHmU438
	 6qEnP3i+tHEnD0TIDLkwK5DhCemAs0WvEJ5Elxju6hXizy8PYiH6/9u3COrgd+YBMjyHh
	 kkz4t5ljSoItyCAgJLwWpoXHBV7vxag740FHGS32CuXHTWYjIRzthZKl0FyHH2Igelsid
	 iIS8zsdOnfKMVrKljMt9/YOhZGXsF+NvDsxLWCDy/q7UXqjBl5E9QIaeoqKT1zpQb8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787983;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Va8WcfmPKt8pnEE/84ALLfThwAWUQvCummgZ7+O/2eU=;
	b=AYlBcqwnDn91B6fVLr85fejNbOzmnqK6dSwPT8L8ngCLEUkDdpVVTaRO/NZiOMRFM95M
	 iJgH2fW6xaYsxFJVqvh6gqzHstE5dia84mB927rrznTJQ4p4/VwnSCWF6WmISTgYoii84
	 2odBNRzfuEA/bAe631c9Op8UM30OFY1b8TGgiTwhO93ah3TneacHfb1o8wM6plcK/xy7C
	 MdWLw0cHyPNZrSZnYCAM7VXlG4744UhUTV3RvWcGOTK1mCXWTd/MsZfbRYSRGKpjSKKmg
	 sN/6ADvva45PZSeqW/rESHCfecPQl485Elw1fg1EXfaukBSkqwUJ4Rv0Xr7C1NltxUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=njYXusLE;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E5606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93E5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=njYXusLE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793787983; x=1825323983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c4RVmcwFoz2DEclj9/DTujKMxc2+REOPArEukpzgjrc=;
  b=njYXusLEzRHM5qE3FV0YLgbNosWeyqYdxHBpG3jrIUABr+UUTSpaGGdA
   mTre39Jwa7nd8Ivkpe90e4d5voBqOfjtwSyWpji3E08DD++dvoCTgWJYU
   gv13ZWk8xoHuXFHWY13L2HLq84LkcFEoSJLOqD0/ZH9d7U/I0ZAEP7kPW
   64Zfl2hNqPgZMBy7QaQ24oFpEFxd5JzYFkFk7QrbQKXGpFauXjYUm9AR3
   votrKuegs0hN/gYp+4NHslmkCQ86G1kw5rNIPP0NNixaRxCewGnQRl4hL
   tZnDOgmG8KZpoITyJ6UspsNghFlrgCgquJWsL5xfe9Rp+1x7g8igsiCby
   g==;
X-CSE-ConnectionGUID: Gx2FRyk0T2Oe7QQ/s430kg==
X-CSE-MsgGUID: lTz6G+w1S8iCV1YeIzm6XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2571958"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2571958"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:26:22 -0800
X-CSE-ConnectionGUID: 1PE0ZeNMSV+J0BSDMpwVxg==
X-CSE-MsgGUID: yVrEcShdSsi4moS1flYlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6786740"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2026 02:26:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id AEB1F99; Wed, 04 Nov 2026 11:26:19 +0100 (CET)
Date: Wed, 4 Nov 2026 11:26:19 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rodolfo Semprevivo <rodolfo@semprevivo.ch>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
	intel-xe@lists.freedesktop.org
Subject: Re: Panther Lake UCSI: PPM =?utf-8?Q?force?=
 =?utf-8?Q?s_DP_alt_mode_pin_assignment_D_=282_lanes=29_for_C=2FE-only_par?=
 =?utf-8?Q?tner=2C_no_4K60_=28was=3A_=5BBUG=5D_Type-C_Subsystem_xHCI_=2880?=
 =?utf-8?Q?86=3Ae331=2C_Panther_Lake=29_=E2=80=94_repeate?= =?utf-8?Q?d?= err
 -71 / port reset failures under sustained DP+HID load)
Message-ID: <ausISwWb3qeTkSDh@black.igk.intel.com>
References: <ef5ba6ff-ed50-4bb6-ae6d-fb11f0a47954@semprevivo.ch>
 <91bd4409-8121-4919-8556-8b49ec8f9304@semprevivo.ch>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91bd4409-8121-4919-8556-8b49ec8f9304@semprevivo.ch>

On Fri, Oct 23, 2026 at 10:27:32PM +0200, Rodolfo Semprevivo wrote:
> Hi,
> 
> follow-up to my report below, with a corrected analysis. The xHCI was
> the wrong suspect: the -71 errors come from the monitor's internal USB
> 2.0 hub, which sits on the standalone xHCI (8086:e37d, 00:14.0), not on
> 8086:e331. They only appear because the monitor resets when the DP link
> fails.
> 
> Root cause: on the left TB4 port the PPM/EC configures DP alt mode with
> pin assignment D (2 lanes), although the monitor only advertises C and E:
> 
>   port0-partner.0: svid ff01, active yes, vdo 0x00140045
>   displayport/pin_assignment: C E   (nothing selected)
>   displayport/configuration: [USB] sink
>   xe: Port D/TC#1: TC port mode reset (disconnected -> dp-alt) pin
> assignment: D max lanes: 2
>   xe: [LTTPR 1] Link Training passed at link rate = 540000, lane count = 2
> 
> 2x HBR2 is not enough for 3840x2160@60 (594 MHz), so the picture drops
> regardless of bpc/HDR. Lower resolutions at 60 Hz work. This also
> explains why the dGPU route via the MUX failed identically: the lane
> split is decided by the firmware, not by the GPU driver.
> 
> For comparison, an Alder Lake ASUS GU603ZW on the same kernel, with the
> same monitor and cable:
> 
>   i915: Port D/TC#1: ... pin assignment: C max lanes: 4
>   i915: Link Training passed at link rate = 540000, lane count = 4
> 
> and 4K60 is stable.
> 
> Linux cannot correct this. Writes to pin_assignment/configuration fail
> with EOPNOTSUPP:
> 
>   typec_displayport port0-partner.0: firmware doesn't support alternate mode
> overriding
>   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
> 
> So this looks like a firmware issue (reported to ASUS as well).
> Questions:
> 1. Is the PPM choosing pin assignment D for a partner that does not
>    advertise D a known issue on Panther Lake?

I have not heard of this particular problem before.

> 2. Should Linux warn about it (partner VDO lacks D but FIA reports D),
>    or avoid the resulting 2-lane DSC mode?

You tell me. If you think that this would be useful, prepare the patch
for it.

> System: ASUS ROG Zephyrus G16 GU606AX (Panther Lake, Core Ultra 9 386H),
> BIOS GU606AX.304, kernel 7.3.0-4 (CachyOS), monitor ASUS ProArt
> PA169CDV. Bug report: https://paste.cachyos.org/p/83e1bcf.log
> Full drm.debug log available on request.

Thanks,

-- 
heikki
