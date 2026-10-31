Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406122;
	b=stHUOruhEv9LtGhThCs5Mr5wcZe0dN6f/kkdBTx4nC1sajUkB0zm+AqqmDGVm0Dg2UNh
	 lYa2sXJqlfznL1GthQTofBSpwOnxQlnMMQD/m8Ua3vG7kC/lthBsge4B13kY6ow6knC3a
	 OUYrU3GGNig0Gp3FPeh+LK8xFrYblKJ6c1r8gS3F5TgQac7O9CU1htVoxL1ni8vuRHNyw
	 16bSXv3pzWzS9mig6W+V0gsHSq5dBesRG7yTBTsVw0DjpAG7VBrykL6nkT4/USxW/p+Qi
	 /nLmXZsll7qfteBnHONXptk3iOuLNU1ShzM1hu2s6gisiE+w3+m1EpApA2qWRu4uIKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406122;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P+gXizfPfu6Nh2f/AlrJPmbARrZvgx92P+LP+P00FOo=;
	b=Dbrh3GkJGcBYmxZfTYfrVE7dTB1RvgnLUlVseMmyiBcatpntCosDgjwwAN4u1gDt1Wz5
	 EVJuVzkX7JOtH9ygv4DwLTZj7CFfPRmp58sWBgOg4OW5hOdVslQccUxKSLt7MxikubkdV
	 ljJgfrKLwALlGASlDonpb7hwXnVVQMhZiP0wEJRGDtJWzWXvUnfCbMhDbAPXUCMK2/0K0
	 wqqJqVocg5zf7dR+3ahN6h78t10lrwLC/T/hVqdMWwKq2+taTX/WS5/UgOBppDmDNPhA+
	 CpxuVNDIbR8THxvHZGqGzWZrWrhK+A2KaImRhxkQWiMpQe/0ha3mu+HGjBA+BFVZYxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SS4yo4Xb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0E9606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 00:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SS4yo4Xb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ECF1F000C1;
	Sat, 31 Oct 2026 00:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793406122;
	bh=P+gXizfPfu6Nh2f/AlrJPmbARrZvgx92P+LP+P00FOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SS4yo4Xb0Th0c3HIMZU+azJlejF5gVAduvNhs8MKoMup9uqEyZWE6FdnHmesYnjzg
	 znsJimshrgV3NJEAdeXKwtpzXG1AfrjpcHhro4Up5HVSH+FoBaeE824nYO7U5zSuiU
	 534ZFtWmlbiSLWWf92Tw5AL8/Z5n7/U2fwq0gtJPi/EcXPDYLjqS1gVT+8ELFpTXht
	 VkFPrv32JlRzA7Vs8RU4THO2DmzZl110sw/Z6FGcADqliA4NrMnyfTUBbkyRvafXg9
	 dT0R93G66K7AHXvYRzukCRIFqs5MStdlPs7nV3UvLf2wlimJIsJDPUA/XPmNg9ZeB8
	 Vr/bso9LCMsQQ==
Message-ID: <sashiko-outbox-191672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] drm/dp_tunnel: Allow BWA when the DP IN adapter
 does not advertise it
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGllZ28gTm9ndcOqcw==?= <diego.sure@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 00:22:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Diego Nogu=C3=AAs <diego.sure@gmail.com>
>=20
> On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB4,
> Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
> monitor whose tunnel is created second is limited to 4K@30. Which monitor
> is affected depends only on the order in which they are powered on.
>=20
> The thunderbolt driver enables the BW allocation mode (BWA) on both DP IN
> adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
> group ID and the estimated BW. The DP IN adapter, however, never sets
> DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
> reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:
>=20
>   DPTUN: A non-zero group ID is only allowed with BWA support
>=20
> [ ... ]
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17742
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Mika Westerberg <westeri@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Diego Nogu=C3=AAs <diego.sure@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-dp-tunnel-=
bwa-flag-v1-1-f94ed3179349@gmail.com?part=3D1

