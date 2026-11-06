Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958560;
	b=1l8C66lsi4PjX90Fa8f0f1VpJ+Sz/EVuppBxNsVrUyf8VmfEBNUXmhXX0D9+TdhpD5Ms
	 7Ki142J2USP4AH05MdsdwQHoHKb8sUE5ojk1hEen0toT1b9+B3G5KKfpARV9Sk/kDdifU
	 CgJEFv/cuHKjGFvIwvqf2FsoYrOtLW51jKj2rR28cYyF826Ly+mcOB56SEAezmrrEXeEq
	 THDfqJJVIaXZD+vBs+2k/ANI/9lCO4osoFruQIdy0ExnjTt0cLSVLYkDeMAG9u1F3PrPk
	 7osWAcelJ23Wh+dAOq4Vp55bfk5kJ8LLrBy43FoEYsRmYo8s7fe+smkqlxEhlqmcy2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P7Io0b5aJxs39fyAnwD+Z675pHOrA4+ECmWxB0WhNdc=;
	b=f7vmTWm39Zl7Ni2je0F4Cztfb2EHReb17h+a9jYb2NRdqjw2zRYXJC56CNsZsvIq41mU
	 hOmITYzhKmxuKHqpFL8G4xk5O07NiDyvbwlrScmYubvQxXITVT9NmDZ0e66foKjVBQXdw
	 +QNFgAsf+8vuPw9aljaM0T4JvMASvOC1khoB8ww2OsJYWpFAntJONVCRWpznOMI2a8zBB
	 ykBs2D/S6EBa0Mckkes9stz9Ndu48HwTeyD3RxxyUgyCVGJh16sQWuzIoTlSRxinI8osu
	 PKX7liHWvRlvUF9i89DRyNGeyI+YJz/MM/YneR54FpXm/5zJUPoN0xL99iYpmOOxuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+m8yaVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB98606A33F
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E+m8yaVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A60C1F008BD;
	Fri,  6 Nov 2026 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958559;
	bh=P7Io0b5aJxs39fyAnwD+Z675pHOrA4+ECmWxB0WhNdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+m8yaVsbWc0dRq1FN/1nXTyeAZiXZG+Yb9Zo0xnlz+d7tvBDaw5CGWMUlQ8ZB/4w
	 GlJJOZYsPaGYiUKnNLtmt69Oab9Nx7QB2eC3ts3gZZNaKwLudZByw6kZ6VxJ/Bbzxm
	 Qcij88gkShAeO9xOjcLkvmkAwml7lAOm+rQUumI+PjlSo8mgw4sznXzMxt+16CfDve
	 f+kncFGVPJyJdYUUUkYLMAgX/M0Ldpdc94LmHi+dx5QZJxrCgKn5v1raTPtnv5IJuo
	 QRhsfYWlJ0G+ew6nhI4A9v4QEqWPrHUib0dn4DdA7YuvE1JuUgx4Sn9AFrSHOiE6wv
	 AEEy6fSRENUsw==
Message-ID: <sashiko-outbox-201152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/25] spi: atcspi200: add optional interrupt support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-17-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-17-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:49:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> For PIO transfers, the driver busy-polls the FIFO empty/full flags and
> the SPI active bit for completion. When the controller's interrupt is
> available, use it instead of polling to keep the FIFO serviced and to
> detect the end of transfer.
>=20
> Interrupts are optional. Controllers without an interrupt keep using the
> polling path, as do command-only transfers; the driver also falls back to
> polling when the interrupt cannot be requested.
>=20
> The command register is now written when a transfer is started instead of
> in atcspi_prepare_trans(), so the interrupt path can enable interrupts
> before starting the transfer and the first FIFO or end-of-transfer
> event is not missed. As a result, it is also set at the beginning of
> atcspi_dma_trans() and atcspi_xfer_data_poll(), and in the command-only
> path of atcspi_exec_mem_op().
>=20
> Introduce atcspi_reset_engine() as a helper to reset the SPI controller
> and the FIFOs, and use on transfer error and in atcspi_setup().
>=20
> The interrupt path configures the FIFO thresholds for the transfer and
> restores them afterwards. It acknowledges the interrupt status before
> servicing the FIFOs so events arriving during servicing are not lost,
> and resets the controller if a transfer times out or completes with
> transmit/receive words left unhandled.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D17

