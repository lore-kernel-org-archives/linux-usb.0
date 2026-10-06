Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198149CF40
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304516; cv=none; b=JX+zPeaW3hAD/tbqy6Qa+lrcR+T+ix+QHNJc2ocvxTk+KFgPwOZ10KWROMtgHjTgLURntvrTKLEVDxkr/dO8z6LH0rP+5wOW864tzLbueg8UWjfVZ7XRTcEJoXQKKmpS7nHEDlRgL2NuGyL+aSd3yrQvojOQXn6Wc6E90IVwz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304516; c=relaxed/simple;
	bh=QTx7R4f+7KGsA37n6uAg+LueLHDzTRD5gIwz1EOPt9w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=S6YOwYpWg6R8nZu+9AZHydnnMdukJdfmJCmw5zxHXsH1JuP+WUPGC7NBQlouhxilhVWcx9NFd5G2WxPFamkzkD3FcUS8DLxQgVQMXVO4NzKaMOz0yLcpjIRaIOXMuiQrbhDLZF/FaYidGvPpfgK13tgLgdIyGV1eV84hIPUb7zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBF7dFsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBF7dFsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C783B1F0089B;
	Tue,  6 Oct 2026 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791304515;
	bh=Bhafq1dc1Pvc0B48v+v01CuuG0nXyPqvguzihyT5rDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UBF7dFsSSMSvdfMwfU6LsX+NSiFmJE8SfiYhmi78FCN9SFVjJS8Wxy1ireLJv2kQO
	 lWWK41ii6SAQozqDa2pxCAPAtb7N1aUCtLekj0dGEHhegLey1K2bW3+bSqIzg+EgR3
	 uPSi4xgWxED95T6fRhafu8GboV84pxt0F5mgQ51Z9tv/kVmDZEa2S7luUo/M+/TF+R
	 EMcCB1zT21uyQHlxvgcUnply8VGkqgfC9JAVKyu+IFS0hY5hZ8R7MBh2h3yJ3yVu/h
	 JcvB4M3zDmrggcVtyorm4Lr2X4co8nON01r4QNBdGN0iirs1la86DBzmycrS3lQwRT
	 F0yqDiwFGljnw==
Message-ID: <sashiko-outbox-162263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] thunderbolt: Reset the host interface before
 reusing a DMA HopID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:35:14 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] thunderbolt: NULL pointer dereference in nhi_reset_work() during p=
robe failure
- [High] thunderbolt: lost control channel interrupt due to race in nhi_res=
et_work()
- [Low] net: thunderbolt: mixed goto and guard() cleanup in tbnet_connected=
_work()
--

commit dc6bb5398632a1b975f04bc4d5441e027de1977f
Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: thunderbolt: Reset the host interface before reusing a DMA HopID

This patch tracks DMA HopIDs and resets the host interface once all DMA rin=
gs
are idle to allow safe HopID reuse. It also defers ring allocation when Hop=
IDs
are dirty and blocks control and DMA traffic during the reset.

Link: https://lore.kernel.org/linux-usb/20260831130638.GK124825@black.igk.i=
ntel.com/T/#m668c2efcfe2f298632537721d72b17445b39211a

> diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/mai=
n.c
> index 93ccccc5cf8bb..f2dbb6fb30c63 100644
> --- a/drivers/net/thunderbolt/main.c
> +++ b/drivers/net/thunderbolt/main.c

[ ... ]

> @@ -644,9 +657,9 @@ static void tbnet_connected_work(struct work_struct *=
work)
>  	if (netif_carrier_ok(net->dev))
>  		return;
> =20
> -	mutex_lock(&net->connection_lock);
> -	connected =3D net->login_sent && net->login_received;
> -	mutex_unlock(&net->connection_lock);
> +	scoped_guard(mutex, &net->connection_lock)
> +		connected =3D !net->stopping && !net->disconnecting &&
> +			    net->login_sent && net->login_received;
> =20
>  	if (!connected)
>  		return;

[ ... ]

> @@ -714,24 +732,34 @@ static void tbnet_connected_work(struct work_struct=
 *work)
