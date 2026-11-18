Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007786;
	b=D922n9W5ngH930yXAu9WOFDdz/Fz/4nBuCUE/fVcSOXeE4pRLesxx6cysXckgOfDWRGN
	 0nwyi8Ab8Rf4MPdZnyXPLcfJbz3pj+Z8v8vhCvaZz0ysjuTC5TJC9MqzlXb1iLcti33kY
	 8M8C4ur+V/IMjg7WuJfbjYp2dOLDlvQZao8/SkEOR4RId33QzszIPA/dZ9j1cI1H7xMkS
	 IasnarlGQtlFdaoUOmalP7kQYlJ4Q7YUJ1ceJzBBFRvB8/qbKPOt46HyOnJIOsSR6CYEE
	 ewQGbt1ItXf10HDNf71J/pV6jKE1bj5LrmTOHfGtCPdcsbBVqHiHJoJbOZDGWnD8dEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xSP/fj622JUrPFKME6gDTzJ2Fak7rEJau1TYTSV0zNo=;
	b=UUylp7r9SaufKYHyciN7QWVRD9H8It1Rs6JL+AJleK+Otsv0dhUtfNbhO9MT5l63iMK1
	 jQdZw91EZkUwwk3n83xX7LqejSxBjAvW1nDijysCpUWNcrum1uvLooPuL4kPU7zebxXr6
	 20YRuHToUZClpn8dS0ZyzcnDnm+DXL7m/naXD15tpbBOWbVpnieWFaNOAY+9RoBPm9k0f
	 gZASW4F++bvCbQo4Nptru2CqpsKE7LoPyR8mTIroUaGB6lYtCC2opXuS7ne5VQBrSkJvt
	 7p9/YmhjSXpojWvlreG1ykK4u4MnlDDXfFnZABqfXTkTEoK6DtJLMLr6XtMAaE1+vIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCS8iufu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0E606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCS8iufu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FE81F000C4;
	Wed, 18 Nov 2026 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007786;
	bh=xSP/fj622JUrPFKME6gDTzJ2Fak7rEJau1TYTSV0zNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CCS8iufu/5KCksdwXeF2Hz1HhOLdk8hGR+eXVVXM613D3V16w8PRLsBlxlPTYTtoV
	 Z1kGJgF44qiqzHAc43vtSHrguEsGhAs7E2HqbdIJBDysNWSv0+X41iuVaSpBw3t/gX
	 M16KJzfNTRm+YHXAeVeBN9heIP0VjmzA/y38V/NLkFmvuXYRsZmQNrGEb9oJOYzH8b
	 uu+2Aw8SJQajhlD0HuHiIOW/psTXOWbkqzB0N/XUudIY9w/0gczDzU1qA86EYBReZ5
	 hP8xzd26Tei6PY+3+toygnoJDq/4kpMxAGR15WuRRqIo3b91X5tueSNSI1+/QeWoA8
	 MlzWd6CPXkwSw==
Message-ID: <sashiko-outbox-220991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 2/2] xhci: sideband: check virt device under xhci
 lock when stopping endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118125109.1429538-3-mathias.nyman@linux.intel.com>
References: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
 <20261118125109.1429538-3-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 13:16:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] xhci: sideband: xhci->lock does not serialize against vdev
  free in xhci_resume()
- [Medium] xhci: sideband: dangling ep->sideband on command alloc
  failure in remove path
--

commit f6135bf08870bf887b17f6bcf68cd2206d4462c8
Author: Mathias Nyman <mathias.nyman@linux.intel.com>

xhci: sideband: check virt device under xhci lock when stopping endpoints

This commit moves xhci_stop_endpoint_sync() into xhci-sideband.c as
sideband_stop_endpoint_sync() so that virt device and endpoint checks,
endpoint removal, and stop endpoint command queuing happen under xhci->lock
and sb->mutex.

> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> index ad4849903df3b..39d790bb6a2b2 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -92,19 +92,72 @@ sideband_to_vdev(struct xhci_sideband *sb)
>  }
> =20
>  /* Caller must hold sb->mutex */
> -static void
> -__xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_vi=
rt_ep *ep)
> +static int
> +sideband_stop_endpoint_sync(struct xhci_sideband *sb, u32 ep_index, bool=
 remove)
