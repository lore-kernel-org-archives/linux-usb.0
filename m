Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544597;
	b=Erj8SPiCf/RlASavTqUoTzU6UnUuKgd2N3SQLMjraM1x8kfnW1op2HzvSC3eh6+F1F9+
	 YZWGTO1BhCiaBFcXrQsq1ecAbKRS7xuAc+AbsjDcLPiDOQNRvcBhor8Gsk7gp8P72Y8P7
	 dzZTaG157BYZcKg7feSUdS/x4Q8bwHKlwqiXGsyzzTGrYbgO5egsMpCpAL1DFkDvjLfM+
	 65bM8wRaSPuM6IFAvQEBj8ZXckX7R+790llWTkV9TCmnOWCswAE6iWNpNF0ok1RvYATGw
	 5V4mygeHOOg8U27GPdb9mkOiuwpIhDwMqbOJPwVGhvZTNfK2SmQAojoMIS2KzaJjo2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ewyB5th9miUU8ahZeEAdLkCD2WgTw+5vGW1rG/kEYaA=;
	b=s3Mi9j0X4+3xgXUWKgdAw4Y/r849J2+82h2BQVBAEV5hMTBTv91giW3gJsChhWrvAlLi
	 Z0jNDbuqeaod2LunC5rp1U7wGLXDA93xVPAYOcPbOIeV+zR41hKQpU8tMqFlHYXVhi2Jw
	 +9nu4TSEBx4Ng+1HkUZl2O8MnpHXjEaEuG44CahOEB1IGSJAV1gk9wgAjieki0K2w7qLu
	 5J9c4OfUFcQHlQ5/A9exMsvqfSXq13k2KWYATz5e4nev2bMjTLYNNNLalFQhZafH0tyds
	 h3R8xueluutQXS8xRj7NokJlfTBh1eqekxNslu2v4jEg0O2fMxR49mR7mHkd4HWv1QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvbTuTww;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0D7606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 01:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvbTuTww
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4BE1F000CA;
	Wed, 21 Oct 2026 01:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544596;
	bh=ewyB5th9miUU8ahZeEAdLkCD2WgTw+5vGW1rG/kEYaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CvbTuTww4mPujgja+3txmOzwKhGVlQlwddLRCn14j3sBQR/Hk+Dj3+3nTAx5xfziD
	 feKGKpLFReV6eDKQmnzPrfN0a+vqzhgvg1O/lX0zmsXXYLEsdbig6YWu3GhSoV2X4C
	 sIDV45JGkCuMCn7aGH0hzAb0lyTti9eR/4uWPNAGTd2ILGNFyuJzPjzUZAzjJr9uYB
	 +eT6ct5yRGBhuvIQX8vhLz/y195E7KjbtgKwolEKdKA4w+6V/HmqZK95WKQRLejcPY
	 sixoFc5MohyB3lKrBJFlE1jCQIYqMnfcbHjV4j98WI4n+ybqlQiYQs0L6zR2A8QLjT
	 /DtWTFPejgyrw==
Message-ID: <sashiko-outbox-179655@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] usb: dwc3: gadget: Reset endpoint flags on
 controller start
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <21cd189962b9d32a4f9df381df4947d35341d5a9.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <21cd189962b9d32a4f9df381df4947d35341d5a9.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 01:03:15 +0000
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
- [High] usb: dwc3: gadget: __dwc3_gadget_start() clears DWC3_EP_ENABLED on=
 active eps
--

commit 4093b4f01f6fe6cc6713a8ff97925d5c1b4491d8
Author: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

usb: dwc3: gadget: Reset endpoint flags on controller start

