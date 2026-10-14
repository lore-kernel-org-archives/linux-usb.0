Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365447A88E
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975740; cv=none; b=Jg9hwMt/isz4iUa5cWF/sE/u0ctF2HXAHRq3+uoWHtObixZ8s+IGBiaXcPvIxN6HH/VmrJ75dZXnJJVbpHZFaGD9AadH0HVuIRca6Q3nE7khI3JK9HI1o9Qh18kasOYiB9RPZS1a0q0T28N8ao2C+p1Fk+xWaJXD7mKZg/LjGcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975740; c=relaxed/simple;
	bh=wQKZlw8FSQS0zkeucZNPdi577LRNvPcK/q6X3hI8h/8=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=GE5dpJ8TnaXO4gl67neYoXpPLryBh4u+96ZSPJWyiny8rh9gVEsmmtY7a2fil7YBM3UkSoiGIYkHQ6tjalMapfK6sTby6jrwJGM4YLzcH4nBlZ2xgMDGv6FKZPqp8KPQ2Dj8+vAnA+eekJenHSp9Ik+H9oMveFmNLks1XdqsvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqaL2Fzu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqaL2Fzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6901F000FF;
	Wed, 14 Oct 2026 11:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791975737;
	bh=NdS74CSIucaXPoLXDni5QAgRbTrF+MDeDRUtPF7Rljg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=nqaL2FzuughVCFQZaY5qc/lK4xYKu0TJzNto95CBi71cOmwVWX5T9PEVt/Tc+gcSy
	 Srr00IhBjDOrC8sv3mb0x4yslObHu9IhCdXipAr08fSwGR/pqKPYGsqaLy5RpA94p5
	 xUGX/LNC/E7qow3JWgV/xvZIW2rUT2b2aTX8BQ+A1ToDDxIjW9FVCoPx6ymPfI5HTt
	 0jINE4sENb4ciXXGLDmRtLKAzQEnZzeMV5VrllUlKYPFpacmWmmQ4ezDLFzGPwm8NO
	 HtQgrRHZqq55VYnRH7GeIZGZ9Ij30mzkUF9FZICwhuBVKQaBBAFXQOg1AHxFRpA2Aq
	 R1YER0fG/AEbQ==
Message-ID: <sashiko-outbox-171170@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: uas: ignore UAS for ASMT135x bridges
 (174c:55aa)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261014105700.19433-1-olivier.kaloudoff@gmail.com>
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
 <20261014105700.19433-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 11:02:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The ASMedia chip detection in uas_use_uas_driver() assumes that every
> device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
> config.MaxPower of 0 is an ASM1153 with working UAS.
>=20
> ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa id and
> also report MaxPower =3D=3D 0, so they take the "ASM1153, do nothing"
> path =E2=80=94 but their UAS implementation is broken:
>=20
> - The first READ(16) issued by sd probing times out after 30 s;
>   enumeration only completes after a uas_eh_abort_handler plus a full
>   uas_eh_host_reset_handler cycle:
>=20
>     scsi 3:0:0:0: Direct-Access  ASMT  ASMT135x  0  PQ: 0 ANSI: 6
>     sd 3:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: C=
MD IN
>     sd 3:0:0:0: [sdb] tag#26 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00 =
00 00 00 01 00 00
> [ ... ]
> with the equivalent usb-storage quirks parameter (174c:55aa:u) the
> device is completely stable.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014105700.1943=
3-1-olivier.kaloudoff@gmail.com?part=3D1

