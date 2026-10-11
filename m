Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9B23E025C
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 22:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758478; cv=none; b=QXj/WaeqK9+wUECsPKOYcHezFF4Rwe1ALhAqHI6VJfd68HzOMtTeZE+2eDGNwAuzmMT8c2xYwW1ytYXPTiyhxVZGEW2o7832B1V1uTquLpCncRzHQ75svTwGYNChm3fPidJm/Y2cUvhQmr7V1vsZWpuD6K7oY+sxThoyIoqs2wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758478; c=relaxed/simple;
	bh=JwE/jiKjJR9VJ06AI0Uq/o9zpLkrCz7Qkshi4tRjc3o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FCJ1aU+h3U4Od6+lTfUVALi/WCeeibkxnZJYlAeMR7lrK0+/ENyT6DgoThzDpCyiUM9eWYQhUs2HAN9qIRZHETwFwDTBky3SCuao1ZRfwgMsoihx+hw1PMzsacETcwEWpkdyXslKmjpI/nXz0COaaDP7D31PHBrzTDy+HfS9BZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkEvDao6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkEvDao6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA311F0089B;
	Sun, 11 Oct 2026 22:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758476;
	bh=2itYNMi/fFgfdXnp+VhqY6AICEYtza9zkSFxnWY7SXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GkEvDao6VRrCOVA5kXBMnEhux3EqptYfr1cxq0Bl6ejlqOGV7IwFxj1xDJd4wXsO1
	 xwCqXX1jBBWcPl5W2scEcM0PrCuwYnkYVOnwRgHnj653iXngcS2Obe2uVRT6Y5RIB2
	 brvWj+BWs/gRFQSB2erpVR0X7WIVM9UnpuadXzjaZgkZtl2eAobrLo+YMnimzzAwyV
	 t1b5ETcSzcEcQvKVD3Pi4KPzc6aJiNetmoM1N9Z0NkKwmrMdf2r5G6TXaQvYebTrdV
	 6/0DA92+umSk40BvBmk/m6RJzNJfZXwAWFTbeLKIVXSTQlpFgbRsqwh+6dw+zdOwQa
	 QUf50qN/S2HHQ==
Message-ID: <sashiko-outbox-167495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] tools: usb: ffs-test: return the number of bytes
 written in pipe mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011223445.2328181-2-sashal@kernel.org>
References: <20261011223445.2328181-2-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 22:41:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> empty_out_buf() returns len, which the PAT_PIPE case never sets:
>=20
>   ffs-test.c:551:7: warning: variable 'len' is used uninitialized wheneve=
r switch case is taken [-Wsometimes-uninitialized]
>=20
> Nothing sets pattern to PAT_PIPE, so the case is never reached and only
> the warning is visible. Return nbytes once the buffer has been written
> and flushed, and -1 if either fails.
>=20
> Fixes: 93f2aa4ddd25c ("USB: ffs-test: FunctionFS testing program")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011223445.2328=
181-2-sashal@kernel.org?part=3D1

