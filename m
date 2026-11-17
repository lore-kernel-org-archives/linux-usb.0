Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909314;
	b=A6OIMBpl+BwrvNQ8HewvMi0qLxQDvFLmUGEtKyh33PsLw+//kzbw+9ZpBGTnIud/9XcE
	 UxJ34o11LmAeW6QyDhiMw2YWcYYYLOJtOMbBK4cTTE1xopTSeUUIt09vP9W0oRwR4Z0mU
	 KFlMzIhIFlOWnhrlXYyekZ5O+PzRmCZAmO2EziyXD3eWR+b/2jBiQXuXP/FBbWxEBg8vj
	 HXFQ6WQ1sAfVMP5N2+W59WebIfgMcyF58hIyWNrt6Sxf3F/6wF70xvNkNd0luNb1wmelB
	 NrC08iOtpp88dCDsuiTxcwcN/PHVbsRrn0ywnJa+POjDvHfjQWUkDwg+Tt4MUQ7RLsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DoRpfycw1FmpXgJBxtDB/FKW0JUSJCj94FV8/G9SxPY=;
	b=X8UedbpZN1KQlBkoAhUf0hwYqZ9CJ5Eb3K8nwVN3QU4C62U8udb2vxo622V3mlipj1dh
	 +juELNj8o77p9sbLLaH/u5n4m9CxcGupiDh6QgWmyP23D8qw8Nt0zX+qw2NMLUrXEAxW2
	 PSla8MPfofsXYSYQ7mlP3AmghBGKQBHMKMoH3YPmkUv1RmZjiSuONXYVAKyxDmYS75HiY
	 ZmkB81/xIQX/Jc5szROoGFI6Z0BXDgEi9gCTg2nWCYb2/IlunL9n9JjlHpGxB4WEghxo7
	 d0hxUbQpN2dHD8IFG6F1kMEpMaXMrwSMecZDfkXCAHPKO/GA7+XXpRme9B2g0V7sC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oz9Ttn0Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0691606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oz9Ttn0Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C021F000C5;
	Tue, 17 Nov 2026 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909314;
	bh=DoRpfycw1FmpXgJBxtDB/FKW0JUSJCj94FV8/G9SxPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oz9Ttn0Zas9fBg5NDAz6CblKu1XqbnDtA86EKnY85qhOT7NPnTQxJH3tkAYRjpHk7
	 eT+CZYiw/segPKveNPLeNugHooYJm6IBvSwF2PC4v///UQWB4y1ahxI0kglNXZ1tRM
	 iTEf0hJrmO2+wgmOiiSeLVsyem4surBQQF1FQm57kWy9t1aT78wLRju+BbKUwUBS4T
	 HvmA7N7PKUiARIZjp76JgwXeZPTIKIKz0BZrX36ZKlHX8tNrF9meQkJPu3HljDjOxK
	 iwQcFCIvWn/nIOhTNl/C9kkqWFKDj6PDNLHi3HwJ1Rg1nXANICrk1e+s8YK/rzVBCl
	 G7qk3Nx8kcL0w==
Message-ID: <sashiko-outbox-218549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: phy: generic: request the vbus supply only when
 it is described
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yang Siyuan" <hsyysy@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117094539.13527-1-hsyysy@163.com>
References: <20261117091956.12103-1-hsyysy@163.com>
 <20261117094539.13527-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:55:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
> regulator. The legacy usb_phy_generic platform device registered by USB
> glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
> up in the dummy-regulator path and the regulator core warns:
>=20
>   usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
>   exclusive requests (id=3Dvbus)
>=20
> Only issue the request when the device firmware actually describes a
> vbus-supply, and keep treating -ENODEV as "not present".
>=20
> Fixes: 03e607cbb293 ("usb: phy: generic: Get the vbus supply")
>=20
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117094539.1352=
7-1-hsyysy@163.com?part=3D1

