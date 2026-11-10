Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353639;
	b=R7viayX6J9++epkbAOXQe72rmWqe4U+sdM6Gp60ZQdvavNGyJ4ZgMFmRIBmMISe1uUUR
	 rTg5xzCxK7UW6CU4V9EzoFWU/7MLxY2Yv2kb5KyWt62MDfZ51JmgP8DzwVAsRokuAxT2/
	 bx7zVc00leTvxCa1R2rtMnEv0dMVW3JQVshkYYhbxlWPlkFn3KurlJNLA5GQpN/3AUxGC
	 AyJwCw1fIUTObBHL3zBc3vTsqyklw/aC+D7Y4oECgCSgWAi/+fRlKMDvJiY+cS6AE0bQW
	 Rk9Oi0aTopWEaw6v/dNx/geYQXap7KgG4UqcSd1xhgFSTKGr9hpmo2zgUauXNq9z2yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ACWXT1prhka4nhihvCfSWnPqZkaVrDTx17qKhTXjPZI=;
	b=sQ/jmeJm4BDSwVo0f93W+9HmXFRIqhAJLpDSBUXHrVHX34ljTMwVzG78I3T1kvB6gYEw
	 IgBPQZH00d4oO4OmOn/YuXIeKI9t659IjcdxQ2/LVDQjdHY5HxxjnQvdP+m07sOM/ce7z
	 Qf5oLzeylpxbRzHj3plctkl3JprC1YhQirGQ0ivwBfyciY5P4jlQ2EtfJW5+p18aVAXhL
	 eGzOOMol6ZlJxVqQPMxitUBc0AnCYlQ8pmNFSaVXrhn0gdK90ND/ujmvLfrEK2XqeXNB6
	 cOWJcqO2qh5AcnYgQUxte2Hvb59uDw83B+wvzuNI0+A7dbep6+SKJaLWOCgSRjXuCHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qg7iKYJs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFC606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qg7iKYJs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F7C1F0093C;
	Tue, 10 Nov 2026 23:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353639;
	bh=ACWXT1prhka4nhihvCfSWnPqZkaVrDTx17qKhTXjPZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qg7iKYJsnsHQndJ0lDWBuanRgS+lvPtvlNhV291T2HX5iaNL9+OoExK2n2segNNe/
	 v6TlB8+ItufZiyx4O3PVndVlkwawbW1YfefgnlzI3gELKCRcKsfBMRfxtbJnb489jR
	 RFcomrcSWO/nxWgo4H7PshKq/I0rKThvR2Rvr3ZCsDEJmIxeVdXbBLhP/GFO+sjzuA
	 JhA99Dotexafyk6aTow0+DOvFH18HrzUy54Ccr76bPkPL/9zT8Lz5Qco8Ehhr44aX0
	 IRO6bjgv6Chw0vq1axEsQq+UNO3znLUfBZcAeIAXJUPyMk02nPI1AUmjT15v5AMKX3
	 nWS7pkmW8dsOw==
Message-ID: <sashiko-outbox-207936@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/22] usb: storage: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-21-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-21-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:33:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D20

