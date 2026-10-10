Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E91D1A38F9
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791653454; cv=none; b=GyNk1xmtJ+KM9FQf6BJvAGPbMQzQ4Vz4+iGGfrGw0kx18vnUQqIjf2s+TWsWbXzpewL/L+83GVoEVCkemGzK4V5e9RXCeo4oy3bvXXZAe/rgBZH80ddGPyjwVv4Qo6cdE4fIOb6Th0enumqM1pDBnTQMt/KvdJh4//y0s0W6eXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791653454; c=relaxed/simple;
	bh=huxX+qQgY+vRtPK2MBxqfsMVI/PDra9VteGrILsFKhs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=R4RnhNhEkX6B/F8C7Kb75rBU7xLoDcEAjlWJKt08iC23gy28rcfakAjTJw85RCvPtUkF/+MSQ4CUoXf26bNE4Rq7DmU9XLqAtZVLa/lJtmyZ87Z5fI7ygQY8vS2VcgXjtATmblZwdySaEkMaz/oYkNR/sjc9VQ05a1rTnzkEcJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/8OFIKr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/8OFIKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3C31F000FF;
	Sat, 10 Oct 2026 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791653452;
	bh=9bjIxdoZWbt1gh+gZgWxRGETXcSAdJe4B5yl2mPfDuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g/8OFIKr5UwO1M3r6IVOJhBW+Bpcp7YhDRYAlp53aOfqN/eZofAKWNtSi2pIsMU10
	 8J03gR/5qF7RzSTLyK/FOMtVCX5jlBIdb3BETYgQ8pI9uNSwxAaF77/7iW6sR0aKZa
	 cdxbgqZMJ1Fn6Oc16PASxJ9kCet/e+2fzDG4L1O/mw8g/xalHs3o7qw/nYBP9d2DVQ
	 CJIQfSqvGKqtz2KnfOWfhgVXEkkDedNjOG68Fl+HruEn00sSmlNtVAZzcuoJoh1h11
	 /jOcYj5WXUEvIALUdw1VBeoE4kOMunAz5cxllEtVPZ17LJKb/qmpQmN0Khk2JeWjPx
	 4J4zlx++WBlHA==
Message-ID: <sashiko-outbox-166776@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: keyspan: fix control urb double submission
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ting-Han Hou" <ue081723@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010171619.1709-1-ue081723@gmail.com>
References: <20261010171619.1709-1-ue081723@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 17:30:51 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: keyspan: TOCTOU race on resend_cont reinstates closed ports
- [Medium] usb: serial: keyspan: 5ms busy-wait in atomic context inside URB=
 completion callback
--

commit 69cc5a68fa9dd8c58b7e866f241254a8f999f052
Author: Ting-Han Hou <ue081723@gmail.com>
Subject: USB: serial: keyspan: fix control urb double submission

This patch fixes a control URB double submission by adding a ctrl_lock spin=
lock
to serialise the -EINPROGRESS status check and the usb_submit_urb() call.

Link: https://syzkaller.appspot.com/bug?extid=3De69c25cf38a53d0cf64c

> --- a/drivers/usb/serial/keyspan.c
> +++ b/drivers/usb/serial/keyspan.c
> @@ -2323,12 +2334,15 @@ static int keyspan_usa49_send_setup(struct usb_se=
rial *serial,
>  	dev_dbg(&port->dev, "%s - endpoint %x (%d)\n",
>  		__func__, usb_pipeendpoint(this_urb->pipe), device_port);
> =20
> +	spin_lock_irqsave(&s_priv->ctrl_lock, flags);
> +
>  	/* Save reset port val for resend.
>  	   Don't overwrite resend for open/close condition. */
>  	if ((reset_port + 1) > p_priv->resend_cont)
>  		p_priv->resend_cont =3D reset_port + 1;

[Severity: High]
Does this code introduce a TOCTOU race that can inadvertently resurrect a c=
losed
port?

Looking at usa49_glocont_callback() and keyspan_usa49_send_setup() in
drivers/usb/serial/keyspan.c, if a concurrent close happens:

CPU1 (usa49_glocont_callback)
    if (p_priv->resend_cont) {
        // lockless read returns 1, so reset_port =3D 0
        keyspan_usa49_send_setup(..., p_priv->resend_cont - 1);

CPU2 (keyspan_close thread)
    // inside keyspan_usa49_send_setup(..., 2)
    spin_lock_irqsave(&s_priv->ctrl_lock, flags);
    p_priv->resend_cont =3D 3;
    ...
    spin_unlock_irqrestore(&s_priv->ctrl_lock, flags);
    // eventually completes, resets p_priv->resend_cont to 0, port is closed

CPU1 (keyspan_usa49_send_setup with reset_port =3D 0)
    spin_lock_irqsave(&s_priv->ctrl_lock, flags);
    if ((reset_port + 1) > p_priv->resend_cont) // 1 > 0 is true
        p_priv->resend_cont =3D reset_port + 1;   // resend_cont is now 1

Could CPU1 erroneously overwrite resend_cont with a stale reset_port value,
undoing the port closure and resurrecting the TX/RX configuration when the =
URB
completes and the callback resubmits?

> =20
>  	if (this_urb->status =3D=3D -EINPROGRESS) {
> +		spin_unlock_irqrestore(&s_priv->ctrl_lock, flags);
>  		/*  dev_dbg(&port->dev, "%s - already writing\n", __func__); */
>  		mdelay(5);
>  		return -1;
>  	}

[Severity: Medium]
Can this mdelay(5) cause a 5ms busy-wait in atomic context?

If the shared glocont_urb is submitted by a concurrent thread just before
ctrl_lock is acquired here, this_urb->status will be -EINPROGRESS. The
usa49_glocont_callback() calls keyspan_usa49_send_setup() directly from the
atomic softirq completion context.

Will executing a 5ms busy-wait in this atomic context cause severe latency
spikes and violate kernel atomic context rules? This pattern appears identi=
cally
across other send_setup functions modified in this patch in
drivers/usb/serial/keyspan.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010171619.1709=
-1-ue081723@gmail.com?part=3D1
