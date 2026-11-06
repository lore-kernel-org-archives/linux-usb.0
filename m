Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008386;
	b=huks45Mod+goBxeNzDNcyebdBIoXJXDeJMGgqoLKJtQ/hYVwBHdig/E91d+3W0AyH4AB
	 ZtszOT3w66rtdjUkB3XU0CXWpY6dofVM9GpABIi9E0XYqSLkbN+1pmFvjtkNhFo395ZDs
	 hD4yLvOmneUAkn4c9lrOkPzsIddQ6OBLuMGD029A3NEDD1wrDZvnfcXU6lOTR9RDiJa8Q
	 w4grxfJq0DCIeigIfAU0y5DKJnTcWRaWBQnHnbPiLc6/5fsj1vp8pZNgKoQDjMLlKcusX
	 jXnieaKAfIusi2JYXDB4CupavynaWwDwgPZt+5rf866M6ljzmbfH58PfqnAN4QuB65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008386;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9bQYgMbjFbqYHZNN0WtSEYv2qCESs3K952JiYPEgpNY=;
	b=BPk8zsZ0XSRg6z6oknjRIIPvNgPw3cHl/kIbDGMmwbVmz0XOdCxpEmG6ONsk6zPdjbhF
	 ZnOt21cGy19c2ISQavA4kC+n3VwVnqGYHgid/mp4o5pLnfOsr3EDVamlfWCZQHIruWS9w
	 Nd6ZJa35QRhHJGaZgrA2CADtIHdQ/ibCIkYP7PZR73BDTHHQgQtp/YkED45k05FQ5fcPI
	 ysrPKNyGsiF+SD5HAt0l+x7BI3Dp8lWWxoK171dRUnCxGO9mGclR1Pz/Z420A146s5Sd8
	 GNn9MV3DxwJXO3K45C3vAXDn/YMuGSExFfnocm/njL/I1JvxYI0ZBMxilZSTc0vDaZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnDThsIO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B955606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 23:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnDThsIO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B569A1F0089F;
	Fri,  6 Nov 2026 23:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794008385;
	bh=9bQYgMbjFbqYHZNN0WtSEYv2qCESs3K952JiYPEgpNY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XnDThsIOXYIa9dS+U8HuzSUD/xCnoKa4oZeSB+xzrsEXh8XEQQeXF1xm+bvFt1x+6
	 svflBlT7ghMfms6vz+XOarY8GSnqH1ayb3YvNYCrXtEKHgW8oZg/jAaDFmVrdQZFFz
	 gZ3OogLeBG7fFW5mNWj+NbCZOTyB1zBAiXpwKYwxKYv2NG1Kzxp4RJ2NryEyUF1qGr
	 sBet2d4DM3XTPjVElGD5XoK5DP7/wOBMC5yvEBQlmxT3vYxipwIbiu9XCv76/pzCV5
	 EzEOWADqkW3TQyW1+HcVvlr7nZT4NtaGXZkcG1dV9DdwNVGu3z+oYcRRWv8wQzLwzN
	 jQl4UFe5xR3EQ==
Message-ID: <sashiko-outbox-202376@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: visor add vendor/device IDs for PalmSource
 devices from the PalmUSBD.inf file in Palm Desktop 6.2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Simonelli" <adamsimonelli@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261106233301.3267777-2-adamsimonelli@gmail.com>
References: <20261106233301.3267777-2-adamsimonelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 23:39:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> PalmUSBD.inf from Palm Desktop 6.2's driver defines two PalmSource
> devices. While PalmSource only developed the PalmOS, and never made
> actualy hardware, as it was Palm Inc. made the Palm hardware, there
> is a bootable ROM containing PalmOS 6.1 that can be booted into RAM
> on the Tungsten T3. When this ROM is running, when plugged in, the
> device will then present the PalmSource vendorid that is defined in
> the INI filem and the deviceid then becomes PALMSOURCE_DEVICES_1_ID
> the PALMSOURCE_DEVICES_2_ID is also defined for completeness.
>=20
> Signed-off-by: Adam Simonelli <adamsimonelli@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106233301.3267=
777-2-adamsimonelli@gmail.com?part=3D1

