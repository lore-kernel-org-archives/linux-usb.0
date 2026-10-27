Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112525;
	b=FsCLOirAUG96qLAtwlRKvkcS5ND9l24IEOhYQkpSGL+hix8lI5JHftugAfKmBtP6LTM+
	 mQ562cAbIj66DckLVaFGYR5ifgDewNLHfC1jP635AByL3yuITRPA3JL1MF2dpvMSnWDAL
	 KA8nUw1UcVdvAEkoq3j1FfHYUO+Vrrb3bRN8x2lb6eLvGnriYDF2TQ4jWUSdNBe4bv/wV
	 yDGDmoqWF3pR7Le4WTV+Rrqh96GZwEQwZ2ujiJweAZEQWaF2N59i1VIa4pBd3h3DNz+g6
	 kESnc+G96Hhx0PAUalyvospe17g2ZlFsNM1TEI48HTwzdtnf81Fydg5dEoNJjcRL31w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b15mDZhIncHIXk5uW0/EkDcYbEqyxyZ8vdCgu0fctTk=;
	b=xbOywL0/sg0rgyPJ+5HASoKL793O/eDYGTKeMmCaCVS2dBj23uaFxvycXsobhBZamw4i
	 Rdt5I93yUGF2OO5R2oaKGgnCoTXCnXsICsvuwi7CciSqS0ivPVte4jEFQeOc+3NklQ2p3
	 e+ldIbA4vkiEgVRbOvDa89fA8vC1EShoyWTwY0Nhu7Mh2vxp3MkmfhtdwPFi9OyICehOf
	 +K2sLkIMeyPEHHIRljRQtnMBB4BWEpg2STLg8LegLVrnCILwTQJYSItTcYRS17B+vGANL
	 lmvaaW9YDP4blpVe5nkcRny/yaq3dBUPUsECV9ltz58yKcT59MTt9044RijffB/iX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5fiaIAH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61D606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S5fiaIAH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F1E1F01825;
	Tue, 27 Oct 2026 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112525;
	bh=b15mDZhIncHIXk5uW0/EkDcYbEqyxyZ8vdCgu0fctTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S5fiaIAHxpfZfAo2z84W5fCAi0aj8RhMGbHb/kQC6V4psJw63d+fZA5Gzl3hwwHr7
	 gB+QgKo7bHQ2ULTzGeRkWxAE1F7B79LIUb7DB6gYWRdpqpZE5d8KNpy+/bFVmoiQNr
	 YpD1pelBNVaIbWobC5jT7P6971lHJ3ZR2b00SpX4FxYZFKtp+q1OGOmo0mq81UH+7y
	 iwtt9rlAlGt8E3qsINcNCOLJtszrooPaZivD/SMChK2DQUSAGEPi0xZG4tuQP+4rVg
	 cBJH6E+4l6ifiQMk2/pCRuJBzbVdGLg87UjGsGBfzpCKlVntFOOHGvItVteUOBz9zV
	 xmBDaKpkHEabg==
Message-ID: <sashiko-outbox-186763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] usb: storage: shuttle_usbat: bound the READ chunk
 size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-7-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-7-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:48:44 +0000
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
> An SG_IO READ(10) of 64KiB or more to an HP 8200e CD-RW behind a USBAT
> bridge never makes progress: the usb-storage thread keeps issuing
> zero-length reads until the SCSI command times out and is aborted.
>=20
> usbat_hp8200e_handle_read10() splits reads of 64KiB or more into chunks
> of whole sectors, using srb->transfersize as the sector size:
>=20
>     len =3D (65535/srb->transfersize) * srb->transfersize;
>=20
> For passthrough requests scsi_setup_scsi_cmnd() sets transfersize to
> the whole request size, and the READ CD path can likewise compute a
> value above 65535, so len becomes 0.  The loop then sends commands with
> a zero length and adds 0 to the transferred count on every pass.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by falling back to the existing 2048-byte sector size guess when
> transfersize is larger than the maximum read size, so that every chunk
> holds at least one sector.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D7

