Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCCA37205F
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072860; cv=none; b=u496DyLTF74NI2gwTDb8y+I/lJEQIaDh3ww/B0l71nxPOlGeHveLiDBS5wKU8r4J2ZtxTP7ThjIctRvmbWQQi1rGvjdZIyqyFBrxcmamT3cvIoZz+sApLs7wHWMyzHmKNlv34HSdLrhKRd/e746dnGxU+ytYK5KZr8whbKuMW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072860; c=relaxed/simple;
	bh=XpiGl5UZ0MNjP2JuNs9hODleklzAtrW0NPXowGWA78M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2w/PRw601gyzCrXX0P3I6hiuBNg7EH5poaO6Yy2YkzJ3RjtSDvGglcSDY9OXeVF9mDzDxLLRcw2YYnMg1u38dAFxKUTjd8UE5ti4dDGFjYiwiLysnSlCwykDvFDv4CmdJRA639MGLUVIRvUXqqkddgdIzuobukHrCV9+gczlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cg5SJ8XI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cg5SJ8XI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781072859; x=1812608859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XpiGl5UZ0MNjP2JuNs9hODleklzAtrW0NPXowGWA78M=;
  b=cg5SJ8XI/L63kNrLZp1mXTPDMMpvwV5zQGS/SHjpRRJ3BOIIC+5lZJYL
   /+BmIFuwjLFBE3+MX3e8iV3Ln3hjgm/uUHLN9+2cEcHBUHlMDmFPMIeET
   fTsQpZ2L+iSVS+YPLq/kudtM2FjTJUbZ0Wd3HH8NEpNidxs1Tsxml5XoU
   M6QWLGJOQBhB/ToEWTVz9b2RT+cDHlSdbXDr+u5AFdgQQPct3oZZwZOIw
   FwY7HoU0yBtmdrh+s7hs75DRsf4hzr1ytaqLrZ71TbfgEYvUfiIC57Gpx
   Av2dGB08QEWhrRlv8po6EDtq8pJP/E1HQM77DSb4xS/qvgvRM2m3r8Vp0
   g==;
X-CSE-ConnectionGUID: S08kUnSrRdCpp2lkgJfHIw==
X-CSE-MsgGUID: msIZXW3ZTvO64NRZ9w/xeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104522607"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="104522607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 23:27:38 -0700
X-CSE-ConnectionGUID: xqWXkOMhTUGbXd7yPERBtQ==
X-CSE-MsgGUID: 7IAEZAx0RzWjphDIYc8h3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269758480"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2026 23:27:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D72B295; Wed, 10 Jun 2026 08:27:34 +0200 (CEST)
Date: Wed, 10 Jun 2026 08:27:34 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v2] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260610062734.GP2990@black.igk.intel.com>
References: <20260609104218.2770725-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609104218.2770725-1-Basavaraj.Natikar@amd.com>

Hi,

On Tue, Jun 09, 2026 at 04:12:18PM +0530, Basavaraj Natikar wrote:
> On shutdown the connection manager tears down the router tree without
> signalling connected devices. A Thunderbolt 3 device directly connected
> to a USB4 host never receives a disconnect indication and during shutdown
> this can cause polling the dead link for up to 60 seconds. On some
> platforms this behavior leads to a warm reset instead of a shutdown due
> to this timeout.
> 
> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> before tearing down the router tree. This drives SBTX low (USB4 spec
> section 6.9), causing the device to detect SBRX low and transition to
> Uninitialized Unplugged state immediately.
> 
> Always do this on system shutdown/reboot by forcing tb->host_reset in the
> PCI ->shutdown callback. On plain driver unload only do it when the host
> router was actually reset on load (host_reset=1), since in that case the
> tunnels are not preserved across reload anyway; with host_reset=0 the
> tunnels are kept alive across unload/reload so the links are left intact.
> Restrict the reset to TBT3 devices.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
> v2:
>  - Add Reviewed-by tag from Mario Limonciello.
>  - Restrict the DPR assertion to TBT3 devices, since the issue only
>    affects TBT3 devices.
>  - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
>    forces tb->host_reset) or when the host router was actually reset on
>    load.
>  - Reword comments and commit message to refer to the "router tree"
>    instead of the "switch tree".
> ---
>  drivers/thunderbolt/domain.c |  2 ++
>  drivers/thunderbolt/nhi.c    | 16 +++++++++++++++-
>  drivers/thunderbolt/switch.c |  2 +-
>  drivers/thunderbolt/tb.c     | 20 ++++++++++++++++++++
>  drivers/thunderbolt/tb.h     |  1 +
>  include/linux/thunderbolt.h  |  6 ++++++
>  6 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -460,6 +460,8 @@ int tb_domain_add(struct tb *tb, bool reset)
>  	if (ret)
>  		goto err_ctl_stop;
>  
> +	tb->host_reset = reset;
> +
>  	/* Start the domain */
>  	if (tb->cm_ops->start) {
>  		ret = tb->cm_ops->start(tb, reset);
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1436,6 +1436,20 @@ static void nhi_remove(struct pci_dev *pdev)
>  	nhi_shutdown(nhi);
>  }
>  
> +static void nhi_pci_shutdown(struct pci_dev *pdev)
> +{
> +	struct tb *tb = pci_get_drvdata(pdev);
> +
> +	/*
> +	 * On system shutdown/reboot force host_reset so the connection
> +	 * manager asserts DPR to signal disconnect before removing the
> +	 * router tree. Only TBT3 devices are reset. Plain driver unload
> +	 * uses ->remove (nhi_remove) and keeps the host_reset from load.
> +	 */
> +	tb->host_reset = true;
> +	nhi_remove(pdev);
> +}

