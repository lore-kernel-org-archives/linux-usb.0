Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353564;
	b=W8eNV1VIS06+JC9rtXD3WUOct/pgmcwxTkcUUfmuSEP72HGpLzs7kY+clfUoa1Tpy1aU
	 Cg5ugIj3IyGaJPRYt2DcZ8/OwKc0hpWiGXW2k+pwyzfG7JjxJn3ZL0fm4ryPgSarkvHFQ
	 3NtjbtoNkDtvxjLVR/Y5cPoB0VRmLL0xsmjxKDsbJZR71+NgrHONs2961+2XzvLS7ata3
	 ZLrA8uEO5W3LkIbV15uLc1T/p4eTMuRYL9JdS0lT9evwz2qb8hB7wTy8C94+Ie3V+U3nY
	 SJPfhPssUVYlpa0TT9QWzc3fb2kOyHKhkSTQpLRu42wfuJOIAnNQnR65cJ5SDMDtWZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353564;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p87W9EMkk8uv8QpAr9JNyEfbq4sB9BIWlYeYxbEFYq0=;
	b=cgbOJBHRY6a7ZwdOHca7ErU8KBqG93GFTwwrN26MfDQcD9Co3K56K6kvrA7Nns2Xkilk
	 GKrgvdATIgS+pvIYE+EP0+uHCkblvfA9fBk9eYg1Tv+KmAFQ3V70iLnTiLt4Q77epBJUY
	 KrBjJDdNiG0lYbFKtvmRw01lf8SgggSGe3uBsu9jV4bCpJ2Iuh5jnfN14n3+JxbDzo5qO
	 LL1OKfiuTzusm3vfMaTxUe1GW6dgrOV936ZCKvg0AZeTJZ8O3tuk1Wl4msZ4lzP9yPwOl
	 s3Bi9Xb9DQ8fkHNcFcQZbWHl9Q1gJuOBVlYdJm6MoPhe1iywCuH/gkNfV1lSWTFdyhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqsfO4f0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4BC606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqsfO4f0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29F11F0093C;
	Tue, 10 Nov 2026 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353563;
	bh=p87W9EMkk8uv8QpAr9JNyEfbq4sB9BIWlYeYxbEFYq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqsfO4f0Eq99WeHMND7O7kvDrdN699yS+0S4p9YTHMvrfz6AsfeUVJErGfekXcuX9
	 /AMd13frmHBQzun+iNOlAocgkbFBOKQgdzoFySwAxTNYxoYpF8W4fq0QEJ0iNsTnkH
	 YsmV2kULrkHxJdeSaMW3/9AkoQ4wz/JiE6b0ds541MfGaceIMzts4gxYEkzueyaIOz
	 nu+B+LA6W606I7ejugwKc1ta0nwmbIlcnixVZjUK8kwcxiyRlLYp6Gjuk1rM6z+fw/
	 TEaCxQCi7KU1CwdYaeTLayZ8jIOmirKdMSA07vYc+NKU8eqf0TMv+kOYI3KhoMkSRh
	 Ola+dUQSae2EQ==
Message-ID: <sashiko-outbox-207927@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/22] usb: isp1760: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-14-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-14-shishunbo@cmss.chinamobile.com>
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
6-1-shishunbo@cmss.chinamobile.com?part=3D13

