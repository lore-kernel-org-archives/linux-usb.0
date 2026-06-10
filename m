Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892533FB7E0
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 10:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089045; cv=none; b=eRrzCVs/Y+h9Mo7n9wvIHaZLCD3gSdDq1ZznxyyU3pC3LMmlQQpK0qKkPGmH4Il/S+ZyEZmBypGE039TIaf/mSQXMmWsGaChG74M4B5fLLdcvVrkcqS/HSkA9jMhC+fr2wZ7Q+3t1dhWrOo3AGNoGaQeLto5xd6i6rOLas83kWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089045; c=relaxed/simple;
	bh=2+XyuNeWVklUct3Xdcau9T+wmLhss19aiYul3e+DfFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zm+YksZGwkk8mlqiKZWJMSIydFarBnk232DFOSixfkq4UqpLg7BZSbosaNhV0tQr+FiJEe7GjWxhJJcFLfIAD6iCNo6imaalGyvsiyKeFaENtel3BqfasRIN4bL0VKMdsDKvKNlzf1cgXXa5RmUOsQjDdjruTnwQyCzPxmT2anU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWKMHUto; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWKMHUto"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781089041; x=1812625041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+XyuNeWVklUct3Xdcau9T+wmLhss19aiYul3e+DfFE=;
  b=EWKMHUtoPt1zzAKhYHj6gqtr2Wq1TfBuPQTqGYOiiTLbItvrNz1uEl3+
   Qdjv0faJs7x6CeK6K3z+/Rpu+zbrgr6YmGcZ+1loWIzKwR1eXGm86ztDN
   gbP1yvlVKnq/n5ToaSq8T57HFA+bt7ahD6JEiXdgTXICtu56kPUxigO1t
   yLSiTknnc2pChNzV+vTeQfWsBSRRmn+W0aSHY4T6e5wNIbnG5D51i9hTK
   lfVsfIBAOebRtf0UGVPoWmN4vKAaY03ZZoTcJa88Gf7Rh37MlqIKyX0gz
   4kUtLRtFgHRoBrohyCtOk/CeW43hd065FTpUWCT5iyhXWv3aIXHtc/VkQ
   A==;
X-CSE-ConnectionGUID: uDB9k3k2TzG3906RlzjPMw==
X-CSE-MsgGUID: Ej8Y0c83RZ2K8z6OLwgZ+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81921235"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81921235"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:57:20 -0700
X-CSE-ConnectionGUID: a77mDZ+LQieKcJ8MPo25tQ==
X-CSE-MsgGUID: 8M1Z+tA+S6yjackCRLifGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245288426"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 10 Jun 2026 03:57:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 053A995; Wed, 10 Jun 2026 12:57:17 +0200 (CEST)
Date: Wed, 10 Jun 2026 12:57:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260610105717.GQ2990@black.igk.intel.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>

Hi,