There has been changes to support non-PCIe hosts so this does not apply on
top of my next branch.

> +
>  /*
>   * The tunneled pci bridges are siblings of us. Use resume_noirq to reenable
>   * the tunnels asap. A corresponding pci quirk blocks the downstream bridges
> @@ -1558,7 +1572,7 @@ static struct pci_driver nhi_driver = {
>  	.id_table = nhi_ids,
>  	.probe = nhi_probe,
>  	.remove = nhi_remove,
> -	.shutdown = nhi_remove,
> +	.shutdown = nhi_pci_shutdown,
>  	.driver.pm = &nhi_pm_ops,
>  };
>  
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
>  	return __tb_port_enable(port, false);
>  }
>  
> -static int tb_port_reset(struct tb_port *port)

Since you make it non-static please add kernel-doc as well.

> +int tb_port_reset(struct tb_port *port)
>  {
>  	if (tb_switch_is_usb4(port->sw))
>  		return port->cap_usb4 ? usb4_port_reset(port) : 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
>  	struct tb_cm *tcm = tb_priv(tb);
>  	struct tb_tunnel *tunnel;
>  	struct tb_tunnel *n;
> +	struct tb_port *port;
>  
>  	cancel_delayed_work(&tcm->remove_work);
>  	/* tunnels are only present after everything has been initialized */
> @@ -2948,6 +2949,25 @@ static void tb_stop(struct tb *tb)
>  			tb_tunnel_deactivate(tunnel);
>  		tb_tunnel_put(tunnel);
>  	}
> +	/*
> +	 * Signal disconnect to connected devices before the router tree is
> +	 * removed below. A Thunderbolt 3 device directly connected to a USB4
> +	 * host otherwise never receives a disconnect indication, leaving
> +	 * firmware to poll the dead link for up to ~60 s which on some
> +	 * platforms turns the shutdown into a warm reset. Asserting
> +	 * PORT_CS_19.DPR drives SBTX low (USB4 spec section 6.9) so the device
> +	 * detects SBRX low and goes to Uninitialized Unplugged immediately.
> +	 */
> +	if (tb->host_reset) {
> +		tb_switch_for_each_port(tb->root_switch, port) {
> +			if (!tb_port_is_null(port) || !tb_port_has_remote(port))
> +				continue;
> +			if (tb_switch_is_usb4(port->remote->sw))
> +				continue;
> +			if (tb_port_reset(port))
> +				tb_port_dbg(port, "DPR failed, continuing\n");

"downstream port reset failed, continuing\n"

> +		}
> +	}
>  	tb_switch_remove(tb->root_switch);
>  	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
>  }
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1102,6 +1102,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
>  int tb_port_unlock(struct tb_port *port);
>  int tb_port_enable(struct tb_port *port);
>  int tb_port_disable(struct tb_port *port);
> +int tb_port_reset(struct tb_port *port);
>  int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
>  void tb_port_release_in_hopid(struct tb_port *port, int hopid);
>  int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -76,5 +76,10 @@
>   * @index: Linux assigned domain number
>   * @security_level: Current security level
>   * @nboot_acl: Number of boot ACLs the domain supports
> + * @host_reset: Host router was reset on driver load, or forced on system
> + *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
> + *		downstream ports to signal disconnect before tearing down the
> + *		router tree. Only TBT3 devices are reset; USB4 routers are

Thunderbolt 3

And I think this should be part of struct tb_nhi instead.

> + *		skipped.
>   * @privdata: Private connection manager specific data
>   */
> @@ -89,5 +94,6 @@ struct tb {
>  	int index;
>  	enum tb_security_level security_level;
>  	size_t nboot_acl;
> +	bool host_reset;
>  	unsigned long privdata[];
>  };
> -- 
> 2.34.1
