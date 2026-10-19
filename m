Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129374CF490
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376378; cv=none; b=aZHRSEjK7szp6y09Bexs0+W1NoGfiJdpY1mKHM6kOZ/q+i4gUs1NNQDMyaKnp2fN1hd1lOnFHmhToqN0w7Ln78nRrZd0lIRHBNBTQVLwdeHhY3d1GG9of9arARrtudNrdfzp8i0fC7KnGl6qoo2VmnTIOyqYRfttl89cFx83b7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376378; c=relaxed/simple;
	bh=1BFTNZcEcei7NE/mSUCwIv18Jl1YMs+SrxlxmafVdho=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DzNONhyRZwZKdUBANQ5zPdFe/N2N+/UePxsozJu6NkwL1UsboX+fZfwlU8Dw2j7jGL9Y8oBcaqJZ4G2gsBqHwd8WyT7sHbfzGjyEPnfd5ngcmg4HExQi/IwQUnSH9cdrR11T/8+ZX3a1AiDkkcOUoJjT8XbZoEHd2uYEPwc+FsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3LBM3J2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3LBM3J2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399B01F000C4;
	Mon, 19 Oct 2026 02:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792376376;
	bh=/vyfScjXXzxG/m8vVEymHwmNZ6TrI4iQPdVCGkWlwek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N3LBM3J2OPGS1A9TJiXUNBiAn2yLGXTpXoPFTEi84b5xci4gkO3NWPpNSS+qeICet
	 MsWpoc+TEiSlqbguv+DiWwhLg2atFeEHwhsD9qFymujJYuzi/Pkf2Do7SDtwoLAyBb
	 G1LzxksNLfMPLzeTEtpGt0ljyZoOQk2CX7OfAv4CGlsFpFnw7jBah+E4pvy/htAadN
	 IDSTpK4TkKJbiSGxBDe4/SWMKVF8Oteka5Ed3FhocrtiAkDwrlq/6GH06SpCsnGh1y
	 U24cPO1irr9LvfVeuu16432YiYUuohr1PbPeVA7Kki/HzxjrtTwBQeXGUgAE1Jqwcu
	 tUjVh/ByoN/Bg==
Message-ID: <sashiko-outbox-176528@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:19:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
>=20
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
>=20
>   echo on > /sys/bus/usb/devices/1-1/power/control
>=20
> PORTSC.PR never clears (PORTSC =3D 0xe11) and the hub driver fails with
> "port_wait_reset: err =3D -16".
>=20
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019021547.1694=
088-1-peter.chen@oss.qualcomm.com?part=3D1

