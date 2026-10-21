Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606224;
	b=kNKK/CZk8vfTmE4+l2v33Y/ELzbEAIno0SgbHg/baMCKTZ1unPuAS3TI5LF+EqGsb2xa
	 j8LFcZ6WGKGdCyDPvxil7YEY6ZRURaNwXBHHt+8LyabsUQTYl+Sqf5mmd3LNbdy4GREzh
	 yzh8vy4NU8+GrFTbUlRQhac/l+rhVnTiO2P6TQ83wGakYIa4YtWI2onmS9v2Yp6hM/ELH
	 DJyAYe8pF99GZ1irNPhugSryz3VkCD7PjE+a/8w6U/wTJ5y2YFB9GinbsoCCNE8duir4w
	 /ZY+A9wJG+c9dPpnqEllIOJeu0avgMR9fMlsuoaOW2vasrx1kwgfpIRQVBzrX1ZkPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606224;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7fwhiR7eYAyLUu0KRfA+UX3Z9oj7kS7/Cw0gL5YUvcE=;
	b=hNVg0oCGWNuUEkwrPIBMuopNBOQH8U8YVFBxQQzsUeZ7LSYIK0UYiCLcAd9J95edZyrF
	 qq9P2/oC1kiti3mDAx2S2nF/TnxiOdfPOnLRbv+plqetraxZluABpJ1J75KzggWohE7rO
	 p+Oo2RMcOS+dDTTH2dRKrHuz5z74eR9BCSXgWmdCqRNPNWhEqbCmtwpLV3XKC3R/pEjEK
	 P60TLGqnEAD4Fnc49Sgm8CC1Nsd9donTybZOPXe3pk/7KKqQ7CM+pngYdGf9gi7DIG+C7
	 K1hBaDo8UXBfsv6Hpf1vIAGKeyhm8ED2EiLLfhTtofTZWOJpnmmSEFASSZkwZdWGvyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iy3uNefj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0258606A31E
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iy3uNefj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4248A1F000C1;
	Wed, 21 Oct 2026 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792606223;
	bh=7fwhiR7eYAyLUu0KRfA+UX3Z9oj7kS7/Cw0gL5YUvcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iy3uNefjgjzpj3bEz+EwC2Rpb8YZDiGViE4S+4+F6CLMIrGx2nQIyTgcMLwarCxon
	 Nd5UiLoqn+UvASDnI+yzBnEi8VXZTF2KkDckTjwBGBr+C54ys++kDM27DYE7bUH4tm
	 xXVAbhZGvDWSuJ1D9r+WoOxdgAniOA+A4RQXSauNJc4ciqOXh0DWnnTIpIQ7kWy+RW
	 JcoTCzJ9VGFNuHvH/1LteBaisqIKhS4VCvKIZsEsEe6Tbqf44hJSP3JN2RhK90Sgjo
	 k4PFTDeip5dfVWQvc2/UwJdGE1LzFsmKiuh/k2R5FOrnwQZFyRn2EMoOORwK2FjQfp
	 a+OsVz7dHiZyg==
Message-ID: <sashiko-outbox-180540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 4/7] usb: dwc3: core: add post PHY registration hook
 for platform glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-4-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-4-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:10:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for custom PHY handling steps in platform glue code
> by adding a post registration hook. This will be used for handling
> PHY reset notifications on the Rockchip platform.
>=20
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D4

