Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060976;
	b=rqgYkzgOFJNaVjz60P0+iAonuEwxCbH8MR3urxBGyJeKbNaKJO3eLP/SZwUWqpXaJDmd
	 izc+gfaORu/lOtet6vfOAXT9NFsXA1YUybRXiGL2NuU15TQ1hXIWeTpIRLAfLvbl3m9eG
	 5NQ9dd8FKu4gtcIPlIedRxpKn1GNPoAHHr6zbvsXUSpPCsIBJcU1hH4WYdiFaMpcXpvm8
	 giSsLyP0Zexaa9WEfYNiXhheShSLrnClvydwp6IFxZdFddV1+uGKzpVoLvwe8H5WVUFZC
	 OuxwhbLIQ+7/U+Zn/ZvG2BcaoG05Jb72EjOyctsnU3VweWfQ1Ieior8Ovv7fFw3E5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060976;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j/lkb5X1Yd70b4cGqNT30AK1Ltb8fsDKqsvBwY6JpOE=;
	b=KnpcD+cuZ/i60Q9Q50P/AknBBKbSxZ7hNAnzi1ocBew1reVcYyzMTDr+aI0B+95u233k
	 ZdT0kP/UxnYKqWVE2HeAeSR5iI/nmohaOwyIYHoSX6uuK6gj4DctdxQCobAAhIqyNKwtW
	 XVoyXY6x/6d7PJLv6t1ml6Xu2CkgXvK1XriZyYuFKEF7wRR70RJs9t7KpxN0RX+iE6DZq
	 AA/PnKREdJbuHzoI+QRgg50mR0k+NAQNUTgHWUWYle2k7uZGkQURxWD+J0KMO4I453p/q
	 DAll1ucsM6m5pi33uePVcUVmkcvMnUlM19HIoF39kqqBVZIF+3k5Ts+okSLK01nrtDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTLH0snb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD80606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTLH0snb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC31F000C4;
	Thu, 19 Nov 2026 04:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795060975;
	bh=j/lkb5X1Yd70b4cGqNT30AK1Ltb8fsDKqsvBwY6JpOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RTLH0snbBuDqL/vBLdIlQCrfGB3fjcbe3L8DGX/GI8UI62NGQq6qtQ4HaV2t+5ci/
	 zKU/QqQ5KHLbXFUuoc258WX6utEqEqacW5kb+EAZEPL0Jd5ztPRyDDmjXLRrNlqsqp
	 LDA27zwwq6hwFe3pb08epjHpDeqGGGxEmFT/pYGBZl3iL2Z2o/uQt50xHcp2jj3Gs1
	 8w0TDQG7HStEq4oVWlPEjlC01oOkIRZXqhgxGJi9fBxwQ1NFONB0CV+uTcTJ2Svj6B
	 5Dsc6+7R4j289yfe+QcEr2VcxCOfE0EN0SLKXbFLcojDa9aEOHVML2u0qoKwY9OtkM
	 kEgvoWKzu700w==
Message-ID: <sashiko-outbox-222430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: log invalid UCSI version of 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Blake Alexander" <contact@blakejalexander.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>
References: <20261119-log-ucsi-firmware-quirk-v1-1-6d42d70a6158@blakejalexander.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 04:02:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Blake Alexander <contact@blakejalexander.com>
>=20
> Some devices ship bugged firmware which sets the version of the UCSI
> mailbox to zero. In such cases the ucsi_register() will return -ENODEV
> and the driver will silently fail to bind. There is otherwise no
> indication as to the cause of the probe failure.
>=20
> While existing (and future) machine-specific workarounds may resolve
> this issue by assuming a known-good UCSI version, future devices or
> older firmware revisions with this issue will still silently fail.
> Both users and developers will benefit from a clear diagnostic message
> when troubleshooting this particular bug.
>=20
> Add a dev_err() log message when a UCSI version of 0 is reported during
> ucsi_register() hinting towards a potential firmware bug.
>=20
> Signed-off-by: Blake Alexander <contact@blakejalexander.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-log-ucsi-f=
irmware-quirk-v1-1-6d42d70a6158@blakejalexander.com?part=3D1

