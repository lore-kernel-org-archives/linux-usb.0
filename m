Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419050;
	b=dBGB/5iQVY+Od6EW8oiEb8lTSyUDJ0v6HxYMuViyw0X2+oOQgENo8LEZKByyKl4IERDL
	 fLzLHB4XqGj3ifvYF+SCM53y19EwYyn0U72DheEX2+ZQkZ9aQwIChqz6rP7VNSatJnFNL
	 YM1wI1RcQDycMELkQcLgMrhMAoy85/+HGmQ22fHrHekoO2bg8Ib/baQVpKMhB1sD6YKmM
	 rBiQkRHW8mqj+rKd5nfTLi+jSps9LjIRDw9uRvrd+su0xdAe85c8XrHQe+x3NEhJJHfVl
	 h8RskAh3yK21DWTF4MaHDMkRy3NeMrvo/TWPoSyqs4KP6QqKAG6wYtBtlbxbA04o2AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BKxMq1SJ1DhuUeKjKvys8Zub5ATPVnGGm2Fd227pA0g=;
	b=YMxT/E9/IUTTLGeBhMRCtnJm/432Uu14PfNVZH6cArlpExZs2Rr8TgrvbFXu/zr7hQ7k
	 KQywQUjRF45AX8Vo3wPDwLVkqmo5SFsmBphJEwQyGkFxoJlS342JGjQ2VkXTIgYG1Oj0u
	 UlhBh6BdzA1mFJpGORfucunVRbxanaAl9Ih/uZ4LAzfIxox2MKBxb/BvlPdyGlAkD8Ltx
	 sisp8QtaCOawNnIMRKDPWMhWM5GRrB00JpABsxzrjFuCm2OJz2HaoAKYg/LTT7gX3wLfK
	 RDldTENoN2P6Ay5l9u0pJIGMHGextmHKvLJLLKDagTvCvIS+yRj9AHWk7WOjZjXLL5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5wbEzBy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C73606A31E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F5wbEzBy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803A41F000C0;
	Mon, 23 Nov 2026 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795419049;
	bh=BKxMq1SJ1DhuUeKjKvys8Zub5ATPVnGGm2Fd227pA0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F5wbEzByDLa/HRRU8X5PPGiMZ7hY89D07PUYgqRT7eFPvillO55v50jeiAR20E3cy
	 7MqTMcnQrFfogiRWPeDZ6W16pRTQnKijqby9Vj/OYXs1j/w2DwA/36XGww5uxtdN74
	 V9iSytapzzcqLm6rEOR9u2AoYkx/d23Pen999hA9lqt3quc5ufbCrd9wF0Q4MNLlKG
	 bUqQ37J6OSm8oJcB+MqlPQkEQI0vJvDzMuU4Dr05Z7/IiBJb7OpVIN9lkihStkzYm3
	 hbgI7IlsrsyN6pLqhH3GtK+eZb57GMkje79UWrYJE/VVcT0IZygyqkC+fDHHOUpJMs
	 8Gx6fT2CRS31w==
Message-ID: <sashiko-outbox-228815@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuangyi Chiang" <ki.chiang65@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123072320.5967-1-ki.chiang65@gmail.com>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:30:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On Etron xHCs, a USB2 remote wakeup may also move other suspended
> USB2 ports into the resume state without generating individual Port
> Status Change Events.
>=20
> The issue can be reproduced as follows:
>=20
> 1. Connect a USB2 hub to each downstream port of the Etron xHC.
> 2. Wait for all hubs, including the root hub, to autosuspend.
> 3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
> 4. The last connected mouse does not work.
>=20
> The affected USB2 ports may remain in the resume state, preventing
> newly connected devices from enumerating. Reconnecting an affected
> hub or mouse does not help. Reloading the xHCI driver restores
> normal operation.
> [ ... ]
> [ 4825.027484] usb usb3-port3: resume, status 0
>=20
> Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).
>=20
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123072320.5967=
-1-ki.chiang65@gmail.com?part=3D1
