Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793641;
	b=wu3PPr1ejrsdGC8GGzwdDkJWk72a/4z+/QIz3CdEC0sTd6BJk2CHiTBeKhjZZPSjZRYL
	 VSKN2OMYDMJLP+zCKDGsJdbbwyW2vKFqvaURml1BIzYMUJXI4PFShr6yl8CMhkxD8+t9l
	 Hj+I84PJzZjDKNwGIOH1Y57g0WONPQXVUfwBqAbCZOTz2P2EBdmcp3fCKDQUCSyzi8Lff
	 l4Tt2TVre/fp7VtGQruMgWK88M98xk07NLP0/MyLFFuPUU0tFxu3OpLT1PxT6R5EeClQj
	 Ew6zxHHsijBTmAfXjM3KUXZeVANfHXogyzSQOMSovoCXLFL0ppiC57CaVqYSOH/l3Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793641;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mv+Er8+8Yti9h00JVyiKgSoZIL7C69JW2wmN2iRzf9E=;
	b=MKPU5T+nlJmOcY6ZjEsk+i1BfdxpQ7sK7C5wtHK5S+egqLtnEs0asd2e94GZpeOP7ysG
	 7tk/MLH/WAw8AauydqOboncveMw3hD7K29KgSe8zWAWCGKZUAI0XTxFJAGBDiw64qyQD/
	 /rUqcWJo6dYLs9U7C3lQDVH0DOUwbmDyx3h0Ybpr8DAADLOoWTZIhZ3eeaJVd/II0J15E
	 x3YkqmlhMait1bzcGXmgRcd9A9TXAEhV6sQsNtxuudPBIto5v2vpmrhqSJ/L4sTl+OLqA
	 OClLUtPkg7W7j3sOyxkJvEJMTjUW3Pll/Y9B9CPfJ3iwxtBFi3exTlAmfhFQKDPilIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVI+Pac9;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165B2606A336
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 12:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165B2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVI+Pac9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793641; x=1825329641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eV3JRT1k2gXL1nKgVen7pmC38hKNRxdTEjLUZRDxqfc=;
  b=SVI+Pac9EFkK0wsY+sDvrp6KxFTQ1krFLsEs2W2fZFqMwV0599u0iJS3
   SFKJAzhf5994yLMPnJvxGMcFijeDfWM0eHauaAcRd0z5UiDvIfKAqOFbK
   gmmTuK0XOiVnsrf/3xDWnU5YR5MmrRLxNPs/8Z0O100bA77za7ZXyUxct
   icxIYvQoC+NcDMJ10Ul8hHum5eBJcR+8Q7346Uq3fdzW6+GZ6dDS82yU9
   7GzEm/RrSYAR8R/zBehD4pLQx4AAEYFPFsHohWRr0x54uZPA1Ky6d8cKR
   AEsoFNuNd+6d82o1PXOJ2A9AJ8m84Bh99Adc2MjgdMntubGHqMy7qKUzy
   A==;
X-CSE-ConnectionGUID: /iLixURsRXCDSnMMQStJlQ==
X-CSE-MsgGUID: FeGO9G1kRL6BsobEP0/nTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2579895"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2579895"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:00:40 -0800
X-CSE-ConnectionGUID: NidMIBzPSYCYEKP7hcj0mA==
X-CSE-MsgGUID: 0WlXuALIQXKbCyGws7cB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8571234"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 04 Nov 2026 04:00:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2003699; Wed, 04 Nov 2026 13:00:38 +0100 (CET)
Date: Wed, 4 Nov 2026 13:00:38 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Grant Morphett <grant@gmorph.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Enable hidden DP OUT adapter on Dell TB16
 dock
Message-ID: <20261104120038.GC176724@black.igk.intel.com>
References: <20261101212311.10946-1-grant@gmorph.com>
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
In-Reply-To: <20261101212311.10946-1-grant@gmorph.com>

Hi,

On Mon, Nov 02, 2026 at 08:23:11AM +1100, Grant Morphett wrote:
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
> config space confirms it is a DP OUT adapter, and initializes it the
> same way tb_switch_add() does for the other ports. tb_init_port() is
> made non-static for this.
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

Yeah, the firmware connection manager ignored the DROM entries so that's
why it worked with the TB3 hosts but fails with the USB4 software
connection manager.

> Assisted-by: LLM
> Signed-off-by: Grant Morphett <grant@gmorph.com>
> ---
>  drivers/thunderbolt/quirks.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/switch.c |  7 ++++---
>  drivers/thunderbolt/tb.h     |  1 +
>  3 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index 2722918..4529fa4 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -65,6 +65,38 @@ static void quirk_stuck_pending(struct tb_switch *sw)
>  	}
>  }
>  
> +/*
> + * The DROM of the Dell TB16 cable module marks adapter 8 as disabled
> + * even though it is the DP OUT adapter wired to the dock's full size
> + * DisplayPort and VGA connectors. Enable it so that the software
> + * connection manager can tunnel DisplayPort to it.
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
> +	if (tb_init_port(port)) {
> +		port->disabled = true;
> +		return;
> +	}
> +
> +	tb_port_info(port, "enabling DP OUT adapter disabled in DROM\n");
> +}
> +
>  struct tb_quirk {
>  	u16 hw_vendor_id;
>  	u16 hw_device_id;
> @@ -77,6 +109,9 @@ static const struct tb_quirk tb_quirks[] = {
>  	/* Dell WD19TB supports self-authentication on unplug */
>  	{ 0x0000, 0x0000, 0x00d4, 0xb070, quirk_force_power_link },
>  	{ 0x0000, 0x0000, 0x00d4, 0xb071, quirk_force_power_link },
> +	/* Dell TB16 cable module DROM hides the second DP OUT adapter */
> +	{ 0x8086, PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_BRIDGE, 0x00d4, 0xb051,
> +		  quirk_dell_tb16_dp_out },
>  
>  	/* Intel Titan Ridge CLx is unstable on early firmware versions */
>  	{ 0x8086, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE, 0x0000, 0x0000,
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index d22d8db..e4629ed 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -701,15 +701,16 @@ int tb_port_reset(struct tb_port *port)
>  	return tb_lc_reset_port(port);
>  }
>  
> -/*
> +/**
>   * tb_init_port() - initialize a port
> + * @port: Port to initialize
>   *
> - * This is a helper method for tb_switch_alloc. Does not check or initialize
> + * This is a helper method for tb_switch_add(). Does not check or initialize
>   * any downstream switches.
>   *
>   * Return: %0 on success, negative errno otherwise.
>   */
> -static int tb_init_port(struct tb_port *port)
> +int tb_init_port(struct tb_port *port)

I'm not too happy to expose this. Instead let's add tb_check_drom_quirks()
right after DROM has been parsed and then that one can "correct" the wrong
DROM entries.

>  {
>  	int res;
>  	int cap;
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index e868457..cb84182 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1099,6 +1099,7 @@ int tb_switch_pcie_l1_enable(struct tb_switch *sw);
>  int tb_switch_xhci_connect(struct tb_switch *sw);
>  void tb_switch_xhci_disconnect(struct tb_switch *sw);
>  
> +int tb_init_port(struct tb_port *port);
>  int tb_port_state(struct tb_port *port);
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged);
>  int tb_port_add_nfc_credits(struct tb_port *port, int credits);
> -- 
> 2.53.0
