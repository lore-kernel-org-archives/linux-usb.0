Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792848818;
	b=uJf/WdXAhlxsP5n73wlSOHD4+Frfu0qjbURsZTloaZn/ijeZnEu0smEQ/XRWSECU1/Wn
	 yROhDJUbECTHjn7UPuFatOsa8fHpevtIXyU7p9W0KFXqScAt1Dr3JUzz7vcJcDAcKb6tN
	 5n9Aj0qfJ+RwMNNgN56WCDta6Dqa94Z3ps5lgxu/3gnEqfzqTBA8yANsDjFTzSplsmIWD
	 0HTByd3fZeI6I88khmjiu+3g1ZXHBn0J5dPq25W9oG+KKy31Y4kRZzyHthjpTG2GF0JAP
	 sEtvTmoQbgWeLFqOunvUEFh0akbG6oH9STtDDEqn0+3JXCTwXB3iqoekBVLc9dT7nbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792848818;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V8iPnSTcWA7siu9rwWTfrRgYmyEWIr+jQ+sEYBs6CvU=;
	b=ZCnFUjN6WsBCdhOOQeSKi3XzLUVPrMgTfKuArN/DiL13u+cTa0/pRwNG4ek2vabHv0dl
	 EG0mC1aG8+3ckIy1Qxidv2mkSYBfyvG343WR1Fjzikvk2c0GWRet3dWG7NFfrGe+w35NY
	 RdPZ1tf2R+p2VbatYnFYS73tbYNSmlimlzsRS7gEpxrUHSMiTbLVNWd4YXRmMtC1p3ZUx
	 GmLKcHtj7Wqjrp+HF67J/V0q7miA2EfUEhZYpa59sPYI6OT/huYJJKNtwEYbGZ6o7HP6S
	 wx98vfrJgtVt6UqHXXpULwd2fBJDRGuDQ9UtJpr31T1Wo73Ve+7AmrQrWAm7w3HTJNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ni3nypJm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499A606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ni3nypJm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A581F01825;
	Sat, 24 Oct 2026 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792848818;
	bh=V8iPnSTcWA7siu9rwWTfrRgYmyEWIr+jQ+sEYBs6CvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ni3nypJmgRDErvhx03loyoUaZu5Lp59xm25R07rYy+IduQPS72LvoLriHJ+xNtQVi
	 pZqOrpQl0WlOk36U9mdVT85Y/cUDGbLj7prTHUIE63aYmov2890Ljytr2H5SbUDrrx
	 38CI2oWLaTmzT4LvN0nF9aIi523haL40XEf2bKeBjCO6it8/CxRX+MnTcoKljLzWjB
	 Sfl8DGGLaGjWIvOkKOhnGKACBfTmMkAcO0JfYSM6R3laLGIt7NTKwCsykwbsW20RwN
	 tUnhU0vpFz41pvAiOU8iUiQ4lLNd+QR776BjzD2lHVhXt8n7Y3N8lhlUoqZvHeA7xp
	 GFe/l9S6fiNWA==
Message-ID: <sashiko-outbox-183742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 1/2] net: usb: cdc_ncm: don't enable BHs in
 tx_fixup under netpoll
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-cdc-ncm-netpoll-v3-1-6284ca03f967@tipi-net.de>
References: <20261024-cdc-ncm-netpoll-v3-0-6284ca03f967@tipi-net.de>
 <20261024-cdc-ncm-netpoll-v3-1-6284ca03f967@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 13:33:37 +0000
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
> Every caller of cdc_ncm_tx_fixup() holds the txq lock with BHs or IRQs
> off, so the softirq user of ctx->mtx cannot interrupt it. Use plain
> spin_lock().
>=20
> Fixes: c84ff1d6dff3 ("cdc_ncm: reduce driver latency in the data path")
> Reported-by: Mikkel Eskildsen <mke@visotia.com>
> Closes: https://lore.kernel.org/netdev/PRAP189MB185019A5A8D411482BB6E0CDA=
9982@PRAP189MB1850.EURP189.PROD.OUTLOOK.COM/
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-cdc-ncm-ne=
tpoll-v3-0-6284ca03f967@tipi-net.de?part=3D1

