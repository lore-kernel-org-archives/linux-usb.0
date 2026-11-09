Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202041;
	b=pCRJ42o7hsRp3Vo0+EDsjTbpMgd5m7vZvSh3ZvKLIHmHOYIJZ8JBDoVbuyxjSFgCiZeR
	 EU8TGO2PAKnusXBrV2EOsMhY1zYYsyEJ8Dn9z1iEeOChaa2bHvKSlJjhBKXW53OjnkRnt
	 ANmElVK0vf7875BFQzQduwwK1BTkDq4V8Sdt2dR86dZB1ZX8jSRcmAfLUFSSvfoq1rALb
	 WMjWHSp9Ekpf38JyMM9SEwqdV95HWavbgkecIq9XPAnzerONbGwNf4jeALCQA7pQ3+S1I
	 xNsV0Igl3wBSAHlHF2vPCUgqas5QtBmZx9f2B70qebIKnYelwMU6klhfpqmzYrsnskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202041;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JtDDoHl0HS1RD95of7XeWCQYJcbR8Pl7s0Viq27bdA8=;
	b=F8mys9HYXgXdpeoeNuC9ObtyMdJlahmecKm4WI3vXa7sWUOc3JtxCMlKLqaIoYp5chp3
	 JWpo5NFy0c7tYQHGydrsBgpr2449lbYKaDvLRgVDpRqzaWyRTcc+ojiCgSxoxo18Wppmk
	 CN2ejOCADDYdv6difeGb2/Psx6FH1TkGrqhNhaWvcLQGK2mqaix44thHMtiZztGgLMMmT
	 2PoePGOSwWG7TcPfGd46fQOtQHuFd69Q5LUKA4sH+O3dOW6/oKSuuIXZcjTRuIiYW+Lc8
	 ZPWxTxJchosq76WdcWDNO3zvdcMDriLqn7JkDOibhoiX6wMrtD0bWtGBVlJ6ygUzGjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cAf+ZMgu;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C84606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 05:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cAf+ZMgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794202041; x=1825738041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAqOofbuAZCZTQMDaIToMIkgqKyhEGIhHOS846WYWoU=;
  b=cAf+ZMgug6a1iEMCMJbFxpYBawKPaz10SFAtK7/BSNzbKbvUUckSCSK5
   9bALF4e1JVvK/X3ZIPFVmVRtmzBhtwrsT2+kOg00cyJ2/a6dULXhl09Yp
   KAi+HWehcb/IK9tN1yyTWnySS9PVw7z9KRsTiDK/3rh+KLnwam7wsPKoZ
   qNk8QONlkC2T9c6r7rNIXuL6wd1BAq2f/d5lARQsOJYeFNIYRSUcPsyfq
   s4OnpguMFg8b2hdSBC1t/Hffiv11v9SB47DucQRlYqB9Ewrbp6Q9CUYiW
   /EUQwXTLeStoEXTbCLH6PS+nEGaXVhWkYnCecunMaoq5PTLflWsGLULkf
   Q==;
X-CSE-ConnectionGUID: 1LrZx+80SpWVwhHBLDeF8A==
X-CSE-MsgGUID: TrDuzTRQTTexrvXsdZdYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2964621"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2964621"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 21:27:20 -0800
X-CSE-ConnectionGUID: bbPQUXVgQvOHhT+2v1BfEw==
X-CSE-MsgGUID: pzRJEp5rRnGDR2iSjjoXdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7923382"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 08 Nov 2026 21:27:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1AAD499; Mon, 09 Nov 2026 06:27:17 +0100 (CET)
Date: Mon, 9 Nov 2026 06:27:17 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Grant Morphett <grant@gmorph.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Enable hidden DP OUT adapter on Dell
 TB16 dock
Message-ID: <20261109052717.GH176724@black.igk.intel.com>
References: <20261101212311.10946-1-grant@gmorph.com>
 <20261106062614.27709-1-grant@gmorph.com>
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
In-Reply-To: <20261106062614.27709-1-grant@gmorph.com>

Hi,

