Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471343;
	b=LuUgn8mLRGbfF1nmY/CHVl0/7YweJYCk+CkkD9QZ6Y2LIeAeoigXkiue0mQRx1SmOqt5
	 yWvPyamX5meoJntT8qfcQrBDWShErUWpi7OagivQureugpB9Y0mwgtK/eoTFQ/oH9IbD0
	 QhwO/ROOhOH3Sc79nool9OWPd2napfNUoDBHtTkk5VgkvssrlRJAECnswYv5v+fQCFkLX
	 OILIvAVR8C5mF9VASwU4x7NEEnhXoDBwnmds0/XrVZQw90FwpgVrBgrxJGjZDDnW+wAg6
	 kcf7gNZXvOwPdnXyxze44jwRJXj8ss9LZxOdLCl7sqz6bZGUIqRhlQ5vYBTKSIHobTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471343;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VG2v0QX6kE6Vt4f8TBxhP8nWEQqg1bIR1nfSxbJ3xs0=;
	b=1V/0TmdL7DkmWLGPgOTgz4l1WrIdVCv1OOFV5iaK4TcF/0vJG5iC7IE0zrJunMKbJQnF
	 vWWIsz3WSJEuya7qKGDXXkegBDID7UMG1twagDbKxJSSY2YLS3YAnzKM1PXfQtJhI6+rM
	 JJJSnlDFodIN4Uas6ECKn7cErAayJMS/ffCzp/NR5/Y2yyIvDwx0Ju4URCCJvx0z4nI7b
	 kQihSOUrrSrI3h+sRVazXx/ZzXP+QYUpBq1TFcrCso6RZMxncoBHq4JiKN65v/7v01hkK
	 SUtguadg3mnI5T9x9dtC//MDs4C1fBPPs0QxgoQJVeuliaXkAFp70x+4nH0MZCxS/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tk62QCcQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBA3606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tk62QCcQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6141F000C1;
	Sat, 31 Oct 2026 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793471343;
	bh=VG2v0QX6kE6Vt4f8TBxhP8nWEQqg1bIR1nfSxbJ3xs0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Tk62QCcQx1idF5RmRgWIUvyk4oMylBHCpf0/TNtus9+Mohmn13KNLLJItaei4TX9P
	 8BEJXst9tsdcsZJshUq5TSiWGcSyVLEfUP4yswmqNGkOAODB//3vAzWNe9WEl6VnfX
	 pJpbzzorE3aF5vhpXep1R3C64fbmcjo/pbTJTwzzltkVDvsrMLcQMIxFoWkrNeHIVJ
	 cWeCNVrg6D+G/UhznCbRge05nkPXDxc8rdEr3Y5BVj1QvUhqgYWJC9edGZXrjeohT5
	 sXOvFNa87jxQIaBA8sgypxdTqfA2olj+PLhLsXgY7XoikjlPQZE4lWopI31JHPns05
	 pixeWKZoRT9vw==
Message-ID: <sashiko-outbox-192091@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: gadget: configfs: NUL-terminate extended
 property data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yingjie Wang" <x-professor@outlook.com>, =?utf-8?b?bGludXgtdXNiQHZn?=
 =?utf-8?b?ZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <7bb734dd2b0ef5f1ff7ffd9f1ffd8fd7b84e5073.1793470427.git.x-professor@outlook.com>
References: <179338899796.2590875.15337207674245295434.b4-review@b4>
 <cover.1793470427.git.x-professor@outlook.com>
 <7bb734dd2b0ef5f1ff7ffd9f1ffd8fd7b84e5073.1793470427.git.x-professor@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 18:29:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Unicode extended properties include a UTF-16 terminator in their wire
> length.  The configfs store path keeps the raw UTF-8 bytes, but the
> configfs readback and descriptor conversion consume the source byte
> implied by that terminator-inclusive length.
>=20
> The allocation currently contains only the input bytes, so both paths
> can read one byte past it.  Allocate the trailing NUL with kmemdup_nul()
> and centralize the raw-to-wire length conversion used by the store path.
> Avoid dereferencing page[-1] on an empty configfs write.
>=20
> Fixes: 7419485f197c ("usb: gadget: configfs: OS Extended Properties descr=
iptors support")
> Reported-by: Bingquan Chen <patzilla007@gmail.com>
> Link: https://lore.kernel.org/r/20260421141010.5607-1-patzilla007@gmail.c=
om
> Suggested-by: Neill Kapron <nkapron@google.com>
> Link: https://lore.kernel.org/r/179338899796.2590875.15337207674245295434=
.b4-review@b4
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793470427.gi=
t.x-professor@outlook.com?part=3D1

