Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957705;
	b=njzqR+0RUdoW5EBR+kcwuSsLDfdl3IQ4f1rKsReQQyq439ZZDatJy8pjK2LONtYaI1KV
	 pIi2+Q8kcfhZD0+rtju+yPgS1t0WazxYLyB+hpcnq2zT46dRGkBIQuu4cUVL/cqDxUdFb
	 jzBDx4thqoaqa3LvmC9S3b7P5Law4h07CQwXfTey0w9hwutDrIpr59N9uj36jxF2JY5ju
	 Aojky/OxbISsHg1mMAFjuzvFhIHPY1QNoKJZIX196H+5pKufXk0FgbvNlFPfEd4EtwP8u
	 aQXrp64vsfhC6KXcDeQf5gpVvVikerKzIuee4ohBSzfaxg/MrbjRKCts/a5YpVgG90w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957705;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ke0aCQ7/SPdoepYfDw/kvCpQCkmRBMK6RnaSR3hl9p0=;
	b=xeYSPHX1Vh1pbd5EnrsZ/xvl9s2pDS254up6gV1j+mNEEb7Cj+RjfBXwPqsa2bostXR3
	 11PAQMG3tfafs6pbXzeFfvzWVJdywu0NPUcwnddOOoI+OnanPDpIvhJq5oQ3n3Ae8qX/T
	 YxmcFoKsQAMTJwEe9epc+Tze3igOXu4sIdPFutLNN57O5aQs7THMKgqs6G9EEPaIYFpke
	 teKqszYqIHeQZh/OiV/hA0oioRknMLPGalMPjxgJNacgUPcY5VgE9IfywBNJR/bNwvYBj
	 bH0xrWO4rWTZO+XFqXZgsPkvcQxO8FrKotRmfcweFid0qnIDpoUoWnlFrxDPE2tpRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvUIe5tl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83633606D803
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvUIe5tl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CBB1F008A1;
	Fri,  6 Nov 2026 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957705;
	bh=Ke0aCQ7/SPdoepYfDw/kvCpQCkmRBMK6RnaSR3hl9p0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvUIe5tlv3wwo8nSXufOxLs6fSeNVlzs7jd/1WUlL6oTB2XmuxXiLAmoZ9Y4Ms73T
	 li3i+z6z0pTi4xE6DgxLcyu6RfnwXcSeT9M3AI3CSPwv9WFR/DiPSOHfQPlTVZ1pWZ
	 JygQanIt7B9vDm6m8MwW1wnucWprHprcz9GNfMKtHvkhoaaUXBUXIHDx+F5I46YuN7
	 z9tq/KlVYpMFLIkop4TziVLRz7QeIx89YEJF1B4AxY1NFBtjTsOgHeJomGz+IpSglv
	 DTo/rwgGieno//tPHi6Zy7xBTCA1Etz8hLaEMDxaEEPjfNAcsBDMbM7SFlxoxUip9T
	 wARlda7LmBF8g==
Message-ID: <sashiko-outbox-201118@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/25] dt-bindings: interrupt-controller:
 sifive,plic-1.0.0: add Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-7-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-7-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:35:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Andes NCEPLIC100 platform-level
> interrupt controller. Add its compatible string, with andestech,nceplic100
> as a fallback.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D7

