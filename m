Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E6381B0A
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 20:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267304; cv=none; b=R0aNBxLK/E5iMs6LPIfswYIq1H6xAMi/XXV2C1u8Zb4/EUtBptXiab7cJPZWXbewmGsk2ChRm0l2YidlIikAU4cs1Ml0dia5SEposP2kDwPuoXDdlIKkxS/Ja1HGAg7KrubiMftW2mIBpIwxeug7G53/0r/WQszg5Pkdgfv54Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267304; c=relaxed/simple;
	bh=X5CbaCju2WX7LepB8omnplrqPm7yCBxWdHltbtUXmY0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dhGrWtLarnJfePzMsPDF+cR56Urgjngil9adp/I/oJt86zL1Tmj91LXGRFSlEOS4gBlwYqQGBHOPHnG3NIj0eR8gbS7vIeKCGlT+XPr6F1FHS63iBr/xchNOr5FvaLbhMKpINSjrmVUc/vfZcqVfeCkpr8j9c1TSF+P3cUDL4p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT7bZjYx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT7bZjYx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455DC1F000C4;
	Sat, 17 Oct 2026 20:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267303;
	bh=X5CbaCju2WX7LepB8omnplrqPm7yCBxWdHltbtUXmY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TT7bZjYxSIRzGJIIxmC4tvtM6uSIyfXWCoHQVPdHdH1wBuDByBTJjIDoJossHsxT+
	 sshLMxz9l+Zkcph6W8ehObVdYGLxe5jZalzyDkboIbZaahtobHkvFw73rlyHdWBTfY
	 w4m/9CYYjUA33AnbSarZSsGAUldYualbfL5mG12ef/0p9U5vlRlOhyV1lMiAkuJNYK
	 M4yeZqzn/THkG+BbL4TZXyVc7elOeLXZV21ykXxwfNU4kCzfVgf0eXTNgFfw1KhSLw
	 HJEhJwUw6nWZyqeKZh0bjSJf8LYKoCO4tP5Hf9OZmQRqBNvgza+zjFmLAU92uoPFDq
	 ccVT0rckMxDxw==
Message-ID: <sashiko-outbox-175812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: Use DP AltMode defines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-3-7ab3d93553dd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 20:01:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-dp-altmode=
-dt-defines-v2-0-7ab3d93553dd@collabora.com?part=3D3

