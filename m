Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621100;
	b=rE55UeMiWklCrQa9oYWVRoJokD6ZLkExWnbx467DF4+DCuDlVat1LXbOvJauq7BJh5NB
	 9bhtf3BsNS9o8O9yMd0G67cQEI7IT43zcCwY+qsQ8MBsmIS8mptcTLkyloGizGyXY9Szo
	 zC26KJS21kPcue9QlEu1aqkDXSU0ShULW77XjwafD8GCDw6dNKevUvUPixpGnuyOrlF8L
	 GKsYE4ZGs1wKAH6KozX0NrHuABwFxqD+lzKKVPW1e8AAKnQj8ID7K8iq/hLBRT5m3p+Lg
	 eTSrSsnU9DNYpbEWGi0mrTTrzrumLXne47qy1d5kfJ9sMA0BwfQDh3H1AD80KaDa1Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621100;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iOE2LDywnv2OowpVHtdspiQ9Db/Ete1DE9pMR2McCnQ=;
	b=OXNUbwrJw8Co0LJ6Qp+lfaOHuhF+Qj5ElFdJSjHOr0RCxlXdO6g39zQBXszl/YvMTG4r
	 C4r9JKTzi5C2J3pnvtiDR2utXw654o9gMvQeW7tDqjkQ1eQDl0AKZ5aZKqNAQd5ElGx7D
	 RL8DdCvBRJulaarw034D0jvxUDa/XFAHmAY/frBY2PBSihWlMm+msDokPxStWbo7UvIGI
	 eNWW0xvItGeV4ueWPx+eAG2eWk9nq6KdxdFY58mxFlGft9yC3A8L1Mgq7jxNsBmgLRg0J
	 5EtNnTo5pYK+lbCowoLcUaoRvtLR23rdq66yxjbejQjaqhxX+X2hoHmRvGq6Ayd5EwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPd5txOU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E535606A32E
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TPd5txOU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD5A1F000C4;
	Sat, 14 Nov 2026 01:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794621099;
	bh=iOE2LDywnv2OowpVHtdspiQ9Db/Ete1DE9pMR2McCnQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TPd5txOUJbF7i2TQ9+VtpTKXTwRv7Pq06vzrsjKnFQfFlUnm9i8AbuDiaRj7BwO7N
	 B91qMmHsBhblpSL1n6PFgZiU2j3LRTUZYdAYCEjuykqeItv+M1gsNr+R501nBFIuS+
	 VJhZl/hpbmJGtKOW9Nibw0EYM7B/rCeMtIUq4VZZSsD/EdtMr7846wZ9T8RdwpKZ5A
	 oNN5KK4SHEuQQbD60hW46vYs/CxxDjEzt84afQfpwJYYBePZzbUCxD2YqrnmmHU94s
	 3qV4atJ+TjrCpNl3ido/Q6SwlDrDmG323j0rFYF/esUhuflAvacdDGuNMFZmKdmIBt
	 CBZ92kltdNSAA==
Message-ID: <sashiko-outbox-214013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi_ccg: Don't probe GPUs without a CCGx
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hex Lindqvist" <hex@freenixos.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114013243.1240146-1-hex@freenixos.com>
References: <20261114013243.1240146-1-hex@freenixos.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:51:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The NVIDIA GPU I2C driver adds a ccgx-ucsi client on every GPU, but
> GPUs without a USB Type-C port, such as the GTX 1660 Ti, have no CCGx
> controller, and every probe fails with:
>=20
>   ucsi_ccg 4-0008: i2c_transfer failed -110
>   ucsi_ccg 4-0008: ucsi_ccg_init failed - -110
>   ucsi_ccg 4-0008: probe with driver ucsi_ccg failed with error -110
>=20
> Fix this by reading DEVICE_MODE first for clients created by the GPU
> driver, and returning -ENODEV if the read times out. Controllers
> described by firmware are not affected.
>=20
> Tested on an ASUS TUF Gaming A17 (FA706IU, GTX 1660 Ti): the three
> errors are gone, probe takes the same time (one timed-out transfer, as
> before), and the platform's own UCSI port and suspend/resume are not
> affected.
>=20
> Assisted by LLM.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
> Link: https://lore.kernel.org/all/20200922054338.GA588161@kroah.com/
> Signed-off-by: Hex Lindqvist <hex@freenixos.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114013243.1240=
146-1-hex@freenixos.com?part=3D1

