Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989280;
	b=KyM2+w6zJockLzEcFwsgxpij0SKwJcCbKDVdfFRzYUKyAG5MWye7yauVR4ws2aeRGC8q
	 zcfo0Nf9zU7XAaIV+STCIzltL3fbI7F5CENmRu0bt+CCXfDs3UCvc0hKodFfTSDOkPIZf
	 544Gr0VBveQy36s683El7Gzd2rlvuAfWLXYlxbopRUthCsJMDcHwkfRn9y2EKtYlmm1gK
	 RSTajLlD5gWnOfvJhByA6IlqROALL8cdtiXjCoOfFOtNaZ4cWGWd+7xzDydDCRr6PUpOP
	 seSE3MiG3c5kv3fvCcrTD9LqMSH8eCK6xUfOdf5hG6HvBxyvS0cQ0Eq4x3dGtHwOYDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989280;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gsniAKtynmdKb6q6/4evgkBCehTCup89Tb0o0Cq9fX0=;
	b=JxBxF5v+2jnG5lhoUET28qng3cWRY5XwP2eOppsqbtoLDddPyYXb4nWK0slxVHuEK2jl
	 xz9W5x5VoR4e41zvEHGWzRPRVpEiAuLBIOLQ6cfVDqPDrSVhZl9KOd7GpYtkJP8+jNaD3
	 YTAwDXCvQKv4LgRTFUlCrGpjU3y/QRgV5tXXD/muBno3CPw7zTGa+fUWiNikL1TvVWc1l
	 m3Bqy6bfbdejKZUF5+v8skd8ppU5YBpindiviVLqMmmDBzahmJD725spNWwGlJoDNWN49
	 /9zrj3aYxgZyIbQY74vUfTw4OKNTVeC7Xp2f29aCG6ZoiqX5n1FxKG+NHlhT9uX58Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC3uIagw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE6606A325
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lC3uIagw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DD91F000C4;
	Wed, 18 Nov 2026 08:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989279;
	bh=gsniAKtynmdKb6q6/4evgkBCehTCup89Tb0o0Cq9fX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lC3uIagwogHaXfapTLzjpt/5irMI5mq3DP6/eqngi6R1g/9yBdKyXs2rUCfhN90Mm
	 BfrfJzu1wi5LMMyL9cwcthQw1vwIj1foZLZ16MOc5SYWTgQpJ17YlkbhcrF5hFbxdQ
	 RUC7YYRKmwjNsOxd+dqUBESDqQ4peJXd1l7keoJeRm869V98u2tifMgEQP9xpi6ROP
	 +22fSZIMqmIld/JmcdhR0GHBQ3M50c61/AGEw2ljiu1H3njwNIex/G80vTraDxPe9k
	 STqqPBcYbc+i3qyDqsS/wvvI9uHI0WW1X65VX9Ukj4L0S+uUknm0a5Xvg4WedYJwpC
	 gmMX1+CgGoVKQ==
Message-ID: <sashiko-outbox-220413@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: host: ehci-sched: Don't let a bogus siTD
 remaining length underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gichoon Han" <gichoon.han@samsung.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118080348.172772-1-gichoon.han@samsung.com>
References: <CGME20261118080357epcas1p1d496c3dcbc37d76fd71365cbab494352@epcas1p1.samsung.com>
 <20261118080348.172772-1-gichoon.han@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:07:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> sitd_complete() computes the received length of a split isochronous
> packet as desc->length - SITD_LENGTH(t), where SITD_LENGTH() is the
> "Total Bytes to Transfer" count the controller leaves in the siTD.
> Nothing checks that this remaining count is not larger than what was
> programmed.  If the controller reports a larger value, the unsigned
> subtraction wraps and the class driver gets an actual_length of
> nearly 4 GiB for a packet that can hold at most 1023 bytes.
>=20
> This was seen on a Novatek TV SoC with its on-chip EHCI controller
> (DT compatible "nvt,NT72668-ehci", handled by ehci-hcd through a
> vendor platform glue that is not in mainline), running a vendor 5.4
> kernel whose ehci-sched.c matches mainline in this area.  A
> full-speed UAC1 microphone behind a high-speed hub was streaming when
> snd-usb-audio read far past the URB transfer buffer:
>=20
> [ ... ]
>=20
> Link: https://lore.kernel.org/r/87se19ufoi.wl-tiwai@suse.de
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gichoon Han <gichoon.han@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118080348.1727=
72-1-gichoon.han@samsung.com?part=3D1

