Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494547;
	b=WtFL31HuS/5xUwFhiW/k2O5nnw3aMmjQA0sjsTMex6+W7cWfwJNjk4uT3rQ/yFgfUYwl
	 b8YPB6Pl6fiyD5kiLfnYhp3oDJIWbcKTYBS7fxzNZ5mGEUIgrVcG7bXc1jmy8MDXVKK4P
	 8Om0++CA3RWeWdfESCkWVMcV/apvXoqN3NnOs8BbrhBvZl0ZHzJH/4rYxNqjUigXYNvD1
	 0xfXsyitCjfSpi6XS+LsZSGn65ySBGpzk19cE+VZkRjylavdWxe0J0zzIfyw7bq9AvlDS
	 kwyB0/WVQdokUon3d+50vV1m9/oUSndmAyboy7AX2QjzdO2tmXkKuInBEllG5COybSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494547;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=agWGorwywbuFBdEkztbumi4LDC4mHhNJzzvAX9KMv08=;
	b=aoso/icIGVy6h/WBk91eqG+Ry3gV2Kpssa6/b6tceLX0ZaZkg9p3QX1D1DUdWnUCWbxj
	 BJb2qar9/oJ+vzs9sOV3aAOdwpboznYkk8Fe4Hx4WE2dFVp++8DaLzy6a0wwVpYRHapuZ
	 MA2UKR8WAHa3wKhKZCW78YNvRpAwFtzsL5bMjWyG8UENLxkGtRBrJXdy1cNBwT0YDVwG2
	 2nwhebcoTLQsR8breR5weKJ1CHpIwhxuMw/pRxUOOHQO923qgRany45TDRNEEGZ7+5Ar9
	 A1H1mXJM2RGFVQxe75wx0Hql9hbxMr5Elg8+ll+gQ4KePDXs43hjgkM77cWF3wuiHCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0MvVsAm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0E3606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0MvVsAm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B331F00A06;
	Thu, 12 Nov 2026 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494547;
	bh=agWGorwywbuFBdEkztbumi4LDC4mHhNJzzvAX9KMv08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0MvVsAmPUzPQPFsc7mUjcxQNbNunIbcBQ0o9st+eF8eBLyMZZ3VMrNNGlPUCryya
	 q+TFU5ezjawGQAFfjKhoSrUtXAY5i2oFbZ6iCfUvYtNGSqgEcFiyIWF3gHceXqrMu7
	 Rp0EjTvH99nYPZviO3xuyxmmLu8KaZ5/3JNXkzVgfuPwusrVxGsyJH/+XXJmbLMrzy
	 E1tMB7Idx7RhZZZYrnvCQV1g4gjFbii+ZphwQlDDZsjSZERDJeTxeZYr3r01Rmemb/
	 MAs71jqyEouXCA2+Y8leM3xKhuXHPTxKlgYau5G/EI4oHDc0uuUhVxkyDY+0C22owN
	 RJPi4idLYOPQw==
Message-ID: <sashiko-outbox-211368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: udc: Clear a pending connection when
 starting the UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>
References: <20261112-udc-connect-v1-1-03c73259642b@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:42:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> connected"), usb_gadget_connect_locked() returns early when
> gadget->connected is set. A connection requested while the UDC is
> stopped sets that flag too, without enabling the pullup. A later
> gadget_bind_driver() or soft_connect "connect" then finds it set and
> never enables the pullup, so the host doesn't see the gadget until it is
> unbound and bound again.
>=20
> This happens whenever a UDC driver reports VBUS through
> usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> Type-C port controller switches the controller to the device role at
> boot, seconds before userspace binds a configfs gadget.
>=20
> The pullup is never enabled while the UDC is stopped, so clear
> gadget->connected once it starts. The bind connects according to the
> VBUS state that the core tracks anyway, and a function that deactivates
> the gadget during bind still has the connection recorded for
> usb_gadget_activate().
>=20
> Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connecte=
d")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-udc-connec=
t-v1-1-03c73259642b@flipper.net?part=3D1

