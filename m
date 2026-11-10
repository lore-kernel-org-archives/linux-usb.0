Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312105;
	b=KqqyZDJUMQ2jsNy/xl7dflCKB5ABkP14jNaQMYryILx3JQF8hJez20UIv/dysg9u2+ZT
	 BvRy+w3mRY5MVUI1YS5O9FZBmGrUUoTgbGcTDU/cTV5rY0/Shp4AkOxSbWYrU2bLCLBaY
	 XuLPEexOukMSrJ1P+SjRJqVLwVyTp2dPwXHET3SojVsMYPXn+ASDeWkeLUDGwscRpFPX8
	 fkYSX3RCq+AChS9HVtomSO+cmS72ubUfLM3JOVTw/DKBiYCPbgauaIa+1JzfkYySwGf48
	 Moht5dmgX8WAZu0o3H6xT3F8qCqiMOzIqkpIYs+E3xslVVhdTNB3G4EdZiDtjqL7WTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c+CTNuFRI2SFjJm+8pU/ecHNBJNUO65qJoPwxpJcjzQ=;
	b=fyWk/iaUYonjlaD0XrQIedCBPeGbIehv/FlwE9uS3rW9Aw3xtyTXJOMTP5xp6ZZFhfOS
	 BANFnEEszQrSTRVg76FwhNT1pomeUVSAjzxbz/xUEApbK24z4K6Tl7I9gIJxMleH+WSDN
	 57MalndzSMGeVSGtBDHw03+zwegMy6vXrlqYmv4FtkLpOeGZE+8wcqskZcmCZkmcpxJyI
	 XP6obecYKMSMR9MmxjmJYnILJukQFVHCkUd7XcQy1PCpGdCeX7JBNKt5RgYYDDbkpHXlY
	 v8dVFniQjXMOOJnAKRHCIpwkgtQ7D9GWkHIr/g1+qmaXS4nQiMjeohO2JPQqXAJd1Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lF4MDQlq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1536F606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lF4MDQlq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786DB1F008A1;
	Tue, 10 Nov 2026 12:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312104;
	bh=c+CTNuFRI2SFjJm+8pU/ecHNBJNUO65qJoPwxpJcjzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lF4MDQlq8FQP/+YiEED/E/2NpyYeJM+4q0qPwHy9yn+zRtBRxVyOWa7wE1Mmes5sr
	 MYNocpJSlwgaB/ubPLrgvg5m1/01vhyczOWpZeqdGADCHI8sNyHhu5n7ClPXga3azo
	 AMV8oCgA6HuCbGlJ1ckwwo3GtIEWT6yn6Hw1nFHR7QyS1q8zYZXNZUMeVgi/REiqwq
	 ywRI7PduPB6LbQQygY7heWDEpOjwAv2XjjP3FztCllC7T59LWxJVYU+L0aH4u3Z5RB
	 FY1qwqUReeS1Whh96HllUi3IJ/MmVdLZg0Gd8wtq6q4U9kBEeYaeasHy92QfMYZRXd
	 2GFi9jY4lfoxA==
Message-ID: <sashiko-outbox-206970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] thunderbolt: prevent pcie tunnel
 activation/teardown warnings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-8-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-8-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:01:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> will wakeup usb4 driver, but fail to create pcie tunnel, cause
> the warning due to a race condition between router disconnect
> during resume and user authorization
>=20
> [  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7), retryin=
g...
> [  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP=
. Ignoring port...
> [  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecti=
ng
> ...
> [  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
> [  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from 0:7 to=
 1:9
> [  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
> [  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 =3D> Out port: 9 Ou=
t HopID: 8
> [  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3 Credits:=
 32 Drop: 0 PM: 0
> [  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0 Counter in=
dex: 2047
> [ ... ]
> [  546.303767] ---[ end trace 0000000000000000 ]---
>=20
> The check prevents a redundant lookup and eliminates the warning
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D7

