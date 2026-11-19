Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109574;
	b=X+s8O+FJieylPiisH7XvfWs/DdakaTDiFvl2b1q5nebp0pY/EtCjF0QyRn6pj6ri3VXx
	 AP/Siy3sd3PyFUXy3WZA9dk/SQHohvExREn5BUftXWCY5j9pHUQMRvlbOxYRN3F/JtZts
	 JaC74FxOIYdWzBsY+HRjCCWTKxekjLPZw9Df1Y7llAz1z78Pg49drA1ZSQKTNwQJvD5TM
	 HpXaVmVy3gagupSoBdBu3EXUaEOxm4gyDE+gKR1kyTK4Ni9xNEUw7eFyVGrJH5aD6UCEt
	 L+sAFeVBJTQBaP7uJju3wDjcF+cuBGXKIPPm/dfn8SraOKRWZJ6NesqF59l31DOVyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109574;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qo13R3qB3of01vxseExrwE3p5ZiqUte+2Ymymcloc+w=;
	b=s1ul5JLxpm52zVuEO+YDLyQt3NRUvv4QZXwX5TGmRjib1Wq8WeGSROf7sPDQGWf1sNAT
	 yLTt21mKWo6axdKilh1iLJ3xA9t+hE39YUD7EE/6mhV1DMyCatuNTpeKpw4DtMaGXQ4Nj
	 mMD0udLV7CWYU6vri4K5OFk/RQIcIakfDZrYmZaG1+etAo7xKQNSBspkJ2s2S893DNlRl
	 nlX+h6rQV96J5j8Q3jNDENYtLOxssdjZ8CT1efmmRvW+bHFRSSnjzXTHggTPj+2lk50Nl
	 5YMuSIo1sKGBX4+zJifPNXCLGzk3k/IQs7YzMCzv2E/WNuU4UuxNScE/laeKxFQyqGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWn9nknP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4BC606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EWn9nknP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B377E1F000C8;
	Thu, 19 Nov 2026 17:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109573;
	bh=qo13R3qB3of01vxseExrwE3p5ZiqUte+2Ymymcloc+w=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=EWn9nknP4iy1p8BX+FmuUCUabMyNyiYJ/1aSk1j3eC4zj7KRxV4qv6S03ZwuJB3w6
	 dUMd2OLb+EXYDLcjm3cCXobblAewQRmMHW5JiUwHE7yDTkrO/XXw5LBJ9s2Hzw/6IH
	 hQ3FdkQWr224Od0s/8bFj9KC5l8fSFBbLtI2BOJ2jyqvF0tlGEtx9upVUUweAwcKRD
	 1/nd3UH8SQUXHzP9r6ns4msxlYgw+xS+QBk9DPfdtGCWD+iAkgx/EQQAxPkSL8w6NQ
	 FuC5tp9Q33EI3NC9XPEzVF0bA/i54hyDraqZRyWABJ/kDcDrQIyaMmiH6qvtwKj3sb
	 rXo2OYfxxFg5g==
Message-ID: <sashiko-outbox-223700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/18] thunderbolt: Use restricted shared flow control
 for DMA tunnels on intra-domain links
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-18-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-18-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:32:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Gil Fine <gil.fine@linux.intel.com>
>=20
> Currently all DMA tunnels use the dedicated flow control scheme, which
> allocates a separate pool of credits for every DMA tunnel on each link
> it crosses.
>=20
> Take for example the following topology, where the Host1 <-> Hub link is
> an intra-domain link and the links from the Hub to Host2, Host3 and
> Host4 are inter-domain links carrying DMA tunnels:
>=20
>           --- Domain 1 ---
>           [Host1: USB4 v1]
>                  |
>                  |
>          [Hub:   USB4 v2]
> [ ... ]
>=20
> This allows more efficient use of credits on the link.
>=20
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D17

