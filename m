Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393759;
	b=iXzc0L6XckxeLNgydN3ouG6CIZxBd35G8VGwWym91e7vkO0pbMIagN/2YPaxW23q3ldW
	 BPx6LDD7PrOd8ZwswF4J8BLJtpFO3QJJre8jyBpbejGFkBMY4/V5ZzJUnISAlJqdlAuGT
	 0pWeo4psupiuNy0+suqH9lE/pgw0OfzmkVgT4Gx13uifCxl8hJqkwV/DU2M7f275LBTKA
	 tMeC+UZx8lCuKEUzXqfUYbQLQRl5yLieR3C0s1tzGyKQzwbSLw/4rdn9sEoHLHiK4YypO
	 yvi9pziMiHGS2mI0UwaYpFfieZ4fMs10cmz947EcSDuyoChgO6o/7dL5qN5IwbyUNuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8Wqxi0FS4fDa1vE4fDxHS/ObHtudhUIER5bpzOSiN9Y=;
	b=AWVC+WBxzFMwhsA4sORpqNnNUaialtzqP5jHDvAF6SLvqruhP+X31s4qZgRrmF5VZOH3
	 HLLY9xfq1CX1d4U+1twVIKA0oonR+MViaw+GbotjUGW5sjuZCN6/wU0paGQ225YRoIg4N
	 l5bCOJpcgPBE9Y2BC9Uqp52WKden7MPwJYgZGggIE648GQD3KRJList4MuArhU8a7RRj0
	 mbui8OKJXJ6Wcu+bUMzsxn3oTUyj5UqfBjfff0psMPF3hkGRB1kt+SWcq/edCwjZUMaXr
	 nO8Y0+NHKWll1zd7Gg2gBVLdt18M/+OEmGiR7+pYreFzmEpQYuYbW13qaMBj6d/M0zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cb5wHPBf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B3606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cb5wHPBf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7634E1F00A05;
	Wed, 11 Nov 2026 10:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794393758;
	bh=8Wqxi0FS4fDa1vE4fDxHS/ObHtudhUIER5bpzOSiN9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cb5wHPBffFiLTrfiGBpMYgYW/dO9RWawhz9rqxqsBx7OTmQKX1UnRJGfTGK+P57m8
	 v/sOpt3kPXiNNXLyxbqyNIjjZDEzf7t84msc+MfB6OsHo4V9iN/fQjc7DCt4+PowuO
	 JKWAfOItNGlVKEN/Con/P/PFUhfZte2gxhdCDXDF35lKiNDtFn35tHxp1oCy4R2m1E
	 Vwa2DSYTg7Co38pIPnI7BCTd4BosI6a5ENVwxfpMseF49st2J390PNP8YW9hdJ+k0o
	 qgiwq+BdthnBuDm3VyZ5Py60Eknraff5km6R1SoIAP9pXNFfcBtO18IHoAutTi5Sng
	 CBncYgamRWkyQ==
Message-ID: <sashiko-outbox-208821@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: misc: onboard_usb_dev: Add Genesys Logic
 GL3525 hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fei Shao" <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111103710.1393311-3-fshao@chromium.org>
References: <20261111103710.1393311-1-fshao@chromium.org>
 <20261111103710.1393311-3-fshao@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 10:42:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for the Genesys Logic GL3525 USB 3.2 (05e3:0629) and USB 2.0
> (05e3:0630) hub controller, which shares the same reset duration and one
> VDD supply as GL3523.
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111103710.1393=
311-1-fshao@chromium.org?part=3D2

