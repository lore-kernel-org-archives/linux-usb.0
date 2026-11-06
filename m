Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972754;
	b=Y7rWHNEGPdzGJDIRZGD8lF56XXPKagGY5Y2bTlXcL489s4QJJy8iSNbfI3wwck2UOTYw
	 4qCfOgSbtP7lIOWVA0RePOcHb7nIpN8iKzr7TdkLvck8Fgn6jAhxcwwPmTFPXc+lRkFu6
	 Q0RkvMqG7s/Yo17zwDNla4T5NHvBQ3PBNKGhlx5pQvzoSRL+lua5NF0SGYpHUaKqUwaRP
	 3jPtY6MD5DazRVJ5vvMXzq8kLmzHIM6RmDZl7Faq0AXPIT+yhMgi20RlcOu+Gue7UvaDw
	 f3GuPKaKCH/WHUNz/8s3lZMv6KGEz3X+0vmrGqCK5hSd0bKGcXKvpHouvQ4lkq5x0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V17D5hIRtwkfaz/BZ/DBymKCGQp/f+AlHsdKyAjzcJw=;
	b=l5fjOnK97SvCIf210vGu0FlD6/nwPQP8MP/VO0QYz3hJYN/0wuvMsErSF1PF6sQpkf3O
	 FkZXcPQWAHmUT6jucF/MSQOMAX/YtnpLL1kpUTnYNG484Spe9KBVreAIDlzfn5prwsfhX
	 bykHobRqrVkB4xPKadFsyuwwDhBf7hQ8o4lCT9rlz9jUc5ZA9L6m7gwcRmfm5uwZdVXOi
	 VU8CAD+ekJ9VQfd7suE1h+MBm4XYoCLCQDtYZMq7jpJG5TqU0m5n7nrAfw5ujBJaF0/cI
	 QGCLh63tV3wvsD5od1pXgV1xi6qbMHpNLORFwB3ChDSbgkkoA6puwTfBi+JK2LKIU9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVBn6h4b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F57606D836
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SVBn6h4b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E0C1F008A4;
	Fri,  6 Nov 2026 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972754;
	bh=V17D5hIRtwkfaz/BZ/DBymKCGQp/f+AlHsdKyAjzcJw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SVBn6h4bt9QUm7yC0drkOKZg+ajnDc73QzFtKYBE3gKvuyHSTyUM7kjYtTXgbEaR5
	 41R40e99QKLphBsQKSSBK6L+yHerMecDAOu+FCHKPPY/oSI9hNSkkpASqsUVCTRwkA
	 fRnU7cg3xVmIMRu9Ifk6OvU/wOPqmW++uAfJXCZxUY71m52urEQ3IHCtHfjP4XMdtW
	 98Q7n2UedWmunF9cYt8g9CtwnaN7o3mdWFruQW5peMZVIcERaA5vjYSirhBww6Mu9t
	 padHOh9fN5zCzwijs78X61wWuUdeadZWvBy24K1W9+H86o3p87B3VOhSaW1SBjQbwa
	 5vlKv3MtYZ9rQ==
Message-ID: <sashiko-outbox-201493@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: chipidea: remove redundant
 pm_runtime_dont_use_autosuspend() call
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106133933.1577-2-crofts@kernel.org>
References: <20261106133933.1577-1-crofts@kernel.org>
 <20261106133933.1577-2-crofts@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 13:45:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosus=
pend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>=20
> Remove the redundant function call.
>=20
> Signed-off-by: Joshua Crofts <crofts@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106133933.1577=
-1-crofts@kernel.org?part=3D1

