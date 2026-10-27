Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097470;
	b=pova++mkCqSaDc+kXWAm1rMs+P3K/whGYr8x1yjkdQX4kBGg09w1ialw/MnCJKUMh7T5
	 wDYiTm8ZT/EikTQZC9W5WxKu3Ba1/TMt/nt7ehHSyoAEIiARx9SKCkhMFVRCR0VXx1qa3
	 kbc1PegPsISfY/+RpkfHfYFi2lukT82dUi3YUSIW1gtgeScfbUX8ePp9nqSFWdPI24xvj
	 vGUp21OERAbSgCNxrpmee0IJJZFa2nBjQYTc3RKO3KuvzA6wdBtgHm1UtAhpTt7WIJDxm
	 YnMdUL1okC/BSxlA2f+AZVZLhmsEsJalZPFKVYbqJGeFk0DKcPdI2f8uxoUA84eCkzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HX3HxJY5VOluPZf2ATIINxropjKkbYfea78pzZn8Kig=;
	b=OCBJ1a4vKAwqF9vMe0E3qa/4ivawft0+eCTcPZKQpt0uhT4bY08xd69Gx7SkADXLc8GW
	 tAXV8Nh5qHlh8aL/tVscNHCb/g2TsrxOZPd75Bfg/bW/sZ61veO8IRvCA/ZC8zZqSRyKS
	 FY44W4fDRH5x/xonbaukBoz/f5BuohJed921nXUyZJitXfM1UBI3Y9dJy4sPfuOQmGg6w
	 qQDcpofst01cIsiw0K87cHkFMBf7LOqH2MmdnlA+EmwUBVKzEuGYcyKo5y+rVkwBqy60d
	 lbhSdD7SkWwO1r7X8f3OlVYvIHxbF5V77m8GP3ixWKwP8Hw6w/fVKXTI6lEnl4WlBEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAeHIlPJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A91606A323
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VAeHIlPJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A5B1F031E0;
	Tue, 27 Oct 2026 10:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097469;
	bh=HX3HxJY5VOluPZf2ATIINxropjKkbYfea78pzZn8Kig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VAeHIlPJr/0UE9G3aT0Rsry5utOqPA89OEFhvBJKD+suGL0Xm4GiDQLCtHJECbq56
	 ijePsGEmu0b14Qf/2zPEu6smwTrzKbe1cXNOX1CY2OoOeqxcq7oQySFZhfND5NX7Dz
	 fyQ3JMK9yL+5Um+E9YnENMTg4eU/WdelFjZSMsPbYjIsBJkEiX78djLTepkRwsuqXb
	 pOJGRyPixhQj0b1mxjRi8JzU4ed9XDAou3X3CpnjzxuOsQ13F3+EYg5WzYqPkaZLxI
	 DzBPgz7sbRi9r2mnTpAKrvg73OONEYz9ZS2p8eFrP/xT3xH+IS3/dmdLfw+Puv2NXh
	 RSzqYdA8nWPFA==
Message-ID: <sashiko-outbox-186373@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: acpi: Assume UCSI 1.0 on HP ZBook
 8 G2i 14
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ihor Urazov" <z0rc3r@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-ucsi-hp-zbook-8-g2i-v2-1-02a600e4f0a4@gmail.com>
References: <20261027-ucsi-hp-zbook-8-g2i-v2-1-02a600e4f0a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 10:37:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Ihor Urazov <z0rc3r@gmail.com>
>=20
> The HP ZBook 8 G2i 14 (board 8ED9) exposes a working UCSI ACPI PPM, but
> its UCSI VERSION field reads zero until the first command completes.
> ucsi_register() rejects a zero version with -ENODEV, so no Type-C ports
> are registered.
>=20
> The firmware's _DSM READ function (2) is a stub. The mailbox VERSION
> field is written only by the EC response handler, after a command
> completes, after which it reads 0x0100 (UCSI 1.0). The mailbox is
> 48 bytes with 16-byte MESSAGE_IN/MESSAGE_OUT fields, the UCSI 1.x
> layout, and _DSM function 5 is not implemented.
>=20
> Add a DMI-specific read_version for this board that substitutes the
> version the firmware itself reports, UCSI 1.0, only when VERSION reads
> [ ... ]
> Cc: Francesco Orro <ncesco@interstellar.eu>
> Assisted-by: Claude:claude-opus-5-5
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Huang Wei <huangwei@kylinos.cn>
> Signed-off-by: Ihor Urazov <z0rc3r@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-ucsi-hp-zb=
ook-8-g2i-v2-1-02a600e4f0a4@gmail.com?part=3D1

