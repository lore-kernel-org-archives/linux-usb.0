Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046472;
	b=fqIm4eUwjnz2cme/sxiFoo7QaGtGJ1gkwqHsyoOp71mRFszpgLzoQ0Ab3V8pcqFg5Jxn
	 7gRQ+aAULKLdVsAR4bOAslapflzYEG6bU50wmtmLH6L+A2G63KSyGpP1h2Yh39k7xvI9w
	 0Yif7S3qwaO8W6HR+WMeF5qfQhlFhp+1i6U8lRdJbv/iAa3AM2xJA2a2yZ4OT3M1/3Bz7
	 9YF+pbBwxwGWy9eT64fDV9G7KUGdl9P8tYCJsEqG30dZ8S0SrEwiacLbiIcvZgYZJOi8S
	 4Hjvs1jdmLs2PwRaQMqF14FPhxS/DxDMHjhEBegUWAjh+53i2AAvjku+OXpkKBZoplg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046472;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BrFw2yXkGfTqWpG/mFBTj2/ByMYsmol4OZ9emFmZy1o=;
	b=qBd4/+9gCggL6Aeqd87AZf+1O+cJTCncU/c5jocAouTZ2UMAJ3K+ccOjPLF91FvDK3uw
	 6zMc6yPCIV33ghr1rbZE0RJ5bksF1pdBn4jdjDPaWHZZl45aUzR4TRtQfOBUmLk9+D1et
	 4C/7pHjMJSU0gJwrVrHRZ9pO1c8RcEv6hK+KmVb+0o0X3uEHAqNq1/yrS0LDCTo3hBtLh
	 T2Pfj+PxbqkoppVp+T94PPCb9dnSC8o9iWM8xVe3PFmd7HVzX9Ku0bJm4nKx2VGMSaZTt
	 UZfpuM1RX50HmSKB5bJvChJ+BfVszESD7+TpdDvW6XFuSjuieVhWpSf+PhW8NOukmfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aI2QBzYZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6484606A32C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aI2QBzYZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE051F008A1;
	Sat,  7 Nov 2026 10:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794046471;
	bh=BrFw2yXkGfTqWpG/mFBTj2/ByMYsmol4OZ9emFmZy1o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aI2QBzYZWkPhCQ4OxXFQvdqKa7R4qEvqqoIxcxXEKxz7yOUrq/qyWRsuE3OI6isx0
	 HiniMo2f9Q2JERk/AnBhZZoKcJdeQKqIkKrm67Gb4RUSQ10wyxrnDHq0xvme+zeQor
	 Lyz89cZ/dhSEOaJmJzhw/fVD6X7VWGHjTK10eQFcHRh2BBhSa8ZG6b7orRJVnis4ly
	 LFfY9UiQV7/yoPvYppqQeUQUyhhp5dqws+K14KyNRsNeW79470K9TxmN5i6gWHEiDP
	 lSioiLVxoc1Q94fyKqtoXKD598yP+RhZdwUe3anKZPIkkF4/xY61YtuiplDin+f2mD
	 7a89agPFQJpOQ==
Message-ID: <sashiko-outbox-202813@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-b4-gadgetfs-ep0-v3-1-62089dc0ec07@gmail.com>
References: <20261107-b4-gadgetfs-ep0-v3-0-62089dc0ec07@gmail.com>
 <20261107-b4-gadgetfs-ep0-v3-1-62089dc0ec07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 10:14:31 +0000
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
- [High] usb: gadget: gadgetfs: unchecked reuse of dev->req clears
  ep0_req_queued
- [High] usb: gadget: gadgetfs: race on dev->req->buf frees descriptor
  in clean_req()
--

commit 6cf737aca44046a58d9c7ba5151c4864f9f42306
Author: Jing Lin <kayano050408@gmail.com>

usb: gadget: gadgetfs: fix ep0 request lifetime on disconnect

