Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507579;
	b=u4cD1AIEkYH4umHYmsPxZ5ZpEbbT1P4fxvdH8o5ryHzaJqgiUOtIM4XdpgPzcdF7XFmW
	 4f09EhcwgutGy7j+SSs+KW3PzeoMm18yzQfDb8ggTmTa8bLT8maVfOiL+UoQvsCI2gI11
	 IuwwoHqobFk0UowRSzUqB5rx9x4GMjHazzkhoQv5yikDWmsdc+FZZ4E8KjySlYQyYhxIg
	 GbuEW5LU5wtR1+Z8kpTVS0tjcSrog+JJhwSpGKvBSStkVdZVLuxVAKhoM6ZSknM1RknLw
	 T8+7bmsNeWwfv6IdhZ1f4+bGQ13donheslPSrKbCHS0BouQ3+tcNa0OKkV+6UWgz19Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/pDrTUYepA4r0NUCgPkfINZ6YvUsRXB4qyVIXvCub58=;
	b=GdTALSEePxijEkttpaLFbcsLxIyqrSJjR0YfPETaLzR4Hzo8Xay0FPaV/15gM/Bt7rjP
	 4HdntT8MJVmOIOqsAvVct9gd+Cd9eB3kPFy8qOdTovyJPkdHyzVOmZgVxoAZ8comUOfMx
	 OHvUqeZlXIA87LXcnbfx9DbkTq5Qr9LbbxXf3lzuF0A0s31Za2HRLWxMqyqygTo2mTyTR
	 z1FjcDLrrIAMmk8V8Oe9zBdFDZeZMIWq2tYmSJ25Vcd6E2OZ1ULtK0VPw2O13QEJgK2B0
	 j3TMSe9XdClkZiCAR+KbvniojVTTJo/xJqpGDZVwabWuAwtjm3Hf5CRFkD1XgfoDPmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpDOQMqL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A7606A31D
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RpDOQMqL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ABC1F000C4;
	Tue, 20 Oct 2026 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792507578;
	bh=/pDrTUYepA4r0NUCgPkfINZ6YvUsRXB4qyVIXvCub58=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RpDOQMqLAUtJvtJR2DwtrsdifwVnfElVA9KerNGIH5T2KFjcoAcW0sKH7s76b2Db4
	 UrV6jkaMTjqH3u7lMhTKipT9j4n2Gx9yJ/3Zcs9l8xkLmgn/4XDECtfEpQ010sicDY
	 FeY/WY31GScwLagJcc1IbKvksAPjZHiKYrE0+Ty+cs3uTQ/fr7tsJWbP30jVc5l1gD
	 dd1Yl+CCqBtUHLvgJxuq5FhL/vx4t2EAOmVeBTe87YhXeBzwWGGtBR4ohJA+7wIskF
	 FbIyTYVoRxA5LluI46rT5GlnCE6bUVkhuekFp2o4r/POQ9VN85x1DTzzR1BXX/oO3z
	 QltzjyNzf5ODA==
Message-ID: <sashiko-outbox-179190@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] usb: usbtmc: send a ZLP after a full last packet in
 packet I/O mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-fix-usbtmc-short-packets-v1-4-903f4d029193@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
 <20261020-fix-usbtmc-short-packets-v1-4-903f4d029193@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:46:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Rigol DP800 waits for a short packet before it handles a command.
> A message that ends exactly on a 64-byte boundary is never processed.
> The read times out, and once the next message gets appended the device
> shows "command incorrect".
>=20
> Send a zero-length packet after a full last packet in usbtmc_write()
> on quirked devices.
>=20
> Tested on a DP832A, a DS1054Z and an SDM4065A-SC.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fix-usbtmc=
-short-packets-v1-0-903f4d029193@tipi-net.de?part=3D4

