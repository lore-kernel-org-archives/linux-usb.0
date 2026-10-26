Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022255;
	b=jeqtUnrmu00BpIZsY8rfMPMHm6A1GBPRKuHGSLnfTPHIlx8G0myBnmnAvWb7pG4xlFXD
	 dqBna8WKcL9TTHzTzWDulcfr1+OrUB8DtE4OsDYmq3tBYO2l6eIDPvp/BN2IP2hb/5n4Y
	 YH+QXxJJh0r3oh7SDl8uvejZr59WJp1TwdmuilBRr8x9vWdXod9XQ3wECUyIEByWb1NHN
	 Ve/4vZ0udZjsLQmbFYffSIvIa3gPaq26ZAWM2ZQqGsyy6KJpZxMbFvfUmEyF+J6K2GrCI
	 xaMTVTtfJ62e41+MBtbU2XSFTf//WIEQ7CA9x6ppANeKhd1xRmVb0lV8FzThzbjbfEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022255;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wKGWQPkWZyDHbVY97EorH7gmrMgaaUWFzoo5bw2mN/8=;
	b=r7NYT4ZsjyqVeESVryxEx0lRG28yWf5ACN+RhiX5YokMpMn2dpSq6IVLNQ+cxGIhSJj+
	 n2xAhf862wdV1dpOJ0Wsm8vQgVdCTJs1NK2QrX/vqqsi2Z34PYKcTW5Xg3scv00rivhde
	 M2qBfHLktnlF2al2HjoxU/yNMdDAymBGvfSynk+SDlomayHanqnxJ8x9EWKvakydlqa8f
	 QlpFKtkKHCIroziz2X8i0H8Cdvne6/9xBjH0wELypsEZbf0YPlDmxQKmFo+Y1jI4x7FFq
	 nOmtu4oOt75EL2b6JzNrdeO7CSQkoWAc4eOgNjJZCuwDjKtG4ZlkXRonR/FmNzfJ+Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNgQ05z0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F92606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dNgQ05z0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0F21F01825;
	Mon, 26 Oct 2026 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022254;
	bh=wKGWQPkWZyDHbVY97EorH7gmrMgaaUWFzoo5bw2mN/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNgQ05z08T3rj0oguRAdOh2a5ZXOJbwWl+BnscrNS8QplEpwzSyLYgzfXhYSiTSJ2
	 /Y80uUseVxYtBHsKE1z99cE9WPMW2PMdX8P2YG+62z+bU+Jhk4IgXNb30X6ESaXhf7
	 SQeJUuFkf0Fqbcz9+FH8W6fPsGmP03a3Lf/CRMq4ZB8c/y80oDu+/48lVKPw+ofU36
	 8VBVjfrkfYgsOTd4K30EnV1kNWtX4kt7AG8eC9HM+ZslvzU2n6R1s9+zIKi8NDCjxb
	 QevptaVSr/GsSyOVMh76lsSmAKLhXTPeb/bX8LHvtYMB4+z+tXhkv5Wt59WiYBx89f
	 RveH/eK9S2Z+Q==
Message-ID: <sashiko-outbox-185330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: ohci-spear: check clk_prepare_enable in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tang Bin" <tangbin@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>
References: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:44:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> spear_ohci_hcd_drv_probe() ignored the return of
> clk_prepare_enable(sohci_p->clk). On failure usb_add_hcd() runs unclocked
> and the error path clk_disable_unprepare() would unbalance the count. Che=
ck
> the return and bail to err_put_hcd on failure.
>=20
> Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026134019.3020=
-1-tangbin@cmss.chinamobile.com?part=3D1

