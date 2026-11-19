Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118018;
	b=5FMGU5EVFs2UxYdigUfFPsjxS9VK7pVhH1QHomRMhzYG6dveBVHDVnh8Apaq4/vApev5
	 XoNQUpsJBsjTuvvx7kJMGJYXfvAtw16XJDTN6S5sVi7J1kLeGsKu11sNqlkFwbS9qFeNY
	 2/hFYFSTNfhTG7mc+biNQvoU+uIXPKZ3di9rOfbvbEaMIKkZ4OqPY6WrTRsNoT3UaAst+
	 En3379idQNaVjp/Ic0UAbX1m8/d/Ew9ecuthrLm8lcC6cl0Go3AfSOD6OQgnpu/GOgJPR
	 3ntdnxcCMjR9nZCR6D90RyNGKCilM8BfJs/CDHTdSiFYPuEIEq7Iq2XBjnotrt0wjvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118018;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tdh0YyQdReXpb2uyaY89Wghm8i/FJD3dD8MiREtHTAc=;
	b=p56OqHEt0abzdQ/d9B0oZ0qd1DM+ZGiA5dg+xxxNQF7clECQGy3q2MRthTTDih7KEAy1
	 gf+oqLDRmHNetxP1AzUDITj2zkZMW8nhl4qlw0R82v4EI4HhjO1pp98E6tJiSeb+5M8GQ
	 cXcMHjHK7BfX4+zm84f4UDpyulJh6aZiOr4PcgXU5Ysus7a/wy5pjsStszvjq0yfQheY9
	 TNis1SxhZBNTGJdv1hnfO4259CG+vJalnz5M7+mZgQvgSz+rV+dfRdzXTjtSzCFBio+AG
	 1vDG8twYh0a8iE/j04SLhn37/8bkVfJP36hQD1EyRvr4HO435/1B5FbaAvomzxpKMFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjARhyQ4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E80606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjARhyQ4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8061F000C5;
	Thu, 19 Nov 2026 19:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118018;
	bh=tdh0YyQdReXpb2uyaY89Wghm8i/FJD3dD8MiREtHTAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NjARhyQ4kLxY8IdEM+1QFcdc8wxWjzuPAq/cvhInCBBthhof2qeXczz7ouN8MkSUx
	 3QLP0/JqpbU+m3XJhrdjeU4HATowX3YncXT2Na31RLbBnYN0FjtDRPlF63ga+r5lSb
	 rhoslv6tj1NTbkW9FLJnUmEaaysp7XpHbnV5Uz+DAcsB6QshpsOi72L6kFKSr9z9Tw
	 nUIjFgolb0mlpCeMNBY73tVCtQnFe9IuLxPt3Dchl5HsXNDPocmJ5qT2dJx9cV78zG
	 bdnAHnlmenDvadgw2/Hpr6E9haW5NftGeHtWDdsR9DjykO6q8fNYTfH9JufzgP7o42
	 pC7jLt2TSQUVg==
Message-ID: <sashiko-outbox-223981@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: exynos: Enable USB in Exynos7885
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-4-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <20261119-gta3xllte-usb-battery-v1-4-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:53:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: David Virag <virag.david003@gmail.com>
>=20
> Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI.
>=20
> The SoC theoretically supports USB3 SuperSpeed, but is not implemented
> in any known device. The vendor kernel also stubs out USB3 functions, so
> we do not support it.
>=20
> It is though, perfectly capable of USB 2.0 high-speed mode, both as host
> and device.
>=20
> Signed-off-by: David Virag <virag.david003@gmail.com>
> [Umer Uddin: Rebased onto krzk for-next branch]
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-gta3xllte-=
usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org?part=3D4

