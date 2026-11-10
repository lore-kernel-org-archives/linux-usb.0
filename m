Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321923;
	b=2OGIf8ny3Spuur3Ghm479OaTh+jl0EXCUj3teOWwgHn2uzXfoVX33UOYD9B7d1WOwIYz
	 aa7yRRN+ZkEM914mESgy9+hil6D36Pi7ZaemXfLEmiNjWPf6xYD8ffl11f2QFrbaam7CU
	 DU7pjZbGOgjcDIyns1fV1UkrU48HZbWd8Nz/aRjvOg+amP57KmSWrc2S7XvkZCni+OcMG
	 GSxX2SUX0T1yJWqd0rmluRDxL9OKnUNORVjH0p69+5j+eDfMgudgmThETBTumrZpwe+e5
	 lPFGRwaeWbRTw+pGhgJtGaX/4QJdklx69bfButA8KdZZLAczKhvAzr0iQzX/aR37WDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZigTTJSHquYTXzoPTiAq9uq3jNSvtjuoEDkBCxdPjKs=;
	b=pdxRo26YexU9vyzpCEmo/vCSSpu3O79sOuVCjL1S2vfexo8mvRdtlmnfehX5NAqU+MYV
	 QQGbr6GIlEgn/+id1GqL1mTIj+JQGTVTQ6XzJ9nSQ13fobXgajcOxSiF4S1E8TmBCii+R
	 6w3N+dKQFE5Ea5p4qweo0GkZNlm0EYBsUg1lgF1ATrwQi4jM5KGIhKVLbGihvvFHx5FYP
	 D5ib3yedbfW9QRr7RfMxZjowsQoucWuPE129KedfFYTqVBNWWrzDE2hmYgl5nWSOysE73
	 8bvW9tPiiVOmrSUFDpswCGl6+PE1NypNxMS3Lx21s8kL1q0xu0Tt6gVLD/n/ZCI7BRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHb3wVYZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBC606A338
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHb3wVYZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AF41F0089F;
	Tue, 10 Nov 2026 14:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321922;
	bh=ZigTTJSHquYTXzoPTiAq9uq3jNSvtjuoEDkBCxdPjKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHb3wVYZxDoFpew726D17SsYNkWWuIksa0+Uqh8t5fdiUJP54iEViHkwWY4rpSrwe
	 YkzHxq61l/AmqHRiiBNCQaDk6whujKCJNrPwZZXVEhQx7fPO85o8VoysOytL4up41B
	 9cTmy45HlBTBsowax/52zibZY9IkkNnRBpUYUCoxXSxZK47/IegQhFc3IcDN2VR9Q5
	 5Qns1qM7m1kTFBErBlXwHgtNrr77bH5syS7cJ49seCbOsjsPoNgxwZl2+rX2enJxii
	 S/O4BI+YzMhd7TTV62xz0L/CmyEAFna2gyWc+34AcLYJoSDAQJcqDmCjToFc6sP63v
	 vYrcFQTaUACsQ==
Message-ID: <sashiko-outbox-207209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: bdc: Fix potential ep0 BD table leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
References: <20261110-9f141e6bc8-usb-bdc@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 14:45:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The ep0 BD list is kept across disconnects, and ep0 does not have
> BDC_EP_ENABLED set after allocation. Consequently bdc_free_ep() skips
> its tables before the BD table pool is destroyed.
>=20
> Free an allocated ep0 BD list during final endpoint teardown.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: efed421a94e6 ("usb: gadget: Add UDC driver for Broadcom USB3.0 dev=
ice controller IP BDC")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-9f141e6bc8=
-usb-bdc@mail.sdu.edu.cn?part=3D1

