Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE140F724
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932916; cv=none; b=g8AHKkO+X2q/i50jXMAG8ZAJoZB5/pEdFO+pXJysH8dYhLaPC/fSuR1K13e5TCNytFNgwWksV/fgSGjo8PSD2Z3zwU9k8XYvX5nvfUItrNgFUz3USWMemj6BU+mdbYGUeAkUz0jyw0OyUxo3LbUxHqk9njX/JFi5geaVdYrHsJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932916; c=relaxed/simple;
	bh=s5vzpwGC+GvLalPFalOtaPsVMimfYCbYNkvl6ljE2AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfphly6EbCMNfoBJI/lRk4j1rmhIAt63Df7S74hnejK1Yc8899YBktT6rHWsEbud2NKkPbc/vh+/1zd4WAdapMr3RRQjv/8b4TD8FLAvAX79h4Grws/BGxgU9ysSa2JVqJHRzq5gfnggJEWpGmUW7l3nDsDojoECG0rLvv4Y2OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MW5pxw3X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MW5pxw3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785932915; x=1817468915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s5vzpwGC+GvLalPFalOtaPsVMimfYCbYNkvl6ljE2AE=;
  b=MW5pxw3Xq6a4ynomHpXnW5n8P7NY36vQaaNpnRQdtzxI065FdRVNsQZx
   5+ssPgVRcEOZ/Zw4PL0JywpUN0Tglf8dpCU5IQsHMixMyJv8KOQWe84Jl
   mrUghIMZVd/Z+6hKypbCU0vdD6LcHtxHbpy2v959leDvd+EH31sueRBqT
   RJcazgB9ksylfhQM1HNL07HkEZnTaJVoO/CocZ/Uz0PVk3XP7VTgifKUT
   BNi0+BW7NneSpc7uFKWInhMP9iCQkxWNIkv3RRj7pnWNPF7kf89dZdtgE
   zGTxpcY79jF9fjbKxG3U7ABZ3I14zLGMFi2AffoBMm8tY/aBjAPw8clrh
   A==;
X-CSE-ConnectionGUID: Yl7gzjdkROOVMkGbvfsTjA==
X-CSE-MsgGUID: vKPFd7FESN6fxAaNe8PIWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86444270"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86444270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:28:35 -0700
X-CSE-ConnectionGUID: Fj0o+t6nTpeMO1cRPqyGHw==
X-CSE-MsgGUID: dNxJK4B6Ti+vThxr//fx9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="266033416"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2026 05:28:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 32E4799; Wed, 05 Aug 2026 14:28:32 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:28:32 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario.Limonciello@amd.com,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH -next v2] thunderbolt: Add quirk to reset host interface
 on DMA path teardown for AMD USB4 routers
Message-ID: <20260805122832.GH235112@black.igk.intel.com>
References: <20260805111811.517996-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805111811.517996-1-Basavaraj.Natikar@amd.com>

Hi,

On Wed, Aug 05, 2026 at 04:48:11PM +0530, Basavaraj Natikar wrote:
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
> v2:
> - Move the quirk to the NHI (nhi->quirks), set in nhi_pci_check_quirks()
>   by PCI ID following the QUIRK_AUTO_CLEAR_INT convention, instead of the
>   tb_quirks[] fabric table.
> - Declare nhi_host_interface_reset() in nhi.h instead of tb.h.
> 
> v1: https://lore.kernel.org/all/20260804122638.1623429-1-Basavaraj.Natikar@amd.com/
>  drivers/thunderbolt/nhi.c      | 37 ++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi.h      |  2 ++
>  drivers/thunderbolt/nhi_regs.h |  4 ++++
>  drivers/thunderbolt/pci.c      | 21 +++++++++++++++++++
>  drivers/thunderbolt/tb.c       |  6 ++++++
>  5 files changed, 70 insertions(+)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 383a36212f70..72a76db5ea68 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1160,6 +1160,43 @@ static void nhi_reset(struct tb_nhi *nhi)
>  	dev_warn(nhi->dev, "timeout resetting host router\n");
>  }
>  
> +/**
> + * nhi_host_interface_reset() - Issue host interface reset

nhi_reset_interface()

> + * @tb: Domain whose host interface is reset

This should take nhi as paramter.

> + *
> + * Resets the host interface by setting the RST bit in the host interface
> + * reset register. This brings the registers in the memory BAR to their
> + * default state and clears the End-to-End Flow Control state. Does nothing
> + * unless the host interface is known to need this (QUIRK_HOST_INTERFACE_RESET).
> + *
> + * The control channel is stopped over the reset because the reset clears
> + * the ring state as well.
> + */

