Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500189;
	b=r2vi5L2wIgh5FMnFzJYWIYxpSOTyzeYtuGphdfSU0VkIXtQjYX5eQIVskmbZSQfCcHM7
	 7LdkH7CFPSAnf84ta4lGeQgZ8Hgknu0eR4DZXR5FoU7c3GWoVEQUPzjacuXEqEWnDOYI+
	 JhHsYv7yLqCOY4+AMxR/tZlPeRY91on9ITTz+sjT/hmWYYwgA6gjiHt3k3f+tEgvgYIRK
	 KqCaxy3H1b/l40+HVfXF/L1qCov9QUHVkAiHIWbLFywj8etFwAcvkypJP4LloC4XLXyDr
	 nJMKl+ojhp6mDw8vX6EuoJkWQ+i1lIEXa5DlbuIKlw42ugRPDSj58VWGQ2r6L7rDLAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500189;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vM8NZgQwZr1x1zz8/aSNeLRtEnAGwysuR7Q/40aLdYc=;
	b=aAjFmpCryIoKGpBB17K4m2Ok0TOtw4EqBKTcglvVeHoldzRkiuuaIBE2FeIlbpSJ1PTi
	 IUfS39f3FdE5IyA/R0xQ1rWDQjumfFnfNYJkh0HfL3cD9caySfXJz0jgnzE2bmeSlmEuR
	 2BhgsE9/+0+/7qe+rWWOP//WyAHPsN2TY7vRe5pW4y+V+K625WtYyUpRrQqi8rPeKbqU7
	 32aQadFyKuxk88Eh0Ftq/7QWJju0E/Mv3vesltvMc32T8UGIYsOfY2INnDb31gF1dzTxD
	 L/RaaYlftaborUTWTSvEipdDcv9uTRBVgVCpggxeTVEJ8VY10w0C6WhPMBsdEbIoysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwNDRUg8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B0606A8B2
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwNDRUg8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC3F1F000C5;
	Thu, 12 Nov 2026 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500189;
	bh=vM8NZgQwZr1x1zz8/aSNeLRtEnAGwysuR7Q/40aLdYc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=kwNDRUg80ibXLPbipGHbh1pN6Lvh5tFWkET9TJ01zcmRO34GgRKmM3VrX92CTCYTS
	 mxy0wmwSb61zF3N8aaitjqRiPqB036D8ruzCTNtzSZ1Jxj8DyCPDF/VDJpXw6tXtfP
	 1TKTBi64bNG9lzSwGIhBLsNebYpZCZkLcB/yB+YU2BY/4Pw5pxs/QYT0mTYx2Jm5Qe
	 wxuI4ysI7Y1zSJQUFhHoxOUDtbSRXUeuPP4dUB1m8BcnfxsO9ahdXTsPCs9JayyaJd
	 NBxmVM0hhwZ5BbWlNH4z9v3DCjvrcmXDfXP+elDrs/MEsnfuh9KoouDS0NRo1xRjfG
	 OCUIKKF/mJ3fA==
Message-ID: <sashiko-outbox-211486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] usb: phy: gpio-vbus: free the interrupt before
 cancelling the work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261112160448.41566-5-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
 <20261112160448.41566-5-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 16:16:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> gpio_vbus_remove() cancels gpio_vbus->work while the VBUS sensing GPIO
> interrupt is still live: it is devm-managed and freed only at detach,
> and gpio_vbus_irq() schedules the work with a 100 ms debounce delay.
> A plug event landing after the cancel re-arms the work, and its timer
> then fires on the freed gpio_vbus_data.
>=20
> Free the interrupt first, which also waits for any running handler,
> so nothing can re-arm the work past the cancel.
>=20
> Found by static analysis and confirmed with a KASAN reproducer:
> slab-use-after-free write in __run_timer_base() within one debounce
> interval of unregistering the device while its VBUS GPIO is toggled
> (object allocated by gpio_vbus_probe() via devm_kmalloc(), freed by
> devres_release_all() at unbind).
>=20
> Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112160448.4156=
6-1-lui2012qwq@gmail.com?part=3D4

