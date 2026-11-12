Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484373;
	b=rOxPV+jJcCMI1qEKF4d3aQ8feqtiF49EEqHeXWsny3I9wz8HJaHzV/FGlrTLFIDrJSKP
	 VZHR2Dm5yQnxwCuVorNNL0lyP8HyX2UcRCYsAIIpgojPdvWtv5SDCqTXiT1Eivsx3GpJs
	 FkyEq8PQ4pPYOD2F93ZsZ7eDeizvE1t6/+kahYYwdpxgcSGTANYiCKoPTshhHJ/kg0Ajp
	 mSciIEZX6pm17Z+ypfQPZ/VimoobHSvgXBtgDhoohSff36kzhsamZBAePcrENG/97paGC
	 foGoQIBAJwN7xqD5OnSBYDSRx/HmEjnoMp1c+ocQoMSLzdLdFPfNInmY1aKAjJk8e/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484373;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tvRBkKJ3T4labs3G8XzrlqhqC8nYLgZiUovCM6olnxo=;
	b=g04cOZEQxutNOfYfOSQcqX7umd7lFp6FWrTRX8CUC0ZQYZeG/AGKKe8bBeBmW355T0Q1
	 M2Qc7Mgz8SCR+YVFp67XpHjLKYak9t1x4E17p2yptwNztzNnGWKxMeZwum/2pdz8gLeRG
	 00aNqhETON8RfKxvl1MEtocihLlA9ikqR9I98PoHBwWFZuBjuakQ2SprT56PWsU4+26zI
	 C2CD09bYMdt5+XqQd6AHphXRGIAf1+PyXvGnSw2jcRAHbZHyh+6RQfidBUG70ikTe8xB6
	 5sn9lk93L5K47RuiXCoEiiAJ13Hzt+OzpR3pKNUOida6mCjD8Ewi8j7YEWVByv0mIBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BX2HmUXS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C95A606A335
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BX2HmUXS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3491F00A10;
	Thu, 12 Nov 2026 11:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484373;
	bh=tvRBkKJ3T4labs3G8XzrlqhqC8nYLgZiUovCM6olnxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BX2HmUXS+e6ycMl3OhJHFfrUbzWuRa6jZ5Alr43jL6xAyWwJMxJWUF9ljmXMs8q40
	 0s4Ki99RsyD0UQ7GdABiM0hpGIKYz/PnVUjgXkjKtgFw4ew/BvFBHzh8RNPSFP48Q2
	 IGdmiVfSh27hEL12QKaKhExuI7wL4akf+T6m2jcpOX5gfw5LsB9E8EmNEYoHlFhHgs
	 J5K9MTIsjgiZIWsvWEEytTyY4zP+IZyd0ho4r0tjlNLne4Xirv9gQT7SxAXHIBqYXz
	 QLiThWkSsgUuVbNAaQ1/tfEAz4+cSnMoEG3wxZfZ/8H1KxmL598wweL6UVxpJSG7Qt
	 Au9g+AMEAWJdg==
Message-ID: <sashiko-outbox-211050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: dwc3: qcom: Use the UTMI clock as PIPE
 clock in DisplayPort-only modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112113838.506-3-26rote@gmail.com>
References: <20261112113838.506-1-26rote@gmail.com>
 <20261112113838.506-3-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:52:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With DisplayPort pin assignment C or E the QMP USB3-DP combo PHY gives
> all four lanes to DisplayPort and powers its USB PCS down. The
> controller can still run USB 2.0, e.g. for the hub of a USB-C monitor.
> Keeping the pipe clock branch enabled, as commit f546912bcac6 ("phy:
> qcom: qmp-combo: Move pipe_clk on/off to common") does, is not enough on
> Kaanapali. The next xHCI reset in this mode times out ("Host halt
> failed, -110"), and USB stops working until the cable is replugged.
>=20
> Register the glue as a Type-C mode switch when the node has the
> "mode-switch" property. Select the UTMI clock as PIPE clock in DP-only
> modes, as "qcom,select-utmi-as-pipe-clk" does statically.
> typec_mux_set() calls the switches in the order of the connector's
> ports. Port 0 (HS, the controller) comes before port 1 (SS, the PHY).
> So the controller switches before the PHY powers its USB side down.
>=20
> [ ... ]
> PHY_QCOM_QMP_COMBO does, and do not register the mux without it. With
> the arm64 defconfig (TYPEC=3Dm) this builds the glue, including
> dwc3-qcom-legacy, as a module.
>=20
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112113838.506-=
1-26rote@gmail.com?part=3D2

