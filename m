Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7E390CAA
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146205; cv=none; b=ey8hLEMC6QLORcD7YMBCsNbbXIS8NJYNOSTwi6qeiYp/iTGrMyWrXBxIXOM6z+VQBfHWss1UQvFz9dqkuTkQLoku+RtYAQOrkWZGQPwrsrYQOYbKMPUgdtop+c9RNb4A8xFCerPEajryjE9xVCty5MXv/ZpPBYRhtYBCzymCAnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146205; c=relaxed/simple;
	bh=/BFL4qWsQSB3C+eMYxPuRvq0lGsp7fa2XURsWEhMecY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CmyWoezQrYcbDTcX1+Zc2F9RyGYmskel4MFYwQXsAVWt5OjyLMlb3oJXoALw6H4abheSrmDHj0O/ZcbNbM4Dta3+5DBwjdbkkpJVzIK5R3FuqMtE8bdT0dU2T7QOH7sbFgcg1bVrrjbKdLGTOdngzEEISAdektwnuMlFRQI4slo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcFWpbnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcFWpbnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2A31F000C4;
	Fri, 16 Oct 2026 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792146204;
	bh=N1unxqw3mQbuVfHDfr9GoEkQ9rWXdhQIJH2PGs8pEeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lcFWpbnp1m/u/t3nMeqEpjb5YeVTS+83uS0pKCpOoHXgPav4d4pcjlMBAlthzYSB2
	 ZmtN+cTF9U7aVz1S2+7akErN/iWF6eFZGHxCHT5qtG0dWIkSPoAk1PwdeRK2QQRWXC
	 JVQ8nRW7XeppJbaoMD6nmSPotc1wEAxFw1/7n9MXXMHD+W0leF0FiyNuMDa1FgkYYO
	 XaFhRqBUPWh8hz0YwvoFYsoflmLkbRFtn/m9BRWL0SymkMEC6w9cDXwZ/wGdNVKEV5
	 i3sLBxBX3SOMs5QAgFxPjcuVQ+fdc9UCd2WIfc9QJUwMBdpEmdaECvDo5ddjGMcNDg
	 o5plzvZ8XR9qA==
Message-ID: <sashiko-outbox-174156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] USB: serial: mxuport: handle TCFLSH buffer purge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Crescent Hsieh" <crescentcy.hsieh@moxa.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016100351.681390-6-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-6-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:23:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] tty: mxuport: TCFLSH interception causes AB-BA deadlock and job co=
ntrol bypass
- [Medium] usb: serial: mxuport: sent_payload accounting desynchronized by =
in-flight bulk URBs during purge
--

commit 50a2e5dd5f4f9804e6a3238f55deca09791f0018
Author: Crescent Hsieh <crescentcy.hsieh@moxa.com>

USB: serial: mxuport: handle TCFLSH buffer purge

Generic tty flush handling does not purge the receive and transmit
buffers in mxuport firmware or clear the USB serial write FIFO. This
commit handles input, output, and combined flush requests by issuing
the corresponding firmware purge request.

> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index 326a5ce18c6a0..9d304fb3aa02f 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
[ ... ]
> @@ -952,6 +958,70 @@ static int mxuport_set_rs485_config(struct usb_seria=
l_port *port,
>  	return 0;
>  }
> =20
> +static void mxuport_tx_flush_start(struct usb_serial_port *port)
> +{
> +	struct mxuport_port *mxport =3D usb_get_serial_port_data(port);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	mxport->hold_reason |=3D MX_WAIT_FOR_PURGE;
> +	kfifo_reset_out(&port->write_fifo);
> +	spin_unlock_irqrestore(&port->lock, flags);
> +}
> +
> +static void mxuport_tx_flush_done(struct usb_serial_port *port, bool pur=
ged)
> +{
> +	struct mxuport_port *mxport =3D usb_get_serial_port_data(port);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&port->lock, flags);
> +	if (purged) {
> +		mxport->sent_payload =3D 0;
> +		mxport->hold_reason &=3D ~MX_WAIT_FOR_SEND_NEXT;
> +	}

[Severity: Medium]
Since kfifo_reset_out() empties the software FIFO but does not unlink or
kill already-submitted URBs, is it possible for a late-arriving bulk URB to
be received by the device after the device has processed the RQ_VENDOR_PURGE
control message?

If the host controller schedules the bulk and control transfers such that an
in-flight bulk URB arrives post-purge, resetting sent_payload to 0 here
could permanently desynchronize the driver's flow control accounting. Could
this lead to miscalculating the UPORT_REQUEST_SEND_NEXT threshold, resulting
in over-transmission and an overflow of the device's internal RX buffer?

> +	mxport->hold_reason &=3D ~MX_WAIT_FOR_PURGE;
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
> +	usb_serial_generic_write_start(port, GFP_KERNEL);
> +}
> +
> +static int mxuport_flush_buffer(struct tty_struct *tty,
> +				unsigned long arg)
> +{
> +	struct usb_serial_port *port =3D tty->driver_data;
> +	int err, ret;
> +	u16 mask;
> +
> +	switch (arg) {
> +	case TCIFLUSH:
> +		mask =3D MX_PURGE_RX;
> +		break;
> +	case TCOFLUSH:
> +		mask =3D MX_PURGE_TX;
> +		break;
> +	case TCIOFLUSH:
> +		mask =3D MX_PURGE_RX | MX_PURGE_TX;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (mask & MX_PURGE_TX)
> +		mxuport_tx_flush_start(port);
> +
> +	err =3D mxuport_send_ctrl_urb(port->serial, RQ_VENDOR_PURGE, mask,
> +				    port->port_number);
> +	ret =3D tty_perform_flush(tty, arg);

[Severity: High]
Does calling tty_perform_flush() from within this driver's ioctl handler
create an AB-BA deadlock between tport->mutex and ldisc_sem?

When ioctl(TCFLSH) is called, tty_ioctl() delegates to serial_ioctl() which
acquires tport->mutex, and then calls mxuport_ioctl() and eventually this
function. tty_perform_flush() acquires ldisc_sem (read).

Concurrently, another thread could call a TCSETS ioctl, which acquires
ldisc_sem (read) in tty_mode_ioctl() and then tries to acquire tport->mutex
via serial_set_termios(). If a writer (like tty_set_ldisc) is waiting for
ldisc_sem, the read lock will block, completing the deadlock.

Additionally, because the hardware buffer is purged here before
tty_perform_flush() calls tty_check_change(), does this bypass POSIX job
control, allowing background processes to evade SIGTTOU restrictions?

> +
> +	if (mask & MX_PURGE_TX)
> +		mxuport_tx_flush_done(port, !err);
> +
> +	if (err)
> +		return err;
> +
> +	return ret;
> +}
> +
>  static int mxuport_ioctl(struct tty_struct *tty, unsigned int cmd,
>  			 unsigned long arg)
>  {
> @@ -959,6 +1029,8 @@ static int mxuport_ioctl(struct tty_struct *tty, uns=
igned int cmd,
>  	void __user *argp =3D (void __user *)arg;
> =20
>  	switch (cmd) {
> +	case TCFLSH:
> +		return mxuport_flush_buffer(tty, arg);
>  	case TIOCGRS485:
>  		return mxuport_get_rs485_config(port, argp);
>  	case TIOCSRS485:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100351.6813=
90-1-crescentcy.hsieh@moxa.com?part=3D5
