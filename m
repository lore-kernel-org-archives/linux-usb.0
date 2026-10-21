Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579866;
	b=rRFbTxnLLJCrRzVl7xIH4bFgS+YUco1Dh1S4xZ8Uuod4zCfDqhgtF2lgFHflcgt5IFHy
	 PT8ztHyBUXs49fF/Mqm2KmRgd9WQoYPecZhxvw94fSoY8WDNFwW7cOfBPDyKyUEPXZ+uN
	 yiN/4Iw5wqYJ9lSYGOD3yVZQ7sb3jCjgd9lOlnl1U06g6cn509tw4Su9Y9RaAibbuA8U/
	 s1C4rfGKrAbSfktLX/s1brl4FuNqKcbIRKgti8IKiE88u2SduCDyPhgL3p5JgBzMgweFC
	 gAFlDnQzfXEsrzCu/08Sy2h/C1IsJKMfPcKVwtj5gAI89vUv7C+HIsEWJxnLppP+anA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579866;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IdF42o3n2uq51MC9A8x/lnFliB8IeDi3G1V4iQN1JSk=;
	b=0ywFb2Y/cSfJpxsZrWy2QGOleIanzm8EFF+2Y1CRjtOowcULvtdq0VWJThOcJ5H+y2Mo
	 /kslS6Mi1T00oMWm3uULZ98tTp7IdhJzDSMwVcNOHLndyYbQEoH68e3hT180MWxSpjSaB
	 4Jala3EA3jYAdK1DRjdIU6k493uzmGGC90Bs/DeQqNF8yKn8NrV0lsXrmgXSpK8uKn8hS
	 fiG8MpiFceUXxIbU3mgvlWwBu07ynba4XlkvgxkDp8Or8w3IE797PFl9FPWJ+RbrsjgBg
	 Jan2FkvC38euufuSiNVfhRwrT+4czCWs6v13zKkj+q4bTepjMvIVbcbHW+OSQP5jhxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrYgWimh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5919606A31F
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrYgWimh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928481F000C9;
	Wed, 21 Oct 2026 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579865;
	bh=IdF42o3n2uq51MC9A8x/lnFliB8IeDi3G1V4iQN1JSk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=VrYgWimhzoV8x//wmrod3OxK/Re6QXye/APN/++xtyVcQcT6vAd98d+3J7VtjNSiv
	 VGEAbU+KRaqR+cf5bZ1M5LuLbmfwcw7trS9rxiEaEp1/iQg/re9j6u83NsAWzp34MP
	 A3aqgxUUfT+sZ38ypuJgnRUsXyUoMhPSWOHDAcGutyUi2SKwxxNm3TXy1EfFV1sPv2
	 t4NLbMUC8NPzzZ1Ol6kAE23iq8O3R/KO8MNf9MMvOw/ZEuvueFp9MtzfNn6LKE2See
	 GSEgpek5XUalfWG0xdl1kKnAGKl4Zip3Uq41TG2fnOgQnBx79sb2aPe01ikYVH0OEI
	 KJWfMD0CA4yug==
Message-ID: <sashiko-outbox-180123@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] xhci: debugfs: initialize command buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261021104720.4106961-4-yaojiale02@163.com>
References: <20261021104720.4106961-1-yaojiale02@163.com>
 <20261021104720.4106961-4-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:51:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> xhci_port_write() copies user input into an uninitialized stack buffer
> and compares ten bytes against the compliance command. A short matching
> prefix can make strncmp() inspect bytes that were not initialized.
>=20
> Zero-initialize the buffer so the copied input is always terminated.
>=20
> Fixes: 87a03802184c ("xhci: debugfs: add debugfs interface to enable comp=
liance mode for a port")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021104720.4106=
961-1-yaojiale02@163.com?part=3D3

