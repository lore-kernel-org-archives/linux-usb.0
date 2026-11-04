Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777479;
	b=eB7ytiBAVs9JZMZVEJ+nCpguJ6BlbeWvY2ESGv1ydEj4kGqxgqg5Sqyw2/oxfcEo8kbM
	 Y6/c8mNiUTAkBwAzDEX/nz4P69zKnJfH+XqUedEADSv5CjZSgoCuOY6aCC4DWun7+IZ5J
	 odh6GgjUKh8CbPKBAUV2xJP293MK4WGYVsyd96SnwPC54/eueOZNElC5DTVSrpU/NolDg
	 5JjHmO06+doZB2vcPSeE3y1p4GZOvfxKSRIWIhUBulVPt15nNjsoHIQFDTCdzt3c/LBeC
	 as4OP27COgi27Cwn0cUC/Cw2ZDawBIZSoqoaCaiTUU+3aUR6EtxbZn+iTYVnYV2MJDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ITkHpc7i6G1Z9yynyI1bAQqWR/cPPs6n3bLpmVh15Cg=;
	b=R9mG1qFXJNWYfqf2FYv+Zwgp/nnFlvJap+gSAJeNYPYCd8yaIen0EujoGjyxUTK9l2cD
	 Eq/8oFjN9J4yed/xhlyJn9aYlGJLiiYSlN/B0h+SIdX9NtD95zPM3oId2wz/QCKuV8+u9
	 ODo1IE3O9yqOFvse8dWpVzGELvTXpGqim6WvvZZAaDWwleDHR8uvrrqxpvHBLaYNiFc6P
	 A+dGgOY2Q0WDCaFEoYlsqAYoW3jSjYtm6jM+FerQPZZOD+kZgrCrBc6YX208aMKi56TKO
	 BRHE/YbOafnnUH9poLBTB5fdFSYOb0HtyIbQoRA+8wMIuFtpIFP4SEhN0CXMEfFfm6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H90TM2o0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69793606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H90TM2o0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6F01F00919;
	Wed,  4 Nov 2026 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777479;
	bh=ITkHpc7i6G1Z9yynyI1bAQqWR/cPPs6n3bLpmVh15Cg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H90TM2o08e5CSPD34eUJg4Kretc0g7kAVmTh5YPDN5tagw1aLm6exQfDAsH539Asu
	 2BuTkAmxzUxzIsGyJuBpB5nNH/BQ8GLMnt39Q6NbBD7sZiZ85/ICDqYx54bEgVo8JB
	 ZMgW8ayYM8ZuKGhwcODAcjf7VFvNo/CiorPytcVekrM8dGZH/FK7V+abz7pZUkk1Oz
	 NiN5HuTirNunUr/H0swj6vigiEZhGelB8RqIzlX/JL5bSY6cek25OwKorjzpAeWzcJ
	 W10n52Fe7s398gxVUSKOXpgLn2z9LiM/SDxHGA1dWhZcGVZ+wiRGtuKaYdl1U0Rg7Y
	 mfNbl3xr+hFtA==
Message-ID: <sashiko-outbox-196799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc2: Handle OTG interrupts that GINTSTS does
 not flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-sf19a2890-dwc2-v1-3-d959375e26ab@telaak.dev>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
 <20261104-sf19a2890-dwc2-v1-3-d959375e26ab@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:31:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> The DWC OTG 3.30a found on Siflower SF19A2890 has battery charger
> support enabled. It triggers MultVallpChng interrupt (bit 20 of
> GOTGINT) but doesn't set OTGInt in GINTSTS. As a result, this
> interrupt is never handled, and Linux disables USB interrupt
> because "nobody cares".
>=20
> Handle OTG interrupt in IRQ handler regardless of whether the
> OTGInt bit in GINTSTS is set or not.
>=20
> On a GL.iNet GL-SFT1200 it shows differently: after a few replugs of a
> USB stick the system stops making progress, the console repeating its
> last message with the same timestamp, until a power cycle.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: only on cores with the new otg_int_unflagged parameter, which
>  SF19A2890 sets, in the one place that already handles flagged OTG
>  interrupts and with IRQ_HANDLED returned; the others still handle OTG
>  interrupts only when GINTSTS flags them; what a GL-SFT1200 does without
>  the patch, subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
dwc2-v1-0-d959375e26ab@telaak.dev?part=3D3

