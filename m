Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592816;
	b=LMZGA2k8rSjEbeltkMY8AjHMrGKwneXAcXR3Z+1vMGnoX+JKSpsxUDKbgzJY2IxcvoM7
	 Yw/4eKLDn3uzgdJbTZlDC7zhQ1UEBrXcw1Y7AePeN4x2DrAoNiVcmYymX7MMaMtnhk3FZ
	 kDEopW+shHToeoGSUQnV2egYZbeI/CK8kf4gBiJN/tXqr6LqbAklXLVsu8S2kCi+u0E4S
	 VtBatWzxBqc1Hxxg2w/bNwEW+/qa6pXe7ExhjFbLcN4ysHobzHM55B9Q9UPSBID9bT4jp
	 UdIPEXhRqghlDjBHxxbe+664mLe46LykMw4OrYpBJp60ZA1M4JwpA5z47GXBX2cvzzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=024D06oCZiwDvXzK2xss+OmdPNfpADfIkyL978vPXj0=;
	b=KdLwdaYJSQNOn9F0A5fUUBV1p5lEg3KNMPBPr/8sYuf6YFOg2L63/ldKk0aCrP/1m1nr
	 AZs/JLqhgkoJxeP29fSti+4NsSs1MhUzByp9noYN/S47TmF2LwinolPUwLMkqnro363c1
	 V3n73EzrxLRmCq93QkPyYW+TJx//2JQYW8+njk9s0v2ZUyHAueopS8Sm3GSSa6DFTleYS
	 YpOdmGpwuXB03BNu9++0gY0NMc+HImwPjCj9e74QNfdrwlrG58ORe4y6RZzGz+q6NzmTj
	 pl8Z/PjEvSQvr04Pp5tNXN0RAFpQiXY01cAipWXL7oyAa4++5WNVrHKIbaH05XxCdJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MYHpvo5P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9460A2605
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MYHpvo5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CF31F000C5;
	Wed, 21 Oct 2026 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592815;
	bh=024D06oCZiwDvXzK2xss+OmdPNfpADfIkyL978vPXj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MYHpvo5PHFO5zu9lzlg3/9YTYo5WMnNRUMfezzhECHQEBGjtb5OjueDI/fMccD6RR
	 HiaEPvq+N4uUHg//zggMr10jA3ikFGQO8xP3o/R23QjWA8Y7EYHlLuS0QTrht7PKhd
	 TACbjyQgQyW+TMQlkDXt2i7iQj2t0vfKm8U17WHCR1yQNwyTbWlaOzCFuJ9NouFtR3
	 +oGjt/823EGgzu0BClVfxH96ACdHMT/V8NHzqTmo8KHhKuLlRuDPl3j9uv9TYpMFmp
	 xZbkaHiPYAIHZpi99Kjef2pkMkR6WYmVWgbPCH3XAiv2mxixAcrt66UbXocs6+B3kq
	 9d2MYGCACwaiQ==
Message-ID: <sashiko-outbox-180370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] USB: serial: io_edgeport: serialise MCR accesses
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-6-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-6-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:26:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: serial: io_edgeport: change_port_settings() locks mutex in at=
omic context
--

commit 12f657a4474c4b2a9d60008b5bffca174179c50e
Author: Johan Hovold <johan@kernel.org>

USB: serial: io_edgeport: serialise MCR accesses

This commit adds a mutex to struct edgeport_port to serialise updates and
reads of shadowMCR across port operations.

> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edg=
eport.c
> index 38f58ca115ebd..0b50c6b99b0a8 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
[ ... ]
> @@ -2477,12 +2489,14 @@ static void change_port_settings(struct tty_struc=
t *tty,
>  		return;
> =20
>  	/* set up the MCR register and send it to the EdgePort */
> +	mutex_lock(&edge_port->mutex);
>  	edge_port->shadowMCR =3D MCR_MASTER_IE;
>  	if (cflag & CBAUD)
>  		edge_port->shadowMCR |=3D (MCR_DTR | MCR_RTS);
> =20
>  	status =3D send_cmd_write_uart_register(edge_port, MCR,
>  						edge_port->shadowMCR);
> +	mutex_unlock(&edge_port->mutex);

[Severity: High]
Can this sleep in atomic context when a port is opened?

When edge_open() sends an open command to the device and waits on
edge_port->wait_open, the open response is handled in the bulk-in urb
completion callback while holding edge_serial->es_lock with interrupts
disabled:

drivers/usb/serial/io_edgeport.c:
edge_bulk_in_callback()
    spin_lock_irqsave(&edge_serial->es_lock, flags);
    ...
    process_rcvd_data(edge_serial, data, urb->actual_length);
        -> process_rcvd_status()
            if (code =3D=3D IOSP_STATUS_OPEN_RSP) {
                ...
                tty =3D tty_port_tty_get(&edge_port->port->port);
                if (tty) {
                    change_port_settings(tty,
                        edge_port, &tty->termios);
                    tty_kref_put(tty);
                }

Calling mutex_lock(&edge_port->mutex) inside change_port_settings() acquires
a sleepable mutex under spin_lock_irqsave() in hardirq or softirq context.

A subsequent commit in this series moves the initial termios update from
process_rcvd_status() to edge_open(), but having this patch ordered before
that change leaves an intermediate bisection window where opening a port
triggers a sleeping-in-atomic bug, and could also cause a regression when
this commit is backported to stable trees without the follow-up refactoring.

Should the change moving the initial termios update into edge_open() come
before this patch and be included as a prerequisite for stable?

>  	if (status !=3D 0)
>  		return;
> =20
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D5
