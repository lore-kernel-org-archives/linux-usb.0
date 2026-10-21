Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606411;
	b=hzta5G2HqhyBgR18vDPG0Xwv/by4W8hW7B9s2c4t2lXKXpIpp7i6hgfWPSzq8VEQ2d0a
	 H7qq1Jmy2aDozNZDF/A8PKgdn6/fV0/NEd8iqv3uwNP9/OuSHs8QjLdBVuE9w6paMW/7M
	 L8XgbAMORNW1B5WE/9r4Yxg4NQrej07seQpXWJ50H5ou5k9mMNSUh+ypEm8wOPVN5YktU
	 jy/2oh01c6e19HXslzuCz+Ktx+qon5+0FNQ3/UoyHauPA0czUzgGIJ/+SYHQBvUtAzjLk
	 rAK9IlUzeVujRcU7pjit8pochNXS2BYvereWScBMeRLpPzuhZybQzWc4qRgNiUZj26w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606411;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3V889LzmPTz/k88TGA4KMJgdVJtR3GTxdm3PoqVj2pQ=;
	b=p9W3qGAkcuhrwRHV9fXqazj2RWzQTzNqJW7feBKik2IeK16uIAkojT8T3nhVCo3Q7C9w
	 6w7bUW4dqX9bTjPuu76teeRIiPQ3UGUUm6zpsb3br4dvWErEDfEvxYuxlpBI7PZjEzNUX
	 39IJhg5P+2cQbHmIYcbui1gjRmIsg1to48JFo3DY3uQ94K+JKx6XwNe9G6REkAZQpty2O
	 wBMlcAJPytQHFhrRYX6L4rGaZFcSZBNJqmC4AXxiE7xQadzXETW09C9rv3BuHtpa8AXNy
	 +Kh7FA0NLVE5TsQHkCsOTNInp7a4EJsQgoaocXrNDMnWz5r4S6fOOYF09IeRinueo0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrAJwjMp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E803606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrAJwjMp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466D41F000C1;
	Wed, 21 Oct 2026 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792606411;
	bh=3V889LzmPTz/k88TGA4KMJgdVJtR3GTxdm3PoqVj2pQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IrAJwjMpS1sMPwvS7leM/hrnQNxJnBTPaWzsBVmuP6zbYupsEjV6TEWUOorwwVEEy
	 wLjF44ZVe/NQ+XqMG7+HUPbQ7xHS7Fj03m5OhYkgAgBAXErKnrl4fvkrXwAC/vTbKT
	 DwYkLl5ESwHq7mps1cwsVuubEgY5lj9TNpuA7iBaDyzHUcZeVftbwc71lbFgEdrOBA
	 90UW9cHhbNnEq/aRpQrMsX9ZePUy45J6OeOGmc5yewmspfUq1y8A93YeO3N8dxOW/N
	 65iyETZnHpbL3+aDrhxHXakJRVEjk8i+7kvaQJP99z3dQqG021XbgUYDMQBav1wQ1V
	 ebUbSsS5rDG1Q==
Message-ID: <sashiko-outbox-180547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 6/7] usb: gadget: define stub for
 usb_udc_vbus_handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-6-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-6-60000d03fca2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:13:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Platform drivers with optional gadget mode support may want to
> call usb_udc_vbus_handler to properly handle a cable being
> re-plugged.
>=20
> Ensure these drivers can call the function without a hard dependency on
> CONFIG_USB_GADGET or having the ifdef logic in the driver.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-b4-rockchi=
p-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com?part=3D6