On Wed, Jun 10, 2026 at 02:20:06PM +0530, Basavaraj Natikar wrote:
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
> Always do this on system shutdown/reboot by forcing host_reset in the
> PCI ->shutdown callback. On plain driver unload only do it when the host
> router was actually reset on load (host_reset=1), since in that case the
> tunnels are not preserved across reload anyway; with host_reset=0 the
> tunnels are kept alive across unload/reload so the links are left intact.
> Restrict the reset to Thunderbolt 3 devices.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
> v3:
>  - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
>    now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
>  - Add kernel-doc for tb_port_reset() now that it is exported.
>  - Move the host_reset flag into struct tb_nhi instead of struct tb, and
>    set it from nhi_probe() instead of tb_domain_add().
>  - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
>  - Reword the debug message to "downstream port reset failed, continuing".
> 
> v2:
>  - Add Reviewed-by tag from Mario Limonciello.
>  - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
>    only affects Thunderbolt 3 devices.
>  - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
>    forces host_reset) or when the host router was actually reset on load.
>  - Reword comments and commit message to refer to the "router tree"
>    instead of the "switch tree".
> ---
>  drivers/thunderbolt/nhi.c    |  2 ++
>  drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
>  drivers/thunderbolt/switch.c | 11 ++++++++++-
>  drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
>  drivers/thunderbolt/tb.h     |  1 +
>  include/linux/thunderbolt.h  |  6 ++++++
>  6 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 0f795ea58756..698fb124d529 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
>  
>  	init_completion(&nhi->domain_released);
>  
> +	nhi->host_reset = host_reset;
> +
>  	res = tb_domain_add(tb, host_reset);
>  	if (res) {
>  		/*
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index bbd186c29ef7..be63a4647b59 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
>  	nhi_shutdown(nhi);
>  }
>  
> +static void nhi_pci_driver_shutdown(struct pci_dev *pdev)

nhi_pci_shutdown()

> +{
> +	struct tb *tb = pci_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	/*
> +	 * Force host_reset so the connection manager asserts DPR and signals
> +	 * disconnect to connected devices before the router tree is removed.
> +	 * Only Thunderbolt 3 devices are reset.
> +	 */
> +	nhi->host_reset = true;
> +	nhi_pci_remove(pdev);
> +}
> +
>  static struct pci_device_id nhi_ids[] = {
>  	/*
>  	 * We have to specify class, the TB bridges use the same device and
> @@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
>  	.id_table = nhi_ids,
>  	.probe = nhi_pci_probe,
>  	.remove = nhi_pci_remove,
> -	.shutdown = nhi_pci_remove,
> +	.shutdown = nhi_pci_driver_shutdown,

nhi_pci_shutdown

Otherwise looks good.

>  	.driver.pm = &nhi_pm_ops,
>  };
>  
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index a830c82bb905..404c0693df50 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -682,7 +682,16 @@ int tb_port_disable(struct tb_port *port)
>  	return __tb_port_enable(port, false);
>  }
>  
> -static int tb_port_reset(struct tb_port *port)
> +/**
> + * tb_port_reset() - Reset the port
> + * @port: Port to reset
> + *
> + * Resets @port. For USB4 ports this issues a USB4 port reset and for
> + * legacy ports the link controller port is reset.
> + *
> + * Return: %0 on success, negative errno otherwise.
> + */
> +int tb_port_reset(struct tb_port *port)
>  {
>  	if (tb_switch_is_usb4(port->sw))
>  		return port->cap_usb4 ? usb4_port_reset(port) : 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 76323255439a..b7cc6894a598 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2941,7 +2941,9 @@ static void tb_handle_event(struct tb *tb, enum tb_cfg_pkg_type type,
>  static void tb_stop(struct tb *tb)
>  {
>  	struct tb_cm *tcm = tb_priv(tb);
> +	struct tb_nhi *nhi = tb->nhi;
>  	struct tb_tunnel *tunnel;
> +	struct tb_port *port;
>  	struct tb_tunnel *n;
>  
>  	cancel_delayed_work(&tcm->remove_work);
> @@ -2956,6 +2958,25 @@ static void tb_stop(struct tb *tb)
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
> +	if (nhi->host_reset) {
> +		tb_switch_for_each_port(tb->root_switch, port) {
> +			if (!tb_port_is_null(port) || !tb_port_has_remote(port))
> +				continue;
> +			if (tb_switch_is_usb4(port->remote->sw))
> +				continue;
> +			if (tb_port_reset(port))
> +				tb_port_dbg(port, "downstream port reset failed, continuing\n");
> +		}
> +	}
>  	tb_switch_remove(tb->root_switch);
>  	tb->root_switch = NULL;
>  	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index ec9192b61bc0..4373336d9425 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1103,6 +1103,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
>  int tb_port_unlock(struct tb_port *port);
>  int tb_port_enable(struct tb_port *port);
>  int tb_port_disable(struct tb_port *port);
> +int tb_port_reset(struct tb_port *port);
>  int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
>  void tb_port_release_in_hopid(struct tb_port *port, int hopid);
>  int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index feb1af175cfd..cb1621c6b703 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -514,6 +514,11 @@ void tb_service_properties_changed(struct tb_service *svc);
>   * @hop_count: Number of rings (end point hops) supported by NHI.
>   * @quirks: NHI specific quirks if any
>   * @domain_released: Completed when domain has been fully released
> + * @host_reset: Host router was reset on driver load, or forced on system
> + *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
> + *		downstream ports to signal disconnect before tearing down the
> + *		router tree. Only Thunderbolt 3 devices are reset; USB4
> + *		routers are skipped.
>   */
>  struct tb_nhi {
>  	spinlock_t lock;
> @@ -528,6 +533,7 @@ struct tb_nhi {
>  	u32 hop_count;
>  	unsigned long quirks;
>  	struct completion domain_released;
> +	bool host_reset;
>  };
>  
>  /**
> -- 
> 2.34.1
