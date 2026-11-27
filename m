Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795817273;
	b=Ez39ZEIlIVefA3ZLzxQ9a6gdJp05gBl997foScJnhRlswwo62O8F2mGhP9obbeHlll3w
	 7kGPYlXY0kwH5I71xWGk6toiaK2GZmLv3negIgLKb0qxDR8I9WEiw/aS9rFrOn+bjPEIm
	 TST8Ni509c03qyr4ZY055r8sqzuDGA1bXEQAnrxO1FS9cFKO1taR9wajMyyrtbgURSRhi
	 fQAoeAyRY0RkfFkTSjchEVcJv3yo+ljTFN7vw0orNMzIAavToanAoWjQLmj8GukZQ0yFZ
	 ZByKmPjcmKToyNWldY383FSSapNesRtroNTxnnieeQUFS0MLf54HoO8FzJF9PMcNvPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817273;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Last-TLS-Session-Version;
	bh=kkpDH0s5GDKtHFMPeXowNNX+kHEJh5dyxIDm9Qkv7GA=;
	b=3BX+da+l1CiEpRgAOOkt9SfijZkFuzk0v8vNSi4nZx1GMnAzgL6+9SlFbS8YWopcVpO5
	 1o+biM45WhMX5un1rS8pHH/9q4cnGdtuZsKDb33AopPQYpSlSbDH5OAuuXOKgc5qP83/B
	 D+C1MV6Sh2D87IQxjXeNoz9JpIWyS1veQhyhmpKtdWDrIcM/c/MBTFfmIJkSblyTDJFUh
	 vu6YnB/0n0PtEcYwHnDSwextC2xS26Gh9IN13bvxcperfVIyoE6ocPBly+LbV1UoJIpcE
	 T445/67OSq8bHJAC/8kKkgoc0FL5p23LuVszrRvMLEYAhpq2hjitwx4lns3r+q6eARA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=V1bPZUzS;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94E606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 22:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA94E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=V1bPZUzS
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED49710B6AB;
	Fri, 27 Nov 2026 23:07:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795817266;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=kkpDH0s5GDKtHFMPeXowNNX+kHEJh5dyxIDm9Qkv7GA=;
	b=V1bPZUzStaX60panF+uxXYDoy8ZZKDR5tgtR58hrkS9r7V2tqWeQx0cOg/3vnZObpGts8J
	4pC91RPpetjdzAkngW/Xl9XGI1g4/uS2SCsKOSRrSpmY10Te4jF7/XbjYInSftnMHK42+K
	q4HYabMzTJa60NZ7XQu6zwBaVli8oS+52Mmzvkyf8B8BWwqaDWhCjK1QojsemN12GU/x9J
	7+00/hYy6SHiPGq1O22oaF9tVu1R1vx8yudatp+x3R3TXCDFGsvjBzBh1ft6wUj6Ao6rSl
	DuE1qZQXBs32SrfSWK0a4KqqkoYXSnnVtYoiDBOinuxkQ0hbTD3eznFfa7brRQ==
Date: Fri, 27 Nov 2026 23:07:39 +0100
From: Pavel Machek <pavel@nabladev.com>
To: Greg KH <greg@kroah.com>
Cc: dickson.wu@certik.com, cip-dev@lists.cip-project.org,
	Pavel Machek <pavel@nabladev.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ulrich Hecht <uli@fpond.eu>,
	Yongchao Wu <yongchao.wu@autochips.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 5.10.y-cip] usb: cdns3: gadget: fix state inconsistency
 on gadget init failure
Message-ID: <awn_K39uYLTg9DWv@duo.ucw.cz>
References: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>
 <2026112729-zips-gargle-7886@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TWFzJmxq5xwSAjKx"
Content-Disposition: inline
In-Reply-To: <2026112729-zips-gargle-7886@gregkh>
X-Last-TLS-Session-Version: TLSv1.3


--TWFzJmxq5xwSAjKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > From: Yongchao Wu <yongchao.wu@autochips.com>
> >=20
> > commit c32f8748d70c8fc77676ad92ed76cede17bf2c48 upstream.
>=20
> There's no need to send cip-only patches to the usb public mailing lists
> (or any other lore.kernel.org list).

Could you share some kind of motivation / background why are you doing
this? Do you have product using -cip? Or is it just AI advertising?

There will still be 5.10-stable releases, no? This is not -cip
specific, so I'd preffer this to go there.

Best regards,
								Pavel

--TWFzJmxq5xwSAjKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCawn/KwAKCRAw5/Bqldv6
8iJAAKC2O3bD19gBdFxZui2LzsEatqT9lACgp6WXxjp4dAEzNl+e865WW3JByWk=
=caUz
-----END PGP SIGNATURE-----

--TWFzJmxq5xwSAjKx--
