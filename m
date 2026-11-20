Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193606;
	b=E7nVZ0oRBBsh0JsU7qRNuLxIODyZ024ZQqoT5PuUx/i9wUmhLp6iRNl4ncbHkaiC1PUR
	 VJi4D6KKM8DH3z5ixxgeYJ2s5JrkkUvaxIfNDFMdS3AW3/8qYU/5ihLca43QwvGb/cj9z
	 vnQkGrv+uqgiTxuaGlc8CDe1cCiYFrWjK1p7aX6aoNFGGhLMdqco/sfBjDMw//5KX/vL1
	 uEQ0j/5uy8iKsMqJRbNgu3eJPSkBNcwWEQbVXH7Yu9dSmWK+U4rcZ4xsidYouniuioPfv
	 uWoQ+46iQgl0Hh6CjxISFKKW2GhCJg9VRFiV47tCKvkCUzPb7LdZTPBopd7k0qKzo9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193606;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N0tuAFUqfV77SMVqDIqozZ6PwqQQKkLbezqJevHyZBU=;
	b=YPInXTza4k7ofOgk4xQqz2vk1nciXuBQwMzs5kagWEQkkKfcHOv3VOhbhjag3bugtpgO
	 3NJ9cXHINKerD7UYmyQn0oMeGWOr4i76+YcOsbDPLIFl2VU9YGGUeh+5A5FBVztXw8Vyj
	 88D0QHNBLQT+otF6t8HkWzFU8DyRfNN82Po6zAVEOoPiXGG1e7AtIkoI8RcitOZ56bF4o
	 aNFrt1W+w7YRMAHTnZYKUbzYccRoBrHPOgnkvP94YXOAGJhOKGtTCaxsIt5TDMv83Hm/s
	 ZNPgIP3CaBrhD9YgwhJlqE3n0z6JAYFjH9l0DNawVgRmrJyZ/GcqptsAJidYlcRzRRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRTzQbEL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F6606A337
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRTzQbEL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652DD1F000CA;
	Fri, 20 Nov 2026 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193605;
	bh=N0tuAFUqfV77SMVqDIqozZ6PwqQQKkLbezqJevHyZBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bRTzQbEL1SW/NDwBPtXdLHB7tIP3axtgLLSa3J6Y0asaZbbaJWnQNdqGmBCwk8BY6
	 4b484fYYXkFs7lISK/jfoz9wcsaxh2o+N7V07RIUP5qbtm3WFrSyCPWozACM+bI0P/
	 8esxgo1etVNonc7W/Ppgzz5rSO/z/P5kFVSbRJX4N4D3jltIGkMJ5/uz8rA6gph799
	 GYhk22yFaT3UGczZAz/3DAowsgAWlhs+Ev1nZASOqKfi7OJocb2ag3tipXeC3RClQ6
	 GzJZg3iIsf9Q28s+pjX/BlEHjjXl3y5ApXlivTU8ia2tOniC5YdmrhxpfavL6oYZ84
	 7123eqjag++Hg==
Message-ID: <sashiko-outbox-225604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: log invalid UCSI version of 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Blake Alexander" <contact@blakejalexander.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-log-ucsi-firmware-quirk-v2-1-bb9aebf0b308@blakejalexander.com>
References: <20261120-log-ucsi-firmware-quirk-v2-1-bb9aebf0b308@blakejalexander.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:53:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Blake Alexander <contact@blakejalexander.com>
>=20
> Some devices ship bugged firmware which sets the version of the UCSI
> mailbox to zero. In such cases the ucsi_register() will return -ENODEV
> and the driver will silently fail to bind. There is otherwise no
> indication as to the cause of the probe failure.
>=20
> While existing (and future) machine-specific workarounds may resolve
> this issue by assuming a known-good UCSI version, future devices or
> older firmware revisions with this issue will still silently fail.
> Both users and developers will benefit from a clear diagnostic message
> when troubleshooting this particular bug.
>=20
> Add a dev_err() log message when a UCSI version of 0 is reported during
> ucsi_register() hinting towards a potential firmware bug.
>=20
> Signed-off-by: Blake Alexander <contact@blakejalexander.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-log-ucsi-f=
irmware-quirk-v2-1-bb9aebf0b308@blakejalexander.com?part=3D1