>  err_release_hopid:
>  	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
>  	tbnet_connect_failed(net);
> +	if (ret =3D=3D -EAGAIN) {
> +		guard(mutex)(&net->connection_lock);
> +		if (!net->stopping && !net->disconnecting)
> +			queue_delayed_work(system_long_wq, &net->login_work,
> +					   msecs_to_jiffies(TBNET_LOGIN_DELAY));
> +	}
>  }

[Severity: Low]
This isn't a bug, but does this function mix goto-based error handling with
scoped-based cleanup? The cleanup subsystem guidelines indicate that we sho=
uld
either convert all resources that need a goto cleanup to scope-based cleanu=
p,
or convert none of them. Since this function still uses goto labels like
err_release_hopid and err_free_tx_buffers, adding scoped_guard and guard co=
uld
create confusing ownership semantics.

> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 1960fa30e13af..a68ecabadcb57 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c

[ ... ]

> @@ -513,7 +515,8 @@ void tb_ring_poll_complete(struct tb_ring *ring)
> =20
>  	spin_lock_irqsave(&ring->nhi->lock, flags);
>  	spin_lock(&ring->lock);
> -	if (ring->start_poll)
> +	if (ring->start_poll && ring->running && !ring->nhi->resetting &&
> +	    !ring->nhi->going_away)
>  		__ring_interrupt_mask(ring, false);
>  	spin_unlock(&ring->lock);
>  	spin_unlock_irqrestore(&ring->nhi->lock, flags);

[ ... ]

> +static void nhi_reset_work(struct work_struct *work)
> +{
> +	struct tb_nhi *nhi =3D container_of(to_delayed_work(work), struct tb_nh=
i,
> +					  reset_work);
> +	struct tb *tb =3D dev_get_drvdata(nhi->dev);
> +
> +	/* The connection manager must be blocked over the reset */
> +	guard(mutex)(&tb->lock);

[Severity: High]
Could this dereference a NULL tb pointer during probe failure?=20

In nhi_probe(), tb_domain_add() is called prior to dev_set_drvdata().=20
If tb_domain_add() discovers routers and synchronously binds drivers that s=
tart
and stop DMA rings, tb_ring_stop() can queue nhi->reset_work. If=20
tb_domain_add() subsequently fails, the probe error path tears down the dom=
ain
and nhi_reset_work() may execute from the workqueue concurrently.

At this point, dev_get_drvdata() would return NULL because dev_set_drvdata()
was never reached, leading to a kernel panic when tb->lock is accessed.

> +
> +	scoped_guard(spinlock_irq, &nhi->lock) {
> +		if (nhi->going_away || nhi->removing || nhi->suspended)
> +			return;
> +		if (bitmap_empty(nhi->dma_hops_used, nhi_dma_hops_bits(nhi)))
> +			return;
> +		if (nhi_dma_rings_running(nhi))
> +			return;
> +
> +		/* Keep the DMA rings from starting over the reset */
> +		nhi->resetting =3D true;
> +	}
> +
> +	if (!tb_ctl_stop_if_idle(tb->ctl)) {
> +		scoped_guard(spinlock_irq, &nhi->lock) {
> +			nhi->resetting =3D false;
> +			queue_delayed_work(system_long_wq, &nhi->reset_work,
> +					   msecs_to_jiffies(100));
> +		}
> +		return;
> +	}
> +	nhi_reset_interface(nhi);
> +	tb_ctl_start(tb->ctl);
> +
> +	scoped_guard(spinlock_irq, &nhi->lock) {
> +		bitmap_zero(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
> +		nhi->resetting =3D false;
> +	}
> +}

[Severity: High]
Does this sequence open a race condition that permanently loses the control
channel interrupt?=20

When tb_ctl_start() is called, nhi->resetting is still true. The hardware c=
an
immediately receive a packet and trigger an MSI-X interrupt, which masks the
interrupt and schedules the polling callback.

When the callback processes the packet and calls tb_ring_poll_complete(),
the check for !ring->nhi->resetting will fail because nhi->resetting is only
cleared after tb_ctl_start() returns. This skips the unmasking of the
interrupt and leaves the control channel permanently hung.=20

Should nhi->resetting =3D false be executed before calling tb_ctl_start() to
close this window?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790854235.gi=
t.Basavaraj.Natikar@amd.com?part=3D2
