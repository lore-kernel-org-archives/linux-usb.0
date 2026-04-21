Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A044226ACC
	for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 04:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776746748; cv=none; b=fZ4599DjJNexSDNjMMRdaNGRy4F21oSQIgRRqWZ3fED7cnMmqBHgyQ8hTB73ojAmudEFxSmaVtLQlC3gGazDY0Wd0hm1O28U9z+N3wbkUidOrYQCF4f4IdBB0yhRw31TTAtKfef66W7W0wnXbqNRT5Q2TAEaNOu1gPMbN3DO6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776746748; c=relaxed/simple;
	bh=IHKDrg7cPuZh6SeYBWJF66K4+eswB/V3HUJn5K628HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDDOoN3RtyFFLC4gmbQIuziCEdG9hHxxKHu8F86OPETerMDKd4PwJCHT5lVx7N1T7zBEy+SbvseGMXsxrovfttT2rmKqXH5+lAGG3mI9UKoeEXIcrJi5qaaIfo+bO9Zy5ceMCTUGWt021eTQuKJ+1lAUkT1fiC9hMKMivpcMrZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC89sHcy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC89sHcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776746747; x=1808282747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IHKDrg7cPuZh6SeYBWJF66K4+eswB/V3HUJn5K628HI=;
  b=jC89sHcysYigkYYsGrgEms47K27hbgUUrgoMIe2KBvM76bIsMETo5cZZ
   l5Q/7rlznf5jofbDTtcxURYI8fY2OlXggXlPwzYBO7ug4vDM63d0Y/wB1
   TmKWHvwJtihklMLAE7x8sanFBL+Mjag26Dua1W/1wWVnHp3E7q78R8r+G
   Fh/ZZgbg5uGTuXyGN8aXBa6LBpAa8ohkTXNWPlKqdHpkwca6t6HHoL6gw
   Zal3tYBfNuN4xmbATsUzr0mAZIlTgWcL/ykehggPRvlTGVete+LoTYhA5
   oZELZuWbzlhqXrOruRmfHifnjQEfGnssrkoF84hc/Ki+AmbBxv6pK4nKV
   g==;
X-CSE-ConnectionGUID: jRqIVUkISIS0zrnislgAsw==
X-CSE-MsgGUID: 1QxREO8QRhyaeP1tO5VmQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80261109"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="80261109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 21:45:46 -0700
X-CSE-ConnectionGUID: 3g8bq7RqTVKDJg9YslSzuA==
X-CSE-MsgGUID: bK4x4j0MSs2VtqWS1JJTFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="228761144"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 21:45:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EAC2295; Tue, 21 Apr 2026 06:45:42 +0200 (CEST)
Date: Tue, 21 Apr 2026 06:45:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francesco Orro <ncesco@interstellar.eu>,
	intel-gfx@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Uma Shankar <uma.shankar@intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: DP routing from iGPU to discrete Barlow Ridge TB5 on HP ZBook
 Fury G1i
Message-ID: <20260421044542.GA557136@black.igk.intel.com>
References: <pCmilDgt3Xijjdzu7H1d30dzm8IJbXFnle3yQ5nSR1Pj-snchn5xNpcq9Gb7hlh5bnsA3Efnm9cOR_VKi9RyxcRJxHlrqTW7WRPG36UgY5Q=@interstellar.eu>
 <aeaQ3Vlh6bp8-rwW@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeaQ3Vlh6bp8-rwW@intel.com>

On Mon, Apr 20, 2026 at 04:47:25PM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 20, 2026 at 04:04:02PM +0000, Francesco Orro wrote:
> > Hi,
> > 
> > Setup:
> >   HP ZBook Fury G1i 16 inch, BIOS X96 01.03.04
> >   Intel Arrow Lake-HX + Nvidia RTX PRO 1000 Blackwell (hybrid graphics)
> >   Kernel 6.19.13
> > 
> > The laptop exposes Thunderbolt 5 on both the integrated MTL iTBT (right
> > USB-C, domain0, 00:0d.2) and a discrete Intel Barlow Ridge (left USB-C,
> > domain1, 00:06.1 -> 05:00.0).
> > 
> > - Right port: i915 drives a DP tunnel over the iTBT host without issues.
> > - Left port: no i915 connector ever sees the external monitor. The TB
> >   driver allocates a DP tunnel on demand but DPRX reads time out, no DP
> >   source is feeding the Barlow DP_IN adapter.
> > - With nvidia-drm.modeset=1, a DP-MST connector on the Nvidia DRM device
> >   sees the monitor via the left port (EDID readable, modes negotiated).
> >   The path Nvidia -> Barlow DP_IN is functional.
> > 
> > Current hypothesis: on this board the discrete Barlow Ridge DP_IN is
> > either hardwired to a Nvidia output or behind a firmware-programmed mux
> > that BIOS latches to Nvidia at POST and is not exposed to the OS. i915
> > would therefore have no path to drive the left ports, by design.
> 
> yes, that is usually the case.
> 
> > 
> > Tests done that did not surface an OS-visible lever:
> > - i2cdetect across all SMBus/i801 busses: no DP mux/retimer at plausible
> >   addresses (0x60-0x7F).
> > - DSDT/SSDT dump (iasl -d): no Device/Method referring to DP routing,
> >   DPMUX, retimer programming, or dock display source selection.
> > - HP WMI + /sys/devices/virtual/firmware-attributes/hp-bioscfg attribute
> >   enumeration: nothing switching dock display source. "Graphics"
> >   attribute only offers Hybrid/Discrete.
> > - PCI config dump of Barlow Ridge: standard USB4 NHI, no vendor-specific
> >   capability hinting at source selection.
> > - acpi.no_usb4_osc kernel param (locally patched) to opt out of OSC USB4
> >   native support: no change in i915 visibility of the dock.
> > 
> > Is there any known way to route an Intel DDI output to a PCIe-attached
> > Barlow Ridge DP_IN adapter, or is this strictly a design where the dGPU
> > is the only valid DP source for the discrete TB controller on this class
> > of HP workstations?
> 
> I believe this is physically connected or static mux without any way to
> re-route this. But I might be wrong.
> 

This is my understanding too based on the systems I've seen.
