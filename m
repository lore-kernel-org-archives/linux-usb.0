Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279577;
	b=2UYoqn55MsI+SfbnmfhmAG/AEZw93GFydEcj9u0RrBUEpeX6TRfnqlni+YhUUKwQzLRW
	 ggqWaeSjD8ZXngYjDwI6uXztfLKpFgFu51sOD9w5MJ9UBibgZOMZZ1iqu2sPhHz/3U+g5
	 Q2pa/aKVi3abDPTZeBiEYsFmbW1TiHBtBgN2epG03v/2TfPicEjn9h/pJrRCk5xaE0Lde
	 Jky/8DzltYjj25YwWNY3kcZmg+2K/2Jt8fDSYJlq4KY7tbznR+YkTEr2ItOWudHd099or
	 /VIK4z2gxZJs+Ylmv6+oijkuo4M7igv+ACNhDy4Fc1D6IO8kGQxSyIYbdh4AXWWoJmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279577;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZeryhIiPWCTdnjrmEcUqpvHl6bFeoAvGE/90ly4u5Jk=;
	b=ZIMKOctDBSMvI/8nN/MS9V37izWR6UWYa4sqA/i2MuaB2cbk4HEfCUbfq5hdmkzszTNe
	 5ejaMQmfNV/rKOiHuH4GZAkia7FcPuJ1Xmx3gcvzanSCjJ1rB//i4lGRx2XzkGCTTzPfy
	 y7bMK+qjsbJ4YYZ2FBrQCu89psiT1I7Gu4DowdXISK44hXamXFvjP/hxBWnC46zddigdW
	 tDo6f9KCSsN4SKaBItLlUiTiVf8p10ZOqx/V5kzS5BkGuBZvn+0qkUln8IrstWLxLMGIi
	 GyZvLYISDbLdMbzD+OCfUtgO5BGFVPRnKAz9ilcDetFvtT1YczzYcY1f+T9UdxxLKQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ca3KqGJZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6EF606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 02:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ca3KqGJZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870701F0089F;
	Tue, 10 Nov 2026 02:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279576;
	bh=ZeryhIiPWCTdnjrmEcUqpvHl6bFeoAvGE/90ly4u5Jk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ca3KqGJZszybAd/Vj5mhtfwuFaN4hMoAHB1eSRnFCmIPyIXUIOLPe9lHwZAc8px3V
	 rEfKV0goP6tV6P3233sZkOvnYFmHC5xBXnOdG4JydDd2Lrda7Chfq4ilMwyzuR0nRO
	 pPlgocIieGo5sN4Ez1vNKwaG7rkejS5gdSwVsG8DzdPogcN0yOznhHsVWBELcCu3HY
	 FB/BimrSDVczBCX7APZUsYkDohIFQxA+ejNUYAB/SGYuZ+/ky+ZNN9Jz3jI7ESo+/p
	 0xBAWDWvQlWvYaxW8isTkl8oyrcEdXapPHYWbkd0yEX7OcofHzLP2Hj/7TfbV1Y3vJ
	 syQ4kJcbPBUSQ==
Message-ID: <sashiko-outbox-206073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-v7-v7-3-6d05409cc61a@gmail.com>
References: <20261110-gadgetfs-v7-v7-0-6d05409cc61a@gmail.com>
 <20261110-gadgetfs-v7-v7-3-6d05409cc61a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:59:36 +0000
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
> ep0_read() snapshots dev->ev_next, drops dev->lock while copy_to_user()
> runs directly from dev->event[], and subtracts the snapshot afterwards.
> A concurrent disconnect, connect, setup, or another reader can reset,
> deduplicate, or consume the queue in that window.  This races on
> dev->event[], can drop newly arrived GADGETFS_SETUP events, and wraps
> dev->ev_next if the queue shrinks below the snapshot.
>=20
> Dequeue the events into the local buffer and update dev->ev_next before
> dropping dev->lock for copy_to_user().
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-v=
7-v7-0-6d05409cc61a@gmail.com?part=3D3

