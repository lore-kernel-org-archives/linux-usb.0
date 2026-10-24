Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792864628;
	b=tkDbDbYF2YJHkgddUwK20zTU6yf0an1s1uYkuLED0tkijYLE8nPqk2S4csyAAN/a/1Mm
	 ftiBUxco+oVM1NQrIMy+Zil4NW7Oz+fXBnAiCShkAqxr/mAt/N4lt/JOQIByQTjwktwrr
	 AMsVVGdSN1+WXgxHnjYa77xbKmPDW7d8igiKR8V1RORqjAW3NGtkkjyWq6FtQGNjkEKNp
	 +SQLNkouQOWEK89gXTROg5pSjogT6eeYVjJbaT17kLjX7czN4wKMwfAkzHog8QS3npBgW
	 8mmVbskO+t91KeC7PJqM60JBfgY9grOhf26GlOLv8ppmyum4Y7cu2CqL7o3dev9RUdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792864628;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eOAAQAnwbia752Ayx9SiHJ+BSnWwktaLKWmQrXlVi6g=;
	b=3rwYPA5xcj5s//8oq41M5YRGyu31C2bCMNz6yyJsAgn4zaj8sNkxWJHLYldl3/Zd0u/m
	 v/ft3vS62SiNHjomjIXexTVEGnIC29lhDx9YcC7pzO2r/Q3DkMcWWo1k+tts5i8DFKfWC
	 VSpgYcNGi9g9EDckJTZzIzuCQtKiqFqbbkkFKEs/i4HP+9z8XWg9IvqlBlbD2dBB9+riS
	 /Ly8PRP8HmwTnWrQbPCvENWe8YniJaBTcTQk6fCcJ5iUgPPT1JorRp587lRmnN24FEiDW
	 QVywLbyn3rDCPq4brc81+eXZzqcXH6OU5zNMALOMRdoeH3YNcpFLL/BMlXRiU0jhd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFSpIBfX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE2606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MFSpIBfX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EC71F01825;
	Sat, 24 Oct 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792864627;
	bh=eOAAQAnwbia752Ayx9SiHJ+BSnWwktaLKWmQrXlVi6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MFSpIBfXNMdeCUBrOL3dxi9EG155eQya9xkuUhw0MeKQlXxbtNU2r99AaTNDPB1jw
	 L5gPJ9TWMX/znc/5HyU5kVZByNE/5ez2p19Jy07r9iy73HRXTGT+ewbcrs0bXFquXm
	 VSMZUz7a/KQ6FSPVM/yBmtxkG1PsVWBQjkc65hvqk3k1TWWkDReqIQW3TSNrQQxz6b
	 aPVt7EBnHSo5SjRS4fmZaEYZcu5ypKlW1PoE13B5/SgLW80DL7szNY3abqHnP4Mce5
	 XfwjIAktDLQ4Ee19Sp7BUybsudOWapUpyX3FOD9q5xHPDaSDhhMMf+G7QzkOYFgA/K
	 l4zngZ6OvSI/Q==
Message-ID: <sashiko-outbox-183831@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: debugfs: Fix GET commands on UCSI <
 2.0
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxpIEFobWV0IE1lbWnFnw==?= <aliamemis@disroot.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024174441.878903-1-aliamemis@disroot.org>
References: <20261024174441.878903-1-aliamemis@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 17:57:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Since the debugfs response buffer grew to 24 bytes, every GET command
> fails with -EINVAL on UCSI < 2.0, where the data length is limited to 16
> bytes. Clamp the length to UCSI_MAX_DATA_LENGTH().
>=20
> Fixes: d9dc19910321 ("usb: typec: ucsi: Fix debugfs response truncation b=
eyond 16 bytes")
> Signed-off-by: Ali Ahmet Memi=C5=9F <aliamemis@disroot.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024174441.8789=
03-1-aliamemis@disroot.org?part=3D1