On Fri, Nov 06, 2026 at 05:26:14PM +1100, Grant Morphett wrote:
> The Dell TB16 Thunderbolt 3 dock consists of two Alpine Ridge 4C routers
> in a chain: one in the captive cable module (DROM 00d4:b051 "Dell
> Thunderbolt Cable") and one in the dock itself (DROM 00d4:b054 "Dell
> Thunderbolt Dock"). The dock has four video connectors: mini DisplayPort,
> HDMI, full size DisplayPort and VGA.
> 
> Mini DisplayPort and HDMI sit behind an MST hub on DP OUT adapter 8 of
> the dock router and work fine. Full size DisplayPort and VGA are wired
> to DP OUT adapter 8 of the cable router, but the cable router's DROM
> marks that adapter as disabled. The software connection manager
> therefore never initializes it, never tunnels DisplayPort to it, and a
> monitor on the full size DisplayPort or VGA connector stays dark. Only
> two external displays can be used with the dock, while all of them work
> with the firmware connection manager (and under Windows).
> 
> The adapter is real: its adapter config space reports type DP/HDMI OUT
> (0xe0102), it raises hot plug events when a monitor is attached to the
> DisplayPort or VGA connector, and once it is enabled the DP tunnel to it
> is established and the display comes up. The same DROM also fails its
> CRC32 check (expected 0xaf438340, got 0xaf4383c0), so the port
> disabled bit is likely just wrong rather than intentional:
> 
>   1: DROM data CRC32 mismatch (expected: 0xaf438340, got: 0xaf4383c0), continuing
>   1:8: disabled by eeprom
>   acking hot plug event on 1:8
> 
> Add a quirk for the cable router that re-enables adapter 8 if its
> config space confirms it is a DP OUT adapter. It runs in a new
> tb_check_drom_quirks() call right after the DROM has been parsed, so
> the regular port initialisation in tb_switch_add() picks the adapter up
> like any other enabled port.
> 
> With the quirk applied, both DP tunnels come up at boot and all three
> external monitors work:
> 
>   1:8: enabling DP OUT adapter disabled in DROM
>   1:8: DP OUT available
>   0:5 <-> 1:8 (DP): activating
>   301:8: DP OUT available
>   0:6 <-> 301:8 (DP): activating
> 
> Tested on a Lenovo ThinkPad X1 Yoga Gen 8 (Raptor Lake, USB4 host
> 8087:a76d) with a TB16 at dock NVM 27.0 / cable NVM 16.0, driving three
> 1920x1080 monitors on mini DisplayPort, HDMI and full size DisplayPort.
> 
> v2:
> - Add a new tb_check_drom_quirks() call right after DROM parsing, so
>   the quirk corrects the wrong DROM entry before the ports are
>   initialized, instead of making tb_init_port() non-static and calling
>   it from the quirk (Mika Westerberg).

This should go under the '---'

> 
> Assisted-by: LLM

This is not needed.

> Signed-off-by: Grant Morphett <grant@gmorph.com>
> ---
> ---
>  drivers/thunderbolt/quirks.c | 62 ++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/switch.c |  1 +
>  drivers/thunderbolt/tb.h     |  1 +
>  3 files changed, 64 insertions(+)
> 
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index 2722918..bba10df 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -65,6 +65,34 @@ static void quirk_stuck_pending(struct tb_switch *sw)
>  	}
>  }
>  
> +/*
> + * The DROM of the Dell TB16 cable module marks adapter 8 as disabled
> + * even though it is the DP OUT adapter wired to the dock's full size
> + * DisplayPort and VGA connectors. Correct the DROM entry so that the
> + * software connection manager initializes the adapter and can tunnel
> + * DisplayPort to it.
> + */
> +static void quirk_dell_tb16_dp_out(struct tb_switch *sw)
> +{
> +	struct tb_port *port;
> +	u32 type;
> +
> +	if (sw->config.max_port_number < 8)
> +		return;
> +
> +	port = &sw->ports[8];
> +	if (!port->disabled)
> +		return;
> +
> +	if (tb_port_read(port, &type, TB_CFG_PORT, 2, 1))
> +		return;
> +	if ((type & 0xffffff) != TB_TYPE_DP_HDMI_OUT)
> +		return;
> +
> +	port->disabled = false;
> +	tb_port_info(port, "enabling DP OUT adapter disabled in DROM\n");
> +}
> +
>  struct tb_quirk {
>  	u16 hw_vendor_id;
>  	u16 hw_device_id;
> @@ -163,3 +191,37 @@ void tb_check_quirks(struct tb_switch *sw)
>  		q->hook(sw);
>  	}
>  }
> +
> +static const struct tb_quirk tb_drom_quirks[] = {
> +	/* Dell TB16 cable module DROM hides the second DP OUT adapter */
> +	{ 0x8086, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE, 0x00d4, 0xb051,
> +		  quirk_dell_tb16_dp_out },
> +};
> +
> +/**
> + * tb_check_drom_quirks() - Check for quirks to apply after DROM read
> + * @sw: Thunderbolt switch
> + *
> + * Apply any quirks that correct wrong DROM entries before the ports are
> + * initialized.
> + */
> +void tb_check_drom_quirks(struct tb_switch *sw)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(tb_drom_quirks); i++) {
> +		const struct tb_quirk *q = &tb_drom_quirks[i];
> +
> +		if (q->hw_vendor_id && q->hw_vendor_id != sw->config.vendor_id)
> +			continue;
> +		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
> +			continue;
> +		if (q->vendor && q->vendor != sw->vendor)
> +			continue;
> +		if (q->device && q->device != sw->device)
> +			continue;
> +
> +		tb_sw_dbg(sw, "running %ps\n", q->hook);
> +		q->hook(sw);

Can you make the matching as separate function (tb_apply_quirks()) that is
given the quirk table and then make this and the tb_check_quirks() call
that one? This avoids the duplication.

> +	}
> +}
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index d22d8db..6268ed6 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -3343,6 +3343,7 @@ int tb_switch_add(struct tb_switch *sw)
>  		ret = tb_drom_read(sw);
>  		if (ret)
>  			dev_warn(&sw->dev, "reading DROM failed: %d\n", ret);
> +		tb_check_drom_quirks(sw);
>  		tb_sw_dbg(sw, "uid: %#llx\n", sw->uid);
>  
>  		ret = tb_switch_set_uuid(sw);
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index e868457..7d04376 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1510,6 +1510,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
>  }
>  
>  void tb_check_quirks(struct tb_switch *sw);
> +void tb_check_drom_quirks(struct tb_switch *sw);
>  
>  #ifdef CONFIG_ACPI
>  bool tb_acpi_add_links(struct tb_nhi *nhi);
> -- 
> 2.53.0
