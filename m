Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581033B9D8C
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145704; cv=none; b=F5gLvrbCJXboI1zyWTNwvnBLY+Ch+Ox89b0r1Q6KezC1rXxhNxJJHOaQqvY2BwdJaVFgYqwxGdQtjMiQbRDHImIDHKRUkF0O6RVPiks3tpaE6t7NBHQf95cpSCuC4DPZT0IfTZ/vqDfSgT/ntfFe8EukpIwW4DPHTrcPbmZOw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145704; c=relaxed/simple;
	bh=v0vKhY+XtVuAuNgAOp9AWgupYIRL//WXOyhm5fh6eHg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y27JCts1YgVlyCjLpuyC1lEKi2erKrMMouME4KfAArfFQUjjZwn77UbZ9r/tu4sqqKWTIRi8ekH9LBZiVeimddgMbXoD2yGdsh3z8B6qIG7lvJ+n6Ic255lMNv4wq0p3kJW93gxbWvBXwQomxenQjWiJxNZTpJHYFEtnD+lpanU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDvNHOzm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDvNHOzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1436A1F000C5;
	Fri, 16 Oct 2026 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145703;
	bh=ZC7uli2ACkSIek/4JcGbpSqbQ/lvdn5kltaeUG7cfoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dDvNHOzm7S/E2+9DJmf+Q5RRYkonlyFVK/20A1BSq21/ZnKniE0abRiuWo7RA8PUs
	 CzaWq68xhyWnns7OO6+VuHYcvSc+lVyM2yRqdokl0V8ATXoD5q5j6CZsj5c08UpJP4
	 iGd9U2XP/kwX+AuX+FG0SO262c8PXvpfphgyrc2uatEGsvlQCeHFd+xD9oLOfhwimu
	 OPKrarPhrOlq6zZrs3yFc7cVUvY4Osi7SMCmeDiPLM3S+yAn0LvdgZwJv/rcUIlIhd
	 iMUK7Qovf2T47YjJpv6TYSjJIab/p/8bAB972zxh1+7mHNLk3ATR2SiXiUZ9xdVbtt
	 UrPYcoF1Fclmg==
Message-ID: <sashiko-outbox-174135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] USB: serial: mxuport: wait for UART transmit
 completion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Crescent Hsieh" <crescentcy.hsieh@moxa.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016100351.681390-7-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-7-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:15:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] usb: serial: mxuport: missing tty_io_error check after generic w=
ait
- [Low] usb: serial: mxuport: TOCTOU race on jiffies causes integer underfl=
ow
--

commit 4adf9d00bbc773d24e34eebaf0a7427eedbc5bef
Author: Crescent Hsieh <crescentcy.hsieh@moxa.com>
USB: serial: mxuport: wait for UART transmit completion

This patch introduces a device-specific wait_until_sent callback for the
mxuport driver. It supplements the generic queue polling with an additional
wait for remaining UART transmit stages based on the active termios baud
rate and frame size.

> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index 9d304fb3aa02f..53ab284f82aad 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c

[ ... ]

> @@ -716,6 +722,64 @@ static bool mxuport_tx_empty(struct usb_serial_port =
*port)
>  	return txlen =3D=3D 0;
>  }
> =20
> +static void mxuport_wait_until_sent(struct tty_struct *tty, long timeout)
> +{
> +	struct usb_serial_port *port =3D tty->driver_data;

[ ... ]

> +	frame_bits =3D tty_get_frame_size(tty->termios.c_cflag);
> +	if (timeout)
> +		deadline =3D jiffies + timeout;
> +
> +	usb_serial_generic_wait_until_sent(tty, timeout);
> +	if (signal_pending(current))
> +		return;

[Severity: Medium]
The generic wait function usb_serial_generic_wait_until_sent() can break out
early when tty_io_error(tty) is true, such as during a device disconnect.

Because mxuport_wait_until_sent() does not check tty_io_error() or device
disconnection after the generic wait returns, does it proceed unconditional=
ly
to sleep for the hardware drain delay?

If the device is unplugged, this could cause close() or tcsetattr() to block
pointlessly for a long duration, up to around 25 seconds per port at 50 bau=
d.

> +
> +	if (timeout && time_after_eq(jiffies, deadline))
> +		return;
> +
> +	delay_ns =3D DIV_ROUND_UP_ULL((u64)frames * frame_bits * NSEC_PER_SEC,
> +				    baud);
> +	if (timeout)
> +		delay_ns =3D min_t(u64, delay_ns,
> +				 jiffies_to_nsecs(deadline - jiffies));

[Severity: Low]
Can the unprotected double-read of jiffies cause an integer underflow here?

If the timer tick advances jiffies past deadline exactly between the
time_after_eq(jiffies, deadline) check and the deadline - jiffies subtracti=
on
below it, the result of the subtraction will be negative. This negative val=
ue
will underflow to a massive unsigned value.

Consequently, min_t() would fail to bound the wait to the remaining timeout,
instead selecting the full delay_ns and artificially extending the sleep
duration. Would capturing jiffies into a local variable before the check
prevent this race?

> +
> +	dev_dbg(&port->dev,
> +		"%s - waiting %llu us after transmit queue drained\n",
> +		__func__, DIV_ROUND_UP_ULL(delay_ns, NSEC_PER_USEC));

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100351.6813=
90-1-crescentcy.hsieh@moxa.com?part=3D6
