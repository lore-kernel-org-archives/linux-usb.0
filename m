Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739912;
	b=EaEqm1pFnB4aDR/uGfycGbB4kMRj3U2OMmrDs6zw1KMZNNXVO3YBxOh+AKISV33b+Vid
	 sONQqFajeNXcYhOlqk+ZBzQ/pIcq3QQbEiYDgeSeunSHWeKUGC2t0aheL8htERRqVyUqE
	 zmDkI+5PSJwKO1hd/wX1NjsGR+tguwp8CwsTENX56CsDJtrmI37wzer5fNcEB5ZwLXTOL
	 evcw4kO2KrfW0ZM+xFJr3uMj1l2gBkmqnT7mQTIxElfKnfDL0ZiLgjwWn5uSpHuL3XR3T
	 0NW3rdoRh0F8D27yBqjvvjat9n8i0Mba13O5UVB8qR8PNbpf0J2QrDK5Z8Vh57oHMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739912;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VB4GTlKs7CQGEDHdhIaMo75Ckibq6i4XulgGCagN11s=;
	b=uAYvD0Z6KpODOVtxO8qfDIDh4zy/FM+mtVuaURJU4mwg+oqE0MdR+KFLC4HH+qvJ00SK
	 6KCc4u0y0iedeeMn9sqtJ9C9qBEjjJKoGFCRC3Mu2wYGK0fuIA5sg4NaryETtssHpMcET
	 6SkJDwXsTrdcLlw/vN810e1m/Ic+wHyBWiaDlvEKZGwQlS8XgRKldg5LCnSjD4K0dhCM2
	 hzkEPPLpxLTYTvhXvwSA4aRXxHOwnsa+4FpK6DIAqMiBTaw+cY+pssnExpX4p/DH9ydnT
	 LYzKWzqyJP4+F5DSPqYrIOx0rnhgAkRvPFy5xtxebwtJr15XfTmh196ImKDP5FuLZdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSxmXmhB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41799606A31D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSxmXmhB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B8D1F000C4;
	Sun, 15 Nov 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739912;
	bh=VB4GTlKs7CQGEDHdhIaMo75Ckibq6i4XulgGCagN11s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fSxmXmhB9XbqtijJdFXWdgEL3i3dJeWszLzwTI7FsiZ8Kerkhf7DZ+1TlH0GbIOSS
	 vsFJTZK+MhlX4BucI8q3q+DjQFP9TglHZg/DiUWs+FBU+lVe4o8/TWe++LNkv27/ad
	 28qga1iQB0/sdGWWnm2pVQXz5p7hw9jwd6e2+nwD0EsC8Y3qX83S2BlNVoxUz/G7PH
	 Gd16Ol5MJQILrh9yBK5L10WGYIR3vuaYVgHRJ/shpAWj7jjiwpSPx5B76vynOWWdWV
	 egloSGJnJwsak2ty7c4d05lTsWm7sSmg3M5iXeeQ+VwnLSZFij1hxMkCT6BikXQSqw
	 BjAnibUJAMNIA==
Message-ID: <sashiko-outbox-215415@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 02/13] phylib: Add support for PHYs with
 broken forced mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-2-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-2-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for PHYs which only supported auto-negotiated
> speed modes. This prevents a kernel warning and stack-trace within the
> phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()
> because they do not support forced modes.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D2

