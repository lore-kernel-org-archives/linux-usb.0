Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606809;
	b=nL14846hDrOWstbcx+OPiWcdTz/NCKfMBtL1NIaJjfMYUXnFwYQVzeCthp6ehFavj6QJ
	 1GZ7JEpQpG9wz9ugu6pp6z3db6/JU/ctzvpiQuKs9mVNrla78BJHlEqZBYVvwQTUJomEY
	 8fbBd50t0pNtzrMQdkm5Pu69KHpQdpZuJ02c0K/qoMntMCJiYMAjIHb9jLbU5GdxqPgDf
	 8fMNq5Nl2Id1hXEU6wsWay8NJUp+kWPYVP+DSfCwpdzPlZmxJVQPJkowOuqZj0ZfkBasA
	 /cGfEJSprQnVoZBhJ1fw0rrSAUN8YW0SMEErStSAd1SUQzo9ePGAwEfcNmGMdHl/I7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606809;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kdBvM+98DeXOPrjJ4sSBwwUVLqma56YNyKUf2QH08PY=;
	b=WR1zr+zpqtmBaDlsivGS/U1Z6ToV7b9jTUOGmMtnhpr5tOKufCIqAGHXzWLkuprnFvMJ
	 wDlF1569BxNOFrk3488p7OdZpAKOkiixUAxkxCwNiUgkFaVkccnDLa/lAwyyOH2nUPUHO
	 SlAdQubo4Nd9PbK9BTss1PNuiHKf/JexYAecmgP0/XZV45h3LeAuLAnplLn/GIz6URVxA
	 pemj99jPuvW/Vt8b+1lBwT8OoWtiq8ONk6QC4H95VtgUkTsuZixOV+NNIoBeAMW4PyHkx
	 zzHCSqHFST8EeA4k6JW3Jc3oCg/reXKyXVXlNdxteeZeloAbb+26gyNw86wATSLSjCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auvIvFTJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237D606A324
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auvIvFTJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314441F000C1;
	Wed, 21 Oct 2026 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792606808;
	bh=kdBvM+98DeXOPrjJ4sSBwwUVLqma56YNyKUf2QH08PY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=auvIvFTJEeJzy82JTTO85sGP8hK+SbyoRYJBSuOPJ+yQDYgOFdhvwQizUOn7VT2D/
	 upDXugaRiCP3kVGelRuDL4rnxUYmlvo/LwlDofZMlgQoR5qgVneL2OJ/coz9LDeLhr
	 kmaWDB3iUgl2AwrvlOs1WG9+j7i5Yw0uvOKcLl1hAofJnwkx4j0ZbmFQWxLrQEV3r2
	 wuVJ0SsFjZMDEGcI3Pe9k8HFR1cBIqeKUdvPAIKCwf1ny9fdgbz0KNYNVhTsCcE9R+
	 ZGdV6KV//gEZmjmlDeOtwzVqz7EPmPF0mPKgyRMj/bbyDj9czXziCH8ZhpnErcdc6R
	 9M7GugGp0qWsg==
Message-ID: <sashiko-outbox-180548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 2/7] phy: rockchip: usbdp: Add reset hook support
 for dwc3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-2-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:20:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When TCPM (Type-C Port Manager) triggers a orientation or mux
> change, the PHY needs to reset. This results in the PHY no longer
> providing a clock to the USB controller. If the USB controller
> registers are accessed without the clock, SErrors are generated.
>=20
> This can be avoided by switching the clock provider for the USB
> controller. But after switching the clock, the USB PHY sometimes does
> not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
> due to a clock glitch and after some debugging figured out that this
> can be avoided by disabling the USB controller's PIPE interface while
> the PHY reset is ongoing.
>=20
> Implement an API that allows the USBDP to actively request a reset
> from DWC3 as a quirk.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D2

