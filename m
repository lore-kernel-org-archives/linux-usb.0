Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805410;
	b=y7CWxiPO5H/GIOP8ptcMDthzKrvBAo2qUxkj2Qbud1lTQq/Qn8ReW3l+fnEN/gtWx+O1
	 eAOIQ86k/MJKBMHPm843dKvRerlAQyTbXaUQNUhEI68HAe5OHuT/oXpUe7MGf3RWWk5R1
	 QlJ2CFjzuzki9ijdePIVOWZGIPmucXHGlS/27YPL9I8qEUbj0cYvXQldcIBHO4z8OBuY4
	 s0ZyETJ6WdQ86P+lIyVHKwk51zcUyniYAEvOhpQEuqrJE87iSPE7lVqBGvkmY+J5zNzTe
	 dI1aIvTH4TdrX+V2QcGOg7C3cgZJQZXuvvF1+J0X8OboG5k/EFMal1Rroy6fFL0O5iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805410;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qXXKZgKzevk+FELbxBaLY2ig2HLABfXnKh3rCztmsH4=;
	b=GJiLLNgHdUsCZ4ljrbzZ+lX7Pye8NHwS5UGZe/Jyoh931n4IVgkv4xhDgiZtra2tJQEU
	 sh9uP3momx+526hAe7GgJJSRv+GSlU83yWS/vIfVjC00NtgYqDbauix53sV/u8+0tB7aJ
	 RytV07ranmBYeN2P5ZWpfNeoujxFpxmZGEQlU+VZyu6aYaBczyxJm8sTIZGBB07mElLrL
	 dvtNYp6GzQW4G8nvrAGxgmgfkT8J9GN4cTzgNZCynTcad/cIQKP59kLsT86t6pCRYggtj
	 dWwuXKaLAtrRsgWDe8pEiuGYAdezLGdpa0+9LU/YXT+JP9e0FGQbfBkJOiy1ybGoDhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXHkgc7S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0327606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mXHkgc7S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE2E1F000C1;
	Fri, 27 Nov 2026 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805410;
	bh=qXXKZgKzevk+FELbxBaLY2ig2HLABfXnKh3rCztmsH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mXHkgc7SkiFUaRV03e8X+7H+4YI+3Dhm+ZwbP4OjPs7Vmjc6lASpb1Wil86rRVYwm
	 6ndp8Q9Q/4y9I8Wo+d9VicsynqRuyXVegKYu74/dSEX5VOnuxjvE5RzV3zwbuughgH
	 iYi8YuHVHG90UuZ4Q3c6l5iYhava6U2PWyx2iEjUUjgx5PcCx9sOcaEK2nskMASQZ4
	 9awIhZJ6X14FMEJZ1MZBK+mFKTY/50QmgX733X66GsZr+LqfYNDxWqfOaGJBRgkSoc
	 i+9XLXyAJRG/46Zf3Y3LNCnCjDsX4sm6kKt4djkZdmTq0TRmJy26akZC+wBgWMqC/0
	 eGoMK+P7n8ftQ==
Message-ID: <sashiko-outbox-238113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: pxa25x_udc: Support combined PXA and
 IXP4xx builds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-usb-pxa25x-udc-v2-1-4716d1f7af3e@kernel.org>
References: <20261127-usb-pxa25x-udc-v2-1-4716d1f7af3e@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 18:50:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Allowing little-endian IXP4xx kernels makes it possible to enable both
> ARCH_IXP4XX and ARCH_PXA. The shared UDC driver still assumes that these
> platforms are mutually exclusive: it defines UDCCS_IO_ROF twice and stops
> the build with "Can't configure both IXP and PXA".
>=20
> Select the controller quirks using the running CPU rather than the kernel
> configuration. Match both XScale CPU families and their supported
> revisions, and remember whether the controller belongs to IXP4xx. Use that
> flag to select the existing isochronous receive overflow bit and to keep
> the EP0 status workaround specific to PXA.
>=20
> Remove the IXP4xx clock API overrides so that PXA clock control still
> works in a combined kernel. Leave the clock NULL on IXP4xx, which has no
> software-controlled UDC clock, and rely on the clock API's NULL handling.
>=20
> Drop the Kconfig restriction against enabling PXA25x and IXP4xx together,
> now that the driver supports this combination.
>=20
> Fixes: 2262f02ac2aa ("ARM: ixp4xx: Relax endianness")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611082010.e3nJgvr4-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-usb-pxa25x=
-udc-v2-1-4716d1f7af3e@kernel.org?part=3D1
