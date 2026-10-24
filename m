Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792870112;
	b=4EJToYwUL1D+zj3GVKA3xNb96/OmVoZX4kGiN7oqsZzsfgZp7nNZiWjnWEUcZIcIwdZR
	 a5IRaiH2RCm47kLYHFB9VARQiwJ1J4qwrUteNUYef9vTne9NKf7jPebD5Eedxdj2X3vxo
	 LxFkWZDNom6Bm2sExBo9LFoF5VTCYtwWYyJDbLOkAEDyvvLw2v9fUEfLWSlsM+YOQEvf1
	 54nqCQ1hGDeljfgO+tAGIoEyLV9QzQqT+oOh8yFSs8MjUQkOKu7A11zmlDe1Rnjyo3Dgg
	 Fa0D4shU3CjNbrbnujX7TgKoNbvuhTiOHi3iIqIf8Z3Ql42GKr/SX4Yq3ogYALE4x2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792870112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RZ7qrjH4ow5M3PF9iwnzpavqU88Yy/eIIDJQjnRtFrk=;
	b=29pqyP20HLGsss7o8Jr+F4qNUwVg5XFpOr1AY9g/pCbP2uOHs4rGRDJi5iOWBvlHqVIR
	 hwklyRLCZeQCd0+rdk1Mnm9Er/HRNZKXPGhbVnvcpF8gmoMg9Uz35p7AqYyecqFBTVPTT
	 nEFN6XU6nB13Bg7pxWF8ox3X0NZt3rK469g0RV113fHmQ3CLL1Ko7OedIdgNX8BmCf1SB
	 CjuNxWFWw0McoKKwVigjIi+DTp4HCegJRzq5u8BaKfrXKLuykBpeFZqIaCbrsGt+T6Rra
	 JJsHKWZkaFAbYjwNXsGfduoKSFkz4HLnRkFGaODOGObiiS1jpA9IeAJKY1eZMn7qlBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YK9M0P4p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A481C606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 19:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YK9M0P4p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7321F01825;
	Sat, 24 Oct 2026 19:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792870111;
	bh=RZ7qrjH4ow5M3PF9iwnzpavqU88Yy/eIIDJQjnRtFrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YK9M0P4pXOsIV6Z1AUeXGWceh6QWySxIF4xlKVC4EFPJkwWFYfP7KPAIEG7lyVc7S
	 5XCbSeRGB+BcqkAXZdjOdtl3ynOi10GKsOQHPE7XDLLTF0wG1MyKA039SiuGBBFUhO
	 ctlLe0+4AE0WkXCWPqIYHE3kRxv4StyVyE5rGHVTzQUZl2eIXXy8DP/melXmMfX+Fj
	 JUBy85H9NdBqJCJDiCSVk29PDf2sobAKp3/s5UKegbIx88eRT0foMGdTr5VvGk6xW5
	 w/iFmpkigc4HnbRuQUTtfUItckqeqwqqsXuO5kYnVvzhIwWmqQPrPpWij4+jQlAE5H
	 7BZflvMk8WqcQ==
Message-ID: <sashiko-outbox-183856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: raw-gadget: fix double-free race during UDC
 unbind and rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Putko" <igorpetindev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024190758.2526-1-igorpetindev@gmail.com>
References: <20261024183727.42339-1-igorpetindev@gmail.com>
 <20261024190758.2526-1-igorpetindev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 19:28:30 +0000
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
- [Critical] usb: raw-gadget: unlocked endpoint teardown in gadget_unbind()=
 causes UAF
--

commit 7b3966f708938c8c77f1729ecbafe22aa581cd3b
Author: Igor Putko <igorpetindev@gmail.com>

usb: raw-gadget: fix double-free race during UDC unbind and rebind

This patch moves active endpoint disabling, request freeing, and descriptor
cleanup into gadget_unbind(), and stores the endpoint descriptor pointer in
struct raw_ep to prevent a double-free race when a UDC is unbound and rebou=
nd
to a new raw_gadget instance.

> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca5..a6b42679acc74 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
[ ... ]
> @@ -328,6 +331,20 @@ static int gadget_bind(struct usb_gadget *gadget,
>  static void gadget_unbind(struct usb_gadget *gadget)
>  {
>  	struct raw_dev *dev =3D get_gadget_data(gadget);
> +	int i;
> +
> +	if (dev) {
> +		for (i =3D 0; i < dev->eps_num; i++) {
> +			if (dev->eps[i].state =3D=3D STATE_EP_DISABLED)
> +				continue;
> +			usb_ep_disable(dev->eps[i].ep);
> +			usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> +			kfree(dev->eps[i].desc);
> +			dev->eps[i].desc =3D NULL;
> +			dev->eps[i].ep->desc =3D NULL;
> +			dev->eps[i].state =3D STATE_EP_DISABLED;
> +		}
> +	}

[Severity: Critical]
Can tearing down endpoints here without holding dev->lock or coordinating
with in-flight ioctls cause use-after-free and double-free regressions when
gadget_unbind() is called while /dev/raw-gadget is still open (for example,
via sysfs driver unbind or UDC removal)?

Specifically, it looks like several races can occur in
drivers/usb/gadget/legacy/raw_gadget.c:

1. In raw_ioctl_ep_disable(), dev->lock is dropped around usb_ep_disable()
while dev->eps[i].state is still STATE_EP_ENABLED:

    dev->eps[i].disabling =3D true;
    spin_unlock_irqrestore(&dev->lock, flags);

    usb_ep_disable(dev->eps[i].ep);

    spin_lock_irqsave(&dev->lock, flags);
    usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
    kfree(dev->eps[i].desc);

If gadget_unbind() runs concurrently, it does not check dev->eps[i].disabli=
ng
or take dev->lock, so both paths can free dev->eps[i].req and
dev->eps[i].desc.

2. In raw_process_ep_io(), dev->lock is dropped with ep->urb_queued =3D true
before calling usb_ep_queue(ep->ep, ep->req, GFP_KERNEL) and
usb_ep_dequeue(ep->ep, ep->req). If gadget_unbind() runs concurrently and
calls usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req), wouldn't
raw_process_ep_io() pass a freed ep->req to usb_ep_queue() or
usb_ep_dequeue()?

3. Because gadget_unbind() frees and clears dev->eps[i].desc before setting
dev->eps[i].state =3D STATE_EP_DISABLED without holding dev->lock (and
raw_ioctl_ep_enable() sets ep->state =3D STATE_EP_ENABLED before
ep->desc =3D desc), a concurrent raw_process_ep_io() or
raw_ioctl_ep_set_clear_halt_wedge() holding dev->lock can observe
STATE_EP_ENABLED while ep->desc is already freed or NULL in
usb_endpoint_dir_in(ep->desc) or usb_endpoint_xfer_isoc(dev->eps[i].desc).

4. Since gadget_unbind() resets dev->eps[i].state =3D STATE_EP_DISABLED whi=
le
leaving dev->state as STATE_DEV_RUNNING and dev->gadget non-NULL, can a
subsequent raw_ioctl_ep_enable() on the open file descriptor re-enable
endpoints on the unbound UDC, leaving them to be torn down later in
dev_free() after a new instance has bound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024190758.2526=
-1-igorpetindev@gmail.com?part=3D1
