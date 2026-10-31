Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483020;
	b=lMwpoz/2wtr3Rao9ftas6QH9T1Xf05gphYG2t7SKFMVXzclblSSIPhdjRK2jgwKcBnWd
	 9RguqX1bt3ShNSBCjjmCVzr2a6nBmgbUXKCw5LUyVoKgPqLL2V66l9Rgn9g5DiNJhgM1N
	 XcuiLCgsDleRDYIq+S6ntbg3g2Eq+iYyMZethF9SdPaZo+m3C4aunZSDDxOPAqkOicuXc
	 jE9KgLGrot9P6yVRzm0U1PjGgXJNFagWnv3bU4yVSyHYPRiJ5dmwrPRGIsoBPqi9pWD2J
	 JslPIKrNJbUcEwyo5miAlLSdUET4SVIFk9D45yg5ONW6uOQgCGg6nedeqh1HRRFHzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IX+tK6TnvEFSZxT/chpScXK9DCCJeD/Zs96hYvJyHVU=;
	b=mZJTlBTfNUEu2HvLymJTYUF+67lOltEJwy7yb34e68x8740dUYKXFhv8Wjx3hsxxu/qY
	 sERgLnu0drvVto4JFqMcTuOPWtexW00DMhRGsdAqU6SouKgSBU9qRI9zL+vwdg69QpK8w
	 wHYu0Je+SH0AJXQ7JTYrhzFmrloVHAbQFpgp6mvIWx2OP19W2dZYol9ArwYKwTHoqpJoR
	 yVBxjusLZH4Rc/D5BEb3q/U2VeVQgU9WHvHRmIG6YSkroKi/FPP7NhicYOuUS926i6h7R
	 34NN0E0MR5u15GOfVaW7tB6fuXkE1XKW4MmNRzeKL71/MUzosilMG2USekWV7N/GipA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBjwRTu+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9951606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBjwRTu+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE421F000C1;
	Sat, 31 Oct 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793483019;
	bh=IX+tK6TnvEFSZxT/chpScXK9DCCJeD/Zs96hYvJyHVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CBjwRTu+LpEtO108Cki0/vQFit3bUYjtVDnm3kw0XaRGcdyBBz7vFtB3MHwMq9U07
	 vyJc0XPnb+1yzF+CH/PtNJqnmPFYbpwt9lP08jp/VGz6YUbwAwJF84V/LCCEbzSk4f
	 nDHbaskMJlzKZuU0tOQnN/eY/BZnvPqDnoSgApKa76TvwAN6LcdlucwfWGVnxt18wS
	 Kfiy3Lzb+o2hFnUcTHuPswPDuGwfWDB30h8MCJqjDl9+oYtoyzPys89ltqOo5IWPY+
	 AhWqOXD6jFLIx3wbDsogAUTYhaa8s+kh4mSUmVcdy78QBgNRCu2pbjbLtR+weJUrBh
	 R+W6oIY+3akSg==
Message-ID: <sashiko-outbox-192184@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Assume UCSI 1.0 on Lenovo
 ThinkPad T14 Gen 2a
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RhbmlzxYJhdyBUaXRlbmtv?= <kernel@resetko.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261031-ucsi-lenovo-t14g2a-v1-1-183751e63c02@resetko.pl>
References: <20261031-ucsi-lenovo-t14g2a-v1-1-183751e63c02@resetko.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:43:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Stanis=C5=82aw Titenko <kernel@resetko.pl>
>=20
> The Lenovo ThinkPad T14 Gen 2a exposes a functional UCSI ACPI PPM but
> the firmware leaves the VERSION field of the UCSI mailbox at zero.
>=20
> ucsi_register() rejects a zero version with -ENODEV, leaving the
> system without registered USB Type-C connectors. Without an OPM, the
> embedded controller does not complete DisplayPort Alternate Mode setup
> when a USB-C dock or monitor that supplies power is connected after
> boot, so the display stays dark while USB and charging work.
>=20
> The mailbox uses the 48-byte UCSI 1.x layout, and the PPM works
> correctly when UCSI 1.0 is assumed.
>=20
> Add a DMI-specific UCSI operation for the ThinkPad T14 Gen 2a that
> substitutes UCSI 1.0 only when firmware reports a zero version.
> Preserve any valid non-zero firmware version.
>=20
> Tested on a ThinkPad T14 Gen 2a with BIOS 1.33 (R1MET63W): both
> Type-C connectors register, and plugging and replugging a USB-C
> monitor with an integrated hub and power delivery brings up
> DisplayPort Alternate Mode each time.
>=20
> Reported-by: Daniel Dev <daniel.dev@noex.uk>
> Closes: https://lore.kernel.org/linux-usb/b1Wn_eFvTFShGbd970WWl4CWhge_6P2=
x7Wb6rab3QHNlE4OJ4p__O-QN3B6I-308ftr5oV5Zr7vywA0vdvmtNw6E0YJnVM2ek_5DcFnkXB=
0=3D@noex.uk/
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Cc: stable@vger.kernel.org
> Assisted-by: pi:claude-opus-5-5
> Signed-off-by: Stanis=C5=82aw Titenko <kernel@resetko.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-ucsi-lenov=
o-t14g2a-v1-1-183751e63c02@resetko.pl?part=3D1

