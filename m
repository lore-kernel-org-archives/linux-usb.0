Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882160;
	b=Fshfv6enLbeAYPST/I9G2p3NxjiovH0+Q34ndhk4R21e/tUCHwzoAzrF0Axg460anrgc
	 zbbR7FeJyplOc4OyVuritnLC/HoVX4zQNK5dpcSdX9EAT+yu+JiZam/vUoRF47FA9ZMc9
	 6NFQn35zfs711MVWzRR2zD799ftDY1ZmaZI9px+7Zd2rg3AqIxYBd55SVVSSADaF1fv3L
	 GLTFnr8ZAiRHa7CoH2gIIegF6jH+YF7afaAr5gwNkTRU6bha8lHCEln0Npj8wjX1E4wIs
	 97TpSFSOhmcRbHUim3y/yT8UHQMnGhHRPKTxhLQMl4H1I8Qn9BKbzKBYdeiH3XNgMzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882160;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YM6PAKzasdDVgUB/+atSfoeov23JVtq+zQDif/AaCPc=;
	b=rmGGkA5TUW2geUnX9wgEhc0otDcJN1wsfpJR3ifaP1NouaHx+XqSgJAnpPLpyBSY9jI6
	 c+NM3dkt3CfO3O60lb5DmFLI/m78LyynW6S9HRZmOSLKGcyWA6kBEgxQlDxRUufdPEK9b
	 xD24rY+BZi8RltTQwqdpvCxERqNGwDEDD43e+Z7yNxRw8bzhmFodmkCaWdnuiPKOCdevq
	 31SnkJLFe3bL+/IbYRRa7XYakGzGM/Z2xhPZI6u44sxosrkJJuJZ/wG/k4lGapy/aT+Hu
	 hzrwm9jAnRAfpz3F+cltcD7VNs7Zx6wvWyoSsbHPcRumkirqyDjFwYw91Ruc0fRqkMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErKKjfnE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78A606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 02:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ErKKjfnE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85EF61F000C4;
	Tue, 17 Nov 2026 02:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794882159;
	bh=YM6PAKzasdDVgUB/+atSfoeov23JVtq+zQDif/AaCPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ErKKjfnE4edAs+NlxuHREWDrfXXXlwv5VsqDCs6vPesKM7235Jy762SJ+Edn48PfK
	 oLUYKBtx7O/wkGBMSOh0xQtzfqz5H3vRZ46xXdvjmQkOvz0h5N3pWHLv236HOR3HY8
	 Qk7xTGJElDxq66ehJ0QDLAwY2HswHlNueKfb16R3Lf5oY6XIhFGb52kGeyoPDbbsmu
	 +rVRGCQ1MIeN6GWiLiKkBdd6+9auS3T+lESqn3PQwG2QWkPR+A1B0JX+++K9XJvqOy
	 fmjs4dbdsBwvj/p5nPc5ljs4XZDVhWvUNyftJ8dwRkqIEZ0LcCZSH/7yoKUapg32zx
	 ojX6IEsaL2GKQ==
Message-ID: <sashiko-outbox-218087@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117021705.2202892-2-hongliang.yang@cixtech.com>
References: <20261117021705.2202892-1-hongliang.yang@cixtech.com>
 <20261117021705.2202892-2-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 02:22:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add device tree binding for the Cadence USBSSP DRD controller integrated
> in the CIX Sky1 SoC. Each instance wraps one of the two USB3 Type-A DRD
> controllers of the SoC.
>=20
> The register range of an instance is its window in the USB30 Type-A DRD
> RCSU block at 0x091c0000, from the AXI cache attribute strap register of
> the instance up to and including its AXI clock status register. The strap
> registers of the two controllers and of their PHYs are interleaved in
> that block, so the ranges of the two instances overlap.
>=20
> The Cadence USBSSP core is described by a child node at its own address.
> Mode strap controls are programmed through the Sky1 S5 system controller
> referenced by the cix,usb-syscon phandle.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117021705.2202=
892-1-hongliang.yang@cixtech.com?part=3D1

