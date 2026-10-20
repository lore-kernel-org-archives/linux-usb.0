Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486759;
	b=LDT5gTH9CVJvjKciPuFAoAwmXSQ8xGh4LFzeBdFucVtPDS8GL4NClspVszPu75fCCbJQ
	 cjUBiHtPvTSWuZHiHitT0yEKemoCbVeXs/jZTvySgPzzt2M/E3u9lntcyIEcJ5IPOpWQD
	 aYgnm+wNuT5EXkY7v3i9QpHJwWXaPd9oGBXxZs/uSXLxSZhqwoVjYy4pSMTWV4MAMF4jz
	 XIJof0XmSUJ6/K8wsLuzedsm4HRJLYU1y7pLBXd3O8ogths0L087+ZSAo6CV/61u6dGR+
	 Y2d7r4TYMnOyokL6jUTxCWK02ENZp1hFiH9l3kaK9YIarEIs7yhYjyn31WM+5ufZwwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5hLCojN9KrVafvBQWJ7moiRrNTUCtzMeKSoMB5mEF+g=;
	b=zbRAy912bQAKcYhGqXd3587lxExkgodMxWjFaO/ObNAbZkVM4OIo3uJd3KZdyXihf+z/
	 vnGETY+ekDa6M+sPA7uBI1+SImtcR9rjL7GSielvt9MoFVz0Yq2dhFETQT03mQb98I9BI
	 jmp/OLGagOYS8RK4P+qNFRVn9db9vdS2Tz4Oe5nzMbfHK3YX1pUcbBV5k88ktXWZIptt7
	 yuU2vLMC3IqHf4X2FXtotP9tuLVKJPDQlSayt8e5M+7KhkspLtGriy0xCUkAzGukcaEnP
	 Yb7Q+SRcgW+M0pUU3ifsV3JNbc4X8BqQUNu3SD2Zwupyc7oqI+eFmad7dAaDKeumjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbHps3Fy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938B606A32E
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbHps3Fy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC51F000C4;
	Tue, 20 Oct 2026 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486758;
	bh=5hLCojN9KrVafvBQWJ7moiRrNTUCtzMeKSoMB5mEF+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XbHps3FysjKTGepxJB4RtavUryxj5dcSLB/TZPm+IU/hGEJ9N/NPl+TnfRaYgf3Tx
	 zGfNpqUIoPvMVK1ef3ruYiq2FWKkoffKlyaCi0GUSgND6bapBZrSP0pxyOOt73RsER
	 IHgNBIWjOFwRzxlifxBZIeebqYSbrvCafPZ+BLQ+jKoe21vYO5paiR5YpCPx9zIHIa
	 DNwKuywKG4IUZKBWN5rpDiXD/YIXQFc9GjphJ4iXE4BEMbrn7LrZoPpM+b22lfM1EP
	 K/exg+7Kh++QadsRmok3B+puJOWCwit8DXnZnjSErlkQyG0IBvDzZ3gXPmv3E2f/kF
	 F7YzZC1ILu9pg==
Message-ID: <sashiko-outbox-178671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] net: usb: cdc_mbim: don't enable BHs in
 tx_fixup under netpoll
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-cdc-ncm-netpoll-v1-2-682184384b49@tipi-net.de>
References: <20261020-cdc-ncm-netpoll-v1-0-682184384b49@tipi-net.de>
 <20261020-cdc-ncm-netpoll-v1-2-682184384b49@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:59:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> cdc_mbim_tx_fixup() has the same spin_unlock_bh() as cdc_ncm_tx_fixup().
> Under netpoll it runs pending softirqs while the txq lock is held, and
> a transmit from one of them spins on that lock.
>=20
> Use spin_lock_irqsave() as in cdc_ncm.
>=20
> Fixes: 9bf211a30b3f ("net: cdc_mbim: adding MBIM driver")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-cdc-ncm-ne=
tpoll-v1-0-682184384b49@tipi-net.de?part=3D2

