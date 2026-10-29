Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243764;
	b=HgXtWfhUW6mqxTYIh+C+EPXMmKDz6zGjMzKP0pcOct4tYU4MgFQ9vlIpgkhkRCT9LwkI
	 qkLzyIHZIi5lM+iRTZ2866/jqPaEVaL279/AFUBxulUn7iFn6kPBR7wuoaVJ4zRx1BHWN
	 Vk+w/2WwDEV9SlqG6eeZ7vGM/PyAGdpO76D2Pzfc3yrHNRlxeM6+ja5bIkNJnqw03fOU5
	 Jy0gNYI+cnJS9Hcd78gmYz5gWJLA4yJurJr9kGNfr5ZOZtNg29x/8RWPu4Bfmg74b3onj
	 UX+6WF2VjZjCfiXsbWNA1ZB8T9lFcxYW7UeTRKe8D+4t65Hw+YhME0wYDy0ZteFIC7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=spYc3YNd3DgSnJ42Ij8QFD3bLo8yaJ6qOLdH6DUbTi4=;
	b=r0SIXNdkEkGQkHH4cFXff9Azl8jHpdxAQihRyHJRLktLnBdoh3ZZ1DlzctDJucndTFtq
	 OuqAOXLidxZkakwZIim4IJ3J0z6zq++9OtyeAVrH2x8vxj3scEm1jKqNBmoN5Pk981otb
	 bIjehhUnz7Y/vYG0ZuLIEf4e29mmE5fTgQQ4lKYlTB4EOrc17nSqpWUnSod5nsXB4fQmX
	 kIQvo1DQriivn6d/LKzaFcT4bAZ3Pxlu8bTjy0+z/D4CV1Mf5CahuCSqOaR7escInmmfz
	 9ikRawZ7OebIHCHBftns1MtrW8zOM/EXPXiaB+Bm5hS4wr+zpyjxN/2E/iJwPE9z8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOaNNiZ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867C8606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOaNNiZ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7281F01825;
	Thu, 29 Oct 2026 03:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793243763;
	bh=spYc3YNd3DgSnJ42Ij8QFD3bLo8yaJ6qOLdH6DUbTi4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QOaNNiZ08ac1PU6pPwcRb4W8mFRkdjHIEDicYXJ/u5lqmU7w3T6wrzQSmRVqU+QuL
	 oRuv7ZAaOn/DNlzl5zAVBXtgTob2yRpl+tdXo9jqj/qxcEgu6Ufecs+7fbpWG7kimI
	 jq2qKOHDX2SymRScgqIiPfsfozqISGct5cgM2fbF32hr2kqxYobwCxn/1hlSKyj5Tf
	 gyZqwX0eRZizn/acR9VKKGeEQhWMxzwK/pTDVQcxjgotuY0A6jZNUd50eZIkDWUiLK
	 WCOmH5roFgk1+aef71nPFuq7QweDiUEIsWwZsSzLcgBqZxKUsPNOKynS7kJclpfr9x
	 WlCKINU4gyKNQ==
Message-ID: <sashiko-outbox-188664@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: configfs: NUL-terminate extended property
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yingjie Wang" <1075151112@qq.com>, linux-usb@vger.kernel.org
In-Reply-To: <tencent_6FF2EBE4EF5FF4F324C8DC4AD0F39588E505@qq.com>
References: <tencent_6FF2EBE4EF5FF4F324C8DC4AD0F39588E505@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 03:16:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Unicode extended properties account for a UTF-16 terminator in
> ext_prop->data_len.  The configfs store path currently allocates only the
> input bytes, so ext_prop_data_show() copies one byte past the allocation.
>=20
> Use kmemdup_nul() for the configfs data so the source byte implied by the
> terminator-inclusive length is present for both the configfs readback and
> the descriptor conversion.
>=20
> Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descr=
iptors support")
>=20
> Reported-by: Bingquan Chen <patzilla007@gmail.com>
> Link: https://lore.kernel.org/all/20260421141010.5607-1-patzilla007@gmail=
.com/
> Cc: stable@vger.kernel.org
>=20
> Tested: x86-64 KASAN configfs readback through a built-in RNDIS function
> instance.  The baseline reports a slab-out-of-bounds read in
> ext_prop_data_show(); the patched kernel reads back the expected 0x41 0x00
> bytes with no KASAN report.
>=20
> Signed-off-by: Yingjie Wang <1075151112@qq.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_6FF2EBE4EF5=
FF4F324C8DC4AD0F39588E505@qq.com?part=3D1

