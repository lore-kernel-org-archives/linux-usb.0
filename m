Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367513;
	b=hTvaLkw2DT/PjLz34eOBmQqdhHW2wxp5h7x40YTWNwiwRq77wIYbb10wvU81I4rpVeSA
	 CchoN8ms15IW0Eb/8KgpO8BiWqyRhCdlTBfW/uTw56aYTPwmwVEDnLoZTFiDHH1lPOOru
	 Qq90FpRR2cjWomc6DSVOahV06eoPXh2p6c9/23BG5Y3FzqQjf5CZ8LW9C41rkEES8RfOv
	 g8FjneBQQIIrv7Oc5zgXpnmhTH8HHaHlnViff3J3Xrx58+83ral3q8bMa87XtxUv9Gs22
	 NKGvFg5CQTMy9R74Gmku9TC40Dgd1/q99jdH4/Ol3IuUpZXYEL5Zk8e6aENlvdSSQtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367513;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WnmU3nHDCT2eLzsRups3SCrLARU3rpCL9Z7Kmjq+XhU=;
	b=QbZUxys5D0ER9gjodenhm/U105ugQLTI8zCmxCz324dDD0KRpXA+70C35daB9Xx3wWj3
	 UogR4e1LY/zJPLIkYAJ/qD5YWMXSMQqqqtm3+ufYvaV+10qOuku5Xt4NecWTg4Gnu9Y0e
	 lGhwZp+XsmGhpHru8V3zz4OC6RJtQn2YxZymofa/nlQAzvgbaxV0nbPXncFcRRL4M55n7
	 oI2FVlYScAgpHuxff1DTpX1eiHpS09NmOLer2zA6iKH+OJNCBxmdyxOr5f1yQ1u7FG1or
	 pfuc6gfUWM0QngDNzATlsausYiMYCM9eOFlTTPCZiiXI6FQ5XCyBXfHZL0Hljhv1HKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JZQl6/0G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B959606A327
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZQl6/0G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24361F0089F;
	Wed, 11 Nov 2026 03:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367513;
	bh=WnmU3nHDCT2eLzsRups3SCrLARU3rpCL9Z7Kmjq+XhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZQl6/0GdFlD738BxS+B0KUGA3PLYQR2j43Fb0n9zd/0MKFddOdvTpcF7DQXHrkbz
	 iAKWnzHGJTG5enkWm6DbjE9UZSOInPSHmUuaMeEoHC/22Jf4VUskSUFAZ5TpdtvCRt
	 wl4fBMkStuhVnrftoIXvFOiEh6EWRGxTmuUcNS1+ZTAgmEXOZCrafIUAgxjxF7Pkwa
	 emILkljZxxoizAqAvuEpg0C3SGEOCBodhgAs0zrun/OIGkb5gI/rTCjlmN6sSd3Ixn
	 0KxJ/9JS3K9Ke8tv7phhoDF+lyDjq4U2eBQObHi24i2+iI7McKLkzW8k0ZmE9okF3d
	 gsWjpINuHiPcw==
Message-ID: <sashiko-outbox-208183@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 02/11] r8152: add rtl8157_unload() for
 RTL8157 and RTL8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-3-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-3-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> RTL8157 and RTL8159 used rtl8153_unload(), which disables power cut
> with r8153_power_cut_en(). Per the datasheet they need
> r8157_power_cut_en(), which r8156_init() already calls for them.
>=20
> Add rtl8157_unload() for them, and move the Interrupt Mitigation
> disable that rtl8153_unload() gated on "version >=3D RTL_VER_16" into
> it unconditionally.
>=20
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D2

