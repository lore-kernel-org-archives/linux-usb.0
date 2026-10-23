Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759388;
	b=WNGldwolTArHEeTvYX6zppvJLSOYZiHkW2UU1kCqSjGxaFAj4Fe6B/d5BTNNBvzDhMtx
	 SLQax5j9HHz4flU+xhKvWGdxax0Vk5YhFQ0cUVTaSOkeByHby1kEoBlTgFA6qc5DUyO27
	 9x+WbutFgJBBXkpFz8DNHEVnz1HN/s++vtftYHM64PhsrGl+qUCnKQ1+lqL/8V+oTk95l
	 87yTHtpObMIogJJiHjSIv/x5NxBskLI4EG4TtBv/PSWWVhIwshriISBIGIa5s/N/ms0fJ
	 gCY2sUUsF/ACYDLyGZ33+BLsky386jhy8fdBTEBaoXRVz6Y5FD9sMEaFz6QGV2Bgf/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759388;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UGF+qMyGtPQpcuBveQOqWNS7QDzgAYBJbTmJEAouDC8=;
	b=hJCsujlwwyULOzwNUzPZcj5ULhLkwNlCoSwcVNdxBEI/TNUNSejyoX36aZmeHtupsZH3
	 FXzGrfqZLrRRvS29rrwDVPs+eYPz4M4yEipqI6ceAjUuxEsDHfpjaUvZ0KZN89RDfWN+e
	 Hkm8HKQAaFtxACMmHA+sqdlceV0LLKt02EtcJ7rvw5/64XcFZ9gi7yyFBXfqf4nWPdWkR
	 A/FUA6oSjKLjqUOpStKaxnG8iL6Tl1kpzjwhx3Hvd0hGhFKmPgiQFEcmmfY7yoFquBIT8
	 1HEFXJLiveYoSD/Yin58Wp7bDmpmz1pUDBetn0encQUiNwbP+xvekiycQRZpA+ajylg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyvHTno8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C5606A31E
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VyvHTno8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2F91F01825;
	Fri, 23 Oct 2026 12:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792759388;
	bh=UGF+qMyGtPQpcuBveQOqWNS7QDzgAYBJbTmJEAouDC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VyvHTno80e7LLgtIl59u4qq0mYAkh1PXFtDSwjcMk9hPIz1RygBSJvD9KXe/P4irK
	 ukIlA0fNiHaQVaS6jyM5hvKrXftyi8XmITiDwjhDwa625Qv0vSys6EcDtWOoOj9Vb7
	 oC8wtp8XD9hP5C6jAUbZFosmSUF9SoHDlLyLEO0MjZSVOxlzmC+QWxKc9s4A9EA1p/
	 2cPUPE2hszhoqsMHD0Q1w9bWNIKybLe6xS3LSSkC6wCqWuziyOoSghFknsJesCgKtl
	 gTb6cWCzAM50Uu73xIatb+J53LLU1aj/9AoYSeJJm1Hy2tx/uufJ6Ka61zUpjvW4Rh
	 0m5TzgK4G2HKw==
Message-ID: <sashiko-outbox-182789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/12] USB: serial: io_edgeport: deassert DTR/RTS on
 close() and B0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-11-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-11-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:43:07 +0000
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
- [Medium] USB: serial: io_edgeport: DTR/RTS dropped on reopen with HUPCL c=
leared
--

commit 04f867c0006b106f7227398e82b66d8d1816c7f9
Author: Johan Hovold <johan@kernel.org>

USB: serial: io_edgeport: deassert DTR/RTS on close() and B0

This commit adds a dtr_rts() callback to handle asserting and deasserting D=
TR
and RTS on open(), close(), and hangup, and updates edge_set_termios() to
handle B0 transitions.

> diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edg=
eport.c
> index 566f0f1a16324..ebbe8c5370cdb 100644
> --- a/drivers/usb/serial/io_edgeport.c
> +++ b/drivers/usb/serial/io_edgeport.c

[ ... ]

> @@ -2412,9 +2429,12 @@ static void edge_set_termios(struct tty_struct *tt=
y, struct usb_serial_port *por
> =20
>  	/* set up the MCR register and send it to the EdgePort */
>  	mutex_lock(&edge_port->mutex);
> -	edge_port->shadowMCR =3D MCR_MASTER_IE;
> -	if (cflag & CBAUD)
> -		edge_port->shadowMCR |=3D (MCR_DTR | MCR_RTS);
> +	if (cflag & CBAUD) {
> +		if (old_termios && (old_termios->c_cflag & CBAUD) =3D=3D B0)
> +			edge_port->shadowMCR |=3D MCR_DTR | MCR_RTS;
> +	} else {
> +		edge_port->shadowMCR &=3D ~(MCR_DTR | MCR_RTS);
> +	}
> =20
>  	status =3D send_cmd_write_uart_register(edge_port, MCR,
>  						edge_port->shadowMCR);

[Severity: Medium]
Will this cause DTR and RTS to be momentarily dropped when reopening a port
that was closed with HUPCL cleared?

When a port is closed with HUPCL cleared, tty_port_shutdown_locked() leaves
DTR and RTS asserted. On a subsequent open, serial_open() -> tty_port_open()
-> serial_port_activate() calls edge_open(), which resets edge_port->shadow=
MCR
and calls edge_set_termios() before tty_port_block_til_ready() calls
edge_dtr_rts(port, 1):

drivers/usb/serial/io_edgeport.c:edge_open() {
	...
	/* Must always set this bit to enable ints! */
	mutex_lock(&edge_port->mutex);
	edge_port->shadowMCR =3D MCR_MASTER_IE;
	mutex_unlock(&edge_port->mutex);
	...
	if (tty)
		edge_set_termios(tty, port, NULL);
	...
}

Because edge_open() clears MCR_DTR and MCR_RTS in shadowMCR and passes
old_termios as NULL to edge_set_termios(), edge_set_termios() no longer sets
MCR_DTR | MCR_RTS and writes shadowMCR without DTR and RTS to the device
before tty_port_block_til_ready() reasserts them.

Should edge_port->shadowMCR =3D MCR_MASTER_IE be initialized once in
edge_port_probe() instead of being reset on every open in edge_open() so th=
at
DTR and RTS are preserved across a close and reopen when HUPCL is cleared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D10
