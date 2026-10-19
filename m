Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665A7539763
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420450; cv=none; b=rhqmyu2xOKX472HIU2T5C5t/DWm38Y55U5kDO4HVjHfa8OI+amWHxWvva+WuOfcICfJHjhb7b/cJstpBcABEGv0DRgemxtgwu1hLFWPnRKaDOYwIgjRRKuLcdIRW8dEXI0CjM+DlkufwV1/wUknc5LT4yPJFauVH5tgV83CnAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420450; c=relaxed/simple;
	bh=j1GeT55oNCCMvAKJTbn/aTOvGgarrvCD6THjTItucnA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JPrZGGn5h+GPkG0G+iWWnmV+i2yfkkAUy0WRZrspKs4l1dycGKhhZPbay0K4ytTJ3+4PyHHFgVR0MlrwnlebbJNOXcKase9ge1AovVFCfJSt9QdWxnGZSPfDyNYzMXp4N1L4Z/haLWiEsVMNT11AeIR3lR4+xPnLqRNaxRYlKtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyTnKI6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyTnKI6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58BB1F000C5;
	Mon, 19 Oct 2026 14:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420449;
	bh=j1GeT55oNCCMvAKJTbn/aTOvGgarrvCD6THjTItucnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GyTnKI6u0o9NFffvUKivhYU0VfiHX6jFU+HY6MOQKRBQ0U/zt0IkUzEbwdYPjUoZw
	 GZYAjKa+9CR/JX4Ps+md67HnTAfVKHIOKQOp2ZzZ//WNhHQpN8QS5Pda8tHn08ZNLl
	 TGqzV30rbyBhe0DmY4Zat2yhGnbI0BJEY4s0ZJwpXdspaRXgun6nLqwXvVXb8bCypc
	 0yGj1YU0kVSk5KAuAs2ltlLb9cnc3hFNPUfTyOMoqH7ikkqQcGwzDBtN/jEIlVmlQA
	 6qvdtnp9ECnVweWQa7MmvXqhNHtwcVyjg0fRCw+hoE6X+vjwqEWI92unYkIoG2NEUi
	 8nwCFvBXjbg8g==
Message-ID: <sashiko-outbox-177430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] USB: misc: uss720: Fix leak in
 get_1284_register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-193-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-193-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:34:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Michail Tatas <michail.tatas@gmail.com>
>=20
> [ Upstream commit 15902712b9e2a46649cba2f22002d05faec2a990 ]
>=20
> if wait_for_completion_timeout() times out in get_1284_register()
> then we do not destroy the reference acquired via kref_get() in
> submit_async_request. Add the missing kref_put in the timeout path.
>=20
> link: https://syzkaller.appspot.com/bug?extid=3D56962eb32ba0136cd330
>=20
> Reported-by: syzbot+56962eb32ba0136cd330@syzkaller.appspotmail.com
> Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
> Link: https://patch.msgid.link/allaDTUua9n5DQ0a@michalis-linux
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-193-sashal@kernel.org?part=3D1

