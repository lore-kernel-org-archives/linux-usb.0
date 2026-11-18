Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794977815;
	b=kvqE93PsTpnWy2fW/loLR2WOw6W7ipSYlhzhLi4crTzQk+okKw4XuP8equCS7qb6jt6o
	 LFbMm6zJBVWnJnS4y5yVZqmhxKFTra0OgPY+mbCKbkfpXrQGEmvTeex9t+aCzAVw+VnVm
	 EFSnW/MR5IpL5AFWaAu1W9mBWEief/yjn+4FWPTaNTOgNT4Kb9F7uQ46C1bSD/XtjFoxp
	 OmNAHcDOI4bSQzZ5TW0GYd4bZcnxbpf3nsBikRgJQlYIQKY1FQcidWTXMyKY8TAamILTg
	 tq/MK6ul/xtp8QbCfjvY35jFjDNfr96ib2NGELcLLnMKMj0ljLwghbA11002cbuXHtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977815;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AlHw69xNkr4eCc0cO/rv3ESwn3HZCEfhyerSj7zn6SU=;
	b=CbR5mzvk0FTbNmF028F+7Ouy0AOkOTgw7IuCHrG5Xo2eg6JbQDWzxR6MSTainm/qEj/F
	 Y9krKE1tm8/e9xzzX28bTjS9Rrc7DmSiyEWdxsoGvfp96FynBnFZZWoGbhKtf0n02+ZcM
	 nDaBVP3LQlUqjDusQHl4/dyqBvpPctiZNYKCT6uG3nCGETW84SZlen4htl1zI5yHLw4fY
	 u36aVguNe/4dGrFRb2Xn0qDb9NRUa+3Xfch3QfxNaAglTnptG5ygA4PCht3meCAyXKdw1
	 gWKz8jSr3bPGFZ6cYWwoxanI/fbie2MZsnZhToJr9lXogqYs0m6bV5/qadmTsMjSVmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWPJgeIs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAD606A331
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aWPJgeIs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A5D1F000C4;
	Wed, 18 Nov 2026 04:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794977814;
	bh=AlHw69xNkr4eCc0cO/rv3ESwn3HZCEfhyerSj7zn6SU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aWPJgeIs/N8d+j/RZ+blzTsUOaPji3l0TVz9F7KqNwsNYbRfiZLyMsOwVmHMZBeQS
	 hQgIbmkpXYoUs+oQMygt5DonkB4ANfijTTYdJ0WKLPSrLZdRmQkExo3QDBQo30yLtF
	 SIDDCowCqPDgDoOrn+gpFuwRul1UZP1PqkhfRvAs8oF4fqr7ucl6aq0B52HAHBUSeg
	 Eky6X0WgemFn74q3MSWHZv9Rjlz4okOuMXgzPrS5oGez+2i2r9PdhPX7QzUxA7j/CV
	 F+uEnY53tANCP/5Oaj4VI2fK105+ZG30LcT1mkrNCKrMxrxjEN43S/NTUL2yjt6tTi
	 KyUFjmby6QcNA==
Message-ID: <sashiko-outbox-220130@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-usb-port-pairing-v5-2-5f1a26789270@gmail.com>
References: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
 <20261118-usb-port-pairing-v5-2-5f1a26789270@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 04:56:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> With VBUS always on, a USB 3 device present at boot connects to the EHCI
> before the SuperSpeed-only xHCI is up, and stays at 480 Mb/s until a USB
> 2.0 bus reset.
>=20
> When such a SuperSpeed root hub starts, reset the USB 2.0 peer port of a
> SuperSpeed-capable device (not a hub) once with usb_reset_device(). If
> the device appears on the SuperSpeed port within 1 s, the USB 2.0 device
> is disconnected; otherwise the reset completes at high speed.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-usb-port-p=
airing-v5-0-5f1a26789270@gmail.com?part=3D2

