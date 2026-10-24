Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792867701;
	b=vZ5ySns6uuLhWsY6Q2+3J//lw3czvO9ddGnwSvh5+fzMCfii5jCkcj7cOdjkz/CPXTEY
	 LpBcyVV0hdLSrE+KxVq/5z4Z5LYq9gtcmDoKl7M8qIAXLMPZ04Gz00nOhKBpsEGAnWOxF
	 +jmVCcDqkwyjoOL1NJL3oOc3lRMqRd4OIAme7WEPHo+/iFBUH6w4VOVA0F2WelFnCf1jr
	 KNHJR3P2TIfN4IHSZG86y1O2ibHwa3j3QSfkPyJFo3jXnpC9XDt4A45Uwpzk5uDkoHC+Q
	 4Fgv+q8OX4d6zQb/zsyOxFxZuelB6lnkCPqQvjaiwhndoVDERkUvRZkR7L+sGIHbMTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792867701;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OKw51iNopvh5JLwFKNZ12ETsSFFvkprTVJQDs7jZFco=;
	b=ECLR5GfgBE9/L9Rr4HyXKvevBGn/a73mHdtKO1Dqh/42Gl6prYUinEY5jLnxEcQNpmaf
	 dTPeouE/k55DD+dfTBejAUkuKnQvlij0oN468VhxeQG3meGOcdyPZB3gujuMXtypEu9R0
	 HR0Vb6Xw9fZQKYHag3xS3zOlMehm9Q/dBFuS9wvmXkdPQbNbeh00J1a5LaeS+PgXTZe5c
	 lw2CXiyBLhp3V1pX6o6BH2K1akZ4+6/2NZFd9mP4sBMopXHbh7KY4CiwV/KtEBWN+3vOp
	 msQqd1ZEa2VqnyJHeeY7RYGBCNv5EWOKrsXOjTGzKeup4QAkWApSWUmcNsHAUbat4Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="F/kwtJhr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC3C606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F/kwtJhr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C801F01825;
	Sat, 24 Oct 2026 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792867701;
	bh=OKw51iNopvh5JLwFKNZ12ETsSFFvkprTVJQDs7jZFco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/kwtJhr95y2MJYm3F90pOrqmRSErRH6j2HThOaoLaxmvpmcm07+OmyDxiHrPFl5/
	 8n1IT9QRXZNO4j+kRLmFBVWdEFf4pu9iRyW4C7f1SrjNL5cV81imI3aiDo8eDHsnpb
	 sRacXIp/MWA/7DpAGlsO/h3KtTxWK08muPK/8/0JcUhiwLJDFr84+FVHfvS5jyMXz6
	 CA0U5qG2X3+b9AwL9QnFxw53LcBa0oGy3YsYYfiCoWU4NXfP3BqVhcrz3aB7K4xEeF
	 PAU8b3sTk59UTgYUjGN4HfitGIeZ3s0OFQdbWTPcyGWa4xB1yai/pct4DmXnNHDnB2
	 g3/IJJgA3nVRw==
Message-ID: <sashiko-outbox-183840@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: raw-gadget: fix double-free race during UDC unbind
 and rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Putko" <igorpetindev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024183727.42339-1-igorpetindev@gmail.com>
References: <20261024183727.42339-1-igorpetindev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 18:48:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] usb: raw-gadget: deadlock and use-after-free in gadget_unbind(=
) ep0 cleanup
- [Critical] usb: raw-gadget: race between gadget_unbind() and endpoint ioc=
tls
- [Low] usb: raw-gadget: unreachable dev->req cleanup left in dev_free()
--

commit a0840cd47b22c347c5350236b13bd1cde724c788
Author: Igor Putko <igorpetindev@gmail.com>

usb: raw-gadget: fix double-free race during UDC unbind and rebind

This patch moves endpoint disabling, request freeing, and descriptor cleanup
from dev_free() into gadget_unbind() so that UDC endpoints are torn down
synchronously before the UDC can be rebound. It also stores the endpoint
descriptor pointer in struct raw_ep and frees the ep0 request on error in
gadget_bind().

> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca5..379351a010f82 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
[ ... ]
> @@ -218,14 +218,6 @@ static void dev_free(struct kref *kref)
>  		usb_ep_free_request(dev->gadget->ep0, dev->req);
>  	}

[Severity: Low]
Is the dev->req cleanup in dev_free() still reachable after this change?

dev->req is only allocated in gadget_bind(). If gadget_bind() fails after
setting dev->req, the new error path frees the request and sets dev->req to
NULL. If gadget_bind() succeeds, it takes a reference via
kref_get(&dev->count) that is only dropped in gadget_unbind(), which now al=
so
frees dev->req and sets both dev->req and dev->gadget to NULL before calling
kref_put().

Should the remaining if (dev->req) block in dev_free() be removed as well?

>  	raw_event_queue_destroy(&dev->queue);
> -	for (i =3D 0; i < dev->eps_num; i++) {
> -		if (dev->eps[i].state =3D=3D STATE_EP_DISABLED)
> -			continue;
> -		usb_ep_disable(dev->eps[i].ep);
> -		usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> -		kfree(dev->eps[i].ep->desc);
> -		dev->eps[i].state =3D STATE_EP_DISABLED;
> -	}
>  	kfree(dev);
>  }
[ ... ]
> @@ -328,6 +326,43 @@ static int gadget_bind(struct usb_gadget *gadget,
>  static void gadget_unbind(struct usb_gadget *gadget)
>  {
>  	struct raw_dev *dev =3D get_gadget_data(gadget);
> +	int i;
> +	unsigned long flags;
> +
> +	if (!dev)
> +		return;
> +
> +	for (i =3D 0; i < dev->eps_num; i++) {
> +		struct raw_ep *ep =3D &dev->eps[i];
> +
> +		spin_lock_irqsave(&dev->lock, flags);
> +		if (ep->state =3D=3D STATE_EP_DISABLED) {
> +			spin_unlock_irqrestore(&dev->lock, flags);
> +			continue;
> +		}
> +		ep->state =3D STATE_EP_DISABLED;
> +		spin_unlock_irqrestore(&dev->lock, flags);
> +
> +		usb_ep_disable(ep->ep);
> +
> +		spin_lock_irqsave(&dev->lock, flags);
> +		usb_ep_free_request(ep->ep, ep->req);
> +		kfree(ep->desc);
> +		ep->desc =3D NULL;
> +		ep->ep->desc =3D NULL;
> +		spin_unlock_irqrestore(&dev->lock, flags);
> +	}

[Severity: Critical]
Can moving endpoint teardown into gadget_unbind() race with concurrent
endpoint ioctls when the UDC is unbound while the raw-gadget file descriptor
is still open (for example via sysfs unbind or usb_del_gadget())?

There appear to be three races with active ioctl calls:

1. In raw_ioctl_ep_disable(), dev->lock is dropped with state still set to
STATE_EP_ENABLED and disabling set to true:

drivers/usb/gadget/legacy/raw_gadget.c:raw_ioctl_ep_disable() {
	...
	dev->eps[i].disabling =3D true;
	spin_unlock_irqrestore(&dev->lock, flags);

	usb_ep_disable(dev->eps[i].ep);

	spin_lock_irqsave(&dev->lock, flags);
	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
	...
}

Because gadget_unbind() only checks ep->state =3D=3D STATE_EP_DISABLED and =
does
not check ep->disabling, won't both gadget_unbind() and
raw_ioctl_ep_disable() call usb_ep_free_request(ep->ep, ep->req) on the same
request?

2. In raw_process_ep_io(), dev->lock is dropped with ep->urb_queued set to
true before queueing or waiting on ep->req:

drivers/usb/gadget/legacy/raw_gadget.c:raw_process_ep_io() {
	...
	ep->urb_queued =3D true;
	spin_unlock_irqrestore(&dev->lock, flags);

	ret =3D usb_ep_queue(ep->ep, ep->req, GFP_KERNEL);
	if (ret) {
		dev_err(&dev->gadget->dev,
				"fail, usb_ep_queue returned %d\n", ret);
		...
	}

	ret =3D wait_for_completion_interruptible(&done);
	if (ret) {
		dev_dbg(&dev->gadget->dev, "wait interrupted\n");
		usb_ep_dequeue(ep->ep, ep->req);
		...
}

Because gadget_unbind() does not check or wait for ep->urb_queued before
freeing ep->req and clearing dev->gadget, can raw_process_ep_io() pass a
freed ep->req to usb_ep_queue() or usb_ep_dequeue(), and dereference a NULL
dev->gadget in dev_err() or dev_dbg()?

3. While gadget_unbind() drops dev->lock around usb_ep_disable(ep->ep),
dev->state is still STATE_DEV_RUNNING, dev->gadget is still non-NULL, and
ep->state has just been set to STATE_EP_DISABLED. If raw_ioctl_ep_enable()
runs during that window, it can re-enable the current endpoint (causing
gadget_unbind() to immediately free the newly allocated ep->req and ep->desc
while leaving ep->state as STATE_EP_ENABLED) or enable an earlier endpoint i
that gadget_unbind() already passed (leaking the new ep->req and ep->desc a=
nd
leaving a dangling ep->ep->desc on the UDC endpoint once dev->eps_num is set
to 0).

> +
> +	spin_lock_irqsave(&dev->lock, flags);
> +	if (dev->req) {
> +		if (dev->ep0_urb_queued)
> +			usb_ep_dequeue(dev->gadget->ep0, dev->req);
> +		usb_ep_free_request(dev->gadget->ep0, dev->req);
> +		dev->req =3D NULL;
> +	}
> +	dev->gadget =3D NULL;
> +	dev->eps_num =3D 0;
> +	spin_unlock_irqrestore(&dev->lock, flags);

[Severity: Critical]
Does this ep0 teardown in gadget_unbind() risk a deadlock and use-after-free
when an ep0 transfer is in flight in raw_process_ep0_io()?

First, gadget_unbind() calls usb_ep_dequeue(dev->gadget->ep0, dev->req) whi=
le
holding dev->lock. For UDC drivers that give back dequeued requests
synchronously inside their dequeue callback, such as
dummy_dequeue()->dummy_giveback()->usb_gadget_giveback_request(), the
completion handler gadget_ep0_complete() is invoked on the same CPU:

drivers/usb/gadget/legacy/raw_gadget.c:gadget_ep0_complete() {
	struct raw_dev *dev =3D req->context;
	unsigned long flags;

	spin_lock_irqsave(&dev->lock, flags);
	...
}

Won't gadget_ep0_complete() deadlock trying to acquire dev->lock while
gadget_unbind() already holds it?

Second, for UDC drivers where usb_ep_dequeue() completes asynchronously,
gadget_unbind() immediately calls usb_ep_free_request(dev->gadget->ep0,
dev->req) without waiting for dev->ep0_done, which frees dev->req while the
UDC still owns the request.

Third, dev->ep0_urb_queued is only set while raw_process_ep0_io() has dropp=
ed
dev->lock:

drivers/usb/gadget/legacy/raw_gadget.c:raw_process_ep0_io() {
	...
	dev->ep0_urb_queued =3D true;
	spin_unlock_irqrestore(&dev->lock, flags);

	ret =3D usb_ep_queue(dev->gadget->ep0, dev->req, GFP_KERNEL);
	if (ret) {
		dev_err(&dev->gadget->dev,
				"fail, usb_ep_queue returned %d\n", ret);
		spin_lock_irqsave(&dev->lock, flags);
		goto out_queue_failed;
	}

	ret =3D wait_for_completion_interruptible(&dev->ep0_done);
	if (ret) {
		dev_dbg(&dev->gadget->dev, "wait interrupted\n");
		usb_ep_dequeue(dev->gadget->ep0, dev->req);
		wait_for_completion(&dev->ep0_done);
	...
}

If gadget_unbind() runs concurrently, frees dev->req, and sets dev->req and
dev->gadget to NULL, won't raw_process_ep0_io() dereference a NULL
dev->gadget and pass a freed or NULL dev->req to usb_ep_queue() or
usb_ep_dequeue()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024183727.4233=
9-1-igorpetindev@gmail.com?part=3D1
