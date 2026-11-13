Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552487;
	b=wBolEUFI5HPK+Zph3p1m0oYnzCKT8VVuK/k8oiegBEVI1+RBkHPg6rrjFDoAMx+5b3k8
	 ifni2Jb0vzXY/wsaS5qZK3znVFL7R1tuKQJXS06UbH/X4hKtar55G7rptOteEyzVqJDno
	 Y8qS6xlZiBmR7OvgP235J3Wz2+79j+2Fs1qZX3d1RgipPGEHbouYV2wo2PzmLaLd4VVUZ
	 SZyiVcSwuXhrpk7aKVrp9RSKdnagC9gbGNQo0CHJNHy79c7xSgUTCAL9AC5V+eZPR0n/Y
	 8ioAKAWoWghK7rG3KMJ5ZlkBvGSNeT5m7pxYvh4GvYY1A6SdeAlScMfLjf32bj0puig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552487;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZuSJwxBzfNmU1sVKgxKqQkuuvkTiFlj2Y8Tu6WwUeJ4=;
	b=a0jVWSvV0CTwCjpHTJAgLwiAYXnN+4pNGtEXE20zZzAUefo5MbDygGHPcI8othPqtD4W
	 bp19bxA8GenLIV++NYMcUkRLvgk3KV3cxpAazaA2rwPox6nP0WZewAimaq6SCKsHj40AS
	 dlbQiScb6KecFTavqkytnkacXuWqSvRdfkUSW82QffCbzexXLYZzLBgkUyZ80eIldSyDa
	 T8HZxxU/oaqaQ0Gvvr2ISQOX0kCDQdjfgq/vRGtZLrXaehvXMefwuU1bNrO4g/yBJxivj
	 qtA4Hu95pPIgtQ8eSwhN0cgwfzgZB2MFmJ6qiMnMVHUC6wLbh66GGmBYEXCFKfKCWEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvQlOFQH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD6606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvQlOFQH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFEC1F000C4;
	Fri, 13 Nov 2026 06:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794552486;
	bh=ZuSJwxBzfNmU1sVKgxKqQkuuvkTiFlj2Y8Tu6WwUeJ4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gvQlOFQHiT3GfRpIy8fvDnNZVUCkb/Y5dv8KoYF401FSELuawXb3x58xe3uE2J6Y1
	 sC242p0mQZ1bL0JqY4w+p2aBe3UFNQtsqZRmt0tXmFn92UzL05wDz0xygrEj8JqLKr
	 SacJ3TdHZkzkFkuTLUgW1PV+eIk0clh01pGJrKPF2HCjoeiQ30nCQJss4LdZfKnMeY
	 RuXwsYUT96zregHVcP6S8Khhnr4Fv+7IjnzEFqTdXqX68F2vTj7qOfVNEiexXlfKVf
	 dgi8RbV3W6yLIafFV/pPDNqcKwZfNCgnHiY14elMkmtnKJ4RWi9tV3qaSkIDr26A8k
	 i81+mlMhthhwA==
Message-ID: <sashiko-outbox-212284@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] usb: gadget: r8a66597: free the IRQ before
 deleting the timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261113063409.47485-4-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
 <20261113063409.47485-4-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:48:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> r8a66597_remove() deletes r8a66597->timer while the interrupt is
> still live: the IRQ is devm-managed and only freed at detach, and
> r8a66597_irq() re-arms the timer when sampling VBUS (VBINT).  An
> interrupt landing after timer_delete_sync() re-arms the timer, and
> r8a66597_timer() then runs on freed memory.
>=20
> Store the requested IRQ number at probe time and free it before
> deleting the timer; freeing also waits for any running handler, so
> nothing can re-arm the timer past the delete.
>=20
> Found by static analysis.
>=20
> Fixes: c41442474a26 ("usb: gadget: R8A66597 peripheral controller support=
.")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neill Kapron <nkapron@google.com>
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113063409.4748=
5-1-lui2012qwq@gmail.com?part=3D3

