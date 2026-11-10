Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307678;
	b=ZNFBhIuoDjwR8MRnoLKMr7b4sNY7AMI5MAO272RRODkMnVXRO5z4nIpdYQM+zpUZEI2/
	 H6hl1WPw9Qq9PdAE5hQAleA4B1tg3jMdvYzbtlTjcJYBW9/h+7iDOhEoXGr0wgKJQnHFJ
	 hVQrXLDkR3KQXy9oku+7yLvEM8H9kqMo4K1Pj2AB6Ce5sR5DZuLsHQ7zUNgBHCeoFsjYZ
	 DWBjp0wbbahrqs55u4teZfl6AVFx9tTjH4danlJc7e7MvQRjXp8rGd0cn2QcmT3R5gBZG
	 6elbszXo4GaioDEy8bWyyEs6k8Y5wm+BeFBEKK541Mhey/FtyL4AA5paYdNY1qkO0lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cwqqtGKSObQo6sioE4MYMB0xb22rxzndsyyujOZGXhI=;
	b=mS9pTKQ/s4xVVs19hkCAkSlvMNN79D2r+/Uqm4LkaPs3YxmjfWyz4ii/M40hGLoH747K
	 uN666c71knOwa/bTMbfu0rr/jBF2Fmqr7VGQ4fZSkDFqyQ08gnt9/bQH4anXq+ASNamXl
	 XNpg0e/x9URvB/Gk+q20/q2GFO6G8kbZtpmclWngidALhJsf26e4xj+gLXKBjlBcN5ZLK
	 aNdS66tejWALi/xDg1FefN7qXz9Uf/7xNYI8TctmEpi7WTR45dUB3qCE/i3NYHMLCnUH4
	 UMxyc/6nqDm9DmIdgC4gxo71ImxhBEuqZUwEckr0uZLT4hieXP+uMx+iEsyv35obHfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WMg/Zty+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96153606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMg/Zty+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3B21F008A2;
	Tue, 10 Nov 2026 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307678;
	bh=cwqqtGKSObQo6sioE4MYMB0xb22rxzndsyyujOZGXhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMg/Zty+j40Jcs95fxlCD2KQPg/W9sz45VyjnlMo/MljhrZKj8pPspTUH9wMqI/jh
	 zINMZRomEYhH8DDzxvzlr/YXD3Eip+4157FNybDSmzAepSZvuLZTLmKUCSjXNxE0Ml
	 rnKFNL20/05nIzyxUUTvDA+X2luFLlWyP2f68UbykBo1sQZoj3Li9szXWYha5F9DIw
	 gpsOTXq+D0/CUTRxWjDU1rxK433jYz7ElTZ8P7qu1HNt0+u9cocSnpoV0kSRo/xMBI
	 SMs9mB7Azo/43ATrbHS98HIyknaKEw4NiQfWCPiVHFtDHJj/JdFrtHZJlF4g96wj9Q
	 Re7QN6gJVtK3w==
Message-ID: <sashiko-outbox-206888@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Mark the Orange Pi 5/5B
 Type-C port self-powered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-tcpm-attach-reboot-v1-3-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
 <20261110-tcpm-attach-reboot-v1-3-7657cc1e2dca@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:47:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The board is powered from its separate power-only USB-C input. The
> FUSB302 port's VBUS comes from vcc5v0_sys through a load switch, so the
> board never runs from this port's VBUS.
>=20
> Without self-powered, tcpm keeps Rp on CC during PORT_RESET (error
> recovery), because opening CC on a port-powered device would remove its
> own supply. With self-powered, the port opens CC for tErrorRecovery
> whenever it resets, including at boot. A partner left in a stale state
> by a warm reboot then sees a real detach.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-tcpm-attac=
h-reboot-v1-0-7657cc1e2dca@gmail.com?part=3D3

