Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445B3B14D3
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051187; cv=none; b=jKHOhduCO34UC+ubxEQa3AYiHRYKVciMSm8pcAzJvTu2OfoccdxL9UB0JOd0/JdInTD2ehlBGjeEhBkz5vc+DmM2Xmiks3dvRMtIc8l10cBGOXLjH/9BM4DVmQQAu2XH+sht102hZjD3IKV9UIUE6hihP8bOcKiUoGK1NuhoSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051187; c=relaxed/simple;
	bh=SLhPQnP4NxbW3VZ/dotUGF9ZwMMvNgkZus7HxGOhyho=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kFUM7PvGpKRATtan+9i4ceFQscpU46QJfD53MQoxJu1Bf0HxILdSMwyh4RRuyEfxspJw2OltOFweOIcZNQ/f8AAcQ1eMIjLi6M/NDkXvGudZKHHiWC1wgAyTVfcZ5amxzK7sK4wkHXAAoJDT1UJRuw2XzcoVE/i/2qTeFO+RNVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf0mAt0C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf0mAt0C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132BE1F000C5;
	Thu, 15 Oct 2026 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792051185;
	bh=eIbHhOslRrf/HdOkZssskhj6sxfL76bMS5PrIfaLpo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vf0mAt0C5qAt2NZj+XiIw0bNy6yTQq8JyIcmreTbgw8dNyVqYF7S9FDQ/XY039j/b
	 KtlxR8lTLqTxzi/KsQLWKFghotdIiDTFqztw7evbMqlBf/pwJRJENzpcAJhpFcdNaW
	 tbjfBL4d+ypaX2W9PBjFEC53NI5pTUt1VXysUBv/cNOOTLnZiqUgnjagYmYt70oIpa
	 Cp+7iYZb4fu5nvqeZcgWx+qVXvALwWJTh9ZSxP9WCDKbMu0nSAOAU4CZ5lQ/421ZBY
	 FnxqvaRLlQld2OGLp1QwRkcemPfEkqwlVuyTvuueuB354EkdqdA+1m2UU/n+lnrqZ+
	 w2RS6NGRL2Njw==
Message-ID: <sashiko-outbox-172441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: core: document purpose of interface parent
 reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015074831.1418677-1-johan@kernel.org>
References: <20261015074831.1418677-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 07:59:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> USB interfaces hold a reference to their parent USB device to make sure
> they do not outlive the parent.
>=20
> Add a comment explaining that this reference is specifically needed for
> asynchronous device resets and the device type need_parent_lock feature
> (to allow driver core to lock the parent when only holding a reference
> to the interface).
>=20
> See commits:
>=20
>   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
>   af61396a992b ("driver core: fix parent lock use-after-free on USB disco=
nnect")
>=20
> for further details.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015074831.1418=
677-1-johan@kernel.org?part=3D1

