Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627369;
	b=vFMz1oeizmGIak0mVJprKSqCELdng5q72GLugCuw4kk+IiIlRUoXSCTVKmy3UjpAJf+n
	 kWQWSBhF4ExovldJd+4h9PLZqMq0Hrs/64YZhhmlbMVD3ek9TZ6vzychbOknsB0G5VLOk
	 5BUicaMR1GlbsT1TACdmhn5/dm2NO8UaO8FQQzqA1uDL3Q49M5XQwrHwkDVEew4dGhI8o
	 mgK70NnbCcMVpOWOWuUJvx1aYkQoELh5HeHzm8lm1WK2dZYDT4g1vuUCPoryp2UOyyl0b
	 JqAoKeAhG4y5TZvZWT656xq58QzMfdeeDcBVkOS2cnsV9KmHKleWZysnnJwT9OjxH5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Juvk7JTQIBaJlZAnH0fY7SbImjG+HQJtkvHnT1ZLyi8=;
	b=cbEbOBMaU8wTGZoMNo5RMRpnHiaz/mLzVvfHlv3JAhg5VWkIx+mZdwednaeQJRHkE+Sm
	 YVfNQRw2stPAQfb7tVuy6wCOo2PNPJsEX6Acd5HBIEVA+Taliq7lnpPE3OBjc/x7ConK4
	 j8Rt5EyXqFsjcoOZhPL1DrfJU0jj/Ft/edIU5fDBw3Bn5BpQ/uBGJiN6g+xHpayVRG3O+
	 dnUwiyG2s7SmWS+QFAh+h2U/ggySPKLG4byLcQnaTy4XeUW2n+5DaME/1rw9fIqnOJmWe
	 xrLIeAhqGX6LhmfoH9Hqy3rwuhJqDDD5MEZwX0S6+bnpE30hxVeXGRU+TSewhQqlqvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAeYR7dl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C0606A333
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hAeYR7dl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53101F00A1B;
	Mon,  2 Nov 2026 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627369;
	bh=Juvk7JTQIBaJlZAnH0fY7SbImjG+HQJtkvHnT1ZLyi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hAeYR7dlNOzLPrryA8gYxlWFt8Ifem8hhgF6rp6FhJyHHyjAAidibPHXw7DHLtxUo
	 0+7AD+JMW4Rz8OH+omaHkwHUefDxurSKYxDEYu5hCVyOAqigNrWH0FsAYOCI5yQYpQ
	 fTijooC31e7tTNKxfBCB0Eruel03noV/FikjNVzKuhyqLq7a4+lyY5q4R49rDQAJ7z
	 GL0POuGVji+Jg6qqk4KC4OsY+tXC1Rlsg/7HGYH7p7v1czgh4nN2yGNNNbh6cCTAwz
	 ZS6hqaU4DSeiVWWe4Aqx00BZOHSwg12zhxjp5qf3h/mfIeGT80SZJvMAtCa3KMv6ci
	 Iw95QlD2uIqog==
Message-ID: <sashiko-outbox-193506@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: xhci: fix 'num_active_eps' accounting on
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102134228.584032-3-niklas.neronin@linux.intel.com>
References: <20261102134228.584032-1-niklas.neronin@linux.intel.com>
 <20261102134228.584032-3-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 13:49:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> For controllers affected by XHCI_EP_LIMIT_QUIRK, endpoint resources for
> the default control endpoint are accounted before the virtual device is
> allocated.
>=20
> If xhci_alloc_virt_device() fails, the slot is disabled and cleanup is
> handled through the Disable Slot completion path. However, because no
> virtual device is installed in 'xhci->devs', the endpoint accounting
> is never released and 'num_active_eps' remains incremented.
>=20
> As a result, each allocation failure leaks one endpoint from the
> driver's accounting.
>=20
> Fix this by undoing the endpoint reservation when virtual device
> allocation fails.
>=20
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102134228.5840=
32-1-niklas.neronin@linux.intel.com?part=3D2

