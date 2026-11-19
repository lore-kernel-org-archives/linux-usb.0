Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118215;
	b=ChuiKwNdi6a9gkQ+F+Cz2bN+YZYrfgFSoidySj7kn00c7+mHczNZA4TPrKRLAqbCxZfA
	 TWBlI2MeCO8pAmswRYPrFdOSbMzbBl56CxIBGVCyHW+7FBuwDDQUoCg1CWpJ31ZH27ERK
	 AHlXjL8ll1/bmRDkc6N4CkfINePIM8hrzjxRd8Q7fSE9LWRbk8+T5ghqdfdwCtnoo7ydR
	 5YkB7KUyDzGF23tGmN8RD5ow8DxU5DH8IJPKo0SEBK/wgT1aaDDAmYjPnZmLGXlTt4t3P
	 8Gf56hACK3TQBem99iNBcX65kQyzpcw7Uj1Lwuz2Z44mF3a4VfCouV5HyBHfQlYh2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118215;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HXRVi8ghd2kk9kNUBT/AWBPIIu2L8cz+X6TfRmnfPZE=;
	b=0yXmTslMGOGyAJHkfXl0dM4v7cZae9yz/iD0xyUovswhbtYiLiG/T6etZchFLXTQeaQz
	 t0RZU2daaemA4ufkWZH7Naf5XVHTFG4KtccbUeoKk4gKBgfgBwwA8TcmJEITXlkKcZUhY
	 MX3rG43Y0ttSNEOdtQ1IdizCwAqxBRAug/neimssYPBpAPe8wt4wtVr4kj/JdTcNqqKJb
	 0tM7zWixSl6t8ceuicgwLzIwWxLrzOyPLJuCI9YdVGZW5IwM/QzG4PF4nErTZ4uf3hgMY
	 gt/Om9MFMQA4F28HhXR9VkIH7sz2WGt92YAarBbRfo0Q1+KCc1R4d6xTaSggmFmqKZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOQP9Iri;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52676606A326
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOQP9Iri
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33AE1F000C4;
	Thu, 19 Nov 2026 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118214;
	bh=HXRVi8ghd2kk9kNUBT/AWBPIIu2L8cz+X6TfRmnfPZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOQP9IriwWU3TqNEQyenem+ZCKH+NlHjgO/bs19sScr6rqp5vq1sCFJoqjuxXqTH3
	 VDOMtUUWtoYCTZNH+YADaUAwt3owYgQAemCzMRC/yANGcTE9Die+8FUvHdAIIAAm9f
	 lSDdILxpDGRLCbP2HE+GxruwTAhHk5U9RleKz0xq2rosXb+tET55YRfQ2AAlG9Qfbe
	 cceMifw6Rat8AKIah35H6MeMzFKoiWBfMqcKMhbs73yRt27HR1W5Ou+JiZ1Ct93O05
	 8vvSAQ5h7qRmeJu4yupJjlCJ0R55h/0c5I3LrSOFXg0toKntR3TR9cZauwozLYUe4k
	 /e38SdWfHO/Aw==
Message-ID: <sashiko-outbox-223993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 FuelGauge support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-6-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <20261119-gta3xllte-usb-battery-v1-6-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:56:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
>=20
> The Samsung Galaxy Tab A 10.1 (2019) has a S2MU005 Multi Function Device
> (MFD). It contains PMIC, FG and EXTCON. This commit enables the FG, to be
> used with a simple battery device to allow for battery percentages to be
> reported.
>=20
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-gta3xllte-=
usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org?part=3D6

