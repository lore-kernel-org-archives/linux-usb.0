Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813205;
	b=Fuj/1omiVmY0gLnDah3J9tIZJYmy00ifJtWP+mB/MauPHGu5l/oVsU5aZ0+mpdVK/f3C
	 EjeWjZlhnGmkABqpOyVwZYKJCf+u8y6dXWDoB6VcdqCHFBmWTkKQJWahKG+4fSydRHvd6
	 /wJ5IVRt2if+OAlKX3MU+g8orzK5TWWkZr/JAhHt2/14110AIBujVbmTNS2OcFSfBTSYz
	 iYyKN2X+y35DbCAfD0SXEF7K65V4HfuN5Q2Ll9pBASMvKwkJNRpMpuqEfT6myzB2UyLo1
	 Y6c/ROPhVonxbUBQyE+vWWC+z4p2YE/dVEg2H5vYOBFcHuE/TGf7qQiA4j/wDO4c3Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813205;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IB4+WbneBRZhAYzhkGw5yxYiNeaMmC2DlSO/YMq4WkI=;
	b=nJvLp6Mq0STPFeaXT9sJ6aLFcFzVo/AHfeYekW8mSO31RfCqVSG8+MKCiV2W2VdRiYyC
	 CDLc3/fuAM2vOJf8LtWF4p8V0IkWzOgjFSqWWnnN6/GEP9NDQmGF+kNNi8KC0W6zatrlX
	 q5lxb353OX7NXt+jdtKeRUKmc1HzO4FGOdenTcij67ebhUsXVi4A36IEfwyAfbgDXopDG
	 QKb9fpbO4OegzIpXzRmlZjcC5zGaA09IExOUDsajyV/tLDaLASmPR1C8G5ntZzH+qAZ8r
	 b1Yu8wpac1GX/jOASBBfnMT2ArwnzK/UU+OkZBVP0Spx2P6n1Dz+juMJy3ln0Br9Lfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mNog2fPb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496C606A32F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mNog2fPb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F8E1F000C7;
	Mon, 16 Nov 2026 07:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794813205;
	bh=IB4+WbneBRZhAYzhkGw5yxYiNeaMmC2DlSO/YMq4WkI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNog2fPbWnBxKJUnMdt2P7QciJ4RIQPiCUa6hk98zZw/m4QS9kuBtbAqCXDQ3mknu
	 sjfKurRCwLh4uKuLmkDKx9/3WDYRzN0x5K56txqkC8YBF+/vEfDrugZiCPvAvU8TkB
	 ihrguesgZMAW8bLLLkKBwFsU/GqI0pRtcN8c8KEnP2znrvQDwl2FG+8R7bvGNTIIVG
	 P72qFZBYGXzekSlXiaDF4y11kJQDG3Mv6O+Yl+Pb1HM6dABytNx9q8XpAZzGD6dn5j
	 5kYV88ljzAhawq1KYgCncxU9HsbCw36OiTO+FOzRqSF68NqyaFXEVsk6B8ZPgqG/cl
	 bY58Aov22vpDQ==
Message-ID: <sashiko-outbox-216395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc2: gadget: restart descriptor DMA bulk
 and interrupt endpoints after BNA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vadim Yuzifovich" <vadim@yuzi.co>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116070433.2813951-3-vadim@yuzi.co>
References: <20261116070433.2813951-1-vadim@yuzi.co>
 <20261116070433.2813951-3-vadim@yuzi.co>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:13:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In descriptor DMA mode the core raises BNA and disables an endpoint when
> the descriptor it fetches is not marked host ready. For isochronous
> endpoints dwc2 handles that; for bulk and interrupt endpoints it only
> logs the interrupt at debug level. Nothing was transferred and no
> XferCompl follows, so the request stays current, the requests queued
> behind it never start, and the function driver waits for a completion
> that never comes.
>=20
> On a Sophgo SG2002 (DWC_otg 4.20a) with a video pipeline loading the
> DRAM this happened every minute or two to the bulk IN endpoint of
> f_mass_storage: debugfs showed the endpoint disabled with an 18-byte
> REQUEST SENSE reply current and nothing done, the 13-byte CSW queued
> behind it, and f_mass_storage asleep waiting for its buffer. The host's
> command timed out after 30 s and it reset the port. Read in the BNA
> handler, the descriptor is 0x0e000012: host ready, last, short,
> interrupt on completion, 18 bytes. The chain is written completely
> before the endpoint is enabled, so the core fetched the descriptor
> before the CPU's stores to it reached memory. The next patch closes
> that window on this SoC, but a BNA on such an endpoint should not leave
> it dead on any platform.
>=20
> When a bulk or interrupt endpoint other than EP0 raises BNA, is disabled
> and not halted, start its current request again, which fills the
> descriptor anew. Start it from what has been transferred of it, the way
> the next part of a request longer than one chain is started, so that a
> BNA on a later part does not send or fill the start of the buffer
> again. Report the BNA with a rate limited warning instead of
> at debug level: unlike on an isochronous endpoint it is not expected.
> Signed-off-by: Vadim Yuzifovich <vadim@yuzi.co>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116070433.2813=
951-1-vadim@yuzi.co?part=3D2

