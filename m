Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592597;
	b=1QBevThX890OOFRG6yAhqYI1FS+llvTxxKNRp/xjWKFrkxFzo0+N0dJTsQWudm5lMthr
	 HFTY+3vHT1aIc7wexC4Y2+L8uMZfIdCfSb5YZPiCXwaYnWyZgjvyc14rFmcBzZwrjQ+Rs
	 ptaljJO+Z09Y06RZYz5KRj/IlElIr7BLNPGj8XBRhA97qsFhMDjhib/AUm1iOqAmimjih
	 D34S2xe+OLof6AVQzWJ6pjOnJ7qJ19YfvvdvW1tCZPZuC6gE7m/AfVyJ9wz3Qq2D61G7U
	 nAmA3BcxSkTfGwqQlMbkrI/3GbK/gckXnGQzw1WMuNe91rC4mpZ6jAj7eTqUmHgWGJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GPe8XPBgn9p12SrRKIfzgTqbCZCup3VoWCRZErafUoQ=;
	b=vPHL4XMvwIml7PlbCjTa7mkEKRDxM6qrA1zB6KhU4ukaNRqIm+z4nQojqeE4x0ET2QXS
	 5G1PvkS/A/Tb/AKYyLml52o6m6illo5jTxDb3Oir5FpvEvngJhCUQn6R6xMZ3sak5aL7x
	 cpjkxDCFoqv7CIC9cG9LR4Pgwdw2yGra4ch9yJuptUVcdmWo9uWK/grM8Yc1uboQk2+1w
	 iAUQ3XrKspFsQ+m/JRbJn8RjWV2vDm/1Na5lJhscYGgyETCNVOeEWnGB8AiMksidBpbns
	 +8HsPHWXqJJ6P/M93ect69/owWprRUr4m2QtV/fYRyNVdTjKcJWWxGapYiQxfiA5FZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8M0McCr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E11606A330
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D8M0McCr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764261F000C4;
	Wed, 21 Oct 2026 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592596;
	bh=GPe8XPBgn9p12SrRKIfzgTqbCZCup3VoWCRZErafUoQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D8M0McCrhTaOt0ImmRhiKdExhmY+ofrV2cp57RdZYLOkARVUdFDeMnd+mYgXHxngq
	 dESN0LoWe/8k8tPJPMCeonNIbcbZ32djhuSjsQLSCgdq4qyUPwjyQwKAWkM7/3pSNu
	 S0RQzjiRzC8XRFLv5y5Os7mboO1f4aU2CwRmejyvdv9OaFGiTCIosJeDDiT6gSryUz
	 ZEXuevLORn31FUXR83286+4J2BG2bod+/KjWb2VGjrzh5PPU7RsvSanWGLcE6xuKKD
	 U7XGHvyIOJZqAh8s79iJUP/LFBktZ18oXwzGnlYnYVl9uTs3EyEtq3/YrHRyFcymmG
	 ldCjRC871rsVw==
Message-ID: <sashiko-outbox-180361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] USB: serial: io_edgeport: switch to synchronous
 commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-12-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-12-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:23:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: serial: io_edgeport: command buffer leak in write_cmd_usb() c=
allers
- [Medium] usb: serial: io_edgeport: jiffies timeout passed to usb_bulk_msg=
()
--

commit 76948cdcd262d6f36f2d2e2ca6b395a61167a6ea
Author: Johan Hovold <johan@kernel.org>

USB: serial: io_edgeport: switch to synchronous commands

This commit converts Edgeport command writes in write_cmd_usb() from
asynchronous URB submissions to synchronous usb_bulk_msg() calls and
removes the edge_bulk_out_cmd_callback() completion handler.

> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edg=
eport.c
> index fbb8249bb5b74..3f04898a7cf2d 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c
> @@ -52,6 +52,7 @@
>  #define MAX_NAME_LEN		64
> =20
>  #define OPEN_TIMEOUT		(5*HZ)		/* 5 seconds */
> +#define EDGE_CMD_TIMEOUT	(5 * HZ)

[Severity: Medium]
Should this timeout be defined in milliseconds (5000) rather than jiffies?

write_cmd_usb() passes this value to usb_bulk_msg(), which forwards it to
usb_start_wait_urb() in drivers/usb/core/message.c:

	expire =3D (timeout > 0) ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOU=
T;

Because usb_bulk_msg() expects milliseconds, passing (5 * HZ) results in a
500 ms timeout when HZ is 100 or 1250 ms when HZ is 250 instead of the
intended 5 seconds.

[ ... ]

