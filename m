Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92BD33F8B4
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 06:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900825; cv=none; b=F2P56L3lACRTcAv0MJLQLrW8Ck/WiVSd/aP/WsYWPyEdxI7u186v8l5H5y25GCltoa5w4EmaHA3mMZfqhFssOiiUmY1tGyAkfgLHSoSRT7HkUXUfAYXV5B7Sle9JJ6p/Gvj5iBXS/1gQ6nMxDmLnNoDpflucuacsQkQ0v3IE+60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900825; c=relaxed/simple;
	bh=fjXBBoG0yoUaEQ26+u1O3d4uSfphgKwvCoqJG1CeVM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1qR/Cm/YgDJc4C2YZgVMgJZ6KpGmMwzTkXQ19wtzittSha4jRFTWOnlUTPly8rEp+Taat9q4oZuQG9iwtkGEGjhA4GOfvOjQOGIfk2o1I198IJq0apLLjDLv5OgaqWhvFvD05hetk7A9DSQCJ7qdypaTUF5dpoY4g+RKxd22G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gpd/rQgU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gpd/rQgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780900824; x=1812436824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fjXBBoG0yoUaEQ26+u1O3d4uSfphgKwvCoqJG1CeVM4=;
  b=Gpd/rQgUXDQKPYhcwKpMG2HmxFnlm87O4p11jHBI39mM1ZhMxnykOWql
   8GczXWEEXkuFOlwmQ9K0gG/NLnx1FGSqRTz9veZMFj76ZDqmoMJO8SoGg
   p1nawQjV94KA1kvDBvBSo4F9jF1CVCzjJ/sjgE9Z/2O9q74UhHWbB54VL
   hd1ivemez+UI9N9EMySzsjrcwnxFg85TmadlqqxyV7TPcU5L4hpng7SRH
   SKYe7qMn1CJJ074IQrXiv7dGXZFrFLEi6ePOuDlHgldnjkEu3Nb9fjncg
   jk1CDmBlMKI08tjr1zZJNKRiTcOgBc21Luh4VDd9fnGH/in3OHG1DjlTo
   g==;
X-CSE-ConnectionGUID: rizGl2WyQlyO20tm2PuWyw==
X-CSE-MsgGUID: m+9hK1JNTNqFLd/xyG4ymA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81691415"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81691415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 23:40:23 -0700
X-CSE-ConnectionGUID: R8Uu1kofR2e1kzjcz5yzdA==
X-CSE-MsgGUID: XJ4fMpm4T0upymthDsI+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="245519329"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2026 23:40:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4002F95; Mon, 08 Jun 2026 08:40:20 +0200 (CEST)
Date: Mon, 8 Jun 2026 08:40:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
	westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260608064020.GJ2990@black.igk.intel.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
 <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>

On Fri, Jun 05, 2026 at 11:27:52AM -0500, Basavaraj Natikar wrote:
> Hi,
> 
> 
> On 6/4/2026 12:03 AM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Wed, Jun 03, 2026 at 11:31:46PM +0530, Basavaraj Natikar wrote:
> > > On shutdown the connection manager tears down the switch tree without
> > router tree
> > 
> > > signalling connected devices. Thunderbolt 3 devices directly connected
> > > to a USB4 host never receive a disconnect indication and during shutdown
> > > this can cause polling the dead link for up to 60 seconds. On some
> > > platforms this behavior leads to a warm reset instead of a shutdown due
> > > to this timeout.
> > > 
> > > Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> > > before tearing down the switch tree. This drives SBTX low unconditionally
> > router tree
> > 
> > > (USB4 spec section 6.9), causing the device to detect SBRX low and
> > > transition to Uninitialized Unplugged state immediately.
> > > 
> > > Co-developed-by: Sanath S <Sanath.S@amd.com>
> > > Signed-off-by: Sanath S <Sanath.S@amd.com>
> > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > > ---
> > >   drivers/thunderbolt/switch.c |  2 +-
> > >   drivers/thunderbolt/tb.c     | 11 +++++++++++
> > >   drivers/thunderbolt/tb.h     |  1 +
> > >   3 files changed, 13 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > > index c2ad58b19e7b..52812908818b 100644
> > > --- a/drivers/thunderbolt/switch.c
> > > +++ b/drivers/thunderbolt/switch.c
> > > @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
> > >   	return __tb_port_enable(port, false);
> > >   }
> > > -static int tb_port_reset(struct tb_port *port)
> > > +int tb_port_reset(struct tb_port *port)
> > >   {
> > >   	if (tb_switch_is_usb4(port->sw))
> > >   		return port->cap_usb4 ? usb4_port_reset(port) : 0;
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index c69c323e6952..ca57b5181422 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
> > >   	struct tb_cm *tcm = tb_priv(tb);
> > >   	struct tb_tunnel *tunnel;
> > >   	struct tb_tunnel *n;
> > > +	struct tb_port *port;
> > >   	cancel_delayed_work(&tcm->remove_work);
> > >   	/* tunnels are only present after everything has been initialized */
> > > @@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
> > >   			tb_tunnel_deactivate(tunnel);
> > >   		tb_tunnel_put(tunnel);
> > >   	}
> > > +	/*
> > > +	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
> > > +	 * ~60 s of link polling before warm reset on shutdown.
> > > +	 */
> > > +	tb_switch_for_each_port(tb->root_switch, port) {
> > > +		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
> > > +			continue;
> > > +		if (tb_port_reset(port))
> > > +			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
> > > +	}
> > But now this tears down the topology also when the driver is unloaded? If
> > you want to do that in shutdown there is ->shutdown hook for that.
> 
> Asserting DPR on unload is intentional and it is harmless. After a reload
> the driver re-probes and the router tree comes back up cleanly.

Well not entirely harmless as it also kills the native tunnels and now user
cannot get rid of that by passing host_reset=0 during load.

Prior this unloading the driver left the tunnels up and that was
intentional.

> It is also needed. Once the driver is unloaded it is unbound, so a later
> system shutdown has no driver left to assert DPR and the ~60s link polling
> hang comes back. Doing it in tb_stop() covers both plain shutdown and the
> unload then shutdown case, so I kept it here instead of the ->shutdown hook.
> 
> Will fix switch tree to router tree.
> 
> Thanks,
> --
> Basavaraj
> 
> > 
> > >   	tb_switch_remove(tb->root_switch);
> > >   	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
> > >   }
> > > diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> > > index 217c3114bec8..875eb538eacf 100644
> > > --- a/drivers/thunderbolt/tb.h
> > > +++ b/drivers/thunderbolt/tb.h
> > > @@ -1102,6 +1102,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
> > >   int tb_port_unlock(struct tb_port *port);
> > >   int tb_port_enable(struct tb_port *port);
> > >   int tb_port_disable(struct tb_port *port);
> > > +int tb_port_reset(struct tb_port *port);
> > >   int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
> > >   void tb_port_release_in_hopid(struct tb_port *port, int hopid);
> > >   int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
> > > -- 
> > > 2.34.1
