Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843205;
	b=TJ1G/zVk/S4TVj3BGPAgN3RIwVX0YsbxTzm64BO9bxkMX3lGPYU8zQDEAD3Aal3qZrZ8
	 3/SKJRp8KMOIc4p3fTIu7gib1l0n8nkGIFs5NKvxyNxymwexOAh1eB7OUgCP2a2UyVe7D
	 Z+O1lVZAMQeuvXP1yUtVuBLrk+M21lh/rRZKwrYzzUryhi1/LVJq9bkt1Fg6bfSRgjWI7
	 qX47n4Sj+2jEyRWMjjmOPun3ndVQdmty2XcKBamUuHn1NYWHjxtD5I9UF2E5ep6bLyXob
	 JgLkSP9u9zWG6ttlWUoiVOHlS43K7F2TfeRGqt4NLvPggC9nNHdpwNyacZDXBK9S9Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843205;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AW7MnBVkSae8zPN57lJ7WQ4PmTpGDtsbtFRsEdAexk0=;
	b=fiQzVvGdg/Mu7lfsTolXKjMhAT6SrEfuVO9RrAmBblaGwMIy4tkPuXpUYlWn7YZYmW5E
	 hpsENcxL33cwybAFeeJ23TzNQElrx/Y8eUPsVAEj+IR1ThuwluR43Yn+DHMSh/Eao0mo+
	 9PB2BKmqb/4z2ZJBIxFdqBLXPwQyPom3C+m9jraM39UVPceXm+aGRfx6yFzbQBvv4NKZR
	 moAikXe4miPKg64yKVRd70bifYm8bWqnnv4QHr+wnNSblNWf5ZlNd/QaRZ0Iy7s+Db7Bw
	 pmaUK737cchiESzST1pQXaZ8M7tO4GC+8iVon5dIraZmFXm3KRwczqy6jSWHf48/5/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtkgpZWb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AB5606A32F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dtkgpZWb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1DE1F000C4;
	Mon, 16 Nov 2026 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843204;
	bh=AW7MnBVkSae8zPN57lJ7WQ4PmTpGDtsbtFRsEdAexk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtkgpZWbyCclqPOokBm4F7DqD0fj0BpbnfMwMjxb3zOxqLYo7SD4f+lpxanbdfvKi
	 mDdL+Vwxw6547tLJ2b6s427rLF/5AiPkO7njqFuy7DuwrYHtJi2SbKds0ZiJMFP75l
	 WvwId4rbi/5GXW9nhrGzzpY2btU9V8q8xLk73y86eQVD+NDp817w1uuZBICG8QNVqN
	 dR49iWOnJMeH2FOw2A6B8Q9pBcZFjHUGfkz9mH8m1gkVQID3fzjZ3+mcrwy7NQ2ZW8
	 KrrH2/BEPD8dKxQ6+TQMls/aaf/k5osjlQwOGSeeSsHT0FmkhI7A02pjUolx0HjjMu
	 /hJPLR3S5ZOYA==
Message-ID: <sashiko-outbox-217290@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: usb: tegra234-xusb: Add required
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-1-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-1-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:33:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Tegra234 XUSB binding does not specify any required properties, so
> nodes missing the resources needed by the controller can pass validation.
>=20
> Add a required list for the registers, interrupts, clocks, pad
> controller, PHYs and power domains described by the Tegra234 device
> tree.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D1

