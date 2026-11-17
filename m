Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906537;
	b=plEnBIdLxonV6dv2SChge7ta+j5GQz+e7GVBGiFduiiB7HsPH0a04bw5/bzTmAyZdaa1
	 MpbqRP7/SbRkBbOKKMSemdleIne1nrPdY+QTcv3nSoAS31ve1d4BSlcJ3HwkjCt6mUYW9
	 mJn+FHRaZZU8q3Tu1nBFN1WvarlpkYs1Ny1tG/wf++Dmzuw+r9KoxXCtmaFuWesBgXnRz
	 drN8sp8Sh/jZmnGMsXYA6o0OqgeI1WV5LTHiESOFuslk332DshXyjut1jpjIFuZatCYCU
	 qmB7epgyi35bnfZDkC55QF9B8ck+M/vSX2Phqkzb3Yv0Yf0DZnJjSCTl6sFjSyMEE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JePOi4e4KuoBvEZ430PozJu71fa2j0/55BS32enuPgM=;
	b=p1zEVg3CBQd+FqCTwotT9egxy+mSOEHZP+GYTaLfmkh61l3CUlbaUkePkgcxqz0GAF+A
	 Ols2GKz0/kfM3K0tfvGDI5me7qZ8TewcbpUgXMmtMu2RHxftfP/4tXctqlYp6TVbukZgZ
	 E615EzNIXB9qG63taJ102RBNQJGwt7W8PkTzcOnEjv3QLPvV9VNp3uvfGuNmngpTxITY/
	 zsMAfAyw9D+MISyh49hjdKKBEXRLtoe2LoVG5eqzYDHYdQdfRSPcbOVjGR7eAVNuJGzHv
	 EnbKMzcYJQA5HjenMzNIIgUtNdukQEgF8CxM5u+eXOf95A/i0W2V2BtHvhq1eOmbrBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ii/D0GDT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B0606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ii/D0GDT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C71A1F000C5;
	Tue, 17 Nov 2026 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906537;
	bh=JePOi4e4KuoBvEZ430PozJu71fa2j0/55BS32enuPgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ii/D0GDTtV9ZuBsmfsMaqVdwoh3H16wLOYFLYLjJimtZLPLrRYG7HhwZL0C5hXw7T
	 sn6P5ElbhiNkPFGjkkzmlZ+0lnCFY2R8RKfgcIneN+QmdTdA7NdK8UZyzwHi74ITDA
	 e1J8L+Sirupw/p5ENNd00j58pOkAQeljZKsKIBCPsZ72ElwjGVMMVQuBdJcUEv7M/c
	 RrQ7+8fUWyJfosmXPo0lqxnvPFtVN8dNG+Ru/eHue8LFuVrGLIllzT0FXd4n8M9MfN
	 8hmgnrh8Bqy0IHVBxMGNpNgCKneFMmM8lkyte5F5rv/ymvNgeGkEq2sFM+BhiRlwuY
	 XtVrAdPMqghHQ==
Message-ID: <sashiko-outbox-218450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: gadget: u_ether: fix out-of-bounds read in
 get_ether_addr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Chao" <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117090110.3263592-3-liuc63@xiaopeng.com>
References: <20261117090110.3263592-1-liuc63@xiaopeng.com>
 <20261117090110.3263592-3-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:08:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> get_ether_addr() walks the MAC address string with a fixed six iteration
> loop, calling hex_to_bin() twice per iteration, and never checks for the
> terminating NUL.  A short string therefore makes it read past the end of
> the buffer.  The dev_addr and host_addr module parameters of the legacy
> gadget drivers are copied into their own kmalloc'ed buffer by
> param_set_charp(), so the overrun crosses a slab boundary and KASAN
> reports it at insmod time:
>=20
>   # insmod g_ether.ko dev_addr=3Dab
>=20
>   BUG: KASAN: slab-out-of-bounds in get_ether_addr+0x1ec/0x230
>   Read of size 1 at addr ffff888009f91f53 by task insmod/70
>   ...
>    get_ether_addr+0x1ec/0x230
>    gether_set_dev_addr+0x6b/0x180
> [ ... ]
> commit that actually introduced the loop is named here in prose.
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117090110.3263=
592-1-liuc63@xiaopeng.com?part=3D2

