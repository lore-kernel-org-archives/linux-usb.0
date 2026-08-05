Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4127D381EBA
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 03:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785901757; cv=none; b=RsI1fXlc5/JsckN6EInfLRRYl9D2oCcPywzoe68F8l8ork17XGzX+0jq6xwvhq3AO0oscdxWLkb8D+GFrGBFwpE7MOvobQW2KpSFQGi/dS97teeL5GY4ukcjrDT6JvMtGdf0cgZM69W0l/8j57QnWuS6hHeFQKYhfOAYVzGGzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785901757; c=relaxed/simple;
	bh=meFEwZIslNE7kFHIjAADvZ+HWEw7+PCD4fidAQi7V+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW/+Bm7UQWq1/vqrPpiMZ3TMW9E9rtA9xiheOaWmLUKiqAZkGBE5LbbVf+/TL+Muv5MFZNiUhs00so2+us1dVat92yEWZ+unrHf7QWMU8pwXJ8YU54kfXATSuF0TXUMuJb2wBAnYxM/YLOAGjbpBD11Vv+wxabSWu8ACtdg4U1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCZY6uNO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCZY6uNO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785901752; x=1817437752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=meFEwZIslNE7kFHIjAADvZ+HWEw7+PCD4fidAQi7V+Q=;
  b=WCZY6uNO5biN1aMey2yNWVKe0AUQivTI1fj+9d3tQLqBvtiMJ4n/yuGy
   myYCkIyQf8r1Fvw2RripjiSsrC/CigiBkncIXZO4MP0NbY/5mGCOjZGkk
   gWbSl7IV98Fum9UoCXNbOxGRsxIzAMI08h0GHWKV3M7unxhAcpwSeqE1r
   3iwwZz21m+6jysB5g1L28BuuMfT/GdkS/Ji2HhlqeVC8CeTd/nzw9DI7z
   F5Pj/8nH8eJ8i67LIor+OURWpxJHKR+5ZuTrI7Nz+RoL0rj+oP4Q0KKqN
   JDYVFtvqQZE5tHlQvFgt1DopAtOJOjaAicv0JAyRWupHBmOmmDiaMsLTn
   g==;
X-CSE-ConnectionGUID: GimhQ38jRPiIUFH7yOOvog==
X-CSE-MsgGUID: OkGpGn2YSn+2IAdrUhjoiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109254877"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="109254877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 20:49:11 -0700
X-CSE-ConnectionGUID: wb+P5wogR8Spa8X7ffMQFw==
X-CSE-MsgGUID: U7rBnLuGS9G6UvabZSlj3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="285055728"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2026 20:49:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7A25499; Wed, 05 Aug 2026 05:49:08 +0200 (CEST)
Date: Wed, 5 Aug 2026 05:49:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario.Limonciello@amd.com,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH -next] thunderbolt: Add quirk to reset host interface on
 DMA path teardown for AMD USB4 routers
Message-ID: <20260805034908.GC235112@black.igk.intel.com>
References: <20260804122638.1623429-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804122638.1623429-1-Basavaraj.Natikar@amd.com>

Hi,

