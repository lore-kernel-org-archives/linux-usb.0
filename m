Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187383;
	b=4+9f2qQL4YazyjP+B+s7j4NBUIuWJX07nFEwuJPnJJ6cHI4/bco27ZsM++09xaFdH7K2
	 SoyG3brH2tJWqXID5lZpwA/xu0QQ8hT46E7FHI5NivjBCMp8Q36fQncwC3He8JR2pcaKQ
	 eNY4QwWY0T4ttHGQTyJ9v0Z7cyKSfNaMMQiGkAriw6JyFImiL/+OHYg2ehlRWr9gLWJYw
	 izn0gGL5VKYnbYE6pvk1fcWbRnJ+WGm1HCvo05YD04yTdFiaDYBuXR0HU2uKvvz1jjEYN
	 Wd2IlDRnlXyIEHgrwpp+a4GwRWGoBZcSRAYYn/Z/8S9bRs3CzVTm1Kjsi64lXMEfGqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187383;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Qwto2ik+nYdjywbZTY6/6MgU656expRT9sfE/GUQDxM=;
	b=DMzqsPyA/jOgTZtDOaaT5+814wR4pJY+Q7a/AN7mC8r/R+Z+hhzQuwWV4RKm3vhuCjgO
	 9JjVz++Yd0+PlAHdf/eMOArHtprtsQPh3JbSFFmu6mFazX5xpdD3DyJYmxTn4z9inGMcY
	 BQksd96MWIw7R4bDOuwHqd+MS4jZCBFvXZuIXyJxGAqVyAs2bSNJy5xnsYiT9Djqmj89+
	 6hAVamfAKc//uK9qxIXrPq7WQ0XoXME8ysmtYAZuVBOv/qNqAWsYeENcgT7id6BNqobx0
	 j39UML/hBMgssV2fqYtNZNDBMmGZxFbs3SygWIypY0KRXkloZbIqQMTdphvqwhwGYCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hilAuBmt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3368606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hilAuBmt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1692E1F000D0;
	Fri, 20 Nov 2026 15:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187383;
	bh=Qwto2ik+nYdjywbZTY6/6MgU656expRT9sfE/GUQDxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hilAuBmtxAvGfNjGDexEucpt7k68kJvJ2GKMriThhCFaUu5QoHX5oy6ryr4CD8QTx
	 SmBkND3aA7oC8ZMELmm3GvF1A+Yc0sKTGgcn32W77lZK6Fe+Ul2IybnC0MO33nh/U8
	 U1ptS+nmZk0W+kyagWtPm/kMaZhk3UZvJ8E8GyAc8IITE5ZSiys0whh/aixEsRw5ds
	 8Zm8WSsrW31l/zpD3anN2X/FgMNKF5yDt6ZqBikbe92U2ns2z46F6xnRid+db+vUAA
	 rpllrfvH3gruw4rNF2z/6kOJ11DlYhzCSXUuDQG2r01Nu1mBLTQ5cXuqw3CHcOcLPk
	 ccnWo4RHApFeg==
Message-ID: <sashiko-outbox-225436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] usb: gadget: f_fs: Fix synchronous read()
 behavior
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ingo Rohloff" <ingo.rohloff@lauterbach.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120145937.39772-2-ingo.rohloff@lauterbach.com>
References: <20261120145937.39772-1-ingo.rohloff@lauterbach.com>
 <20261120145937.39772-2-ingo.rohloff@lauterbach.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:09:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Some UDCs (USB Device Controllers) require, that USB OUT requests (host ->
> device), have a size which is a multiple of the USB OUT Endpoint
> MaxPacketSize.
>=20
> If this is the case, then the flag "quirk_ep_out_aligned_size" in
> "struct usb_gadget" is set.
>=20
> The current implementation in "f_fs.c" for synchronous reads, behaves
> differently for UDCs which have this flag set to UDCs which have this flag
> NOT set, because ffs_epfile_io() uses usb_ep_align_maybe() and this
> function then aligns the request size if the flag is set.
>=20
> Example:
> Userspace executes a read() with 128 bytes.  For a HighSpeed OUT transfer
> (MaxPacketSize =3D=3D 512), usb_ep_align_maybe() transforms this into a 5=
12
> [ ... ]
> away). This patch enforces the first behavior (code buffers extra data),
> by **always** aligning the USB OUT request size to the Endpoints
> MaxPacketSize.
>=20
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120145937.3977=
2-1-ingo.rohloff@lauterbach.com?part=3D1

