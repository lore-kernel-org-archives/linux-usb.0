Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795149570;
	b=o2X9bMl8gT34Ztp6clBOZ4+rtvpNMfZbBrCcnVnyeVmVQ1/oy91EXDUJ++R4K7bpeP1t
	 qaBecpweQS/Ny0JDuq19RlGPwGO+AnuyHMG5iTXE4NNv8FgL+RGtw08ge7U1BV1RqDkDP
	 1yA5gIgnIejG3vHqPg1FUl257uPApPxHltYTNngarVrCvrCWZDrKiF92h2cJze3GY97zG
	 89CCxSOqk8bLGxoghqG5VyURh/Ku0GWaZmwWeUVjo0JxKdIiVSYNWdSLx4ay6+Q8kgl/+
	 05H2//KJ1O4UPa1H3WEt2SQ5Dc6uKew1SzmCZ7+mf4jSzqJTADOI75Zb6HABJu7VyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795149570;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C/JkEMKJDhjUxGHA8gGbzHRC6r3cHTJdAMKreyzysJY=;
	b=PU5ly9vwvSYn/fE0jh0fKjs85+tzzhPrJiwp8v8JiFobdDsx9VK0uTVoB84bJL+bG2M8
	 9wAFlaj9r7UkjduNP65XcSOhymKEBwuuN8nT4vJb8eXxuq8JKeOvuoSkaJmHEelEKNysY
	 s4L28MjwZA3RJ4wBvCSkV/WWW7Mh6GWY+6OIS6ekFUZ7hZyuDgsqbTD/40IA7g3ePGYrP
	 7ZZTwDU3Cr9z6Ruh43OQytr7tza8PQepOMRfUhv2ZSpKgcI+6nemNwh2TfdhwwedahlH0
	 +iZF10kSWG4ptD2OVUi4F3OODGW1MEA3chvc4Rw0mxYAAaB3cPCh6YMmeAmT+Njkdjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF5VZq+h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35082606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 04:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF5VZq+h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ED61F000C4;
	Fri, 20 Nov 2026 04:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795149569;
	bh=C/JkEMKJDhjUxGHA8gGbzHRC6r3cHTJdAMKreyzysJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VF5VZq+hAMat2UoeSnz5aV5lH4fdHi7PmFiK6P5y2f5X4/6JIjIs+quEWk0JXkHW+
	 nvWJyho3ZBU6FeEEdMNHcGhvOt3GITCMIoW/ENck3GYXJUu8FAIvxRix67MbEqCE7f
	 4K8r0u0Ua5hfucI30y8zOxTzEcGWUOj+XiTDJXQclLVBIVNVrJ3+f67rnWz0yCk6gj
	 0Y7X4t4Ox9P23t6vzMZazUu5MTinAQmqN4YYST28HS+ts0NpKvhST8JicpskfsUv/y
	 +TXhZ03Pxa4CZ/6t/iE+UWHralq9rnl9iwYIucGM6cCrIJNhQLSepLtWOuh3Dgfm5V
	 rhHh4kU5LJNLQ==
Message-ID: <sashiko-outbox-224466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3] thunderbolt: cancel the queued control requests
 on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120042721.420468-1-shunsheng1218@gmail.com>
References: <20261119111907.3616041-1-shunsheng1218@gmail.com>
 <20261120042721.420468-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 04:39:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> tb_domain_remove() stops the control channel but nothing cancels the
> requests still in its queue.  Their completion work is already scheduled
> and the queue itself holds a reference, so tb_ctl_free() releases the
> channel, the rings and the frame pool while that work is still pending.
>=20
> Splice the queue instead, cancel the work and release the callback data
> with -ENOTCONN.  The reference the queue held is taken before the request
> becomes unprotected, so a completion that runs in the meantime cannot
> free it under the loop.
>=20
> The terminal state is published once.  A request can be canceled by its
> owner after a timeout and by the teardown at the same time, so the error
> and the cancellation hook run under one small lock, and only for a request
> whose completion work has not finished: both callers reach this after
> cancel_work_sync(), so a request whose callback already ran keeps the
> [ ... ]
> well: a failing driver_ready() or start() leaves requests behind and that
> domain is released without tb_domain_remove().
>=20
> Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reli=
able")
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120042721.4204=
68-1-shunsheng1218@gmail.com?part=3D1

