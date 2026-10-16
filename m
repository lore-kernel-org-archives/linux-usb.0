Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77AA4B3C9D
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176605; cv=none; b=NkkkENny1XWGNSoILsiX5x5Qdc29Y/tAT9AvDwlH1uCH/2XfMLbgyp8Ude9TPSx6zXaic6dyT8MVShD2jaHXXrj0QpOecaRn74RK+QYFhKvVMNQ6qJNj5kanbhi4kArqnIHxn9oU2nYeoq5bz6qIN4ooV6+xIf2Mt2F9z6PJwNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176605; c=relaxed/simple;
	bh=fiLV6T1Zkg/PNzVQIrzrKomAjZsB+jnxfmR79VCzeD4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rZmG103YZtcQqyW9eWhMffDWc9GNPvedmRzBqBuACIaBgdk0B7bbWGciTalQWaNvbyFQBWb/QSgob1KGAhK2Ljw+OsHh7p292D74aeIvLhRCewZu/qNS78lWFZ8OOTToOLOXfQih9848uUk6WFV5EbXRMnEKBSQ0SuIW61+iU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lI5b7d2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lI5b7d2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139751F000C4;
	Fri, 16 Oct 2026 18:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792176604;
	bh=+q0qV9ULc6y0ecSGZLpCEu4TNbzlZEBwvJkejh92dOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lI5b7d2qiszfxyvtoCmf20KaXSPzvt1pPl6lxfZRTHp7l5t9JVip/hJGWyxSaaGTU
	 HUb67w4/pQe/rj+Smj7pqZAwtQ6CNq98KpYJejOF6fORMNdU2X7weusO1fEnf4pfkD
	 k2Pfsu5o9biA22enRPhb+HwwYYCmfbvKn6oUho95CHtcSXurpanZ5dIGhWO85ozu6K
	 ExXeSUULxWNj0uglcVij8pPf7cBwV2F8ZGcA7c6KCYoSFkAIgCrEmquf1EMrVbDAy2
	 ccq4JbXj/x9ihllSovXjjm+mT54kjG8y+Q5G4tnHYs4s07RKOONqgVm9gZfawjCiDA
	 7TDSsOpBfpuqA==
Message-ID: <sashiko-outbox-174782@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/7] phy: rockchip: usbdp: Track PHY power state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-1-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
 <20261016-b4-rockchip-dwc3-rockchip-glue-v17-1-876f96893e2f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 18:50:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: state tracking leak in rk_udphy_usb3_phy_exit()
--

commit 71f779c7a4a8cedbd725b12e66fcbf3d92f884bf
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Track PHY power state

Track PHY state requested by software for DP and USB3 individually
in preparation to rework and fix up power state handling.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e748acdd2d313..db69dd24f73b3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1286,16 +1293,25 @@ static const struct phy_ops rk_udphy_dp_phy_ops =
=3D {
>  static int rk_udphy_usb3_phy_init(struct phy *phy)
>  {
>  	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> +	int ret;
> =20
>  	guard(mutex)(&udphy->mutex);
> =20
> +	udphy->sw_mode |=3D UDPHY_MODE_USB;
> +
>  	/* DP only or high-speed, disable U3 port */
>  	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
>  		rk_udphy_u3_port_disable(udphy, true);
>  		return 0;
>  	}
> =20
> -	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_USB);
> +	if (ret) {
> +		udphy->sw_mode &=3D ~UDPHY_MODE_USB;
> +		return ret;
> +	}
> +
> +	return 0;
>  }
> =20
>  static int rk_udphy_usb3_phy_exit(struct phy *phy)
> @@ -1308,6 +1324,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
>  	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
>  		return 0;
> =20
> +	udphy->sw_mode &=3D ~UDPHY_MODE_USB;
> +

[Severity: Medium]
In rk_udphy_usb3_phy_init(), UDPHY_MODE_USB is unconditionally added to
sw_mode before the early return for DP-only or high-speed cases.

However, in rk_udphy_usb3_phy_exit(), the corresponding early return happens
before clearing UDPHY_MODE_USB from sw_mode.

Will this cause the sw_mode state to leak? If so, could subsequent operatio=
ns
like rk_udphy_power_on() called during DP PHY initialization incorrectly see
UDPHY_MODE_USB as requested, potentially executing the DWC3 reset handler
unnecessarily?

>  	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-b4-rockchi=
p-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com?part=3D1
