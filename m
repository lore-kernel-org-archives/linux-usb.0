Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810575;
	b=YfAHjXcUda5hRdy9nCxDxuBRwaeaGWT5mfzpullmu/R52/vanWfw9tsf/IF88rkI1S1N
	 mUuMRmIHWq6fyF4HGD61sjuflWR9e/ipTWsML2/RzvkQ92vJoRZQFcwLkJbKTdLdd/5GV
	 mq1wZOWT+sB/geS1W+4hXo5kg5gF2DSwSgSJwCNEfxxQF2i8ZXYAzEC1sHngQcQlxWy5X
	 kWxogOGVWFlWUpcW/k9WQZqSQTMyCTkmAip0K56+XVAcM/rnO7XL4+HARwKJ3Fo5Zvbc4
	 FiKSnOaM4xPAO3BTuCws3loei9VQUfNzrG6xhxhmUIvgzV7q/6Wa9CmE5Rsxi0AUY0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XGE/RY50UT6g9vwld0UifzIuOmbgLsOOfM6PB7+iF/I=;
	b=xKJxQYvhoz0/u9vwO01lQSG7Yl38Es0gYdTGIXsMXSTlai95Ye6GGaK/a2shTerDj+lR
	 k2HywbwxYO7qPZuVvmT9O9PaQETYEEvRwJK6eges/QYNU+8iTM5ZeEy9eztSGgAWH8o/p
	 WhnJRSknoYIoeKp+bUF+X/78548XucShVRg0typsWgxhI4WvE3FG62DaYRzcbkBQmp5Ub
	 mtk9heHOAdfwjQzl3z6/V0UfoVPeamxE1hpspQsCBxWURp1NkX2WAHdQzxUJ3IY38tJIH
	 VCckquMARuBJ/yja32IFmJJCSznyBK9vmsrHyoDgtFuXbjLW5JsrGPusHVy5L9aiM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ay8ay/3m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6563606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 16:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ay8ay/3m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158F51F0093A;
	Wed,  4 Nov 2026 16:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810574;
	bh=XGE/RY50UT6g9vwld0UifzIuOmbgLsOOfM6PB7+iF/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ay8ay/3mNfPevlUK+lNDcDn3prLy7g/iXcK4oXG6GGYRNILVL6lk58V1QTAHt//pX
	 we495ZWQO2G9s+bdIk93et9wkytqcFzDyIQGD2faUFsBDFLXCsmwVTuEsDJ+P/NT1x
	 AZbTqw8SblQVaOqh3FNzsRr7O/Vkd8k4d8rcuSnghMRorbxG6fTc4VocqtDweV4A7c
	 lXnXLnbW8WwS6c7Q7NrSMGuVQJM0kqLjXQgXH0SQWUweCcUd0s+iO7xWK7htBawwNH
	 r+u9Bdn3IoPyvfKHqru9WdUwOBKhr9+nCsueNSQw79YijE2wLPl5Tmo5PQ0Gk5HB7F
	 lGKc/5Kh7+Frw==
Message-ID: <sashiko-outbox-197651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: core: Add RESET_RESUME quirk for Keychron
 Ultra-Link 8K receiver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Quolke" <daniel.quolke@mailbox.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104164020.69235-1-daniel.quolke@mailbox.org>
References: <20261104164020.69235-1-daniel.quolke@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:42:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Keychron Ultra-Link 8K wireless receiver (3434:d028, firmware 1.06)
> disconnects from the bus on its own a few minutes after every system
> resume. No error is logged before the disconnect; the mouse freezes
> briefly while the receiver re-enumerates.
>=20
> Resetting the device on resume instead of resuming it normally avoids
> this. Booting with usbcore.quirks=3D3434:d028:b has kept it stable across
> suspend/resume cycles.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Quolke <daniel.quolke@mailbox.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104164020.6923=
5-1-daniel.quolke@mailbox.org?part=3D1

