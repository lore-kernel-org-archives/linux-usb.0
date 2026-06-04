Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3803A383A
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780549411; cv=none; b=i0wQ2deRR5kl5MdEJ10TZAGLPR7KyZ3le0s3IyLVO8Y9czWJHbKyjpCUkcYOSbbhHNMyLBJUhC1ERGdddl8K1pDuulIgHu3O7L+9MOYRmvUMD/b6UXuqHCtEv9PTFEJits3TAhFnftk3d1UIJF12cOExq18iMjqaTS4bHaP5d80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780549411; c=relaxed/simple;
	bh=Duy0V3wFPwJ3bfvTtT0D1aFdcqfg7oe6fPxfcHrUjVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmWosb7osIJQjPoCruuwE0jpH1pTh0cnSyB/vXoj4VML9jADbRJUC7mZcp+xOyFCyp3tBPrSMMSlbCmI1Tn5Xy9aKDyd9uYAHOb+LWEFFwEQFiWXzK2buKDtUV4Ywz6pSa426/arXXSfzjnFC+02kPkAYKnEQSGe9vsaXvZJk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FowCrOxe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FowCrOxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780549411; x=1812085411;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Duy0V3wFPwJ3bfvTtT0D1aFdcqfg7oe6fPxfcHrUjVs=;
  b=FowCrOxe7sN0YDDcbkNhCXLMy90/T7NoJAnaw/NCmeCi8CiO2F8B5Koy
   MeQeofYkdB1YOh61OzDtGGPEoAzMoSv4pbKpqKpnAiMXiD1dwXuZIC/wS
   G+5rgtaWdiMrpNycKtkJO662a+83qBnsd9cIXpA/jaYFz39dlaZgY9e1g
   iHNc1KRPodzHWrirqW2LYpq6INPuRuLHZOdGdBV7fkLn6zyffLBfJEi8+
   ZEUVQXTrpyJ7PYlQAgU0hXSbK4MNhC8xNpDK4cITpDVhyth4VwX4/Kc7C
   vn/YWPiq+prEEaVejkuGCLJY+U9aiumURCiqqiFb7KYO+Dzy1qM1IbMhg
   A==;
X-CSE-ConnectionGUID: sT5+HbuWTTiNLiq6zn5QAQ==
X-CSE-MsgGUID: o3pf+cDvSF6WOAoZZOBx3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81368267"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81368267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 22:03:30 -0700
X-CSE-ConnectionGUID: D/5+DTIoRHiwdZgjKea8PA==
X-CSE-MsgGUID: MjaodTdJTxSUvGn6Mhuynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268347454"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2026 22:03:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E50BC98; Thu, 04 Jun 2026 07:03:26 +0200 (CEST)
Date: Thu, 4 Jun 2026 07:03:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260604050326.GH2990@black.igk.intel.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>

Hi,

On Wed, Jun 03, 2026 at 11:31:46PM +0530, Basavaraj Natikar wrote:
> On shutdown the connection manager tears down the switch tree without

router tree

> signalling connected devices. Thunderbolt 3 devices directly connected
> to a USB4 host never receive a disconnect indication and during shutdown
> this can cause polling the dead link for up to 60 seconds. On some
> platforms this behavior leads to a warm reset instead of a shutdown due
> to this timeout.
> 
> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> before tearing down the switch tree. This drives SBTX low unconditionally

router tree

> (USB4 spec section 6.9), causing the device to detect SBRX low and
> transition to Uninitialized Unplugged state immediately.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/thunderbolt/switch.c |  2 +-
>  drivers/thunderbolt/tb.c     | 11 +++++++++++
>  drivers/thunderbolt/tb.h     |  1 +
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index c2ad58b19e7b..52812908818b 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
>  	return __tb_port_enable(port, false);
>  }
>  
> -static int tb_port_reset(struct tb_port *port)
> +int tb_port_reset(struct tb_port *port)
>  {
>  	if (tb_switch_is_usb4(port->sw))
>  		return port->cap_usb4 ? usb4_port_reset(port) : 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index c69c323e6952..ca57b5181422 100644
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
> @@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
>  			tb_tunnel_deactivate(tunnel);
>  		tb_tunnel_put(tunnel);
>  	}
> +	/*
> +	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
> +	 * ~60 s of link polling before warm reset on shutdown.
> +	 */
> +	tb_switch_for_each_port(tb->root_switch, port) {
> +		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
> +			continue;
> +		if (tb_port_reset(port))
> +			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
> +	}

But now this tears down the topology also when the driver is unloaded? If
you want to do that in shutdown there is ->shutdown hook for that.

>  	tb_switch_remove(tb->root_switch);
>  	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
>  }
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 217c3114bec8..875eb538eacf 100644
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
> -- 
> 2.34.1
