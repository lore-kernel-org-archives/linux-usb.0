Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670607;
	b=xbxw57oLE2RSnSNSoTGVcUqeYtdELY9HK5DXqOnHN8CAck6iYqRdefViT6BssbQz75w0
	 NXcuJ1xsXZ530pJYLPIc5lUd7ujRAGrvNthQldD7SlgNgk2ekz9uSKBraHVdZxGJJjoX+
	 6dP29O9h9TqIruS9PbAm2aE618JXIiZqqeQz5vvUpNNq7+aQJPa0wF14SCwoQkJXnRdLw
	 ujWbyYrWvmmCw9kS3Vxb+Zqtkb/NcTeCIPPL47CElEdM+TNTEJTUryKiWCLIQsZThEj4C
	 qlSfMWnBDYNBuHW/40Sk6AyjHBn5LGsVesSRhuRlEiTGqz96kzZF7MGzhpwBuwVtzXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670607;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1j5BQR4skqdxfrWFqCCbkSAzb65bAKQZm8SeuAU5Ogk=;
	b=z69ZRvYF8iYg++vEQq/PAgDVBGsiTfuMcfqq59vsd3VVWJ++PiGHh+LH+q4rReQ3JmqE
	 IjqikqOC8tJzxzjkSBl6KBjqviVjE+BSnNCx0HcTJG9xj018C9t9taNXBuNRQrdyOllTk
	 /Au/x3ob/AhN0gmupKQIbwqX/c5C3CzcHXIIPXQr19nQU5LDa4m/WOpPbaECsiofyPW+7
	 8KxDfm4X38pmwbbkcaWpgeOilBnCHvGd5O1g/fqw8kx1JZWOI911Uru2+DEq6Ty5s2ieN
	 /YW+ghO6fNLK8Xq5eJrmVUE+/RAgP3TlWM50qFk1YRrDU5AwDe//ghSTD7r7d/ubVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U09DUxJ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30943606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U09DUxJ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5389E1F000C1;
	Tue,  3 Nov 2026 01:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793670606;
	bh=1j5BQR4skqdxfrWFqCCbkSAzb65bAKQZm8SeuAU5Ogk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U09DUxJ4jtR+ZFQ2KsOOzBjwpMsenIH4OE7y7eefwrF+iaLMmvfxLCSLugoO50Ure
	 vr48xs8E2SNsnmHisypqxwt5gAPYCm6JvUm2IxrBdAE6YGYfDJl4tg82qszo6Wpqva
	 hRKCRfaV0gfVvDiwsMgrk1w2BMoRjO5qZXoPYhER8mCB7rvxYtfhzzATIHtpp9ksEa
	 CRnJpF9B0HKk7So+/EVAXnwwjEn+tN2IxIIDjLdtYOwXsYZjCXSS7qqMBueBE9c4fU
	 Qs+yK/BoSWqIOYFLCMGUMnMh4HnaVmA/TvN1TyMetQ7W7oVS2ENfHNyaSFTH6WW2PK
	 LzHBYlg0GUGPQ==
Message-ID: <sashiko-outbox-194439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: udc: bcm63xx: Propagate iudma_init() error
 code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103014457.1255-1-laixiangwu@cmss.chinamobile.com>
References: <20261103014457.1255-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 01:50:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> bcm63xx_init_udc_hw() calls iudma_init() and stores the return code
> in rc, but then returns 0 unconditionally.  When iudma_init() fails,
> the hardware has already been torn down by bcm63xx_uninit_udc_hw(),
> yet the probe believes initialization succeeded and goes on to
> register a gadget controller with non-functional IUDMA channels.
>=20
> Return rc so the probe fails and reports the real error.
>=20
> Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103014457.1255=
-1-laixiangwu@cmss.chinamobile.com?part=3D1

