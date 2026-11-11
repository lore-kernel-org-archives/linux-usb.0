Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367514;
	b=3vABJCk3M5r5Ro/x01J7PwQ4fIenyWQpkGtigJHCtgv8yglp1//5ClZHdk3uGUlvYDTN
	 en80ZBYa/jxahkITVbR19p0WDYeiYCZq83dwI+hKaCDJtqsFXsziX/8v3zo8A0vqvN50f
	 Ay5DjLFMGfLzHkIycqAsVaUt7eRaplISxVbbbZyaJqBF2+Vr7ZBbn9F9/D5S12iTwD5dN
	 rmxGKNAhFqJh8MTjvRbMvFF4mr6CRCsraWscO2eUJplHfhr5JAH3Kgc7fyYHZzysa1pHO
	 Y+0BIRDrOV7dAAoh5JutKwgDUIyaGWaovSFexWHTWZUTgAs58djizZyJNlBZcC2isgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RJTgwYeJKR+2KW1rHegOgs40FYbCin5LhRZ+uf3K6qo=;
	b=j3i8PXal508E5udMrOba3uzbpwF91rCBoMQDEXaZiP+f96qgZVwujHR94WLOdT+ZtNYG
	 wbK0driJ4JthEmuxOZSl/BKl/CBDvunhW7k68bMss3Pz0GHWZ5G5lqr8H0eLMYC8HAbPg
	 GoAFW2QanQj+SVjLZC3MMbwJSP4jVVtlN9OMQY59+J2PEhIkgwSXOWhjuRC70qD2cZh4u
	 +x3ZBxo/f4bfHPnxyzI2tUc56gDxPhiv0V0K/qLwPBBXI6RfHqsY+z5HTtnj3130OBhcf
	 624cuiKaodUlfZ39yDFenH/c6TiE7cs3ZALS1n32QaldTS1X9opyDYzz88qOHtqmbHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljac7dAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CB606A336
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljac7dAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F79F1F0089F;
	Wed, 11 Nov 2026 03:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367513;
	bh=RJTgwYeJKR+2KW1rHegOgs40FYbCin5LhRZ+uf3K6qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ljac7dAQUnIM/2nPhl/jpgLWWv6obmkZpT9DWNBWc1zdoTMjWaNMg77CXvBW7zcIJ
	 215KdR87RxYEAu2zyVJQbT8IQkM5yv+it+QnkscHCB+LVReNbQxA1GaEDh+YZ6M3J4
	 ZllTLTgUHRqxECQud2H91tOXoT3pkbZeG7Br/+/H/gzdF98xV2JF801w3gy7UXgsNh
	 zas0BpyItEgR/gkSipS6zRSZS+oXFwnrpQhpEE+5OOwCE8rHh6rHTinMDrLiUagFqR
	 ZqXol7st16ScEBWoODUPXK+kFhEjhIGr6I3TYdAaN3A7/XANBG+1eWb8l6tbhF6tUr
	 ORlyBu7fhuCdg==
Message-ID: <sashiko-outbox-208184@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 03/11] r8152: add rtl8157_change_mtu() for
 RTL8157 and RTL8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-4-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-4-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> RTL8157 and RTL8159 used rtl8156_change_mtu(), which programs a fixed
> MTPS_JUMBO. Per the datasheet they need an MTPS scaled from the
> configured MTU instead: max_pkt_size / 64, at least 10K and capped
> at 0xff.
>=20
> Add rtl8157_change_mtu() for them. Since rtl8156_up() is shared with
> these chips, have it call tp->rtl_ops.change_mtu() instead of
> rtl8156_change_mtu() directly so each chip gets its own helper.
>=20
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D3

