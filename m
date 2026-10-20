Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486068;
	b=CilvTFyKL+Q2H4Fylg2K06WU2IyAOS4MWvYQiuVtL79FcJD3k9GwxE3PxLDjlm5smqDo
	 p6h+/8YsYMPhoU6YCqygvCUO63W6aZKjlD/89RPSJ6ZkfSXd1xmPcOCh5elPIOJttuz0/
	 TdOIm2lTDEd8d/jvSIOoyXKSe4Xh95uKkONpw/OeCgygtWR29gF2iCloGe4WQjfkmjE89
	 9ijit0dZBvTHZTryY4ckUfAyQF8Gb181z0RzC57BYgdoXYUDvS6Vc/r3dizzsWw7agyTk
	 WFGzqDpNCgo2T9h35eEdwjZQPXCNuubnzv0b0HKISXOQCLoodrhPUywzep3f//3tIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486068;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r3jHPgU+23BKGNsteKggb4z0mnK2hFmbZpQla+Rsei8=;
	b=EJA0CKcqVdIZDk4cP1E1whj7azS9T8o7d377GFSnVbjxOv5krOZiSRjk0UDtX/bo/yTG
	 JtA7XmtneJIqLdB6hOTijHRszxMoN0pQEvGj/Lk4fL7ayzkKi9xY/UAWwH/w4uZeSbDJ1
	 ckOXz5QKa9v9MqCuIZUSfbb8OMlqKVrBk32jmRe5fxmd1Kn7qaAB+SKtdAcJFsyBgjyAQ
	 ZKMNYDISz7pMClpOGGKAjp5bD26nx2vZNI5VdA3fsjo71UGFh7u5ob2LYYsCtzD3EJP58
	 ViTV5LYatN7OG2FSZ0z5di4MCLL7CLN0PKPnmhBm1zVVjSx3D8MI4iR6GSUy6LhgTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7ygyJ+H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7B60A2612
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7ygyJ+H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133D61F000C4;
	Tue, 20 Oct 2026 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486067;
	bh=r3jHPgU+23BKGNsteKggb4z0mnK2hFmbZpQla+Rsei8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O7ygyJ+HJbkTUH6EMBVSxp7O1Yv4xNhyQzVUarZqFjQkJhmhyVFpI+k9jZ5OG2mxv
	 mhdkYF3/MoZ5toH26cxIs6uVEzQId3dCG0qzzeUSAIQh1D8KPvrayh37ZfDm5jocWC
	 KGgHJ7qVWkjo3WNfaAQb6QlKnQ7iJWqXUYSfxCUSuVy0issRwxQudTsmFf2ytgubsk
	 AJBX3eoYx5pF1kmILhOh+aJ7Jp0bcUzSPccD+dChp/ZrdCnna5azxNz1X0L2AA/tXf
	 B/MbswPi5rGky+3oMgHRc0KkGt73oPzt+aI9gU752TZbLLMNZ3U82oDcsQ2osmzKZp
	 PWA0lm4yVfUGg==
Message-ID: <sashiko-outbox-178623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: fsa4480: Add an optional audio
 port/endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020081343.1507986-2-val@packett.cool>
References: <20261020081343.1507986-1-val@packett.cool>
 <20261020081343.1507986-2-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:47:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The fsa4480 mux is physically connected not only to a Type-C port
> controller, but also to an audio codec which has to be notified when
> an analog audio accessory has been plugged in.
>=20
> Describe a second port intended for the codec. Keep it optional to make
> sure existing device trees do still validate.
>=20
> Signed-off-by: Val Packett <val@packett.cool>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020081343.1507=
986-1-val@packett.cool?part=3D1

