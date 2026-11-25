Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605190;
	b=ch7Vv/6covoxD/prw9Y2rmCIVUoZ33wC6MU9iWoBFusGYoDEXTaMZt7w/ax3fkoaHY25
	 s8g+tz3P57dWsgpEUL7hCed/87A1oBySzRGEz/6OLrd3X5LIYBgZGU5952jUOQehimoic
	 eeYPcv5b4OrDnqclfg4q57l4QCEPr/QrrjUvyuCXm/hZ7bomhih5+FkL64p8cfWYrAuXv
	 H4zZ32w6dIieLsY339AinUJrpaV2wsjdD84SEhCQJUTNk5wggptBYQ+chkowNz3xy33mw
	 xNC8vZVSfzsn/hoGsH/Q3l0yu53e7ZyM7Fyoh4ksG+LABaN0RYOAdFsvbRLplgElJSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605190;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4nQoHjHuzWMtdQqSvfNTRozR0WplkERQo8HlkKMI0j0=;
	b=qxv4bCQEg42GTUNnOyhmsU+4MAmV2ZBgAnr1hypIhkmRaNiw9ch2d7ffQ7lVzWUXiO9W
	 B/dRg8A7zf/JeAwP/mAS4sVUuJVO+B6nOgt2DT31tgtoxDv8PLUsHfH3PpXTz6AJ1FCzl
	 5tpGwG/mnM8GifDSFv6Ky8TioURPw63S60fQ1DAlMBKyHNButwa4cj6WHNKCJDwlqof9M
	 F5f7fLnMNDYF7i5WrY78kV+/GD3qNDkJoOzNIN1H9Qid2mJp/9Powa8pDH5+PEHA6iRJI
	 5RZyQBdJIcEa28q+2Xz1dy0WtvItJBTpCg7JHgW45V4p8mzWRKWyEsuOM0nDOClmyug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dxy6JQ7B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F04B606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dxy6JQ7B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2721F000C4;
	Wed, 25 Nov 2026 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605189;
	bh=4nQoHjHuzWMtdQqSvfNTRozR0WplkERQo8HlkKMI0j0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dxy6JQ7Browj5M+acrvzhgBrisyNmBS5WH53RtPjs74WQe0rIysjJ1UR55YgLQuIV
	 pWkSkNsWIN4DLJiioJXoXHaCzIdDKVwehcR1BKuGeRsgEnV6xLG0DK6wxn9JtMi7Ot
	 D87UEuPWfpC9dyyYWIleZupyw0VX/DCdUsUCCI2pQ/lAgEVV9J5OLaKzWvDClKyLcf
	 DrVAFn2dme5KZ/vptnCm9/GcsOq9/zwZY8E1yTN3P7iTkg0oD3nofoEp9c1HZEZYm0
	 Za5CtX7sxidYNkQIfNxx+QCO5GtW6LBjxqG8PEgZXKmb1tHkvS8aqsQIGLlI6cy0QX
	 +m6Lzy7yDKnug==
Message-ID: <sashiko-outbox-233203@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] usb: typec: qcom-pmic-typec: detach the port on
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-tcpm-qcom-fixes-v2-4-6fede9a69f6f@linaro.org>
References: <20261125-topic-tcpm-qcom-fixes-v2-0-6fede9a69f6f@linaro.org>
 <20261125-topic-tcpm-qcom-fixes-v2-4-6fede9a69f6f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:13:09 +0000
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
- [Medium] usb: typec: qcom-pmic-typec: unsafe disable in
  qcom_pmic_typec_port_probe()
--

commit 3a740bf28aab0b4c112846a62403e5fa9d63a6b5
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: qcom-pmic-typec: detach the port on probe

This commit disables the Type-C block and sleeps for 200 ms during probe
to force a detach if the port was left attached by the bootloader.

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers=
/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index f125ac722e8b8..a33903fedfb7d 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -803,6 +803,17 @@ int qcom_pmic_typec_port_probe(struct platform_devic=
e *pdev,
>  	tcpm->port_stop =3D qcom_pmic_typec_port_stop;
>  	tcpm->port_disable =3D qcom_pmic_typec_port_disable;
> =20
> +	/*
> +	 * The Type-C block may have been left attached by the bootloader,
> +	 * force a detach longer than tPDDebounce so the partner and TCPM
> +	 * start from a known state.
> +	 */
> +	regmap_write(pmic_typec_port->regmap,
> +		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
> +		     TYPEC_DISABLE_CMD);
> +
> +	msleep(200);
> +
>  	return 0;
>  }

[Severity: Medium]
Should this call qcom_pmic_typec_port_disable(tcpm) instead of writing
TYPEC_DISABLE_CMD directly to TYPEC_MODE_CFG_REG?

As noted in qcom_pmic_typec_port_disable() right above, disabling the
Type-C block straight from DRP mode can trigger a VBUS boost over-voltage
fault unless it transitions through EN_SNK_ONLY first:

drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c:qcom_pmic_typec_port_dis=
able() {
	/*
	 * Disabling the Type-C block straight from DRP mode can trigger
	 * a VBUS boost over-voltage fault, so go through sink only mode first.
	 */
	regmap_write(pmic_typec_port->regmap,
		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
		     EN_SNK_ONLY);

	usleep_range(2000, 3000);

	/* Present neither Rp nor Rd, so a connected partner detects a detach */
	regmap_write(pmic_typec_port->regmap,
		     pmic_typec_port->base + TYPEC_MODE_CFG_REG,
		     TYPEC_DISABLE_CMD);
}

If the bootloader left the Type-C block in DRP mode, writing
TYPEC_DISABLE_CMD directly during probe can trigger that over-voltage
fault.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-tcpm=
-qcom-fixes-v2-0-6fede9a69f6f@linaro.org?part=3D4
