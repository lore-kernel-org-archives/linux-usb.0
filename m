Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F403FCB2C
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 11:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152265; cv=none; b=DHzvml8VcFEEGgAHmgsIXWcQqHzAmqL7qPIL8VoJ7+8fJ/XEUMf9jd6eGcSYqllhKvgyc1ObEbAeRCBff/tLyiz+mge5LHfCRH+LbiHIBGu7eFJzFsxnzQJWdjUNDHMDmB/9KXi9/sOY4WkRvMUJE/pc5IeMGKfUX2ipl2M8aiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152265; c=relaxed/simple;
	bh=g9WnuEVSVq/V5F+jxzOJuuAmriivGqmrMhhXTkHsPSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KspVsQpEfIJooK5ISYz5TsCxycBLQM8cLQr73SjDsHM6wyW03M4SU5S51e4UCCdx+tYhZWWtqScLssM0nMtTX+sx2kPOoPwX6ShucMnd5hXNE6l8dYOSH4c2cN3ALluMHDmrrL/iIyUBr01J5UWl9qViCgHnf0Ofpk7s73hSuIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5REJylB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5REJylB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785152263; x=1816688263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g9WnuEVSVq/V5F+jxzOJuuAmriivGqmrMhhXTkHsPSo=;
  b=S5REJylB+qdaFm4nckCZHkmoi521eZX51kxsd6HFrOweLayKORxIGfyR
   MYKQ+Xx5ivtkxSt4Gp5dtJeQDpotBOPSs669uZmGg49EFLuEmD4FYVnCw
   LRRkLR/XmzAL0isTkzjUcRdgLJ78XO02SV88g6HugHtDtaj2AgU759Kyq
   0ha4vPKyZhLDftJmt41/R9kunbGE5kTcimW3CksvCKtDH2rVaLRzrsTRu
   e8Zw73cV0lcczsn+imDrILJFBXVPcDQhnL8I3WW9BxcWIVPl+UDXcyjmA
   Rv6ihxzvrGT5ubwADo8fDW0Uf4bDPwpyY6JSEeONq2K7GZ4rJB8bdKtwO
   Q==;
X-CSE-ConnectionGUID: zQ/DZ4n6RvWr8RChc+KEjg==
X-CSE-MsgGUID: ddj8mQYCRUCF5sAtSJi0tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="103258779"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="103258779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:37:42 -0700
X-CSE-ConnectionGUID: oKaNwrEkSZSG2tUImdWy2w==
X-CSE-MsgGUID: vSC+a1OtQeCkfVfRiWkfhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="260031252"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 27 Jul 2026 04:37:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 569CB99; Mon, 27 Jul 2026 13:37:40 +0200 (CEST)
Date: Mon, 27 Jul 2026 13:37:40 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: stefan.walcz@walcz.de
Cc: linux-usb@vger.kernel.org, superm1@kernel.org
Subject: Re: ucsi_acpi PPM init =?utf-8?Q?-ETIMEDOU?=
 =?utf-8?Q?T_on_AMD_Strix_Halo_=28Ryzen_AI_Max+_395=29_?= =?utf-8?B?4oCU?=
 USB4 Type-C dead; UCSI SSDT looks stale (INTL 20220331)
Message-ID: <amdDBPo-XBMEFrQo@black.igk.intel.com>
References: <1114d248-3520-428f-b576-8c7ee9e75ceb@Spark>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1114d248-3520-428f-b576-8c7ee9e75ceb@Spark>

Hi,

