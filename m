Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353564;
	b=xWQB89QwW90kSC2roeVoYnjE5QC13LOzj1WPNlsUW2uwu0E5S/sagco9KE1L08XJVy7R
	 ROraUTfClPbJ/AEaHu86loGVlJ1nwqPPcH1aMQdF8LPLoTpCONDIBf7lxtYJobhX67S8B
	 uiiNP1+MaV1TMYSAj3QZT3LHAY8ajkViCpedDIKDAYO32T0jIBN0daJZzbNEY53cfAayO
	 kMV7ldv1fYEqXlA4x0S4pgWyz7wnXc/E38Xqit1xH2ODoHDK8WSHPP3d7ENOLM8w573lY
	 xgAJmh3zd9KkLAnSFh4f4lGjAaP4LEwbGCIDdjrQGw+lqjnzAl9Hr3Vm5h9jYjeXLvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353564;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9oqoVNo/F5RvWOA0dbvCmOEfRxeaHVB3skB8/fXXpJA=;
	b=4oJdp7UmTt/5WGP3gnGHAs5sFRiXryoQxFsPc3hBXQ8VihWMTp51BhtLWKyHAy7nnO/V
	 +bj95M7QSTIA0y66rmlR3lwTtHlt/JCw6sUPHFcKrBD2oSBQqfvH3XmwiphamJN7wq056
	 rbuN06G/GKUjwKGuv5HvX7yY6SAB7prfnDkyK5On+povH01EUzSPpa/l/67u2GgBE8yU3
	 I6DDTydHKz03CLiAcW8hZ+cbB0VX2a2E7jEk5j4T4/uywXf1yFkPHNgH45QLLBN+bwMA1
	 b8UiXbmONUwd4o3ZQqDAOiDiyneoRxKzefrelq7K7omNThH9MGiZdFb/a2298ipvWjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LB+U6+/G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B089E606A32A
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LB+U6+/G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655451F0093C;
	Tue, 10 Nov 2026 23:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353564;
	bh=9oqoVNo/F5RvWOA0dbvCmOEfRxeaHVB3skB8/fXXpJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LB+U6+/GVwYLDSvhPKZmZEs+adUFWLCZG7ZxU7NUtBp+TrYxYte38/BAracieCU42
	 UNtUZ/mJuEl/hqia2HcyEjyUgN2RIMiC3wV+HwTs8+0v7FOv+T7ukFQdBU6NNeJxXk
	 JHmBsl1RKLnd6peiJET5XNCpwpFePsDRUso9o5G2zfUFjZCdzpLL/8TvA+f0J93iKp
	 gbE7twTzs77xCIdki9cvdVWK+lulfOMlLsDjLZMDb79bViVmQwFvk5sUVLc9fNx4gd
	 tBY4a1WuvSLXXzwatbpegVkOndmdvBPVV8+6yhFmfKshaMQSnM/zr8WGBeDdCgeZnN
	 nvotYN44RNwLA==
Message-ID: <sashiko-outbox-207928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/22] usb: musb: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-16-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-16-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:32:43 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D15

