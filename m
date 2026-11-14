Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794619717;
	b=bcnDsYU06JB4uruuByLQMJUK9hp2rvqxpJz5i7dtDeKLSzWTwrH9izb67f8Mj28liO81
	 3Q4N/vPWIV3Lf1DGBo+4Nu6236AJr9axoWoMjDAINODvPMgfU+Vm9Pf1bxnsW3QsL/O3S
	 rzzkN+SKdWhdm3Byeer+KkfxUAWCeRGz711SKuYc2WveEBZzKnvxFhcNLTN8GdY8Wk8r7
	 /Z4wv96SVPJEl8IwtqzD9JxOW4Ce3IIiIgdITKTn7FG1Kl/Qg/hmXnugSxyLo8RZHcBDa
	 Bc2mx71Lj6thN1ORGhHoeQfCo3rHKFx3uvGNhi519BnJGNEQ8PFsRmTH102tJ/CtbdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794619717;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/QuWaHlqlE04kudfdrnX33tU/uHB8EEDkgoGPf3oNWA=;
	b=ZjCcanYZbhM/eCEElBociDpaYiMLv64reiszEjnFdBxH9hz5J3Fw7jjiUlhn02KgDMVr
	 T6c64wOtcPUpHofGNq45YiffhTKkc4TfJPMidCKveqzIYXqA+AoOT205VeDDqpBqRshAf
	 UW+ji2rJCerldps3b4nLUP1reKG37wbt8Bf1/l41rjqF7D/xIIufANUe9g3dypiGVmt1x
	 +XiyFt+a0n+XAH4s0rLtbF+zZkvWcOW3zyVkKcLk7mJntoJrVb+1i6/UkYgDn42EdFL+a
	 8pXaQLcXdavfiEOw1oqitB39TsZKThMzZeFny5Cd0ZKEVzDI8Ql1TCjIqzm8H0D8PkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJuCv3Lj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DAF606A323
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dJuCv3Lj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD9C1F000C4;
	Sat, 14 Nov 2026 01:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794619717;
	bh=/QuWaHlqlE04kudfdrnX33tU/uHB8EEDkgoGPf3oNWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJuCv3LjMhHBwnbXzSg/UIArEKpN94XHt3mX4ez0+dM05sbCXwpvD5BCWSfx5FTJu
	 BqivAMFwJgqTsjDkmFrOSV/e+oVGiNbr/uW6uH0c11aM7z5mzkCLNng4e9JNu3PZ/x
	 /yh9KHA5tJi9DbL/3UTmqrY4tErwwq56xZyOEg2XWnuKUtGR5qpuvx5pOmMOn16KDG
	 oedOyyTP5RiFvcOYs0Sxlx7Ut525ICrpc/kXkQD99Ft+xWM4GGhSjhwyBthSDL0/V8
	 RZ7HX0NryMFcY5QlIlnRPw8L5JSqEpfPdRMvyD8Vb8u7bVwi8z6I8d3Zp1CauLHq8e
	 eAJ8DrgjZe4Qw==
Message-ID: <sashiko-outbox-214005@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 6/6] usb: dwc3: rockchip: add USBDP PHY reset quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-6-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
 <20261114-b4-rockchip-dwc3-rockchip-glue-v19-6-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:28:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
> with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
> the mode changes, which may happen when plugging in different USB-C
> devices.
>=20
> If the USBDP PHY resets with the DWC3 IP running, its internal state
> corrupts resulting in the USBDP PHY not being able to lock some PLL
> clocks, which effectively renders USB3 unusable.
>=20
> To fix the issue this adds a Rockchip USBDP specific quirk, which will
> assert PHYSOFTRST before the actual PHY is disabled and will deassert it
> once the PHY returns.
>=20
> The quirk is skipped while DWC3 is suspended, as its registers may be
> inaccessible and the device being suspended is a quirk in itself (the
> vendor BSP enables runtime PM with very short autosuspend as a
> workaround for this issue). Thus the code just ensures the PM state
> does not change while the PHY reset is going on.
>=20
> Note, that the same platforms also use DWC3 with a different PHY
> (rockchip-naneng-combphy), so the PHY calls are protected by a
> driver name check.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-b4-rockchi=
p-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com?part=3D6

