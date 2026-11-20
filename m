Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169704;
	b=WrtSA42DKiq4tO0v2FsYLTSqjI0m3FraUTtok87s0pSa/ihplpfIFe3+88YrVJGMvBKN
	 f4yeSdC0X5I2b4e2cSzg7BeO7LrC27t79K1Uhbw6+cTL9cNw/oiukZFvykRve8tPvJDup
	 kZ3pO/I5bAQYSTqhU0ZWQ7a2C63E5myZOLjoitGmxPpxUtyihPsGYxP7FNOFSG4gnpO5z
	 fg4nx7TlknMU+K449z1nKLiQaa4iP1+cpEhTysmrBc3FqjOk+Xe7KASLqSz0eHJZWCXhj
	 QI3L97Wgx43j7YuAJd0g8frxIHDZrXIcJKJzqV/zESkimNtrhmzxzlsPiBp2c9ECQ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169704;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HDpKkpiaXn+PLfXK9545WDKPH5VX/aVILAl9nmxP7Fo=;
	b=PI21gKFQN3ciDInyaHpoSVhf0jNQc/VceFopnwiB7XDonysb11LsOJtcHUb2vr80D+w9
	 MW88AYALQL/Akee5mJbqaDHw3UysfterA7FBr9IoPURItHzpoLL34u7LMqY4HuCjbI/Xd
	 JbnV2S1jYnh35WqlHxhmH/HLrCtpSJS9oyoDvnWXfnZDdANKGXkHK+Q3nfYJj+Z0QX5xE
	 c2W669tV5vu3IUcyo5P1H79iIOop4TZKIWM7d0vEVhp3ntwlkr3rjCWUITImpGB5pUwi3
	 dyvkam7A9mSag28qBazfcQeynt/p1PEoTpT28ERmJEmMVl+9BFaOckQfbL9wRSj0l5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmz4AaY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982E7606A32C
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmz4AaY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123961F000CF;
	Fri, 20 Nov 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795169704;
	bh=HDpKkpiaXn+PLfXK9545WDKPH5VX/aVILAl9nmxP7Fo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmz4AaY3Oh01m2Y8u7MgvXG8uHTmvUaE12PoReHqBpq1X53W1dcBlp9RhXlIz4bzY
	 O4HsovezGLn6WEYIjQkXirXR5Ph1hfGJ46fnIePVumOaWC35Nm5OgSqxpa+SDaHNmf
	 p5cw4bTvX05P/9Y2N4rBE1A1NEwqMh32sxO2ITxaXRA4gHNXIuQ5Pv2GDtAR+TAxGV
	 h5X08RepxiQj3yogJPmFi4H/feweHLwKS/6MGGqhOBWlQ8zUMGLlpJ8zeb4pxKNwhD
	 0FsC2umxOApwEl7e76U63OLqElVt7XkL+EuX2WDD/bryuXFIDZdh80LiKQPAOBoOR/
	 Ef7Fgv2spZXhw==
Message-ID: <sashiko-outbox-224916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 10:15:03 +0000
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
- [High] usb: typec: qcom: NULL deref in qcom_pmic_typec_shutdown() when
  VBUS is on
- [Medium] usb: typec: qcom-pmic-typec: missing port_disable() in remove
  and probe unwind
--

commit 27e120f037d3faf6c51dac7774569601de458e75
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: qcom-pmic-typec: detach the port on shutdown

This commit adds a platform driver shutdown callback that stops the port
and PD PHY, unregisters the TCPM port, and disables the Type-C block so
that a connected partner sees a detach on reboot or power off.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/=
typec/tcpm/qcom/qcom_pmic_typec.c
> index 58d1e6aae637d..8169db478b8aa 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -134,6 +134,16 @@ static void qcom_pmic_typec_remove(struct platform_d=
evice *pdev)
>  	fwnode_handle_put(tcpm->tcpc.fwnode);
>  }
> =20
> +static void qcom_pmic_typec_shutdown(struct platform_device *pdev)
> +{
> +	struct pmic_typec *tcpm =3D platform_get_drvdata(pdev);
> +
> +	tcpm->pdphy_stop(tcpm);
> +	tcpm->port_stop(tcpm);
> +	tcpm_unregister_port(tcpm->tcpm_port);

[Severity: High]
Can calling tcpm_unregister_port() here cause a NULL pointer dereference
on port->wq when shutting down with an attached sink partner powered by
VBUS?

tcpm_unregister_port() destroys port->wq and sets it to NULL before
calling tcpm_reset_port() -> tcpm_init_vbus() ->
qcom_pmic_typec_port_set_vbus().  When VBUS transitions from enabled to
disabled, qcom_pmic_typec_port_set_vbus() calls tcpm_vbus_change(), which
queues work onto port->wq:

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

kthread_queue_work() then dereferences NULL in &worker->lock, crashing
before tcpm->port_disable(tcpm) is reached.

> +	tcpm->port_disable(tcpm);
> +}

[Severity: Medium]
Should tcpm->port_disable(tcpm) also be called in qcom_pmic_typec_remove()
and the port_unregister error path in qcom_pmic_typec_probe()?

Without it, unbinding the driver or failing probe after
tcpm_register_port() leaves TYPEC_MODE_CFG_REG presenting Rp or Rd with no
TCPM or PD PHY servicing the port, and a subsequent reboot or power off
will not invoke qcom_pmic_typec_shutdown() on the unbound device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-topic-tcpm=
-qcom-fixes-v1-0-9a152f906fba@linaro.org?part=3D2
