Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797434;
	b=DOrTtWHo8WJgbu/5sS9INUmAGbvsUsH12eH1NfGclcxv8+kZ5ww4mP5kdFXyXPciprzJ
	 g0sS9paUYehJ3QbXkKEt4vYivMwR1SlIVb7MAVZM5UtGy1chMCDgooGW9mpnI9EhseCDF
	 7zESHZ8+/SC5kMNbiUe2c1rnYFp6IAR7SONq1gH7EtlyMgsTH1Dusfg0m9sWNhR1fGzDf
	 HmuxVAgpbr/CFAJPM7GQZjgUw05S+F97qHWnbkWKe9gfHHVgdpAUSTQnJrzry2TuOmfv7
	 +JpP3c/Gy1lkF4/jg2/Wlds37LIgMEYurNGQ4WJTMWlIBJx536CoxE4lUEy9QV9ba/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797434;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N6Ff+6w3MwGO46SYv7RRn/6WQfUnWjhdTOVWjVM1OxQ=;
	b=qnJDZ4M+by1DNPyfswn+BdEvITW4vf64j1VcPNuky+TvQX5HwJEwkfc4aRf9TXwHhz1+
	 goZM9XK2RjtR+0YQfhZmcd62MySngGQ+2TfpmL54QSFHNEmvbrjaTLF5wnu5qo+yAl2Jf
	 nD7cilWqc7/DXoZQ+cHN+dSLeRh75W6cVJsjXtdbK+h7i5k4CSM5kWVq/8YG69ZCBJyGW
	 kU+EqLTO498unsCekN2JEwObRfiOtX5Bi3fxvrD7xepSN6XABP5ZN+YZL7fd/DNRcTNgx
	 cz3UOWMWRbxfhzBU21Y1oJa5v894rgbhxDHXlpQiRHqSxeqVq6CDHE+INvcaPYyC2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KpEX2f//";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0916606A32C
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpEX2f//
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DCB1F000C1;
	Wed,  4 Nov 2026 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797433;
	bh=N6Ff+6w3MwGO46SYv7RRn/6WQfUnWjhdTOVWjVM1OxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KpEX2f//leK3UIQzz89hgMUtkAou7rEtcMjqYs9ZXDpDiFzGol6/eGFqTXosH/wqu
	 SGed2bhKi3jvQO+BH9bFbdXDIh1hCa3BLniZ6W21+Jw5yUhzv3T8yRmLjVFtABCM5x
	 wjBHiyklxExKEni0jFv80Zvn62p0plaqPfYa8iLNzecBU3JcrF8lv7haVyKIvAce3p
	 OKLmh5XD8w6x6XoJsH4cuNn98KkSdh511JUyTJBElEO3BHD9ggtt7c6LCq2ijhYmbP
	 0AHnxl4t/e18lbbVaJdj4kHalfvC+G7ucb1KqEoCFtw1V7I7akNjJ7M3M4uEjgkYRe
	 LuI5OsY9Bs7Ow==
Message-ID: <sashiko-outbox-197321@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_uac1_legacy: fix copy_buf lifetime on
 queue handoff and free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104125346.2552742-1-tristmd@gmail.com>
References: <20261104125346.2552742-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:03:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Tristan Madani <tristan@talencesecurity.com>
>=20
> f_audio_free() tears down the f_audio structure without cancelling
> playback_work or releasing audio buffers.  The pending work can access
> the freed structure, and queued audio buffers leak.
>=20
> Additionally, f_audio_set_alt() and f_audio_out_ep_complete() transfer
> copy_buf to play_queue without clearing audio->copy_buf.  When
> playback_work later consumes the buffer from the queue, audio->copy_buf
> becomes a stale reference.
>=20
> Clear audio->copy_buf when its buffer is queued to play_queue, so the
> pointer reliably reflects ownership.  In f_audio_free(), cancel
> playback_work, drain the play_queue, and free copy_buf when it was not
> queued.  Use IS_ERR_OR_NULL for the copy_buf check because
> f_audio_buffer_alloc() returns ERR_PTR on failure and f_audio_set_alt()
> stores the result directly in audio->copy_buf.
>=20
> Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104125346.2552=
742-1-tristmd@gmail.com?part=3D1

