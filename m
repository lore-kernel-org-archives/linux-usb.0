Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931218;
	b=EVFnKOHtLYlCM17eWwADiA9erNKHj0oYmB5w+UJsh6ROOsdXr+Cg3A8mlwJskBymJ31R
	 bFkONT75wsjvTs7yyfIXgTmho00tehrKPsF3dfB1TWqydWaXNjiq1AKl0X++1kepTYIeF
	 54j/AejLSVIdPX/kGDoICswaycz10tCeKWVz47Q8oQp5IVLkRLuYTrMGURuaEyn8HKmeE
	 f2d0e2+d7JYV1f/p4SGEVTjJ6NgUxz7q/oVpUg5nAhtMQmVuX9xa0xboo3QPy8WrLa5Bb
	 uOqvK2U3DUJ3OD164cCIkqKDCb2pQQ2h0X5l6MSN9KL4CgSsYNqpBANj8QZtqXC6cZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931218;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7RfI7CB8wqF/1X0jFLtzcp1i7u4g1HdjaA3wU2s5vSg=;
	b=Fdm11IWrQJW/gFWDfeDwY3b1W5HovX4fozhjftSQEqhrbX/ZRjtzssBbsZn1Bm3rSt1e
	 B8cDih3NRanBt6WrEK6J7s5nF8GwM4X3nXFh7fFTb1n4mTdb7RI7cowlqI/UwFG86hqlS
	 K06sZ9Zny6Uw90SdLiswAnyvzKvTibB8i3i52PMKlMy1EVvHeDXGrw0AX0Ge0HFujpmpH
	 2/6vYd1nj3aSgyy+BWtmNhFS4gq9v7h5m2WJ9RVL1bjj2QLkwd6QZaSDFzgZS05eypgcr
	 VIUL/jRoiUA+ZdEUiiIBTIuJRkYaaVBVrMoqfRCjgknA4yOrjHUCKE7tUPE/y9LXDBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GdGVIS3E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC8606A334
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GdGVIS3E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0481F000C5;
	Tue, 17 Nov 2026 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794931218;
	bh=7RfI7CB8wqF/1X0jFLtzcp1i7u4g1HdjaA3wU2s5vSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GdGVIS3EBzcASOG/6a5PSOUhd3CNj4/fOgQY2FZHbCcr3A/Q70GmvfLjK4y6zE8yx
	 BQeX64tsVzPE8N7O16vJsh1uhvDPTwy0oSFcScSxjGgikAQ+nOuKasmzBGH7U/nZJj
	 2q2u511PZ8kf1y7SEUMkkBBNASta19VutGLpy+Mb+oyTpKllkjGjl9wrQ8PRu+xfX6
	 FknELU4xW9mHOHNZxInx53SYBa2xIkU94iHnGZ6SxBJI05UBi8GiBi52kFG8EAu1Jq
	 k8d7tBgSDImhaEU+YqBXBPrgwm9etr7bqa89a16xeZgBLkV+jLa3TLLtPVgTVM4ni0
	 2gYmvuqxQRa+w==
Message-ID: <sashiko-outbox-219124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] usb: dwc3: xilinx: Add support to program MMI
 USB TX deemphasis
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117150219.1326693-5-radhey.shyam.pandey@amd.com>
References: <20261117150219.1326693-1-radhey.shyam.pandey@amd.com>
 <20261117150219.1326693-5-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 16:00:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Introduces support for programming the 18-bit TX deemphasis value that
> drives the pipe_TxDeemph signal, as defined in the PIPE4 specification.
>=20
> The value is supplied by the glue driver through struct dwc3_properties,
> which the flat model provides for core properties the glue knows at probe
> time, and is programmed into LCSR_TX_DEEMPH during SoC bus configuration.
>=20
> The configured value is recommended by Synopsys and is intended for
> standard (non-compliance) operation. These Gen2 equalization settings
> have been validated through both internal and external compliance
> testing. By applying this setting, the stability of USB 3.2 enumeration
> is improved and now SuperSpeedPlus devices are consistently recognized as
> USB 3.2 Gen2 by the MMI USB Host controller.
>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117150219.1326=
693-1-radhey.shyam.pandey@amd.com?part=3D4

