Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277856;
	b=wUWikwuZSb+FFH5oqar0D49jexJndyghdqigREW2D+ktGkzUi0+mPl8cZI7YtcfleE5u
	 7zGT74eHAEN+4qQwkEBYGTjBt17/ayzG41V9oy/xB0V2/p7cCC2h6rohGIh9vsoFqrl3c
	 nQIohW0ArXdUWDAeUHzjWfqWXOCFlQexykkuwn2wFHwpCy7cDN2Kpri8a60nr/EBPzcwR
	 otqW6z3lDooeiB/03W3It1fFgRdVL5RXU+/nLtFzQLBwfSr1cCnLFferwVoRsbDYTqiu3
	 sALqUhfnJ6Txy7cVdMkaBHGI72bafUGMteQnKy73YSYDx9M7UbB705r43icfZFkjdzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277856;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WS8Yh27K4S44b2F/Y0nUc+af1bbNjjO0N2+nGV17ndc=;
	b=WHEcmmdO8HJ0ChYSlOCYkVZD/cqipx+Z0GRXMQntQDEl6dUYMw8jdXzbIV8J61jh2rCG
	 fQr3OEB/+RnJ7sR9opfUmzOpTfZvshiw1sGhc/etvme6snX9UoZDxiUv3M1uWAeYpu7UA
	 PkL2kfnI40Vu5Re2zyMh6ERTNXUw/A1++xUs/Dw0UHtmiJLpkCn8PVpFK9TtjcVNykEel
	 mRs1bT5B69+5MGXX+eoAi2uNh923p1mQO7vleOaGbXVLL/Sj/3C2UiHs18qSB23+bK9T3
	 bKNp8fbRIxhGFOdAGW2sWdL5QoAbcX/EXdR0DVc0F32TzegHu1oXRVdjARmOx3APctg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KH8xMk/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EFC606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KH8xMk/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED18D1F008A2;
	Tue, 10 Nov 2026 02:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277856;
	bh=WS8Yh27K4S44b2F/Y0nUc+af1bbNjjO0N2+nGV17ndc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KH8xMk/H6G261vq08A6xPRlXIyrFB74wPDtXGVogyHonMSKeGlT53jHQhkh54o6Pf
	 geTQxNpWpj0H34QK1cdfE9t+5bTj6eUXvjka0xqX9+IWPvJI8gBnuOkthrM3I05tYj
	 gUWuO4cbfJplzokVjfIsM3xgYdsDe3Xf9aRnbWD6D4ebXk+fjzpo7ovrfwiK+WjDkl
	 IxKpPRmqFPcUuNgAlHzmCZRZkWxKTsWokfzmTwviwpYKmVy4ITWdpUKiK+E9YbYA8k
	 yqXChjHdNQ2xMmUKwl8wTXJumJW5S1wfXMuymlkIsTtngrYTALkTFkZ2mGwoFVeR5E
	 s4Sleh5/2+acA==
Message-ID: <sashiko-outbox-206047@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [[PATCH v3]] USB: visor add vendor/device IDs for PalmSource
 devices from the PalmUSBD.inf file in Palm Desktop 6.2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Simonelli" <adamsimonelli@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261110022351.302989-1-adamsimonelli@gmail.com>
References: <20261110022351.302989-1-adamsimonelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:30:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] USB: serial: visor: malformed commit subject with stray leading
  bracket
--

commit cb84cb0d86c345eb88e5efd1e32db221810d4087
Author: Adam Simonelli <adamsimonelli@gmail.com>

> ] USB: visor add vendor/device IDs for PalmSource devices from the PalmUS=
BD.inf file in Palm Desktop 6.2
>
> PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource
> devices. While PalmSource only developed the PalmOS, and never made
> actualy hardware, as it was Palm Inc. made the Palm hardware, there
> is a bootable ROM containing PalmOS 6.1 that can be booted into RAM
> on the Tungsten T3. When this ROM is running, when plugged in, the
> device will then present the PalmSource vendorid that is defined in
> the INI filem and the deviceid then becomes PALMSOURCE_DEVICE_1_ID
> the PALMSOURCE_DEVICE_2_ID is also defined for completeness.
>
> Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>

[Severity: Low]
This isn't a bug, but the commit subject begins with a stray "] " character,
exceeds standard length, and does not use the "USB: serial: visor: " prefix.
The commit message body also has several typos and unpunctuated run-on
clauses ("never made actualy hardware, as it was Palm Inc. made the Palm
hardware" and "defined in the INI filem and the deviceid then becomes
PALMSOURCE_DEVICE_1_ID the PALMSOURCE_DEVICE_2_ID is also defined for
completeness") that make the explanation hard to follow.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110022351.3029=
89-1-adamsimonelli@gmail.com?part=3D1
