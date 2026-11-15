Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794719412;
	b=DD+5lKUBlhCrUl8fUAv2P/ye9fjhy7Cl/pVb2rvHVavaNG2dCwAEX3RFJggRt3adyVvT
	 bjBul3gEqL8hqi7PqMFf1s890s9NEetWRK+c8cVpbM1s6FYnMajRoGbQYTsSjp4F+e3jG
	 hMj/AYTqnDg7ktHTuqSkY3uFTGUvKl3vI6849T0BIRGNrdvHvHb9n1uYACVAXekAE2ix0
	 bHajO2w+DXjcNR65ZFnajgAl5RqdfFJ9CjcwFmZm5CR5Gm/O9z3b7Pm/55dM2mgQDVCbx
	 m8Si4GUDJyJ5xEuqCLOFkt9HrmihL2w6LWWYPDuyKZZv7HXmW3NGEDZN58O7jMDFlWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794719412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jjjU7kAuB+sqnUb9RVNV350RLt+GSpObhe4qFVNbq30=;
	b=I0yM4MhL0Ir5lZVZYcoyqRm3GYg6sZgPUMfATzPAfnx0DrcR/CY7bMWIV0ibzgWyrD4E
	 75dFzMiLH+IH/zl9XCVLy2wn8W4Hk0Us73WJX6MPjp/s+82BLKBR5H0ai/+g9uJHX8+O1
	 K2XvwIQyFevPnUlOjLUFNXinPTkSCC14cFZUh+p3KxJfIXDwnFYhCyBIJ0SWp5TM3A29Z
	 YykwdevWT3TjkzKjozGV2NpnA4JsE/WUvvfzvS6TjcoA2tXyx2J/x92+ZljMQEVXrZtkz
	 qknXYYFBcZtMbx7p4ErsS1pIDjHc8nBsACxZbbiVUpGrhgwBBYpRQAHXljKZsCsdXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaGlAiMl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8170A606A32D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaGlAiMl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A9E1F000C5;
	Sun, 15 Nov 2026 05:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794719412;
	bh=jjjU7kAuB+sqnUb9RVNV350RLt+GSpObhe4qFVNbq30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YaGlAiMlZvqwsWCFZp1UBPr/7u/Z+E/gB131S9EIMmAxGd6Lu0qucee9ivrF/tRdP
	 EJ/N3UO1MsdeVW8M4AxANmGk9VRSLIEyA5YeLfB6ASjIIC7J73+Wfe4TULlao63yZz
	 8A07wmsph4z/MMad9YweG72hOK8y7obbnlkcmcfT9+3bxhIQrQ+OPWzGKJo7qf0RZZ
	 jAsiZ6bIMLnF5ezgOU2By3HE8ea3A4E4h/Q3enM011dw+dea18+RAuUuKHeYCJhxu7
	 nKy9lWCioLHlfUT+/O4gndLF+Y1neBtA+PNnkk4siczLUxedL9t6a80t6NHavQQca3
	 0lwpKbKH4b5zw==
Message-ID: <sashiko-outbox-215233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] net: usb: smsc95xx: propagate MDIO write errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Novak" <artem122novak@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114050954.275495-3-artem122novak@gmail.com>
References: <20261114050954.275495-1-artem122novak@gmail.com>
 <20261114050954.275495-3-artem122novak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 05:10:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The MDIO write helper currently discards register access errors,
> and the MDIO bus callback consequently reports success even when
> a write fails.
>=20
> Return the error from the helper and propagate it through the
> MDIO bus callback. Continue treating -ENODEV as success during
> device disconnect, consistent with the MDIO read path.
>=20
> Fixes: 05b35e7eb9a1 ("smsc95xx: add phylib support")
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114050954.2754=
95-1-artem122novak@gmail.com?part=3D2

