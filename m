Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CA53F7A87
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932126; cv=none; b=uAqqQyQfrAkxgSRETfNAKQ/iEFBjENFHkpAToob1vlKAAi1gkLoXc0VXWxgMpJG2YyLF8uv9ly6s49/8+ryN8WwXfMG/bWtRnEmfyi9Z/iX14QkCQX5YONQTGLQOWY8F+2pWQ6TwxAYiiKHNKHEsgQJ3OPXfB8rRcy7c5Jt/rtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932126; c=relaxed/simple;
	bh=rodLkmXFS4nROxQVY95Fj0IpsOaI1v5ZWMq6naYKytA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA7uqtj7V6vFA85Z33b+4HoShxIvmMpgRGfOk1144mZP5o6BUhVyWab5n9cxJCoDJkUqbqa9oenYia4ke2pRsXF8VDjQ/kYRFvtLbDqdE5Mi3YIPtUe5bqed/amGoNoGjNxnFbCy1rZkJzEdN8MtCATt4NW4hXPaVjtfNa7fkYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3p/LK6+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3p/LK6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780932125; x=1812468125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rodLkmXFS4nROxQVY95Fj0IpsOaI1v5ZWMq6naYKytA=;
  b=k3p/LK6+XLS680Chhc4bZ7bu+B5oma821vJ+OwigAU/HX5/I8+FJ0mzZ
   bG8MrUL03bpds4/gWikeam9ybEHgJ8Ib9YqIbwS8rVYRizGMeJo54W/q0
   VZnXEHafKfPBfGU0/w8+ak2HT2DRvMH0bASVimTj/q+0fD4PmqfjPw59r
   Y/jjqd8GXIXr/gBYnE1vu3BTQbi7k3rsXdUjwO/ZmyihWd4+32n3Xmppe
   3U4Exh+6kvwV39nCrDog87FetzEFJixC9mt6xZiysgJ4Llf7T3dXx35Wq
   jkFL64sktp0KL5WZRNZFG0XqsrAyB77ZcUogZC3sWqTFSBNfM9HQ7vxhB
   Q==;
X-CSE-ConnectionGUID: 5wXkMpGpTdeuKMylfb1eZg==
X-CSE-MsgGUID: NxXB4Lw8RqyUFPGw27dFOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81415317"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81415317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 08:22:04 -0700
X-CSE-ConnectionGUID: 3/6iKiBhTDe7tgq6TUNk7A==
X-CSE-MsgGUID: Qxqi5MOiQMKVewZbegA9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="239243627"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jun 2026 08:22:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 602C395; Mon, 08 Jun 2026 17:22:01 +0200 (CEST)
Date: Mon, 8 Jun 2026 17:22:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj Natikar <bnatikar@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260608152201.GL2990@black.igk.intel.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
 <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
 <20260608064020.GJ2990@black.igk.intel.com>
 <a7f333a2-d594-4e1e-9cc5-265aeda8e5a6@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7f333a2-d594-4e1e-9cc5-265aeda8e5a6@amd.com>

On Mon, Jun 08, 2026 at 10:13:00AM -0500, Mario Limonciello wrote:
> 
> 
> On 6/8/26 01:40, Mika Westerberg wrote:
> > On Fri, Jun 05, 2026 at 11:27:52AM -0500, Basavaraj Natikar wrote:
> > > Hi,
> > > 
> > > 
> > > On 6/4/2026 12:03 AM, Mika Westerberg wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Jun 03, 2026 at 11:31:46PM +0530, Basavaraj Natikar wrote:
> > > > > On shutdown the connection manager tears down the switch tree without
> > > > router tree
> > > > 
> > > > > signalling connected devices. Thunderbolt 3 devices directly connected
> > > > > to a USB4 host never receive a disconnect indication and during shutdown
> > > > > this can cause polling the dead link for up to 60 seconds. On some
> > > > > platforms this behavior leads to a warm reset instead of a shutdown due
> > > > > to this timeout.
> > > > > 
> > > > > Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> > > > > before tearing down the switch tree. This drives SBTX low unconditionally
> > > > router tree
> > > > 
> > > > > (USB4 spec section 6.9), causing the device to detect SBRX low and
> > > > > transition to Uninitialized Unplugged state immediately.
> > > > > 
> > > > > Co-developed-by: Sanath S <Sanath.S@amd.com>
> > > > > Signed-off-by: Sanath S <Sanath.S@amd.com>
> > > > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > > > > ---
> > > > >    drivers/thunderbolt/switch.c |  2 +-
> > > > >    drivers/thunderbolt/tb.c     | 11 +++++++++++
> > > > >    drivers/thunderbolt/tb.h     |  1 +
> > > > >    3 files changed, 13 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > > > > index c2ad58b19e7b..52812908818b 100644
> > > > > --- a/drivers/thunderbolt/switch.c
> > > > > +++ b/drivers/thunderbolt/switch.c
> > > > > @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
> > > > >    	return __tb_port_enable(port, false);
> > > > >    }
> > > > > -static int tb_port_reset(struct tb_port *port)
> > > > > +int tb_port_reset(struct tb_port *port)
> > > > >    {
> > > > >    	if (tb_switch_is_usb4(port->sw))
> > > > >    		return port->cap_usb4 ? usb4_port_reset(port) : 0;
> > > > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > > > index c69c323e6952..ca57b5181422 100644
> > > > > --- a/drivers/thunderbolt/tb.c
> > > > > +++ b/drivers/thunderbolt/tb.c
> > > > > @@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
> > > > >    	struct tb_cm *tcm = tb_priv(tb);
> > > > >    	struct tb_tunnel *tunnel;
> > > > >    	struct tb_tunnel *n;
> > > > > +	struct tb_port *port;
> > > > >    	cancel_delayed_work(&tcm->remove_work);
> > > > >    	/* tunnels are only present after everything has been initialized */
> > > > > @@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
> > > > >    			tb_tunnel_deactivate(tunnel);
> > > > >    		tb_tunnel_put(tunnel);
> > > > >    	}
> > > > > +	/*
> > > > > +	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
> > > > > +	 * ~60 s of link polling before warm reset on shutdown.
> > > > > +	 */
> > > > > +	tb_switch_for_each_port(tb->root_switch, port) {
> > > > > +		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
> > > > > +			continue;
> > > > > +		if (tb_port_reset(port))
> > > > > +			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
> > > > > +	}
> > > > But now this tears down the topology also when the driver is unloaded? If
> > > > you want to do that in shutdown there is ->shutdown hook for that.
> > > 
> > > Asserting DPR on unload is intentional and it is harmless. After a reload
> > > the driver re-probes and the router tree comes back up cleanly.
> > 
> > Well not entirely harmless as it also kills the native tunnels and now user
> > cannot get rid of that by passing host_reset=0 during load.
> > 
> > Prior this unloading the driver left the tunnels up and that was
> > intentional.
> 
> I guess I see two approaches.
> 
> 1) Move to shutdown only (your suggestion).
> 
> Corner case of user who unloads before shutdown means they could be exposed
> to this.
> 
> 2) Link the DPR behavior to host_reset module behavior.
> 
> IE If a user set host_reset=0 avoid host reset on module load and avoid DPR
> on module unload/shutdown.
> 
> If user kept host_reset=1 then do DPR on unload.
> 
> Always do on shutdown (regardless of host_reset value).
> 
> What do you think of #2?

That sounds better. Also we could restrict this more for links that are TB3
e.g no need to do for USB4, assuming that is simple to do.
