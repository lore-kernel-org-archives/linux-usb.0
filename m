Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467837;
	b=GnBE5qcW5pIN48viOplKURPG9LVpp89CVFs6dAxTIiddZdcEhY5diZo089Ur2c0q1C0W
	 ZH0/P+3ZFn/daUmWIEwkF7jHuL+9RFl4gRVvYWyB3QNNk7qfhyHsdwBXq0is9UR1lCh0D
	 Wg63+pkZSYpBC8Xv8IFwQChYTdbUAdycfF5vWTXzUt2uywGkCu77Hmqi7Bm9Th10f0HFn
	 rkEi3mJHkHG3xglnF/pdHm5I69chyojLgmLLbithxAcvCz54VEubxXmVnFjTd4c9hWqSA
	 EaEmGqwKFShA6tzYAgOHwj6znGtnsDKuCPGCOEt8lDsaIOch2mQKrOE39Spr+xzAbmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2tQvFaS9XEnwb/iVBBvKwCJsTXYu2HRE1kkB2T5cmcE=;
	b=sqo8LMHvqNzkmThQTW7zrDIugNXnin50F5pehA9OrYbBJnXFHwc7I7a37pf3gkOUEnbg
	 F9yeQgjIImOVyKd4bmVDfLgEtCT7IXvlgFAtJGvZT2gBK2mlZNajcH6DPFVTnFHOEbAIS
	 GAYZuCoq2brHXy0P+EdFJKO+1Pez8TIsWganYTgUP40oF14tONOpHqKhuh8u8qi5Qf/q0
	 pv2ZTx/+2QF64UCBjNY36hvtd8v4l/Farzga4n1MXTXUaWbjw77Zf/s4olRqGS7Mhsm6D
	 cxfcVmpInbnSxWuw6Zr6ZGxXr3Yz+zhy6TZvSgBwqCwee/hwOVhaQ9/ZKdpw+SPAvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zbux40mx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5709606A8A3
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zbux40mx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6630B1F00A07;
	Thu, 12 Nov 2026 07:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794467837;
	bh=2tQvFaS9XEnwb/iVBBvKwCJsTXYu2HRE1kkB2T5cmcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zbux40mxLQKi+c8X6vtzIwlB1Iq9Z/FrcaTdcSl0NI4Y2almtmjJyq6HZrdL4jzLD
	 +XFk8uM3wPHPNXC001bg4lyKn2VeeXFX3N74Den5QzFoA4IHugXj2aeEPrvCWVfYcN
	 kgWpzw8olI8x9+UhEAAS02yt3vNG+u4QCPDoHylBcUkKxFDV08sqRkvPfEPO/TF8qZ
	 m2kT41kq6K0u1jHSisIlf0q9GU/exqexbJU+0qnSazsQHKh3uwwMtGciEDZrWB7yES
	 lHIV31TX6BHqQPXc/yOgKHwwC/qMTMnp0xdPMcA35wwKobn/0VAvMKsUO/VKesD4lf
	 Ts7LJ54cP8hCA==
Message-ID: <sashiko-outbox-210582@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] greybus: verify the received message size covers the
 message header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112071228.33017-1-shishunbo@cmss.chinamobile.com>
References: <20261112071228.33017-1-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:17:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
>=20
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size =3D=3D 3), the two existing checks
> both pass (size >=3D sizeof(header) and size >=3D msg_size), and the
> message is dispatched with the undersized msg_size.
>=20
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
>=20
> 	request_size =3D size - sizeof(struct gb_operation_msg_hdr);
>=20
> [ ... ]
>=20
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3D0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112071228.3301=
7-1-shishunbo@cmss.chinamobile.com?part=3D1

