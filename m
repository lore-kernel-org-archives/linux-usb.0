Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620928;
	b=zNla4vMF3H4k0MOrOy0stI6bpQjs4uUNpHcs72pkt5zYdYwCt4Dp7kvIlFCjMzOAWQ71
	 A7Va6wGjhYFZf5pnTV772yN7GX0O6jKjpCMEG9z0COIB8tPGbQgOeGIsZ6EyFg0V4lvf5
	 01av3OuEpn2KWpX0R1D7eF0laZTqehfiHw0taW2CNQCKXwWOKQYa7Aebm5MSjJ1Tlps3H
	 kL7971fNj5POfQJQD029A2GKgd8aV87ExxbUxkdiR6lmYxcAbaFJROdWRWodu/H267XfZ
	 P4es5oZOb67juDPQ7gwOc/8Cb1PY1ZnQ1YOZFAtGumrxEWpB5SAzKs/L6FQcJed34Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620928;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0i4MI7fjsSnbugHDSOTA6UysDrdqBkeohErz5zKfaIg=;
	b=OUx9MLimIfffJNxjLoUQ7IbH8gbvt7HBzEbzoQaLx7TnA+EdUCpdRJKvYXx/OAOCwuOk
	 RcJ+6JCVcoI6XVz5BoxDVYUlcHTrJ6sah85D62tMZzqLbF0DTpwhs0oJdLvlpiOZhv3v7
	 ZAmfxHL1ANTz/kgPfwFPb58/H8DS8axt8ooexxZTLK7MTNxeGyiN6n6U9XvupaakSy933
	 PCfEeGUr3d8afCWlexuBv3qWY+YxVxO/zKzXGvAjYnDyf3C/oXRkRsG6cGOgs1Fdz0HHB
	 IVPaM1yK5nHO9GFMtsFNYczft0rJeaAdjwqxx82HRFmYMOKAS8WRujmGa0frSZMA8gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="C+A9u/bp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328EF606A94F
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+A9u/bp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9E11F00A22;
	Mon,  2 Nov 2026 12:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793620927;
	bh=0i4MI7fjsSnbugHDSOTA6UysDrdqBkeohErz5zKfaIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+A9u/bpaMEHACbQcPw4SYCH+DPoM9AH0J5rAykvN9QwewSGkU+A6yLizYV4/ZuWK
	 2UhFP9yAfIhzz9T9tK6XTvbfb56nGoy28L9YQ6UrRpeD3hfmTGUBoXw5SWaDhHcbma
	 vuL0clrYSds+Ocfc/DTQT/R6Lf1bAR+uTbgDGtqbnHp+xXmSAZbV/4WHe/yJr6SSyL
	 LCDFcRXfvg5YgpRZPhRSIWuYSHOV7ExeHKCEjTFqbOPrTdv8EKZQE+4XCb3wVgjHES
	 qrqsCUdEGyMcUzf+qXh7vkwifVufxOhPSsgAtK59gV7MMT5we8Z6/5UP0Qhg7si1Ec
	 wFAxRmEWT4QWg==
Message-ID: <sashiko-outbox-193362@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] HID: pidff: validate effect type usage indexes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yifan Zhang" <yfzhang23@stu.pku.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179362071771.29269.11607321878213733518@stu.pku.edu.cn>
References: <179362071771.29269.11607321878213733518@stu.pku.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 12:02:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pidff_find_special_keys() records usage positions as one-based values, but
> pidff_find_effects() uses those values directly as array indexes.  The
> Create New Effect and Set Effect fields are independently allocated and
> need not have the same number of usages, so a malformed descriptor can
> make the lookup leave the Set Effect usage array.
>=20
> KASAN reports:
>=20
>   BUG: KASAN: slab-out-of-bounds in hid_pidff_init_with_quirks
>   Read of size 4
>   hid_pidff_init_with_quirks
>   universal_pidff_probe
>   hid_device_probe
>   uhid_device_add_worker
>=20
> Convert the stored position back to a zero-based index and validate it
> against both fields before comparing the usages.
>=20
> The reproducer is rejected without a KASAN report with this change.
>=20
> Fixes: 224ee88fe395 ("Input: add force feedback driver for PID devices")
> Signed-off-by: Yifan Zhang <yfzhang23@stu.pku.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179362071771.29269.=
11607321878213733518@stu.pku.edu.cn?part=3D1

