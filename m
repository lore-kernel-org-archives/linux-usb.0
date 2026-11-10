Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293102;
	b=0Mvy+SK26pVg7xK7a5vEg94itsdUooUQcRzWqV3JEruFBls3ynbNaCR8a5vgbKgGWB5/
	 YKd7wk6CYRA3sqUeGog2amwsCHJtSPgmDWeyYWMWqCW9XfnkhqjTWrYLdvY5Px21+v7sC
	 TsneGxEPR4oL3Zqy19wW4UUFma/c/tKXT6P8hx+f2Vyt5IYtp5iydr919mmGIl5L4Iq2K
	 A90xC71xpvALvnDnd+H+IG0esoaAIF0UNMHVh2tIa54vjtAp+qS2ktMXpCHpMU/o+mdoP
	 LygqvFztXZ9+RbrhXi6Npl89O/57hoZ+YHe42obDDVj1nUPusmBRwpNCQIkKbCCpJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293102;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YuO985nSaaJLHAAYPoGlcKXMh9PR7UjvA94NdcFLt08=;
	b=1PpvntfdWLWeaeYCwm/6I1EhsieVsRwnuioViiH+T6jy9iWmr8Pg2Bkb9VB4oCDZTC3u
	 XtZJ3gqXOhK3ZuVHi0BnReFJAwEYoZVCa/QoSSpVgaubDwbEP3eEdbirL7ro9vxYzxCh1
	 tHrHFnJAiZj4Vk+oQfdm1gmYHxWtzikQlg5YPjgGYSoH/WlZIukd3MQDgIPjCA6IbVUu2
	 01aPm/E12gNJTfa3S4QDEjraUvXSYbbcehaPCf3L5i7H72yKIf3poE2Rmc5G9MOyuACaG
	 LmvVDFoFFrL+/EYyRQzT2nXL3dzAc0+eBHzRFD+grg7lCrCAAXfv+srYbuD20bncQeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijwomB8O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C147606BD69
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijwomB8O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7381F008A2;
	Tue, 10 Nov 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293102;
	bh=YuO985nSaaJLHAAYPoGlcKXMh9PR7UjvA94NdcFLt08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijwomB8OBVKV0rfuhes1CDaB/WTbRuH4yDFBmHa8mnB+VDkRKfAg0kqfmsrE1836x
	 Gl4LJvB9A1J1bAjT6PrNbp4V2S1+L3MNC4N1ROe8IOh3gMNgRrhUoV06qXyA516ypu
	 25nfamxJmwpHKJqEPrgrw41g+JmaSKE54j4IXCk3NaWlj1qVfNKRJiC+INSPNI1W9Z
	 s9b6WJJSGrk9het1yTpOcOY4T3xxtP8zyUkuGseHg2pMPVKdnIQKtaWwPtbNEBo/v8
	 KkQzn+nSfEaWPaTrdtU0YyJBwG9HZwIdzoiBwq9caY5vsM+bTKhOzgboubPVfCj0st
	 QY29viUzQM4ig==
Message-ID: <sashiko-outbox-206441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/22] usb: renesas_usbhs: fix a few spelling mistakes
 in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-18-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-18-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:45:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D17

