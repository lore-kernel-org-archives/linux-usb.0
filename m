Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501154;
	b=p66OM432feAKHlBEj9kT2l152x9Hq5ZWJqBZ2FsIoqPnTjMWwIvApbhngoIi/t4jl75B
	 /Jg9Hw48Q2qPKB+jNij5x1OKh4lw16JTqd5tNTHcOX0WqP3JcGtr/n6fhEWnBMi7GX/kq
	 hQmr4LCu5FOZ56tDfMGcR+z/UmPgv3qT6DefRlQMCz6xRSFINewbONhSogeBWXUcQbQgQ
	 afr/sHX6QDDMdEfYi2h2kwrqLyAv9fCBgTiuTnGvAO0kXBPstqrRhz8ClRsEAgKGVqInL
	 hdlmKtnN6c0SPgtcZeIPiTWxW/rOSLSaQehEXzxvdBmj8apBX2HeD213RmL2gsEGRWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501154;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K+cizby9Q/cIsr4KsVHe0/GUOmN/VD7HeRaUArhLt8M=;
	b=37lUCAQrgtZY0ZnrJXYjMGJCq30t8oiLcH++8QmhO7Hh6cTrOyX9DUNbHIEbUx8kVDmo
	 v6fUyCJw1HuezwrBE7BAAs/kG88OCgE54MXOjOi53V3CYWqVNB7x+VEzudeMV6SEUJm9X
	 BNm4Sy/LHQNN84VjW1JyF4Go3GScg9FsyjPksZCXAkkQ7OlqZJoCqW/6+zw2qU7BA44/5
	 mHJWtWh9O/fYvyoQUnk8o1YnVgDzszzBF4Z0/0JG4as16i/AVALnfi19MQzqk+KmsEOG3
	 ibIW0j7XaMnB3vUWcle+Of9esbqGZTO+vht5OvJt1DwZNGbuuhtO71fWht+5i8xyANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvvFOAPZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C6F606A323
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AvvFOAPZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5179C1F000C4;
	Tue, 20 Oct 2026 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501153;
	bh=K+cizby9Q/cIsr4KsVHe0/GUOmN/VD7HeRaUArhLt8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AvvFOAPZA5Lhtb0broI2h7IaiUt29YdV/iVSEGwVxKb+h4wbA05iQjp9krx6JXKQs
	 Lfi+UAG0LNfQ2MbXbNiXRVXwOoGjBmMjgNsjyw07ql/6WtjoCDOqKpRbZ5OChD2Zx0
	 t23xJg4vu1T9WOSxW35+y6r2NTZuEIoBJp5MIC1zqjnlqbJsWmeh65D6qSw58dh2bf
	 wbW5WoKaTAz369F4nrKsJ05vXRwgEpNa3xNrxRwYLRuLMdo48Px44QZwdzA/eWqOoS
	 crHL+cEs6DdbzWtsxBmSQ1nP9kMqiF0izeacW49ThREUM9YPj0ioHX7+EpzrZN7wdU
	 ktZeNNtJ+I01Q==
Message-ID: <sashiko-outbox-178981@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: sierra: fix runtime pm leak on resume
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020125347.2145928-1-johan@kernel.org>
References: <20261020125347.2145928-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 12:59:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Make sure to balance the runtime PM usage count also if delayed URB
> submission fails during resume (e.g. to allow runtime PM to be used
> after the driver has been rebound).
>=20
> Fixes: e6929a9020ac ("USB: support for autosuspend in sierra while online=
")
> Cc: Oliver Neukum <oliver@neukum.org>
> Cc: stable@vger.kernel.org	# 2.6.32
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020125347.2145=
928-1-johan@kernel.org?part=3D1

