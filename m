Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292877;
	b=AE1+dt/WLV3cCrXfONRnB+k1Nl+CpRpCdfYgFdDmyqXNiqEuw57Dfr5Yp3Ix74LUBQ3b
	 VhV8xBUrLNmmcxpYIAmDokLVpdVonT78SJD8tQkV3ujktb8H8n7XrlMS9TtPW0mvqRa9z
	 +1/Isy2AqzQQXjR2GDuuBQm+DQLhPgqmpqa65sUpX58NG+nn03Ul1GnyxWmoC8KRdO+ls
	 gr9+LzWTEGSHcm3bDDQoZPAKx2/WZtZMB1xezH0J8EgBvUK4Z/pB9h1r0687ACLDaV6QF
	 Q+XB3fxrfa9U6qBroBv1Qv1mf7NxLJtCwvfuLUjMy19fzv/LAE39mP5To8MBJGOILtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p0nCxZRWX0FAY+MfCM0M+T39BzVT6HL+KGDJQAzDvMQ=;
	b=GqN225o+x8QmlCemohQd6kR0GJptS/G6/R7OlP8RHBq0jUh28Cqy15kz/jZO5QF73iR+
	 HkjIYF4MNQqo27njmyG8IsrrNj7LLxjjNTKC+I8r1eA/lemQIKA3S07cb1UzgBFsJleIK
	 TxAy8yN73KRXO60JansU7BBy3BFDZIxX4HEl9wUnDN/Q58MvQsO2AISIyp4oa/kdf7d6w
	 4eaXWXtUh7BgqY6rixTCKazPRMrAGdFwwyPnAsKVZWahjzNZV40uU89LuzMLUXKyzlgT3
	 rK+PSGluEs7laHgLwgc8eS/htMuDwOwWxmLzVgFEmfXyLQ1Wt10u8t6P0ezkCYUpv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYLvJiM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046A606A339
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DYLvJiM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F321F0089F;
	Tue, 10 Nov 2026 06:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794292877;
	bh=p0nCxZRWX0FAY+MfCM0M+T39BzVT6HL+KGDJQAzDvMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DYLvJiM2CPgRccWH1WaBue1mFJAui+IVixtc8QDNq8TOqVNZg+5FJj3I5eK3AOTWg
	 kp9NT+pq/Gm0OK1PTXhgKcZrmf1cd784hlezmqcWHTib3UowDBtfV6zJUIm6xSegxK
	 mFAaTWF6ujEpXyWeK7vXwNiwNplXobNhLRmdSW+dhbqjbG6z45AVM6BCU8mjI+c81q
	 IoyDZyjG7Zi52XMUIbYFbLLup1o0FszJNR4CT/jNe901PzC3rPn69eSYznLriybRS9
	 ysT9rRVOApFZO3h3iogCf+XnJ/+FVr0kbw29q57z6jV5plpNKA/8ahDGXC179xlmzD
	 APHXSRZFvz0TA==
Message-ID: <sashiko-outbox-206424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't underflow the NDP room
 check
Reply-To: sashiko-reviews@lists.linux.dev
To: xujiahao <xujiahao@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109060913.526268-1-xujiahao@cmss.chinamobile.com>
References: <20261109060913.526268-1-xujiahao@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:41:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: usb: cdc_ncm: missing Fixes trailer for NDP room check
  underflow fix
--

commit af2c2a63b21a4cf89327e3f98f1ee6e70ffe8420
Author: xujiahao <xujiahao@cmss.chinamobile.com>

> net: usb: cdc_ncm: don't underflow the NDP room check
>
> cdc_ncm_ndp16() and cdc_ncm_ndp32() verify that the new NDP and the
> datagram fit into the NTB with an unsigned subtraction:
>
>         if ((ctx->tx_curr_size - skb->len - reserve) < ctx->max_ndp_size)
>                 return NULL;
>
> tx_max is only clamped to max_datagram_size + max_ndp_size + the NTH
> header size, so tx_curr_size is just big enough for one datagram and
> one NDP.  A second datagram in the same NTB is therefore exactly the
> case this check has to reject, and that is also the case where
> skb->len + reserve exceeds tx_curr_size: the subtraction wraps around to
> a huge value, the check passes, and the skb_put_zero() of max_ndp_size
> bytes that follows overruns the buffer:
>
>   skbuff: skb_over_panic: text:ffff80000db33558 len:428 put:172
>   head:ffff0000c2c66100 tail:0x1ac end:0x140
>   kernel BUG at net/core/skbuff.c:200
>   skb_put_zero include/linux/skbuff.h:2595 [inline]
>   cdc_ncm_ndp16 drivers/net/usb/cdc_ncm.c:1132 [inline]
>   cdc_ncm_fill_tx_frame+0xdf0/0x30e0 drivers/net/usb/cdc_ncm.c:1309
>
> Here end is 0x140 =3D 320 =3D 140 + 172 + 8, i.e. the one-datagram minimu=
m.
>
> The room check in the aggregation loop cannot catch this, because it is
> done after the NDP has already been pushed.
>
> Rewrite the test as an addition, which cannot underflow and gives the
> same answer whenever the original subtraction did not wrap.
>
> Reported-by: syzbot+1994e2ecf323ed90f255@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1994e2ecf323ed90f255
> Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>

[Severity: Low]
Since this fixes the unsigned subtraction underflow in cdc_ncm_ndp16() and
cdc_ncm_ndp32(), should the commit message include these Fixes: tags?

  Fixes: c78b7c586657 ("net: cdc_ncm: refactoring for tx multiplexing")
  Fixes: 0fa81b304a79 ("cdc_ncm: Implement the 32-bit version of NCM Transf=
er Block")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109060913.5262=
68-1-xujiahao@cmss.chinamobile.com?part=3D1
