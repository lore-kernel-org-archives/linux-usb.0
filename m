Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144645;
	b=TRRxrjDsg+z0TVf3smt+QE63vZxNXaQkVoD1013IewFvj8bZ51I76oXovj5jaaHMlSsv
	 97MVJ0FsTVg+roy2HbE2tqi9aLRnlXvdzZ/K1H7csA5HtPlJ7sj0PJSMjzBf4TLmAE76u
	 sy9oa0U17SNM4LHfxMYF2mMZ0bUzs2sG8K9bYWavMKbndELkMbFh3pRCXlmkvGcrZ7+II
	 re7JcNqa6LMuf++nXxxkSTjdIr+5ayfDF2ePgp79Mq0a1TGdX4j0Ngb1svsPkUnrBR1mT
	 Rbu5htlw1cHLPyGQtZkh8pZy+4Ha1+5f+kiRGD5do9Ow9Q3r25Q5YRfAYJTNskWmk3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144645;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8+83p31BdiAaolSxhgOK1e8M1HYXTiABpuVXzFNTqRQ=;
	b=xAZIgko/LN7pQIssRtnZAdeBuZ6+7WAgiGc8er+jTOnFdM4nvoxoOLEVx2itiXTlqVRA
	 9AbLb0rpXHVgsZbyCmk9sY+jXjB/Ke8whBkKHoJwPY3o/JFh4fOwNyU3xCBreHuYsX0LL
	 Bk5NldhcX98jyb8bmshNFLMMME9GG6KTCTW/V1zB3L1GUPOZ2yLxFAxl1fHKCKLb+gftT
	 I+S8xN5NddHJh1/POuBmGPQkNmCmlnjew3x4d97WieJs2w+aud7Nur4kjnWUGHzg+I6Ko
	 uk6Mqwz/ZesAUj4bxVhCjnyaTmZYIaNv3FQ7Te+L4+zZh83UwxUgAiRMRqCClWgBtXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+zKucsA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04688606A325
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 23:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+zKucsA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8A91F01828;
	Tue, 27 Oct 2026 23:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793144644;
	bh=8+83p31BdiAaolSxhgOK1e8M1HYXTiABpuVXzFNTqRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+zKucsAYqWEh7z0U/cYXbcZJGxri1fjgA47QxatoMiEYOpX5eOK0IKXLJ1hIPwNT
	 kaGbqJDOdYC1E9gtLw/vEjl6ujzUUfJnobEL6nlQ4B8BpWVBB1PFJSd+5v0QZLM41a
	 VfWu3+vz+rK9Cd3IkUp9ha8CMYGDocke7kpAJ8KzjBBglYxuhZmXuzoB16nayJvYSF
	 v/Tua51sOx8CSypis/cMUaJ/zxfC3VAX+TWFEKEfqGEniHukC+3Nf3GNBwljRGiJ5f
	 kNKy8EtOofaycQn3x7nES6h6vUKFLcZn2gz1Uy3XuxePSHpzlM5pq+ieULI6j4wO9x
	 tADYGpRE0i7iQ==
Message-ID: <sashiko-outbox-187234@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: ehci-pci: Set has_hostpc for TDI EHCI on
 Intel CE5300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-ehci-ce5300-hostpc-v2-2-375e9d362d74@telaak.dev>
References: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
 <20261027-ehci-ce5300-hostpc-v2-2-375e9d362d74@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 23:44:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The TransDimension EHCI core in the Intel CE5300 SoCs (192e:0101,
> revision >=3D 6) has the Moorestown-style register extensions: host
> mode is selected in USBMODE_EX rather than USBMODE, and the port speed
> is reported in HOSTPC.
>=20
> Without has_hostpc, ehci_reset() never programs USBMODE_EX, so the
> core stays in idle mode: USBMODE_EX reads back 0, USBCMD.RS never
> sets and no device is ever reported as connected, even though the
> probe itself succeeds. With it, USBMODE_EX reads back 0x23 and
> devices enumerate.
>=20
> USBMODE itself always reads back 0 on this core, so
> tdi_in_host_mode() would report a running controller as not in host
> mode and ehci_halt() would return without stopping it. Add
> has_usbmode_ex so that, for this core only, tdi_in_host_mode() reads
> host mode back from USBMODE_EX. ChipIdea also sets has_hostpc but
> keeps host mode in USBMODE, so it is unaffected.
>=20
> Intel's CE5300 BSP sets has_hostpc for device 0x0101, revision >=3D 6.
>=20
> Tested on a Control4 EA-3 (Intel Atom CE5310) with v7.3-rc6: a
> full-speed CP2104 USB-UART bridge (10c4:ea60) and a high-speed USB
> flash drive (0781:5575) enumerate with this change, and
> ehci_shutdown() leaves the controller halted (USBCMD.RS clear,
> USBSTS.HCHalted set); without the USBMODE_EX check it stays running.
>=20
> Assisted-by: LLM
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-ehci-ce530=
0-hostpc-v2-0-375e9d362d74@telaak.dev?part=3D2

