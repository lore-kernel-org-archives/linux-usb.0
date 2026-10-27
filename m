Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112710;
	b=O9tPQBvA6/9uBrUxNuDR/hArE0arbjZIkSae7G8fFn/7nuBKRc2bkxRS5ECBk+s+shV8
	 M+3mKzXXzBuCrdknNoqjmTeg6+pthFjicqlNhcstq2Ch8IsTDkz+DysTeg66EY/qgrmYg
	 y9+3oYw/r1pfPzfk0DVY1BAXlCmbk5dZ3/XmM4BKSQnPaqVo0RhLOKKV1dJ3o6e2+L5EB
	 8f5cBy3EyOotswj908OPMCwlqsNbOQyPPMx3Fk1sF/So4HRVVY/AzU/NbyQC9jqs1jg4Y
	 FXHXUC/8z8Ng/CwGGXCG2XrPA4cgEyBqAPo+Xfhd7X5DvQSAHlImPyePvzEYMxKVj9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QIbQwfk8AI/409nqQpIwsfR/h/nAXpJEWFLT6D88kMI=;
	b=wXcNVwg7VQmGJQU2uVRimybEPDcZIglRi8MADNtMFTLG3mqGw2FhDvlf1vp6G2VO7D+j
	 RrKHC6oPTUBrNdqPtUjOlI9/9TUSfjCNRmE7tn/Kykfl89bfAS1lO5Jlc8MmHsZm6a07H
	 FYkK/aSNsin5dovIu19CFEb1DNkizTqovxxG+8nX34jFVkuaE8tieuKjPMIxOryu8az0E
	 5KmB2xPRWf2Mgt2dWHOTC6S5yvuglm+Vw0Mvk5ZT/kT4E2++nWxK7Ns4M4ayrjNMOPmmD
	 TMyuj0H3RmHR35XIBrLaoPkW/mtWXIHH59KsBmMnUSAdUJxbGicBVW/UXjWX92X75dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nurSYTof;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E6606A322
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nurSYTof
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9D91F01825;
	Tue, 27 Oct 2026 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112709;
	bh=QIbQwfk8AI/409nqQpIwsfR/h/nAXpJEWFLT6D88kMI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nurSYTofJq4nlf6uzdVbYeVP4nvs4cgCngDWHx+BP3YRNc2l6JwHwdMB2lFlSdxoo
	 W/JU6xKJcJxH7Bru0ylE2HWqCv0mp3yQzTThtUHEd2rWwXE2MiXAGwk7qpnlUsNff4
	 T07wyurG5e9mamcFBqcaCufhjs10w10Rl3QKMeNyuqYWTVr8qM3m6spYV5xLRQodSC
	 4H8qeXacDBNV37jRon9t2fHAx7iQMdw04gwTF5cNGXwYtYjVv1J9KLzr8FW0Oh45KW
	 +7TX9ciAPy8eCJGRu44QjBzY+jiCEMOVncMpCq80zlTN2THE9igVyaRr/jzsc2i704
	 sKlzDSSAAS89g==
Message-ID: <sashiko-outbox-186766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] usb: storage: shuttle_usbat: fix READ CD divide by
 zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-6-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-6-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:51:48 +0000
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
> A READ CD command of 64KiB or more with a zero transfer length, which
> any user who can open the CD device node may send with SG_IO, oopses
> the kernel with a divide error on an HP 8200e CD-RW behind a USBAT
> bridge.
>=20
> usbat_hp8200e_handle_read10() splits large reads into chunks of whole
> sectors and, for READ CD, derives the sector size from the transfer
> length taken from the CDB:
>=20
>     srb->transfersize =3D scsi_bufflen(srb)/len;
>=20
> Nothing guarantees that this length is non-zero.  The code right after
> it already falls back to a 2048-byte guess when transfersize is 0.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by only dividing by a non-zero transfer length and otherwise
> leaving transfersize at 0 so that the existing fallback applies.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D6

