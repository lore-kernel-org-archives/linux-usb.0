Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486758;
	b=e9mr7NoMybQ0uiGL5He9yakiNntcxAviQZAkd3ZbUSn5wEGLDgIGWL817AJ+VgH09Kru
	 I4v7YPV0Gu2FCUoP6lW5LcFGmelwdu60E5z0gsqNl+N2jzUWZGP6PzFaIutnfNzn73se3
	 pbWS1fn0+GZqJ7YKaKwvahkdqXnOMbVMeUiI3XhZ1PVTik494MP69o1H1dXK2B75XOOQ+
	 lyrZbx9vQr4awa7ylMD2vDdIPe9o5zkT9CKXmfSmkOktfSZ7S4PaiEIFVMXd1Yf8cTppC
	 h6XVnp/44bme1BLBw3vpkhiuqr4uHYSdRSTs2vYwXeWyGUJa/XKVLeMu1fxVu5dc2rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/cSNwYfgZ4wkv/7/VwPSvsHFuEnCWUKwmBdTfOzdEX4=;
	b=ETA32PCTG882SWtUEMDWMY+NAnQQE9tMNSFYeHTBhjcj+JaWhNqYsIgNKuwiiJAqzIQA
	 8Z7WWCZMQggPV/dLBLSO6UPI0jGSLf75LN+MBSxfFWCKjFudImJdVVrg/30K7xM8M8dcX
	 MhXSaUm2lwXM4Ziyxq9snKpmJ5OZ+yndbRA1fJkleCcUyGG9ISTODzxrLZfuUhK/MiL3e
	 ScJjooUZjqiIvIF5lnjUV1KSYHeecv9Jo5twnwrO9ihtso7QRk0gG4WlB8Uid2p0a5OSM
	 K4AIw+CoMU1iV5tWsOiKFECJTFvdPPXLODmnUsA1wwO85Z27rgFHbgFT3WnC3H2AQZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFUsZ6m3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C836606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XFUsZ6m3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1851F000C5;
	Tue, 20 Oct 2026 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486758;
	bh=/cSNwYfgZ4wkv/7/VwPSvsHFuEnCWUKwmBdTfOzdEX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XFUsZ6m3MbEYtp59cnWUzp+21HJWnPMEwLhEIq/S8beggTQ0dBZjUtbuFflZHozEZ
	 plYCZ6f2M3UCVTOl0cd9ZsGpECm0bErTsA/PjPaaQV3RyiEqgzzeNSybn/4mrNubDO
	 gshlorPZy07KdCtqxICRnY6pwL6VqWGCdwCEGru1HbqIXlZ2ButvKxBtQUpI4ZjbVu
	 ZcsDvUPN4BhhZ5iW/khI4sfcx6oVdtynQM1GpIJNTqZISwq2f4/pdr5KTbz90EuR9e
	 BvkdOwg1LfjPE+Xnolzaa7BIRg21MKDvXZCdKyBm0nEscrU1r12axoeDixhhqaycCy
	 zDDSd0FcjzJaQ==
Message-ID: <sashiko-outbox-178670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 1/2] net: usb: cdc_ncm: don't enable BHs in tx_fixup
 under netpoll
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-cdc-ncm-netpoll-v1-1-682184384b49@tipi-net.de>
References: <20261020-cdc-ncm-netpoll-v1-0-682184384b49@tipi-net.de>
 <20261020-cdc-ncm-netpoll-v1-1-682184384b49@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:59:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> netpoll holds the txq lock and calls ndo_start_xmit() with IRQs off but
> BHs on. The spin_unlock_bh() in cdc_ncm_tx_fixup() then runs pending
> softirqs. If one of them transmits, it spins on the txq lock that
> netpoll holds. With netconsole on a cdc_ncm device this ends in a soft
> or hard lockup.
>=20
> Use spin_lock_irqsave(), which is safe both under netpoll and on the
> normal xmit path.
>=20
> Fixes: c84ff1d6dff3 ("cdc_ncm: reduce driver latency in the data path")
> Reported-by: Mikkel Eskildsen <mke@visotia.com>
> Closes: https://lore.kernel.org/netdev/PRAP189MB185019A5A8D411482BB6E0CDA=
9982@PRAP189MB1850.EURP189.PROD.OUTLOOK.COM/
> Tested-by: Mikkel Eskildsen <mke@visotia.com>
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-cdc-ncm-ne=
tpoll-v1-0-682184384b49@tipi-net.de?part=3D1

