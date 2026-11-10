Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353665;
	b=ZQNYDpiH05REwt6teZQrDtJQ4ZmDH0w9dFwcAqvO14tPBnRClwBKH1dEY66GBuPjNxtM
	 gPCEfjejZv0f5kHhql5pajXheQcKFtX2lWPbfPa0xAYT+xY+mSgUKiONtNAgxQYStpLmP
	 NJLC+de+gIki4vepnZdt1fjetJp9N9w08/w4X3nMGmeh5sXZg6DEnPdPw5289b1U+J0zk
	 qNemhf8yAWeMnM40zjN0xgVt/qhnmCRqwvMtBBmF86KEaDYVkbqFlvK5H8sT5ZnoU53kr
	 kvpFKX2p0oCzg2HiAE1S2N4Ve6an2yorhf0qYpb3n5taEHD0lVatFJlcaUQnht1XFpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353665;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HdsDh0Nj4IrkaOr4ddrgGF748nufG5OvZxz+R/PkbGk=;
	b=Z4sYnrdNfZQhBh7jaLXQX1ETwY+I7xkAzVza9xTKxGyY3XvVnNfPGLrYKQea1EdhL/H9
	 juTv45GmKdeQRDolYzCItknjq0mtG4mc4Wj8qyja4aJvixQcn4oIpJrZXwDSzVGjtXwJY
	 0XpFSwNbjN/u6REbgFg7mf4dCTJ3fBswvV1mjwr3jVb38rIQFwhuXdNRu2IqfdQVd8bwl
	 oDc+bqW0Cq4KpbGjLY0eomf5socSo5fLCZgYCo6hV+hUxLn5q3WLB878d1XVgaUkqkzjH
	 6wGlYlJ9tsP8njqkwbBNJ4U7VbXT1kkkvhXuntAkaVS6oAkO9ELxLbz0YoZbm0M0k5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU61Y3n0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA5606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU61Y3n0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B31F0093C;
	Tue, 10 Nov 2026 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353665;
	bh=HdsDh0Nj4IrkaOr4ddrgGF748nufG5OvZxz+R/PkbGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FU61Y3n0U4i+WLww51A3d2Y9XqeKu9RcrjZ/EjaZ3mX2KO4MfPBJZkzYpMm2BtF15
	 SF8g2oRRRaXmGSZzsRPocMocebO+i/fiXnQMv+lFVH7Yzou3eXML622fmNFcCI/8x4
	 4+NhWkcDLcvYbZ8YoDT39XmbPwQ1AYSNIQQopBoj0lpDwbUh8t0qmtKvClKgJ5byDZ
	 OU0L1Ec59wKCyywXaS5UwpukyDLgblXbn9yVSteXBMCpZbzZCjGzOp1S2LJepgjfNU
	 9Io/AC9HSuUyXC9+PCETvpl2cCihSdtfwVgbFntj/GSujVonUF7iLzA4nDZmHUsGPQ
	 ozIEmddW+r6vA==
Message-ID: <sashiko-outbox-207937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/22] usb: typec: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-22-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-22-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:34:24 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D21

