Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA14B515E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549985; cv=none; b=iphryj4rggV1ekbAFsskB8dKWlVJfOj9hz37lUUoaQgloZ3Ayc1PieAxOiMA8D6OW6gy36JBwdg/NR3C1p1B1ZymxHFME0QkIbyS8lBk6mNBG+62FB6dF/jU0R4/xDU545tPV/YhfGI1+OIUOJXWFv7lITH9ppA0He6WvEbOPrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549985; c=relaxed/simple;
	bh=bfOWUuGYGKGRrxkIRQ/MSlfL1mmypqc7XmQjuRONAdY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=J0iYxQXp5mwek12a4Ihfe5+qB4f3u4vgzb0Dd+eh8hjNl2Rweed9pcW7xde0xq+fI8t1rtBH3SRpPj0mZbOSHO/hkSAaJ88xLAfaoIUJt2VJlwqQr5fOrRonmsSi3YQOa0vrMu0sEMeZa7nSZgmpa5/xhP/e0yaxQ77boVKzNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhlJ25Ly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhlJ25Ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5107D1F000FF;
	Fri,  9 Oct 2026 12:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791549979;
	bh=UhRHENL15GksTvPnhLawi72SYpaBNJgbFyQPWvJKmVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZhlJ25LyccfKNFEpO0eSrU89E5Z8jPrkcvz++i4XpMu95jD3TQeGz2Yb1SB+AMj8A
	 vVQU4M5TqMc/u+okZfaatHJabiU79uTUCZYd/gqdlC5br6k+FZ1s1Wa5Swo5NR5eu3
	 Wb3WYw8voHQogyOstysZv8q+umZdj4FmEbq4J2DBnXOE+XFOPvsgIc7Osy5RGyYFfp
	 K5DxRln6LqbNfyEE5hO5NM7Ni8J+gvTA/A8b7nNMMHCBji4O+4der7vfAwrvN90M9f
	 DqJ4qlCvdleqJjW4QSoyh0VJ8u4gR8Jl0d0vpsuubks5JxUccxC3uB9YtFxSIQ+jop
	 FBqUPpdEZF+qw==
Message-ID: <sashiko-outbox-165556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: cdc-acm: fix urb leak on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009122934.464142-1-johan@kernel.org>
References: <20261009122934.464142-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:46:18 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Make sure to drop the reference taken by usb_anchor_urb() when removing
> URBs from the delayed URB anchor to prevent them from leaking when the
> device is later disconnected.
>=20
> Fixes: 140cb81ac8c6 ("USB: cdc-acm: fix broken runtime suspend")
> Reported-by: Wentao Liang <vulab@iscas.ac.cn>
> Link: https://lore.kernel.org/20260917161217.2161883-1-vulab@iscas.ac.cn/
> Cc: stable@vger.kernel.org	# 3.16
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009122934.4641=
42-1-johan@kernel.org?part=3D1

