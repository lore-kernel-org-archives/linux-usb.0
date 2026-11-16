Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811308;
	b=1D4Q6uNR3CHpEE6s45MMMVxOH6f9uWVqCDTBCmHBUD7OgLmB50Y0X5i/vqtMC7Kk+O90
	 3J39uB+giYJzC4uBd+nYsMDLA2v7NOsNAgI48kR4qQD1l9Pvnmx0CjUkBSoeE14+4XX9b
	 oM4CIpqF979i5qyhsq8qYgG8YfA2xXRYFBn2fsTwNz9sZM2LP2jiDiE5eNICbwfyuea2c
	 QFNPAK4So/SQcyvzTpmioqh4VdNP1vtdBq/kYZ8BbLMl1f37RydMv/twrUhSGoF0gAiix
	 RcYiZncdU7GOF8Q6aVUdMR1D4WvpfkRBVslxAA2dg4Ma3om3yufD/w2STTzb3MxUp5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811308;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0IP0EJZlTVX1SkhZ5OXyykxj4I8XP43pK05jSiXEQZg=;
	b=I096NfnFx/sbIwJAtAsvLhebLaJHBjBm7MVmpRmbs9uePEEFPsVyCwR9SyF17NYFiInK
	 CbfjNnVED8G7s4dSyXokfp4btX2ub9MM1RVg1j9/swIYUuJ6jg+MWwfeeoJEyNpwfY0e2
	 4T5LlTAHxE51E7wO1nietHAf2rlYr7ro8FfJsT9UhfhYy1cJwxKJeSGcL30REplBwN1GQ
	 ygnbaWDbnqH1RWuFlC7IROF7DLBR32eXR7x+r/Od6+1yXfdTWuDFP5zxJIo/XxgG3SGfK
	 R2Cr7H2g1CPiwXHSy1IxQ+ibUaXbl8Yc16uUB2ChBLTQ8ltsyhNjWJUxideSqwKMhNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRnm4Z3n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F05606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TRnm4Z3n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110691F000C4;
	Mon, 16 Nov 2026 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811308;
	bh=0IP0EJZlTVX1SkhZ5OXyykxj4I8XP43pK05jSiXEQZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TRnm4Z3nZH7HFf31F55T8C86QJsNeePhFJxjtTw6k2OZWRTNZhyxbLHkZ7funFPIM
	 GP6A3Yt+iqBaHM/nQ86HtWaDpeBdYIkJZQ6mWZFguDpSZZiRQ51cnBEGto/o5g9gea
	 1yyfseRotzhRu8RxHkR1J7ktZjJ+2O8WV6GbdyZoLoffHd6aQInMjMvBk6qyGTc2jW
	 Sz6FUMTjbLgNEPBKHsoa5ZwCn3RSK3JGEY763DXi3R5/5/rSsc2dHclVD1JgVFfuip
	 P8ZYOVY4nQ8TQvoPOHpheXNh84ClDsxm2UuFAGXjibZ6NFd9vYBouSIE61RjNZ7mr4
	 4tTRjnDGGZjDw==
Message-ID: <sashiko-outbox-216297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: ehci: skip companion handoff when no companion
 exists
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116063104.1018358-1-william@wkennington.com>
References: <20261116063104.1018358-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:41:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> EHCI controllers without an integrated root-hub transaction translator
> unconditionally set PORT_OWNER whenever a root port sees low-speed line
> state before reset, finishes reset without enabling High-Speed mode, or
> is relinquished by usbcore after enumeration fails. When no companion
> controller is present or enabled, setting PORT_OWNER routes the port
> away from EHCI to a nonexistent or disabled controller. A single missed
> High-Speed chirp or transient D+/D- bounce during reset then strands
> downstream USB 2.0 hubs until EHCI is rebound, and connecting a USB 1.1
> device leaves the port dead to later USB 2.0 devices.
>=20
> Check during ehci_setup() whether the root hub has an integrated
> transaction translator (ehci_is_TDI()), HCSPARAMS reports zero
> companions (HCS_N_CC =3D=3D 0), both CONFIG_USB_OHCI_HCD and
> CONFIG_USB_UHCI_HCD are disabled in Kconfig (such as in
> aspeed_g4_defconfig, aspeed_g5_defconfig, and BMC builds without UHCI
> or OHCI), or a Device Tree companion phandle points to a disabled node.
> Runtime companion binding is intentionally not checked at setup time so
> modular or later-probing companion drivers still receive handoffs.
>=20
> When no companion is available, set ehci->no_companion so the handoff
> and companion sysfs paths check a single flag, keeping port ownership
> on EHCI when no companion exists. USB 1.1 full- and low-speed devices
> still cannot enumerate without an integrated TT or companion controller
> and will fail usbcore's normal reset retries instead of triggering a
> PORT_OWNER handoff.
>=20
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116063104.1018=
358-1-william@wkennington.com?part=3D1

