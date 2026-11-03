Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689133;
	b=wdyzGDQ339GunOumgbvwA75K18uTYLmX6OQXakKXtyB9/z3223tlrMpAI40OwtN7xEU+
	 DUMOPfwJM80nmeRrD8L13K1U6mPStC6+mcQyAK8cZuh5MhuBK5DM36W+DldxQycz8i0/j
	 zMmv4iWQkk9s2T+Iapj1SZLvlk95WiyNZZRTVbV++k7SKFmN00eJSGk3r1axgefnmvSTA
	 bBDGLibIzgU+me1aMjnpBZ8Wi3xh7UZo27KXysxXvMdO8wdvwKvZu5HZVanKJjV7FkzL/
	 fFc4XkmkaGZX3hlocbi17Ek2xhNO/gqLN+m7kJahMhYmFmhlGr7HDRc5v4Yi7aN5QmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689133;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=frkUfrTz+dno4E94Z/1ahJ2bi7zLVM7UJLG3ag09ZWg=;
	b=nEEdjKeAs9MG8tK8nxQUnjIR0+EIhYhv9oThfJ6AWWypz8SsHwf3f0z2CWA+vk1BuIxe
	 yfOHwX5DcaQ7mHAf1hAce2YiE7SPxgRGIANaMEybYwiizcC7Pcc4eKCVGEJmgaScG+Imi
	 xaiaOjyQMjYknAa4MfeEiVxnu5xmizqob0dTmJLYleIegGtfi+l4ht+oBcJXc7bJqHTc+
	 I8kM5sfk1PAnc1+cOMGFpJYgyFSiWuKWbzJkPi8F3nIinsUQTAqDmGunRblyIkn1WPu/h
	 h6F2swxBtaTkREJInMDTEdcwW7RhcDnwo7D7k6IZHARQmcQf0SSW8nEURIz+rxFjBmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBQe9pXb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0EB606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBQe9pXb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D031F000C1;
	Tue,  3 Nov 2026 06:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793689132;
	bh=frkUfrTz+dno4E94Z/1ahJ2bi7zLVM7UJLG3ag09ZWg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=UBQe9pXbUVZR7sYl1z93Cfbvrvq8I2qXOaT7XEbNlJfODF0LCCstiOqURx4er2m7y
	 uP7rAP8JBbUVrXHxJQvuX/mn5b7AZamgSIyVjrkjZrzWYeamvWJezuQMVDewE8l9Y3
	 83sfN1OmJHsKniThR/Xm2aXFWsYLEtdSBuVcbwMiCIslQxv3mt+OohimHKGhmNuWmh
	 PgIxRCeb7jOML/bMz3uCCSPCqodaEThWIttkmWfNZuFIq04nRCZAQTvTYEt4ZcKrgm
	 Dm3NEurgbek37kPkRnaG0/n8RITNXZH8mpFZkjtA2ZLgcZzbpz8LR2BWkmsC13E8ej
	 KmwNsIrj0EB6Q==
Message-ID: <sashiko-outbox-194686@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: starfive,jhb100-dwc3: Add
 clock number limit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Minda Chen" <minda.chen@starfivetech.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261103064836.71059-3-minda.chen@starfivetech.com>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-3-minda.chen@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:58:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> StarFive JHB100 device controller do not connect with PHY
> but connect with digital adapter module. So it do not
> contain core reference clock. So the minimal clock number is 2
> (glue layer main enable clock and dwc3 core bus clk). So Add
> minItem 2 to clock and clock-names items.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103064836.7105=
9-1-minda.chen@starfivetech.com?part=3D2

