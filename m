Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013537;
	b=Dm5tSQ0QXIJifsojbWA7nC82nKolCGwXiJ1ImmR3NzHO00kGADnBIYLZjxgpZ0ocYxBc
	 LlPAayuVdRk32MQtZ8BXsu40NUw8nxSecCvrWLtXmaqoHuSgHNTEa63OxVKYSjM9xRoYA
	 Kl7+GHOrlDBEQ41cH+TlIDKwld5kbuo6al4xUivB3eyPROUsOxYcuQgcjZ+q6JyK3IjeO
	 +JJxYt4HKyjCuLK3aQ9GblRd18vPxEaQKruywc023exUWXjU2iCHjyV6AoQNcFwAooH+u
	 nJ6N/s/orVhBr276vDXM91RAR+RVpCTXHriGGHhvFKPpP8+wXQjMT7O+9r6o0zq3Bug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mEYnBRzX3R9uLOaPiEYecj19Gq4QUtCbeMi5FN5+Txs=;
	b=yBhhlilfahMtzxP5HdiXhVP+gNye/HoHkE8SD1Lq+GdFje56DaxsLxAHptBZ1aCjYG/0
	 3sWH0LsZx2rA4ubraDoMB9V7Di4xXY3amzbnc7haGgPMiAGRj0Xjw3g6f88I1Q4VZYDkB
	 iPW0w7sOl9+LMGEK1+MDyeaX7YnPPgchJiAw9eoGZ5rI07a9YCRF3fFFPHipLFPKZ/NDZ
	 PfZ14NMO86xKxi/y2MPTcPfCVtPi8/eXwSDrn8fP5GQ7c8sUwj+650hji8UPbvx5eumMY
	 olsYFPaScIwp8sxTJAQkcrlelxwpiriJJ0/NG65Y5JRKYqzPVgpCOi358bxn9Yxwcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMVEYEos;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57858606A322
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EMVEYEos
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A411F01825;
	Mon, 26 Oct 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793013536;
	bh=mEYnBRzX3R9uLOaPiEYecj19Gq4QUtCbeMi5FN5+Txs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EMVEYEosmAACno1m2BnBfrbLuC7wfQY16j+km9Ko06L1i9+8rEpbOQDcdpHHKBmCU
	 mYZkZnSP3cAM5FljDvNuHYklKr4rJ4q1VD2nSV/dN12q/JYfllCLomIEJlxPWlYsa3
	 P40GJSUkFf8PmMQrG0cSvtKX/p9cebndImOILn1DwpV8x+Uu14Lxy2gNVvwUeC2Pgq
	 6LQyzncbVsj7WuNmzvzl0xP4kulGdKYkl/UHrZt2cwYYdvtg5KVAP0rJG2SGwQ3Xcs
	 yPAx8CcnrtqaJZ5KIZv12PLbZ4dvjkzUwA6+712xnp5p9B45BF7g0JoJsUemPgyVTh
	 9FknKEQxROfkw==
Message-ID: <sashiko-outbox-185085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026105203.1250-1-25031212351@stu.xidian.edu.cn>
References: <20261026105203.1250-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 11:18:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: xhci: TOCTOU race on virt_dev->udev in xhci_stop_device()
--

commit 8ca23763bf2babc34d266f80e2a0ad16a5640afa
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb: xhci: Fix use-after-free race in xhci_stop_device()

This commit fixes a use-after-free race in xhci_stop_device() where a
concurrent usb_disconnect() -> xhci_free_dev() frees virt_dev while
xhci_stop_device() sleeps in xhci_alloc_command(). It re-checks
xhci->devs[slot_id] after acquiring xhci->lock and moves
trace_xhci_stop_device() under the lock with a virt_dev->udev check.

> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 470bafe1802be..828cf347bd32d 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -467,13 +467,31 @@ static int xhci_stop_device(struct xhci_hcd *xhci, =
int slot_id, int suspend)
>  	if (!virt_dev)
>  		return -ENODEV;
> =20
> -	trace_xhci_stop_device(virt_dev);
> -
>  	cmd =3D xhci_alloc_command(xhci, true, GFP_NOIO);
>  	if (!cmd)
>  		return -ENOMEM;
> =20
>  	spin_lock_irqsave(&xhci->lock, flags);
> +
> +	/*
> +	 * Callers drop xhci->lock before calling us and allocating cmd
> +	 * above can sleep, so xhci_free_dev() may have freed the device in
> +	 * the meantime.  The device is detached from xhci->devs[slot_id]
> +	 * under xhci->lock before it is freed, so re-check under the lock
> +	 * that this slot still points to it.  The device cannot be freed
> +	 * while xhci->lock is held, and virt_dev is not used after the
> +	 * lock is dropped below.
> +	 */
> +	if (xhci->devs[slot_id] !=3D virt_dev) {
> +		spin_unlock_irqrestore(&xhci->lock, flags);
> +		xhci_free_command(xhci, cmd);
> +		return -ENODEV;
> +	}
> +
> +	/* xhci_free_dev() may already have cleared udev without the lock */
> +	if (virt_dev->udev)
> +		trace_xhci_stop_device(virt_dev);

[Severity: High]
Can trace_xhci_stop_device() still dereference a NULL virt_dev->udev pointer
here when racing with usb_disconnect() -> xhci_free_dev()?

In drivers/usb/host/xhci.c, xhci_free_dev() clears virt_dev->udev without
holding xhci->lock before calling xhci_disable_slot() and
xhci_free_virt_device():

    for (i =3D 0; i < 31; i++)
        virt_dev->eps[i].ep_state &=3D ~EP_STOP_CMD_PENDING;
    virt_dev->udev =3D NULL;
    xhci_disable_slot(xhci, udev->slot_id);

    spin_lock_irqsave(&xhci->lock, flags);
    xhci_free_virt_device(xhci, virt_dev, udev->slot_id);
    spin_unlock_irqrestore(&xhci->lock, flags);

Because xhci_free_dev() does not hold xhci->lock when setting
virt_dev->udev =3D NULL, checking if (virt_dev->udev) under xhci->lock in
xhci_stop_device() does not synchronize with that store.

When the tracepoint is enabled, trace_xhci_stop_device(virt_dev) invokes the
xhci_log_virt_dev trace event class in drivers/usb/host/xhci-trace.h, which
reloads vdev->udev from memory inside TP_fast_assign:

    TP_fast_assign(
        __entry->vdev =3D vdev;
        __entry->in_ctx =3D (unsigned long long) vdev->in_ctx->dma;
        __entry->out_ctx =3D (unsigned long long) vdev->out_ctx->dma;
        __entry->devnum =3D vdev->udev->devnum;
        __entry->state =3D vdev->udev->state;
        __entry->speed =3D vdev->udev->speed;
        __entry->portnum =3D vdev->udev->portnum;
        __entry->level =3D vdev->udev->level;
        __entry->slot_id =3D vdev->udev->slot_id;
    ),

If xhci_free_dev() clears virt_dev->udev on another CPU between the
if (virt_dev->udev) check in xhci_stop_device() and the reload in
TP_fast_assign, won't trace_xhci_stop_device() dereference NULL while
holding xhci->lock with interrupts disabled?

Additionally, if virt_dev->udev is already NULL when xhci_stop_device()
checks it, xhci_free_dev() has already started tearing down the device and
is disabling the slot in xhci_disable_slot(). Should xhci_free_dev() clear
virt_dev->udev under xhci->lock, and should xhci_stop_device() bail out with
-ENODEV when !virt_dev->udev rather than continuing to queue stop-endpoint
commands for a slot being disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026105203.1250=
-1-25031212351@stu.xidian.edu.cn?part=3D1
