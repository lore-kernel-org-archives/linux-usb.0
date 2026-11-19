Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117997;
	b=27+KqwGP8nSFVsarGWBB/iEBQ0EsMHI6/CqVt3Z+oPFCtGf5aA9HbuklMgbXQD6JMAxF
	 /BG1AqGYvDacDhIPTANJJWaZVYMKgCsMQrg8dzcFfitx9MMvVmFWGjWO/R9a4VlWFIsPK
	 z0QJ28wjbxobOjG5spFKo8nTirIBBVKJzTSLwT9r8qOFr1uPFVP30+CqR2YVltKjcdJnV
	 ZEI2TA7bbba+wlrBZj5gmedADyoKZK9MZoBazwNfl1iB0C9kFipwTMj7A7djsP9034PFc
	 RLiZNSoJYkS2eXiRrhbOzNfKTNtQW0zKkqvqcwFx5BmtgjwwsRwpfd4ZnNqCV8Z4/Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117997;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kDLocQKb78Nmo6X/UsFyNjIFSsUzW5Zf6DZlc4DLII0=;
	b=jfG1aQ4T0Pyu8QaUShhxuqjuqgW3XdM+to00Pi5DzLwV2mhVrAV1trsZP3kPq8K3CPwv
	 dSzsqxufay5yy1Aw/Gmp5NXojXFsmcQVVDl3nEqq56lV0zVK3y6xUxbMONnHUu0xDpTlt
	 B95EdMRBxljtqjqGPzA/tbDGs0ClJjpbWDAADYe8YegZs1VLtqYqd9O8F/G1QmoQfY7Hh
	 f8l1qIIpNbTLlGqaWAWN/dNJeyRxW9E/3kVPc2+S5ozCI3EqhdFAeEJsmrKP7yWiPLrqG
	 CAWFkbU6SJS0MEjxzqVZvhbq0Fdzm6mEQkmLDYjGdLi551RlTGXMXXUm562yXbZHWjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSCd1XrX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41048606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HSCd1XrX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FB41F000C4;
	Thu, 19 Nov 2026 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117997;
	bh=kDLocQKb78Nmo6X/UsFyNjIFSsUzW5Zf6DZlc4DLII0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HSCd1XrXBR9vHjbJ9/sF0eSzkvAPmdRQfE0dXagzQCUbEHmQ0HFnvDFrpd22dTHdB
	 9vlfmVXGFJD68LRkT2LLKLXF3hEhirmXmNTLxDDbIuLHMqkpa8L9JoLG/4eG6Qs3fb
	 brQsroMZpGq+CkNSHEViMAPwV/bC2xq9aSStgW+yT39lkTtnthCHm1Xt8C2RhNy7bN
	 FSwR3YxrZnHa0Mjv7r0xoGiLwtENu/plZPNrkc8I3KWAg0PQXgXCjLpDybCzvv88VX
	 avqr8yKGzhM7vWe7lErnqpKQvdiK/Q5HYRSjXP3H7esMwgEd2tEaNXgTVEz7zTRcC6
	 Vh9mqLLe/3OHQ==
Message-ID: <sashiko-outbox-223979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-5-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <20261119-gta3xllte-usb-battery-v1-5-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:53:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
>=20
> The Samsung Galaxy Tab A 10.1 (2019) has a USB-C port capable of USB 2.0
> speeds, used both as host and device, and is used for charging the
> tablet.
>=20
> The port is controlled by an S2MU005 IC. Until support for it is
> added, only USB device functionality is available, so enable the USB
> controller and PHY in peripheral mode.
>=20
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-gta3xllte-=
usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org?part=3D5

