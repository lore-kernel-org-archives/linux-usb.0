Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017011;
	b=NSBnSPR1reCkT5p/Bwz34XIcUkx4tSmJausrPdiO4suJTCT3dcBlkfjlkS2qhUxylHX9
	 rFz7a6ZWHgTmP8Vo4RmxwtjMLLumJDKzmqpJmSAsoGCBsTb0ZI0klFog9hBOpOBnxPeKW
	 gbPqdB6uDnUq3a5pUEGoYlfbS3PjB3K6TO6WpFS5cpK65nk83YNnllNxqG8ClMr1muEq/
	 70KVzzPI2m6JnDWm9OshazgjJaX/h0MBMdyyXFmgFFz8mc+bclhWzc7P4Xtv9ldSqsNg3
	 JZCLA1ocrtTgdoByfEEO7qZcmXKTp2dhElejI7DBGxIe3mCBRtW/3wjhk1afuMLJ+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017011;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5A/ODHp2o66osemDdLQEzGrDn32soin3x9LkPFE3Bq8=;
	b=r7fYA1Bmhsf0ssYRAc28p/UbxH13Lgzj2xXOcLG8VqfFdAW1ZG/fyoDQJ1sPxH9LmIRz
	 UEqZ3k1aWluXqfO9a8Gl7vgDoRBC+38DwNaZDZz1SoubYK61MAgNgAJFPEEeTit8jYmi5
	 keAZT0FEiIoFvYX4QADDM2GoR0LBVcCqOOZ+Hb6ZXXVJR6gjMe+Dz+IkehZwxBs68L4mI
	 amPKLVnSpgmcIPeuWCRSdhdK/SW/YlkdARUu6XY6AUk/u0yiclGGmdTXpyQEjXQtmQ5Bf
	 63t7Yoge452womf32d94WfnXSEVabMtbSWLKOG2fOogGhCzG7YS7SwWKJ1FNriOzwJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROgYj2t2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B72606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 02:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ROgYj2t2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E331F008A2;
	Sat,  7 Nov 2026 02:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794017010;
	bh=5A/ODHp2o66osemDdLQEzGrDn32soin3x9LkPFE3Bq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ROgYj2t28FSuYPWw1yoHfJQ0rLZX2Z7dzVD8q4+g1Z6ZNjMA+12e2Wq6zOfiH7Mlq
	 L5xDAvhYBUrIuc5U1MUVjkFimepdeROoYtZ2H7La/tD2Pf8T/5XPeGn6hvTw2sx2/V
	 LHX+FA1yCdu73RmSJLJxBzRc2Zb5rQvVXcv4TVuRpM6WQGEzDoHQa9xhLbOLXMgt6B
	 sCfAqlyRNw/xJiBCrXoTcfsyB1SPVM7hOjSZ4ziPA59f9jPNCpxHgTh+UylvY5uz8N
	 HdvoCgLc7GPsNlJOWRmkME4QGg9L1sdQaqxPU+K0iMPytgq7DcsHccODI465Vjq0wo
	 RM8bQUA4BlRfg==
Message-ID: <sashiko-outbox-202476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: cix: add RTS5453 PD controllers to
 Orion O6
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107011012.3655873-5-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
 <20261107011012.3655873-5-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 02:03:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Describe the two Realtek RTS5453H port controllers on the Orion O6
> I2C1 bus and add the I2C1 pin configuration.
>=20
> The controllers route orientation and DisplayPort mode changes
> through the USB/DP combo PHY lane switches, but that PHY support is
> not upstream yet, so the connector graph endpoints are left out for
> now. The Type-C ports are still registered and reported, only the
> lane switching is deferred until the PHY nodes are available.
>=20
> Both controllers report through the same level-triggered interrupt
> line, which the driver handles with a shared interrupt. The I2C bus
> runs at 100 kHz because the RTS5453H I2C interface does not support
> higher rates.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107011012.3655=
873-1-gary.yang@cixtech.com?part=3D4

