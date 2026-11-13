Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591677;
	b=eFWiYFxQNjEa+bynbnYUJcaEwjwikDvgGNLOoyXPki95fqoYJYk4xwRJsaxf0EuHliAS
	 YFATb4EpE7IC4d+t8jxr6EIK888GzJXcge2QNtDdzakpW2CpdfdNy+6mFTbF9rgqcGS1D
	 u43kt3fwGDaKeiUilqh+MqF7tNpBQJBT6JuGdfqYLdWqNDEtGhf5nbkCYLATN86m9dCkP
	 EIWSqNAiW0XRuNbQYrG2m0zT7rZ8pc0+/HSKVylwojKNxt/PWYXJd+WM/aq0G2EGO7dlH
	 n3SnEi/HRVd9azBhFbFoyfR6Jsqt43f67FLSdxwdfFhmz8Q0PAh83TrQtQGR1nZ4v4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=moupSwQOFm7nFzK8kYp3kFXPJEgkl2hgtqUUUMIwlIY=;
	b=kRggnQ/lE4+xOnkdK5WEJueBlEwB0SN2zIcoJqM54K8zxV0sGdPMZ4bW961YJzmIe+Wx
	 0pxHFSdd0EN2bdUgv7iYdkEYmRxGDiOJ1WCOvkSx2OXKbQKbPyG4MvcGc/nzUdwr5Z/c9
	 rBl0HjDAOkoJIjdTc9qhiBkyewWa3yeP8wmVqRW6G9NgyDctqo38mC5lWMYf1eKC2gZ09
	 V06N4DU8l66NpGgwxudD+fZNNhK27YpBrY7HhUpv4JrRZnPIKNoHCq+oKgfwowfcLvsz4
	 stQRF27uKosfUP83b6nCpxX1zda0vb84/r47pUgx4SQSmlC/f1Va3wH2c5oR67/QM9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASWzFwpC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D99606B474
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASWzFwpC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3287B1F000C4;
	Fri, 13 Nov 2026 17:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591677;
	bh=moupSwQOFm7nFzK8kYp3kFXPJEgkl2hgtqUUUMIwlIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASWzFwpC6xbescvE3WTQYBe+OcH4nTCSM6oR6M4RNi3imo9kBaaP6c0u134B5wlkz
	 YKHy1SuIVNZuXvaiJxWJkAGQBhXFbmNZJNRpQFwx3WqwKJ5ZfZxpISECTM4Ghlw2n4
	 cQmYwfhOFvJp2p6Kxxd0q8glV8Gz1xhwft1kOfp9P0Jdg85TS7H7mCUeHsjxkcDJZR
	 YZP0NvjKniB2pc/30sUppF9FGZmcFoZZ5lNWjrCdhfXAqEQ9dHfkL6CWB43gZeAotZ
	 mruZPyS58BOt+apltz62Tjw7H62EFgaGnL+hR0P0lMlws+gcRVr9YFs/GAxk444LiG
	 /Zem8LryYzAPA==
Message-ID: <sashiko-outbox-213340@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] usb: typec: fusb302: rework gpio_int_n_irq handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-7-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-7-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:41:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Improve the code readability, so that one does not need to jump
> into fusb302_init_irq() to understand that chip->gpio_int_n_irq
> is guranteed to be initialized.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D7

