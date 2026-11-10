Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279828;
	b=GfbdV21s+XA2oXHRTd0gCegU04W5T3LDbEcRKwIz3pY6ux6rCBa+kvs2v9sUX7lHKwsu
	 Zp8p2AUaa9Pb/tiljp4Tq4e3jyQH3uJGEwMw6pZx3ocbd2OCw0pyM6CHRRYS2RUEOorKz
	 AZXS1epl8eiHg1yWLhFi/01W0Pid4bpTVqNDk6C9mJe2UtBbEkUv0N71U3yMukQ0rUah8
	 zRb3mM3qe8BRyMCfOa3WdCQsnlse4aTDhtvBcIIFWms3iia4lvQpnVnqJfY3dY7uudUCB
	 gwY2ml0cyaXqDHWEArsqASh1B6lZ3wePJyoI8+Ylw6NtgUJL77Tc6WdbCvdBcTNL8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=maLGvAkGxb9Pix8XqT3sgtG2n0aOek5bpJGaK3CYmeI=;
	b=EsielHRFDwG3HtKzGRLBKd0/A651OAoXleIIEz6bktoA59bCpX0Qusm600oe8eSrhSUu
	 i6ZFx4GtELZLxYZA6UK0l8/2RuSyVw2x9cpT0BNgUUF1vZ5JB6ARpz1OpDRHWULdZnhFz
	 1NK7As8stKgNI3qIAOyGJcceWOTfPoXx/7fH610XGYjAx8XNynghUpT9nDiciipd+VURq
	 rkDKx5YF/Wnjq1Y/pgiBifOD7RfPpja0xdXDUk6MkLFRCvdIYe2lZVms8jj87FiJV+iWq
	 mtc5jdErH89nSW7L11rdFjKq8CZWSfEgN5qn9IFtp1FOQHfi06/Yc+A9cJXbqhEc4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNo17EA3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41872606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QNo17EA3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4711F008A1;
	Tue, 10 Nov 2026 03:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279827;
	bh=maLGvAkGxb9Pix8XqT3sgtG2n0aOek5bpJGaK3CYmeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QNo17EA386sQPEh+rNTagixHM7VyqKGfvklwdaw/I2Te2Zc0N99Hejkn1mv4rB/VM
	 pHsZbYDI0EPU+4u6qhd5vkjRaTk4bSfAH5pHLczo1tz79siuFXqIUS1VKISauvDyqo
	 Dyo8O1gZV50siQKEYcOlG1B0eMAeu4/1RW63V/UC7D1xmZmVpfSxLs5t/fxhczBQfz
	 MBGa5HcsuF/evNycvfsCeZZq+xfmAMKa8u1ky5GX8pPpt9u4Dl8kQa2Wr0v+2m+rhJ
	 cmclM6ntZR7KMGVT75jE34g/1ev06LOl/4Y2KwB9CyLJMMs0pswcYk76RTaUpwyQ7k
	 n+3hE1MVP4HzQ==
Message-ID: <sashiko-outbox-206091@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] usb: gadget: gadgetfs: fix ep0 request lifetime
 and buffer races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-v7-v7-1-6d05409cc61a@gmail.com>
References: <20261110-gadgetfs-v7-v7-0-6d05409cc61a@gmail.com>
 <20261110-gadgetfs-v7-v7-1-6d05409cc61a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:03:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
>=20
> With controllers such as dummy_hcd, disconnecting does not necessarily
> drain ep0, so a delayed userspace response can leave dev->req queued
> when it is freed.  This triggers the warning in dummy_free_request() and
> a use-after-free when dummy_udc_stop() subsequently drains the endpoint
> queue.
>=20
> gadgetfs_setup() and the userspace copy helpers also race on dev->req
> and req->buf:
>=20
> 1. ep0_read() versus gadgetfs_setup().  A delegated control OUT request
> [ ... ]
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc73e1942197af9f54ca3
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-v=
7-v7-0-6d05409cc61a@gmail.com?part=3D1

