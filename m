Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681823;
	b=wNnZwDkWHM+VuerLvRHG0mHg/hUVmIFLGOHofBT+t05mbUHsIPEymnBXHolG1oY5rx0e
	 wsVv+mJN9xGTQSRB8Npt+Z1jgSqykA13d1aNDtFpiVqG5LbUSCnJPV+Rked/3jujNqSft
	 99N4LUIo5586h0BRW9PFK7i3MorTBGywyfjGoIpgLVb2PVkmRWBO1LQT0ivUbz+tuD9SD
	 eDM5K0A1KGK1Wri2w7u+IRufKytEZCkQBwpbP3qzq/rnNSipTdVpg3gph799RsiftP7uK
	 7yZu8AXOi/clh2IoFlTFfl2q6ZGzzuz74ZogXfiU8BlU4v3GPiSt9SIvKUMrQprgdgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681823;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=trLJ/62EHyUushcTxlOUvDekAHqmSdGjq6uJI2O0qg0=;
	b=rSOESguzUww2lwk5vcdglwfP3A2oaMJlUW489XAqPu/JtKsD9+KYFKRT8eDiPAsmxOaD
	 09asHkAgDpFDyoU17nM12L1tUwgA6LDEW+kHHgzdQq3TKGgZroPl31a8nE0N52Pn1q3he
	 5RPGULRge388EVwC7V5u4hrwpFCJhKrI1IHLR81OyjOdDqwW8DEZC9Ofi/cTFiM8u0lR9
	 jIUb+hvvIcxRY1EKPacwAArjg7fFsv01jVCOx3PQolRPy2Ft85f2oq2Jd+O9CibsbulHU
	 nmlQuVgbZTxuo6beIVsLMc99qIQHJKtJVZdxGhsfhCWLQb/KxEyaHAZTs46N3fX1Gng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ztu66FY3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DE6606A323
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ztu66FY3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110761F000C4;
	Thu, 26 Nov 2026 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681823;
	bh=trLJ/62EHyUushcTxlOUvDekAHqmSdGjq6uJI2O0qg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ztu66FY3qkBpj8mQ4/77nsKBxLYG4agan6UwIPXYlDvNIvKHR1RQEz1SPO49SEW7U
	 /rzPgjMV65NeKQOJwZDL/WfcTaGzDNqDHCNW4fapZXdfZ8xCjVgSKDaQdN5aSuD24f
	 6c7xz6QT5PYWPdr2lbEuvpR5DMm5Ch8mhLcs/z6BWkAGTlnEt1Y7UyBcslUJusPxND
	 U0ailRCWIStYttFKEFKaJk7ETgqftReioZRgbHGge8dB+DRSJEddJsgVAXHkKEhabN
	 hat6n8VX8lpojkLaaazqIWMqikGaSy1MsB3A02iIVDsjU4eKIRTi8bXN8LWjyJKFtC
	 YcqOjNnRO1vMA==
Message-ID: <sashiko-outbox-235019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: vialab,vl817: derive subnodes from
 usb-hub.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-vl817-uneval-prop-v2-1-9640b58d37db@iscas.ac.cn>
References: <20261126-vl817-uneval-prop-v2-1-9640b58d37db@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 08:30:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Currently the binding for VL817, a USB hub chip, doesn't allow either
> OF graph ports or attached devices to exist as subnodes.
>=20
> Change the parent schema to usb-hub.yaml and set unevaluatedProperties
> to false (instead of additionalProperties) to allow subnodes defined in
> the hub schema, including OF graph ports and pattern-matched downstream
> devices.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-vl817-unev=
al-prop-v2-1-9640b58d37db@iscas.ac.cn?part=3D1
