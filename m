Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450428;
	b=berrLNKNK6pVlc6+EQ9t2idxhGbO1ssDUIYdY66iKYCi86wmRgP00ph7V3JGGxJbTb/J
	 rG//aHQoJSAhHyVfj2CSHp94YTAc3JMwo1h2EF9jj3yKVlLH5HuyXVlZ6vwvj6vm5jg9i
	 Qq3t+gT1SMSUA1tAS53oJcFPfl8iZMTQ0daahqBfK2R0v8OG4ydKcy163S1ShWHSQYyuW
	 x1+MrcAyjtnLvb28rJUdO+Hskz2pYhuLsty0z2rgnApR9cYlp8RL5KdcJo+Oof6tspqen
	 Iw070NFTHa+Ny77kfjnSUeceMc2h8Awem6LwEGtYUivfUyNh8qLsCfkjqNO7E3YcLhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tx4Z4BQbk3SiJUv7mr3/hWO76/vYB/Uq0uwRV+pVkA4=;
	b=togCDLoXGNJapKXlFu89Kv80EZKyvqyryGpyZepCvUab+hqjtagpWu8V3X959GY/IOWo
	 RTefmPo48kjdUEVE959GpPvZ7hgyiHBCq1cW+BQJospkytyexljvNslt4sr0hqQyf0uUv
	 gdIjzAx4PDH04Ev+0icWkE/wMEW13/u7tezFpt3J8Qodav673X3s8XnsNIccdAEsuYfxQ
	 XVd9MJwHJi/qAU+9XCoZdlahwaKF98NoIE19fKat3vaVdCaHqt++udnOhQUXMDWabLd03
	 +WP2gezL6axQR/ybfxPGWQPXS6Zm7wfB8XH30dU3K6R4VdG93NnswapFB9U2iUcMhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUcmgwRA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D0C606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 02:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUcmgwRA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C171F00A05;
	Thu, 12 Nov 2026 02:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450427;
	bh=tx4Z4BQbk3SiJUv7mr3/hWO76/vYB/Uq0uwRV+pVkA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUcmgwRAVWR02SQfgtlHQ7L5SlohoBe+OwKR4KiUeu2kht1/e8IrgQSSmHZ9UiwxG
	 5mWnydGlg5i4cjCTbSqirq4DYzQPeAwdY2h/SJMMH4DpDKd8nGvdd6LXuXf1/coVtL
	 aIL+CWsdLVXdBSQ/Gw6yNIyPc5tg3/ghPHZWoUyQwlRFVM7Uen3D88ImFTGBCipGa9
	 LV21yAmCECcJG7tw6cZdQdm1qe63gBP6+MJxXaFkei/UJ92fx6nh0I1uNuNvYdq8Vp
	 u/GyuQNZ4Xra6IPJ+Ol1/2gVhoA2wkNYHsbP7VvyplX51SmQl/l0ufVLtpp0s7+isL
	 Rvwl8nMqPnG4w==
Message-ID: <sashiko-outbox-210188@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] thunderbolt: Optionally keep PCIe tunnels up through
 suspend-to-idle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Rusu de Castro" <arc@empyreal.works>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-tb-s2idle-keep-pcie-v2-b3c197ac@empyreal.works>
References: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
 <20261112-tb-s2idle-keep-pcie-v2-b3c197ac@empyreal.works>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:27:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] thunderbolt: missing tb_free_unplugged_xdomains() in
  tb_resume_noirq()
- [Medium] thunderbolt: incomplete XDomain replacement and child rescan
  on s2idle resume
- [Medium] thunderbolt: incomplete topology rescan in tb_complete() via
  tb_scan_port()
- [Medium] thunderbolt: missing router enumeration and UID checks in
  tb_check_kept_running()
- [Medium] thunderbolt: unquiesced delayed works access stopped ctl in
  tb_suspend_noirq()
- [Medium] thunderbolt: stale DP tunnels after monitor unplug during
  kept-running s2idle
--

commit a1b4dee4a46d2ea714a73ee4360b3adbd9dd4c3f
Author: Andrei Rusu de Castro <arc@empyreal.works>

thunderbolt: Optionally keep PCIe tunnels up through suspend-to-idle

