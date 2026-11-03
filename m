Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714369;
	b=n/jiBvAdADEvcwyRWaHjIrG5zto/ZtzsvZ+WXw79woMf/y60l9CG3LeUBx7LwD6vSvhk
	 kVYUjml8TNApUhkeMGSgEArQRpMifUHUPeQxe6RNXYyx5CJHUb+KLUew5Yxp01l2RQQya
	 ibwNCUwWyOdLznm1tGgxo+Nk4VRpGtDmarIBybRKDtk93bUlieOKVz4xTLYLD9cZegKWm
	 rUUoudJO9j547rmyWF1EI/N6cAA1oY7Ao/U1ty3nGva9EEM+/iNBR/ibt1iGcHs+yKxO/
	 NSTewRWgRI24I9MNBcAkfbZFc++SF2hD1CP1PIvWZUa+82GPQFkOVtQIV+LFSpWIj2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Mnk5NrVn8tkkrW6+IjezohHH7TguWaTrtfHRMZ6UPQg=;
	b=i0xLPPzmYwu/Y1pAe5rE2fUdYSTHP9Sq2eUroasuQtiu3twi0izxPMtqgZaEtlD6kX5Y
	 oAWMYK+7sPVa6hgCiWRcUFvrxb4tkX7iJCAYi7xfYbTRRfCSe/srqEaaiH+X1OPLKvq6L
	 C/hSo/KqHl7tj3wbLPEnInc13Sh1dzlPThJyZ0Nj0QT73xbk9sGZoiBiLxe6lfye68GB/
	 kK825BHaLLXbyWsbbhpqJuZc+3m8u++5IvSuCZQGP7rKrsGOlbTBoyiYQqTxcILCSbLSF
	 ruV9896gGs+Znn572+2fGsa30Jvx/uAusUZt3s4TUbgfPTB2OGiyDhTC2WU3bqMVBIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJiXqyOE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A61606D837
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJiXqyOE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8F01F00919;
	Tue,  3 Nov 2026 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714368;
	bh=Mnk5NrVn8tkkrW6+IjezohHH7TguWaTrtfHRMZ6UPQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJiXqyOEE7wyCCgeg9EuzmEKOKH792MPJGq+NFFnBXK3PFnKmfQkWX7Ddag44o7Jf
	 ayokleY6XdC5hCGpyhVmG8B3sFJ3rDT7chwWP9KlZ58yMjf7DYbpVEJl7pz6uVZlUa
	 uAA+QtXBmPMhapTjystktqMgtQxXDWh6aqLMMTO30ATBx1DuVOgP9T9MyvnY5YoVT/
	 o442HEKiU3W+ctAIm4toyzdb3xKkYLUGjADYFo3XxWGrlllMHcQPxrcbHxIn2VmUsn
	 yXNu0Z3w0NSfQoGrALsw1OJoB5lxZKQ5iHP/iH3YJa/VkMEL866vCzNx5Nfkd5YFQ2
	 ZlAG3dRP+5hug==
Message-ID: <sashiko-outbox-195410@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Leave the mux to the altmode driver
 for alt mode partners
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103135046.1654-1-26rote@gmail.com>
References: <20261103135046.1654-1-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 13:59:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 25a2bc21c863 ("usb: typec: ucsi: call typec_set_mode on
> non-altmode partner change") set TYPEC_STATE_USB only when the partner
> flags were exactly USB, so that the altmode drivers set up the
> switches, muxes and retimers for alt mode partners. Commit 226ff2e681d0
> ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
> turned that into a test of the USB bit alone, so a partner that
> reports both USB and alt mode now gets TYPEC_STATE_USB as well.
>=20
> On pmic_glink platforms the altmode driver programs the same mux chain,
> and the two notifications are not ordered. When the UCSI connector
> change comes last, an FSA4480 switches the SBU lines off, the
> DisplayPort AUX channel stops working and the sink is never detected.
> On the Lenovo Y700 Gen 5 (TB323FU, Kaanapali) this happens when a
> DisplayPort sink is plugged in during system suspend.
>=20
> Set TYPEC_STATE_USB only when the partner does not report alt mode.
> USB4 partners keep TYPEC_STATE_USB, as they do now.
>=20
> Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific comman=
ds to bitmaps")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103135046.1654=
-1-26rote@gmail.com?part=3D1

