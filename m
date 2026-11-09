Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205000;
	b=rgstqF1S3o/mFUiw8jKFl6cVNqNcYuwd9cgeXir8KiDhXnR6HxYyOYdUJED0SeFd5b4V
	 enElpud5YoCg/ycM6mezA5SeFO6fPcFVmz32yBAmx+k/4WdVVYWtfni6+DGEBm4btS1YE
	 7uD6V0KS2qt1cJCpeHtdaJ09GAc1AB/vTZxXC36H6WhWqv0DG4sc6I485gP6ixXKKKzV9
	 OvbrJcEzdy3fZEqOlISuCfCtR4rLW+daIEUGYc9HLb8uxa4AJZBx+spOEiD41bJsR6Awc
	 hIBvhdPzMYawZxalHQnlMXSmrX2M9l8G/ZSHCDw6veQ4Lcc/iyEdLBIg9cn7Wx9rYbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205000;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=neNZu4PM88369deQGBBfh3ApOHTlPaQezIsVWZTGLWs=;
	b=CyZPRKUq5kWCLnjMgFJQEnNk5ACAuDc/8bO3jYjHRQYzj1X6mA+HN0wwKfIA92pbigdf
	 Xof9wKTlETQJu5uFhl+N+5MnTEtuynneWgWlqm5n+T3Sy5mOtQsiOZazArt6aAC5WuwAb
	 WX6vWRslkGrOfbYJcT2ROT9zEQS5ceIYV2uxaMetLEYQH2cPgZuDjvRvmzVB3ttqqYhEa
	 uXKR5S+gTTCQu2IvT9Rax4rPDGLpWLNuD5X0NVLwf78y/IkIMDGtmZZ+HWpllvVNQa+ds
	 BWVQhJlVA21IXuy0clL1TtOKqmw23YQhqhyKhAgfi0BQhM2vGvvSR01czutqFw+DMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJpJlmA8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71FD606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJpJlmA8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFE01F0089F;
	Mon,  9 Nov 2026 06:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204999;
	bh=neNZu4PM88369deQGBBfh3ApOHTlPaQezIsVWZTGLWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJpJlmA8JuBaAf1OlhwpUjnZHk1TaHnvT+MACctM2lsusHFNBLo9hl41N3mNxSM5c
	 BMwirzFbhpUhjat05JhUsP9JQoZuf4PCLj3QDnIp5fEUrrzQb8eM3Vc2QQUKTNlIBu
	 aT4wJOxELqFE9jefFbAYx4/0lMVFccJlqqNOneXe50O5R9zGzNLeGas7d85EQKCm4m
	 XU0Wh0uepce9IRIAWbpqkiSQbRJBnMjuvXfy3fEXfythT2bwCDKZr3spnQzO6IIvYJ
	 TX80pVy4+VfCJr2CuX8TQDVEQfDZ5lynH1Sj6jDk2l00fj4+ircedHlKPcstoGRdEq
	 fF+HGcWWw11/g==
Message-ID: <sashiko-outbox-204492@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-b4-gadgetfs-ep0-v5-1-f16d0b648bc2@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v5-0-f16d0b648bc2@gmail.com>
 <20261109-b4-gadgetfs-ep0-v5-1-f16d0b648bc2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 06:16:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] usb: gadget: gadgetfs: invalid kfree of descriptors in
  gadgetfs_unbind()
- [Medium] usb: gadget: gadgetfs: premature state change in ep0_write()
  hides abort
- [Medium] usb: gadget: gadgetfs: incomplete setup_abort handling in
  ep0_read()
- [Medium] usb: gadget: gadgetfs: setup_abort in ep0_read() clobbers
  unbound state
--

commit 3d2d9c4891365d79ece2e8243c8a799fb412498e
Author: Jing Lin <kayano050408@gmail.com>

usb: gadget: gadgetfs: fix ep0 request lifetime on disconnect