On Thu, Jul 23, 2026 at 09:57:40AM +0200, stefan.walcz@walcz.de wrote:
> Hi,
> 
> On an AMD "Strix Halo" (Ryzen AI Max+ 395) mini-PC, the USB4 host side initialises correctly, but the UCSI (USB Type-C System Interface) layer never comes up, so no USB4/Type-C peripheral is ever detected under Linux (USB4 NVMe enclosures, eGPUs, TB4 docks). Standard USB 2.0/3.x on the same physical ports works, and the same USB4 dock works flawlessly on macOS — so this is isolated to the UCSI/PPM software path. I'd appreciate guidance on whether this is a known Strix Halo AGESA/PMFW issue and whether a kernel-side quirk is warranted.
> 
> ## System under test
> - Product: GEEKOM A9 Mega
> - Processor: AMD Ryzen AI Max+ 395 (Radeon 8060S)
> - BIOS: 0.13 (build 03/03/2026) EC: 0.16
> - AGESA: StrixHaloPI-FP11 1.0.0.2 PSP BL: 0.40.0.64 SMU: 10.100.06.00 MP2: 0B.00.00.2F
> - OS: Ubuntu 24.04 LTS Kernel: 6.18.6-061806-generic (Ubuntu mainline)
> - Peripheral: GRAUGEAR G-M2DK-U4-40G (USB4 40 Gbps NVMe dock, controller ASMedia ASM2464PD)
> 
> ## Symptom
> On every plug-in of the dock to either USB4 Type-C port:
> - No PD negotiation response; the dock is unpowered (LED dark, fan never spins).
> - Linux registers no plug events: nothing in dmesg, no entries in /sys/class/typec/, `boltctl monitor` and `udevadm monitor` capture nothing.
> - Standard USB 2.0 / USB 3.2 Gen2 devices on the same physical port work normally.
> - The same dock + same cable powers up instantly on an Apple Silicon Mac and reaches full PCIe Gen4 x4 — so the dock and cable are healthy.
> 
> ## The USB4 host controllers are fine
> $ ls /sys/bus/thunderbolt/devices/
> 0-0 1-0 domain0 domain1
> 
> $ boltctl domains
> ● domain0 security: iommu+user
> ● domain1 security: iommu+user
> 
> $ sudo dmesg | grep USB4
> ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
> ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
> 
> Both USB4 domains register with security iommu+user; the Thunderbolt module loads. The peripheral side is never triggered because Type-C plug detection never reaches Linux → points at UCSI/PPM.
> 
> ## UCSI fails, distinctly, in BOTH BIOS UCSI modes
> Mode "At MMIO" (UCSI Support -> Enabled -> At MMIO): ucsi_acpi binds to USBC000:00 but the PPM reset never completes — times out after ~5.4 s:
> 
> [ 0.003739] ACPI: SSDT 0x70320000 0014E4 (v02 AMD CPMUCSI 00000001 INTL 20220331)
> [ 1.897156] WARNING: ucsi_reset_ppm+0x1a7/0x1c0 [typec_ucsi]
> [ 7.327857] WARNING: ucsi_reset_ppm+0x1a7/0x1c0 [typec_ucsi]
> [ 7.350046] ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
> 
> Reproduced across multiple cold boots and after a 60 s hard power drain (mains off, power button held) — fully deterministic, not a transient PSP soft-state.
> 
> Mode "At EC RAM": ucsi_acpi is loaded but never binds to USBC000:00 — no init attempt, no error, no /sys/class/typec/ entries:
> 
> $ lsmod | grep -iE "ucsi|typec"
> ucsi_acpi 12288 0
> typec_ucsi 69632 1 ucsi_acpi
> typec 118784 1 typec_ucsi
> 
> $ ls /sys/class/typec/
> (empty)
> 
> $ cat /sys/bus/acpi/devices/USBC000:00/modalias
> acpi:USBC000:PNP0CA0:
> 
> $ readlink /sys/bus/acpi/devices/USBC000:00/driver
> (no driver bound)
> 
> The ACPI device USBC000:00 (HID PNP0CA0) is present, but ucsi_acpi does not claim it — as if the EC-RAM operations region the SBIOS exposes doesn't match what mainline expects, or the _DSM/_CRS descriptor doesn't advertise the EC-RAM transport in a way the driver recognises.
> 
> ## Possibly-relevant ACPI clue
> [ 0.003718] ACPI: SSDT ... (v02 AMD CPMEC 00000001 INTL 20220331)
> [ 0.003739] ACPI: SSDT ... (v02 AMD CPMUCSI 00000001 INTL 20220331)
> 
> The CPMUCSI SSDT is dated 20220331 (31 March 2022) — earlier than the Strix Halo AGESA build. It looks like the UCSI ACPI methods were carried forward from an older platform reference and not refreshed for Strix Halo's PPM.
> 
> ## Behaviour summary
> - Disabled: no ACPI device exposed; Type-C stack absent; USB4 peripheral not detected.
> - Enabled/At MMIO: ucsi_acpi binds, PPM reset times out (-ETIMEDOUT); Type-C absent; not detected.
> - Enabled/At EC RAM: ucsi_acpi loaded but does not bind USBC000:00; Type-C absent; not detected.
> 
> ## Questions
> 1. Is a PPM-init -ETIMEDOUT on Strix Halo (AGESA StrixHaloPI-FP11 1.0.0.2) a known issue? AMD has published later StrixHaloPI-FP11 revisions (1.0.0.4, 1.1.0.0, 1.2.0.x) — do any carry UCSI/PPM fixes that would resolve the MMIO PPM timeout once an OEM integrates them?
> 2. For the "At EC RAM" mode: what does mainline ucsi_acpi require of the EC-RAM operations region / _DSM to bind, and does this SBIOS's descriptor diverge from it? Is a kernel quirk feasible?
> 3. Do other Strix Halo systems (Framework Desktop, HP Z2 Mini G1a, GMKtec EVO-X2, Beelink GTR9) bring up USBC000/CPMUCSI on the same kernel — i.e. is this OEM-SBIOS-specific or AGESA-wide?
> 
> ## I can provide
> Full `sudo dmesg` from cold boot under each BIOS setting, `acpidump`, `lspci -vvv` for both USB4 domains, and `modinfo` for ucsi_acpi/typec_ucsi. I can also test a beta/engineering BIOS on this exact unit and report back. (I have an active research collaboration with RPTU Kaiserslautern-Landau and am familiar with filing useful upstream bug reports.)
> 
> Full field report attached (with the macOS side-by-side and all captures).
> 
> Thanks,
> Stefan Walcz — Walcz Strategic Consulting, Mannheim, Germany
> 
> [Attachments beim Absenden anhängen: A9Mega_Linux_USB4_UCSI_Field_Report.pdf, Graugear G-M2DK-U4-40G datasheet]

Have you contacted AMD or whatever the manufacturer is for you product?

This looks like a firmware issue. When the UCSI driver is loaded, it
always sends the PPM_RESET command as the very first step.
That is an optional first step in the UCSI specification (see PPM
Initialisation), so for example Windows may never do that. But that
does not mean that the firmware (EC, or USB Power Delivery controller)
can fail the PPM_RESET. PPM_RESET is not an optional command, and the
system really needs to support it.

So please contact the manufacturer.

Br,

-- 
heikki