This commit resets the endpoint flags of all non-control endpoints in
__dwc3_gadget_start(), preserving only DWC3_EP_TXFIFO_RESIZED and
DWC3_EP_RESOURCE_ALLOCATED so stale flags from a pending End Transfer comma=
nd
do not persist across a soft disconnect or error recovery.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index e531adc02a401..a8f12e583a0f4 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2972,6 +2972,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
>  {
>  	struct dwc3_ep		*dep;
>  	int			ret =3D 0;
> +	u32			epnum;
>  	u32			reg;
> =20
>  	/*
> @@ -3029,6 +3030,15 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
>  		return ret;
>  	}
> =20
> +	for (epnum =3D 2; epnum < dwc->num_eps; epnum++) {
> +		dep =3D dwc->eps[epnum];
> +		if (!dep)
> +			continue;
> +
> +		dep->flags &=3D (DWC3_EP_TXFIFO_RESIZED |
> +			       DWC3_EP_RESOURCE_ALLOCATED);
> +	}

[Severity: High]
What happens if __dwc3_gadget_start() is called while non-control endpoints
are still enabled by the gadget driver (dep->endpoint.enabled is true)?

For example, in dwc3_gadget_suspend(), if dwc3_gadget_soft_disconnect() fai=
ls,
dwc3_gadget_soft_connect() -> __dwc3_gadget_start() is called before
dwc3_disconnect_gadget_sleepable() runs:

	ret =3D dwc3_gadget_soft_disconnect(dwc);
	if (ret && dwc->softconnect) {
		dwc3_gadget_soft_connect(dwc);
		return -EAGAIN;
	}

	dwc3_disconnect_gadget_sleepable(dwc);

Similarly, in dwc3_err_recovery_work(), dwc3_gadget_suspend() /
dwc3_gadget_resume(), or dwc3_gadget_pullup(), gadget drivers such as
raw_gadget and gadgetfs defer usb_ep_disable() to userspace rather than
disabling endpoints synchronously during their disconnect callback, so
endpoints can still be enabled when __dwc3_gadget_start() executes.

Clearing DWC3_EP_ENABLED here while dep->endpoint.enabled remains true caus=
es
a subsequent usb_ep_disable() -> dwc3_gadget_ep_disable() call to hit
dev_WARN_ONCE() and return early without calling __dwc3_gadget_ep_disable():

	if (dev_WARN_ONCE(dwc->dev, !(dep->flags & DWC3_EP_ENABLED),
					"%s is already disabled\n",
					dep->name))
		return 0;

	spin_lock_irqsave(&dwc->lock, flags);
	ret =3D __dwc3_gadget_ep_disable(dep);
	spin_unlock_irqrestore(&dwc->lock, flags);

Because __dwc3_gadget_ep_disable() is skipped, dwc3_remove_requests() is not
run and dep->stream_capable, dep->type, dep->endpoint.comp_desc, and
dep->endpoint.desc are not cleared:

	/* Clear out the ep descriptors for non-ep0 */
	if (dep->number > 1) {
		dep->endpoint.comp_desc =3D NULL;
		dep->endpoint.desc =3D NULL;
	}

In drivers/usb/gadget/legacy/raw_gadget.c, raw_ioctl_ep_disable() frees
ep->desc immediately after usb_ep_disable(), which leaves dep->endpoint.desc
as a dangling pointer:

	usb_ep_disable(dev->eps[i].ep);

	spin_lock_irqsave(&dev->lock, flags);
	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
	kfree(dev->eps[i].ep->desc);

Conversely, if the gadget driver calls usb_ep_enable() while ep->enabled is
still true, usb_ep_enable() returns early without calling into dwc3, leaving
DWC3_EP_ENABLED cleared so subsequent usb_ep_queue() calls fail with
-ESHUTDOWN.

Could this regression be avoided if __dwc3_gadget_start() keeps
dep->flags synchronized with dep->endpoint.enabled, or properly cleans up a=
ny
still-enabled endpoints when resetting their flags?

> +
>  	dep =3D dwc->eps[0];
>  	dep->flags =3D 0;
>  	ret =3D __dwc3_gadget_ep_enable(dep, DWC3_DEPCFG_ACTION_INIT);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D6
