Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281891;
	b=GjjreFChSrWFK1wYl/+I9GMMCbqYnMk0PPQX7zt4l1cl4L7Vp3TbI0RYydO2Rfk0k7K3
	 TaHPQMHUHD2g3k6NQzpcA2UBVrYA3azpCMlOsOTLaL9czHSJTHKv9I4rdsYFr8d1Ne7hl
	 Ch4Q452WIkHFXRQ5Ff8J7sQLT68s5IJjOlJwEAJ8qSDtqrnwaVdSgA1K1BEOB3ugNSObl
	 R3KSR4YdFk+9wu44Z9JOo0xBTm6aWCrsEvWhflufqgJ7+oyffLEg17NHy0TYmNIdaITUl
	 iI8vMT9aCD1xEquMRd4R59LB+zFUOauI6H/xFFyYx3QrX6WcMKt4c/YFEnsI3rOCSAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281891;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t9a+AKmrmL3E6Ovei+sZvUWifE51A17kXOBasgvQfCU=;
	b=N4s4Fd0VpPYMfegSFzPJsoAv9AqQekFNqLWTjhtBIZLzl/Q3kkGWK7SqCt0KBpGDn1HW
	 RS8JZXT+WlEfVREO46GmLorqC4FcyjzcKYq0GLnzg4Yd0gDTmT/3DE0jW8W3+Gw87HrqU
	 1MF3C9u6OVZQkDJ78bx1bkl3PiXuAY3o2k7V+8zwtPzEadWla1eay1Y87HvawCFheID8l
	 rXWWaJYi8wuRc3LWDGWrMciWWx39AXgJGRM95/CfBqkIu/AbBxDJXQ4cee0WnaM9BvtSE
	 QVUBAw8IoMyvgKeWS1ZZwXQne+y8gnqy83mb9NxGsx44wKPfsyqAXy0xPz/IMtvhhXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HwvE7/sx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055D8606AA3D
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwvE7/sx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2C61F008A2;
	Tue, 10 Nov 2026 03:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794281890;
	bh=t9a+AKmrmL3E6Ovei+sZvUWifE51A17kXOBasgvQfCU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HwvE7/sxxg59NpeZlurvjZR88gailm8inm6jNUHmH6ftH6BmjBmo1uS4V9m3vjw37
	 iV6Tuh5Jkf8VDXU21OebolIm4fIU+bHeU4aG9BqJLA5PtWjg/XQ6A29n6ZvnFsUAWh
	 7LGBA94Bpv9lR7zy05CYwudPyPvh0eZJuQnivH79M1wwJVStDNn+qKUw658At5DstC
	 SBkbJJKrfqxrdoLwHApOkh6K9bnHAfctHESOzhsEsr1+sCX3ym/NOYVbWNCdPmZj9N
	 0GNAn+Kb6NpyXP8hy6+jnI0Hx/qFN1fmRwYI+unkX0AoVNH74Gt7CsHB8zIyAsrG0B
	 5sQ3LgQ6lHP0Q==
Message-ID: <sashiko-outbox-206128@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] USB: serial: visor: add vendor/device IDs for
 PalmSource devices from inf file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Simonelli" <adamsimonelli@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261110033452.306269-1-adamsimonelli@gmail.com>
References: <20261110033452.306269-1-adamsimonelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:38:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource 'devic=
es'.
>=20
> Vendor ID 0x13e8 in the inf file indicates PalmSource as the vendor.
>=20
> PALMSOURCE_DEVICE_1_ID (0x0600) appears to indicate PalmOS 6.0 Cobalt. No
> devices were actually released with PalmOS Cobalt, but a development ROM =
from
> a Tungsten T3 made its way onto the Internet. This ROM can now be loaded =
and
> booted into RAM on a T3, which once loaded, the T3 now presents this devi=
ceid.
>=20
> PALMSOURCE_DEVICE_2_ID (0xff00) is just included for completeness since t=
he
> INF file from the driver also defines this one.
>=20
> Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110033452.3062=
69-1-adamsimonelli@gmail.com?part=3D1

