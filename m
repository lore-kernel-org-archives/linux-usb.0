Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484443;
	b=wreLr6ENy7nZ3nffmTWsPGKBZfxulg+ldFUzSswxf/nzsfo4Ynh8dKu0Rd1fXj2Q+ZUO
	 4uLM15BVkUbQXkvBnxbwcMXPldUxSpEYWp02kiCyuhBATGTQr4Ns8NvHfvLSQ6pShH+DN
	 lLY4B1Dkwb9kzLJ+b3yCW03/NGxCeGIXdKs3HDfBsdvCdAxWg78YVCug5rKNfKpbOVGua
	 17sxwmidwXSTHYyLT5qkWlVF049742iSpyCz69b8O4qSDm6DSz64+mbCLHc2kZRMmop+u
	 7DAt+/A3DAx5l3i2xI/TCaViVoYhw/5nUG9zodC3BkpYu1EciPI9a8B9pzpVv2wJOwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484443;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6FL6vybst19uz2uz0JrB2e5T06p2MvK2Guv+NkUq7ns=;
	b=BxSIgsOHzgXS4s+0YUEwaxpCtpXJGorTcxhTPJe6aXVIeTE38DPrWTmxbMX8DBqWuf9L
	 qTMsXEL40YWuJ/F+h/cB0Koa3GlFJrbOvpP6FRsUUALYwSB+xsq1PdP4MJa/YlXE3NMpl
	 zYEnizAElBSKQ5hmFTKBDdDQcQL8RTvgiE1OUirov9jfkKw1/HDgOJ5fFFpfZ2iyvnvO1
	 OUbZmQ3DPJbypQvpBduuWF6QCuL664n/1fTlLQ5dHgsPs9tY7x7n7cFAE15F9qaeDJO7u
	 qRWzbpkzVLIEdtVs55aKU+B1c2nBGfxEU3h4lNi85mKMx3MdfPswR3+eO/O3EvAY5oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aEoErWdb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015CD606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aEoErWdb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64FED1F000C5;
	Tue, 20 Oct 2026 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484442;
	bh=6FL6vybst19uz2uz0JrB2e5T06p2MvK2Guv+NkUq7ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEoErWdbKRSJ/p7VBY6JvqC1vqPj4AXiuF9JFpKjSnTtd3TK5NFdpyfl3vJ3pyaCO
	 r2Ab1D2hzwLULpnneDOHsJT0F+bD+y7SOs/yVsHQpjuLGpg6S3aflfjTg0mYzIt1qC
	 2FdTx4jn9HDslrdwsSlsoxdNjAkCTfnu5G30VmBaVdQJEKTdZRukc4OPiqgWF11Roi
	 57N0yugBtnPkC7f4hDac/Kt0HIYVGUFKMPAmlm08yPvlrlha4CMs4iuerISZ0FfMeO
	 nE+KGZ/El5k4VV59cF4bGTRczqEXyE7Eh2V6vqInMmTLGZFoEcNRo/xvTZUhxvS/tf
	 3SbkmvQmjIinw==
Message-ID: <sashiko-outbox-178522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_hid: avoid copy_from_user() under
 get_report_spinlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020051446.92179-1-yuz08559@gmail.com>
References: <20261020051446.92179-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:20:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> f_hidg_get_report() copies the userspace report into a freshly allocated
> 'entry' before taking get_report_spinlock.  When the report id is already
> present in the list it then copies the same userspace buffer a second
> time into the existing entry, this time while holding get_report_spinlock
> (acquired with spin_lock_irqsave()):
>=20
> 	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
> 	ptr =3D f_hidg_search_for_report(hidg, report_id);
> 	if (ptr) {
> 		if (copy_from_user(&ptr->report_data, buffer,
> 				sizeof(struct usb_hidg_report))) {
>=20
> copy_from_user() may fault and sleep, which is not allowed while holding
> a spinlock with interrupts disabled:
>=20
> [ ... ]
> also drops a redundant second read of the user buffer.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020051446.9217=
9-1-yuz08559@gmail.com?part=3D1

