Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299477;
	b=hCEQ1I0vRlm3FAcsH5paUD377TC2xAHgQYUklr1jCiYn8iFV54Pc5j3+lKlnvMGfNc7D
	 DZ5RJnUlQTexdGMYo59GIhrvFd1ENhxSp9ecQz/JhvLDya2f/ePhNLr493ydsJpfJGf6X
	 pQWszE5/NhftnnuDo7gVYKlg/zlexCkuFLQjmOD3KkW7VUtXb9ujrH6/afi8PLqFy5CYq
	 AaqQIh+JQvjZ0Fn3wlsL4JceIwicAJ3WWN4YsDQ7E1tz+Qa0JqAEiTx4ZCG5+77y8okfv
	 q5ytjT/zW39xy1ny4DTFiLGRIQxZDyRbKpY5N2GM/orr3rhOKRBcCaM8p2ayM1Q7VGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299477;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yCdSOjyrzy+nL7D1/QkXehe7bWjlter1bYPWFX2snsc=;
	b=YxYaKT/ksnQuu0tayaVzQWuVhjj55kCebYQs807TTEbzoOgWPD/AhFquxg+XdC0hmzk4
	 xmmws3hIQDPhal9wn5/wFQrclsKz7Az+xp1jGMWHy2lilnX7ix1oLtD8a6wkPJqjQbEGt
	 JTx/Ic3X/SIzEiCT3HhvcX2PMO2Mb7BxD+lD8/uokZ6HrakmO8ivZFeKPHnOIg3VO+sE7
	 ysoFaVKoe4dn+1ZS+vbcbTyMO15SPaJZ+gJv2tnfxBRr1BqdPd9xsjPMkketlfSPG6Sbq
	 fdkN4RHJiknn6fF+a05ZqPMBvI7NMS/E6YjE+jzIkRoIL0yNgon/osaXnAQM79GtMjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jw9FWq8j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB995606D002
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jw9FWq8j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAA81F0089F;
	Tue, 10 Nov 2026 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299476;
	bh=yCdSOjyrzy+nL7D1/QkXehe7bWjlter1bYPWFX2snsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jw9FWq8jur1ActulLQ/bSRT2IHzqeVjcO+hZKIPdW1t6pouite8G6KfInyYNpzk7H
	 dBw+Y1t+914lUJyM2dcgMlJpsaVbz+kZvfmf0HnSEAfQIhsmUIQbRHjTsMRuud/cg3
	 6FWBMSOjoFW0ocwZYY9aFpLFPfON6emQ8A5V94FRlgZt7u03G8KVy9nFnM1ZcXot1g
	 1LTSVyjPaRRMdDHBJM5GxeIk8oSSR5qalaNg3VPQ6krFAOilpM2UjBT/WlK3MkFyov
	 bT7fbhEPQsu9V8vU+ukoCj6rPnOWxxlliFBVr9UQca4DYjw4geom45v0MrUj1tdwhX
	 azdc16IudZCNQ==
Message-ID: <sashiko-outbox-206624@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Describe the USB3 Type-A
 connector on Orange Pi 5/5B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-usb-port-pairing-v1-4-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-4-9307e29d2ed2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:31:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> The upper Type-A port of the Orange Pi 5 and 5B has its USB 2.0 lines
> on USB 2.0 host 1 (EHCI/OHCI) and its SuperSpeed lanes on the
> SuperSpeed-only USB 3.0 host 2 (xHCI). The lower Type-A port is USB 2.0
> only, on host 0.
>=20
> Describe the upper port as a usb-a-connector linked to both
> controllers, so that the USB core pairs the EHCI root hub port with the
> xHCI SuperSpeed port. Without that, a USB 3 device plugged in at boot
> is enumerated by the EHCI before the xHCI is up and stays at high
> speed.
>=20
> VBUS of the port is not switched (the vendor DT has it on an always-on
> 5 V rail), so it is described as coming from vcc5v0_sys.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-usb-port-p=
airing-v1-0-9307e29d2ed2@gmail.com?part=3D4

