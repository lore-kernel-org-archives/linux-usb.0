Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8742A168
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082588; cv=none; b=uZxWWCJo7WRGGbhjfAxEgeOzROzsZ5/E8ygwRTkIrWdl1iMAdj8Rz/gMd4VRy8Wf6TAu3INjIWeu5eU4RAuukBHvApeDxHy4XU87HG0USN+37dL5OhGuHtlBi5712grQEmWLu1jqSx3u+EMJMTX6iAOeqmn4yp5dc9kmSKar9Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082588; c=relaxed/simple;
	bh=zByDHHtmkpwDpx1Wt9D4RRAASlRkezt+WKy92MFbhoo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ae4e3zHVIffdkbacvKRDzw0DwiAAKhlWWczCx+KPE1XDRDMQoucOKP7MJmgwknwEgfcvTPV0nPmYWbRzsm8wKQcU0y63vwmLWkc2nDeeUMy3Zd2TgemEfikpRKFzzThAjZHqwmHhJPIkz4dVIsyhot3+172IabITDIimWJDYq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eK4hP/r7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK4hP/r7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65D61F000C4;
	Thu, 15 Oct 2026 16:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792082568;
	bh=zfdBYMrzxgtoXvMesDobnM3ACevoC/Z5qw3703iZFrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eK4hP/r7ZXva4BJ6ml3dL5VbufW6grmeQl0ESu4EGbY2ugK13HOGpZ5zz5vfP3fxq
	 kH775St6FOqoWeaVNXN/zufzq/l151AKnsqvhChDRfAxmxBKlcjrhx9tlogTByepVY
	 xMFRXNuPKFeDky3V+zfw4yi4gVXtTuS6I6kHqqSaxgjbXTKBkkNvtWiEKzAoCQUC/h
	 QIrEnMCrrhlyM28Ht3Tjv10Yf7C2CfmeM2sZh8vuTeprAruTZ+MGysTuQYWS3jOJwP
	 CgYyuyL1+FIIKPBO8TV1nRBgBmfqcdxF1CCKQRBI6bHgK0ab7Wh2vkab8lF9ZKpA7J
	 WIkQN6oBuMOwA==
Message-ID: <sashiko-outbox-173201@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: implement flush_buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015162732.3170938-1-mehmet.fide@gmail.com>
References: <20261015162732.3170938-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:42:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] tty: u_serial: UAF in gs_flush_buffer during TTY hangup
--

commit c239a0119a25b9f8fab856b838b114d124d55f62
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

usb: gadget: u_serial: implement flush_buffer

This patch implements flush_buffer for u_serial to discard buffered output
under the port lock. This aims to prevent gs_close() from blocking for the
full 15-second timeout when the host does not read the port.

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index cdd1dfc666c4f..2b99e33cbf3af 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -822,6 +822,19 @@ static void gs_flush_chars(struct tty_struct *tty)
>  	spin_unlock_irqrestore(&port->port_lock, flags);
>  }
> =20
> +static void gs_flush_buffer(struct tty_struct *tty)
> +{
> +	struct gs_port	*port =3D tty->driver_data;
> +	unsigned long	flags;
> +
> +	spin_lock_irqsave(&port->port_lock, flags);

[Severity: High]
Could this lead to a use-after-free during TTY hangup?

If a USB gadget unbinds, gserial_disconnect() schedules a hangup via
tty_hangup(), which queues hangup_work. Concurrently, if userspace closes
the TTY, tty_release() calls gs_close(), dropping port->count to 0. This
wakes up gserial_free_port(), which proceeds to kfree(port).

Once tty_release() drops tty_lock(), the scheduled hangup_work executing
__tty_hangup() can acquire tty_lock() and call tty_ldisc_hangup().

Because tty_ldisc_hangup() unconditionally calls tty_driver_flush_buffer()
if a line discipline is present, it will invoke this newly added callback. =
By
this point, the port structure has already been freed by gserial_free_port(=
),
so attempting to take port->port_lock here dereferences freed memory.

> +	kfifo_reset(&port->port_write_buf);
> +	spin_unlock_irqrestore(&port->port_lock, flags);
> +
> +	wake_up_interruptible(&port->drain_wait);
> +	tty_wakeup(tty);
> +}
> +

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015162732.3170=
938-1-mehmet.fide@gmail.com?part=3D1
