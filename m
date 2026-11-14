Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794619042;
	b=Z7/tcVvh325f//6wZvZikhyb4FADMNVY7ql83ruxqPGn766orCo2F16RFWNGZfdoFtJe
	 U/y5k4qogdQZkcowjc1/P7598lyIlZSMOQofUE0CKnovlyWzVmrUk+9SIb2oAWCbFSUHM
	 f3slW7ZPcmwzzt4CiTAFsvGRtIj+yAKffyOuLPEd4x+DbiscDDoJZVTEL0FG/7smReca7
	 9n4Kh4vTgUtc/oHeuc4vEteh6AaWjlLhrxKY3lWVI5KgLgMqAgYXo2z5dKcSrZ35N1105
	 HfHkG6eGhjZWBBV+Gk1Wz5XhrkoSlSdfllllWJfXfIg4+9U6hykWlck/V/PfiN697Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794619042;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PkqO4foK5s9Q6qK+VQRG9H77ghGpQDOZ7GsJ5ufuQ3w=;
	b=EH+IGW+MT+V8uQi3USUoV7YFbcKrG7SlVxRaeigcbvfEYIsfWylxCz17pUCKuC63Ht4M
	 hD8zAbBcnl1guh8x7KgdbITknPwGbj08VOrBwHdzM6rTPVPqE6sQn6GCZ8Y659tW+WhCp
	 E8tfp6M3jE2cqqCwKb/7OYR67Bnm9nUk2lQmnXs6h+2/sBChcs9zBooYRtwEdXY51uf3u
	 B1rXrGP0xRyPy5G6SmmExBUxJtHagYtMt8hLyEQPUEn2zm49YXpvDRecXuovCdM8jp8Ww
	 6uCvZYgNjGnBeXLSCMcS4gArUuttKbhD2y5Cqo6JqH3UIBaCBt80WJPChx5zTJkIN2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvLA0p0O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4DF606A337
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XvLA0p0O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C551F000C4;
	Sat, 14 Nov 2026 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794619041;
	bh=PkqO4foK5s9Q6qK+VQRG9H77ghGpQDOZ7GsJ5ufuQ3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XvLA0p0O5ZDC1Nf9qSwMNR1rZ6xOreZhVKpaO7yVbsOa0TwmDicJ3y6sZvkMDXi4N
	 8nhLZ50ZskoNvo9OkZD6MITznTSEsP99P7Il6Vd8VDNB9/ahTlBP/cgGxhjwhOXNgc
	 vSDFc8bgaIbp74ZN1mmIYaCk9EsMVdn+Av8gh+us9FZIt/zDgPsCI9dS6ze531hx2a
	 nUIxwNA4wEICs8R+3hGgVLwAhMbWdkMbDmJt30p8rJbf2kYu1Nh/sccZHbbqi486kA
	 JC12K7xSnxF11kVdPOyRU40Bnw/O0QlzkqS6ifK8r3QX738TGZ5hW2NXU3LoqQJtCi
	 dYkx5MbNuLNBQ==
Message-ID: <sashiko-outbox-213998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 2/6] phy: rockchip: usbdp: Add reset hook support
 for dwc3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-2-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
 <20261114-b4-rockchip-dwc3-rockchip-glue-v19-2-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:17:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When TCPM (Type-C Port Manager) triggers an orientation or mux
> change, the PHY needs to reset. This results in the PHY no longer
> providing a clock to the USB controller. If the USB controller
> registers are accessed without the clock, SErrors are generated.
>=20
> This can be avoided by switching the clock provider for the USB
> controller. But after switching the clock, the USB PHY sometimes does
> not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
> due to a clock glitch and after some debugging figured out that this
> can be avoided by disabling the USB controller's PIPE interface while
> the PHY reset is ongoing.
>=20
> Implement an API that allows the USBDP to actively request a reset
> from DWC3 as a quirk.
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.co=
m>
> Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-b4-rockchi=
p-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com?part=3D2