This commit buffers delegated control OUT payloads in a separate
setup_buf array so dev->req can be reused before ep0_read() consumes the
data, and tracks whether dev->req is queued so gadgetfs_unbind() can
dequeue it before freeing.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 7f6d8460152f9..87aff568aa596 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
[ ... ]
> @@ -984,12 +987,23 @@ static inline void ep0_readable (struct dev_data *d=
ev)
>  	kill_fasync (&dev->fasync, SIGIO, POLL_IN);
>  }
> =20
> +static void dev_req_complete(struct usb_ep *ep, struct usb_request *req)
> +{
> +	struct dev_data		*dev =3D ep->driver_data;
> +	unsigned long		flags;
> +
> +	spin_lock_irqsave(&dev->lock, flags);
> +	dev->ep0_req_queued =3D false;
> +	spin_unlock_irqrestore(&dev->lock, flags);
> +}
> +
>  static void clean_req (struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct dev_data		*dev =3D ep->driver_data;
> =20
>  	if (req->buf !=3D dev->rbuf) {
> -		kfree(req->buf);
> +		if (req->buf !=3D dev->setup_buf)
> +			kfree(req->buf);
>  		req->buf =3D dev->rbuf;
>  	}
>  	req->complete =3D epio_complete;
[ ... ]
> @@ -1074,10 +1093,15 @@ ep0_read (struct file *fd, char __user *buf, size=
_t len, loff_t *ptr)
> =20
>  			if ((retval =3D setup_req (ep, req, 0)) =3D=3D 0) {
>  				++dev->udc_usage;
> +				dev->ep0_req_queued =3D true;
>  				spin_unlock_irq (&dev->lock);
>  				retval =3D usb_ep_queue (ep, req, GFP_KERNEL);
>  				spin_lock_irq (&dev->lock);
>  				--dev->udc_usage;
> +				if (retval < 0) {
> +					dev->ep0_req_queued =3D false;
> +					clean_req(ep, req);
> +				}
>  			}
>  			dev->state =3D STATE_DEV_CONNECTED;
> =20

[Severity: High]
Can reusing dev->req without checking dev->ep0_req_queued clear
dev->ep0_req_queued while dev->req is still queued on gadget->ep0?

When gadgetfs_setup() delegates a control OUT transfer with w_length > 0,
it queues dev->req on gadget->ep0, sets dev->ep0_req_queued =3D true, and
queues a GADGETFS_SETUP event.  Once userspace reads that event (entering
STATE_DEV_SETUP with dev->setup_in =3D=3D 0), a call to ep0_read() with
len =3D=3D 0 enters this branch while the OUT data stage request is still in
flight, overwrites dev->req in setup_req(), and calls usb_ep_queue().
The UDC rejects the already-queued request with -EINVAL, and the error
path sets dev->ep0_req_queued =3D false even though dev->req remains on the
endpoint queue.  The same false clearing happens in ep0_write() and
gadgetfs_setup() if a previous ep0 request is still queued when a new
transfer starts, or if a second ep0_read() / ep0_write() races while
dev->lock is dropped before dev->state is updated.

When gadgetfs_unbind() later runs, it sees dev->ep0_req_queued =3D=3D false,
skips usb_ep_dequeue(), and frees the active request, triggering the
WARN_ON(!list_empty(&req->queue)) in dummy_free_request() and a
use-after-free when dummy_udc_stop() drains the queue.

[ ... ]

> @@ -1271,6 +1300,7 @@ ep0_write (struct file *fd, const char __user *buf,=
 size_t len, loff_t *ptr)
>  			if (retval =3D=3D 0) {
>  				dev->state =3D STATE_DEV_CONNECTED;
>  				++dev->udc_usage;
> +				dev->ep0_req_queued =3D true;
>  				spin_unlock_irq (&dev->lock);
>  				if (copy_from_user (dev->req->buf, buf, len))
>  					retval =3D -EFAULT;
> @@ -1284,6 +1314,7 @@ ep0_write (struct file *fd, const char __user *buf,=
 size_t len, loff_t *ptr)
>  				spin_lock_irq(&dev->lock);
>  				--dev->udc_usage;
>  				if (retval < 0) {
> +					dev->ep0_req_queued =3D false;
>  					clean_req (dev->gadget->ep0, dev->req);
>  				} else
>  					retval =3D len;

[Severity: High]
Can a concurrent USB_REQ_GET_DESCRIPTOR setup request while dev->lock is
dropped here cause copy_from_user() to overwrite descriptor memory or
clean_req() to kfree() it?

ep0_write() sets dev->state =3D STATE_DEV_CONNECTED and drops dev->lock
before copy_from_user() and usb_ep_queue().  If a USB_REQ_GET_DESCRIPTOR
request arrives in gadgetfs_setup() during that window, it sees
dev->state !=3D STATE_DEV_SETUP and points dev->req->buf at dev->dev,
dev->config, or dev->hs_config (all inside dev->buf), and
dev_req_complete() leaves dev->req->buf pointing there:

CPU0                                  CPU1
ep0_write()
  setup_req()
    dev->req->buf =3D dev->rbuf
  dev->state =3D STATE_DEV_CONNECTED
  spin_unlock_irq(&dev->lock)
                                      gadgetfs_setup()
                                        case USB_DT_CONFIG:
                                          config_buf()
                                            dev->req->buf =3D dev->config
                                        usb_ep_queue(..., dev->req, ...)
  copy_from_user(dev->req->buf, ...)
    --> overwrites dev->config or
        returns -EFAULT
  spin_lock_irq(&dev->lock)
  clean_req()
    kfree(req->buf)                   <-- frees dev->config (dev->buf)

If copy_from_user() succeeds, up to RBUF_SIZE (256) bytes are written into
the descriptor buffer, overflowing the 18-byte dev->dev at the end of
dev->buf or corrupting dev->config.  If copy_from_user() or usb_ep_queue()
fails (here or in the new clean_req() error path in ep0_read()),
clean_req() sees req->buf is neither dev->rbuf nor dev->setup_buf and
calls kfree(req->buf), either freeing dev->buf while the gadget is still
active (leading to use-after-free and double free in dev_release()) or
passing an interior slab pointer (dev->hs_config or dev->dev) to kfree().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-b4-gadgetf=
s-ep0-v3-1-62089dc0ec07@gmail.com?part=3D1
