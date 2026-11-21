Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267268;
	b=ROD2vDAVnKta6BrgTxGuKBpnHSvWYhnDlHCbEmc/ABK2SJQHsEqmBpPp9bv/t6WAMiGA
	 57AHhzBzmqilDnT8UnbgsnfUsm6lND9TIt8BXhZU1rplBiK3C2WG9vNUO6UX4u3KqQIxW
	 v9sjI5A9SVOxH+F6377Xtce50ultftsUEpqUXYiJouNI1TY4Bx9wY4ITiWksTk8AC2KLV
	 VPd3uIX5bqQ+Y59CdLcab+4tKpiMZ3SAtN8rHC9wOGsipudI4Doq/9ge3jpwO1QSU7oe8
	 TX3H1wQAQW7X+iMF/knp7tIUcA0G+YNsiWExZKv90GIyuA5VgS6Lf9AVQ7ynaG7fcsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267268;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lak6yZd3qGuGseHF07p3MhmJ2a7Mk0obxf0cl8ftzyg=;
	b=ia3R8ZJLhPzrrMLSiwu5uJLtDAkojLWip+N13y4AZbCdBqoHeQWL71eOvGlvUeS8Wb/M
	 BmaBt4JnmX4EwyZwN0Ub6Y+/p8ro6tw5zQlvHc+GaLx5ALBI6AzBsaeug6d32bDeDhCOm
	 vJagGgoOv5g4j7dTknBRNee7Ems7qJLGnYyQmId+2Vo0SXgKVzzzHKNSktwHKcl7IqZ6l
	 8OaM0S3zHmQKys8NpbB5BGDYWSA5KvsUzPlNoVk3C/3EAXB5+gbs6fq1zEwbzlZR9iRM3
	 FBz1SKCKFLFzTEwa/glD9oJjWT0RYAvEKq7KheTd+nMPpzXOy/qIQ94+UXb7dXb483Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mX/AHFiA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D6D606A320;
	Sat, 21 Nov 2026 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mX/AHFiA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3211F000C0;
	Sat, 21 Nov 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267268;
	bh=lak6yZd3qGuGseHF07p3MhmJ2a7Mk0obxf0cl8ftzyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mX/AHFiApo/h2g01XUT+W7PR/2AXylZ073Qye8OaNVv/lWLE65yn7yt3O648WKTEo
	 znuOLiHi4lDD7rB8yNcoYPcd6fkdQkpHeiXADnIh7j1Pbytwq9mEiIg6bZFEmYIpNC
	 vUst5V64mVGEMrrR6b7AMu9CU6Q3FhCJnnInTYGV/+3+ICCDpP1rZsCq1TakNOU3qH
	 Ev2BdjQ1Eyq9P6g38/+IegTM/ikSrsnvG8h+bAYcFRLzo7AcMhYQOXObT0jq+UTYY5
	 v3TfrXcUFKFT7MgFFQCoGLLcwipEaUzwqO18Dg9dj/gh8yLCNc2huxqgrPEosq/ibv
	 52b2orlH5SvBA==
Message-ID: <sashiko-outbox-227061@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261121-tipd-ace3-v9-3-9a2f1327a330@chaosmail.tech>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
 <20261121-tipd-ace3-v9-3-9a2f1327a330@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:21:07 +0000
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
- [Medium] usb: typec: tipd: race with tps->irq in sn201202x_suspend()
  and resume
--

commit f1872e14e7db08290e3e00b97a27f328d4ac8b8d
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support

This commit adds an SPMI driver and variant definition for the SN201202x
USB Power Delivery controller.

> diff --git a/drivers/usb/typec/tipd/spmi.c b/drivers/usb/typec/tipd/spmi.c
> new file mode 100644
> index 0000000000000..8c6c97b0b3e2f
> --- /dev/null
> +++ b/drivers/usb/typec/tipd/spmi.c

[ ... ]

> +static int __maybe_unused sn201202x_resume(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	reinit_completion(&sn->wake_completion);
> +	err =3D spmi_command_wakeup(sn->sdev);
> +	if (err)
> +		return err;
> +	if (!wait_for_completion_timeout(&sn->wake_completion, msecs_to_jiffies=
(100)))
> +		return -ETIMEDOUT;
> +	return tipd_resume(tps);
> +}
> +
> +static int __maybe_unused sn201202x_suspend(struct device *dev)
> +{
> +	struct tps6598x *tps =3D dev_get_drvdata(dev);
> +	struct sn201202x *sn =3D tps_to_sn(tps);
> +	int err;
> +
> +	err =3D tipd_suspend(tps);
> +	if (err)
> +		return err;
> +	reinit_completion(&sn->sleep_completion);
> +	err =3D spmi_command_sleep(sn->sdev);
> +	if (err)
> +		goto out_resume;
> +	if (!wait_for_completion_timeout(&sn->sleep_completion, msecs_to_jiffie=
s(100)))
> +		dev_err(dev, "Waiting for sleep complete irq timed out");
> +
> +	return 0;
> +
> +out_resume:
> +	tipd_resume(tps);
> +	return err;
> +}

[Severity: Medium]
Can cd321x_interrupt() race with spmi_command_sleep() and
spmi_command_wakeup() when tps->wakeup is false?

tipd_suspend() only calls disable_irq(tps->irq) when tps->wakeup is set:

drivers/usb/typec/tipd/core.c:tipd_suspend() {
	if (tps->wakeup) {
		disable_irq(tps->irq);
		enable_irq_wake(tps->irq);
	} else if (tps->reset) {
		gpiod_set_value_cansleep(tps->reset, 1);
	}
    ...
}

When tps->wakeup is false, tps->irq stays enabled during dpm_suspend() and
is re-enabled by dpm_resume_noirq() before dpm_resume() runs
sn201202x_resume():

CPU0                              CPU1 (irq thread)
sn201202x_suspend()
  tipd_suspend(tps)
  spmi_command_sleep(sn->sdev)
                                  cd321x_interrupt()
                                    ...
                                      regmap_sn201202x_select_reg()
                                        <-- SPMI access while sleeping

The same race occurs on resume if a pending tps->irq fires after
resume_device_irqs() but before sn201202x_resume() issues
spmi_command_wakeup(), causing logical register selection timeouts and
dropped Type-C status updates.  Disabling tps->irq in tipd_suspend() (and
re-enabling it in tipd_resume()) unconditionally when tps->irq is valid
would serialize the IRQ thread against the SPMI sleep state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-tipd-ace3-=
v9-0-9a2f1327a330@chaosmail.tech?part=3D3
