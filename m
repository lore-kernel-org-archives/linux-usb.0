Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109118;
	b=211D2Z2/nBM9FxishAWWwJOxUX62+aqlMvbSl3gh+cBzQjbpqZ5A/YQtwmavRrWRtQBz
	 2VKNuOyDv/Ugv/JdM+3FvN2Uj5aU/A69knFA7yJfP0To+WzrBfmhytxI/U2Jd91mJdt4Y
	 c06hPL4g3wEpcK23P6xMOjzoqx1KeBORC27uXEW7wPKBjFd4E5AvcWYAMq4bR/sn8dqQW
	 fyqijxYzy4JwordheQeG4CsBSikyRVz6meYjwSOPl7Cn632/Z4av/O1ck2jkbBAhW57UX
	 NCFReUqhkw7MVom0Y1dbDVgLpiSfKQv7IAOYnnyuCsT2LxpSNXfVsqo0oozrJ1rDTyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109118;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L9OT9gX5HmJypf93R6zOmKweaZcZ3GoySJEwcjIVbdQ=;
	b=bmWjwFOJ/r8GNoRR2KyA1mJMHEObsY478lxIINHhU2WaFzyTcIhl56mOY5vSsiioNow+
	 PXla2lb61f1i39OTkoVz+VVLp46I6A/vY8/V8cuN371lVkN2gvk8jJsAFk3QxXK5aXHS9
	 Gl+h4rWuGkv8yT8DitJ7cnCVXaYwZETf8Mw+AlcjcaWvj54EAplO955VklaXAf1TRJQVI
	 +rrFzlKqcnfVkNq5UUErbTNQNfV0P0lWTwuQcF66QeWWzc/k+kGtZtkrGcF44E1dXrH+T
	 aPAaRxoGLHMSwW3g2O9oQ+pDneiqCYLmLAmPK+R1u6zJ2qmXRyZF0nR7gLDRZB1yl2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jeXWO7bU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE09606A330
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jeXWO7bU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9331F000C5;
	Thu, 19 Nov 2026 17:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109118;
	bh=L9OT9gX5HmJypf93R6zOmKweaZcZ3GoySJEwcjIVbdQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=jeXWO7bUS+NVuOX24K3J1c9696Zf+ccydwS9Pw8Zi7hcKD+Cf0SmDYOd7qx+8/3/a
	 Eg/5XZNm5aVG6Lt6gbFVzb4s7r3pb5gTXrgyQKGLn84IvNu4lviiwsfxtHsfZ/fAa/
	 j3AqpCqlLpX5atWjFllcFfoXXZ51Zfnl6vXZqbN8YZwiGAt5Es5xX4j7a9RxxRnVYL
	 iyN5nQrH4ooyJLA+7luofquYC71pKYLSzqDwWkX8M14ON/kykxrE8dPuyGDt1yiXRZ
	 l7p04Od3fO9SGCNF3N/BmUjHw5P2oCg4gxnZZMxQgrAEY3LNh81GieXSkmiLVY0Y3M
	 x6+RKygrevRTw==
Message-ID: <sashiko-outbox-223690@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/18] thunderbolt: Move tb_plug_events_active() before
 tb_switch_reset_host()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-9-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-9-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:25:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> We are going to call it from tb_switch_reset_host() in a subsequent
> patch so move it there. No functional changes.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D8

