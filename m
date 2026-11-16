Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817769;
	b=QIgXJ5XWgWVX+KE4fn0pKRsvyr52D7HrhWa46Jm/+QTp3YCvTzfjw2izQQ0L4Qqedaut
	 X3o7y2MlpSTI0FXIaWVvgB8VHd98iNkb82ZWahRhHBrxSYhsjLBjRaSeO4PQUuFEq85y8
	 rRwMPMmtwM9QYgW4/ZBH3vQDJsQxYPnY0CNXuEoUQfwf7OnDjtHFDVp9vaiJrplzO1f7d
	 iQkG2YmL7zTjfCOld1+AocJIVcyRdayXiI6nOEy9XSy8g+uQPaVWsKDTnrOzd951G4qIj
	 mCcZb221X0zpAgjgzMCQEaS7EY61umsYm4Jk1vJcFQY6T91rSYFgHCB9EMRL+JnpDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817769;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KADiv1wWsSXnZIq8W8BkRs4CmRgUFt6b7L8II1v75Rw=;
	b=BL3FvrfDprobFPEehmZtEwvVri6ar/NRRgOXCMPON0IDml12GTZrDb6rzXOOnAUdttEE
	 0IrbvPjR6KfmYUbYHMffPt6UUDRd72n5RU73Lpf9y3O6+0L74wiE6N7lh4rLvfY+N1Kky
	 TcK/nksI/zOmxVaOlbu6RFlCBfIoJ9sZAT+gyBV9qi0miW23xx0ie3le/miQaA/N6Ihgg
	 aORWaKsLF0JMFCQ8yuL0ulM0w7/YQuJvELBpMWI3ArNy401SDGivbakkQVH2XZfn2ogOW
	 eiProy1ihRyBui7s1/hJsi82F6bvLYzOvo4UvrYGC0HHc8Ws/2cIQCdexKBa93lFsiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XmB/xTlV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F6606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XmB/xTlV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B13381F000C4;
	Mon, 16 Nov 2026 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817768;
	bh=KADiv1wWsSXnZIq8W8BkRs4CmRgUFt6b7L8II1v75Rw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XmB/xTlVTLYpZBtvzAtBVIDexYH+pCRzOtB4txB3Bsx7eY1JVpKSU38Tj7ZvpqhVs
	 N8FQOOSzKjALiiBRUrbORW6XILJT9i7BZQfll7cuvXDejiJCpBBr16jT+hLc56ns0W
	 ivGtS53yCebnTfY91ec7kZKWdLWspxtxsBdRbdZt5/I0eGRxv0MK4vKcsUIF+sxWCp
	 3c3Tl8MDDik2S6xjiZAPJluD2bmtwx8NA/BhH9Kax7+A4KMKpYV8rC9ApqZwSAIvaD
	 UqMh4OWjRQrNJjyzFvYMFOwRCRh7EaK5huTe/wlcQG6KTmsJzQ5kIj9OqdDDFV4lvK
	 izGr3OPcR6m4A==
Message-ID: <sashiko-outbox-216536@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116081555.2670878-3-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
 <20261116081555.2670878-1-gary.yang@cixtech.com>
 <20261116081555.2670878-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 08:29:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a driver for the CIX Type-C PD controller, which is connected over
> I2C and reports power, data and plug orientation changes through a
> level-triggered interrupt. The Realtek RTS5453H is the first supported
> device.
>=20
> The controller runs the Type-C and PD state machines in firmware and
> exposes the current port status over I2C. The driver translates that
> into Type-C class notifications, driving the orientation switch and
> mode mux registered by the platform PHY for the DisplayPort alternate
> mode. It also drives the platform USB role switch so that the USB
> controller follows the negotiated data role.
>=20
> The platform wires several controller instances to one shared
> level-triggered interrupt line, and the controller has no per-instance
> pending bit. Each instance acknowledges its own interrupt and reports
> [ ... ]
> The driver is named after the CIX platform integration rather than the
> RTS5453H so that further register-compatible PD controllers can be
> supported without renaming it.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116081555.2670=
878-1-gary.yang@cixtech.com?part=3D2

