Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486154;
	b=HDstAeaHdLPpjfy8pJoGbbkqib9CGKgNeTeO4eLLu7Oh3K1Pbl6c1SjgM9WDR/lFO3b5
	 F8Lj9MolneWkLARClilVG7gQy6UhKtJ6iSKWqjDgKrk4r5/AVj7eqJ/JV3Co8T/8lbJZA
	 yBv/pUPhRGYu7KxSrv0K7CDBEINdsjJoq/7+OKyb9yI1umde+aIMCVvFsg26MBGpfP3G0
	 UvY5Dt1lRMx7OCZZutipSvhwr3NoxhrnllYCtv4OLJiD8F+3bkTaAS1yMkyhTvt2uyQR+
	 Bh9NhJ4IkYU18sE0jpQPAvqNO/E1Mt5ZZteW5mMowOEa2YkuwZT7yiZu8MB20m9dtrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486154;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zD2TEQUgjVihuTptZD1QpQmLoCZI3j+mmQF7Pjl9+gc=;
	b=aUJNPfw8Hv2KN1qzoGidFrzBx8jM2XxboorVfojdjteN5GeWHgomtCrQ5yRVejlY24mc
	 3Ly7+sjsfsVVG8iEquXbUm9ZPMdf+Bw5f+qrzCuTWuMGy7HZpG3I/4vZ1gwXHDT5zpQz1
	 fgDdi4HJCKe6ATGmoyFbE7o4ucJ79/nq4zVIaUR7eGWgAVccSihbPQs4RljO0S4MK/e2H
	 giPMXskaylqqxwFNBfxV3jd/2m3E9wBOqdllRdablaf7mLVnbWlF/TuONX32RpS6w1W3e
	 IBFQSF3PptfhApYbeIaF3PJ6X65j3016j/D/812xTeXRodeEabgSarSqgN21AAJgIbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UU1Qdenv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D8606A31A
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UU1Qdenv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ADA1F000C4;
	Tue, 20 Oct 2026 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486154;
	bh=zD2TEQUgjVihuTptZD1QpQmLoCZI3j+mmQF7Pjl9+gc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UU1Qdenv9+k9ktvZrrGrJFSUEBMPxYCKz4Hdus9kvbQKuCT0/FVCo7BchYmwol/y1
	 w2eNiBPArRJrChcOXb0hd1e6sgzSeZlfQPSiwQfLWupJ2R0xwn/2f65V80XptWv1fT
	 cAmPHjFYxDoDM+0To+dPTOEMhocXZXKn1/6SVtY6J8wEKFwg5HTXaZ8t3+D8M8VjAO
	 cbDFa6/+IMTSFOQkd3Sd0j8M3ImYLHc0kGk3kExInKOC+iD8CgJAwrCATQN2f+BaEa
	 3C7172Kx9sniHeHjzElkVPPQ1ALe9yYOCG+11D27UySma1nUlgSXNE4IMg74+0x76m
	 EWqIdpNKsk6Pw==
Message-ID: <sashiko-outbox-178628@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: mos7720: fix actual baud rate not reported
 back to TTY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Iskhakov" <shkiper325@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020072248.7607-1-shkiper325@gmail.com>
References: <20261020072248.7607-1-shkiper325@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:49:13 +0000
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
- [Medium] usb: serial: mos7720: failed baud rate left in termios in change=
_port_settings()
- [Medium] usb: serial: mos7720: wrong base clock in calc_baud_rate_divisor=
()
--

commit 810101c2bd92bb52e1ced8f6f992bab94cb3a6d6
Author: Agalakov Daniil <empt1nesss@proton.me>

USB: serial: mos7720: fix actual baud rate not reported back to TTY

This commit changes calc_baud_rate_divisor() and send_cmd_write_baud_rate()
to take a pointer to the baud rate so that the calculated hardware baud
rate can be passed back to change_port_settings() and encoded into the TTY
termios structure when send_cmd_write_baud_rate() succeeds.

> diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
> index 104f43a8f4d81..231d47b329942 100644
> --- a/drivers/usb/serial/mos7720.c
> +++ b/drivers/usb/serial/mos7720.c
> @@ -1265,9 +1265,9 @@ static const struct divisor_table_entry divisor_tab=
le[] =3D {
>  /***********************************************************************=
******
>   * calc_baud_rate_divisor
>   *	this function calculates the proper baud rate divisor for the specifi=
ed
> - *	baud rate.
> + *	baud rate and updates the baudrate parameter with the actual value.
>   ***********************************************************************=
******/
> -static int calc_baud_rate_divisor(struct usb_serial_port *port, int baud=
rate, int *divisor)
> +static int calc_baud_rate_divisor(struct usb_serial_port *port, int *bau=
drate, int *divisor)
>  {
>  	int i;
>  	__u16 custom;
> @@ -1275,10 +1275,10 @@ static int calc_baud_rate_divisor(struct usb_seri=
al_port *port, int baudrate, in
>  	__u16 round;
> =20
> =20
> -	dev_dbg(&port->dev, "%s - %d\n", __func__, baudrate);
> +	dev_dbg(&port->dev, "%s - %d\n", __func__, *baudrate);
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(divisor_table); i++) {
> -		if (divisor_table[i].baudrate =3D=3D baudrate) {
> +		if (divisor_table[i].baudrate =3D=3D *baudrate) {
>  			*divisor =3D divisor_table[i].divisor;
>  			return 0;
>  		}
> @@ -1286,18 +1286,19 @@ static int calc_baud_rate_divisor(struct usb_seri=
al_port *port, int baudrate, in
> =20
>  	/* After trying for all the standard baud rates    *
>  	 * Try calculating the divisor for this baud rate  */
> -	if (baudrate > 75 &&  baudrate < 230400) {
> +	if (*baudrate > 75 && *baudrate < 230400) {
>  		/* get the divisor */
> -		custom =3D (__u16)(230400L  / baudrate);
> +		custom =3D (__u16)(230400L  / *baudrate);
> =20
>  		/* Check for round off */
> -		round1 =3D (__u16)(2304000L / baudrate);
> +		round1 =3D (__u16)(2304000L / *baudrate);
>  		round =3D (__u16)(round1 - (custom * 10));
>  		if (round > 4)
>  			custom++;
>  		*divisor =3D custom;
> +		*baudrate =3D 230400L / custom;

[Severity: Medium]
Is 230400L the right base clock here in calc_baud_rate_divisor() in
drivers/usb/serial/mos7720.c?

Looking at divisor_table[] right above this function, standard mode
divisors on MOS7720 are based on 115200 / divisor:

static const struct divisor_table_entry divisor_table[] =3D {
	{   50,		2304},
	...
	{   9600,	12},
	{   19200,	6},
	{   38400,	3},
	{   57600,	2},
	{   115200,	1},
};

When a user requests a baud rate in (75, 230400) that is not in
divisor_table[] (such as B200 or a custom BOTHER speed), computing
*baudrate =3D 230400L / custom reports twice the hardware baud rate back to
tty->termios for that divisor.

Furthermore, if a baud rate in [153601, 230399] is requested, custom
evaluates to 1 (which is 115200 baud in divisor_table[]), and *baudrate is
set to 230400 and encoded into tty->termios. On the next
mos7720_set_termios() -> change_port_settings() call (for example when
updating parity or flow control), tty_get_baud_rate(tty) will return 230400
and enter the baud >=3D 230400 branch calling set_higher_rates(), which has=
 a
comment noting that it does not work.

> =20
> -		dev_dbg(&port->dev, "Baud %d =3D %d\n", baudrate, custom);
> +		dev_dbg(&port->dev, "Baud %d =3D %d\n", *baudrate, custom);
>  		return 0;
>  	}

[ ... ]

> @@ -1475,10 +1476,8 @@ static void change_port_settings(struct tty_struct=
 *tty,
>  	}
> =20
>  	dev_dbg(&port->dev, "%s - baud rate =3D %d\n", __func__, baud);
> -	status =3D send_cmd_write_baud_rate(mos7720_port, baud);
> -	/* FIXME: needs to write actual resulting baud back not just
> -	   blindly do so */
> -	if (cflag & CBAUD)
> +	status =3D send_cmd_write_baud_rate(mos7720_port, &baud);
> +	if (!status && (cflag & CBAUD))
>  		tty_encode_baud_rate(tty, baud, baud);
>  	/* Enable Interrupts */
>  	write_mos_reg(serial, port_number, MOS7720_IER, 0x0c);

[Severity: Medium]
When send_cmd_write_baud_rate() returns an error in change_port_settings()
(for example, -EINVAL from calc_baud_rate_divisor() when B75 or a custom
baud rate <=3D 75 other than 50 is requested), does skipping
tty_encode_baud_rate() leave the failed baud rate in tty->termios?

In drivers/tty/tty_ioctl.c, tty_set_termios() copies *new_termios into
tty->termios before invoking the driver callback:

	old_termios =3D tty->termios;
	tty->termios =3D *new_termios;
	...
	if (tty->ops->set_termios)
		tty->ops->set_termios(tty, &old_termios);

Because tty->termios has already been overwritten with the newly requested
termios prior to mos7720_set_termios() -> change_port_settings(), skipping
tty_encode_baud_rate() on error leaves tty->termios reporting the unapplied
baud rate while the hardware remains at the previous speed. Should the old
baud rate from old_termios be restored instead when
send_cmd_write_baud_rate() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020072248.7607=
-1-shkiper325@gmail.com?part=3D1
