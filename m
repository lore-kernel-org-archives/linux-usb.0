Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367518;
	b=M23B6eWMw/Ay+9Doqajds1FELqHHmzcNnPzzKgkvg/+9Cx51+kDkmtvaotkRmrCHkkyA
	 fzg6M2cZBxG5fLU+naw4W7r4/f6BbqKM5wt/FvXCcQRjZ2Ia9hpek8wT2Ru3ZaTrYkxhi
	 xcaW0+0p4pE+eEWHfXqL1K6Mpsp3uIKEvCARvaPe7G5c765o57dHZQi1tmgV9Sq/KObbF
	 ZB9AKpM7qgKYl8VyO7Ye0kPeh+oFmhETWHmMIhum43ojTpRVALf6X7BCEqUtVME4l9uNe
	 ITX4YH25c3O6LNy9sGLz5/RCDd32RTVtznhRnjlXmEt+XYtK2vkSpV3BIebr7YNddzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HqG8bO2cxX4jsomhkJQD94V6CZ2btawHUoViN52Ii4k=;
	b=v/hB+HtLms7x9881pIcsG5fIMsY/ynmldiSvZfAfFQ7XSbmspCH7Ci6YGF54tIEztHRV
	 nWkG9UBRAnhxSbsobOMB3LFQBQIdOJ2o46AqMxDDla3xSTkN+OqV38EIrxHgWsc3MietX
	 6EJjvMdvtd/mQFTvkfg4GFj0i0tTbymFECljOytYDR8mXADBhiFmelgBhSr+bb5d9qV8e
	 jyI0tTbn7P9nHqg/uIuRYD9Rdf6+oZvRVbx+SFK3q1weGhTfV612PhHh2e0+QEFkZ7nJq
	 Y6X2HSQNLMuH9nN9UNkwlYbzdsSg9AiXSO3o2FgokZl/aT/f8qqtLbm6OuvhssxS7Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NveKkVmp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCA606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NveKkVmp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77F91F0093C;
	Wed, 11 Nov 2026 03:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367517;
	bh=HqG8bO2cxX4jsomhkJQD94V6CZ2btawHUoViN52Ii4k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NveKkVmp0jDhZggB6SMnPd2iWkUQnf4nE6D2sTcvYKKK5xTx+Ond5ma7IsEqLgDAC
	 3DCI6qequrSjQBdookaprNlu94jE/vppt7gYmLu7h+3OUMK+oPZUAqXyrM2FF+WnHC
	 wdhTM9Jn1/n31KPsoNUU6txIvxQ8bXmGp513WjToroyALGjZLAhs63BaOIjCpDmlQU
	 +4sATCOIgjk3f8YF+ozdS6bfcJmFTHJHaZ0y0f0jaV6hp1vS5uOAPZt85EEdPp7dXO
	 /Jji0H91/OCSplFDRDq0UmfR4hdeupXcDnKVWUH3mqRLxA2IHTYDdGezFCRMgumPQG
	 GsfDKb4Q89Hzw==
Message-ID: <sashiko-outbox-208189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 08/11] r8152: split rtl8156_enable/up/down
 into per-generation functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-9-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-9-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> rtl8156_enable(), rtl8156_up() and rtl8156_down() had accumulated
> tp->version range checks to cover RTL8156, RTL8156B, and
> RTL8157/RTL8159, including an early bail-out in rtl8156_enable()
> that skipped most of the function body for RTL8157/RTL8159. The
> result hides which settings belong to which chip, so chip-specific
> register differences cannot be reviewed, and cannot be added without
> touching the other families.
>=20
> Give each generation its own enable callback: rtl8156_enable() for
> RTL8156 (VER_10/11), rtl8156b_enable() for RTL8156B (VER_12/13/15),
> and rtl8157_enable() for RTL8157/RTL8159 (VER_16/17). RTL8157/RTL8159
> also get their own rtl8157_up()/rtl8157_down(); RTL8156 and RTL8156B
> still share rtl8156_up()/rtl8156_down().
>=20
> The four chips share most of the up/down sequence, so move it into
> r8156_exit_oob() and r8156_enter_oob(), as RTL8152B/8153 do.
> Likewise, rtl8156_enable() and rtl8156b_enable() share the idle
> spin-down and L1 NYET steps, so move those into small helpers. The
> FC patch restart is also done by rtl8153_enable(), so its helper,
> rtl_fc_patch_restart(), is shared with it.
>=20
> Each extracted function reproduces what its chips already did, with
> the guards that were true for them inlined and the ones that were
> false dropped as unreachable.
>=20
> No functional change intended.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D8

