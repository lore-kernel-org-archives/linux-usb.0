Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954533;
	b=lXjpbncmRlrxEdrWqsvNU3Pn6BKGlP46TZtxbkHyHFRJyjk2ouydjpolQSjxYs5PJLF1
	 EFOsdZAl9lAqQq/OifCas2CQ8qirBQJRIkA5HTgxh5zUwfOOha5NQ4ImdAQhMW5WZ59+t
	 Eoc0NNoghJVt6pDv7I+e/wTT/adozEHTxBsc92yLmWAWZYkD212Z/oprn7CHsKtmbH9nZ
	 IDk1jVeBrJK19ll0nAMZPb4HynX3Yevm4t/txlquqcpP31Suy/SS9Q3HmGwmkwTW70aDN
	 9Q8KJ6dCZNUQzihsZjKhrarXUpOLwkvxmRVoCIKoSgUY8tQw8ExuHP+eQIGOWVS1HvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954533;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6JO7EuZJqgUEiDZIBVqCmOBuiWOdG0pE4S2kj1JEnWA=;
	b=a+xnpu3Nd/2aXIg6qc0xRBmEVIeQAJF80NWeRekKr8TFk+UyG0Tq63oOlrLRHkQ7ZgUE
	 tx8bA+ifoqgLDp2zAoo7TmhOr9d1cdeIxryzdK1fxmIoo4YgbPgUkbSStQrOZlrHBwe+U
	 Wixn42vdOol29JLIu8R2/vgDV2NI1K2+ugLj8CH9LZPviUJ9l9r2lkxvSnhA8GvjfnWSK
	 0xoZeSiIyqK43lRTTr98WzWaht8ck7eCj1YUSd3uBnG+GBNhQOzrSZPEHuhEnNiY5cgnp
	 XctXinhMpQ2ZjKbQ/dqNaMZwVu4S9FZ8u4hbV/5Ed4dwBDRzBsieYB3vm9GR8PJaX7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P7HIr/wh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C9606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7HIr/wh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3AF1F0089F;
	Fri,  6 Nov 2026 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793954533;
	bh=6JO7EuZJqgUEiDZIBVqCmOBuiWOdG0pE4S2kj1JEnWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P7HIr/whpW/iyscMmyGglcvzdoFYrk5IN4gNOEq4AG8jsr4qtY6DWO9el2ZIOVILK
	 XaMEdyZHjS0sWNynOVAfLb979IMlz3eFVNXY9yFzzKbxVxkmRcLTRMrowSVXjPeWSs
	 vVeEyO6kZGI9MNR6KHZU9ZHNFB2cGZeCLLynxDjAy3EqtAGynPTnt8/r/YSVp6++U3
	 0lHb/lXs8YC4nSi8xUP+TrWAmydRJDYV6oVHT2JZxptwO04Nd86N6L4ehjghiy+UgE
	 2bZ3k1UdGrysXJL1JuvlIB89hu/kK12MSZKe7Z4JGgwNsdiV2Ap/yrJ646Nr+e0dOg
	 4CarDhiWojUzw==
Message-ID: <sashiko-outbox-201083@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] phy: qcom-qmp-usb-ss: add shared SS-link-state
 submode contract
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapas Rana" <tapas.rana@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106082716.128968-2-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
 <20261106082716.128968-2-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:42:12 +0000
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
- [Low] phy: qcom-qmp-usb-ss: redundant submode enum duplicating enum
  phy_mode
--

commit 2f108759619603815653af9584eea10cfa75efab
Author: Tapas Rana <tapas.rana@oss.qualcomm.com>

phy: qcom-qmp-usb-ss: add shared SS-link-state submode contract

This commit adds include/linux/phy/phy-qcom-qmp-usb-ss.h with enum
qcom_usb_ss_state to pass SuperSpeed link presence via the submode
argument of phy_set_mode_ext().

> diff --git a/include/linux/phy/phy-qcom-qmp-usb-ss.h b/include/linux/phy/=
phy-qcom-qmp-usb-ss.h
> new file mode 100644
> index 0000000000000..4da4d71e977d7
> --- /dev/null
> +++ b/include/linux/phy/phy-qcom-qmp-usb-ss.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Shared submode contract between dwc3-qcom glue and the Qualcomm QMP
> + * USB3/combo PHY driver for communicating live SuperSpeed link presence
> + * at suspend-entry, via phy_set_mode_ext()'s submode argument.
> + */
> +
> +#ifndef _PHY_QCOM_QMP_USB_SS_H_
> +#define _PHY_QCOM_QMP_USB_SS_H_
> +
> +enum qcom_usb_ss_state {
> +	QCOM_USB_SS_UNKNOWN =3D 0,
> +	QCOM_USB_SS_PRESENT,
> +	QCOM_USB_SS_ABSENT,
> +};
> +
> +#endif /* _PHY_QCOM_QMP_USB_SS_H_ */

[Severity: Low]
Is a new vendor-specific submode header needed when enum phy_mode in
include/linux/phy/phy.h already defines PHY_MODE_USB_HOST_SS and
PHY_MODE_USB_DEVICE_SS for this purpose?

The Qualcomm QMP PHY drivers (including phy-qcom-qmp-combo.c and
phy-qcom-qmp-usb.c) already check for PHY_MODE_USB_HOST_SS and
PHY_MODE_USB_DEVICE_SS to select the autonomous-mode wake interrupt mask:

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_enable_autonomous_mode(=
) {
	...
	if (qmp->phy_mode =3D=3D PHY_MODE_USB_HOST_SS ||
	    qmp->phy_mode =3D=3D PHY_MODE_USB_DEVICE_SS)
		intr_mask =3D ARCVR_DTCT_EN | ALFPS_DTCT_EN;
	else
		intr_mask =3D ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
	...
}

Passing PHY_MODE_USB_HOST_SS or PHY_MODE_USB_DEVICE_SS when a SuperSpeed
link is present and the base PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE
mode when it is absent (or unknown) would avoid introducing a duplicate
Qualcomm-specific submode contract under include/linux/phy/ and keep all
QMP USB PHY drivers consistent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106082716.1289=
68-1-tapas.rana@oss.qualcomm.com?part=3D1