>  {
> +	struct xhci_virt_device *vdev;
> +	struct xhci_command *cmd;
> +	struct xhci_virt_ep *ep;
> +	struct xhci_ep_ctx *ctx;
> +	unsigned long flags;
> +	bool queued =3D false;
> +	int ret =3D -ENODEV;
> +
>  	lockdep_assert_held(&sb->mutex);
> =20
> -	/*
> -	 * Issue a stop endpoint command when an endpoint is removed.
> -	 * The stop ep cmd handler will handle the ring cleanup.
> -	 */
> -	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
> +	cmd =3D xhci_alloc_command(sb->xhci, true, GFP_KERNEL);
> +	if (!cmd)
> +		return -ENOMEM;

[Severity: Medium]
Does returning -ENOMEM here before clearing sb->eps[ep_index] and
ep->sideband leave a dangling ep->sideband pointer when remove is true?

Previously, __xhci_sideband_remove_endpoint() cleared ep->sideband and
sb->eps[ep->ep_index] even if xhci_alloc_command() failed inside
xhci_stop_endpoint_sync().  With this regression, if xhci_alloc_command()
fails during xhci_sideband_unregister(), the caller ignores the error and
frees sb via kfree(sb) while vdev->eps[i].sideband still points to it.  A
later device reset in xhci_discover_or_reset_device() will then pass that
dangling ep->sideband pointer to xhci_sideband_notify_ep_ring_free(),
causing a use-after-free.

> +
> +	spin_lock_irqsave(&sb->xhci->lock, flags);
> +
> +	vdev =3D sideband_to_vdev(sb);
> +	ep =3D sb->eps[ep_index];
> +
> +	if (remove)
> +		sb->eps[ep_index] =3D NULL;
> +
> +	/* validate xhci didn't free or replace vdev during resume */
> +	if (!vdev || !ep || ep->sideband !=3D sb) {
> +		spin_unlock_irqrestore(&sb->xhci->lock, flags);
> +		goto out;
> +	}
> +
> +	if (remove) {
> +		ep->sideband =3D NULL;
> +		/* endpoint is removed, not running is not an error */
> +		ret =3D 0;
> +	}
> +
> +	/* make sure endpoint is running before stopping it */
> +	if (ep->ring) {
> +		ctx =3D xhci_get_ep_ctx(sb->xhci, vdev->out_ctx, ep_index);
> +		if (GET_EP_CTX_STATE(ctx) =3D=3D EP_STATE_RUNNING) {

[Severity: Medium]
Does holding sb->xhci->lock actually prevent vdev and its contexts from
being freed concurrently during xhci_resume()?

When xhci_resume() resets the host controller, it drops xhci->lock before
freeing all virt devices via xhci_free_virt_devices_depth_first() ->
xhci_free_virt_device().  Inside xhci_free_virt_device(), dev->eps[i].ring
(which is not set to NULL) and dev->out_ctx are freed before
dev->udev->slot_id and xhci->devs[slot_id] are cleared:

drivers/usb/host/xhci-mem.c:xhci_free_virt_device() {
	...
	for (i =3D 0; i < 31; i++) {
		if (dev->eps[i].ring)
			xhci_ring_free(xhci, dev->eps[i].ring);
	...
	if (dev->out_ctx)
		xhci_free_container_ctx(xhci, dev->out_ctx);

	if (dev->udev && dev->udev->slot_id)
		dev->udev->slot_id =3D 0;
	if (dev->rhub_port && dev->rhub_port->slot_id =3D=3D slot_id)
		dev->rhub_port->slot_id =3D 0;
	if (xhci->devs[slot_id] =3D=3D dev)
		xhci->devs[slot_id] =3D NULL;
	kfree(dev);
}

This allows the following race:

CPU0                              CPU1
xhci_resume()
  spin_unlock_irq(&xhci->lock)
  ...
  xhci_free_virt_device()
    xhci_ring_free(..., ring)
    xhci_free_container_ctx(...,
                            out_ctx)
                                  sideband_stop_endpoint_sync()
                                    spin_lock_irqsave(&sb->xhci->lock)
                                    vdev =3D sideband_to_vdev(sb)
                                    if (ep->ring)
                                      ctx =3D xhci_get_ep_ctx(...,
                                                            vdev->out_ctx,
                                                            ...)
                                      GET_EP_CTX_STATE(ctx)
                                        <-- use-after-free
    dev->udev->slot_id =3D 0
    xhci->devs[slot_id] =3D NULL
    kfree(dev)

The same race also applies to xhci_sideband_unregister() clearing
vdev->sideband under xhci->lock while xhci_free_virt_device() runs
kfree(dev) without holding xhci->lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118125109.1429=
538-1-mathias.nyman@linux.intel.com?part=3D2
