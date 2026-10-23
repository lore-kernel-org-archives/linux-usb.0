Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743244;
	b=JBusx6Dgwsz+Gutx4lNmV+MZMMNN4bpt+97HBFUbHiKd82sKtyi4I/QS6jP55RUqLOTp
	 P0KsabONyM2V4ebvwV+SgjPim1e8RHmbl5pisOqFW+yooz4vOsrgLc8gTbO+on2Cx7eyj
	 zfHMnC1kTRDuJhp2iUSWD1uq1+PRGCUGEY+3IFiPowUIsOyAE9oi/GIvQEuhUAd7iPpuM
	 fDJLOd58AIGUen8mENrLLVnuKJLrM+ehUTMyLnHKZcO/YTE3Lk1bbFiAA2vd6aDs3N8pC
	 7UN+tthr11ievSwzUpFVhl/N+J0FR+pKHqpEHjsMbmYxrSf1jg8oL4GPjDfd6cUMCTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743244;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QfSs4pmJvj+z22pyiyAFu/U2Riu1O7ERL/yRxV4p7E4=;
	b=djELEYERUOb3gBsBaf28mOgx/xGr4rIPRIuNNNl0Nu/Gq61NHawaxLj+Rk/fHYy+yNvX
	 IaNGXkKiljWhjYn9vy+QYKUtLLXM8AnOJs6I8dSY6c5ji5TILIokgpqxyXBTHeC0lsvsn
	 SPCGE+Zq8Rs223xy1OYyodalcPafrUPwM9lFBxjHvxpWNrLbU3BXhYWjr+dB1+dL1UKhr
	 bN0shDbdZ109/27jTgw5prJ0Mx0c0RwgRvbVe0bG/fD8qsdyZyyaA1FVn6DOLMVkDLtkM
	 NPp1BYuMYPm/tzmy1MIwsE1itqtRgQUltcVembRAjTieDPwX1grkvniMpQzPY/hy6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XGOU/i5M";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E30860A2606
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGOU/i5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A281F031E4;
	Fri, 23 Oct 2026 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792743243;
	bh=QfSs4pmJvj+z22pyiyAFu/U2Riu1O7ERL/yRxV4p7E4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XGOU/i5MWS7W0b8rYKlwMfB0y6tgo8nGN4fRT19EIBANu82tKPltkQnP0RVQDv8zi
	 cWZM5vXJV7XN/7dWKQjEDgP9VrJffm7GjY8bCoWDuvz/sFngIfEKZTeqKL+sTVyH/4
	 o2S0A84+4aL4H8DGRksA403LcRWbaoi/klklpAsAMdr1CXjquzmbfhNvH1szwl8mva
	 w7HM/eMLS7EDRNjfD58BjP83iZHWpsM9KhqFT35AU822y6osk2cTWnIBNlD1HzL8/Z
	 yIe3nSN7Kg20o2wuwFe0QhWjmmppwlm6Q8uihIQCLtIUs5MTxs9hOEKQT3OFKg59Aw
	 MvQVGI47z71Fg==
Message-ID: <sashiko-outbox-182488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: bcm63xx_udc: fix dequeue of unqueued
 request
Reply-To: sashiko-reviews@lists.linux.dev
To: liuc63 <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023080837.1680100-1-liuc63@xiaopeng.com>
References: <20261023080837.1680100-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 08:14:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Liu Chao <liuc63@xiaopeng.com>
>=20
> bcm63xx_udc_dequeue() only checks whether bep->queue is empty; it never
> verifies that the passed request is actually linked on that queue.  If
> the request was already completed by the data ISR (which list_del's it)
> or belongs to another endpoint, list_del() corrupts an unrelated list
> node.  Worse, the out: path unconditionally sets req->status and calls
> req->complete() even when rc =3D=3D -EINVAL, so a request that was never
> queued (or was already completed and possibly freed by the gadget
> driver) gets completed a second time, leading to a double completion
> and use-after-free.
>=20
> Walk bep->queue to confirm the request is queued before touching it,
> and only invoke the completion callback when the request was actually
> removed from the queue.  The -EINVAL path now returns without
> completing.
>=20
> Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023080837.1680=
100-1-liuc63@xiaopeng.com?part=3D1

