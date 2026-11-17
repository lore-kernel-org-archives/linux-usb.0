Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920816;
	b=JsQEVG8c4+p+VCvmQ40WKmxq0i/MttnBK694rTD/Xzvk4Rm17rhjkk4b3WyJ7cW85aeI
	 ybkpsR2zMjyQfkCHakerYGr7QQgJ9m+/C6vmS5XXb9L/Tz6UjImG78buk/v1F2UkZJ1UA
	 VThWRLLMz3ExNeCOXdncgF6YFXm4zVlShqYvIoX+R7wpM1Ce8AQVPvqGV5HDmdwQDnVI8
	 T9V1bsf7kojVNFPLqMbOnL4WkEqruRkN/fqO9sVbYCxFbnYieFOV/cg/MMUmXx1Jtm4a8
	 T4mlJO5GXx+pu3aAh2iu3bAKYdcaNwW3O8tEJ6XvCV9DloQiIxj+5D8lQS+Cjzhn7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IjxB91/jgfpBkuONEhyrjPO7o8U2f+/YheRt9Qp4rSw=;
	b=OSEjkX6Rui2X7D5IeSy3bKpxD36pyloOw2iuhDkHfwEtXZ9aSJmrT5TBj5AFHd7i627S
	 js2FXtUc2tKW7RHF1oF50H7vXcyIHvHojw9T0IFG0Gezp449dyLnvQzA2/C3xl90UO0dW
	 wRlXmV6dbK1k9XARd+P1cz/F2od0xoWx9BFZ//v5k8UzunGYccI2sn1iGScajkzARYS5y
	 0NzS42c2+B6N0LkHmKJp9Nly59oPRQzHDPJ1SdhfA6ReLkmDR26d+snASc6lwVyqJoOMS
	 OniqxF46iUq4sBD3O5kAr7mToh3nbrjSRuY0gPkwzsy7g4Xm6EQZxnV22MhKc/kJK2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgiDzWKO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD1606A333
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgiDzWKO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDDB1F000C4;
	Tue, 17 Nov 2026 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920816;
	bh=IjxB91/jgfpBkuONEhyrjPO7o8U2f+/YheRt9Qp4rSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IgiDzWKOJjFO1c2fSRQ6ytfZksbrsO7tO5ruOmDFCvhhwrUeq5HhHSj/xvIY4L13L
	 /SuxqC9Pb+Iyi4/rKraiP6h5zTlqUN+cX8wHLBLWcCffXBJfStD7IXgsEsEyoSd3yE
	 pk+wVHGzIqwT6gOw0OLppAG3CVTRHzlw4CTBMAZau+OPfZ7g84YW7LXHQ/vKldlmSO
	 igj4LqlfgmOyD6rREQG++2z8NZ/347V7upZXBP4KGn6dH6toEWc2wQhqopUueRgawB
	 Uvhacg1tHFTHxsr8m046FtFO5NTAeLJQtCXvRb2U454jETIDd1UgXKASbL/P1Q20Pr
	 SsWvkI406WUEg==
Message-ID: <sashiko-outbox-218838@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-udc-connect-v3-2-9413b491d213@flipper.net>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-2-9413b491d213@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:06:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: gadget: configfs: stale cdev->deactivations after failed
  bind
--

commit 08b8abaff4ff275aaa5fed522a9a3de79db20527
Author: Alexey Charkov <alchark@flipper.net>

usb: gadget: udc: Forget a deactivation when the gadget driver unbinds

This commit clears gadget->deactivated under connect_lock in the UDC core
upon driver unbind and bind failure, removing the unlocked reset from
configfs_composite_unbind().

> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 577bc15f61a15..449b303c2f813 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1705,6 +1705,11 @@ static int gadget_bind_driver(struct device *dev)
>  		dev_err(&udc->dev, "failed to start %s: %d\n",
>  			driver->function, ret);
> =20
> +	/* The driver may have deactivated the gadget before failing */
> +	mutex_lock(&udc->connect_lock);
> +	gadget->deactivated =3D false;
> +	mutex_unlock(&udc->connect_lock);
> +
>  	mutex_lock(&udc_lock);
>  	udc->driver =3D NULL;
>  	driver->is_bound =3D false;

[Severity: Medium]
Can clearing gadget->deactivated on the err_bind path leave it out of sync
with cdev->deactivations for a configfs gadget?

In configfs_composite_bind() -> usb_add_function(), if a function has
bind_deactivated set (such as f_uvc or f_obex), usb_function_deactivate()
is called before function->bind():

drivers/usb/gadget/composite.c:usb_function_deactivate() {
	...
	if (cdev->deactivations =3D=3D 0) {
		spin_unlock_irqrestore(&cdev->lock, flags);
		status =3D usb_gadget_deactivate(cdev->gadget);
		spin_lock_irqsave(&cdev->lock, flags);
	}
	if (status =3D=3D 0)
		cdev->deactivations++;
	...
}

If function->bind() or a later step in configfs_composite_bind() fails,
driver->bind() returns an error to gadget_bind_driver() and jumps to
err_bind without calling configfs_composite_unbind(), which is the only
place that resets cdev->deactivations =3D 0.  Clearing gadget->deactivated
here leaves gi->cdev.deactivations non-zero on the configfs gadget_info
instance.

When binding the same configfs gadget is retried, usb_function_deactivate()
sees cdev->deactivations !=3D 0 and skips usb_gadget_deactivate(), so the U=
DC
enables pullup before userspace activates the function, and subsequent
usb_function_activate() calls never decrement cdev->deactivations back to
zero.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-udc-connec=
t-v3-0-9413b491d213@flipper.net?part=3D2
