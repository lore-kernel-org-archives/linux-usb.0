Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591322;
	b=WYMiXoSHUYdUyR1LBw4NmkPKJXG9fxJ5mBEpV//XE/GXbHJT6nx3Nw2pd5LaAZgewMme
	 rJIox77GxK8xYd5XP2mxdxcEfMI7uJ4pLv7MXeCX0EQO3HjMjtglCEo2DC6vHwU5WNuER
	 Zz5bOsFmDIAzoTL//0Faf567bZfOdHYCI4WEMGKNbaforeiMuHD+WcO3ShtIApBe4wWiO
	 4oXKNrMzuVNCwBk8A6Ci30sTMvEGFlMtn50mgKBHAy1E2ZubqkhBbinOz/b/8pqgjfHdX
	 jUyJN6p9PGFI7f9oDv3ZNFLnAnjAJpMJY+nDClIbHDHsSvV+FMTB/8qYt5+r9+av2gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OWJyiDcywiLjv2G5IdSZi/QlxSvvv6h5knyFDsxiUt8=;
	b=vvYtlrbD2k16A/rdAQZOdoemkRNVkJESi2QUlLfuoQciJBE+8RMvPNb4FyKGEQGS88vy
	 HZsddArENEl7SooHD9hxvFVzsuZrLBpQiN9wGTw0RwefaGZkgb9Wt6214emeBb/OcTM9q
	 E/i+dqJU9uIjl6hz4ExJDOZ2q6nB2426s71m1NV8bz+hK26iUT2ZSyTMFF5fURQLRd1Ci
	 HrcpA5n5VpUXn1lsCtXEhHcre1lNE7PzW/RaXIh6va+FNGLCSLqaakYDinNKW8vgrnqQo
	 7tm9OVFkUupuaPre94B0JlL6YSzg1Xl9fKJjFWyyOSP3iS/vS2wg59nJzXGG2tYXCSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgIrl+7c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4051A60776E2
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgIrl+7c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB091F000C5;
	Fri, 13 Nov 2026 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591322;
	bh=OWJyiDcywiLjv2G5IdSZi/QlxSvvv6h5knyFDsxiUt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XgIrl+7cF+QJDJBY3ZcxdFAAbaipVs5IauX26sBOeGic4bCJpdcwnT3Qm9vrgA+OO
	 VKWb8JHSGWbQtnqzBm53gVMS9/yE1x3SxKZNpNs+PsB6xm9Tn+8m5CBiJaCbFt5Nuo
	 HLlCCi5i3T3ijfyDrWI3536dadzhhMPfZi37WJ90we4iNoGKBr0s8ijG8C6BgkQrqR
	 ty3/FZ+XHYP8oXshUv7nedXnduRxQ8Zm8I6pmxO00KdVfU19qn0gPql1iuxE1Qq8wf
	 LSawfRaEao20vrv9MMgJZjzWmTNjBBZO4XtvZwBS1NduBs8SkkY3C2mJy1AR4wphLu
	 LoQwLMVDhIDeA==
Message-ID: <sashiko-outbox-213329@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/8] usb: typec: fusb302: rename init_gpio into
 fusb302_init_irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-5-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-5-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:35:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the fusb302_ prefix to init_gpio, since it is used by all
> the other functions and allows easy figuring out that it is a
> local function.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D5

