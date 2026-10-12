Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200DB45C6E6
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798547; cv=none; b=NDuIwYyxV2PsEPPvq61yrMt4GAniltsyATUvwqOHCs19kjYAsVqb6ordtMnfJrj+O5+TMir+eGvzNS5N7ozmBmYWh7kcXjxduoUa7QLcaL9qbziadctj4T8hnQUijm6Pg+NkzFE5b25RSaZxO+B42ooCERIssjbHsfLiZ0VLMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798547; c=relaxed/simple;
	bh=y3KoOKK0mawXPEmXjbcvkME48bEmNNyrp09sOhdNDns=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=vGWnsd2rCE5qGvOCoMZyisU9YApEYIAiQLKBlW6XPZ0ecHtD1UW3cj2gaBGPorH7su5aBEa/P74NCI7/wy540eOjnaPGkwEGWEGOcas9JfMzjCHkavb/djYqRKwuwArW7bJrKSnMUx/kjVfaBgoY9WumDu7lESfYEnndTNT7YEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoAkA9yA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoAkA9yA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F0E1F0089B;
	Mon, 12 Oct 2026 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798544;
	bh=kcKWAyRP7A+FDZLV4Qs0qXPiY9dusI+WozR8wftP8aU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XoAkA9yA5ctVTmyXZSOp8OHWm1BNtQe58dWGOXnyo/cGn2+RgJVsS+3Gpv6Y6o99E
	 G5xgYLfT3wFZgCIPjNEEdOmaOe4CRT8yiQ4BK4D77zT7ca1FSQUOGRU5qEbKtS6rKE
	 b1mmDXMf2bCjyoHEnNicauA+/69MTa8SjLlT2GWX0KY/V7/DtPxkpBFoWDxgNi/NcB
	 Cnf7JwEyppAey1qsbNei4o6oQHG9J/GX/qAwJar2iSM2rYBApOjOcXGdvTupV/AbHn
	 D4mPz/s/GwIWRynbXoUaTvs+OozGQU+iznP6g+yt9rGnv/yfaWLrPuIlIuiynVHT3o
	 MFICgLa/XZl9A==
Message-ID: <sashiko-outbox-167906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth K" <prashanth.k@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
References: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:49:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: dwc3: Missing PHY_MODE_USB_DEVICE_SS for USB3 PHYs device mode
- [High] usb: dwc3: Unconditional PHY_MODE_USB_HOST_SS breaks existing PHY =
drivers
--

commit 0fa2a51031f656c2f62abc5514732f044e86b041
Author: Prashanth K <prashanth.k@oss.qualcomm.com>

usb: dwc3: Use the correct PHY mode for USB3 PHY

This commit configures USB3 PHYs with PHY_MODE_USB_HOST_SS instead of
PHY_MODE_USB_HOST when switching the controller to host mode. It is intended
to accommodate PHY drivers that distinguish between USB2 and SS host modes.

> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -251,7 +251,7 @@ static void __dwc3_set_mode(struct work_struct *work)
>  			for (i =3D 0; i < dwc->num_usb2_ports; i++)
>  				phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
>  			for (i =3D 0; i < dwc->num_usb3_ports; i++)
> -				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
> +				phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);

[Severity: High]
Does this change break host mode switching for PHY drivers that only support
PHY_MODE_USB_HOST?

Unlike the USB core in drivers/usb/core/hcd.c which attempts to fall back
to PHY_MODE_USB_HOST if PHY_MODE_USB_HOST_SS is rejected, the DWC3 core
ignores the return value from phy_set_mode() and has no fallback mechanism.

Many existing DWC3-compatible USB3 PHY drivers, such as the MediaTek TPHY
(phy-mtk-tphy.c and phy-mtk-xsphy.c), only handle PHY_MODE_USB_HOST. When
passed PHY_MODE_USB_HOST_SS, their mode switch statements fall into the
default branch and do nothing. This leaves the PHY registers like
P2C_FORCE_IDDIG un-updated for host operation, which silently breaks DRD
host mode switching for these platforms.

[ ... ]

> @@ -1643,7 +1643,7 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
>  		for (i =3D 0; i < dwc->num_usb2_ports; i++)
>  			phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
>  		for (i =3D 0; i < dwc->num_usb3_ports; i++)
> -			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
> +			phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST_SS);

[Severity: High]
By updating the host mode path to use PHY_MODE_USB_HOST_SS, does the
peripheral mode path also need to be updated to use PHY_MODE_USB_DEVICE_SS
for USB3 PHYs?

Currently, in __dwc3_set_mode() and dwc3_core_init_mode(), dwc3 continues
to unconditionally pass PHY_MODE_USB_DEVICE to usb3_generic_phy during
peripheral configuration:

__dwc3_set_mode() {
        ...
        case DWC3_GCTL_PRTCAP_DEVICE:
                ...
                phy_set_mode(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE);
        ...
}

Modern USB3 PHY drivers, such as the Qualcomm QMP PHY (phy-qcom-qmp-usb.c),
explicitly check for qmp->mode =3D=3D PHY_MODE_USB_DEVICE_SS to configure
SuperSpeed-specific interrupt masks like ALFPS_DTCT_EN for LFPS detection.

Because dwc3 passes PHY_MODE_USB_DEVICE, the QMP PHY drivers fall back to
the legacy USB2 interrupt mask. This breaks SuperSpeed wake/resume
functionality from autonomous or suspend modes when the DWC3 controller
operates as a gadget.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012093704.2762=
263-1-prashanth.k@oss.qualcomm.com?part=3D1
