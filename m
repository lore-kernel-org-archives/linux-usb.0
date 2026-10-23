Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758485;
	b=ukYkYeuoo4MxIR8V9QRpmG9kmYMJyOUYiuTjG4w/I1e/tz3gZLh1IPtu7aPLdqeY1mr8
	 VsnDAQYHyQy+IxjHMOzbvZwVyfw6dYfF7c5c9yVnj0ONVqWrYMM1jHh8jQoJDDqYh1209
	 FJ7RJ2AgavirRGFjcDOUpwGs9LPqRe1ElqhkQICeG4jMCl6TRWQBaWVwOtJ756UHIZLGA
	 59mE3rZYjbUldxK4GJRVA93pYpH+YH3tSUS93gLIdlX49fe5Qy44+Vj/oWmS68ukRpMck
	 j1hB4kFGY70PH2b4SKfti8kB4sNms+buJVRXFJS8PmVyXQikLK6uO21FL2IKKz76KYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NU7Mmqu7cgar1kdTYBuujc5YaaBAQ5oep4nOqGaZXik=;
	b=eYaafnPKUO/P+vmGDSFhIqxG+g16wR1bvMfU2EAOnkDHVQH0Yg/CoTQ9QYcyvm7KK+Hd
	 3Ef2NGykQ2UPGxeFkOZSlg4T1L/rBjrJl7JwFHPbFzwz/6QAyqMPjdUjNATl1lWEPzSOd
	 mFQmCNfsJSbXHbI8Jw5vvuzSKTTCUrJJ6V4fWTM7o06ZKmx1KvzMuwTxkl5vy9JjCJAfQ
	 JNWJzMsiSKJUGPsBjTVbDeYxm74QXFY7Wwb30usHK7QphqqyTlZJcrJNNyUibu1xV0HAD
	 V9v4sMqYS7U1auu9522pNFnxRV2QgM8RcI+El/MwsxX76JpfSoL8PtEg5f5GcNbIEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTba3fJw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB027606A31E
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dTba3fJw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418981F01825;
	Fri, 23 Oct 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758484;
	bh=NU7Mmqu7cgar1kdTYBuujc5YaaBAQ5oep4nOqGaZXik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dTba3fJwkzcoYPeezbmnh61cq4bikeBZGYwaP9Kuh2ioMGjhZ84at8TQpQ8owkf+G
	 kyUuypl3HBzVAg9qSSVTTqSKmsObxntao2vtTgq3MKLpu+uTI8NLJE5R1lqt6qc+YK
	 gqnSmOqbBX2oPVO39IlEMW3BlQyGny6Tsxx3FKvhyx9sRvzOT3FBiJeaA/zAGzyMYP
	 21kNJLeJzM6qRbDtMLbBmEHutg7IbiHv7gK+Bn3qG1TFznwd1qQ+EZiAxWa9DB4i3d
	 oO6bT4a6bdzcD/7ucmmw/D+Pepz5rfNLcK0nEcb2QDanULVqfYKos1tGIHhs3v/K6a
	 ynaJ8AuZzFXhQ==
Message-ID: <sashiko-outbox-182766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] USB: serial: io_edgeport: move initial termios
 update to open()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-5-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-5-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:28:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Explicitly update the terminal settings on open() instead of doing so
> from the interrupt completion handler when receiving an open command
> response, which in theory can be received after a failed open attempt.
>=20
> Note that this will be used to fix a FIFO corruption issue and also
> allows for switching to synchronous commands.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D4

