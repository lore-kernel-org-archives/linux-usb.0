Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606355;
	b=zcVHCbTDmCOg9PC5b0l/6dz0xir/6r9HPYSzxkAb6oD8kEC31qHhNsyE977P34yyjNZy
	 B9L3wpdZ43XOt8GfwsF8t29thezK/kilYCFv0qi0KKogLElPIgTq3DTzFFcOxOToLxzwT
	 AngL2FTFlApEomd6SXck6rJihZ2ghOTaAw/yVQBl2JQKMA0BxA/un6bvvJy2JgrTW+OUC
	 h9nbhu867GooXEZgC3vpdB60G4KxuszCe6kkof3XEXT614odu6nta33cccG0ranQw2GMz
	 SNDb+yC45apLuny8zbN907N+4aboGFfYUs3e/5yTZpXO7zypXzBfX9rkL2T88iKl2gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606355;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RchVlFV2/cNWxeDlFlsR7Qyk/52npoRivvNohxF2Hcw=;
	b=06iTtMKpOnzAM4qkNoZ3k+gbQ/cZp5rEi7+yYG7TWzzxGHPRSeSLEm6+B5O4TVZPcquo
	 Y/E9MamoZaVCbiBFAQhFhsTw/pRYmvHDTbMRHif+zpGyZqTqsikFIOBbmc2tanRekQHAe
	 wAH0t/a/a+oJNCoJPTnUQQc+/SYKpcT2IfJiNG2Pfe2RjTwKVWhAGqFUTuovkXQMst6Xt
	 4CDNfmj2FH5Hja1wI+R4EBW14Pot/ir/MgtVHZ4NuSOmCnA2+/0XxLmQeJzagpJrETDtb
	 +GJfGLQ8EOLgC2FNER8fHXhhpeFcUdewAwswxxO5Z018uZoN0tEiR+LgFDiIKJ52qrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MC2Uzrt6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFD606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MC2Uzrt6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBC71F000C1;
	Wed, 21 Oct 2026 18:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792606355;
	bh=RchVlFV2/cNWxeDlFlsR7Qyk/52npoRivvNohxF2Hcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MC2Uzrt6XMwLWs77pjdtTHyVPlvo6jDAP3zEyb82hKK4NYkH3GaaxkOnFID4paH+l
	 Y7HmPtAMr8vHA2i5freLJh+OXVebp00hj2vB+GoHd613DSIjTnBlqUCuKUaqWHnsHi
	 BBWVFY8W/vu3nTqd/jQcjBHhVasGpOCrQVEHIE/KyhfNObnuvdBeC8hpcYc8j9ACJD
	 mLf//5K4FOm+Qd9SZh/jqSZC8WBLOFhDOqGqTwccTH2UTpPQ8QgYfuO33Edjb4wj8e
	 6r35afbSGN1dXGkQUK1oPPR8mERpg0njrG3774nSvERYtBwe3amtwZ0nulUviL7iE1
	 Bgv09dUx6fU2w==
Message-ID: <sashiko-outbox-180545@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 3/7] usb: dwc3: rockchip: introduce glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-3-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-3-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:12:34 +0000
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
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D3

