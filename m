Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472947;
	b=sXom/n+NCAc73/teCFxMVikl9YFXUEwdiNb31hexQBXux25wJPHvbJ456k+J16g5QfkM
	 GKVqFidRxr1akNAnd2YJxlgBqiSiGM4idC3bmjYpVTVVQGmcdObUJc+GcHjFB+1A0fMtw
	 CpD+IFShuadVcI7ai6oI2WSLhsG6B/ghFpOxb07GT1KrD6Z1NgXXk3Kh5zBgWqjcksVHq
	 Q3aHmheS5RJfUFHzIJxElW45QVdyP458Qg732Ji+14WJYhAX71RGpy0g4TXn0RkuwJWYW
	 EzbD5c3Tiju/Tk2kvKgSnChmV0HgSAILJoZSCnA0oT+9pA+5dU5K1z28/iDK2AWgvHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472947;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gra8IdmveXO3pgYgGGEoA7JKxTPZ5vc4kjxxr/JfxDQ=;
	b=UvZeuwLxYeoUitwJGtcs48ik5Jl3qszqefUCqwNYOehNnID9DPJKmwKGnAZNSUqHtA37
	 1V4Zl5+WXLSdSQQaGWrJd1TVJW8eZKX5ZD6Qu2iIcppuosa5Py0wpEF4vIn/cgIDThQIa
	 ssWDVv2x/qfAlvdh9RHIqjCOhH7LfPdYcjdJ1ErbZyMJ3tZUjgR6r9VVeFxvQSXZ/VnWJ
	 +t2fsknR77W1gHIAQX6oM2izgl9ss1IUV+SqxIrZaE+gxQlDDt05/uqqvUqvkhs2F/wq5
	 PMrr8G3U+rQTtDvBb+QQzwr3/G9NRW2+D8J6l86w9oeu7VTa+Q8V5HPM7Gd0gAefS3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFvA5YGv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C646072804
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFvA5YGv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ABD1F00A11;
	Thu, 12 Nov 2026 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472947;
	bh=gra8IdmveXO3pgYgGGEoA7JKxTPZ5vc4kjxxr/JfxDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cFvA5YGvNqfLFEav9+l75Jw+DteCGclq/gTONmSYC5bkVY1l4sFq/dIQQBFp4gvKQ
	 PRaKcpoNZXbq0SEusAd+pzPMUXlggF5kKJMeOLWBvIyKHZKYSi5whLc5c74oRrApfw
	 gwp1e+pHBctPGssxwRo5l57WoPzMXBeHBh62lZZh+zSxwZEvro/pAUStwQ8MBzu9Gc
	 TaE7tc2pCLUAfzjvMur4ePFBCIqUHY5dBBzkCkAhYDBSWsSpbd/YlyceyTsmHPVkwS
	 5y4u5fYm9vHGJZb3323PPsNZStpm0GBfBNveDl93EIhJGCSfotB1a3nPVF4WjCm20Q
	 JWNZzQ+b/CRDw==
Message-ID: <sashiko-outbox-210764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-usb-port-pairing-v2-2-45f5a1a29f1f@gmail.com>
References: <20261112-usb-port-pairing-v2-0-45f5a1a29f1f@gmail.com>
 <20261112-usb-port-pairing-v2-2-45f5a1a29f1f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:42:27 +0000
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
> A SuperSpeed device looks for a SuperSpeed link first when it sees
> VBUS, and connects at high speed when the link doesn't come up. It
> looks again only when VBUS is cycled or after a USB 2.0 bus reset.
>=20
> When a connector's two halves belong to different host controllers,
> the USB 2.0 host can start first. On the Orange Pi 5 (RK3588S), whose
> USB 3 Type-A port has VBUS on from power-up, a USB 3 flash drive
> plugged in at boot was reset by the EHCI about 10 ms before the
> SuperSpeed-only xHCI registered, so it came up at 480 Mb/s on the EHCI
> in every one of 6 boots, while plugging it in after boot gave
> 5 Gb/s. It stays at high speed until it is unplugged.
>=20
> When a SuperSpeed root hub with ports paired through a connector to a
> [ ... ]
> to its SuperSpeed half. The work runs on the freezable hub_wq, holds a
> runtime PM reference on the SuperSpeed hub and is cancelled when the
> hub is quiesced.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-usb-port-p=
airing-v2-0-45f5a1a29f1f@gmail.com?part=3D2

