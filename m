Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353495;
	b=mdFTcPlTbI26kyjzuoTgEfwIiz4cch5ycwoumfIDPI4aN4kvWEwOxd2YVTr4iIdxd5pj
	 BeDeZ5FNYi8XZ7mQyuVjXJFvZ/+v3ex0pg4F7k2eNTN7ZLHraudAmmaKeN1hfNDPi/Y5x
	 T8RSdWyOzedxhcNfbiiG9PJ4pVAnzXpl6NK1+40NiaOiblb8u4FFT10ZE8FJYp3FNJ+8L
	 mW/ytfP1mNXcyBjPrve+3jlVO3+rgag1d7eSPtE9FsW7lvFipvyUopVbGMa1jD2rl1zH6
	 jbdgI/0hA7KvgEVBvhsrfRer9whr2KaYuU7SF9zA4QUygcj0hbyiqhoV6Qli4JiKUVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353495;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wA8WsubvW42T4vUif4uJEI7tvyFVJdLgKC2Fy4ksh0w=;
	b=hKrAoOS124qaZHn8IOe4WShGDqu6kAPCylc1p028DBLV9irjpLU+Qg2ENaxlmuvMmYg9
	 SNhLo+6M3pz4Ohq6wEODaKvl+X4vIMCMzh1O2Q52ZnIAj+gRqcptmMd4Vg3Rv/JkdyHTY
	 XFMUdKaqWNwYT1NFs7EsC78muWTstX3dHeFndFGrizVcKQVcmOHpolkw3c58dBwNLkw9k
	 w+9pzxJNjRhq+8dCq5CXpk2qNl3Rn1HtKuBwdt2jbQzNoSD3p+ka0LFTdm9GAM9YN3RX+
	 fWnq4yeimG2tZSNRjzB7nFLbJYFBZ1sHoTXje4yZApn+CdSbeEfuVRfUl1NlNTT9Tlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSUch2NW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3B606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSUch2NW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495FF1F0093C;
	Tue, 10 Nov 2026 23:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353495;
	bh=wA8WsubvW42T4vUif4uJEI7tvyFVJdLgKC2Fy4ksh0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mSUch2NWKQv/s3Z2a7R8n5b1XywSR7FpEpoclrG2ndNr0QeQcBps33Vy4qc5AtduM
	 qkbqYGqelfJxDZj7hAe6fxehrlUlsda2Ml32dsAc8e50q81HGhZs6+BD1qx6nFZKta
	 s0y5x9ZZwDSAlahG+MU5+eBlXInacjCypKw9HYPwTIPvCIkkcNqm3raoppLWXHYQqq
	 BOPxsg7MFhZ7L+v4NaqsLGMedo1hrMwDgjTYSXy6hk0ijB9kgXkAnxBxy4Klfq7uxb
	 rObTaM0cijxoJNiZnd4AA99AK7jC0xntrcAeVplR97WZG6DJKwckAsBQLlEi8UW+nC
	 r1U/ftCBGpQ4Q==
Message-ID: <sashiko-outbox-207922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/22] usb: dwc2: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-8-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-8-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:31:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D7