On Tue, Aug 04, 2026 at 05:56:38PM +0530, Basavaraj Natikar wrote:
> Some AMD USB4 host routers have a bug in the Host Interface where
> DMA path setup and teardown cycles may cause the Tx ring to hang.
> 
> Fix this by issuing a Host Interface Reset on every DMA path teardown
> for affected routers. The Host Interface Reset brings the registers in
> the memory BAR to their default state and clears the End-to-End Flow
> Control state, preventing the hang condition.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/thunderbolt/nhi.c      | 48 ++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi_regs.h |  4 +++
>  drivers/thunderbolt/quirks.c   | 16 ++++++++++++
>  drivers/thunderbolt/tb.c       |  7 +++++
>  drivers/thunderbolt/tb.h       |  3 +++
>  5 files changed, 78 insertions(+)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 383a36212f70..0865cab582e7 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1160,6 +1160,54 @@ static void nhi_reset(struct tb_nhi *nhi)
>  	dev_warn(nhi->dev, "timeout resetting host router\n");
>  }
>  
> +/**
> + * nhi_host_interface_reset() - Issue a host interface reset
> + * @nhi: Pointer to the NHI structure
> + *
> + * Resets the Host Interface by setting the RST bit in the Host Interface
> + * Reset register. This brings the registers in the memory BAR to their
> + * default state and clears the End-to-End Flow Control state.
> + *
> + * The caller must ensure that the control channel (Ring 0) is stopped
> + * before calling this function, since the reset clears ring state.
> + * The caller is responsible for restarting Ring 0 afterward.
> + *
> + * After setting the RST bit, waits for tHIReset (10 ms) for the reset
> + * to complete.
> + */
> +static void nhi_host_interface_reset(struct tb_nhi *nhi)
> +{
> +	struct device *dev = nhi->dev;
> +	u32 val;
> +
> +	val = ioread32(nhi->iobase + REG_CAPS);
> +	/* Host Interface Reset only applies to Ver. 1 routers */
> +	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
> +		return;
> +
> +	dev_dbg(dev, "issuing host interface reset\n");
> +
> +	iowrite32(REG_HOST_INTERFACE_RESET_RST,
> +		  nhi->iobase + REG_HOST_INTERFACE_RESET);
> +
> +	/* Wait for tHIReset (10 ms) for the reset to complete */
> +	usleep_range(10000, 20000);
> +}
> +
> +/**
> + * tb_nhi_host_interface_reset() - Reset host interface with control channel
> + * @tb: Pointer to the thunderbolt domain
> + *
> + * Stops the control channel, issues a Host Interface Reset, and restarts
> + * the control channel.
> + */
> +void tb_nhi_host_interface_reset(struct tb *tb)
> +{
> +	tb_ctl_stop(tb->ctl);
> +	nhi_host_interface_reset(tb->nhi);
> +	tb_ctl_start(tb->ctl);
> +}
> +
>  static struct tb *nhi_select_cm(struct tb_nhi *nhi)
>  {
>  	struct tb *tb;
> diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
> index d6a197fabc74..99df60b6db36 100644
> --- a/drivers/thunderbolt/nhi_regs.h
> +++ b/drivers/thunderbolt/nhi_regs.h
> @@ -115,6 +115,10 @@ struct ring_desc {
>  #define REG_CAPS_VERSION_MASK		GENMASK(23, 16)
>  #define REG_CAPS_VERSION_2		0x40
>  
> +/* Host Interface Reset - resets TX/RX rings and E2E flow control counters */
> +#define REG_HOST_INTERFACE_RESET	0x39858
> +#define REG_HOST_INTERFACE_RESET_RST	BIT(0)
> +
>  #define REG_DMA_MISC			0x39864
>  #define REG_DMA_MISC_INT_AUTO_CLEAR     BIT(2)
>  #define REG_DMA_MISC_DISABLE_AUTO_CLEAR	BIT(17)
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index 9f7914ac2f48..cc04d0873931 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -52,6 +52,12 @@ static void quirk_block_rpm_in_redrive(struct tb_switch *sw)
>  	tb_sw_dbg(sw, "preventing runtime PM in DP redrive mode\n");
>  }
>  
> +static void quirk_host_interface_reset(struct tb_switch *sw)
> +{
> +	sw->quirks |= QUIRK_HOST_INTERFACE_RESET;
> +	tb_sw_dbg(sw, "enabling host interface reset on DMA path teardown\n");
> +}
> +
>  struct tb_quirk {
>  	u16 hw_vendor_id;
>  	u16 hw_device_id;
> @@ -114,6 +120,16 @@ static const struct tb_quirk tb_quirks[] = {
>  	{ 0x0438, 0x0209, 0x0000, 0x0000, quirk_clx_disable },
>  	{ 0x0438, 0x020a, 0x0000, 0x0000, quirk_clx_disable },
>  	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },
> +	/*
> +	 * AMD USB4 host routers may hang the Tx ring after repeated
> +	 * DMA path teardowns. Issue a Host Interface Reset on each
> +	 * teardown to prevent the hang.
> +	 */
> +	{ 0x0438, 0x020d, 0x0000, 0x0000, quirk_host_interface_reset },
> +	{ 0x0438, 0x020e, 0x0000, 0x0000, quirk_host_interface_reset },
> +	{ 0x0438, 0x020f, 0x0000, 0x0000, quirk_host_interface_reset },
> +	{ 0x0438, 0x0210, 0x0000, 0x0000, quirk_host_interface_reset },
> +	{ 0x0438, 0x0211, 0x0000, 0x0000, quirk_host_interface_reset },

These quirks are for things inside USB4 fabric. Since this is the HI, we
have quirks for those in pci.c/nhi.c like QUIRK_AUTO_CLEAR_INT. Can you
make this one follow that convention instead?

>  };
>  
>  /**
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2e..d40cc9e57364 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2395,6 +2395,13 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>  	 * the same host router USB4 downstream port.
>  	 */
>  	tb_enable_clx(sw);
> +
> +	/*
> +	 * Some host routers may hang the Tx ring after DMA path teardowns.
> +	 * Issue a Host Interface Reset to prevent it.
> +	 */
> +	if (tb->root_switch->quirks & QUIRK_HOST_INTERFACE_RESET)
> +		tb_nhi_host_interface_reset(tb);
>  }
>  
>  static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4373336d9425..d21feb631f3e 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -26,6 +26,8 @@
>  #define QUIRK_NO_CLX					BIT(1)
>  /* Need to keep power on while USB4 port is in redrive mode */
>  #define QUIRK_KEEP_POWER_IN_DP_REDRIVE			BIT(2)
> +/* Reset Host Interface on DMA path teardown to prevent Tx ring hang */
> +#define QUIRK_HOST_INTERFACE_RESET			BIT(3)
>  
>  /**
>   * struct tb_nvm - Structure holding NVM information
> @@ -1507,6 +1509,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
>  }
>  
>  void tb_check_quirks(struct tb_switch *sw);
> +void tb_nhi_host_interface_reset(struct tb *tb);

Also we don't need to expose this then (and if it needs to be exposed it
belongs to nhi.h not here.).

>  
>  #ifdef CONFIG_ACPI
>  bool tb_acpi_add_links(struct tb_nhi *nhi);
> -- 
> 2.34.1