This can just reset the NHI, e.g not look into the quirks.

> +void nhi_host_interface_reset(struct tb *tb)
> +{
> +	struct tb_nhi *nhi = tb->nhi;
> +	u32 val;
> +
> +	if (!(nhi->quirks & QUIRK_HOST_INTERFACE_RESET))
> +		return;
> +
> +	val = ioread32(nhi->iobase + REG_CAPS);
> +	/* Only v1 host interfaces implement the reset */
> +	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
> +		return;
> +
> +	dev_dbg(nhi->dev, "issuing host interface reset\n");
> +
> +	tb_ctl_stop(tb->ctl);

But don't do these here. Just the actual reset. So that we can call it
whenever we want to do host internface reset.

> +
> +	iowrite32(REG_HOST_INTERFACE_RESET_RST,
> +		  nhi->iobase + REG_HOST_INTERFACE_RESET);
> +	/* Wait for tHIReset (10 ms) to complete */
> +	usleep_range(10000, 20000);
> +
> +	tb_ctl_start(tb->ctl);
> +}
> +
>  static struct tb *nhi_select_cm(struct tb_nhi *nhi)
>  {
>  	struct tb *tb;
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index d488eadadfce..9be0372b837e 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -36,6 +36,7 @@ irqreturn_t nhi_msi(int irq, void *data);
>  irqreturn_t ring_msix(int irq, void *data);
>  int nhi_probe(struct tb_nhi *nhi);
>  void nhi_shutdown(struct tb_nhi *nhi);
> +void nhi_host_interface_reset(struct tb *tb);

>  extern const struct dev_pm_ops nhi_pm_ops;
>  
>  /**
> @@ -121,6 +122,7 @@ struct tb_nhi_ops {
>  /* Host interface quirks */
>  #define QUIRK_AUTO_CLEAR_INT	BIT(0)
>  #define QUIRK_E2E		BIT(1)
> +#define QUIRK_HOST_INTERFACE_RESET	BIT(2)

Let's call it QUIRK_RESET_DMA_ON_TEARDOWN or something like that.

>  /*
>   * Minimal number of vectors when we use MSI-X. Two for control channel
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
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 8462ccb59b7e..02534287cb43 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -62,6 +62,27 @@ static void nhi_pci_check_quirks(struct tb_nhi_pci *nhi_pci)
>  			nhi->quirks |= QUIRK_E2E;
>  			break;
>  		}
> +	} else if (pdev->vendor == PCI_VENDOR_ID_AMD) {
> +		switch (pdev->device) {
> +		case 0x1120:
> +		case 0x1121:
> +		case 0x113b:
> +		case 0x113c:
> +		case 0x1155:
> +		case 0x1158:
> +		case 0x1159:
> +		case 0x151c:
> +		case 0x151d:
> +		case 0x158d:
> +		case 0x158e:

I would prefer if these are defined in nhi.h similarly what we do with the
Intel stuff so we have symbolic names for them.

> +			/*
> +			 * These AMD hosts may hang the Tx ring when the
> +			 * DMA paths are torn down so they need the host
> +			 * interface reset after each teardown.
> +			 */
> +			nhi->quirks |= QUIRK_HOST_INTERFACE_RESET;
> +			break;
> +		}
>  	}
>  }
>  
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 47753a5c0f2e..f07f2ada2346 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2395,6 +2395,12 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>  	 * the same host router USB4 downstream port.
>  	 */
>  	tb_enable_clx(sw);
> +
> +	/*
> +	 * Some hosts may hang the Tx ring after the DMA paths are torn
> +	 * down so reset the host interface to prevent that.
> +	 */
> +	nhi_host_interface_reset(tb);

Instead of here, do this in domain.c::tb_domain_disconnect_xdomain_paths()
and there you can also stop/start the control channel around this. You may
need to take the tb->lock here too so maybe add a helper.

I wanted to make tb.c (and domain.c) not call anything from the "upper"
layer (nhi.c) but I can't think of reasonable way to do it here, and there
is no way to handle this from nhi.c because it has no knowledge of XDomain
tunnels. Perhaps through indirection, nhi->ops->reset_interface?

>  }
>  
>  static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
> -- 
> 2.34.1
