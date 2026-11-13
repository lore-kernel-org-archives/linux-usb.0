Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579319;
	b=WvIIwlGPK4LeKqi3EWAa4p2+2RVqbFj+m7JTqJ0NpKsckk09JBcgLsAeYrxMcyuZrFcS
	 xhuOpVsW8f96uVz8jTsaGgAMlvTRSKoUdw/r6KpalFTVQWxQoZtvaroVg1Zp6XFB1POn3
	 +/zJEiGrfs0M5EIKy6CNWylWgqOhlvFcntMKfNvkHFKb0AOXmQaWzEP8Kkw7cT6ZF7NV2
	 vw5jRrN+LHfWpJYf5CiuGx3pinMiWotQKA0Bri/Rw6ojeok0fRPcZPXtLwdMfgFYppDwE
	 izJtb1p/Kh5PMNczUPhQp0HH4b2ghA6oEPoHsFTMFmcQw1EEjDyu2KgnSe3ucSJfm2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579319;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+5UZ2rIkEoPKS0MYh+XFU9rgxOCKHbUDxSO1q/pv5+g=;
	b=sdGJoG5pl2FYbp/MWjPngXRzMHGQe1gIfUYCULId7reUDkjm3jSxGL0MsaQA7/7vogs/
	 bfXrwVM0bdkn4LtFUWe9NiPi5mvNG1bs3UV/F0p8fMED8l+PPGtgiM8abkqnoFFAA0k/o
	 1UdNM8oTlZnHDjKH0NPQ6qV+NPXqXtojHRjZUW47Gfesh9ThxHNDntJLG9ZJggQs5qmNX
	 3Z9NgmWGR+wCVY7EECCIg6S0KLuMQbipdqBnyi5gtm6M4eEWwxmktx5+wnKCBByC0i2hk
	 DfmXe8IY1wvuMs0yrrTlDYonzPpLITjTcaEQrOc53ESwY9+RHvPQDrgkuN+ZMz52XHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWbed2lM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FEC606A331
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWbed2lM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0563D1F000C4;
	Fri, 13 Nov 2026 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794579319;
	bh=+5UZ2rIkEoPKS0MYh+XFU9rgxOCKHbUDxSO1q/pv5+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWbed2lMdXFBe8B7SjW6B4ueRqZYCIAORyEwRopNsY7c+PHPMu71v1m3lo4Yw/6N9
	 d5ZRFQlmO/q/4dAk0MpJG4Y6eZje0pGDMsxqSTFgxcLxi+Aqe5WTvsubSM8QzmUdRd
	 8jLUdQ/+U5gTqeBSI9cHvdj0iQLW2lwxA1WX5iYotz70fuNTDeKWKF3VFTRiLSqhzz
	 SDS4frAVh+Bw5z1qbcjHIIFnazn/jnN3t64tNGvfoEiWLkyfPNdkWbQXoUgCL4JHPP
	 LhpwhyIDCy7rYRtNy+fa5f7MjjtiyWs7JNYCjXCMqvVUlMj/eR3RDsK8b+0sMCxnbD
	 t9WAid5ZiJEcg==
Message-ID: <sashiko-outbox-212964@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113125304.1693911-2-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
 <20261113125304.1693911-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 14:15:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Realtek RTS5453H stand-alone USB Type-C port controller.
> The controller is connected over I2C and manages a single USB Type-C
> connector, described with the generic USB connector binding.
>=20
> The connector's OF graph links to the Type-C orientation switch and
> mode mux provided by the platform PHY.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113125304.1693=
911-2-gary.yang@cixtech.com?part=3D1

