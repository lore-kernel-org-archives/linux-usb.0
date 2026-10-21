Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570314;
	b=SaA4lPEIUx14MA418dib0XMHVzNyrkjq6IHd65yKy8UL9dEoC0Ttr8BcxuTuJiRJwOWU
	 dTVs9YGS6YJgSkEhmZW4TMs1HL2kya2jDu2zYlEHzllWAFUAYHmJnqHOJ+CSvJ4d9mXjO
	 bPde8JxKmw7tj70LVly/6tWflUvsPV8LqC1iLoYuCqlU4LZKUdQaN6yReMFf5nIwNBAzg
	 B2KDPUhu7n3NwJjmg3dysN1okxCJQRF5gKEhwllyv7fE7u3jYgYQNb2WZKl+G7bX5I17r
	 ltRENlFtbpUve4R7GFwhN4kW/AdufmHMZRzRZfWT5agdwJOcFKvxgbR0g1xgc8NziSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cqGN88ZYSx+RjKyzmamolQzERQ0LDoNuYdNkMhp2fFo=;
	b=1Z1IXElUTfq4OWaHsg7Mt4cjw/XDlQH1kw0FilsR2sbHv71Q8OJvb05Bfs9Qg6UIMOq9
	 TClUUA6ZbtFTAx8QAyEoXZKzkB8467PrjEqsCle5NsN6bRES0dtej2E9ohgJR2J20xoCV
	 wnEZ5OXgSFqXNp0Gk2l6x6n+8kMdpxYYSqGi52gmwxAuuNMtqcbpekhybtUD0dfvsmNf9
	 4rDrESm1Mojbfkp+tWaJ9nJ6VLVNph60k3QUvUm9SO7coe6PIZr7x8W9BuSt86X2MVFsm
	 koBFK9Jt8G1IS/9NBAvv1+suoF/xDKLXlBAZiX1wqvjt/hdvHP428p7c0hy0XaZezKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwxxZogO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C043D606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NwxxZogO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1361F000C9;
	Wed, 21 Oct 2026 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792570313;
	bh=cqGN88ZYSx+RjKyzmamolQzERQ0LDoNuYdNkMhp2fFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NwxxZogO/cP0u6ThODL7opcvvatYWLdYrHhKmcs7kACIPw0HFwIiMaiZtiwKyUFgM
	 bNUY0AEjXos+95IoLPyVxOPGCNEcVlRx6dbdgqMw/+Kg/yGv8qWG0Ktt3QIuhNxrfg
	 BgVDAzvG/FNXZ8UVSNKNyWsgt6oGj5R/TZoFSxcQFvQ4yqtilYeQMyI1HDDRsH9dWq
	 iA3S7EObu1Jq8A2KuMg4Zzh4GtDIplF06zNvW49sc+1ikAurKV76x/7Kcuqbwwqx98
	 YYqmFVwMusujvW2pqJrW2x/WQ1fSpiq0mDt4T3vKC8ki0mBurUK2mxMsr0XpL6f/NT
	 RzNUlWu3Ze37g==
Message-ID: <sashiko-outbox-179943@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 1/2] net: usb: cdc_ncm: don't enable BHs in
 tx_fixup under netpoll
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-cdc-ncm-netpoll-v2-1-8818965bbb69@tipi-net.de>
References: <20261021-cdc-ncm-netpoll-v2-0-8818965bbb69@tipi-net.de>
 <20261021-cdc-ncm-netpoll-v2-1-8818965bbb69@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 08:11:52 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-cdc-ncm-ne=
tpoll-v2-0-8818965bbb69@tipi-net.de?part=3D1

