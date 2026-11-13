Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530716;
	b=j2TCZbLboE8bXkt2M/ZubsTBEbrt88RxzU1fgzuA4h/UiMose3UehmBZ6x9OgIeT9rNE
	 6fquV9kP4m0Qwiy5gMei2hJJPoRS2PTECOEYCua0BmGouCrlJ9vGw6cFbP1HMKj39NZ6G
	 /kEjjJPfWdDjI/DCswtCdgYeXEL03h+EsOwNU/fVw7G4IcqC6ZiVqxLH4Muuys5hhUdGF
	 vXNAZlsc+YcYXU7avmjVZHYHC9lrQ7E/86C6mzZbDItvvffuB7wicVYDMX4pXfPIE2Xa7
	 ngw1MbV4LlczRtKYCnmiuzUUZL9CjslkaRJe8eywCDwId6ZbfHQ8BsGoxT7hlsp0O/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Ds4qMOkvrhq6giygG+6DV5dKnnEA+KGqgFfhBICUm8=;
	b=PYWLkot0x96V3Gfbps6ImzXxRgRDiuXgbJ1mXpHW74a91IWyHwbGvJOjJJ3h0Yhv7wrj
	 elDVefQgO5iGZJV5lORIQvG7BH6lEq4+/DhM0+8cWANY/w8qToUFM6HiWsV/5YO5KT0Mb
	 iFmZAEAuQeSRfLGx+s2mbKo9eX+pO+fwbK2d2MhLRCHmne+t9eD31JPP+JCO3+ex6FaRC
	 LF8+Myz7RZL8Frm20rTgQmgwz+V6brmDNuwIVZxLlIYvZuZp8TeT9geU3FmlhXBDZiE+p
	 dCMIk49wCTwpSuboTzjlnWIxcWsVtQf8ey423qkXnwiVv+HzPzutDSXSQLf7uKLbSWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=So6GSYy5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB4606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 00:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=So6GSYy5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0491E1F000C4;
	Fri, 13 Nov 2026 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794530716;
	bh=3Ds4qMOkvrhq6giygG+6DV5dKnnEA+KGqgFfhBICUm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=So6GSYy5Iat3ZTl9SUhYlM1W4CpC+dSJu4QStxpe+g6gGxmBprCcfN+wGW9gj/Ha9
	 CY1WNBk3Uq15omIJA4evODCCophDHHpbuqqB+jNWApyHSRZGBf/Y5tFehmf7djAnn/
	 nFuka9V+lZaCjGCSS/BvFhkliT0PpveVM4QMWj0SXoK5GiFfmIyKjAQeOg2060nJaq
	 q71kvb23qPx+VQqmjSdJbI8mPQ2Y1qGtYnzIikaNPPBwPNLsIZOVfAwJreaxo+GloP
	 rSK6p/gnV759ES1fPTZeR36unp7+06L29Ec7nQiLhvGsrjAo7NLecbyVCzgtNQvImb
	 oRhFuEnIJ+7Hg==
Message-ID: <sashiko-outbox-212002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] scsi: core: do not retry passthrough requests on
 disconnected targets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sarthak Kukreti" <sarthakkukreti@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113003536.3622755-4-sarthakkukreti@google.com>
References: <20261113003536.3622755-1-sarthakkukreti@google.com>
 <20261113003536.3622755-4-sarthakkukreti@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 00:45:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Unlike scsi_decide_disposition(), scsi_check_passthrough() matches
> SCMD_FAILURE_RESULT_ANY before checking the host byte and returns
> -EAGAIN on DID_NO_CONNECT, DID_BAD_TARGET, and DID_TRANSPORT_FAILFAST.
> Callers using SCMD_FAILURE_RESULT_ANY (such as sd_sync_cache())
> therefore retry passthrough commands against disconnected targets.
>=20
> Return 0 from scsi_check_passthrough() when the host byte is
> DID_NO_CONNECT, DID_BAD_TARGET, or DID_TRANSPORT_FAILFAST, and update
> scsi_lib_test_any_failure().
>=20
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113003536.3622=
755-1-sarthakkukreti@google.com?part=3D3

