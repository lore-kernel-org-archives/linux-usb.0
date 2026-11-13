Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562783;
	b=w05PVlQDVTzkZF4KUqANg/BMftdyretdL1n6Xf3+nnEfshrus/QrTfbA30EqA1XEgEbt
	 A0dm6HlTxIuBLNz9zKitHQhLw1tcLZoCN7e2XIZOx9cXG3PjvhnVjakbkimFx0aTgmWto
	 F+G2CEMvK95gGHMXleYl/2p6VTKk0xGyKfuvDp+nN+ZNE3fAtzPfCy4ZzhICnKV26Ntz7
	 FDDUo8Lz0ryGS6e/3RH5ZlNPPqBYpXHFgjn3jgHIMq2IA4Va+AOIzuUWYwcTwwHC3zdZQ
	 HxLfLgVwJpHq6poXYziwwIf1ds571s25rEW8Tlsiq5+t66uZZL6rOZrIjoDZbdm0hdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562783;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zh7pcFtCA46MmyeieJNAmk2ZyNJdNs1ZRNsokMmyz5U=;
	b=GAVxNLFlRWloARJSnCmi/qtzpgGMdKPg/8elFkDXesEeffn2EIU+Xh+ckLdeNM5nqmoT
	 4BS/lQcy5Xm7/xapAzUeU4IzeB73QcZ+kmwbwaSrJswGG1+vgalPVI4hkqu7kRyOwlZtl
	 78WR63n7YvbcRu1Fq1uuL14LbY1IZdFDXlUCwrW3KcCH7pOgRRqioKPXNp8l+bLxJocdh
	 MNlxi2AvrhIAw1Ng2HBcttmxmtHm86TEUXzKuD3uCQpUjwFQ/aNnh8WU+0pKbWGBFW8nw
	 bWWxyk/q5nChPBjUPmqjHHKMrUxS5UbThIqHfqWH4vkLPjUK49D94UuGl6j1D9mYwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFcHPyFT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96090606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFcHPyFT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A6F1F000C4;
	Fri, 13 Nov 2026 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562783;
	bh=zh7pcFtCA46MmyeieJNAmk2ZyNJdNs1ZRNsokMmyz5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFcHPyFT4gaQm9vpENpY+nfJcP7Fy159d5HhITAGqSNWn7OrIy8d0ad6tlLGLv4yI
	 IPib2RjOL1ym3NhVyUeuMRsHa6Vo62G+Juna1vPTwRln1/N7HGEb9zprmFRv2LiyZ7
	 WZ5KA4XNm/Xnw/G6t5I2Bc9WyOUvMhPboh4lWD+DbKTqoPF3tE4X1vAbBfGdNGtx/b
	 /g3wrB2uOsu3DATfggxtUHDK2VLwLk5ZkBoPm5I39eXjVPNqXAWhwF2VNtwPTn4T53
	 e2DB7EMLsSdfCzAG4p/3kbliYBU3dbLmrJhUWP4hoo6tq20urAHPXagX8du5szqs99
	 HGujwrlDH8F8w==
Message-ID: <sashiko-outbox-212560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] usb: gadget: udc: Clear a pending connection
 when starting the UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:39:42 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-udc-connec=
t-v2-0-f51b11f07eb8@flipper.net?part=3D1

