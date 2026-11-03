Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736323;
	b=JZeH7IGxD4vuY8rV+jowjVtrAboyp0NvmhYHOkQ5/BGU4giUsPAolT7rbiBLiojw9Y/h
	 WoL8T7rfz8bm1ryh6JdDmjsq2REi0ENJuY/f7btOMGBQzxsGw60TcZIlScO1agh1g8Qf/
	 b3X6XZ6Xdru0qH2bY7A++o6iKtblhb4EMdrYXhg1tEehnm5U/L3E+YpDhCQpaA+xuiAIB
	 +Moxy2GHJaChee0eI9k2mUwcY9Vt0WghDaX09DyT4BWt1NlpXrONLnrbATSKT9PTBAAS/
	 PED+GFNkpecc7eGqa6EJ7T/nvXdBxOPZ8n+WM/YfZEcLfA3uaHU9QDD2ri1mteOVqZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736323;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=87/AhXvYtfJc1LhnLREwq+v7UFsHoRvfJu7m+iyFutM=;
	b=i612MePd4AyGjrqAlrWatDH6hko53PEX8MYdaMUoMSmZPnvxSPvxghyt/rlaxZdBPqrI
	 XUZTxMgUg2rq+6HT1KmEBeVUO4RdUA5irqOnmFWj/grArMDXiI+C0eBQRI0fqfAtkLGTt
	 dpnykjmUmAz9saJawW4FHSOvEZ/MkwWJxtEKG2id67PHcIQ3vjmOAduboluYodhs39J/j
	 0SAvVuPvyrluYOdOkJ1zt0QRqrNt6m0NP8WkKZVU20wvegyWcKjzTKQWJzE9U5PwglBcf
	 gyyhXBH+JA9XQjtJWIJlIP7oqSP9srabVdgL9zW9l7DvLJbEEAPQX5UPI3jPAhP3mew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MVQFdBgg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C3606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MVQFdBgg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB76F1F000C1;
	Tue,  3 Nov 2026 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736323;
	bh=87/AhXvYtfJc1LhnLREwq+v7UFsHoRvfJu7m+iyFutM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MVQFdBgglRTQHFsoY8QNLM3OaW5VokqnnoM/bY8FiK3wyqM4XmqUzc/xvCPIONJk6
	 eqHKG4LsTvzloehiGk3nV8XN1Dx5XDv/WWO3dpqej67awY0aTdPBOyIMjutodFWJN6
	 98yaDbgjsrLCFotUJjp7pQAFMlNx9jYcDqnvSMAPWkMM0cRJYT6+H0QWFTx2GBNppu
	 StMtUh8L3+6dDPSw2VXR7yCukGJnJ0HmJwww9RG1DM+xw6estLerKaIS1IBqJksJ5R
	 EOp/5DvVu5vLU8g0CT3upYioDXX6prJ69H+DDeYDYXIv1nFPB77V4eqkS5wlrY5cyv
	 lgTmCPXJbGrew==
Message-ID: <sashiko-outbox-195956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: microchip,usb251xb: add
 battery-charging-enable property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jhon Wilker Rodrigues Aquino" <jhonwilker0112@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103200154.125681-2-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-2-jhonwilker0112@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:05:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
>=20
> Describe the battery-charging-enable property as a list of downstream por=
ts in the USB251x device tree binding.
>=20
> Add an example that enables charging on ports 1 and 2.
>=20
> Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103200154.1256=
81-1-jhonwilker0112@gmail.com?part=3D1

