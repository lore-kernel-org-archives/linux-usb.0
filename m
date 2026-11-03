Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793741063;
	b=cADyF9kyWI2Ka4xPT4dPYKjLlwo7WxHxYJEPBMPekHQVH0hcR5QbMgyboepZOlKdKvdr
	 WmTI5qenCrO9J+ov4XWtKyQx6+pw7fcwfpv8OD7S/sVxrLUAr1N3r/vIfuyQIc7bYzjCH
	 Hp23L1v4XP+vN4KuFdrtyI9jh5TwqgpNbhRgKeUUHZL6jqkK+B/X9guE89jAkIvfzaTSd
	 dt7sF78nevmrPLCdnLb5DW26gJUOX2QiVP5ZtrUPZI1gatJRyBm4fnVb0BXLK3BIpYmO7
	 k7Z25gFeqm/7cvE8JqmV1nrcYJER8UoSPDH9S/mAIhe6eep0ZU+RuL8whFOm66GUQXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793741063;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hwKL0XfE/OtZeig5dwsdDnwvzob2bwj5VziX0nabEE4=;
	b=20z+HJmKhmITlVfbuNEPWfUUsmNCUo/xJSFSrVEo/4sUThWf1fxRRsEBURNo96y/9ui9
	 oqlqrn73x5yfOLDObzmUTQcp7vFBoFbhKlghvWqNWgtORpbx76Z8+dfVRSepC/yGZ+b52
	 n64XxMVkv4ctEv9JDldYv76FrdlFOm/esNpvR1xYxhxnhMRA/mSdxrv72OAfO3I97m5Kf
	 kNBgoJev/t/nT0SEdwMKjBys/EhTiLaE/KcDxYzCwijXi1KkrzoUKy25j3c2FzvcqhvWC
	 k25+vWi5HkLkMrCyDHKGYCDxk327egOegpwLiyuv7sgVkv/SNj5FQhFrlqWrMGbQ0aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0wYboBQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3B606A332
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 21:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0wYboBQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366571F000C1;
	Tue,  3 Nov 2026 21:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741063;
	bh=hwKL0XfE/OtZeig5dwsdDnwvzob2bwj5VziX0nabEE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e0wYboBQ8etl6ulaWCZU567ydyKaYAjoOFxc+ARoBRvEuzCjoirXYT/QMibFNXt17
	 kZSpmjLYijUtzEJAmoZkm54YCEVKrzKb7ussqJE3LFBmSVccO3Is5c1bs6Qi5u6dd+
	 YTIjlSuYdUDDc5GjmyTebVMZ0M/3FgvHvrr6nSmvnJeOQcDdilFyYaVQboPq7tVgwI
	 TzUi3ELw/rXq2r9xWxj4p/23oUP+fjwRGeLzMPIAopKow1/pTv8D744uEVokHP0Ogf
	 dsdmoKnOnk8J+5MXKFhAELfUpIj2YYP73cfin+b59SUgtt9mxA64/vhchrUfb5+OJE
	 SV6iP6YMHHlaw==
Message-ID: <sashiko-outbox-196051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] usb: gadget: u_audio: pass channel counts
 explicitly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103211434.996135-3-kaf@nwlink.com>
References: <20261103211434.996135-1-kaf@nwlink.com>
 <20261103211434.996135-3-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:24:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> u_audio currently derives the channel count from the channel mask in
> struct uac_params in several places. Instead, pass the resolved count
> explicitly, so the shared audio implementation does not depend on how
> an individual USB audio function represents its channel configuration.
>=20
> Initialize the channel counts from the existing masks in f_uac1 and
> f_uac2. Remove the now-unused channel mask fields from uac_params.
> Preserve existing behavior.
>=20
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103211434.9961=
35-1-kaf@nwlink.com?part=3D2

