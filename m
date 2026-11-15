Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739914;
	b=AKS0d6uTyk9O7Tx7c+Cq8plT1ym98duPJ8nZPxW60lZ0TqBiNqsewsG5Bvef9UBrK3kV
	 BcmYy5gNAJ5jeFJRiaZO+Jd2/Ag5MbRcMY5laxwW3zAINAkqVWuA1ihbTIbEpkm/m4hZ+
	 fg9cyWuevyMqh624UTy5sdJp7RoVk70ZFUmoT/G0GRYAozXdUK7M37r9ZIVJfUD41jHJz
	 e6sqQgqcyPh1KfabwXk5mb3U0hKQTuaIqS5nLuv5bli/eeMgg+6hn8/NtDNxbUrt3t5OR
	 jjxzFEZIjYBkbHYYxLCQ7ndGmb8dFgIyp3E7OlLunRRX8eHpRutdJjyzDdL+2PtfOLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MHMa1QLGpfXSm63ildN7NpufLRiamm6uVSCY64sX72Y=;
	b=Hy6UsG3cc01ychcIO99fpskeIV6V1cKQ1hC+96y38MuZ9E9MngOENcq6fGFXidO7w43r
	 sy4q/AuBlI5imkm7dUBoyVdW+6MLidRH96IZfJkqTyX94f2wbc3UxnlZUkUoEFIEa8cnU
	 35WLQKCaVec2Yd+lLz2EkvNVhH4h5DWgvNVkfq/BhFq0iH3r+EeYIC1GmpMHtOnsRQjhc
	 s5Ed4sZVqRbtrd6In5t5DqrZm1nEo5SSsTwtsgTHXB02aXKfijYSLW4nE1Y3Bxw6HKSEt
	 h0oMUtmJkz4aQ9h2TnyvbMV984CODeySRTzY2Gwwh8P7jLm5hBu42vof+Q4fif0U20w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsBj0o4F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C9F606A880
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsBj0o4F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CC11F000C4;
	Sun, 15 Nov 2026 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739914;
	bh=MHMa1QLGpfXSm63ildN7NpufLRiamm6uVSCY64sX72Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsBj0o4FPEBdrGw/99ucBxXts32vFIswCGJ6Hw/vmLcQPCqwtxnRle3p4bxA4U/62
	 CD3/MKRGQB1/ObNIgCkehNCAqQs+bo1aSWMAdG2nT16v+G9W70IGlCLMw34MGe6ccA
	 dR3oPf+n+rfI3t1wOR2+vqKwkem9svIzBsVYCtgcqDf3IIzzdN6LJG94OhcfXp9jxj
	 8qlyxj93d4HlQbMuN+sYGbd28DU/7gANmcMSghOj85nw8i3e2XezwKJvoOVZQPvcPk
	 iM8QHuV5V4opG1KkFdzlGepLajxLtnISXdWT4d3knmYzRkZ7s/FrsWnza57mOv4cMe
	 Op834D4P0qkbg==
Message-ID: <sashiko-outbox-215419@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-6-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-6-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Configure phylink to work with the PHYs in the AX88179A controllers
> and provide ethtool get/set eee operations calling into phylink.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D6

