Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535810;
	b=ZzwdG6OYhMxV5X0x1Drrw7R3N/5CbuERVafvfNnaHcMbesg1lc1qCGxiNKYCHdN703x1
	 oawRBXE02906IETTpLIcaiUy0XSjfFZUm8D6K/A8WqufxopSHaRWwp2XmNywyeSODqVAW
	 vmNk3x3JItVCQwtNwtF7G38DPqzOwKjSgM+OGE/yYNohZYIKw7pFXbPMJ5rBWQMAaQeg7
	 ehm2kaUrBiP9+dum0GyoMAiHYj8Qxn5NPt6tZG0FixZmoNnFHF3Su2oNDzgRcLD4Zz5V6
	 2dk1Mgs7p/QOScXKcWJaYeb8eHAcSyKb3ByWUCpGMK/ppGGqN1/Lc6qn6z4H8746IjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535810;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f7nnrAS2dyQuRQVNl+CF71OnW3l4TVhPwk9bGvlLqO8=;
	b=EXRDWFAS65/IFh4eK+FiLuTNarwAu3CVUnRKYCiKqp4GczIz5A2A7yPMp39uAivTSMPU
	 btVTgYzHZYPyBdnNFxHFGHDDDIVg4fkYrXYL0OgThcMBIxFcJm9VJgvFrrQGLQ4ZMRxeS
	 0yNeEiPJdopUdwiZjDvwZQYO9HihBP1YMZA8j1dl62dvH/pFrJD3QHB+ZozdnXxJc8wnI
	 w7Js38yZxLB0U914FeH49lDxAtEPLoMfh15M0j55RIC+B6C478DOGW4fOxhqYZ4YKRxWj
	 8DogVwrOS2mKF2c0eG3ZRRoO+Ol/elMe6FadmakZEWWnKfaqTeojvYLaMfRYy72JlVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEAxasDx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1F606A31D
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 22:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jEAxasDx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F108A1F000CA;
	Tue, 20 Oct 2026 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792535810;
	bh=f7nnrAS2dyQuRQVNl+CF71OnW3l4TVhPwk9bGvlLqO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jEAxasDxqjmfsBAcLuZQzH+RS7B3uXKoWYXu0cpgjGpuTJUxGI536lHazYgGGT+BS
	 1h0kDU32OBsDfC59kUnh2V/10eOdYaTBu4yD/JYuet/s8yDDe9TS4C5bapK5uxryRi
	 e4TQygoe84XIAbMIG9uIHvQ59icLJHzRC1bMzBmhIg3uPYXux1t5lnA/9hipdVk50E
	 rPCLziGDKDfEls8rms5qRFf8ofqk2jqHFy+vJLavvSJxpD3yFnJwPaP0S+Aq1T77J7
	 aa04hNu/fPE2nrOPWrYKcTR1W9OUdsHFE18wYUnxO29wzPHCBitn4slQEGhu7j17D+
	 i0DeejE7Ro8xg==
Message-ID: <sashiko-outbox-179552@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4] net: usb: lan78xx: avoid NULL PHY dereference in
 WoL setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashant Sengar" <prashantsengar25031@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020201537.2465655-1-prashantsengar25031@gmail.com>
References: <20261020201537.2465655-1-prashantsengar25031@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 22:36:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> LAN7801 supports fixed-link configurations without an attached PHY.
> However, lan78xx_set_wol() unconditionally passes netdev->phydev
> to phy_ethtool_set_wol(), causing a NULL pointer dereference when
> a userspace WoL request reaches this path.
>=20
> Report no WoL capabilities when no PHY is attached, and return
> -EOPNOTSUPP from lan78xx_set_wol() before modifying the wakeup
> configuration. Keep the existing phylib WoL handling for devices
> with an attached PHY.
>=20
> The issue was reproduced using USB Raw Gadget and dummy_hcd in QEMU.
> An ETHTOOL_SWOL ioctl triggered a kernel Oops with the original
> driver. With this change, the PHY-less configuration no longer
> advertises unsupported WoL operations, avoiding the crash.
>=20
> Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
> Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020201537.2465=
655-1-prashantsengar25031@gmail.com?part=3D1

