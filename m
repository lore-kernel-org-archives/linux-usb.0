Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248877;
	b=vCFtsny82JtGZiaIqTf8Lk07Sw/SlvdefF3yv7Kiaaj2Pi8q2p3gYvTJer/J43+VYAxr
	 rTuwD39cO3EuyN5/BTowJMjNy7GbmDNzGcd/5onJdR1eTvrYCShQIaWZu2HbS7g5bd+2q
	 5BIe20osFZDn6kWODJMGhn1Z7UI41VieV/bs9WWZjbgGBNZZe04I/hUCtOqmRLMiy0E+Q
	 H+gCY68om7NCrizFLf2tJwvfdiDX70+N8a0/OQeFPUMmXt0mK5iEm+Wk/Wn0ZfxqD0ykw
	 9Qt88V45BvNTtP6fs0XqlBs/L+jsovQJUBdbRW8OVM3dg142udh0n+GlfnW0r6cLI1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ppp+j4bWE++ktDk9abQlYiWwf13MGLjvz/pshquiZpo=;
	b=AeOTZqoLgXhmCQ0q0DvytWdjSa+/0TgFF63y3nQwUv2k+/FWAhF5KdS/OxxsoFdDdXp0
	 SzfW2icn2fFcQyrq1O1XmbUYV+KNLq15+RVTHWeXa4gdhlMR2aw/9x8Rwhq8LZhJ4gfWg
	 lOk08RfR2MxunAeBWxoaSHIRi6p8Ob4K/nkWgyK+TKFY711dpwfHiAKmiRs+3itSScrgy
	 aBNhBPOKtz5mOr64Kh/lyXTn5ev3FEp3OoMgwTWs/1BXmwL192pDYbn6b0eFQMQudq2BR
	 yrZjPDAzCDEbb8E0zxahxUGb06J/1jvUEJ70Pp/DI6CRgDbC5e0arJnLXbz2GgCF26w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n/w2zClL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1EA606CC59
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n/w2zClL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9491F00806;
	Mon,  9 Nov 2026 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248877;
	bh=Ppp+j4bWE++ktDk9abQlYiWwf13MGLjvz/pshquiZpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n/w2zClL1nzthM9rHSp9S0t3UqOcrN2+xNgvxedlJ4XaDROe4e7VXehR2XLvEzjTt
	 giAmTRPd1MHjRoaN7G5mf5nK59+OUt/tMrCs5YlBunWhn9N7UHdB02N+aR9HKLEPMW
	 FnhjFALGLFlKauxkEZRcK+3qNwKnK+AvnMj2359PJIIv7UW0kpdL8vY5SYw5P1IbL2
	 beIkKaxa9aj3QbFtOw7sk+uTnXRANQFZI/LuTuOUrphTGR3brSH/xbgccvedZh4/1B
	 VOo4t0zFhHweQl50a/K3ST6Nl9jeQ6ZC84m9fKBSDqvrVabvL6cdRoN5KMUSqfAmUZ
	 fxZ9AsnSyuKMw==
Message-ID: <sashiko-outbox-205411@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: ulpi: warn when a PHY with no DT node cannot be
 read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Ellis" <brianellis@gotenna.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-ulpi-warn-unidentified-phy-v1-1-64537f455dd8@gotenna.com>
References: <20261109-ulpi-warn-unidentified-phy-v1-1-64537f455dd8@gotenna.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 18:27:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Brian Ellis <brianellis@gotenna.com>
>=20
> ulpi_read_id() checks that the PHY's registers can be reached by writing
> ULPI_SCRATCH and reading it back.  If the write fails or the value does
> not come back, it falls back to OF matching and returns success, with
> nothing logged and ulpi->id left at 0000:0000.
>=20
> Commit ef6a7bcfb01c ("usb: ulpi: Support device discovery via DT") added
> that fallback for PHYs described in DT, which may not be powered yet when
> the ID is read.  For a PHY with no DT node it does nothing:
> of_request_module() returns -ENODEV for a NULL node, and ulpi_match() can
> only match a zero vendor ID through OF.  The PHY is never identified and
> nothing says why, so code that keys off ulpi->id, such as dwc3's USB3340
> detection, silently does not apply.
>=20
> [ ... ]
> Warn when register access fails and there is no DT node to fall back on.
> PHYs described in DT, and PHYs whose registers work but report no vendor
> ID, stay silent as before.
>=20
> Signed-off-by: Brian Ellis <brianellis@gotenna.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ulpi-warn-=
unidentified-phy-v1-1-64537f455dd8@gotenna.com?part=3D1

