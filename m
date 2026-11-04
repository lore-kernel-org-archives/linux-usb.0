Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791713;
	b=z/eop8mdyzHjBBpXD6PEagjYB6HGZFsuCYHs1ES+CyUmHdvs4yIkcV9Aq076+4x7nuMD
	 eDzlejwlaBT0li2HHneFM7vuW4Z8bahANCEziVOj3aEPRK4aW7gmyyFEtNmW80sWAULrh
	 Wqg8GrPMMaXUolGUKBo1l/8zbPCwyLLeigvENQeNKfsgM4Hx8JOFaLeyGWS4pWpkPGjLG
	 IKdC0mqRSKsjn1KYClQslQ68N1FPaX1ofHbv/vLTjM1lM2Hb6/G7FCcmPU1GyX40y2HR7
	 mSNaSRoVhRlzV9wArKIBVFJEOomhV0LBquNq0bVDRpJOPdHaMuQkTWPmAT1RJ8jHtWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791713;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kIbyUvDtnLMqbve8DiluicnubRuVOhXe65qXd6bLYsA=;
	b=quFlsiaUyGJQAzQib50fPsx+hmv1KJCdAFImYa34X2xSAsObNqlghxxSmqIoSDsNuiB8
	 ha+2QsQzQm85ZsNuVShbfIBYuUGCJAyOI4lA4GPHoaTC0tYQdBFvyQ8YCaLt1W2FSrWZm
	 +YY89qt1efyaILPulw95t0k7d6NR+NKwYmLog1Q0m1BiJhmE4Kwk4du50QfItFm3AZJ9h
	 K+jktSkOG5bHQxaPIjUFA9qA/KxRzJiIwd7JrlOXVFLsqfuryFCIpgQZYkoaV5CpXIhF3
	 D7WHYqsfRwqmTYsJ0sJUWaryTYbqzGF0Y0b/molQKm6Y+VBrL8NSrJtYYF6Y29a/7dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6cyv7V3;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E1606A32D
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 11:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4E1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g6cyv7V3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793791712; x=1825327712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkuwKvIAvmBQ5fzyeSRI9eII4YMrLnV1ftFInRodnoI=;
  b=g6cyv7V3z1H78ccKR+Gn5bGIEz5E2CjxkuCQA7ZiLKZ94U4AbKW0MCsQ
   UQCJ2a/kQcQ5+C1mPyp+5z8OzhZUb7uAHlTADPRiKOvbg/n3OWjTTtdjb
   PAhztqpPjWABxK+yZhwG5KhT1rrcXJZ4A/D5ZnrJpqtOHNZS6U7kQeyKD
   2wCU8hO1+Kt+I9pHm3vcSpmxJNex1hzRecn8IMzkb12kbjVykPpmcAUwM
   tDfjPhV/w1x36Ep2BILjjMwapVkGUDdFZR8qJ8ZAeyf5hluNv9e4Up8IL
   /GQiyVmv3uOM6xY6R8rHHTG6kzktYPAx9mMELfsRN5xXtSwTl9na56WsK
   w==;
X-CSE-ConnectionGUID: n8M8yMXRTgCyUNalsm6H7w==
X-CSE-MsgGUID: TND9EjuDSsq1UQ0cQmjoCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2576968"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2576968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 03:28:31 -0800
X-CSE-ConnectionGUID: kGuQ5pL+QBmCqtQLnMMESg==
X-CSE-MsgGUID: +80ksZYUTNaV0jPq9f2VZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7042089"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 04 Nov 2026 03:28:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0E21C99; Wed, 04 Nov 2026 12:28:29 +0100 (CET)
Date: Wed, 4 Nov 2026 12:28:29 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Tobias Wilken <tooangel@tooangel.de>
Cc: linux-usb@vger.kernel.org, Rodolfo Semprevivo <rodolfo@semprevivo.ch>
Subject: Re: [BUG] ucsi: HP OmniBook Ultra 14 (Panther Lake) negotiates DP
 pin assignment D, no altmodes registered
Message-ID: <ausW3d9W4wZEI49j@black.igk.intel.com>
References: <20261030164100.163449-1-tooangel@tooangel.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030164100.163449-1-tooangel@tooangel.de>

+Rodolfo - this looks similar to the same problem you are seeing.

