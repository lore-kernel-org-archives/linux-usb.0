Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972549;
	b=LlLU1VHy+PThb5rpEMDDMC9nSrVv/JvKVLQScKgAv1YWFDghqhr4yrplHyT9w47ERbAE
	 1A5bdzx20nGNpdyauWYcm5UOVQYhwz1AngtnmGvEn8AXwE2pjM7NgOvg44bvk5jLYuj8u
	 wTDOk9+JWZB2QIMEoRQH+W5In44Cdwky7Ax3dWlv47g5ocA4EOb+vgNRU3Bqyx8QN9c7c
	 LJf3CCXMlbWSI5knF21m+/4MnJ0o5baue8VE8ET0fvfnRBU1ypWdrrKl2I8XQS9pd9OH7
	 /hzKTfKhCv/nNmxRh/YqABc7Sbc5V6GQtYU0ZQ6Mnfx3pIwyO1r4Eeokz4ZrJ9Ls+UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972549;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yha0xcpo0l+l99YfRBE7t1HWtktbOT6m8oiiBzbviJs=;
	b=TxZgrjr0P3HWVElvi2e72LWZ5XFkr2WFP3j7yHHiE2cPauB5yZUesrJQcGIUj783w7Yz
	 /KU0PE8OtRHEfe07gqbRQKW4zM8AjiD4PtGRjBlGp6fev3Ja/I+D/Dlef6ZFEnox67C4J
	 zW4lQoM0+ZWZOhTzpTkkZ+jUn1M2QmQ6HwR2RyS3EaaZpPhGerRA6DM3uxdpCR4z2Tp51
	 FhRli5CGuZyVUVxIYuSEIesKpTFA4OTS5Rp77NuWr2C0+S2ErlJrkqA8PY3yE2PqTixRT
	 yo2qAs+PfREjQzHr7GnHw0s4Eg0muR6moONLsb8OCE6BCXyjLoGkXu/eMGrqyBz6DrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=biUe6ddB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D292606A31E
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 23:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=biUe6ddB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C271F01825;
	Sun, 25 Oct 2026 23:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792972549;
	bh=yha0xcpo0l+l99YfRBE7t1HWtktbOT6m8oiiBzbviJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=biUe6ddBXOkDChKQZy143O8VyXidc07JJde5C8rMSYZK/NYNw88ijY9jUnTS6Rkne
	 IHV4GohEdu65zxOAUtm5uAQVJx1sWqlvJo/lSOlc491i2ScrnvmE9Mjrfru4VAL+zd
	 PjrA7WUlmnv980zNaz7OPdEEnel5Y5Qhdia1Hb0FDydSU4SToyD+wHp+/T5BkGS/u2
	 1RGiu5kinj0E/J/+p3uLoCsfRVLtrgtIPlE4S1IbBsNi9yGw/+M658X944XTT6lr7m
	 4S55oEHeK2ciCsqkqsPVpaBTXWywzYnmw3NMSA4iZW+Cdh5AxI0y/cMmI7VjLpi5Yv
	 hm2Yq2R2+MSgw==
Message-ID: <sashiko-outbox-184527@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Assume UCSI 1.0 on HP ZBook 8
 G2i 14
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ihor Urazov" <z0rc3r@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026-ucsi-hp-zbook-8-g2i-v1-1-91002e9ef073@gmail.com>
References: <20261026-ucsi-hp-zbook-8-g2i-v1-1-91002e9ef073@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 23:55:48 +0000
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
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Cc: stable@vger.kernel.org
> Cc: Francesco Orro <ncesco@interstellar.eu>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Ihor Urazov <z0rc3r@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-ucsi-hp-zb=
ook-8-g2i-v1-1-91002e9ef073@gmail.com?part=3D1

