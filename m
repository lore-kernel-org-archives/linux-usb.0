Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7E84CCDCA
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559103; cv=none; b=sC0lDA11jyjIaEaldNILzFBbAnYZWBKEfd5Fh9HwHnZuhCgWgwTIGu+Ol8jIBFM/H+0OibIyXA03dkUWOUU74c4LKJGm1D9SrB/xWGEE04HXRFpI0kSbBuQFJaASPJFf2WlMfzQrTZQr3LrYdNPg6taaFLaqbiTpfeH0BvSC30I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559103; c=relaxed/simple;
	bh=cevxBW8m4IlN60/+eUAHaf6bPWsPqpd2iI4nCJs5MKc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rOsCuHdd3t3nP7l5eAQD14EqHuBMAuSGtb62F9mJVn1Uldw1VJzAjkfLri894MUsFKil0yOf5ZUrmpY61KAovysu0tRQBwEZWQ7b/oeY7GVjOUpNn7IJ2PrePoBqK0NX1H/sUfdz4qa9VjlKf2DUQRHToqioQVDEJL5mMEnaLlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYgHqvX9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYgHqvX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3921F000FF;
	Fri,  9 Oct 2026 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559101;
	bh=cevxBW8m4IlN60/+eUAHaf6bPWsPqpd2iI4nCJs5MKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYgHqvX9dogUlRLr3RVNtI0sU0gHwTWkncQD/MDW7F5CqFxt3qQKXaPdBBV9P2I8b
	 57tkB2T2Jvt/dijX4gt5tgQKDPyeHXbkysmqtxOfioqvrZZAvAnSYDv1PybJuOpcAW
	 Ia1P1bCtrSQbhyZ/3jeG4nA5VeYQbwWTrFlHuugyivLgEHXdMajw0xbpRRDBwgSEkn
	 QbKyUu6tG7ckWslAP82TMsTlVPmyDVjSb+U+HS5uFKawtmajkFPn5JHrSvFkvKaNIF
	 xwI3d/FsZm737AFeFXbqwdxuW7fVYdJ6HkhCdkk9STEOFB5AjSOhPqfHCSTKwg/oVT
	 vdI3Z731tT2pg==
Message-ID: <sashiko-outbox-165759@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] usb: xhci: fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-4-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-4-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:18:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Zain Aboobacker <zainaboobacker33@gmail.com>
>=20
> Fix various spelling mistakes in comments found by codespell.
>=20
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D3

