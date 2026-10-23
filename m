Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758318;
	b=zUpAdJ7oqNAT6epFVyaAz7u6HbWE7nabAAyoCI+uEJANcr2pz8D/JH2CrG+eEz7RVgPo
	 ErRv58Ncrl3xVPtu3RbiuadX3JJdVAz62VfOT4BKTjTDzKfDlGzCGyjw7vlydE3kcq8vo
	 DngfL9VhlOLywkX7Mps0h0TkJhgd9QltGTY7HHNUe68xTKjuAslb9bBLrn7uSoO4C+tqg
	 +ZUrEeaJkfSS3F1NGxGzn/nGor3y5sfcmExnfZGoiNtsjEGIlx8kwHBm/iI1wvZF3vTVl
	 hqpXbrjdmWEc3i4MhK/mjXJ6Ccijeblwd8PuJLCQ+rftYHq2g45/yqdFwHWfz144ejg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sOr8c6Elxm3aL88AtoHqkU/4uqR24Z48wYmo3guYrg4=;
	b=V+/aRKQnpP7CZ4iUGF4neyzazWhEzXdzFciGWjHdEnfc1g7T4QtjsJsGvcHhoyC6U30Y
	 P8Jz28hMB9GGaJYxFpCAMqElI/wTR5GGF3aosl/Hu7ID4aUYVjSu9PNqL0VjyrsV1eK1O
	 b81hA0g/y5aHn+P1mT2PlLkBEuIhNKgZw3hF1P9+lEHYa3kXtWlPYu3YaKNdtY/pT3ltI
	 zENVMW9oy2x3nr4RVoESGDdU7HNOZzbw9BPyjxUPAtHWZNvhG7okXIO8zkhkR4xlnMtE4
	 Swy5fj713Q9zTEFVN6Khhste9xitRqvFNWrzOZJgEMI450kdLk4So4Y0E4NIx3QMIBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2JWQYx+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C2F606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2JWQYx+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0021F01825;
	Fri, 23 Oct 2026 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758317;
	bh=sOr8c6Elxm3aL88AtoHqkU/4uqR24Z48wYmo3guYrg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q2JWQYx+5NK9kGBn1pl9t3dkgnT0jG5XcknjKnJwPYVv7xZqymO4Tb5hnB7xMSoL/
	 aRJAyPw3hZKO5qg/q4D3pmrMlxbUJ9sBij+BD0TiGY4u1doygoD1GUVlOykfqPZMqm
	 d06AeezDSvMKy/6A/O2arVbMCJXmvVWVQ4dKRaGjR8UOMenE43QXB5pyUBPrpxlGQS
	 kj0uFFKtHvt55EFFgh7I8Yj6HOmXwfgtWFSVZLeYNZDB9uF2LqLt3B6Lv/XaivJF96
	 xOCNRo2WVghG3VgFDChQec1x/XjAw1CMWZcmVtS9Pn2uv9/6cqJbGmwpyFRj12ltht
	 7EHVzgk9iSTFQ==
Message-ID: <sashiko-outbox-182762@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/12] USB: serial: io_edgeport: fix potential fifo
 corruption
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-6-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-6-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:25:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The device buffer size is determined during open() and the driver
> allocates a TX FIFO of corresponding size.
>=20
> Add the missing sanity check to prevent memory corruption in case a
> malicious device sends a second open response with a different buffer
> size.
>=20
> This issue was flagged by Sashiko when reviewing a related fix.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260714101316.823942-1-shpark061104=
%40gmail.com?part=3D1
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D5

