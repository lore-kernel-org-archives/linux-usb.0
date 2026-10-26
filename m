Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978769;
	b=lfoP0j9oo+seyQjT90EUsZG/moOgVXgbdvnNO031H6jK3nkkx2X+3wjQWxvTYU7undxN
	 c707TbBexYhJfQIg62/K9Z5SLUoYqW1eBQ9tfpWJyovPuAXgwsRWHiebEonlxNN1XhzWa
	 YN55ylC86gHvnkwupL0aHfASMJGM3gCZJ5nthIVk6AEGfAy/P0cqQhQdTCTwcanI3cbx0
	 pxnCQ280IavvSd/ujD7gTKK3KZCB74CwL+S8pGBs+JO+VyTwxoOYs1e7dznrA0641Atim
	 1/k8vErnjlMB0tDUlxkRhpt5EvfBhr0WHro70wTS4mPxNYFc9sjHReYWZdKn2u2u9vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978769;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RPsfDMuhRPinqH1B4J73f1yqoDqpzV8i3HQ/lxbRwVo=;
	b=eUz6csDbJDvTCXFhy7TqdU0J8lpITZRfQ/zwb9Wr6y9dcrmj8/CAY2C1wfCbA7bcaWwZ
	 xMGWT/HgRNDLz+5g0WHnmCXHEbXu7Acs3EYBHhEiF4Kclz9SabxwURA8ITlBVgzgkrDfm
	 7zpdP5d5UZBjd43fZFVoli2G+nEiN/j3ZvPlJQCD0qnhyyVCjU0BU9utfKtwmXYLBZAFo
	 uBqtPhsEcQb3CRPkP5rOamiVeLTldxYxS8UPSc3U9GNs4vC7rge3Jhi3I2sMjkBkIMh3g
	 M8JVTpAP6mBf6INoSOWUNxX0KNL5sssr3C7yibNsfKOSi/CAsOvSP0yqyR24heLGDBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=geqUwXYm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99B606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 01:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=geqUwXYm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EB21F01825;
	Mon, 26 Oct 2026 01:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792978768;
	bh=RPsfDMuhRPinqH1B4J73f1yqoDqpzV8i3HQ/lxbRwVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=geqUwXYm81U79GN0PBq81A7EWRdPcNVKIERg7XMJgmvzYfeHJC0YKzDyOj0pNExOG
	 M4B+AxbEj3EULsr5+xL5pT9zHT8qJGqHnm8xHaBslRrA5MNh4/PHCEXsRU6KzDDF+2
	 rlcEtgdq6B+K6I87YQgDJbu9uRjJkf4cR4mM7qTBD6f2SHy3bXOH5Z3kpvhJ6sX4Ky
	 4IqF4kEIQjsNapTMiAcaF0buBLFhokNFbpdeOiEa5hCgzUVtOMnc72ooczV45eP4rO
	 g7WOngPCoCyqmzpSVjljq+7loeo9XiN1Wqao9eSsQ6/JcF89h2BMpxMU5d8h1b9Wuk
	 cqksZmFpWo0rA==
Message-ID: <sashiko-outbox-184585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] r8152: Use BMSR to detect the link state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linmao Li" <lilinmao@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026012345.1902285-1-lilinmao@kylinos.cn>
References: <20261026012345.1902285-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 01:39:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> r8152 detects carrier from PLA_PHYSTATUS without reading BMSR, so
> BMSR_LSTATUS can remain latched low after link up. Since
> commit f6f2e946aa4d ("net: mii: Fix the Speed display when the network
> cable is not connected"), the first speed query can then report
> SPEED_UNKNOWN, which applications such as NetworkManager may cache
> until the next carrier change.
>=20
> Use BMSR_LSTATUS in set_carrier() so a latched link down can turn
> carrier off after the link has recovered. If BMSR reports down but
> PLA_PHYSTATUS reports up, reschedule the link work to read the current
> state without waiting for another notification.
>=20
> Tested on an RTL8153B: NetworkManager reported 1000 Mb/s after 3 of 3
> rebinds, instead of an unknown speed.
>=20
> Fixes: f6f2e946aa4d ("net: mii: Fix the Speed display when the network ca=
ble is not connected")
> Cc: stable@vger.kernel.org
> Suggested-by: Hayes Wang <hayeswang@realtek.com>
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026012345.1902=
285-1-lilinmao@kylinos.cn?part=3D1

