Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455914;
	b=IXR9MwaZZ1x9nJPbkQ9mpeBxX+LAKT/CRANkm32mXypwvzbU9KlxaPaEu+8bXnd+txE+
	 MxYyEvcGgN0DAIG9hMmnxg/0yuZ0Xbw9nLehX5t8Xb72IFx98xpfoBND/uhJ/mhRDp/Sd
	 4iGDKQns0c5QHhNNII75Qdrug5PHsthgKRg1xKRfZgqqr6z+KNTMugT62Z0EL2Vx/cxYb
	 J4HA7I0grpVFvt9Tn9bHziGpCsqzN36sTZP032vWqMCmLnY7GnDkSQUYBawtslg/uJTTD
	 pYvVi+I5Ox2FXbKG7gI0dmUCwqP9qZPYCusmmptTCtZsMXaTV53lUi8RGw8hKDOn7VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455914;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TmM07JHsLn73NCkfEzovm7ppPBDy7BFdCj3LkJRi+yc=;
	b=Ufll/JBSWeLVq4H8+swrKIexNQH2u2TzaM+lEjv73SAhbz4K4SGifWWs3CZwpc9atR+d
	 dKw/Arq5nFeTJmDvfRs+KTMhKJ7eOYY388jyw4eJF+eRB1kpEPQzRyDLM+/bye4/Xe++Q
	 yYcyuRAwRsIu6xteJwzuTR9jQ/9rJt3vG0OPUGSS+WwAsBzZFwDe7tYD2pPmB8qHItae6
	 Lv430vIviyZytKF5vzlWG+jJ9kz0HrKxM9ZQD21A3tOm1cAVwsSsK+Wg77m0LfZSwZPC6
	 n0Ep9qvIG55A/tZkYWqvyQ2phyp2veLt3M5n7LNGQU5Rjo5OrD+dLgJtF17Tb55uqRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOSt3Zm3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29780606A327
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOSt3Zm3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF5E1F000C8;
	Tue, 20 Oct 2026 00:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792455914;
	bh=TmM07JHsLn73NCkfEzovm7ppPBDy7BFdCj3LkJRi+yc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOSt3Zm37S20ePMqOYWt+6aNr7wAoiTU6NS774jpv1UFMqg+9JaWGYfQaN+0OCPHp
	 nGpWmmmpTThTyZ8SnqheWaV+hjqN2JdsZLL8AzFAXQsL5CGMwt3Xeyni3dXI/5qGtm
	 UveWO81T/+fN7aEwraVJwIwVJNyABCiozSiZW06ZnpTijEjdh+s/H+PX0srbkQLt0V
	 0kfu42sGf2zT7LAC1PqohOO3wb6mo3LpjIw1YQYpTHJzzC9XIoKkhaqHWQnde3/w2F
	 uLCsqJvitpO9lbbNdfmOpIfv3bDrYXFECHLlhaw2fACzbsGTq2Z5lVfpqGL6M0VfC/
	 f3ZKT4JJOXdYA==
Message-ID: <sashiko-outbox-178381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4 2/2] net: usb: lan78xx: reject short register and
 statistics transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Jie Law" <law.wei.jie@gt.tech.gov.sg>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020001621.2920-3-law.wei.jie@gt.tech.gov.sg>
References: <20261020001621.2920-1-law.wei.jie@gt.tech.gov.sg>
 <20261020001621.2920-3-law.wei.jie@gt.tech.gov.sg>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 00:25:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> lan78xx_read_reg() and lan78xx_read_stats() read from the device into
> a freshly kmalloc()ed buffer, but only treat a negative return value
> from usb_control_msg() as an error. A device that answers with fewer
> bytes than requested leaves part or all of the buffer uninitialized,
> and those bytes are then used as the register value or the counters.
>=20
> Treat a short transfer as -EIO in both helpers. lan78xx_write_reg()
> does not use uninitialized data, since it fills its buffer before the
> transfer, but make it fail on a short transfer as well, so that all the
> register helpers report a partial transfer as an error.
>=20
> The write path validation was suggested by Andrew.
>=20
> Found by code review with LLM assistance and reproduced with an
> emulated USB device (raw-gadget + dummy_hcd).
>=20
> Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 E=
thernet device driver")
> Cc: stable@vger.kernel.org
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Assisted-by: LLM
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020001621.2920=
-1-law.wei.jie@gt.tech.gov.sg?part=3D2

