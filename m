Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226709;
	b=W8iZ9HrkRkwUslxdnuABaUqsNwt7WEOCua+5GPEW/qddyY/oXh5QYAbTizH+bl2wD+m7
	 1xe5DbRkkZlttE6WYBwq0yxK64MwM69a6jTEyz2lJtcTFFmEnWo03bCOuaRhW1XldBwtl
	 xV2JpOGAuPRLk2B5v3dwpyBVfGMY2J5jFNfoZLFuAPJEjhTk9SGYZCe1rwK7XyjByJbfS
	 +UtV8AvY+rfPZWxgk18hoIi1EMjo1mNAnPSZZdtkmCI8La1K6ctkTxP8kHoDd+i64aBiQ
	 QJM1KAQO+l034x2y2/bnx1BUXVnBBeiMXn81/aOOyHbUZFsQPnU9JoHhl+3Fnyc3Wrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226709;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qqoIFzkIp8BOZdj1kPHatUQgw1kgpjbPVP6ny1CPt2E=;
	b=AHeNnQigRlFFZmpjEigockJwHG2GPhOjYygeTc0UEbRD38Wl7qhyBzYQj0afj6gXpqYW
	 se/w4LU8kWo20Lo8aqqekHe3uftUSLKfB8UJwncmN7UIlzAg74X9acUs01hotD2yC+c60
	 xLWqR5ugyF4KRX+iS/yT/0fyDXqon0fypz5dMkuGudRSaUunxoRh6VEzb0E8rneWoPvB2
	 7ID8dpQ0/wfJN+Vv0s+LjKgu2gzp2qCPq67tAPVkl7n9HOLxYvkqYgzM4NLXOZzyIsgM8
	 zKJtP3fNy02nez2+zibHDiKBmv5ZhcvAabfq1E/XVSEPyC7LXyCiD5iPQ/UILaMfaow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcbA63m8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE583606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcbA63m8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3201F01825;
	Wed, 28 Oct 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793226708;
	bh=qqoIFzkIp8BOZdj1kPHatUQgw1kgpjbPVP6ny1CPt2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IcbA63m8feEv4TlnYvVD7YKH39uG0cov1k5lVmBdi9U1RLQslb5K4CMLzUfecLh9g
	 kcuJ4rtEne6yD5uYFA15DoS92NjnPgm1eixg4awMo1R9A7f8YfHtQC79WHLG8U4ZTk
	 dxnEH8A0IHfY6NPd1YBq+sXdE9/Tvx+dVePz65wK8BKfUDUQbwAJ/aHf/sGN9GM4Dh
	 vC96ZTIisebyhyN7u1dIV8wQjwL3vUsrM9ZU7OYA0V7+crFYwSOnfNBaEfijmsnH6Y
	 XQ97499UIzcY16E5rcArEUcHyDy7jIO3PbJobZXseOgpJZoa93GmCpZrTlFOv2N8pl
	 Ez4SzE1JR/yhg==
Message-ID: <sashiko-outbox-188505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac2: prevent invalid bInterval
 auto-selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Farrell" <kaf@nwlink.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028222800.782988-1-kaf@nwlink.com>
References: <20261028222800.782988-1-kaf@nwlink.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 22:31:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When p_hs_bint or c_hs_bint is 0, the driver selects the largest
> bInterval from 4 down to 1 for which the required bandwidth fits the
> maximum packet size. The original implementation intends to keep
> bInterval at 1 when required bandwidth exceeds the single-packet maximum,
> but the search loop instead decrements bInterval to 0 in that case.
>=20
> A bInterval of 0 is invalid for an isochronous endpoint. A Linux host
> reports it and substitutes a default:
>=20
>   usb 3-8: ... endpoint 0x1 has an invalid bInterval 0, changing to 7
>=20
> Stop the search at bInterval=3D1. Maintain existing clamping of
> wMaxPacketSize and warning about possible data loss when the required
> bandwidth cannot be accommodated.
>=20
> Fixes: 355a05dc8367 ("usb: gadget: f_uac2: Optionally determine bInterval=
 for HS and SS")
> Signed-off-by: Kyle Farrell <kaf@nwlink.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028222800.7829=
88-1-kaf@nwlink.com?part=3D1

