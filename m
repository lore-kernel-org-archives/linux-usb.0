Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629643;
	b=oSh+6Z6/lQzVmPE+ZXjXuXj4dKUbddERvwHWtfgy5tFr1xjYwir/EP+R2Z/REjgLkBB4
	 Lt5ZdX62+sg7TL3eRndgOs/YpFFXEvAyCFFf0zrKC+IZXP+Df9NLLvX5S+mypbXfVQm9F
	 qNYUABaJ9B97FXIl7N3L3b5hErQPsVELp9/c5UxGH96mOdG6Hd/HzCik4oTlLw7YYBV/3
	 HC5ibYEFBOrLAtRCA4ddGzKSnD7T5oZajbOW+5wXoCdAWErRLVx549ibPHqkWOrtAw9Ei
	 7psObiGVJMkIi1/eFqXNjvjAJ2yHFFPW+3ZVc+Q1kGrL/JecjApLorVPi3bvr2JR7Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629643;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9AtGp+fsb8J4ZnRcD+G2qEMKNGnVkDM8j6VdRyzioZ8=;
	b=onMs4aNcPv6fxm47v+VSLxY7jylFGldu/HGMd7uo7rHO5P5h3wOfAeMoaa0dPbtN+vR6
	 AdT2UqHrtFRWAjP6Tfx+lKVvL+8XZc78K+vibLZZeD1Oy6OOekoyQb1izGYHYbzTsUMjh
	 5is+pC8IqOXPtpl7JkKZRyk4KMaXeoAZzXH6LsBAZJGjFHGmkvOU9yknJ9p5rGKaPg6qK
	 JKN0CKzvn7+jI4/hH+DgbDebyOKhQlSkI1XrOtIRNfBim9acXlk5ofKNoUWi/GTGQiCob
	 tdk3hADX7vTEZnNjLoaCZzG4roVQK8f8EstW8DaOYp1swmx5o7hOXas8J0Jk2VnGg9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmZ7d1aO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E1606A580
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nmZ7d1aO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6341F00A16;
	Mon,  2 Nov 2026 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629643;
	bh=9AtGp+fsb8J4ZnRcD+G2qEMKNGnVkDM8j6VdRyzioZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nmZ7d1aOLsmkxsrUOdzdLm3oXHlHmZFWKJk2EEiq4oEUybu9tYhetrNygpiTVvAbO
	 6GECGfhoUY36Tlu+WpX0THB60ZMs9rhrBDca4QjrTKU+AW6xxXQOPKWKeP+Jj2aga8
	 E8mPVZOInr/FKL6Up6VfPIiyIZ2BkJa77W1I9Tm93/Lx0AWfWO9vV9KQG6dPnRrYnV
	 9mIxl/W19+LBl9P/cu41YECobsXp2C7ZiU0RiSr4bYm5+jMrtbqboD2B+TS/hpkYPT
	 bcVHsM/kjnGDjBhbQDOkk2OZC2tWyqwpG7q2V0khQUKVyC0pliG6J2fUAJzofdoMxQ
	 ik7qwg/4Dyk8Q==
Message-ID: <sashiko-outbox-193571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Record the partner's Product Type
 VDOs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>
References: <20261102-tcpm-product-type-vdo-v1-1-02e90dadbc2d@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:27:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A Discover Identity response can carry up to three Product Type VDOs
> after the Product VDO, describing what the partner is as a UFP, DFP or
> alternate mode adapter. The Type-C class keeps them in the identity and
> shows them as product_type_vdo1-3, but TCPM stores only the ID header,
> Cert Stat and Product VDOs of a partner, so those always read 0. Cable
> identities already get their VDOs.
>=20
> Store the Product Type VDOs as received and zero the ones the partner
> does not send, leaving their PD revision specific layout to the reader.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-tcpm-produ=
ct-type-vdo-v1-1-02e90dadbc2d@flipper.net?part=3D1

