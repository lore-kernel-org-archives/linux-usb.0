Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656820;
	b=YwLIsxt7vE9+tGz+nITYjBkNAO0elzk0sJ9vUgMfYIvIlqGyNw6Gi5VzRZPihOEWkQ8w
	 kmgVjDyPvRQLjHRC30kUtBbUfPhF48JB/07ctaql1UjS6LjQwNOm6Y3rl2kq5lUGRFmYq
	 lQe4U/jH6C/SdWFbztklXPDsvY4WunnzVFpaMgv7Cvk3qesox+qZDpwKVXzWf2WEeLuW0
	 jRhHcCyCokpagEY/fKfYb+EnZjZt9lQxTMYNKcKIHb1KFgnSmm5E/Y5sY9ljkk2SvBQ+p
	 LkgfFB7wDDHeYpKM/ZoOHacvUDckzgYJ46WxTj9at5qXI97Cvdij00FRp1Vtd/nDQNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656820;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N6NSARlscLmrcab/4uB7JUdXazNn0Zx9tQPIJRzSKS0=;
	b=kni0WXMvP0Jm9PUeEMedw9R4XzvV1SEgXRFn5X4Rly7gaiXo7FtZ8p27ussRiM5rSx/c
	 M9qIvXV0sJU+saOVVgfq+ro+BtGmTMLkRe57bpEjTmmSoVBEKE64I/t7fl7eWVKiQEIkP
	 tq7+d2rRwLZ+GCqX2gTo+lvlpI2vgbG2fd58VNGrhoohbOB3pMSEgYyrOlZR9cxCCuOg1
	 IfmhjkjY7/F6/DUjXHGQzj94HzV1iT/DdeYUgZ0V/zQls/NFan8Z4mYmL24lMmh2JLSPq
	 F095wpQA8BjzCpQopCv/c3o0Q+lsnQz07QAXZ3hgPb0+h3TAlmvvW0dMENIgjPOKqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n4J2iB/4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7746606A32C
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 22:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4J2iB/4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505E51F00A16;
	Mon,  2 Nov 2026 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793656819;
	bh=N6NSARlscLmrcab/4uB7JUdXazNn0Zx9tQPIJRzSKS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4J2iB/4FkM6cLG26duNRCOouKyd2ejqRnJM0pXJAwif3W4VeLWebqPw4F87FdvOG
	 ummtNvd2BiVYn7ORToJ66SlFBhEDqLZeatbcB9AtIpET8LrU3oJ5+gexc0glKSCBs5
	 vZEwiuv4MDL4bqMDK99/gf5ADZp+wVp8V06M9Y2oLc91LdC40fM6xPTpsEPBM/1XPA
	 XF0X+RHRUuC+VkYxhPb4p3Zcw5OQnM/Ph+U8aG7tyIxILkzFtYLCmZ92eXgjwm4j+R
	 gyU4hNB7IEzeO1IxQsijvf6AwAByYWEJ00vf0wl3YKAHVQ5IJ/cg1f9HT+CdtjJ10I
	 OE3kcHRtcld6A==
Message-ID: <sashiko-outbox-194245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102215121.738-2-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
 <20261102215121.738-2-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 22:00:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> DisplayPort pin assignment gives it all four lanes for DisplayPort,
> while the controller can keep running its USB 2.0 port. The controller
> has to move to the UTMI clock before that happens, so it needs the
> Type-C mux state as well. fwnode_typec_mux_get() only matches graph
> nodes that have the "mode-switch" property, so allow it on the
> controller node.
>=20
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102215121.738-=
1-26rote@gmail.com?part=3D1