> @@ -766,44 +763,6 @@ static void edge_bulk_out_data_callback(struct urb *=
urb)
>  }
> =20
> =20
> -/***********************************************************************=
******
> - * BulkOutCmdCallback
> - *	this is the callback function for when we have finished sending a
> - *	command	on the bulk out endpoint.
> - ***********************************************************************=
******/
> -static void edge_bulk_out_cmd_callback(struct urb *urb)
> -{
> -	struct edgeport_port *edge_port =3D urb->context;
> -	struct device *dev =3D &urb->dev->dev;
> -	int status =3D urb->status;
> -
> -	atomic_dec(&CmdUrbs);
> -	dev_dbg(dev, "%s - FREE URB %p (outstanding %d)\n", __func__, urb,
> -		atomic_read(&CmdUrbs));
> -
> -
> -	/* clean up the transfer buffer */
> -	kfree(urb->transfer_buffer);
> -
> -	/* Free the command urb */
> -	usb_free_urb(urb);
> -
> -	if (status) {
> -		dev_dbg(dev, "%s - nonzero write bulk status received: %d\n",
> -			__func__, status);
> -		return;
> -	}
> -
> -	/* tell the tty driver that something has changed */
> -	if (edge_port->open)
> -		tty_port_tty_wakeup(&edge_port->port->port);
> -
> -	/* we have completed the command */
> -	edge_port->commandPending =3D false;
> -	wake_up(&edge_port->wait_command);
> -}
> -
> -
>  /***********************************************************************=
******
>   * Driver tty interface functions
>   ***********************************************************************=
******/
> @@ -2105,49 +2064,22 @@ static int send_iosp_ext_cmd(struct edgeport_port=
 *edge_port,
>  static int write_cmd_usb(struct edgeport_port *edge_port,
>  					unsigned char *buffer, int length)
>  {
> -	struct edgeport_serial *edge_serial =3D
> -				usb_get_serial_data(edge_port->port->serial);
> +	struct usb_serial *serial =3D edge_port->port->serial;
> +	struct edgeport_serial *edge_serial =3D usb_get_serial_data(serial);
>  	struct device *dev =3D &edge_port->port->dev;
> -	int status =3D 0;
> -	struct urb *urb;
> +	int status;
> =20
>  	usb_serial_debug_data(dev, __func__, length, buffer);
> =20
> -	/* Allocate our next urb */
> -	urb =3D usb_alloc_urb(0, GFP_KERNEL);
> -	if (!urb)
> -		return -ENOMEM;
> -
> -	atomic_inc(&CmdUrbs);
> -	dev_dbg(dev, "%s - ALLOCATE URB %p (outstanding %d)\n",
> -		__func__, urb, atomic_read(&CmdUrbs));
> -
> -	usb_fill_bulk_urb(urb, edge_serial->serial->dev,
> -			usb_sndbulkpipe(edge_serial->serial->dev,
> -					edge_serial->bulk_out_endpoint),
> -			buffer, length, edge_bulk_out_cmd_callback, edge_port);
> -
> -	edge_port->commandPending =3D true;
> -	status =3D usb_submit_urb(urb, GFP_KERNEL);
> +	status =3D usb_bulk_msg(serial->dev,
> +			usb_sndbulkpipe(serial->dev, edge_serial->bulk_out_endpoint),
> +			buffer, length, NULL, EDGE_CMD_TIMEOUT);
>  	if (status) {
> -		/* something went wrong */
> -		dev_err(dev, "%s - usb_submit_urb(write command) failed, status =3D %d=
\n",
> -			__func__, status);
> -		usb_free_urb(urb);
> -		atomic_dec(&CmdUrbs);
> +		dev_err(dev, "failed to send command: %d\n", status);
>  		return status;
>  	}
> =20
> -#if 0
> -	wait_event(&edge_port->wait_command, !edge_port->commandPending);
> -
> -	if (edge_port->commandPending) {
> -		/* command timed out */
> -		dev_dbg(dev, "%s - command timed out\n", __func__);
> -		status =3D -EINVAL;
> -	}
> -#endif
> -	return status;
> +	return 0;
>  }

[Severity: High]
Does this leak the kmalloc()-allocated command buffer on every successful
command submission?

Previously, edge_bulk_out_cmd_callback() freed urb->transfer_buffer when the
URB completed. The three callers of write_cmd_usb() in
drivers/usb/serial/io_edgeport.c =E2=80=94 send_iosp_ext_cmd(),
send_cmd_write_baud_rate(), and send_cmd_write_uart_register() =E2=80=94 on=
ly free
their buffer (buffer or cmdBuffer) when write_cmd_usb() returns an error:

drivers/usb/serial/io_edgeport.c:send_iosp_ext_cmd() {
	buffer =3D kmalloc(10, GFP_KERNEL);
	if (!buffer)
		return -ENOMEM;
	...
	status =3D write_cmd_usb(edge_port, buffer, length);
	if (status) {
		/* something bad happened, let's free up the memory */
		kfree(buffer);
	}

	return status;
}

send_cmd_write_baud_rate() and send_cmd_write_uart_register() follow the
same pattern with cmdBuffer. Since usb_bulk_msg() does not free the caller's
transfer buffer, nothing frees buffer or cmdBuffer when write_cmd_usb()
returns 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D11
