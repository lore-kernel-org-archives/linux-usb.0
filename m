Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624431D72E
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 03:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860559; cv=none; b=Fi4OimHizyY7IeA1g6q6wIV6oSBppP45knESgPXjzVYh+3JenDvMtC3wfZfZlqJAyspdVZ5ULQLq29wFox9wcRVT9M0mCaXBrHdFdZpwauhh5ONGCtbFxycJPkPCh9SqAfAfl4y9qGwDcNQHSXOGfYGFr28EbzGadGhlE6zlIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860559; c=relaxed/simple;
	bh=g1P6Wcxqv2iEzBi/mg0tpcBM/KLLfpdCzBs65w38/3Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LPXG25GCEu3OIeeDZ8p4mN/QnbYX4BPhiwNhLQLXrLnblhwGDnQwhPV9dHCUY6AlESWlqv6eWCNphN4h6Qcq63728zfjGT4kxEy5yZ5RTFMYAPflNMH3z8fgv6vijzaWwuouNbqsEs6kaNO4fN+sblKS4QImk3YYraeIwCtHVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7wN5xxe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7wN5xxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EBB1F000FF;
	Tue, 13 Oct 2026 03:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791860555;
	bh=g1P6Wcxqv2iEzBi/mg0tpcBM/KLLfpdCzBs65w38/3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d7wN5xxeEBC1gzZ7D0O/6VQWYs3Lltu5x5PGStlxBdMFrBmyPRCGpvtQHcRD0VoC7
	 tExof1FXyAVJahxj/hxDKUNqm2kIF45Z3+PMStVQx2c15otPru6P+RLTa2QX22h8kK
	 PJfSSmbPJmuaPGhe3+ubBRDn63iJA4LyDVPH7bnUZFUQCjBvgxkfWRQgsFj8kTCdZX
	 ZIJgGtzvX2LrxDfwEV3Ies4XHYpzVSZjZoe4Y1r0o5oWwmJAlOmRVUhONYmVbuBbS0
	 pX0iky9WBe6jmvClA1MfBw0zLKmtojlm6It0bzySHn5EUbdFnO3Gj0qfmGRCZxoCuf
	 qImR5RzxmnVnQ==
Message-ID: <sashiko-outbox-168883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 2/3] usb: misc: Use %pe to print error
 pointers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Subasri S" <subasris1210@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-2-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
 <20261013-usb-ptr_err_patchset-v2-2-f83351b3fc3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:02:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in various drivers across usb subsystem.
> This prints symbolic error names (e.g.-ENOMEM) instead of
> errno numbers (e.g. -12), making error logs more readable.
>=20
> Fix coccinelle reported warnings:
> WARNING: Consider using %pe to print PTR_ERR()
>=20
> Compile tested only.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-usb-ptr_er=
r_patchset-v2-0-f83351b3fc3d@gmail.com?part=3D2

