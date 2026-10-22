Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690599;
	b=C3R+CIp+c/JkyM5z+mDjNgz7T7r/6AoDpFIpfcaL7sAwNNHbfHlpqgHt+vNrWpeKUeYl
	 Bswkt5rW4My5CMi7of20cO1gB2uYv/ZvERM+bdqC9HPnxW6A2lyPGoyJ8udH09x1iwALL
	 ESZoYN0Mndev/x3gfcsr5Z1nm22FpJoixW9jT9/yg7iIUTEtIGOP8r8y+OujcQuqrN7jK
	 AKzTAvV12ab3PDoXb4+OagoL2spSwOvgF+PmOVDbsL+6LwgtTgylGq3Y5ZeBHWLLwcQEK
	 coGk8dzRb0px4I3KKLNwZvClm2hOIW5Q/gokijDhi84mpvv+QdcVQVT19oOBK1zf2QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690599;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lVuGS0nkmcwEtk/vTUmkrCv05ikCzuS3i3OIvIpWUa8=;
	b=bOLaIyGji6EDlok3NIBPA0CSLpRJIBNm6nN2/WqSkiPXpbStob4hiHCAUi3LjpwBLFYl
	 AL/zOsbDt8Hxf9cSK64xANJDF3xP6rYASxPuamlM0oiMXNAzEHKi7/b0hiEMO2HcuZ7Pl
	 cOeJKvKkhp4uQsqMoAqiDRfUs7qRg50QiGLiM7uJKkz1MVWiVG5XFlB6UpfY6VzDmrP3X
	 zQU/nTyiJuoOqqzAEGUX/de/Q3fUMcV9n9Du3K1DZsdYMqjjk6ZyhdDBIP9iGJLAkRzO0
	 TaQ6ogU1vo1SGs1UeNBMgYFT2eAoSFkD7GDM2M8alnF0bvk1H8YBwMGyukDI8bl6e+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KceEuTUo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAF606AB4C
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KceEuTUo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DBF1F031E0;
	Thu, 22 Oct 2026 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792690598;
	bh=lVuGS0nkmcwEtk/vTUmkrCv05ikCzuS3i3OIvIpWUa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KceEuTUo1o8XVgpYf0ki90SYpXNGNyYjD56Rlse4pi5YKrI67Wgv79lz5IHUT7UD7
	 oKnEoNbPkI5y9q/4E+yxuo6QZbctmkLv4eWteY/yRPIId9ftgUHCHa89Rdzo6eDsHX
	 9xwiHYCyKnDj+9VYsnh8Pqhlop4XqmA3JMKDnPr2gstnKs5Fe7Ex78m9fVNrdJVDuI
	 NqekFnHSNFlkCPxGOfVxJMoOsQ0U1JCtN2U1eH7cXUTl8S7xOOOZf41amSUad2nggQ
	 3vfMthBZ8jJSYL1eushflzLcsgNSKTMExvh0/q/iGtTEzn2U3nUL0LEMLdm0YFQ0mU
	 yq324Y+0TiS2Q==
Message-ID: <sashiko-outbox-181864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/4] usb: typec: ucsi: glink: Wake up the system on
 connector changes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022164151.592-4-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
 <20261022164151.592-4-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 17:36:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The UCSI notifications from PMIC GLINK report connector changes, a USB
> cable being plugged in or out for one, and the completion of UCSI
> commands. Enable wakeup on the device, so that pmic_glink reports them
> as wakeup events: a cable change brings the system out of
> suspend-to-idle and aborts a suspend in progress.
>=20
> The completion of a command arrives only while the command is in
> flight, so it can wake up the system only when a suspend has started
> in the middle of one.
>=20
> The same was proposed in [1], with the wakeup event reported from the
> callback. pmic_glink reports it now, also for the notifications that
> it holds back over system sleep.
>=20
> Link: https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee5=
6df24@oss.qualcomm.com/ [1]
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164151.592-=
1-tvlad744@gmail.com?part=3D3

