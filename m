Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954142;
	b=CEA/wLy7ccbhO3gwBQ9AGtCKNGxsSdE2NV6motHD+x8TE81uclRa1HsWL9HZAHzTpFO3
	 t5q1aCy6hsD2+Pf+6sJHdpCmWeu7P5jRsiTR2KWG7PGAGiMo8xN3Ac9WtTdCQXiyaZndP
	 h6UV0uq56is3qvbV7weD1PjTwdu72m5L8EIVFPUNBBlgsy6kZy+V24+uhUcAUFJ/PIEVL
	 igrerhMO/kCIs3K79QTgXa1sCxhk36S+LXupX5ClgU1VYxcKno2LPsVRx/Kv5rPBbGpWR
	 pkNEMv33bA2zeRSaZAMCvcZvo8Vwcf/iZ5naDoXHufZ2m/PiYLJ3cKsmtprRJ5rW+kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954142;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XkAD5MECA2Vbpqcg/7bx21uHwximYQD1JhpCGrttIMk=;
	b=1A0O6QoUEL752kM3o1+Qq/CNN0i0raXmtbHci1DinpKtdKI9T82IxSYMV4oX74hJlivq
	 k5RwUlGVIW80UPysnjFoqqlrgnLSht0OxUsicnK727VmUFm7pqLIf3woV968Sndgh30RR
	 dKB0lC4sbBfgwbTs3yQpyLOQKHoBLpQ0/rDZLw0jzYlSn3qN3tO58TYdBsWABUjY7nVEP
	 7GQwG499dZ6R+h+ccFanMo6u7nIrEpKBm37NnrkfwBNsnrFBIS8pCY8ifkAH5oLJH4/SG
	 99NP0ePbwRsX9/4AxqMs81uThc6aq8rV7R5VJ+KuaZlXfJz/QIshpyOBkSrKjI2fC2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgMuHs2a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE8606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgMuHs2a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F231F0089F;
	Fri,  6 Nov 2026 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954142;
	bh=XkAD5MECA2Vbpqcg/7bx21uHwximYQD1JhpCGrttIMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JgMuHs2aAU1YwjdB3OJmmHUq6aJ8l6yc2pBgmdUeftioAKBBhxunUsMdN3RZPS6uW
	 mUtNftLlxfAybLwSXjnWCG1jF/SHpHzztlmOy+NZ4xzdILF/zD/+dUWAzjj3Sve2NU
	 h0Joma/ktDA/jguX4+g+Vye86DuzLkJuB2iOvuC6CUWyaneNUPY50cfFHjsluqgLuZ
	 95daV1wyU0irrC1Pc6X2Zwb2M9p/F1EoI569/MPC6HDwwEQoKTCqNvzq7DvQBhfeu7
	 PKDAdv0yZa+kIXm0k/X9ImugOFctkna1DFV/uI2bNBWKhQkYtOurFsMsB1rmmyG2Il
	 mXbMMWW5q7L7Q==
Message-ID: <sashiko-outbox-201072@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] phy: qcom: qmp-combo: Select LFPS detect only when
 SS link is confirmed present
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapas Rana" <tapas.rana@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106082716.128968-3-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
 <20261106082716.128968-3-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:35:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] phy: qcom: qmp-combo: invalid PCS_MISC clamp register access in
  autonomous mode [1]
--

commit ee7ffdc4089bfb74e59a7747c5a2c1ab2e3f8758
Author: Tapas Rana <tapas.rana@oss.qualcomm.com>

phy: qcom: qmp-combo: Select LFPS detect only when SS link is confirmed pre=
sent

This commit stores the qcom_usb_ss_state submode in qmp_combo_usb_set_mode()
and uses it in qmp_combo_enable_autonomous_mode() to enable LFPS detection
only when a SuperSpeed link is confirmed present.

> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qual=
comm/phy-qcom-qmp-combo.c
> index 187f0cd11f6c3..05d48ba81719a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c

[ ... ]

> @@ -4657,11 +4669,20 @@ static void qmp_combo_enable_autonomous_mode(stru=
ct qmp_combo *qmp)
>  	void __iomem *pcs_aon =3D qmp->pcs_aon;
>  	u32 intr_mask;
> =20
> -	if (qmp->phy_mode =3D=3D PHY_MODE_USB_HOST_SS ||
> -	    qmp->phy_mode =3D=3D PHY_MODE_USB_DEVICE_SS)
> +	/*
> +	 * Use LFPS detection only when a SuperSpeed device is known to be
> +	 * present. For absent or unknown state, use receiver detection.
> +	 */
> +	switch (qmp->ss_state) {
> +	case QCOM_USB_SS_PRESENT:
>  		intr_mask =3D ARCVR_DTCT_EN | ALFPS_DTCT_EN;
> -	else
> +		break;
> +	case QCOM_USB_SS_ABSENT:
> +	case QCOM_USB_SS_UNKNOWN:
> +	default:
>  		intr_mask =3D ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
> +		break;
> +	}
> =20
>  	/* Clear any pending interrupts status */
>  	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CL=
EAR);

[Severity: High]
This problem wasn't introduced by this patch, but can
qmp_combo_enable_autonomous_mode() and qmp_combo_disable_autonomous_mode()
corrupt the PCS_MISC block [1] on V6 platforms that do not define
usb3_pcs_aon?

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_enable_autonomous_mode(=
) {
	...
	if (pcs_aon) {
		if (qmp->qmpphy_mode =3D=3D QMPPHY_MODE_USB4)
			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_USB4_CLAMP_ENABLE], CLAMP_EN);
		else
			qphy_clrbits(pcs_aon, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
	} else if (pcs_misc)
		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_CLAMP_ENABLE], CLAMP_EN);
}

Configs such as sm8550_usb3dpphy_cfg and x1e80100_usb3dpphy_cfg pair
qmp_v6_usb3phy_regs_layout or qmp_v6_n4_usb3phy_regs_layout (where
QPHY_PCS_CLAMP_ENABLE is QPHY_V6_PCS_AON_CLAMP_ENABLE, 0x00) with offset
tables that leave usb3_pcs_aon at 0.  In qmp_combo_parse_dt(), qmp->pcs_aon
remains NULL while qmp->pcs_misc is populated unconditionally.

During runtime suspend and resume, the else if (pcs_misc) fallback writes
CLAMP_EN to offset 0x00 of pcs_misc (QPHY_V4_PCS_MISC_TYPEC_CTRL),
corrupting the Type-C control register instead of toggling the hardware
I/O clamp.

[1] https://sashiko.dev/#/bug/linux-975e0709-1f2c-4dcf-beb9-ae3f0e032aa9

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106082716.1289=
68-1-tapas.rana@oss.qualcomm.com?part=3D2
