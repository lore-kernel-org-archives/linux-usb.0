Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467082;
	b=Yu7+ZGwuBjd9/RKVmQPLIybLrl2YsbznxyIEigwjNMZkRct4uWqTSFuqN+mHIGqCkIJN
	 Vo5ALrZPQWokPRtKwurw6+gKU8pq2ClQbXnM5j+Y4CPrNglvQrW6YIU/wJQowM4uYxNGz
	 gorze+DfIziEUvIi76ZUWdqlLB5Z6X7OdJy/c55UmA1iqevWkAhcid8Ct2sUSO19zan0+
	 HzasphlYcw58DZ3cnUr44caxJdx+lcGHOhfNdTl31XcuEp2etiu47x43FHh1p6HyLibTf
	 LCgRTy/ZlJ2t/q+CQvwyEIqdq02dxz1G+hwOIRsLoB6/LKTlgE7ijHDZR4pJuH6UPUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467082;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=376wwEGJ6mRi89aXDCl1p42wAoJ5PFJHFbZVZyV45Dc=;
	b=dIESi3KSxuXlwM5mjj9PpQuUnjtpDbM2yyX+IhZHtvbRz1PUF1FFf59gxAN/Sa3TUm6a
	 fuQMCEYrNEd1tnNiwXjWFcxNEeFaXjZqXuj02Gx1XTxmvPJeaBkCiYn5ye8/JOGaFF609
	 ROH+wYmGBuHQW3wkLhkRVPyfWjwnfcdEssaMaBjty9p+p8bFpUzD3PkuJoFpxjJ/UoB8k
	 NovFpZmk6cbIoBaArA/BkIDzkQKgLUgEjsXZEqaTI2V7qA0RYfjzwowzJJGMyM3ROLkF2
	 bfIIw222P9ctMgJmqZn9/8b/J1cgz0INkMRu7qbo6AmMawPfiEBmnA0XGaPiUHbSEEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtDODjPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5F606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PtDODjPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE991F00A05;
	Thu, 12 Nov 2026 07:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794467081;
	bh=376wwEGJ6mRi89aXDCl1p42wAoJ5PFJHFbZVZyV45Dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PtDODjPTjuBwYw063OCEjSSesycKgVhESUvIfT4Uxrrh/2Qx/eX66jBimLesf8XCs
	 of/+TmRAoknnGsbKuemxH60SMfdJ8RtOZt8z6xYYx2eiJZ0tKkEagfId6LlD3a4vBz
	 152E31GNMXruAwDl137Bjl53MiAHsTL7+F6K8ugXo9YUB2b1CtKNO/pKQ8Ir8PDN5L
	 zH2J/NJCeUDKF1QfzWTd9YjwjyH113fdt/6YCpQHGuzrfaiEBJXD9bN4HRQyJkXjuC
	 pZVnjxNf3TSc/h9yeimhAohUYpNUiyd9qz3kxs3JqvakPb3NKJP/2DI3MyMgMfbBlY
	 WL8UySwvd+DRw==
Message-ID: <sashiko-outbox-210565@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: stusb160x: disable the interrupt before
 tearing down
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112065620.34269-1-mhun512@gmail.com>
References: <20261112065620.34269-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:04:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The devm-managed IRQ remains active while stusb160x_remove() tears down
> the partner, VBUS, role switch and Type-C port. An attach or detach event
> can race with partner removal or access the port and role switch after
> they are released.
>=20
> Disable and synchronize the IRQ at the start of remove(), before any of
> these resources are torn down.
>=20
> Found by a static analysis tool under development.
> Not tested on hardware.
>=20
> Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C contro=
ller family")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112065620.3426=
9-1-mhun512@gmail.com?part=3D1

