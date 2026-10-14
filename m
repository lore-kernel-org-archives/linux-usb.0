Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE7C47DF89
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 19:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005435; cv=none; b=ZF2nSklSS25q23eD4YN7oHVt+Y6EE5o/6sMo20epIia/bKiPrtQC5zR+oM/MCTCS+q3K3XiELfMdTZkoal8n/ZhlmVrL1/M8Hszoq3I3TtNq+VZh3eWNf3iAC/V6B3j7NXUcUSyVqTs8gfG+voiQSz2zle0Aqt7UYaPR4Ttb/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005435; c=relaxed/simple;
	bh=j+GOvUG8Yi/ilpU8YGpIL4TMg1i4LhSya2RcN2L6A10=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cbGJc+B03uVSXqRU4Z9ZX9YZsDXMxE3ra1uoiS9Nr4U0Ur55NxjPK7bROqbqTfJ33G9sNDAl8L7pJRTvukqmiZlouclMwTmCdR9gPMqCpw/Ig7TNy1eQVStkzQIoRso+OG/nf3wToB3ZpNbsc0P48H6RPb+1TDSFsDZUHAy6QuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kvNe/7CE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kvNe/7CE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5C71F000C4;
	Wed, 14 Oct 2026 19:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792005433;
	bh=j+GOvUG8Yi/ilpU8YGpIL4TMg1i4LhSya2RcN2L6A10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvNe/7CEgh3C1i/AIgZJQQDm4vkcWxJsolR9P/ZcJEX/rMvX2tykos6AdyMnrDQy2
	 wlThUYZkSEs/Cdd0H+UdK4FsRTdgDnuLrW5IdWysERAvNJSgtjITFEMmY2G+t0xbuC
	 Y9olvDPC5Wakv33tCd2b+oL5j5HsUn0cqBpplHhQrWFcNQbenwp4Z1pYmYnz1kG/TM
	 KvjBgC5LS3dBxq8jFZqCHssrwFiOdEBwt++JKzC3zZSFDvgFKbcQ4JyyG/+sBhx9QU
	 b85pIPSWai30vYJ7gzWSTYniXsLS3usgBDKwlVnJtJ2fGR0+Z4Arj/tdsD41rkcVGk
	 B7nRp1JQxEsqg==
Message-ID: <sashiko-outbox-171773@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] ACPI: EC: Evaluate _Qxx methods exclusively
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QWxpIEFobWV0IE1lbWnFnw==?= <aliamemis@disroot.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014190544.150093-3-aliamemis@disroot.org>
References: <20261014190544.150093-1-aliamemis@disroot.org>
 <20261014190544.150093-3-aliamemis@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 19:17:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On some Lenovo IdeaPad and Yoga models, _Q0A, _Q0B and the UCSI
> notification query _Q16 take the same AML mutex as the battery, UCSI and
> ideapad methods. Making those exclusive does not help as long as the
> _Qxx methods still run interleaved with them.
>=20
> Evaluate _Qxx with acpi_evaluate_object_exclusive().
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
> Signed-off-by: Ali Ahmet Memi=C5=9F <aliamemis@disroot.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014190544.1500=
93-1-aliamemis@disroot.org?part=3D2

