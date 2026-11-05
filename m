Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871361;
	b=twQ8TWEBl+JdoOqcKxIpyCT3jhn7hrpP5guM2FaBEn1ZgELHQhYGWS78JEi0oCXsyM23
	 NL1tkffUqaGXa4sZoJFaMtN+uYzbRFs17SC+AoYLLnfmh6wmSNy4FFv0qSSZiZnzyFiHG
	 fr4ZwTLXLuPDqDIXAOMxGCw2TxKsV1dLrqv0NP2D50T5y0s3aBapAYp7VC+zk6ipNydrM
	 tyjqBPpwVMHUrivSZiToc1vuPCR++5xzDGB3wGNm2NjyrDGZQDICoKEDxHvI/NN3fhWw7
	 xMCr/gKv0IDkNMUvrDXrv+50vRvbSq8Shd6U7q5UH/lBkXe3tbLRYbgbw3NAFXOXrKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YYZLfCRImLtKBpKu2xKVTwtUPZlMCq9COzGqgL/M0QE=;
	b=RvHgJCa9GepQwuT9YV1qasNoOL9h4UK7SDnxSDVvtd4gJ1RVtOq+8rjlMVoTrOpIF/ms
	 n0qUVgWL/4jy3Q/5NMW63YLKsvituB9DrapT88iZmTcpRULUvk9wUWnr+fvYF871zVodn
	 LZ9ftpqMIV2coPvNdhqDL1UWwhlTTRuaW3/DJnKl/yqP1aua2O6pfMKvKRurmt8OEXNna
	 Lpssvh8CZADpeTENpHtyFiSq1UcWWiGjQOjUsn6O/sO7J8kvMlzy967i7bfwp54QMn4E6
	 W25o9au0Zl5vGcdixTpcduSGH9xSDt5+4Uc/Y63oL9Ip0+4d5+65wTUScDPuoQK2jTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIrBI+Xh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D7D606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 09:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIrBI+Xh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364601F00A02;
	Thu,  5 Nov 2026 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871361;
	bh=YYZLfCRImLtKBpKu2xKVTwtUPZlMCq9COzGqgL/M0QE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=EIrBI+Xh+NGgwHer5jcjZXZ/Q9H8SBMxBhiJBacUUlSVNw60My2k+TXVVJkjQUMOA
	 C0mK0z5cUZbYemrF30ZzdItsY61CY8R/JR594pifUzK/aulfXZDeJegi1tdQe6/imw
	 qg1kWPQcaeAF2q3qxt+9b8aA8Bj3nLfbFnDihh8WR/J/ODDgMzauAeA4FtB/GQcjDQ
	 dH5J3zeZjSad6BjcNmYE/XvzMnYxcHB2CyMkeKW1RGtkIz12eShx91dwRq7mWnghIC
	 VYTg1FE50xv57o33X3iAOIpY5eh/VEFBV1/XAC/UmzncTOPCvupdkdhUenFMoC+P1q
	 B2abPRroOJSMg==
Message-ID: <sashiko-outbox-198768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_printer: clamp GET_DEVICE_ID pnp_string
 to ep0 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Xieyan" <fangxy@xiaopeng.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261105092712.27838-1-fangxy@xiaopeng.com>
References: <20261105092712.27838-1-fangxy@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 09:36:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The GET_DEVICE_ID request handler in printer_func_setup() copies
> the configfs-provided pnp_string into the EP0 request buffer.
>=20
> The pnp_string length is bounded by the configfs page size, but
> is not limited by the size of the EP0 buffer. Since the first
> two bytes of the buffer are used for the length field, a
> pnp_string longer than USB_COMP_EP0_BUFSIZ - 2 causes memcpy()
> to write beyond the end of the EP0 buffer.
>=20
> Limit the copied string length to USB_COMP_EP0_BUFSIZ - 2,
> ensuring that both the length field and the string fit within
> the EP0 buffer.
>=20
> Fixes: 24b7ba2f88e0 ("usb: gadget: function: fix dangling pnp_string in f=
_printer.c")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105092712.2783=
8-1-fangxy@xiaopeng.com?part=3D1

