Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299252;
	b=XYCIq+8cI5L3f909XKxHgkdtaTX9XwU3Df4CuuKhnvdC8qiKKQ8p+87s9NUb0xWna5oO
	 TeQ+j3Wh266vPLkrBBsn5LjQmoDfywuJyyotuvqOM2FYMLFjC4ShVm1kYc8DGAMKRG1T5
	 ZuI4eZlWfdBTeNtoSZzTM0MPmyBMfjW8O70tw8qrdxV3idIZ38+g1ZqJpt1lqBRYxcTUC
	 g4o0UlN0nM6ZPd8h9iuF6dlRTUWoXgtSohXreKy7x67jANLo2m+zN7XlFpct5qcl1Xofy
	 xFwDQUSKg1moCoIipGwrvoWNrsODZUiQKO4WBPa1J/DBZaIvmpE8KYMReMk3XiT5k+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299252;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mfLFPXTlxABaCEVIXdnJohLQtG2Y/mHhWWlXAQuA9zs=;
	b=HLcCsPsr8t/Vr72N3Cf/+ZENTrNoh3wksZonLE3EeRJAULKzLjqypaCSzcVs9+raI/eE
	 kbrFNXEei6o9BNs54B/3jVREdj8Puxmmm7CkDUaS+nFlUEX9CemJQ5yOJmI7Zxm/99UkO
	 aPBb6vxqOKRD2s/p1k+02C3fM0yBNZPwZGwCcfMmAqdtSVfkKeCoAyzIy+MqXbyTwdZIU
	 y7jktnpo5wYkZNIUC8Q9S2DVeTdNPt1gAqw1LCgz2mufdBZS5pnFf+Fy60UGCAJ/Dj+V/
	 x8cRTG0/UARG0JIuEUwrr4R7N7f54atQaJboQOivByDKxyoeU5azOGGNS/a9bwwckEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnXUGEeN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE64606A337
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jnXUGEeN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C001F008A1;
	Tue, 10 Nov 2026 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299251;
	bh=mfLFPXTlxABaCEVIXdnJohLQtG2Y/mHhWWlXAQuA9zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jnXUGEeNxdqHabEXyvioEPGQcKJwEOjiyU2bli9G2gcmHX9KUVT5f2XjTv67KGsP5
	 Zj6djlhKLPjoaR23zP7V9hH9Kj9ZGOIfEGe8lDqIxTLaPrv7IhQ0hmM4ni/4s5vglw
	 MTrtWzTAQXv7qC0s/aPIW1bn7HMCFybDJ4RXv9Lcqn7WMjkDEK5a8/t43H2hAbnHSd
	 asBpp5tT3h619f+Gujb71SjA05Z8D6HA594jnyWdt77+LVPK2jQBF+CUAmeoOrFY+G
	 sybsSEHLxe9WLlRR3gU2Rh93i5X8oLiuA673w/B0rqcRbfndhMr24GHyqX7TmQCKHP
	 bBSRHz/6nCzYA==
Message-ID: <sashiko-outbox-206613@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] USB: serial: mos7720: fix actual baud rate not
 reported back to TTY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Iskhakov" <shkiper325@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110081426.26265-1-shkiper325@gmail.com>
References: <20261110081426.26265-1-shkiper325@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:27:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] usb: serial: mos7720: wrong base clock in
  calc_baud_rate_divisor()
- [Medium] usb: serial: mos7720: rejected baud rate left in termios on
  error
--

commit 31af65a86747f94a34c72846cf8b44bc48c4bc0f
Author: Agalakov Daniil <empt1nesss@proton.me>

USB: serial: mos7720: fix actual baud rate not reported back to TTY

This commit updates calc_baud_rate_divisor() and send_cmd_write_baud_rate()
to write back the computed baud rate via a pointer argument, and checks the
return status in change_port_settings() before calling tty_encode_baud_rate=
().

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
Does this calculate *baudrate against the wrong base clock?

In divisor_table[] right above, the standard-mode divisors use a 115200 Hz
base clock:

drivers/usb/serial/mos7720.c:divisor_table[] {
    ...
	{   38400,	3},
	{   57600,	2},
	{   115200,	1},
};

For any rate not in divisor_table[] (such as B200 or custom BOTHER speeds),
using 230400L / custom reports twice the hardware baud rate produced by
that divisor.  When custom is 1 (requested rate in 153601..230399),
*baudrate becomes 230400 and is encoded into tty->termios, causing
subsequent change_port_settings() calls to enter the baud >=3D 230400 branch
and call the non-functional set_higher_rates().

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

[Severity: Medium]
When send_cmd_write_baud_rate() fails, does skipping tty_encode_baud_rate()
leave the rejected baud rate in tty->termios?

tty_set_termios() copies *new_termios into tty->termios before invoking the
driver's set_termios() callback.  If a caller requests an unsupported rate
such as B75 (which is absent from divisor_table[] and excluded by
*baudrate > 75), calc_baud_rate_divisor() returns -EINVAL without updating
the UART divisor registers, but skipping tty_encode_baud_rate() leaves B75
in tty->termios instead of restoring the previous rate from old_termios.

In addition, send_cmd_write_baud_rate() ignores the return values of its
write_mos_reg() calls, and the baud >=3D 230400 branch right above still
returns early without calling tty_encode_baud_rate() despite removing the
FIXME comment.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110081426.2626=
5-1-shkiper325@gmail.com?part=3D1
