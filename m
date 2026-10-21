Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606259;
	b=Uxe+gcmwk4LK4sb3/hp2JjrqzGXS884glQ4OriRyXTCMldTIkIBazWgVLOgHWrC05M0G
	 f1BTSPXxu5C/4vWbu/2xNj7uKRU7t5bwtX6GvEXn4POPc7BZmHAM8PhKvd+kdNqMTEvlH
	 jbK1hzuJ1F4j8GfgxtPTzumQTH+xUlT6LXMEIvVwgPvZf6dYu744MwEYZQqYSs9717SjQ
	 gnTvYwIb6KFD8njC5RX+udrvFOpP72FKRo5JIjrb9MFGAEiB2lWcMY0Yyt/khIbUmmqPd
	 QJgOelhl6diL8qws/V6trNLl/83pfwj/p01fe5iWu+Q1OPJ4T/mMTUaN7o3m+5ALCoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606259;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MXecBpZGiar8FlCjY0+DLEcUIXt/2IzzIDS3/3gSbOY=;
	b=QZ39X//6twxWwQJDuJESRCCDnfLTb++R1D5Byg/8XpnYoLz54SbhIRQq2t/ItY+OvHvZ
	 UpSdqjycU+mkoC9+3Ujt5HsJZnE5B1oBkf7Rh/SWWct1VUb9BLnwmZHc8b9FZegCzDNq9
	 x8enGfy8k3/mDA2Sc8+PEejgnBxCW0oMUvQzbD3uOu5Y0UUNq9Alf1ASUdN33hKt+Kw5H
	 1b8NN9mFHqQmBDZ7qG/MC6ghpJ1staDWKammljgTwtU+/tZMywsUP4ByPWfeY9yAf01Zj
	 dSzzYltE/46Hvaj017FWyMvgalB/7TtYzhBtg2GmQjT57oGz70eR1cUXJOyfpA90AOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="dBYiF6/v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD35606A322
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dBYiF6/v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B8D1F000C4;
	Wed, 21 Oct 2026 18:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792606259;
	bh=MXecBpZGiar8FlCjY0+DLEcUIXt/2IzzIDS3/3gSbOY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBYiF6/vu5psL4NhfcZOcc2G9a3P56bvsFQaUZc7bsh5vbLKAZgzZac/GDxvNXs/g
	 g7go6CKTjD0rdU3gkNIbP5q5ayjbLCnX0BPygEMKkV9U0uwsTLhjgbobvkEWbdW8D6
	 hHXWycusmWk/MhovL6tmPEiV+QqnItWDMOAQ5g28PKTG/pcPZTQEP1/t81DOA+Du9D
	 co1PK2eFRwMKlhFZK4e/zL8JYpv6suqf+KM0dDIWE4S8wZUkLze1Gso0ZWqtZtqHbV
	 C3RNNUvE3UQ0+/CC9tNy+BFnEbwLBlda1FnuuJkU4QgPIg7BZGspv4g/HL9YhVsXXX
	 GPhxudwS2++ig==
Message-ID: <sashiko-outbox-180542@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 1/7] phy: rockchip: usbdp: Track PHY power state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:10:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Track PHY state requested by software for DP and USB3 individually
> in preparation to rework and fix up power state handling.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D1

