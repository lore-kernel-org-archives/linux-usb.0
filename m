Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234535;
	b=XkmVWKzR0ZtC9EVzbja74fnbCuYLo1B5pN2hVOHPjusbGkSWgi9gPKw4t2s+O4J+BkLP
	 mQTvsscKhtuw1/sDNzWcNrWRplg+2uP//VO1yGc1nJpg+o8AUQCTWJPdyZT3gY8IKrT9S
	 ZHKCZKvve/iTNJg2s6o4CD+cV53W2dkMida742Kg3PUCtZsbtjEEJrUVlo7Oln3a+6hbj
	 9HiyrzdoxIUH2OQzoUB7bx1okjT+QwYGs1k6rPQYpBTEqhY8r6n5LZO3AEm5VxdD1/pQI
	 OTOdoVqKeC51F6VDopozO/HCogy57QFLd8+j2yig+ecmsIi9gE0rZrm9pH/N6xrfXag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234535;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=htmiOX7ybxvq/PluCdMFe5WUHFb7XMbBigt0pDSlweo=;
	b=yEE0Bq9Yk4XoGNPV3hUHrX1qeOnIZqW03iyIzYxlOaau0j5Sv43HJoOFpKTTa4nOwGdJ
	 FYH7Hq88WJskeR7EOTz8ZPpqMkMGuI2R6hnfesWBghWzNBajd+pz+5/4DMsJbFc3NXAvt
	 nh4BENkTj30eoCED4S2NJXIic2knu8nL1d0FUK4KnpidohPxT2D+zckVNZHhvZjh316ki
	 eAZmZqstwmv0Q+gPigeoszfxR7ZX9psmytF+vGk2NcY6VowRALEKI+i20FaEuPXp2XpYL
	 DCKAJUumJhK5szomtFRzawyFOXuqvpT9No2k6yio5aXcRveoUhcDTKgTdNes+HBaGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAsRt5tD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198A606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DAsRt5tD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58E31F0089F;
	Mon,  9 Nov 2026 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234535;
	bh=htmiOX7ybxvq/PluCdMFe5WUHFb7XMbBigt0pDSlweo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DAsRt5tDmbYPgJ6FSjFOLpQxasZR6gb4h8dnAddwzV77i2H5wV3O6i/DoQ/EHux7F
	 VlJPBHHYKTAf/n5I8ECWhxfdwWzC1HRSBRGU6msVK6Q6YRahssyD9cYyRhYylX9XpT
	 CiTL1ifWTqYfdXpkhbOFiXACdl1EJ+E2ea42wDSciqnU9Erco+2daTptN2Ta18/lm9
	 dEEectyTEMC3FBX2Ho/nz0TWA3Lcv2vO0slvupybWib/HalKrgYLzVKetbj4bVGBv0
	 Ptv2/DHdpcSJvoG3aaH7jB27pfRImJkHWfDYTEOolLMBSpbEBXhg/kjwNmQTsQTrEf
	 fJ9eFkT8MxooQ==
Message-ID: <sashiko-outbox-205101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: gadget: u_serial: serialise line setup
 against line teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varun Singh" <varun.singh10011@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109141110.3538-2-varun.singh10011@gmail.com>
References: <20261109141110.3538-1-varun.singh10011@gmail.com>
 <20261109141110.3538-2-varun.singh10011@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 14:28:54 +0000
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
- [Low] usb: gadget: u_serial: missing Fixes trailer for commit
  19b10a8828a6
--

commit 7fc863482be78ba089c79dd3a13d5ea59b19a79c
Author: Varun Singh <varun.singh10011@gmail.com>

> usb: gadget: u_serial: serialise line setup against line teardown
>
> Creating a u_serial gadget function can fail with -EEXIST for no reason:
>
>   sysfs: cannot create duplicate filename '/devices/virtual/tty/ttyGS0'
>   gserial_alloc_line_no_console: failed to register tty for port 0, err -=
17
>
> ports[n].lock protects the ports[n].port slot, but the line's tty device
> is registered and unregistered outside it, so the two can change
> independently:
>
>   gserial_alloc_line_no_console()        gserial_free_line()
>     gs_port_alloc()
>       mutex_lock(ports[n].lock)
>                                            mutex_lock(ports[n].lock)
>                                            ports[n].port =3D NULL
>                                            mutex_unlock(ports[n].lock)
>       ports[n].port =3D new
>       mutex_unlock(ports[n].lock)
>     tty_port_register_device(n)            <- device for n still there
>                                            tty_unregister_device(n)
>
> The allocator claims a slot whose old device is still registered, which
> is the -EEXIST above. The reverse order leaves a slot with no device
> node.
>
> Hold ports[n].lock across slot assignment and device registration, and
> across slot clearing and unregistration, so a concurrent caller sees
> either both or neither. gs_port_alloc() is now called with the lock
> held. Neither tty_port_register_device() nor tty_unregister_device()
> takes tty_lock or ports[n].lock, and gserial_free_line() already slept
> under this mutex, so this adds no new lock dependency.
>
> With two gadgets racing for line 0, 25 of 383 function creations failed
> on an unpatched kernel; 0 of 530 with this patch.
>
> Found with the assistance of Claude Opus 5.
>
> Signed-off-by: Varun Singh <varun.singh10011@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes: tag for the commit that introduced
dynamic serial line allocation and teardown without holding
ports[port_num].lock across tty device registration and unregistration?

  Fixes: 19b10a8828a6 ("usb: gadget: allocate & giveback serial ports inste=
ad hard code them")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109141110.3538=
-1-varun.singh10011@gmail.com?part=3D1
