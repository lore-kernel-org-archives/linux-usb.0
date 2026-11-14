Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618500;
	b=PRbfs3UqB6L6Vw1yBCmqdMGNu0nPC3u7W0EF8pWtqSqf4nC171w33cATVR/tdBxYiMor
	 VEVaAi0UpW+CLo9kC+rMkGlxKGuZBqr3tpe4+zYx+hF7QrH/ZnxYM3KF0MPtx36PIEgsR
	 WAHgikD9LiedB/RsRE4T0tvyvkNESQYzfnreN8P+ggcfm4pupQAyz5zTEG1EW8vAi7cel
	 slKcg+nlsL1O9eRH+eZb5zthFFmYAKJdWHQG5YvRq68T8xsieq7E+XgUzo/9J+M7/BvAS
	 QlYknHmFZn7APaYs41I42bsDynLARr2S5qKUv0D0nAX83Tkrb9yUdruZM+zhkLOkm1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618500;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SWMF6ggVciPfA1V2WDNdsaPhExjNY2Rto/F4ZFXeuos=;
	b=VI9FEXIyUJwXZ7jRouVYdyhENmvtl2yfWJfVVKRAlR5QDFzTNycnujauxZtV9XA8aTSM
	 v087SA4Q0xOtGcs8eE7TjZC474thwoY50eKQoD8h1kGoQUFQ5B+hR3IaAN/4biISPSkQT
	 POiUTkBwnl/hTYeG9EODoMnGwRwpx22YkBPCtxwQXQf/IuTCWStwgSJ+sSiwXIDxm1Pqm
	 xl/di5pzgeY+jMYDZqkM516gaf86FHHxI54p6IDcoAcOYCQsc+rBHCXUonTFdM1scqhQM
	 68az2up4+UDwaa0tknA19Y7+WsmG7V2HPVpqiNL1zndZ5lXSvSinLGHXpB6Tem8ULuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j0/nzemm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54409606A32D
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0/nzemm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CFB1F000C4;
	Sat, 14 Nov 2026 01:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794618499;
	bh=SWMF6ggVciPfA1V2WDNdsaPhExjNY2Rto/F4ZFXeuos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j0/nzemm/YT40BVts7bjcz6z6jciNYJMFMD+qFrickq/HWj0+76Aq5KZOGOiLXQDG
	 IuTV9oP4KVQFMS1foA+HaYAho5uu58l5+nxmQgM1GYgJzbsRPf1h5J2lzAR0PPHFzk
	 pKOwi9jX6cOcBmQGjgMtcBSASPnxH66AEkEvzltSe/Pvfu8OBg9IhKhknlrJfdHWl4
	 jHF/iaPb3IQ3McxMx82HkD9eLXcgmDJBmF897rKZFuwmzQ5vbarbdxmCkWUHWwmqh6
	 mTxW/0uTJH7EVk6a5T+aN/m7z/v6sC6ZoUmlZQhj0G9zNWL3jkY5IEAlh299czR8LP
	 +xaCEnTx/zYcg==
Message-ID: <sashiko-outbox-213978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 3/6] usb: dwc3: rockchip: introduce glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-3-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
 <20261114-b4-rockchip-dwc3-rockchip-glue-v19-3-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:08:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Introduce Rockchip specific glue code for the Synopsys DWC3 USB driver.
> For now this handles things identical to the default glue.
>=20
> After this change the glue driver is mandatory for Rockchip RK3588 and
> RK3576; it does not make sense to fallback to the core driver as the
> whole purpose of the glue driver is fixing race conditions resulting in
> SErrors and non-functional USB.
>=20
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-b4-rockchi=
p-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com?part=3D3

