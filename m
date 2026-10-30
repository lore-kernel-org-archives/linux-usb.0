Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389486;
	b=cbbLTi9PDIQk/r7G/n4uxkBGszGgcc50/dhGqAzTWCbJCCcCvcitJxdulna8MtHl9CyI
	 rVzs9j+AtloF9la6ueFale9ViMOe1hl1Y8FL/FX0ZOIqlxGkm4O4tylFaQLAhCec/ehhn
	 2MFoy7KC3D2Nul0oErwOEHbbEdrXHIDTTHjJT65zRIdttCU3bfDmrp35B5tiePkihNkMg
	 g0ZSRhq0aVxYqyL/Vuo/fWUUOqTLx9pGaGw51bflJYqbV1y9DhFBEamL32cMtG4UFTxW5
	 Qth5bXYG5gWIb7BunAi8gzcDTZBXjLIzgblC1SE4a2MSt1sIGZhVF9Uy07wATp27RLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389486;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tQgv/WTthfNG4SfkLzAOqvvm2CN3IFP+fH32n1aLyK8=;
	b=qXonr6v/Bf6beN9rDraCtmoxOwey/GjiA8YG7OXGuOWqDx0TMI4t4i+4VM4HbO1Ztuvh
	 gd4n0CA7vWYHljBrtKCsv6p44GlDrGcAhAZT9lKmK9PWh02bOH9QWrCdh5T+iLCoFHxYD
	 6040jOCEbOSYi4yHMpzFeffi5GAQMrgtaYnMFJhMIYJAESq0HAQclzepBxSvFzzEjIIqC
	 8j9zTCt8eP5LbaKqvjhWfMR5w7GEOm8pcDAFUFdFos2Q5inVVZI8iT4hLKRHezeMq19Tu
	 8/oKOmq8+TEt7LC3VP5KNe1fL5Izv43f7SLYn+sTwjg1oNxfUgb7kRBWTjD4lIeK4cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hX78AFM5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95C2606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hX78AFM5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772181F000C1;
	Fri, 30 Oct 2026 19:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793389485;
	bh=tQgv/WTthfNG4SfkLzAOqvvm2CN3IFP+fH32n1aLyK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hX78AFM5LD3ngLPIUstRSdysMTEuwcmTQgAjYaPEbtj7oPtUDOPdoNq9qNONyC+zV
	 8qZoFF9FgU4OHx99ij4HlD7Hmn0+wFB90LF0vHsSCcYdP7FQwzEbjy10a7UPRlzsJi
	 VquSzpKcTVISLD08lI+yiVEZ5XeJZ6r9DD/d14elkmV1d4mukQMtZf62Npoqlko8mV
	 6mIdOwRiYZfDVYfiK0J9O0aivvW/kYQXnCnGmgskVI7P1IHWqHQtWK68OuuLsADnfP
	 r+Y5alrJQNtIiRqv9s44+7YSqbl/RmQEJ+gqeP3vWR5kyOUitfR14WD90XM2mdb8Wd
	 +cgifex4n5b+g==
Message-ID: <sashiko-outbox-191452@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] usb: pci-quirks: always assert xHCI OS ownership
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishabh Jain" <rishabh.jain1198@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179338900780.73175.16604680938007633313@gmail.com>
References: <179338900780.73175.16604680938007633313@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 19:44:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The xHCI ownership protocol requires the OS driver to assert the HC OS
> Owned semaphore before using the host controller, then wait for HC BIOS
> Owned to clear if firmware owns it.
>=20
> quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
> is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
> while both ownership semaphores remain clear.
>=20
> The timeout fallback also clears BIOS Owned using the original register
> value, which can clear OS Owned at the same time.
>=20
> On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
> resume to terminate Controller Restore State with USBSTS 0x401. Linux
> then reset the host controller, both root hubs and the USB Bluetooth
> adapter.
> [ ... ]
> Tested-by: McKenna Fan <blue_sun@tuta.io>
> Tested-by: Quinn Schive <quinnschive@hotmail.com>
> Tested-by: Bruno Filipe <bmilreu@gmail.com>
> Tested-by: Maciej Zonski <me@zonni.pl>
> Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179338900780.73175.=
16604680938007633313@gmail.com?part=3D1

