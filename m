Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777145;
	b=ISB5gEyD7tnGJnIMCeEk6rio4pFKoQ7BXV8fSg9oRhLU3xqTkRaLMXL9iIM/fQQ0/VVZ
	 2rq9PikwuDPlt07t1mp1WQYPwTFW6cMuzqKO8wz6vgRifI6sZigYGf6AotnajXC1aglbj
	 t6a+dzxoBWC3dYZi+dA0QkTbC/M3dFxRImfJBKzk31PDdpyl1DOf5yS1CZfAydsNGP0Ve
	 qi2MmbrwesOhf7puQEY7UI6C3zSVk0FKOjY7oO160Z5rTrLrNKjcrh5fMqcXZ+rs6e27l
	 9GEoPEjGJYRqqw4Ljravp5Eg39AqenlZ0TccgA/tlj9Wf0Yf60zitPHcHf/Z+sEWOEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777145;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ExBedPBn17LOOoUK8dydc/aX1wjobzwZk4RXmSFDkTM=;
	b=sAfVh9KNzY1M96ooFGJjGHnN62xhsTB54Qi6URYyxqy6wGSLWCgmubq70d3P395uwp27
	 MnMEtCkXF9Pl0lswU1NGtg4Oz8+ECoXEOTvxpbyAtXJmK3Z/MI2HjT9vHsiz1F3MCGoo1
	 njtMwBryC89qwt9UoUCheJFiKUK/MOtJRLH1j5/toF+VkY+aRYaVAxtqJKXuNEUIx0x4B
	 I8oE8zmDrae4AGFyy10o/sG5QG+gFpnh5jcQaffrvGntEiV1TPuEcMg8OZE+46pfnTQWy
	 4zmLSxSc+8UtJ5oVlKqiqVr18BoTckwgBaEy4GRmxN6my7HmwPoysG1nF9W0LPffavw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eY6/j99f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5B9606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eY6/j99f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289231F00919;
	Wed,  4 Nov 2026 07:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777144;
	bh=ExBedPBn17LOOoUK8dydc/aX1wjobzwZk4RXmSFDkTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eY6/j99feDRTAGuCk/LQIhJ9d8kdWjTFUYjOf9NCHVE4Ql5p/NvboXcn3AccQh2Qh
	 RgSN30q2BxI+Y7dd3q/2Z84f1ofLIvsr4fSYvr+2xf5q/3MOaewzFHoT41shR4IbXj
	 YGAyvVBnSJHq5GITRTXrQSptLJhe/HI9tve1NNZehfkDvVTYsL8PXfuOHyPTDXCZ3X
	 wm5M0gRk09DmZ9BqLAI+6WDWroP2/3tMrNRZE3Idw0V6OTN7gNfAaXiKogUtIO6qXm
	 WKE6vMiIB57NoDdAd9jhzT/+yCyP8qCpHoR5e8PyeorvnMGcrupRnbGcLPRnvlKLLL
	 xtl5bdKBDhNkw==
Message-ID: <sashiko-outbox-196789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc2: Add Siflower SF19A2890
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-sf19a2890-dwc2-v1-1-d959375e26ab@telaak.dev>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
 <20261104-sf19a2890-dwc2-v1-1-d959375e26ab@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:25:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The Siflower SF19A2890 has a DWC OTG 3.30a controller, with its own
> bus burst limit and an OTG interrupt quirk.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
dwc2-v1-0-d959375e26ab@telaak.dev?part=3D1

