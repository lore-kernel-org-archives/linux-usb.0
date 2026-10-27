Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112782;
	b=c9TO0u6wEMqTbk0fD51KWIFIGvibD6cRaI4mjE1fBo17pDEEyPbbzWemiw0dtT2XH103
	 Q2SIZxVrg6eJ9+cr6VrSXliGUrXxDbZuUDmWUg1KlI+404eOvQTDhLuyp+fHpAB9E70ec
	 u8CrYlA2zPI5ozkRAUJzd2plJiqWJHjZiWhngKIKHydA3ujk2efXT7Mw94MMtxPWy2NHD
	 KR8XAWXrZD931gepU/5UJ8QYKhz6mCFj9yUh7qthyBBu6Kqj2vKZ229r+LSskpui2hqs6
	 IkEQEigVLpNe6a2g0PZBH8CjnH46Zley8vUjJr1DqK0PurQU6MEqeDBhIT16IzQH9uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112782;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Tm2BNibjHDQ+Bok56qxRmSoJet2b6olPQJA5FCw8q9c=;
	b=1kdHPQvsF1b4AWgefg/8ObuQNYaLeQOLvlw+uusOhETlsljfIAa9oogiLj/ULGntPl7P
	 eX0ml82taPFo/4du8/TSEFlrUKHgfS6G5c8XmGLh1jSqMhtfdeaqFR98iWHyO1CjuHKwX
	 1OJqRWK37DthWM+ijJTkBdsfn7CSyK+IsZOsdLphw3b7DpbMCbvb8HR8HwusMP+bzKTFv
	 9hsv7l9fxioOkcnPSdK+WtXAJmPZ3J2kS8uz/gDog/qcVC7y4wSDNgBERVqQpkrCturC5
	 atVwLw9lUi1UvU5LACFxVP5WuLc1GPW0SPyzWJsvjDbt/jvhIRbObwkDtN2/Z1J/oxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjvON+vy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F9606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjvON+vy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04281F01825;
	Tue, 27 Oct 2026 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112781;
	bh=Tm2BNibjHDQ+Bok56qxRmSoJet2b6olPQJA5FCw8q9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjvON+vybyuRTpaLG9pI1aOTVCtqYMB0uYkYRkvYC6wBGg+RVeL40nWLnpZKGrGTF
	 ddY7UWioXcp+7J39o75KrovSS7ktfoUdbMotGm1wii7JJVC8TzBrtDqj4VIoWt0hQh
	 4nkpiF1UpUaWMWN+cTKJCXsg48/dCAxpLl//nMnFeH61dD+2aPsJUaaqy5r+AzNK4x
	 tMGTdp9Y4CJPHvFSwVwyznh9eHGZWFg5JA+fBWagFAZP3UpAfLxJzPKQzbHTgXIR68
	 e3kekUFgqGDvPIdsolGiaNV2mguYAhEbVL5NrxwfBvrWGgfePF41GZykfc6BGHyrEc
	 JbMbThS8vuqeg==
Message-ID: <sashiko-outbox-186771@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] usb: storage: ene_ub6250: fail MS init on card
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-1-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-1-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:53:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> Inserting a Memory Stick that has no usable boot block, for example a
> blank or damaged card, into an ENE UB6250 reader oopses the kernel with
> a divide error on the first READ(10).
>=20
> ene_ms_init() ignores the return value of ms_card_init().  When
> ms_card_init() finds no boot block it returns MS_STATUS_ERROR after
> ms_lib_free_allocatedarea() has cleared the card geometry and freed the
> logical maps, but MS_Status keeps the MS_Ready bit the reader reported,
> so ene_transport() goes on to dispatch commands to ms_scsi_irp().  The
> first READ(10) from the partition scan then reaches ms_scsi_read():
>=20
>     logblk  =3D (u16)(bn / info->MS_Lib.PagesPerBlock);
>=20
> with PagesPerBlock =3D=3D 0.  With a non-zero PagesPerBlock the same path
> would dereference the freed (NULL) Log2PhyMap instead.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by clearing MS_Ready and returning USB_STOR_TRANSPORT_ERROR from
> ene_ms_init() when ms_card_init() fails, as is already done when the
> reader reports that the card is not ready.
>=20
> Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr =
to drivers/usb/storage/ene_ub6250.c")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D1

