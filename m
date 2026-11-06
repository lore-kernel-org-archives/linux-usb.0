Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953153;
	b=2FtOFQ2zIHb9zsmoL5z37c6E8Datevw/cYSkmK+SjOBNZuj1izNnV4piEb5xBej7quNo
	 CA+wiWQWXYYIgsUKegRR9hlRNwMoIytAT+JZTAzd3UEIvxnYSa2j6Gy+/lcgTMe6aPbor
	 fAxnXMjTcPs7QpBzpo+gTMla0gxy1pk2rWozFznY46mpk4oDyQeDkkgx2YRRgS3cvu5S4
	 vMj6lDU66YQtLNmcNPn40dqXVlyjgWjWZTNLt5FFT5yqVN6/CEQo7BAHGyviRsc02rc/4
	 /sR/pD4fX5MSfLbsN/UjxurDfQvcgeF8Glt1VuGNWvkssJVjKVTuFTIbcq6sLqv12iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7i8Hfxp5QkxFVTNTl9pZM6EIXjvW1lFaO8zF1ADMDCk=;
	b=A/yQGPsYGtrM4j7XMKpGqr6YOccF4Vpko2vjs8Ox2xn4YbaR4vwTJvD6KaZpOmuAqGXT
	 X4il5iQZkgJ58x+6ufs/ZJu383R4LDGI0R5UOv//BnZBColaxtX+g9GxAOOWG2sJHjjEq
	 ffawup27lv/r+O5rtdPfLdpZkgn3bEikhcQYi69s8Gn0j6GSmP0j8DPLZ0adeeUyH4cP6
	 8Q4KWU7siA2HwK2pxSvHhf72YnksBeStAMv9jhPfE4y2J4W0PpvluuP7K0D+QXfmY1My3
	 Id1ZBUrJz5QrDvlTRmJrXbsGcyKzzpw7NMVy0iYHcqyZ+coMHRecnLglDLJ23ikzOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPDici28;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2378E606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPDici28
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F7D1F0089F;
	Fri,  6 Nov 2026 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793953153;
	bh=7i8Hfxp5QkxFVTNTl9pZM6EIXjvW1lFaO8zF1ADMDCk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=lPDici28IWYSB2ZBoqRzf0roJYU9sdzcwWQIwyVgcPgmKaZ8v5T0kfqiFIwPvELAy
	 4BHM8gLlOQ3K+LikALCFRmobXVj8vZddtHJzbTrnEcDos+s1k9WaYD3OVut9x18N0u
	 GnxqzzaODFp20KnSQKcYqLZE8Jop77cGfgCxwOMLtPKFCbLkLAbgctMVGZXWp/ctJ6
	 yUz9YKY0S6Zzhm8LNQegG1i6UwrT6DQgNX35NHEKgxY/FzXL/WNL2PJo+L3yXXPlch
	 Fj8FvopLlg8bC/Pn46os02SJ961JGICoednoZZHyJPgazCZqw3q+lupunoOt5dd4RP
	 us1q0Tkn5EMdQ==
Message-ID: <sashiko-outbox-201050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: mct_u232: fix NULL deref in open error
 path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhao Feng" <zhaofeng2@cmss.chinamobile.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261106081254.1389-1-zhaofeng2@cmss.chinamobile.com>
References: <20261106081254.1389-1-zhaofeng2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:19:12 +0000
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
- [Low] USB: serial: mct_u232: missing Fixes trailer for commit
  35807187e4b3
--

commit aa7ec61a20b2d78c30fb0a49d63ab051c4605906
Author: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

> USB: serial: mct_u232: fix NULL deref in open error path
>
> The MCT U232-P9 has no bulk-in endpoint; received data arrives
> through the interrupt-in endpoint of the second port, whose URB is
> stashed in priv->read_urb by mct_u232_port_probe().  The generic
> port->read_urb is only allocated for ports with a bulk-in endpoint
> and therefore remains NULL for this device.
>
> If submitting the read URB fails in mct_u232_open(), the error
> message dereferences port->read_urb->pipe, causing a NULL pointer
> dereference at offset 0x50 (the pipe field of struct urb), as
> reported by syzbot on KASAN-enabled kernels.
>
> Print the pipe of the URB that was actually submitted instead.
>
> Reported-by: syzbot+58b2d8b19cd6761a395b@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3D58b2d8b19cd6761a395b
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

[Severity: Low]
Prior to 35807187e4b3 ("USB: mct_u232: clean up read implementation"),
mct_u232_startup() assigned rport->interrupt_in_urb to port->read_urb.
That commit moved the URB pointer to priv->read_urb and updated the
usb_submit_urb() call in mct_u232_open(), leaving port->read_urb->pipe in
the error path.  Should this include:

  Fixes: 35807187e4b3 ("USB: mct_u232: clean up read implementation")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106081254.1389=
-1-zhaofeng2@cmss.chinamobile.com?part=3D1
