Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F429528435
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930236; cv=none; b=uuxP2v9a+5t675MJ92/+X+570FF0Bk0wLlZsn9OpbW1bN9fML5H08I14undx7oIJDcMoWZ0APD/JSwIVltonWddwuD4Cs6SgdAQ+FhguPcqssmZBE/45JLSbwYa3YCRDACGFY2U9CWmZ3F9MYz/w7YboIMHgYg18GtlE63s4ueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930236; c=relaxed/simple;
	bh=bvTxmgKsOoVty83K0x6bHlj1MSrFgItK4bJUnd0FGBU=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=ld6+zjSOwsDKDfwLq2dFPAOt/KU9n8bVEAbCMESyl+jKe51oLVYkuo2LLrJFov87NyjmVyVdFZCcT4NQmHzPA2AoQKUBiR/tJA0MRHyNocbn+PCATusuDX73dpEXZ2GywnfGVcdcUsFZqyW83XNJ6SAqIrFq8XUBn9frLXfF51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpoCsvvv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpoCsvvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093741F000FF;
	Tue, 13 Oct 2026 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791930235;
	bh=soDL6zj85oQkIdlMCmABGZIGAHPQowHrp1IFJyDl6ms=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XpoCsvvvKpT/6JXcpMUzV/QfDTeavmnUEDGB1JHiqDz2t+D6OdgTOr9ZSbcEazx7S
	 9I3mwE6lRLVYfOw8hD5+3v4I/xsgQg5Vv9vO7DRh/Dk7y/zRwh6/wAYLmlaQERlatU
	 jkw/jxJ7l5Mg9wu6ShmSG7pP8m0HuzRnMlBXdiSvCUlVTp03yPJNqoSXVX9UeZ2IS+
	 UxutYt40KgaeIndDtUH/kYWyE44adyAvbnIY1pK59rxU7l+ToWq82L8ySqHQuPRm0Y
	 I74SNOfo6TfX3yvbMfwExUtCRrZP+3CH7Ry04Pe5+dx9DN7QTZ0wA599kx/eCnObKn
	 A+WGnVhqEx0Zw==
Message-ID: <sashiko-outbox-170575@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 22:23:54 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013221944.4159=
8-1-olivier.kaloudoff@gmail.com?part=3D1

