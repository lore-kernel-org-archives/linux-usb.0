Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7146A37189C
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615983; cv=none; b=VfavHfR+nR/bIgnlw/PoDhg5CVAuBfQQ9ox9EI+fV4rWphEZMKztsmqP0MmRI14f5/K/Xg1gLPBsJFiJF8urqRWquXzYXY+ewb8CX+FH0YFU3mg3ReUVMJ70xtvX93lzVZsUHRpg7dpNGGE3I0+ikhmnCZj9tUcnlUqoVMxh+pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615983; c=relaxed/simple;
	bh=ncFcDbiZB2oxKqIxBiDnPJJuxJrA0Ww3T8DxD6Flj8Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U0mABSWNcwf0hzPf/cITQG9EskRIa60nqa92ZzBInXJ/JilN74EW3j0bxfZtkgNyTJy0Ik/DWGltAdBTqSpdY3kHxX+UIyDmZcSWiP66GbF9Eclgfaygj+rSK1jcXCD135vcZkDw2yTjctogsFXLPAnjQlgHYk6vYko0UY6NxYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0YVFcUn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0YVFcUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81D81F000FF;
	Sat, 10 Oct 2026 07:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791615982;
	bh=MoJwVO2DPYk4URI6T/Gr9CMZkpRcaCe6BKSqzPUp0Dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0YVFcUn2YQWVAWi88RXg9/6zDWHAZ48aPe6J0s0cMjXkuhEfWvQQOia9c5a1rPBt
	 x+tvtDn0gEseuIGF1hFMdMnFMJlIIpNHKMBjMmYuxTdIzZClf8OWJ+JFXIqHrw0Mdr
	 TqMpLHDgTlOnLzAtRbIzVJcMXvNGtRtj2/041+qLfeyRvHe/VW/83irMFLQrVeyt02
	 WaJtO7BsMwhownpWHdzDKrPhZ/Id0zcYdlrG6vPxGvTWQ+WZgKvl+oW75NRwTfBxsR
	 1I2NtZvICutxNj5Kk1VrhFBC1En+JQ4D2BxzGJ/hdf+7Ib5os5H2AXwR5oJYdoiAvs
	 my2f8OpCl21Qg==
Message-ID: <sashiko-outbox-166292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] xhci: give back halted TD when skipping endpoint reset
 after disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yiyu Zhou" <yiyu@yiyuzhou.io>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010064407.11030-1-yiyu@yiyuzhou.io>
References: <20261010064407.11030-1-yiyu@yiyuzhou.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 07:06:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Commit 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub
> disconnect") makes xhci_handle_halted_endpoint() return early when the
> root port is disconnected, and commit 7e0ef4332ed9 ("xhci: avoid xHC
> endpoint changes after disconnect or link error.") also sets
> EP_DROP_PENDING there, which keeps the doorbell from being rung until
> the device is reset.
>=20
> The callers rely on xhci_handle_halted_endpoint() to take over the
> halted TD.  For example, finish_td() returns right after calling it,
> expecting the TD to be given back once the Reset Endpoint command
> completes.  With the early return, nobody gives the TD back.  Its URB
> stays pending until the submitter times out and unlinks it.  Every URB
> queued on the endpoint afterwards never starts, because the doorbell is
> blocked, and also has to time out.
>=20
> [ ... ]
>=20
> Fixes: 042aad8d0db6 ("xhci: prevent endpoint recovery after roothub disco=
nnect")
> Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect o=
r link error.")
> Assisted-by: LLM
> Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010064407.1103=
0-1-yiyu@yiyuzhou.io?part=3D1