This commit adds an s2idle_keep_pcie module parameter to keep USB4 routers
and tunnels up across suspend-to-idle when a PCIe tunnel is active, while
stopping hotplug handling and the control channel during sleep and checking
for topology changes on resume.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 418ad0a61a5de..a7528b93a7037 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
[ ... ]
> @@ -3106,10 +3112,94 @@ static int tb_start(struct tb *tb, bool reset)
[ ... ]
> +static void tb_check_kept_running(struct tb_switch *sw)
> +{
> +	struct tb_port *port;
> +
> +	tb_switch_for_each_port(sw, port) {
> +		struct tb_switch *child;
> +		u64 uid;
> +		int ret;
> +
> +		if (!tb_port_is_null(port))
> +			continue;
> +
> +		if (port->xdomain) {
> +			if (tb_wait_for_port(port, false) <=3D 0)
> +				port->xdomain->is_unplugged =3D true;
> +			continue;
> +		}

[Severity: Medium]
What happens if an XDomain is unplugged during suspend-to-idle and
replaced by a router on the same port?

Because the link is up, tb_wait_for_port() returns 1 and
port->xdomain->is_unplugged stays false.  Unlike tb_switch_resume(),
tb_check_kept_running() does not unlock the port and probe
tb_cfg_get_upstream_port(sw->tb->ctl, port->xdomain->route) to detect that
a router is now at that route.

When tb_complete() then runs, tb_domain_unregister_unplugged_xdomains()
does not unregister port->xdomain, and tb_scan_port() calls
tb_xdomain_remove() (which leaves a registered xd->dev on tb_bus_type) and
clears port->xdomain, leaking xd->dev on the bus and causing
tb_switch_add() for the new router to fail with -EEXIST due to the
colliding device name.

Also, in tb_complete(), tb_scan_port() returns early whenever port->remote
is already set without recursing into port->remote->sw, so replacements or
newly plugged devices on surviving child switches are skipped.

> +		if (!tb_port_has_remote(port))
> +			continue;
> +
> +		child =3D port->remote->sw;
> +		ret =3D tb_cfg_get_upstream_port(sw->tb->ctl, tb_route(child));
> +		if (ret >=3D 0 && child->uid) {
> +			if (tb_switch_is_usb4(child))
> +				ret =3D usb4_switch_read_uid(child, &uid);
> +			else
> +				ret =3D tb_drom_read_uid_only(child, &uid);
> +			if (!ret && uid !=3D child->uid)
> +				ret =3D -ENODEV;
> +		}

[Severity: Medium]
Can a child router that power-cycled or reset in place during
suspend-to-idle pass this check while unenumerated?

ROUTER_CS_0 (read by tb_cfg_get_upstream_port()) and the UID registers or
DROM remain readable after a router reset even though ROUTER_CS_3_V
(checked by tb_switch_enumerated()) was cleared and all hardware HopID
tunnel entries were wiped.  Because tb_resume_noirq() skips
tb_switch_configure() and tb_tunnel_activate() when tb->kept_running is
set, keeping a router whose ROUTER_CS_3_V bit is cleared leaves its
tunnels dead in hardware.

In addition, if child->uid is 0 (for example in safe mode), the
child->uid check skips UID verification altogether (whereas
tb_switch_resume() rejects !sw->uid with -ENODEV), and the upstream port
returned by tb_cfg_get_upstream_port() is not compared against
child->config.upstream_port_number.

> +		if (ret < 0) {
> +			tb_port_warn(port, "lost during suspend, disconnecting\n");
> +			tb_sw_set_unplugged(child);
> +			continue;
> +		}
> +
> +		tb_check_kept_running(child);
> +	}
> +}
> +
>  static int tb_suspend_noirq(struct tb *tb)
>  {
>  	struct tb_cm *tcm =3D tb_priv(tb);
> =20
> +	if (tb_keep_running_s2idle(tb)) {
> +		tb_dbg(tb, "PCIe tunnels active, keeping the domain running\n");
> +		/* As for freeze, no hotplug handling until resume */
> +		tcm->hotplug_active =3D false;
> +		tb->kept_running =3D true;
> +		return 0;
> +	}

[Severity: Medium]
Can delayed work items access tb->ctl while it is stopped during
suspend-to-idle?

Skipping tb_disconnect_and_release_dp() leaves DP tunnels and bandwidth
groups active while tb_domain_suspend_noirq() stops tb->ctl.  Because
group->release_work (on system_percpu_wq) and tunnel->dprx_work or
tcm->remove_work (on tb->wq, which is allocated without WQ_FREEZABLE) are
neither canceled nor guarded by tcm->hotplug_active, they can run during
suspend-to-idle and issue config reads/writes on the stopped control
channel, triggering WARN() in tb_cfg_read() and tb_cfg_write() on
-ENOTCONN and leaving software state out of sync with hardware.

[Severity: Medium]
What happens if a DisplayPort monitor on a surviving router is unplugged
during suspend-to-idle while tb->kept_running is set?

Because tb_disconnect_and_release_dp() is skipped and hotplug events are
ignored while asleep, the DP tunnel stays active.  On resume,
tb_check_kept_running() skips non-null ports, and tb_scan_port() only
checks DP OUT ports where !tb_dp_port_is_enabled(port), so lost HPD on an
enabled DP OUT port is never handled and the stale DP tunnel and DP IN
resource remain allocated.

[ ... ]
> @@ -3177,6 +3267,17 @@ static int tb_resume_noirq(struct tb *tb)
>  	unsigned int usb3_delay =3D 0;
>  	LIST_HEAD(tunnels);
> =20
> +	if (tb->kept_running) {
> +		tb->kept_running =3D false;
> +		tb_dbg(tb, "domain kept running, checking for changes\n");
> +		tb_check_kept_running(tb->root_switch);
> +		tb_free_invalid_tunnels(tb);
> +		tb_free_unplugged_children(tb->root_switch);
> +		tcm->rescan_on_complete =3D true;
> +		tcm->hotplug_active =3D true;
> +		return 0;
> +	}

[Severity: High]
Does this miss a call to tb_free_unplugged_xdomains(tb->root_switch)?

If an XDomain attached to tb->root_switch or a surviving child switch is
unplugged during suspend-to-idle, tb_check_kept_running() sets
port->xdomain->is_unplugged =3D true, but tb_free_unplugged_children() only
processes ports with tb_port_has_remote(port).  Without
tb_free_unplugged_xdomains(), tb_xdomain_remove() is never called and
port->xdomain is not cleared.

During dpm_resume, tb_xdomain_resume() then restarts xd->state_work, and
tb_complete() -> tb_domain_unregister_unplugged_xdomains() unregisters and
frees the struct tb_xdomain while xd->state_work is still queued and
port->xdomain still points to the freed object, causing a use-after-free
(or leaking xd if xd->dev was not yet registered on tb_bus_type).

[ ... ]
> @@ -3250,12 +3351,17 @@ static int tb_thaw_noirq(struct tb *tb)
> =20
>  static void tb_complete(struct tb *tb)
>  {
> +	struct tb_cm *tcm =3D tb_priv(tb);
> +	bool rescan =3D tcm->rescan_on_complete;
> +
> +	tcm->rescan_on_complete =3D false;
> +
>  	/*
>  	 * Unregister unplugged XDomains and if there is a case where
>  	 * another domain is swapped in place of unplugged XDomain we
>  	 * need to run another rescan.
>  	 */
> -	if (tb_domain_unregister_unplugged_xdomains(tb)) {
> +	if (tb_domain_unregister_unplugged_xdomains(tb) || rescan) {
>  		scoped_guard(mutex, &tb->lock)
>  			tb_scan_switch(tb->root_switch);
>  	}

[Severity: Medium]
Does tb_scan_switch(tb->root_switch) rescan downstream ports of child
routers that stayed up during suspend-to-idle?

In tb_scan_port(), any port that already has port->remote set returns
early without recursing into port->remote->sw:

drivers/thunderbolt/tb.c:tb_scan_port() {
    ...
	if (port->remote) {
		tb_port_dbg(port, "port already has a remote\n");
		goto out_rpm_put;
	}
    ...
}

Because s2idle_keep_pcie only triggers when a downstream router with a
PCIe tunnel is present on tb->root_switch, port->remote is non-NULL for
every surviving child router, so devices or monitors plugged into or
replaced behind a kept-running dock or enclosure during sleep are never
scanned on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-tb-s2idle-=
keep-pcie-v2-b3c197ac@empyreal.works?part=3D1
