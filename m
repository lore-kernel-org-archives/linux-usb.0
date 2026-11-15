Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743686;
	b=pincPsYul2mzDGgepOKyu++SUb72HHtFNcuwgqq6G9bYuPO6K+DI/g4EoUWp5VCgI1KZ
	 uAiOgt2mwhdtuSYtLT/286HkNB6ePjwXSULJdJN26vyxiKlZTT4zISgcIzXEqJJLRrF+6
	 hozqhdXC6f77yjF+o2CZV6lTJf8l9+0q99Ud7HRr0R48NqU3k3yFoRVLvKLKH6O3Tgfzy
	 VI5N05sC4QO1t3z3cxCB4itX9jlFyOHj9H0X0YpoVf/w06+OliZA8tICoOLsKkz7yuB4f
	 VWgH6a0vsERN+N5ChYP+SINTFWNjmXmVgctQB925JNp1uI2y9XhXhEIrQbbKUwp106A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743686;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=unBmcGvO4FS+UlY++iPGO/ZttbdIrUg9F+JJgklh4Os=;
	b=5tkNgfCClZlfwFo1wqRDDFRM/d22qrhHE6UYVYX+kFZ1KDf1EtXPwm3DHNpO6X0AAwHz
	 8roYl2E07d56/HgioIkrIRNATMBwe7dA8PITiEQpv0DosUWqmWNzRLsB7UhQr6yxDkrzJ
	 GUtefPZkVLJYUiscfMR0SKZl/+6+t8a6MY+gp/J19VB/0HAvkJ2ZGDgPiyfFJOt/0o4Vd
	 LGFnwQDyF+JtzwQ13PN3qMH2gxPS8r5YwINBa2MWMJRr9zZWgiwJmX9+5LIVxYcMd6LTy
	 7eYr2AiO/3vY9gghWhCcZ5KKszMpr6JpMv2sLN8Tw89S3p+JX5uHszL2NhI3eqP+Lrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B89l+e8I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295C606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B89l+e8I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7093E1F000C4;
	Sun, 15 Nov 2026 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794743686;
	bh=unBmcGvO4FS+UlY++iPGO/ZttbdIrUg9F+JJgklh4Os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B89l+e8I2pZibolJTXRJz9KiBHVIXCCdhTMA+EN5W81ulIXbe29/HKLoPGzW50dV/
	 Oa/kOMDYjZN48OjQVvqn85qeyiQx3nnRF+rKqNtK7ZQ9Kgu6BDidNPxG5WJrp6iV1q
	 Kwx4dXiyoq4jT3WQCiZnhWEXDzaTmCq22Em9QHYGuinQ6GWLvwmRk+YJtbXGjkzEY3
	 vn+6hJM792THAkVNrHjbmXy5vGM+y/v/LD5gz5xmTqwDJ4eNcjaZNXPPJdoKcw5YM4
	 X8a5Au5vBImMyDyOFJiMNpBD2KRqo1PmAzI+f66/+ELtVjdVbEHx1Jl5kFRQvyy3Zu
	 ynvyb42veKZdQ==
Message-ID: <sashiko-outbox-215460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: lpc32xx_udc: drain pullup work before
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyan Xu" <getshell@seu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179474326988.103840.10326852247134349070@seu.edu.cn>
References: <179474326988.103840.10326852247134349070@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:54:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The pullup worker accesses the transceiver I2C client and UDC
> state. IRQs can leave it pending when remove or a late probe
> failure releases those resources. Cancelling the final pullup
> work would also discard the requested disconnect.
>=20
> After the gadget core has stopped its callbacks, explicitly free
> and synchronize the registered UDC IRQs. Request pullup-off and
> flush its worker while the transceiver client is still retained.
> The worker needs no UDC IRQ to finish its I2C transaction.
>=20
> Track successful IRQ registrations during probe so late failure
> also stops all acquired producers and drains pullup work before
> destroying DMA resources and dropping the I2C client.
>=20
> Found by the author's in-house static analysis tool.
>=20
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Cc: stable@vger.kernel.org
> Suggested-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
> Link: https://lore.kernel.org/all/20260928134158.117-1-getshell@seu.edu.c=
n/
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> Signed-off-by: Zehao Gao <gaozehao@iie.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179474326988.103840=
.10326852247134349070@seu.edu.cn?part=3D1

