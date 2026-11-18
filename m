Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012172;
	b=18Mqi1axLQQubARJWhEilQiExaxEEDucvsICr4/TVD16cno6D1Al+k9AQT31rNC2OMkH
	 WQOavLURQd+04x9oRX6ATCJYTNZ0JFwBDCn3dx6nlA2dumFkDbRGhuMIR7PcpgsHKfqvx
	 9RAwdqlpjj4brbWd4nQieJLWZiAyZRAoe6dajBK8VMM33Nrnxf73lMB+37H8c5pbtHlUi
	 4590e50EZuqtSTaPvifc2czPmRD4c7WyN7t2EzYUqeUmnqhK1ij9MJpSKC8Kophnd73nD
	 KYmYVp7cb6HtYP1kyfnosU/XuLmLXfL4xWUuucupRJ/gF4A3mFskoDTmQQhrlRIAAXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012172;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t7w+U4OxWQGGRVGkwZEkNDVUcQv05wK2JmEzOkkKiOI=;
	b=PgQ1SADApDQlT2cMH9Qub4k11B8WpUaRD9PqogeOiKmYUyYl168/sfGMFjN8M+NGGAr6
	 K7+pxUiOD/bbWkT7D1qZeLe/+Mr++IeINBxsm9WRN5fNK4tbDSulhRoynH8F0ixeBKwZF
	 jXjgRxQ9pugfs+viH4varUFdtlxWZCj7ZlMZS+nhNijZhbAgYYTVE0/wHzysgTL8S9pqE
	 jXztUNO5Cd3UuXWrrx4PpTLKXURaACrRNtjtlgrzCsRMp1Y981kynSSopVXThqPf3KC0S
	 EZ95IcPyhgAM3YL0XT20HADMMSxxYmpakvcIOTTRvUb4ryLL49MyXN/K1ye60hHn3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9DohZm9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7551606A33B
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9DohZm9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FA41F000C4;
	Wed, 18 Nov 2026 14:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012172;
	bh=t7w+U4OxWQGGRVGkwZEkNDVUcQv05wK2JmEzOkkKiOI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y9DohZm9HsHJoe975+Gsb7td7BpEWHLIqPDfQLrGL3HRNZtqaxnm0cm4tTNuQ0rbJ
	 BLxF8l6MIh7p/ar7RA6m+3snmKcD3zz0Jjsa94bvdu/X/PmZBYa+qLAmFOdzvWhf5v
	 a4aeGGeJgdfnkqKpybMOSVuoReZD+QaKvNai8GIAEFgzKi/CFZ9yfc2mJzO0TCddou
	 QZ8Ea7pBihBVwri0EMAwN6WyYrAlBUz8xIxiPKoUGJNmmeVxKbbaDqY2Rr5qHea+hS
	 rxOLlNpL/uJUmL2Bn802/4gm3+nupgpt6d3xPY+VvSJwy9Ech3wYk7woWJu8nwu5Pr
	 B5tPArc5PCTBA==
Message-ID: <sashiko-outbox-221207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4] net: hso: fix stashed tx skb leak and replay
 race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aibing Chen" <chenaibing@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118141658.1381-1-chenaibing@cmss.chinamobile.com>
References: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
 <20261118141658.1381-1-chenaibing@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:29:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> hso_net_start_xmit() stashes the skb in odev->skb_tx_buf and stops the
> queue when hso_get_activity() reports -EAGAIN, which happens when the
> USB device is suspended or no longer configured.  If the interface is
> then brought down, or the device is disconnected, that skb is simply
> left behind: hso_net_close() and hso_free_net_device() never release
> it, and hso_net_open() clears the pointer, so the skb and its data
> buffer are leaked.
>=20
> hso_resume() loses a frame in the same way when the device is still not
> ready: it passes skb_tx_buf to hso_net_start_xmit() and then clears the
> pointer unconditionally, so a frame stashed again by that call is never
> freed.
>=20
> Take the stashed skb with xchg() in both paths so that only one of them
> can obtain it, serialize the replay in hso_resume() against
> hso_net_close() with a per-interface mutex, and take the netdev TX lock
> around the replay so that it is also serialized with the stash in
> hso_net_start_xmit().  The state check uses test_bit(HSO_NET_RUNNING),
> the bit that hso_net_open() and hso_net_close() maintain.
>=20
> Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@googl=
e.com/
> Fixes: 72dc1c096c70 ("HSO: add option hso driver")
> Fixes: c213f286f2cf ("[netdrvr] hso: dev_kfree_skb crash fix")
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118141658.1381=
-1-chenaibing@cmss.chinamobile.com?part=3D1

