Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794856327;
	b=3fS4Ra6efQ2He/VEfoMxWcRBc5zg26djut9z8y6laSxG2Up3MZuzt9CmbBl/aJ1oJLE1
	 vueeEkJZG3032HorLJM5/tl4R83ogL9IEADBOSqzLTbpHfmJ14T+cqG5f6eHe7SI5s0OF
	 RetBcpl5wElnEdCmua1WNYPueO8A4fWVztdRpUtKHt5EUMi4xAB5dS6foJJuWHpvIwFmb
	 DnT+rodocDMP8aZw7ZM8aEcdwKI/JUgTCaCf/IHpuY/Gs9W7rpeuJzTWmAoP4aN7wmHev
	 qj71Qt6HIELqIxhu2tF+1gZHLUdCUqYd0VT64EdCBrVTdTpdHhP7zPsj1DqO3PD1niA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P2lFtyIvh/sYjfzjPPY2Vbuc5r6nPOnsJFHiPVRtCR8=;
	b=QQ4tus+FxlgTOiIVNVMkGrZ21OXw4mSzEDrKY5OQvKu/jiQ+MyNiQlgXaep2Ta6bSO5Q
	 ch/mSyXK34ZxdW0cMW667EzZb2zXeSClbrFcfJLXVR9mHQHvTzxmBDlE8q61mOPzZKxKc
	 RmL8WChbLIpjcQ0CzAQJvUyKwNL4Qikt3+mYaLoyZjm1mWStMqBlzeuTSdC07gozVx9kl
	 +OSwMEFCTk8bygpKISMkriiSJyV1s+jQ6sYrS+6yNmNdbUuF9K1SneMTUndZpCo+UbIVS
	 vEv4MtM7e9P7x7CQf8knS0XgUPC+tMwefNSxzXGi00WbSvbIE+VVYfCs7wZwJagB3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtjikHH+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB50606A323
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 19:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtjikHH+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E1D1F000C4;
	Mon, 16 Nov 2026 19:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794856326;
	bh=P2lFtyIvh/sYjfzjPPY2Vbuc5r6nPOnsJFHiPVRtCR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XtjikHH+mUn+oWCFrw9nklX/mqRDWvbP1v8T5cNMwsSBLBhK+QvLqegBwfONI3du8
	 UbDdpVTnZso+GtVWcYfEuN3l1CkKNsF0wVQbJ/yuFGkB2LZfinyFbzHUJSYdSf9fwm
	 IXJj4dvEJr/S0wwWoDjD7GWd3XZPvP732xvDpRkHVAUg/NxD/qMv4IU0nvTzUK7Wnf
	 +lkfVi4XlBeHsrndFYa7v5MvPlmZlRA5gEXX584CuZeJLJXmh2FM05ZS1fBKbRYST9
	 v33VG0GNRqjsqYPPXCz6gT8XRv6gVn6U/yK6d6Og8HKvsisB4hk0oT9gBLF97tBhk+
	 hKlRb7FbpN2gg==
Message-ID: <sashiko-outbox-217544@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-1-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
 <20261116-axiado-ax3000-usb-device-controller-v5-1-49271ed5c793@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 19:12:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a Devicetree binding for the USB device controller integrated into
> the Axiado AX3000 and AX3005 SoCs.
>=20
> The controller is based on a Corigine USB 3.1 IP core that is
> dual-role capable (device and host), used here in device role. It
> provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
> supports control, bulk, interrupt, and isochronous transfer types
> across multiple configurable endpoints.
>=20
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-axiado-ax3=
000-usb-device-controller-v5-0-49271ed5c793@axiado.com?part=3D1

