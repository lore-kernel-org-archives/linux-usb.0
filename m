Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02583B5F50
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 17:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997349; cv=none; b=pK9AorpOXUhNQNfSxxdhJBxd7z/76W95BNomnHEE+WqCPPNQhKBcaAKSzDPeSWHmKUC9GEoDM6As3oIiNHbjX1GoEckrOFUHlZTjnuxQSUux3gsL7g1RyltxnwVPfBE5ML+/dGsMIdxFu5kSB4Hb8cS64CH7WaNE+RUzRNnPMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997349; c=relaxed/simple;
	bh=evrFHY+Psq1EXUQ60CsrYq6CSwSYP3cc49b6RY+g2rY=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=aKf4qd3gz1iIkvloZd2EufUDUCGqTunwdgWJ3/dACuNbD6lfYUt8KbU8UltBvnOqtVFLoa5M/ZX9KMzKN4YI6i1cVu0iOcjRSL9M6PqsZQODAX65Ng2zv8miMjmpnRoBUOaugPgcoWkeumozJjgaQgKA34SAAMfdFPgoqcvbzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2pf6XM4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2pf6XM4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274941F000C4;
	Wed, 14 Oct 2026 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997348;
	bh=+hTtA4lBJaSQQC9mGSfsEDfoAGKdOVAE0FTieBdEAb4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=G2pf6XM4gWoObS1gMpWc9AKB88HeHGkeDIyvt434QJv5RlRnHew5Mmh6QnJDyUOms
	 MjtmF7qOrn8Mv+a31VxH0BJzeUjoOnJsV9Uq0T2/788sPh84kW+Lr3K0t8bv/AcaE2
	 hZxY3zeir5BFMsinKjMaDM7/R2U43Z2KSM4kHV7F69OWgpLbIpHeuDZWCxjOLwBuac
	 Z9M0U+YBeRQfEUQByHkGLSpmhDX4Iy5DwCYm4BO1+49wwzEDf3BCcMi+ytKErgopNN
	 dZRuWGiMW5ZsMPh7sc769XbUluZ9L5jbIFRBR2lc/ynfquRkPKoN2BEsT2dvS3Ukep
	 YAUveoy2c6TBA==
Message-ID: <sashiko-outbox-171560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: uas: ignore UAS for ASMT135x bridges
 (174c:55aa)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
References: <20261013221944.41598-1-olivier.kaloudoff@gmail.com>
 <20261014165741.35758-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 17:02:27 +0000
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
> "ASMT135x", bcdDevice 1.00) attached through an Alpine Ridge TB3 dock:
> with the equivalent usb-storage quirks parameter (174c:55aa:u) the
> device is completely stable.
>=20
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014165741.3575=
8-1-olivier.kaloudoff@gmail.com?part=3D1

