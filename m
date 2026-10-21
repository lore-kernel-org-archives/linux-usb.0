Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593470;
	b=CHr1b2/r8hSPX9fxJ1eQaPP/rM36vFHmqSRu46j2DbmQpX1wHcuCWaAUlyam3LsB0HCR
	 CEfImWEbjUYcSd1j8hAvx8EkVu0pnvM5jm7560LTtG1msPpOO0uzptx7TNrvjZKA6rs3E
	 aoC7Xul7qCu8iIBD4aVW5bhE9s5w50xItvikZ3ldnFw+vQqlcC1OfoKZSQ3kB+GpRCiMA
	 fkNSUOGpNoLUFhDmYqsbSlB4Yj5hDBy5knUW4+zcNBoj97K19E80YUfxCMRGoKe/9NEAx
	 12GbtH/MUlGoIAZ27uBjeuc5RmS6FKf/MB1gLkVO/iWuNsTSQYBTQJXKFH+hiGFvHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X+8/HUUXv855h+Y+Vf8C8SkH8E+TZB0cUXdtAJwPGqE=;
	b=WwojqwqjG+OUxoD4dIB6KS1ropGTF5R4Dy3YOvX4amynVpwijbWNndE6OZc1HIwmF75u
	 VAQiFKBdoU/WS6aSKwWo9e7LDp5nQJzq6SrkyWCbtS9OJCTfIezsdX7VLWB9V/AGr+Tnj
	 z8oqcCmdq6G8NCgQxdmDBXgTCWi7Fv6VN2zGcvMBcSnL9Lcfj2y6gjftTQ+dA18mviJC5
	 omY+CMFSJ5o1b0dZYJyoNWNTF9TvsRZpWQ5fwUnrHW6PgNtB6TJQcJo7IY14sva4O6e1+
	 jWf98Z5dkfzwsasqZ6BvIb0b6u9tPIq38sylWVRESVSQBnLwCvUWgdAuLwobb2ohEAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NoJdODz5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424DF606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NoJdODz5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A490A1F000C1;
	Wed, 21 Oct 2026 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792593469;
	bh=X+8/HUUXv855h+Y+Vf8C8SkH8E+TZB0cUXdtAJwPGqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NoJdODz5XEqWmL73PpGuAJSdQvArSK1l0ZNg87XnR00j0zFZQnLZIiOcABqhTeaUO
	 RCjYmvwNEyhv+7rCfYGqDy+v8kegj8ob0W0GFwUwKloa8dlzG+38JJzV0ZtkMLXBas
	 eA5d9Bx8wh8/HEU8KLcfzc8CdB156S0SZr64EsmzlChBMmmMrL5moCwtCzy195EClz
	 3kqJEsEkC/KmFhAXOILi/Ylzw2Azv3Up8mObIw+5vz6M+1lJziyTs/zSUY/fL6SnKp
	 CyqodXg5/T16s6JLayqCHq1gw+5nQiV5P3NdMXKhitX5lMmfsXer+5ORz1mCRSppS1
	 0VrRs8ntn7r7Q==
Message-ID: <sashiko-outbox-180389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] USB: serial: io_edgeport: fix potential close()
 use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-4-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-4-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:37:49 +0000
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
- [High] usb: serial: io_edgeport: race between edge_close() and edge_write=
()
--

commit 611925474c1210ae646660fb9dfc233968cca260
Author: Johan Hovold <johan@kernel.org>

USB: serial: io_edgeport: fix potential close() use-after-free

This commit adds spinlock protection around clearing edge_port->open in
edge_close() so that a racing interrupt completion handler does not submit
more data while the port's write_urb and txfifo are being freed.

Link: https://sashiko.dev/#/patchset/20260714101316.823942-1-shpark061104%4=
0gmail.com?part=3D1

> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edg=
eport.c
> index 0cc4f41299e03..a2410c063ffe8 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
> @@ -1089,7 +1089,9 @@ static void edge_close(struct usb_serial_port *port)
> =20
>  	/* port->close =3D true; */
>  	edge_port->closePending =3D false;
> +	spin_lock_irq(&edge_port->ep_lock);
>  	edge_port->open =3D false;
> +	spin_unlock_irq(&edge_port->ep_lock);
>  	edge_port->openPending =3D false;
> =20
>  	usb_kill_urb(edge_port->write_urb);

[Severity: High]
While holding ep_lock around setting edge_port->open =3D false prevents
send_more_port_data() from racing with the deallocation of write_urb and
txfifo.fifo in edge_close(), could edge_write() still race with this
cleanup and dereference edge_port->txfifo.fifo while or after it is freed?

In drivers/usb/serial/io_edgeport.c, edge_close() does not zero
edge_port->txCredits (which was replenished during
block_until_chase_response()) and frees edge_port->txfifo.fifo outside
ep_lock:

	spin_lock_irq(&edge_port->ep_lock);
	edge_port->open =3D false;
	spin_unlock_irq(&edge_port->ep_lock);
	edge_port->openPending =3D false;

	usb_kill_urb(edge_port->write_urb);
	...
	kfree(edge_port->txfifo.fifo);
	edge_port->txfifo.fifo =3D NULL;

Meanwhile, edge_write() acquires ep_lock without checking edge_port->open
and copies data into fifo->fifo whenever edge_port->txCredits > fifo->count:

	spin_lock_irqsave(&edge_port->ep_lock, flags);

	/* calculate number of bytes to put in fifo */
	copySize =3D min_t(unsigned int, count,
				(edge_port->txCredits - fifo->count));
	...
	if (copySize =3D=3D 0) {
		dev_dbg(&port->dev, "%s - copySize =3D Zero\n", __func__);
		goto finish_write;
	}
	...
	memcpy(&fifo->fifo[fifo->head], data, firsthalf);

During tty_port_close() -> tty_port_shutdown() -> edge_close(), before the
line discipline and flip-buffer workqueue are flushed or closed, concurrent
calls to edge_write() can still occur in two ways:

1. edge_interrupt_callback() checks edge_port->open outside ep_lock and
   calls tty_port_tty_wakeup() -> tty_wakeup() -> ld->ops->write_wakeup(),
   which in framing line disciplines (such as n_hdlc, ppp_async, slip,
   n_gsm, or hci_ldisc) synchronously invokes tty->ops->write() ->
   serial_write() -> edge_write().

2. Incoming receive data pushed via process_rcvd_data() -> edge_tty_recv() =
->
   tty_flip_buffer_push() before edge_port->open becomes false is processed
   asynchronously by the flush_to_ldisc() workqueue during edge_close(). In
   n_tty, this can call edge_write() via n_tty_check_throttle() ->
   tty_throttle_safe() -> serial_throttle() -> edge_throttle() when ixoff
   is enabled (especially once the follow-up commit "usb: serial:
   io_edgeport: drop redundant open sanity checks" removes the unlocked
   !edge_port->open check from edge_throttle() and edge_unthrottle()), or
   via n_tty_receive_char_closing() -> process_echoes() -> tty_put_char()
   when ixon is enabled with pending echoes.

Should edge_write() also check edge_port->open under ep_lock (or should
edge_close() zero txCredits / free txfifo.fifo under ep_lock) to avoid a
use-after-free write or null pointer dereference on fifo->fifo?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D3
