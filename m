Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212346;
	b=3s4XmQXMv+Hc6J/CLsqIKHUyMV+t66kI8Ybsy/fQrJNmJhR+4zJkbX+BzHJSMTSZSnQD
	 oFJt1wyP/TE50XaavkyEKlje7kjBjy4PpcnIGDAPeN8ZoGR1CvstfziogXDI8+f/knL74
	 84HjA0eq/g/kq0pIvm2y19Re104gABq1JaYmanmIvKYpR0OXb+fiGoYOV70pDrYL8sBoI
	 5c7YLpoH4gR8wSZHToIQXYzlDSj+oFybcSDHOemzNgY1Ay44AU6UMdQ467bGZNW59qTkF
	 BV3zSqQKh6gpr1P+TB6DTZgLVnIMUM1qAur6LPl6RMh6REBkBBxjIr/bGVJbhSdwn3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212346;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pt2wOsWIVOHzG6Eb70raZV3XxUlWI9bYNhCNH9cc/10=;
	b=y+KWVPoFhrDy5JGyJp/QPPGc4o/6wcPPE4juFMbW5xzKfwqaxvLA9YQbN4sHrt2iO5Yd
	 Ew0GS2gTmJ9W5YVYJESAMlgBugHJaa9H7WmVLVz5bOS2hjNr8MDItx3XNiIr48iJBugHV
	 ruOZO5pN2F1cVQPshoN9VCw+60a0/3lE1HcliTUT9CnUw2B4NH+ZL4SvqFk3RGoqtxB5B
	 Bj4+0isUGRo3nAOZhSeLJw8+eeq5yARd09hQgBPlMXMs6kVGDhMc/JtAZcVR2wqJmw7rQ
	 w9MNZZS8mKvSaNicsxBfNGGB+6ih6aHVMFBZgxZ7inBvpo1oyCiREn16EAUK2oDT9SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSWAv4bF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC9606A691
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSWAv4bF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D560A1F0089F;
	Fri, 20 Nov 2026 22:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795212346;
	bh=Pt2wOsWIVOHzG6Eb70raZV3XxUlWI9bYNhCNH9cc/10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fSWAv4bFWZAXFJxAKLhI5kV+9psGw7EX/6LuTvY2ZwFtYb7x74aFFS6pXBMU5KjW9
	 nxkl/eB2KX6mme8U2SBwA+1e0VXSOti/4P7dhAyGJnQSAPV3obqchqeQWuu5O8U4I9
	 gjxuZuEAHLY0wcUvENa8NFay0geb6uhnpEXQ7SGp0C3BjwTkd3bmCrR0UiDWeBrVFq
	 Ii9DJNuBz5T2aAORuMbnYECvSmWZz3TXkg9mHSz1Nr2m450D0/KwgH0Y1mv1eLSm5p
	 8ZuabYcq69xPrpBF4/fhwUYrd1a6XrLgp5lDvtGwTmgjm2Vh8EtGce777v6DCodpEe
	 YfS4YkwYDf7Mw==
Message-ID: <sashiko-outbox-226218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] usb: gadget: f_uac1_legacy: fix copy_buf lifetime on
 queue handoff and free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120215351.64406-1-tristan@talencesecurity.com>
References: <20261120215351.64406-1-tristan@talencesecurity.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:05:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> f_audio_free() tears down the f_audio structure without cancelling
> playback_work or releasing audio buffers.  The pending work can access
> the freed structure, and queued audio buffers leak.
>=20
> Additionally, f_audio_set_alt() and f_audio_out_ep_complete() transfer
> copy_buf to play_queue without clearing audio->copy_buf.  When
> playback_work later consumes the buffer from the queue, audio->copy_buf
> becomes a stale reference.
>=20
> Furthermore, f_audio_buffer_alloc() returns ERR_PTR on failure, and
> f_audio_set_alt() stores that directly in audio->copy_buf, leaving an
> invalid pointer in the struct field.
>=20
> Clear audio->copy_buf to NULL in the alloc error path, and when its
> buffer is queued to play_queue, so the pointer reliably reflects
> ownership.  In f_audio_free(), cancel playback_work, drain the
> play_queue, and free copy_buf when it was not queued.
>=20
> Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120215351.6440=
6-1-tristan@talencesecurity.com?part=3D1
