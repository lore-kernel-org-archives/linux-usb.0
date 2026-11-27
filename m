Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787423;
	b=BH+sqrq1asj+vvur/y94iV95xXesq20E4kXsiPekzAt6DI5m6fz7h2W4lgiB5Tl7vygS
	 cnZZlvMJCKCCduRKvNRf9MCIJIjWHiCExjN0GPZWbK+rmfIKOGUEPSYsMT9E/HGDyq+y9
	 ylvElC1XojrTvZNhyvdwwi4GhpoOJ9VeviKF017rgRrlXzUyKFM6zI0ZWCS9OEqIOXy+J
	 CnQysfFHzEzRe9jozuUE9tE+gjXPRTvC7HbjCl4FZX27vdniX69inIzASffTzsFPzdLqx
	 kEO5IyXc25JFaGLOBG4Yh8i6dcYefK4s+yb1SMuyUYq5HOPiw0HqEXbgj3jDpYNLopg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787423;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sS5bgpxkC6AlvLbEmuxb+EGZlQPm+MdmjOisWfFbaIE=;
	b=JbQT9G0197iXciNQfGGGUXpth/Blp3YRQS/EfTKXmea2Ema5rd5eLokjCSoHS4R0reJL
	 nZ2aaoxlHQMlthPNgxorBgT9My2j26/t+FlKDcxPxqCRv2MD2iLBeYx9HEAkxVhtyqfgx
	 Npd2B88f0iKXYiK/qp0gSfUoPGNoSx7Pwx7Lm/+Dj+MqH/sSr9LqHZbyWS734gWwgqEXQ
	 MMd0zYcD75qashDm73ipPdglKM6Q7GpzNqah7DX1mqSbv3CA5uFROYO4JB1UfpLWdDeIX
	 xXhHrgEVlddfC73aJsEndgCzYRPf4d4P8DGcoWilujxBo/k1xom/a/a9KaRdi3ulnAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVOIST0m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E47606A32E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVOIST0m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADE11F0089A;
	Fri, 27 Nov 2026 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787422;
	bh=sS5bgpxkC6AlvLbEmuxb+EGZlQPm+MdmjOisWfFbaIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DVOIST0mPzBSSgEB2c6o2uOiHD0ApN//Bg1AceWUR1qU64Lji/wO8TBViGXn0mgbt
	 pE4k9FXKwkHvNxgNLe0FhX3WVIIit8Wm1DmF95HATIJqVbVfMtLzTr0kvKCsbjbESK
	 Zrz0o5WRhictnrX5DWlWR0bP5sCu8BvGvVcaaV0UdQ+MuclWvkPteNI7uRey8w8hMm
	 70JLa/pLCPCkF4xVAAZHTOQqTrzWJmbJnePqx/C7r0f8cMe+MWFK4L+VxCLqGsa/fk
	 sQDsGp5cnBM2uDz8deJYv+jmKlx4rFqBEJPZEsNq4Rtof9PU2jY1topKH4lnMI83I1
	 kbmsm95wSixiQ==
Message-ID: <sashiko-outbox-237518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] usb: phy: twl6030: fix comparator init order and
 teardown cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmluIEx1byAoVW5pdmVyc2l0eSBvZiBFbGVjdHJvbmljIFNjaWVuY2Ug?=
 =?utf-8?b?YW5kIFRlY2hub2xvZ3kgb2YgQ2hpbmEp?= <luob87709@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127133923.1452-1-luob87709@gmail.com>
References: <20261127133923.1452-1-luob87709@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 13:50:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127133923.1452=
-1-luob87709@gmail.com
