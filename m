Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3A55008DD
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419617; cv=none; b=BUbO00YDhzh9WAmyk8qnIDa8BWaw/ZtAOEEPEqvC4dvBTjfU51TquwGDPoK5rluJ4CURnEE68OLxWUIbZaHI38eeb88Gp4500IjfjH5yLTVhYifVey+QsH3oihHGc2hJ3esE3C5+XS+FIjOVUnFluvwXEbQx3vUwPUGmJwYpMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419617; c=relaxed/simple;
	bh=bO4/DNwkHXfvLEEAXHdKXx/+x9KPJV75/dW2kpb2ZJg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ri9f7DQMOmyM4rhCK2AH3bvcw/UsE1aU02Z6E7PWeg223sRAhsmcLZ7I3gaNB77wU9Bj2Ggz1KlpSFD4HqQSEhjxlIn6dX6FC7EEAMc6FrEX0stTdZG+Sn57hV872HgZiYBbz60u7Bgf7/hIwqwDCDYIH2deLeNLk+En3CieziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMKuNHOa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMKuNHOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8B01F000C4;
	Mon, 19 Oct 2026 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419616;
	bh=bO4/DNwkHXfvLEEAXHdKXx/+x9KPJV75/dW2kpb2ZJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMKuNHOalijbScFWiuKmn1/JnQV6EIcVSnB7tuIXyQ3brxbPXUTdK/H6s5bJUJ8Hi
	 LCJuPrr3lrE48vsXZXr5FAIvKytNkpqjaVYHzw+smg5xu+QNo3ExxO8sggIidep8eo
	 Pw7Nph+HzjBySwfngSzKUR3G7m6mnhguVxb4/7Lgnnye5eweVJjCQL0OAT05cyR2Wz
	 9sS1t6UTfzRfk83/YN4v9DVh4wjeEXu7kGAbyVS4rBuI4BK6WMap1ME7xGBZmrU38t
	 +co0lTytYYHNPhogirzTrj2SFXqz7wutkYGJJZBGoQel2RKzq0AE7H667Z7goclVom
	 fo+nrD0sF9mAQ==
Message-ID: <sashiko-outbox-177350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] net: usb: rtl8150: handle link status
 read failures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-112-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-112-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:20:15 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Yousef Alhouseen <alhouseenyousef@gmail.com>
>=20
> [ Upstream commit 8c9c5b9a689612dcb92a04a4218c975cd19f19d8 ]
>=20
> set_carrier() ignores the result of the USB control transfer and tests
> the stack variable supplied as its receive buffer. If the device rejects
> or aborts the request, that variable remains uninitialized and the driver
> chooses an arbitrary carrier state.
>=20
> Leave the existing carrier state unchanged when the link status cannot be
> read. A transient USB error should not be treated as link loss.
>=20
> Reported-by: syzbot+9db6c624635564ad813c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D9db6c624635564ad813c
> Suggested-by: Petko Manolov <petkan@nucleusys.com>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Link: https://patch.msgid.link/20260630101216.10365-1-alhouseenyousef@gma=
il.com
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-112-sashal@kernel.org?part=3D1

