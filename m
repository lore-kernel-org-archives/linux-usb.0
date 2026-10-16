Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02E442372
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145818; cv=none; b=YSwpBoUQMOpoSkumZwsQAUEoTDLjBteDiF2p8Zt0diSJYv77bO5UIkmzfyjrWr00Vj7Qg10RE8sAgo3H1Xn9jzetgZrO6o+DV5G696w55IuzIqxUOU99ervkclWG5im1XZKyfV687stjt4AkxpyidcGFnJ8/9iSgXTRVxo4Yh84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145818; c=relaxed/simple;
	bh=VvCG7/4z3yk25mlN0COaLBzHY2Sp5bvounZG3KQSZZs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KfXY4lZhWOO/17XXV1cuKLndCAdkWoCyc3Y65O4+tzxDrKvdIgahT8fWyrvm9Bx0JClpVhTxSh98adWGSPsvvRWuE80x50TD3hjEMu4wcoepLEPyX4z72mEN+cMAOIMyIG7JPdZUN1eEyBKeC9Oc1qACEvn9TVlo61LTIzWzauo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPNI/3KH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPNI/3KH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9821F000C4;
	Fri, 16 Oct 2026 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145816;
	bh=adKKMjkLQCqm6o8oau3K75CVfZUR0g69AwWOT4YFQZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JPNI/3KHQnOttlEuqi87clKRpImYw2YIWa1JPFFgb5aWqbMQP3J8Au9n+R+y2Vt13
	 n0jfGSYgi6heZBbkyyfrLLkoqRIo97spHXa0hIenxEszvLokizTJr+OmSYc6FdVtuK
	 fCJ+uVusYPZZF/5lRaOHzihnnDIkfa5iuYPxi50mC7OHo94fWYG5WMW9htBSvsjYd9
	 2WcHMkJULHe41L2LDAPZkEzdeEQFtgQug1fS4egQYlGx8BWAcFNAS0iACqctExRMH0
	 +0VTQ6T4+O83bTAMjHl+JEr9B01p3yA58iap/Ij22B2kO3WKRXs9VS4+3VBprVMyQi
	 Nd2z+RPcBWzEQ==
Message-ID: <sashiko-outbox-174140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] USB: serial: mxuport: initialize modem status on
 open
Reply-To: sashiko-reviews@lists.linux.dev
To: "Crescent Hsieh" <crescentcy.hsieh@moxa.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016100351.681390-3-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-3-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:16:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: serial: mxuport: TOCTOU race drops MSR events during open
--

commit e30f4f38ee9a11d678d89a99a4f6221fd7d285d1
Author: Crescent Hsieh <crescentcy.hsieh@moxa.com>

USB: serial: mxuport: initialize modem status on open

The cached modem status is currently cleared whenever a port is opened,
regardless of the current modem-status inputs. This commit fetches the
modem status register via a vendor request during port open so that
TIOCMGET reports the correct initial input signals.

> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index fa75f844050dc..3f1989afde30e 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c

[ ... ]

> @@ -1477,13 +1478,19 @@ static int mxuport_open(struct tty_struct *tty, s=
truct usb_serial_port *port)
>  	mxport->hold_reason &=3D ~MX_WAIT_FOR_SEND_NEXT;
>  	spin_unlock_irqrestore(&port->lock, flags);
> =20
> -	/*
> -	 * TODO: use RQ_VENDOR_GET_MSR, once we know what it
> -	 * returns.
> -	 */
> -	mxport->msr_state =3D 0;
> +	err =3D mxuport_recv_ctrl(serial, RQ_VENDOR_GET_MSR, 0,
> +				port->port_number, &msr_state,
> +				sizeof(msr_state));

[Severity: Medium]
Does this introduce a race condition where modem status events can be
dropped?

If a physical modem status line changes immediately after this
RQ_VENDOR_GET_MSR request completes, but before the core layer marks the
port as initialized, it appears the completion handler drops the incoming
hardware events.

Looking at mxuport_process_read_urb_demux_event():

    if (tty_port_initialized(&demux_port->port)) {
        ch =3D data + HEADER_SIZE;
        rcv_event =3D get_unaligned_be16(data + 2);
        mxuport_process_read_urb_event(demux_port, ch, rcv_event);
    } else {
        dev_dbg(&demux_port->dev, "%s - event for closed port\n", __func__);
    }

Since tty_port_initialized() is not set to true until after mxuport_open()
returns to the core layer, any state transition in this window is silently
dropped. Can this leave the cached msr_state permanently desynchronized
from the actual hardware state until a subsequent event occurs?

> +	if (err)
> +		msr_state =3D 0;
> +	else
> +		msr_state &=3D ~UART_MSR_ANY_DELTA;
> =20
> -	return err;
> +	spin_lock_irqsave(&mxport->spinlock, flags);
> +	mxport->msr_state =3D msr_state;
> +	spin_unlock_irqrestore(&mxport->spinlock, flags);
> +
> +	return 0;
>  }
> =20
>  static void mxuport_close(struct usb_serial_port *port)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100351.6813=
90-1-crescentcy.hsieh@moxa.com?part=3D2
