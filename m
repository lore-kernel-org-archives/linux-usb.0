Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758464;
	b=sHxkb0cUQUGYrSEemLyv4doWAoxGRptIIU9dorQwnKetDQBMgF3VQeVh6t8vphS0dU4e
	 mo9mtIDvZm3CBtKP/A5hYGgIwn2sYkyOgfxvfFsjG3rMRCG+nSFQ2OLtB6Oo4r99q9z7+
	 va4OUXTxcKVBzuBzsOKVPmxf61tZQJRe1yTYfrzQKmX3SslvxERWdQueN8S4Ig2kRAE9R
	 N0mulwXzERsXAd6mWwqkgsujO2cXbnIUahDwlUwjzd4H8egTfq066Iau+9LytWE5Ht8cP
	 BJX2EyNMGD7UIxCFv1OSN55Z+bhqycHD1FLLJ1qXtz3a9MY+qUNkn9R73K016lC9ldA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758464;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=moVYeSBVDEtOMFfwazmj8OjnMvWCZAt8/2oT+OOXEHI=;
	b=qOqcLwuBy1V3SN9819ogg1agl75NdGeUILAv1Q1ueqfON+6glktmUo2fLQroawsstcL2
	 gA0NlUXSe/vgiNw1Ld+cuPTNVgdaPzfY1aCqgYdpngtApVbEb05rBXKMiA46fe8DSRjO4
	 GusFGkH1mIDJ/luIWIV+/4IyzJHMFE+i1MmwIT819oAMTEYVbrhy25+PKZ2qRmx9/SsEw
	 BjeNXiLcmSEHtMSBWlGUpN7UmwDtQG8btDHRlKVv9AQd06KlZsbousLwsz4/cCtQ8t0a2
	 7MVDtgw8CM3/m4LI++1R5LhYpE10BIuxYxWEYEUua4MahkygAWFXlMvL8yE4dlh7eIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnA9zuQX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB66606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KnA9zuQX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866C81F01825;
	Fri, 23 Oct 2026 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758463;
	bh=moVYeSBVDEtOMFfwazmj8OjnMvWCZAt8/2oT+OOXEHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KnA9zuQXZStSwXjcqphUETRELD/i0ooOPd1DP1f5YzkpPPusuYIUvX5piXKUdU6yW
	 Nuu6NgoOMX+1q7yL1eOkYzXWWrM12y0um0C9rzKOJHydviqehzvj9Unrd2eS2LFw5Q
	 LMfUp3+74S860/WoHho2RTFvncHA4FydqrsvdikqTky/B3ca5lmoJHskZM0i+6y+RT
	 hDdn1oXFkgStTzqAGD12x2FoGm52Gxu21nUyhetHehx5spxwRecSK86xktuX/oAkGE
	 HUYBgfb2qnji1NM7n40N1e1nUkYOTrKSyEGKGXfp/JMF1b84pKdSb7OJge9SGnHfX/
	 LFia/7OnJoGrg==
Message-ID: <sashiko-outbox-182765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/12] USB: serial: io_edgeport: drop redundant open
 sanity checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-10-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-10-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:27:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The throttle() and unthrottle() callbacks will not be called unless the
> port is open so drop the redundant sanity checks.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D9