On Fri, Oct 30, 2026 at 05:41:00PM +0100, Tobias Wilken wrote:
> Hi Heikki,
> 
> On an HP OmniBook Ultra 14 (Panther Lake), DisplayPort Alt Mode always
> ends up with pin assignment D (2 lanes) with my monitor, although the
> monitor is set to its 4-lane DP mode and its USB hub runs at USB 2.0
> only. No altmode devices get registered by ucsi, so I can't see what
> the partner advertises or try to select a different pin assignment.
> 
> This looks similar to a report on the ASUS Zephyrus G16 GU606AX (also
> Core Ultra 9 386H), where the firmware picks pin D even though the
> monitor only advertises C/E [1]. Two vendors with the same symptom
> might point to shared Panther Lake PD/EC firmware, but I can't verify
> that.
> 
> System:
>   HP OmniBook Ultra Laptop 14-kd0xxx (D5EJ3EA), BIOS F.06 06/25/2026
>   Intel Core Ultra 9 386H, xe driver
>   Debian 13, kernels 7.1.8 and 7.2.11 (same result on both)
>   ucsi_acpi + typec_ucsi; no ucsi messages in dmesg
> 
> Setup:
>   Dell U2722DE (USB-C upstream, fw M3T107, "USB-C Prioritization: High
>   Resolution", MST on) -> DP-out daisy chain -> 2x Dell U2515H,
>   all 2560x1440@60. Cable: Goobay 74202, USB 3.2 Gen 2, 100 W.
> 
> Observed (/sys/kernel/debug/dri/0/i915_display_info):
>   TC Port: mode: dp-alt, pin assignment: D, max lanes: 2
>   port_clock=810000, lane_count=2
> 
>   2x HBR3 is enough for only two of the three 1440p60 MST streams;
>   enabling the third fails with ENOSPC in the atomic commit.
> 
>   The monitor's USB hub enumerates at 480M, so as far as I can tell
>   the two lanes pin D keeps for USB 3 are unused:
>     Bus 003 Port 003: Dev 002, Class=Hub, Driver=hub/5p, 480M
>     ID 0bda:5483 Realtek Semiconductor Corp. 4-Port USB 2.0 Hub
> 
>   Same result on each of the three USB-C ports, on every boot and
>   replug I tried.
> 
> UCSI side (USB-C port2 = UCSI connector 3):
>   /sys/class/typec/port2 and port2-partner exist, but there are no
>   altmode devices for the port or the partner, no cable device and no
>   identity/ directory. port2-partner/supports_usb_power_delivery: no,
>   usb_power_delivery_revision: 0.0, usb_mode: [usb2].

Okay, so the PPM does not claim it supports alt mode details. The UCSI
specification allows that - it's an optional feature. The identity
information is also not available in the older UCSI versions.

The PPM reporting that there is no PD contract, even when there
obviously is, is a quite common problem, and is usually caused simply
by crappy PPM (so firmware) implementation.

>   Raw responses via ucsi debugfs (command -> response):
>     GET_CAPABILITY           0x6     0x01100200012000000000000300004044
>     GET_CONNECTOR_CAPABILITY 0x30007 0x00000000000000000000000000000201
>     GET_CONNECTOR_STATUS     0x30012 0x000000000000000100000000606d0000
>     GET_CURRENT_CAM          0x3000e all zero
>     GET_ALTERNATE_MODES, recipient connector, SOP and SOP',
>     offsets 0-3 -> all zero
> 
>   As I read them:
>   - GET_CAPABILITY: 3 connectors, bmOptionalFeatures = 0 (so no alt
>     mode details and no alt mode override), bNumAltModes = 0,
>     PD 2.0, Type-C 1.1.
>   - GET_CONNECTOR_CAPABILITY: DFP only, consumer, none of the
>     USB2/USB3/Alternate Mode operation mode bits set.
>   - GET_CONNECTOR_STATUS: connected, power direction consumer, power
>     operation mode Type-C 3.0 A rather than PD, partner flags USB +
>     Alternate Mode, connector partner type 3 (powered cable, no UFP
>     attached), although a monitor is attached.
>   With bmOptionalFeatures = 0, ucsi_register_altmodes() returns early
>   and the port gets no_mode_control, so as far as I can tell nothing
>   can be registered and the OS can't select a pin assignment.
> 
>   The PD view also looks incomplete: the UCSI power supply reports
>   5 V / 3 A, but under full CPU load (16 threads at ~3 GHz) the
>   battery stays at 100% and supplies only a short peak (18 W, down to
>   2 W within 20 s), so the monitor seems to deliver well above 15 W.
> 
> Monitor side (same monitor and cable on a desktop USB-C port without
> DP Alt Mode, so the monitor falls back to its Billboard device):
>   0bda:54bb "U2722DE", Billboard 1.21, SVID 0xff01,
>   dwAlternateModeVdo 0x000c0045
>   = UFP_D, HBR3, receptacle, UFP_D pin assignments C and D.
>   On that desktop the monitor's hub enumerates as a USB 3.0 hub at
>   5000M, so the cable and the hub can do USB 3.
> 
>   So the monitor does offer pin C. For comparison,
>   dp_altmode_configure() in drivers/usb/typec/altmodes/displayport.c
>   would pick C here unless the partner sets Multi-function Preferred
>   in its DP Status. I can't see the Status VDO on the laptop, but with
>   "High Resolution" the hub drops to USB 2.0 there, which suggests the
>   monitor doesn't prefer multi-function.
> 
> Questions:
>   1. The monitor offers C and D, and the platform firmware picks D.
>      Is that expected behaviour, or does it look like a firmware bug
>      to you?
>   2. If you have a contact at HP (or the team owning the Panther Lake
>      PD/EC firmware), could you pass this on? Preferring C/E when the
>      partner offers it, or exposing alt mode details and override via
>      UCSI so the OS can choose, would be the two options I see.
> 
> I'm happy to test patches or firmware and to provide more data
> (full debugfs dumps, ACPI tables).
> 
> [1] https://discuss.cachyos.org/t/panther-lake-asus-gu606ax-no-4k-60-over-tb4-usb-c-firmware-forces-dp-pin-assignment-d-2-lanes/38080

This is a firmware issue. Please report it to HP. There is nothing we
can do about this in the operating system.

I don't have any HP contacts unfortunately.

Thanks,

-- 
heikki
