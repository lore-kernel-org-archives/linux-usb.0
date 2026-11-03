Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735277;
	b=l2X+SgbRYIqegA7Hia8eArczjeYBx+LjRo3d+kCSD4USHIlS+H20squhOhSv5jXQHztX
	 92yhEHy3ezheYBKHZCwJOahptK1DvBRzIrCJx/k2ZnCa8/vTJP1nO6tMhaVVMud45vMQ9
	 Bd7oOS+mng7g8XiqKbZ8jR99AsFN9cTo9eddKB5IcaBH9Wf29yNQFCsFy8nj0RZNALw6R
	 Ue7GbuiVkpgZZ9Kvi5x69AUCCjSqSTc9k/LWYlxsv2RW8nLEZAziPuxeHN4SDg1QSGrlp
	 nxelQBXWEf8ZFUQnKpj6xZIczJy9T7vLV1FWnSUXtgKaGv1uglxvvxOQjhVrjk+ujKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735277;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4b0PW/iGMFeFdihd34MMudW7G3nTIpz+A7lnAp3XcNA=;
	b=2WUijWpjIyOYYfb80w8QLYnuLobAnlxUB3NUbuAb8x2J+isjoIEtDcpbheH+KujVzNX7
	 DxvY7U7neF18v2AwxygcmCHu/cwAvJ4sjYLW4IqCGH8+cR5HImBHSMaQ/o5u+CA31LmP+
	 x8bEpNfk+/4rheKQkPGtMbteN5de8iHmAlT6RMPsovEP3BLbGGerofGbA6ArBRW7H2Swr
	 bG1GziASAjF385r5eT+V+7Ga7yLSOAu5nbaPKTiyKgwAYYWgTwTcEuynNtBf0TWrhBpWF
	 Do8VqddCkJsVoV7pLhfP6rwds91u8HVLSlJwYWLkiMOmoiw7x6TnnbDDQw3giJzaHyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxHrxzMS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89E606D803
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxHrxzMS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5D61F000C1;
	Tue,  3 Nov 2026 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793735276;
	bh=4b0PW/iGMFeFdihd34MMudW7G3nTIpz+A7lnAp3XcNA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hxHrxzMSzWKbhjVqV9r7vvLRTbkeMqkd6dJxVNXe6eVLgqNyvF39VTaUV3El95vac
	 iXx6bHv+svscEzHdXbL39dpVhEKkzGFC/TxZpAXcmeMj3lir24bAVMKvw5KCUTMjFq
	 UtxUK4D+oFrRu84DDey83oyDjBW36xrznHPRmFytmBjD2ZCE8mrikYkn3p2tjLdm3u
	 wFr+l8PZ2avT4F82UrEVR5ZFnu0r0/ek0arCcNqWD9M30V0ijyxGAqN1uKF8wZ0ZKD
	 TMo8S7UEWJj1x8QqnODwdBbrxFulbQeBaklWpyEve6aWIZjnFZ0dwbtHwmWmquJZSa
	 0uMbp1vUIezmw==
Message-ID: <sashiko-outbox-195940@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] HID: pidff: bound the unit exponent rescaling loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
References: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 19:47:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pidff_rescale_time() walks the device-provided unit exponent one step
> at a time, allowing extreme values to cause billions of iterations
> while ff->mutex is held. In a UHID test with an INT_MIN exponent,
> EVIOCSFF took 3.1 to 4.3 seconds to upload a finite-duration effect.
>=20
> Stop rescaling once scaled_time becomes zero, since further
> multiplication or division by 10 cannot change the result. The u32
> value becomes zero within 32 multiplications by 10, and the u16
> input within 5 divisions. This bounds the loops while preserving
> their results for all exponents, including wraparound.
>=20
> Also warn during initialization if the duration field's unit exponent
> is outside the range -8 to 0. This helps identify unusual device
> descriptors without logging on every effect upload or changing the
> rescaling result.
>=20
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-b4-pidff-r=
escale-exponent-v3-1-f45e64cf488c@cherr.cc?part=3D1

