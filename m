Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593084;
	b=NJ27rJuDeqaDVdLm/7+LWUiw3QsOmgmZHVt37aGR9hDU1pWI6ueuaKToQ+Yw7g/GPABa
	 18CpfKf8lQqpS2TZIUAfeZ0nYlnuOycQLZ/wfGDe6k11uDbLQXXigI8nmoZ/zFsuESGTA
	 FSZ+YdEzg2enK1hbBOuhGMcO/xJv8PeXYuyWivfmLjssCNY3lxavooLrEJjoqlnRSaBx5
	 M40VDKAITd7AG8jCjyg0MbA+S3kUnKd2LH15/ewVZkTYrDM8FlNJmBORfmWeeYGqPgRn/
	 xZI4//VrQG4W6nH4ZR8VSWNcPYYqlHe1FuxQbYsWR7qCIngDD4zJsosMuhINOI8PyMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593084;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2yeKMNTVX+XsXDiajDw3dBAG7xt2hVmpuw/S60H0N2M=;
	b=IyfUlmq3+fepBfD+pRgb4obelJCfw2/fsvxcsffWvtq/oNM8eoI/DzVBiKC143hdVVy+
	 XpYY1+y/qGPiSQVsNvzTEVG4mqgDLVSZ9jZ5+yCoAiIa2DSs07NeQU7oBOVbpZkvheClU
	 Mt8g6DD+EYQ+N2LxZW+YDhmlPrWh+vGpW2YIQlwTiTJrQw+nUSeXD58gSoX/JVUTbboaF
	 dWQTPpwddY8js1oak9yifVNIxVJlfjdKSC/jriraPDgbcMoPWXHdKqQx9z024m3ZahcIs
	 7+8G7Jrd5IwRC9TIJnEU4avsO32Fg/Uqgun9qQOhEutw4h1mMg7Nr5I+wwtbhgkGIKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsJnRFBG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ACD606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LsJnRFBG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6C31F000C5;
	Wed, 21 Oct 2026 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593083;
	bh=2yeKMNTVX+XsXDiajDw3dBAG7xt2hVmpuw/S60H0N2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsJnRFBGsIJugsX37MqQGNiUKju0jOVp3oYnuTgaHId1GXn7Zu0Pe3+5z8yiHszMJ
	 5VKRldLvKEM29a5VS7OqGd9vFIRx0vxIv5/zv/c0SpFkMd3vQ9fgkszqTf96MsyJKU
	 hPEzdDJOlzE2Nuz+bG5l88SLzw7SyA71BItyKB5BGJ3B/nxtXw0+Dy1qfdDiGkEFkP
	 StBtqU8WgQVU4ioJce3dUBik41uWvXt3yfzXE0EAbCslR0eppEzLFT9OeJChHZBpwo
	 kFtWmK0AZ9oAitDWyWjzk+hli9mC96ny4v8SaE2AgvIk9aWswMnDIFex1xUc/n5T0Y
	 adVnfNE1Xjo9Q==
Message-ID: <sashiko-outbox-180379@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/11] USB: serial: io_edgeport: fix potential fifo
 corruption
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-3-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-3-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:31:22 +0000
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
- [High] usb: serial: io_edgeport: race in process_rcvd_status() allows FIF=
O corruption
--

commit 3c973c9c441546b1507dc5bafcc938334e398bb6
Author: Johan Hovold <johan@kernel.org>

USB: serial: io_edgeport: fix potential fifo corruption

This commit initializes maxTxCredits to zero when opening a port and rejects
subsequent open responses in process_rcvd_status() if maxTxCredits is alrea=
dy
non-zero, preventing a device from changing the buffer size after the tx fi=
fo
has been allocated.

Link: https://sashiko.dev/#/patchset/20260714101316.823942-1-shpark061104%4=
0gmail.com?part=3D1

> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edg=
eport.c
> index cdf41e86ba448..0cc4f41299e03 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
> @@ -878,7 +878,11 @@ static int edge_open(struct tty_struct *tty, struct =
usb_serial_port *port)
>  	}
> =20
>  	/* initialize our port settings */
> +	spin_lock_irq(&edge_port->ep_lock);
>  	edge_port->txCredits =3D 0;	/* Can't send any data yet */
> +	edge_port->maxTxCredits =3D 0;
> +	spin_unlock_irq(&edge_port->ep_lock);
> +
>  	/* Must always set this bit to enable ints! */
>  	edge_port->shadowMCR =3D MCR_MASTER_IE;
>  	edge_port->chaseResponsePending =3D false;
> @@ -1750,6 +1754,7 @@ static void process_rcvd_status(struct edgeport_ser=
ial *edge_serial,
>  	struct tty_struct *tty;
>  	struct device *dev;
>  	__u8 code =3D edge_serial->rxStatusCode;
> +	unsigned long flags;
> =20
>  	/* switch the port pointer to the one being currently talked about */
>  	if (edge_serial->rxPort >=3D edge_serial->serial->num_ports)
> @@ -1793,10 +1798,17 @@ static void process_rcvd_status(struct edgeport_s=
erial *edge_serial,
>  	}
> =20
>  	if (code =3D=3D IOSP_STATUS_OPEN_RSP) {
> +		spin_lock_irqsave(&edge_port->ep_lock, flags);
> +		/* reject stray open responses to avoid FIFO corruption */
> +		if (edge_port->maxTxCredits !=3D 0) {
> +			spin_unlock_irqrestore(&edge_port->ep_lock, flags);
> +			return;
> +		}
>  		edge_port->txCredits =3D GET_TX_BUFFER_SIZE(byte3);
>  		edge_port->maxTxCredits =3D edge_port->txCredits;
>  		dev_dbg(dev, "%s - Port %u Open Response Initial MSR =3D %02x TxBuffer=
Size =3D %d\n",
>  			__func__, edge_serial->rxPort, byte2, edge_port->txCredits);
> +		spin_unlock_irqrestore(&edge_port->ep_lock, flags);
>  		handle_new_msr(edge_port, byte2);
> =20
>  		/* send the current line settings to the port so we are

[Severity: High]
Could an unsolicited IOSP_STATUS_OPEN_RSP message race with edge_open() in
drivers/usb/serial/io_edgeport.c and still corrupt edge_port->txfifo?

In process_rcvd_status(), edge_port->ep_lock only covers the check and
assignment of edge_port->maxTxCredits, without checking
edge_port->openPending, and the lock is dropped before clearing
edge_port->openPending:

	if (code =3D=3D IOSP_STATUS_OPEN_RSP) {
		spin_lock_irqsave(&edge_port->ep_lock, flags);
		/* reject stray open responses to avoid FIFO corruption */
		if (edge_port->maxTxCredits !=3D 0) {
			spin_unlock_irqrestore(&edge_port->ep_lock, flags);
			return;
		}
		edge_port->txCredits =3D GET_TX_BUFFER_SIZE(byte3);
		edge_port->maxTxCredits =3D edge_port->txCredits;
		...
		spin_unlock_irqrestore(&edge_port->ep_lock, flags);
		handle_new_msr(edge_port, byte2);
		...
		/* we have completed the open */
		edge_port->openPending =3D false;
		edge_port->open =3D true;
		wake_up(&edge_port->wait_open);
		return;
	}

Meanwhile, in edge_open(), edge_port->maxTxCredits is cleared under
edge_port->ep_lock before edge_port->openPending is set outside the lock, a=
nd
after wait_event_timeout() returns, edge_port->maxTxCredits is read without
holding edge_port->ep_lock:

	spin_lock_irq(&edge_port->ep_lock);
	edge_port->txCredits =3D 0;	/* Can't send any data yet */
	edge_port->maxTxCredits =3D 0;
	spin_unlock_irq(&edge_port->ep_lock);
	...
	edge_port->openPending =3D true;
	edge_port->open        =3D false;
	response =3D send_iosp_ext_cmd(edge_port, IOSP_CMD_OPEN_PORT, 0);
	...
	wait_event_timeout(edge_port->wait_open, !edge_port->openPending,
								OPEN_TIMEOUT);
	...
	edge_port->txfifo.size	=3D edge_port->maxTxCredits;
	edge_port->txfifo.fifo	=3D kmalloc(edge_port->maxTxCredits, GFP_KERNEL);

If an unsolicited IOSP_STATUS_OPEN_RSP arrives on the bulk-in endpoint (whi=
ch
can already be active from edge_startup(), another open port, or the
interrupt urb submitted earlier in edge_open()) and runs the ep_lock section
in process_rcvd_status() just before edge_open() takes ep_lock:

1. edge_open() resets edge_port->maxTxCredits =3D 0 under ep_lock and sets
   edge_port->openPending =3D true.
2. The in-flight process_rcvd_status() finishes handle_new_msr() and
   change_port_settings(), then sets edge_port->openPending =3D false and
   edge_port->open =3D true, waking edge_open().
3. edge_open() observes edge_port->maxTxCredits =3D=3D 0, sets
   edge_port->txfifo.size =3D 0, and calls kmalloc(0, GFP_KERNEL), storing
   ZERO_SIZE_PTR in edge_port->txfifo.fifo.
4. Because edge_port->maxTxCredits was reset to 0, a second
   IOSP_STATUS_OPEN_RSP passes the edge_port->maxTxCredits !=3D 0 check in
   process_rcvd_status() and sets edge_port->txCredits and
   edge_port->maxTxCredits to a non-zero value (or races between setting
   edge_port->txfifo.size and calling kmalloc()).
5. Subsequent edge_write() calls then compute a non-zero copySize from
   edge_port->txCredits while edge_port->txfifo.size is 0, causing memcpy()
   to dereference ZERO_SIZE_PTR or overflow edge_port->txfifo.fifo.

In this commit, an unsolicited IOSP_STATUS_OPEN_RSP on a closed port also
sets edge_port->open =3D true while edge_port->txfifo.fifo and
edge_port->write_urb are null. Follow-up commits ("USB: serial: io_edgeport:
fix potential NULL-deref at open" and "USB: serial: io_edgeport: move initi=
al
termios update to open()") move setting edge_port->open =3D true and calling
change_port_settings() into edge_open(), but the unsynchronized
openPending and maxTxCredits race remains present.

Should edge_port->openPending also be synchronized under edge_port->ep_lock
and checked in process_rcvd_status() before accepting IOSP_STATUS_OPEN_RSP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D2
