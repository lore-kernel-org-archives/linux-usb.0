Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653258;
	b=cpkLG3ZwMlkGmpDN7Rogc7p/PxEIdxvZAnybIVoqjcVk3li1Y/Ms3sYjuWr/WUx8ryAT
	 zv1un+hRcq6p672zDsKyUKXvLp0jw7+UpyzTUS8TZYBgX9l8SytV2/qHqJY6DdYiD5PhA
	 7kFbEFeVgIEwP41K6p35BOAcXTbmkBiVWv6puSZE1LN4J/JxPJwctGwCPf5E/f2cZHjBS
	 utNmmRLYS4MMesK0m8ClTpIZ1sTBIYhHbdeRhS9ALO7F6mwd2KFDy4DgHgIyD6AVuckE4
	 psYMLO9joo8JEAL5DR913JMA3FlLXt29xuSDvAFwcAhhA9mNcKU4V0wzv4WkqFj4X4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653258;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ALPx4pvxY7pVhYls9etefry28BUAbZ7mAOm5IQTC+sc=;
	b=XLbbxRHNVJQwliBHY4LrHRXHzN/O09uiJyMl58dBytCotw6HU+ujjPHvs/qdxpBbIOea
	 F6RzlS2xD8651379gF9Aq2/J1O/LGUPGMNpInRX9S3LJ8Fy9l9gRGfIGT1Sdp4gKKlTiE
	 P7ttM0TgghXqpdc7EwIVcG5g65vcYV4Q/39C1S0IK7CRawVj3kyZbANMkmowjPlzwSSXW
	 MSkvJWlgSO4RZR2k5lOPii6epRMgOhKh8mrYdFv3y3uxk3yL+0PdRMjw0ImVBSwQJU3/y
	 s3Noel9+WZh9bgqv+/AKtz1oI0QlKCGFVTdR8ge5uflhNfQMUSkE3n/4ATU/A8SFdfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blDKK+PB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA36606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blDKK+PB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 440691F000C1;
	Thu, 22 Oct 2026 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653257;
	bh=ALPx4pvxY7pVhYls9etefry28BUAbZ7mAOm5IQTC+sc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=blDKK+PBjAVutNdj3tmWLgWQfGu8CZEmiSb+ji4NHzjYIilOKl+82k3HYqI8i6j1u
	 yPZ81fPUgfLZpjhykdBqQ/EhLdj81C0XV1khN2oCsnKbL9CECZOVUeli8PTVKCPaJ3
	 zGEbJmI3ULmEYZ4fGPMsldSvFGJWlgq7rgXpeOLvu+j17vZAfVVOax0cmUatTUsl+Q
	 BmzSGpEiebqIsflqeuq0weQjXKCQXp6XDyG4ggFrUSX6zOCCyfN5okO5E9khDuVCIe
	 Zzr7d/4eXcn1ayWERqa3NLBzcAW52AjVZYO81EyjTDqwtXCSq1xc2G1cPhffawIaI9
	 bUat9JKPX1MBw==
Message-ID: <sashiko-outbox-181119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 1/6] USB: add usb_make_subpath() for formatted
 device subpaths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shihuang Liu" <shlomojune6@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261022070929.20820-2-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-2-shlomojune6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:14:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> USB drivers often build device paths by calling usb_make_path() :and
> then appending a subpath. Several callers use the deprecated strlcat()
> API for this.
>=20
> In preparation for removing the deprecated strlcat() API[1], add
> usb_make_subpath() to format the USB device path.
>=20
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022070929.2082=
0-1-shlomojune6@gmail.com?part=3D1

