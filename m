Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468388;
	b=I1k0wGM268BAp0gnVxTtBWsi215cyNeg8exJ8eNssYP8oQWQF56B+kds0BfKfMhT8wG/
	 nzGX1tkLvr8TK2Ct4IlNW99KYU34cmf/FA3nmek2JTG8gQPgeWJ/apfra4hb/Cb+S3yxl
	 TfY7zCqRzI+WO/7JZX6ZoSCEu6qZZ3AsT8iisk2hi3Xzp0u1OCpdWpyBplBumIwBqMv5r
	 w5hFO1lKDHUeO0A7+yC6xFF5AzJEvLzBGD47CyK18COsjKUrkikFwfb5luQKKBMLYmqn0
	 rCZLtlrBH/foqcm0aOJOGkfn1XQD0/yN0NcBJIULg/nOv8YQoryqS0bPmbd7Etk+y6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468388;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HGCD6oSKKYRIQ6KUfnMgCRjkobNfTHtyV7hnOsfeKuU=;
	b=wHNGhMjuukHXST1myDnhHuIV9P8bfizlWvcCAWWOnKWkmuYFkbcmO/i5hrEfBLhi6nMe
	 cJqv/zw0S8N5qiqUrPNWH6c6lu03DoC6A3rQgCrMtq3ATeuQQfxZk8GlipP75uyFw/bU5
	 +TZ9uQhVpPUE+OPslyeyFu17+egfSxz8pVuduamo2/6SYFX/CgYD12RBuHGVqipi2wKoS
	 LTV3fvlw9a3vK+cID3jbn1kIRrLpQEprL6J01nIx6ezA6iGdWBJ7OKQHDH6xZLL2JHiEM
	 By5mTQ7HLCWFzlS9c0bNkbFWwO/sc89MJ7KG4yAYn3dyQGX1ikJLtwpYRSGvPfpmaHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp6WnUpp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54879606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp6WnUpp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60411F00A05;
	Thu, 12 Nov 2026 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794468387;
	bh=HGCD6oSKKYRIQ6KUfnMgCRjkobNfTHtyV7hnOsfeKuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gp6WnUppCW06i/Qz4SS7yVWV4d1+1Osi5u5EvafHrcN9Gy0oD7GqFFzTcm6WiKGQI
	 GPOQDaFrNcOSeKiq75weg+FanYgu3dZ01GKT5/VuKdDIzOz58PMKes7b/uY4cR5pCX
	 O0MfdYMfjkMsxugk5cJTpGjLbkjm3tEw7n9TcMSapKE/mkyM1mBFj63qg7krmLG9Ce
	 adUger/8JmJ5khrizx1y06ukF78NKJIHqBjw9u6C4wrR6b9N9K3evUeqb46dvIJRyB
	 HG45HxoGvmQn4J7Gv5Kc/2Zcjq152UqQ9COx8UGZ1Yp4dGVtqhWuLaD3VagyFY01TB
	 MkKcDJVc2uHng==
Message-ID: <sashiko-outbox-210604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usb3503: Propagate resume errors and unwind the
 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112071723.154558-1-zhujun2@cmss.chinamobile.com>
References: <20261112071723.154558-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:26:27 +0000
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
- [Medium] usb: usb3503: unbalanced clk_disable_unprepare() after
  usb3503_resume() error
--

commit 76ce1fbd04c6d5d5b3ad3db2594ab4f0c33cb352
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

usb: usb3503: Propagate resume errors and unwind the clock

This commit checks for errors from clk_prepare_enable() and
usb3503_switch_mode() in usb3503_resume(), disabling and unpreparing
hub->clk if restoring the mode fails.

> diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
> index 9f356b4bd84e3..bcc6174b80d1d 100644
> --- a/drivers/usb/misc/usb3503.c
> +++ b/drivers/usb/misc/usb3503.c
> @@ -353,10 +353,17 @@ static int __maybe_unused usb3503_suspend(struct us=
b3503 *hub)
> =20
>  static int __maybe_unused usb3503_resume(struct usb3503 *hub)
>  {
> -	clk_prepare_enable(hub->clk);
> -	usb3503_switch_mode(hub, hub->mode);
> +	int ret;
> =20
> -	return 0;
> +	ret =3D clk_prepare_enable(hub->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D usb3503_switch_mode(hub, hub->mode);
> +	if (ret)
> +		clk_disable_unprepare(hub->clk);
> +
> +	return ret;
>  }

[Severity: Medium]
Can calling clk_disable_unprepare(hub->clk) on usb3503_switch_mode()
failure cause a clock reference count underflow on the next suspend or
driver removal?

During suspend, usb3503_suspend() disables and unprepares hub->clk.
When device_resume() runs, the PM core clears dev->power.is_suspended and
moves the device back to the active DPM list even if the driver's resume
callback returns an error.  Because usb3503_suspend(),
usb3503_i2c_remove(), and usb3503_platform_remove() all call
clk_disable_unprepare(hub->clk) unconditionally without tracking whether
the clock is enabled, disabling hub->clk here (or failing in
clk_prepare_enable()) causes the next suspend or driver unbind to call
clk_disable_unprepare(hub->clk) on an already disabled clock.

In addition, when usb3503_switch_mode() is called with USB3503_MODE_HUB
and fails inside usb3503_connect(), it has already deasserted hub->reset
and cleared hub->bypass:

drivers/usb/misc/usb3503.c:usb3503_switch_mode() {
	...
	if (hub->reset)
		gpiod_set_value_cansleep(hub->reset, rst);

	if (hub->bypass)
		gpiod_set_value_cansleep(hub->bypass, bypass);

	if (conn) {
		/* Wait T_HUBINIT =3D=3D 4ms for hub logic to stabilize */
		usleep_range(4000, 10000);
		return usb3503_connect(hub);
	}
	...
}

Gating hub->clk without switching the hardware back to standby leaves the
chip out of reset without its reference clock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112071723.1545=
58-1-zhujun2@cmss.chinamobile.com?part=3D1
