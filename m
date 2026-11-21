Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795228396;
	b=v8K+Pvphk+Qy8a57L/laDdaeoPuEBPU3W5av4WZr8V9wpT7CCWZbbEaNbp2rHO89cfwf
	 2d9g3+CWO/PfVnXvd3y4pLa4VlP0+thBSVawlmuFXGn19ZS1zQXKhna5dFg/sHk/vU3J4
	 DD/6TkXOlwokONKgV3hQo6FHANmPNrrAmJ0tVjT/6Z9byjMkUKxXqTe853jari9d2DKGV
	 xny4r39mGwqq8HI4tElrNh5lgj4oh/5UjOtHpxJ/nNDPIEomLxNiD58cx8jnMqdBfmpmd
	 gJE6diivy9jULwxgSq20swacC+KIhQNj3b8334MVoTbIpQoG9PynLINUc/7csR+41mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795228396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2CqDxAlqr+dLqUvZ/0PszLYLjunPLKuPZcRbBqrYLUU=;
	b=lbG7/tQPbtsFn3kPvytFzHPpYL0h127Z8TdRaENywjN5O0BrpAYPr12CZY0v/YsnPqoj
	 ngEFRibBUrrZ1gkJV5SkbOKnGM6hVlAOn9ZGqfgqOy0BJ8cAusYNJ12BnwpVDl5fRQGsa
	 ExRlMSVasvL9Psoi9j+prKqWTcfYS8r7fFMVEtQh0qSUwZtsg9Hzrs4XmzbkDElk1OSAA
	 blAJ02Onsxm94W35mD20exHRH3txl4q+HLtwbw/OA69168tH9bXrdKwfU6WIVb0yz+YJP
	 d4FJnf1dUp0IcoDlrFSUgRnrD58xm8sEDjPE1R3yqd/qRvFZJtvq6nufF097Aw1Cn3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fpf82Tx3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15B606A6A6;
	Sat, 21 Nov 2026 02:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fpf82Tx3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DA01F000C6;
	Sat, 21 Nov 2026 02:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795228395;
	bh=2CqDxAlqr+dLqUvZ/0PszLYLjunPLKuPZcRbBqrYLUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fpf82Tx3/JqRa/zy2LUXnoFqUWFfJq37p5tymctqYtr8Tuux0iUSQrR6Uojrd9sRr
	 pM1OJL9wrKCXKB7X8N8TYpTBpbYZo5FmzX+t0OzYq0C33z3u3XFT1mBj0BQaTKZjGc
	 9t93dHdvtAkxT24BE6bpp0iD5igz4DhUNwbQYyu0Nd9P6WeeZPY7OSw9R7vvy+HMHr
	 9z5NoYP1xc/8YRoGOW13Fz8rCIiBP6jRpKPP6tswVGg07Ra72Qpcz64KMa1ef0GP8v
	 iJqXeYc8Y3LNMYZPJnm+Gex3ZdTkQsCpQf46oonPvcLQtVpkb0he/Qhj2XGPRnUudj
	 bxuyCN5GpX46g==
Message-ID: <sashiko-outbox-226546@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] usb: dwc3: select the shared HS data bus with a
 mux controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121022104.1507987-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121022104.1507987-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 02:33:15 +0000
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
- [Medium] usb: dwc3: premature mux deselection before role teardown in
  dwc3_drd_exit()
--

commit c2bf2129dd204f48fafe772bcfa69b9f05541e6c
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: dwc3: select the shared HS data bus with a mux controller

This commit adds support for switching a shared High Speed D+/D- data bus
between two connectors using a mux controller and per-connector USB role
switches.

> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index f3e37d383627a..f14686dee095e 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c

[ ... ]

> @@ -597,6 +914,7 @@ void dwc3_drd_exit(struct dwc3 *dwc)
>  {
>  	unsigned long flags;
> =20
> +	dwc3_role_mux_exit(dwc);
>  	if (dwc->role_sw)
>  		usb_role_switch_unregister(dwc->role_sw);
> =20
> @@ -606,6 +924,9 @@ void dwc3_drd_exit(struct dwc3 *dwc)
> =20
>  	cancel_work_sync(&dwc->drd_work);
> =20
> +	/* The mode worker is drained: no switch can select the mux any more. */
> +	dwc3_role_mux_deselect(dwc);
> +
>  	/* debug user might have changed role, clean based on current role */
>  	switch (dwc->current_dr_role) {
>  	case DWC3_GCTL_PRTCAP_HOST:

[Severity: Medium]
Should dwc3_role_mux_deselect() be called after the
switch (dwc->current_dr_role) block tears down the active host or gadget
instance?

When the mux controller has an idle state other than MUX_IDLE_AS_IS and
the active connector is not the idle port, mux_control_deselect() switches
the High Speed data lines back to the idle state while the host or gadget
instance is still running.  In __dwc3_set_mode(), dwc3_host_exit() or
dwc3_gadget_exit() runs before mux_control_deselect() so the active role
is torn down while its own data lines are still selected.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121022104.1507=
987-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3
