Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458293;
	b=4qprzBcRzXkqv9/8VQSHHwzcivOR4YZ76e7P3FFkM90jbTKdeV9VALaM3HB9ALTCw6rz
	 COdQlJDwSdkeJXKMwlEulKbqugcw8iyHTJMA5njQ1TO5utWGWFy5A9Y96FmDtQLvxu1vH
	 ap0wewcCjktmg/J4oyikjBzzG+HrVkxCLuTl99RWuKaE9Rnzu6/JyNdVdV/jhMrOG4ncX
	 0u/gGyRyq2ZFOmPPk6IevZG0asrcYFo3nqbzlxW1+WziMEsnD4reNWa6OYxkIIU/Nodsi
	 oASxoC3P8zt6AfVjILLbOlhOk8km7dytCmNDkdeLa1WxI1XFly3qh66TCBvBfPyriCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xqT9T1OnF3Az/fsgEZENvLx9vrIyGVNwj1FaVbNwInE=;
	b=elOkiOfHjCSgkMVYBPZadohGpVnGNysVawTZlt88ZScd9gs+mA01TH/FiH38pxMK7F7W
	 cBAGSe4ghnDeGIFXHZi5Kw8rhPZtmlNotgLB+aPnHAbojCgyKoSRWzvLEB2OuPjSNlWMV
	 +omGJxmQ40MAFzBl4JvzIg25yOUyCvJdKzqOBsqx2iIdLn40+6iXmEjW4lXl0GKPqNG19
	 LtOl81UbQzDY6TwP5rj5zWWAzkK/JPgwxNCJig1hzrrnn3vprPVDC0cX5utf3G7pIsRsf
	 Ale6bGW4Ko3+YP6lDVT47qDFvHFGarBbnRVu6fL4/KF7u5BQeXUCK8XWJghA0wXtvSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Geh5ls6Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E0D606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Geh5ls6Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519D31F00A05;
	Thu, 12 Nov 2026 04:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458293;
	bh=xqT9T1OnF3Az/fsgEZENvLx9vrIyGVNwj1FaVbNwInE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Geh5ls6YKXcohLLFzs/Pb3a3U7dlQKJKJUQbsuXLmP/ZC/gZhrfULKexBz4VcDKCr
	 2j8PyoMwjilV1FKgI3ONKuXO/gVJ9C53z0q8TA/j60aFDD7xh59/kkViFkrQemnlCv
	 8XDtIaVjhyqljStnm4FenxUshlqr2SR3US/Te3BwDU2iRDagv2wazWTb4V0C76Bsrg
	 BCguTVS6HlnJM5gQh01cfl/0ijyM4efGR3iGhmMapmcXVGYWYEgg8EgzNeD3R3WKaG
	 gXZElUvNfOxfPm6C93pvIAl3sjMwwpPwKRqtH+xSjyR0sHi4rqapZz0thx+Ik0FCQ6
	 lw28eZg3f8d/g==
Message-ID: <sashiko-outbox-210370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Cancel the timers before destroying
 the worker too
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-tcpm-unregister-timers-v1-1-7230fda5612b@gmail.com>
References: <20261112-tcpm-unregister-timers-v1-1-7230fda5612b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:38:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> tcpm_unregister_port() clears port->registered, destroys the kthread
> worker and only then cancels the hrtimers. A timer handler running on
> another CPU that has already seen port->registered set can still call
> kthread_queue_work() once the worker is freed, or with port->wq
> already NULL:
>=20
>   CPU0                           CPU1
>   tcpm_unregister_port()         state_machine_timer_handler()
>                                    if (port->registered)
>     port->registered =3D false;
>     kthread_destroy_worker(port->wq);
>     port->wq =3D NULL;
>                                    kthread_queue_work(port->wq, ...);
>=20
> The timers are cancelled after the worker is destroyed on purpose:
> works that run while the worker is flushed can start a timer again
> (see the commit in Fixes). Cancelling only before would bring that
> back, so cancel them on both sides. hrtimer_cancel() waits for a
> handler that is running, so after the first round no handler that
> missed the cleared flag is left; the second round removes a timer that
> a work started during the flush. tcpm_reset_port(), called later, only
> cancels.
>=20
> Fixes: ca4d8344a72b ("usb: typec: tcpm: fix tcpm unregister port but leav=
e a pending timer")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206898@kernel.org/
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-tcpm-unreg=
ister-timers-v1-1-7230fda5612b@gmail.com?part=3D1

