Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065158;
	b=E/g2jiJD/cIy36jCV2YSUsWBerFocEFZM077nEUbA8qF2O9GOsnEMmHk7CjG8eHRs7+z
	 An0oRXXGLSvP+Y+sNf5AvZmHldwA3P7QBgOJPvH+AEy/HkiHTQzvbzmxewbiT8ns2BwCS
	 aRdWw6pLmpbV6jXXNIfdkC09f2zSVWnG161jR/Tnjhq1WJVtiDVCQZkm2GIf2qJh9pXHN
	 HbEP7XTlKXUoEjWD1VFmvaqOX3TSndO2N1I0UOHHlBDXk9TuQOf9gJliJUC6Z22aN2t6e
	 UC3524xo3ST4axkSF2/5/WXQPv+C1D1jO67e8Kve2gOsimE1zftBt+OWNANPLiKlKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XDQI9oFze4Z/hOw41DuvdHUFsNJaIejmqurNoiCd0Fk=;
	b=4HEFgYJHotJ4qIoK66GfGPuvzue+kkDKfhLbN4ZGF5MuiaQ6lnsfi12AGjjb0pOc+VOu
	 B3YnlssZqyUb8Pypsxmu+r5pxSi873/RP622t61vGGAHYGRcu7T5r+dxZCVw4nQqrVTOR
	 UT3Ei3CDzOSPbXm7eJO1p4Edqzluf1oAkWMgSiENANMWb9DgzosdYFg0WYkaunY3I1B0h
	 4DHw7x4UGA4RXSCi25iAJfHNxV+n6JCUAD0dn21uUZEmwQSlDNBwJKbjcg9MViPlojjtG
	 6hI95RbieaGoYeVqPdGpOtm8qwL+MgFWh1EeSZphJAjxHjUgTFi1JwnFmiBP1xBCflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIQK6atI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7343606A331
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIQK6atI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A24D1F008A1;
	Sat,  7 Nov 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794065157;
	bh=XDQI9oFze4Z/hOw41DuvdHUFsNJaIejmqurNoiCd0Fk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WIQK6atIpxbZrq6r0Bk4/AjWWkU3BBp4kfFgN8MbRwdGJDV9pr6SdeZMUvtAj7jF9
	 ZuCjzOTavqWwk1tAFdjKtEw6nk3DlTqk+UIc9RSswYFVY3RqovsbDmBNdY+mcec2Mm
	 S/AWNWDnstpipAuE8QCjRB4y5GjyJJnS+S/h7NlokYCScJlblzMHGwUVcPGJeFP/85
	 mcGlRRBCBReXJlGaXdwR57aHfuwGRsItX6C4fDUZ7gwu7TajeqMeFFtr0tsLuSo8XI
	 ezYPCTomrXM/T0NSA2gl5i4fUG0X1zWny+Lzh8OYGHuz9WlcgOPyYSDGmljfzDQEOk
	 qKVf9Hm2OGp6w==
Message-ID: <sashiko-outbox-202993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: sl811-hcd: delete the driver timer on stop to
 avoid use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261107151847.3754846-1-hj351016@gmail.com>
References: <20261107151847.3754846-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 15:25:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] usb: sl811-hcd: unlocked read of sl811->ctrl1 in
  sl811h_timer() [1]
--

commit 2d5a12c739030030cdd0a7f7bbfa2df343bb1b51
Author: Hyunjung Ko <hj351016@gmail.com>

usb: sl811-hcd: delete the driver timer on stop to avoid use-after-free

This commit calls timer_delete_sync(&sl811->timer) in sl811h_stop() before
halting the controller to prevent sl811h_timer() from running after the
HCD private data is freed.

> diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
> index b044977f6f567..b667732f67de6 100644
> --- a/drivers/usb/host/sl811-hcd.c
> +++ b/drivers/usb/host/sl811-hcd.c
> @@ -1516,6 +1516,7 @@ sl811h_stop(struct usb_hcd *hcd)
>  	unsigned long	flags;
> =20
>  	timer_delete_sync(&hcd->rh_timer);
> +	timer_delete_sync(&sl811->timer);
> =20
>  	spin_lock_irqsave(&sl811->lock, flags);
>  	port_power(sl811, 0);

[Severity: Medium]
This problem wasn't introduced by this patch, but can sl811h_timer() race
with port_power() because it reads sl811->ctrl1 before taking sl811->lock
[1]?

drivers/usb/host/sl811-hcd.c:sl811h_timer() {
	...
	u8		signaling =3D sl811->ctrl1 & SL11H_CTL1MASK_FORCE;
	const u32	mask =3D USB_PORT_STAT_CONNECTION
				| USB_PORT_STAT_ENABLE
				| USB_PORT_STAT_LOW_SPEED;

	spin_lock_irqsave(&sl811->lock, flags);
	...
}

If sl811h_hub_control() powers off the port while the timer fires,
sl811h_timer() can observe a stale SL11H_CTL1MASK_SE0 value and re-enable
USB_PORT_STAT_POWER in sl811->port1:

CPU0                            CPU1
sl811h_timer()
  signaling =3D sl811->ctrl1 & ...
                                sl811h_hub_control()
                                  spin_lock_irqsave(&sl811->lock, ...)
                                  port_power(sl811, 0)
                                    sl811->port1 =3D 0;
                                    sl811->ctrl1 =3D 0;
                                  spin_unlock_irqrestore(&sl811->lock, ...)
  spin_lock_irqsave(&sl811->lock, ...)
  switch (signaling)
  case SL11H_CTL1MASK_SE0:
    sl811->port1 =3D ...;         <-- acts on stale signaling state

[1] https://sashiko.dev/#/bug/linux-8a163ef9-3fa5-4e03-b20e-6da57ee81b06

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107151847.3754=
846-1-hj351016@gmail.com?part=3D1
