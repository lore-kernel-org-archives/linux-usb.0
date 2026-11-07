Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036110;
	b=2Z9+Qxaf6HEC18SoB+G7QjFVkNgIem5KU8XVy2DfrMDTb1OzZpgpaiv3VJz5pW6dxO04
	 H7IZqQMP8TJEfNKbf56iVeMP8bXmwheCENhIjMP4/AKiz3pE4CCjKpid2Cq+H+kKjAGQY
	 ZOeYnTXDolbEvYAX3hvMsOHIQqM3ylAm6bUq7Uxd58AvRwtnC72rSqDvOgGSmSzsQPSXS
	 lgOM3wc9G7sL0nyDuo7MXmU9exPg/5P2wPC6X/9o/fR89n0WSTTCLeD0b64sYiqSwQpc4
	 BbP5Mh+n/5lG6C9DbwaX094Wz5jjv0FjBovxSdmJsVE7FCaZqYQiX/BUEqbRgK4vY2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iudXC0VKHguVo88AKAKxbA/hwq1OBMKNewUwX4MddzU=;
	b=zCpf1OpoXv3gJ+yN0oS6NiYqh3oVVBbMVCj9nHfyQq7s8SkUuaWRLH8+tn0GFnhCvAS0
	 +Q0dvH6Nx+EnwBg0X4+7GFZ0OiJj378qRgMhNueNPqQ39TmRtTtc++toq5pRkbivxQwa8
	 eFpATgK9Xz9rqd/HisIt/mfhAIYjeVBeY1NiBtd0BZY5Pu8LYQAu8cMRGQISOf4kZ6aki
	 jhmE7GarOZ94EHjhULYGy5izMbdCw8reIiB3/QDvW0odmI+k26RH9SDt38/V30sYLFCzA
	 yKCxFgMziQSlY0iHNmpNxV96C1AADaHWx3mJEJVF2BpJ6W9u4Yd0tl80EZR1BJM3j/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oATRj+kz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5A606A32E
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oATRj+kz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6251F008A1;
	Sat,  7 Nov 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036109;
	bh=iudXC0VKHguVo88AKAKxbA/hwq1OBMKNewUwX4MddzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oATRj+kzTuk+IdufaLKwFWN4cf6TRiBZ0zRvg/WKajgrExzH9VZ1GVRZxDzNmMKZa
	 NCwEaVg8fQIf5IR5HwndJo2mAAlPJMRS1Tzrflr39t50Qt46zPThIz8uOeEmPAtbiM
	 cvaMjEL+CFqYBcLHp/rIcMopnzQDZFYuUYKLz0PhlELzOQYQEsF3GrTBeRAlMp3aLi
	 mziiBI9mna/DkLQc/WXKw3uRmNC10RXDFet8YVsaC3ChVnm6CWsdxEtoyIXeOJFp02
	 /+qUhVF8ZgF3O+JRDdFHG037i8/I+RFrAnSzX28JjfidDzSAsDgSmT1AM459PUwX7Q
	 /g3QkJpw6RjNw==
Message-ID: <sashiko-outbox-202692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 02/13] phylib: Add support for PHYs with
 broken forced mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-2-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-2-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for PHYs which only supported auto-negotiated
> speed modes. This prevents a kernel warning and stack-trace within the
> phy_state_machine when PHYs return -EOPNOTSUPP from config_aneg()
> because they do not support forced modes.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D2

