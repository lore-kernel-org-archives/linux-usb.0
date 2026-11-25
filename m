Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605523;
	b=W+R/k423xJZJgksXdwYIwUVZUACZX59PgSAYf/P28BYQ8Ym7yrPWezNmxR4NClfDsMH8
	 sKdMUSMyoCZLbrSURVgHuPCmVwmhTFwJ9pN5HDEwlYWjUiw3WFKvsv3T580YJu2JCQSmq
	 0zmyg7XBx3MWMZoySWop7ZH8X66/B3z4ZUvg+slEONFcqIqKSrZA4M0/hEfDYVRo8qJSu
	 t99D0zZuqhz1mxNL7nEHJYuQ6prrCHOKFW7lNFQZAcJPvlOtgI0bYrf21pahGnXq+tMVO
	 E38KClxdSo4L0O+HM1w626Um4uYCFPPZrgA1Y+0V8w8AYj4oTLG5FM/NkCYXBUiwmfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r6O8dJVsYLljgBfYqT4oGFHh7hjMjqpqjznuXupS+/M=;
	b=ClpkwBvCNVyvMG8oglkJem6oEQ7zVtHXk4nloRZDfN2N6AAhT8ye8lf0gUnK8+rCF3cc
	 7XtzPwrKwRrubaKU9fDXS6A8cIRDBWqcVOh/zhzdJtlIfFhqTQaRQtPBQU+BDlJPFyVDv
	 Hoq6RWLRUp35bILshF4+kXqyt78KjL9oq48vY+HKuOmtZOo/uC5ZEpKPveKOZw254EsJp
	 BvBZ61g4uSKBuYf7nzmKDwslqdfpYjWkOsCdDihIjncpcMix4lCBgHHxS2SVTe+1nY4IH
	 1G2D3MCv/3285ps9e3CgusEpVTHW+/wLXtS0DEfz/kd0ai+pyt4bDtJP4W4KSuXKhTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA426n3x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E4606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA426n3x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178A01F000C6;
	Wed, 25 Nov 2026 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605523;
	bh=r6O8dJVsYLljgBfYqT4oGFHh7hjMjqpqjznuXupS+/M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LA426n3xZ48D+/wCcTlxK2dZrRae45K4Aj7bBuNo8RXsxJs33bB9AlS5ekqaDHUNr
	 VPyEeu1NHEKXpx3OI5KZipYixqyoDgnGAAqPbrmyqPBt0xbtS1D9EDDFJQDswik9Zb
	 vSV2c3zTGu2+DFK7c/Bx7y9dSSK7Qsi/iHOBMgUmU18Q1ONbgkK78pnxdUd6IworV2
	 Jatk0TQuC6eKlfjxYJ6rucTwuCHci5u5AJ+7rSVrn+zkpICJJQ2XQGcWIIx7fPrRo5
	 n4Pt8mSHrB5QCp+1w70lfub0Yr3CJr9W10Z2aX7A8WokE5g8oRgXu0B/PhHVBZXRqO
	 pZvovTvJo3w5A==
Message-ID: <sashiko-outbox-233215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-2-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
 <20261125-topic-tcpm-qcom-fixes-v2-2-6fede9a69f6f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:18:42 +0000
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
- [High] usb: typec: qcom: NULL deref in tcpm_vbus_change() on shutdown
  with VBUS on
- [Medium] usb: typec: qcom: missing port_disable() on
  qcom_pmic_typec_probe() error path
--

commit 274682eb5898a80edc0745dc8284b7d6afe1aba6
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: qcom-pmic-typec: detach the port on shutdown

This commit adds a platform driver shutdown callback that stops the PD PHY
and Type-C port, unregisters the TCPM port, and disables the Type-C block,
and also calls port_disable() on driver removal.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/=
typec/tcpm/qcom/qcom_pmic_typec.c
> index 58d1e6aae637d..be7508936796e 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -132,6 +132,17 @@ static void qcom_pmic_typec_remove(struct platform_d=
evice *pdev)
>  	tcpm->port_stop(tcpm);
>  	tcpm_unregister_port(tcpm->tcpm_port);
>  	fwnode_handle_put(tcpm->tcpc.fwnode);
> +	tcpm->port_disable(tcpm);
> +}

[Severity: Medium]
Should the error unwind path in qcom_pmic_typec_probe() also call
tcpm->port_disable(tcpm)?

tcpm_register_port() (via qcom_pmic_typec_port_start_toggling()) and
tcpm->port_start() write an active role mode to TYPEC_MODE_CFG_REG.  If a
later step in qcom_pmic_typec_probe() such as tcpm->pdphy_start() or
devm_drm_dp_hpd_bridge_add() fails, the error path unregisters the port
without disabling it, leaving Rp or Rd presented on CC with no driver bound.

> +
> +static void qcom_pmic_typec_shutdown(struct platform_device *pdev)
> +{
> +	struct pmic_typec *tcpm =3D platform_get_drvdata(pdev);
> +
> +	tcpm->pdphy_stop(tcpm);
> +	tcpm->port_stop(tcpm);
> +	tcpm_unregister_port(tcpm->tcpm_port);
> +	tcpm->port_disable(tcpm);
>  }

[Severity: High]
Can calling tcpm_unregister_port() here cause a NULL pointer dereference in
tcpm_vbus_change() when shutting down with an attached sink partner?

tcpm_unregister_port() destroys port->wq and sets port->wq =3D NULL before
calling tcpm_reset_port() -> tcpm_init_vbus() ->
qcom_pmic_typec_port_set_vbus(..., false, false).  When VBUS was enabled,
qcom_pmic_typec_port_set_vbus() turns the regulator off and notifies TCPM:

drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c:qcom_pmic_typec_port_set=
_vbus() {
	...
	ret =3D qcom_pmic_typec_port_vbus_toggle(pmic_typec_port, on);
	if (ret)
		goto done;

	pmic_typec_port->vbus_enabled =3D on;
	tcpm_vbus_change(tcpm->tcpm_port);
	...
}

tcpm_vbus_change() then calls kthread_queue_work(port->wq, &port->event_wor=
k)
with port->wq =3D=3D NULL, crashing in raw_spin_lock_irqsave(&worker->lock)
before tcpm->port_disable(tcpm) is reached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-tcpm=
-qcom-fixes-v2-0-6fede9a69f6f@linaro.org?part=3D2