This commit tracks whether the preallocated ep0 request is queued, stages
delegated control payloads through private buffers so copy_to_user() and
copy_from_user() do not race with gadgetfs_setup() on dev->req->buf, and
dequeues dev->req in gadgetfs_unbind() before freeing it.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 7f6d8460152f9..e9380538e0b98 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
[ ... ]
> @@ -1109,25 +1134,37 @@ ep0_read (struct file *fd, char __user *buf, size=
_t len, loff_t *ptr)
>  			if (retval)
>  				goto done;
> =20
> -			if (dev->state !=3D STATE_DEV_SETUP) {
> +			if (dev->setup_abort) {
> +				dev->setup_abort =3D 0;
> +				dev->state =3D STATE_DEV_CONNECTED;
> +				retval =3D -EIDRM;
> +				goto done;
> +			}

[Severity: Medium]
Can ep0_read() ever reach this dev->setup_abort check when a delegated
control OUT transfer is aborted before its data stage completes?

Immediately above this hunk, ep0_read() sleeps in:

drivers/usb/gadget/legacy/inode.c:ep0_read() {
    ...
			retval =3D wait_event_interruptible (dev->wait,
					dev->setup_out_ready !=3D 0);
    ...
}

When a new SETUP packet aborts the pending OUT transfer in
gadgetfs_setup(), dev->setup_abort is set to 1 while dev->setup_out_ready
remains 0 (or is reset to 0 for a new delegated setup), so the wait
condition is still false and ep0_read() stays asleep instead of returning
-EIDRM.  If the earlier OUT transfer had already set dev->setup_out_ready
before an in-kernel setup aborted it, this branch also returns -EIDRM
without clearing dev->setup_out_ready, dev->setup_out_error, or
dev->setup_out_len.

In addition, if the abort arrives before userspace calls ep0_read(),
ep0_write(), or ep0_poll(), the entry checks in those functions clear
dev->setup_abort =3D 0 without resetting dev->state from STATE_DEV_SETUP to
STATE_DEV_CONNECTED, so the next event read is still misdirected into the
control data stage path.

> +			if (dev->state !=3D STATE_DEV_SETUP ||
> +			    dev->setup_in || !dev->setup_out_ready) {
>  				retval =3D -ECANCELED;
>  				goto done;
>  			}

[Severity: Medium]
Does handling dev->setup_abort before checking dev->state overwrite
STATE_DEV_UNBOUND if gadgetfs_unbind() ran while ep0_read() was sleeping?

CPU0                                    CPU1
ep0_read()
  spin_unlock_irq(&dev->lock)
  wait_event_interruptible(...)
                                        gadgetfs_setup()
                                          dev->setup_abort =3D 1
                                          ...
                                        ep0_complete()
                                          dev->setup_out_ready =3D 1
                                          ep0_readable(dev)
                                        gadgetfs_unbind()
                                          dev->state =3D STATE_DEV_UNBOUND
                                          usb_ep_free_request(..., dev->req)
                                          dev->req =3D NULL
                                          gadget->ep0->driver_data =3D NULL
  spin_lock_irq(&dev->lock)
  if (dev->setup_abort)
    dev->state =3D STATE_DEV_CONNECTED  <-- clobbers STATE_DEV_UNBOUND

Because wait_event_interruptible() runs with dev->lock dropped and without
incrementing dev->udc_usage, gadgetfs_unbind() can finish tearing down
dev->req and gadget->ep0->driver_data before ep0_read() reacquires
dev->lock.  Setting dev->state =3D STATE_DEV_CONNECTED before verifying that
dev->state is still STATE_DEV_SETUP allows subsequent ep0_read() and
ep0_write() calls to pass the dev->state <=3D STATE_DEV_OPENED check and
dereference NULL ep->driver_data and dev->req in setup_req().

[ ... ]

> @@ -1267,29 +1304,41 @@ ep0_write (struct file *fd, const char __user *bu=
f, size_t len, loff_t *ptr)
> =20
>  		len =3D min_t(size_t, len, dev->setup_wLength);
>  		if (dev->setup_in) {
> -			retval =3D setup_req (dev->gadget->ep0, dev->req, len);
> +			u8	tmp[RBUF_SIZE];
> +			bool	zero =3D len < dev->setup_wLength;
> +
> +			dev->state =3D STATE_DEV_CONNECTED;
> +			spin_unlock_irq(&dev->lock);
> +			if (copy_from_user(tmp, buf, len)) {
> +				spin_lock_irq(&dev->lock);
> +				return -EFAULT;
> +			}
> +			spin_lock_irq(&dev->lock);
> +			if (dev->setup_abort) {
> +				dev->setup_abort =3D 0;
> +				return -EIDRM;
> +			}
> +			if (dev->state !=3D STATE_DEV_CONNECTED)
> +				return -ECANCELED;
> +			retval =3D setup_req(dev->gadget->ep0, dev->req, len);

[Severity: Medium]
Does setting dev->state =3D STATE_DEV_CONNECTED before dropping dev->lock
prevent ep0_write() from detecting an abort during copy_from_user()?

CPU0                                    CPU1
ep0_write()
  dev->state =3D STATE_DEV_CONNECTED
  spin_unlock_irq(&dev->lock)
  copy_from_user(tmp, buf, len)
                                        gadgetfs_setup()
                                          dev->setup_abort =3D 0
                                          if (dev->state =3D=3D STATE_DEV_S=
ETUP)
                                            dev->setup_abort =3D 1  <-- ski=
pped
                                          /* new delegated setup queued */
  spin_lock_irq(&dev->lock)
  if (dev->setup_abort)  <-- false
  if (dev->state !=3D STATE_DEV_CONNECTED)  <-- false
  setup_req(dev->gadget->ep0, dev->req, len)
  usb_ep_queue(dev->gadget->ep0, dev->req, ...)  <-- queues stale response

gadgetfs_setup() and next_event() only set dev->setup_abort =3D 1 when
dev->state =3D=3D STATE_DEV_SETUP, and gadgetfs_setup() clears
dev->setup_abort =3D 0 at entry.  Because ep0_write() has already changed
dev->state to STATE_DEV_CONNECTED before sleeping in copy_from_user(), a
new SETUP packet arriving in that window leaves dev->setup_abort =3D=3D 0 a=
nd
dev->state =3D=3D STATE_DEV_CONNECTED, so ep0_write() queues the stale IN
payload onto ep0 for the new control transfer (and leaves dev->state as
STATE_DEV_CONNECTED even if copy_from_user() fails with -EFAULT).

[ ... ]

> @@ -1781,15 +1843,21 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  		usleep_range(1000, 2000);
>  		spin_lock_irq(&dev->lock);
>  	}
> +	queued =3D dev->ep0_req_queued;
>  	spin_unlock_irq (&dev->lock);
> =20
> +	if (dev->req) {
> +		if (queued)
> +			usb_ep_dequeue(gadget->ep0, dev->req);
> +		clean_req(gadget->ep0, dev->req);
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req =3D NULL;
> +	}

[Severity: High]
Can clean_req() here call kfree() on dev->config, dev->hs_config, or
dev->dev when an in-kernel GET_DESCRIPTOR request is active during unbind?

In gadgetfs_setup(), GET_DESCRIPTOR points dev->req->buf at dev->dev,
dev->hs_config, or dev->config (which all live inside the single dev->buf
allocation freed in dev_release()), while clean_req() frees any buffer
other than dev->rbuf:

drivers/usb/gadget/legacy/inode.c:clean_req() {
    ...
	if (req->buf !=3D dev->rbuf) {
		kfree(req->buf);
		req->buf =3D dev->rbuf;
	}
    ...
}

If usb_ep_dequeue() on ep0 returns an error without invoking
dev_req_complete() (for example on UDCs whose ep0 does not support
dequeue, or when the controller is already completing the request on
another CPU) or completes asynchronously, dev->req->buf is not reset to
dev->rbuf before clean_req() runs.  clean_req() then passes dev->config
(causing a double free when dev_release() frees dev->buf) or interior
pointers dev->hs_config / dev->dev to kfree(), and usb_ep_free_request()
frees dev->req while the UDC may still complete it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-gadgetf=
s-ep0-v5-0-f16d0b648bc2@gmail.com?part=3D1
