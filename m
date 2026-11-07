Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046573;
	b=rMWxOP2TEcXSSOxN9YlpOk6tsmxE60CPsXIWlIITkoKzx6GNM9RwMlqbC/nN1/aMhwsT
	 WYUujSpImw9YBhwPym82cfV45mEubM1nMu1V/TatUWPHC8emHy/pWWpimaV143eFZThJ5
	 xPI8kaPOsAAicYEhDpOINhlEIvpXUQtkz9DKVbElAmVtHfxudjXo+or3mz4SwOG2MP5a+
	 OJEIMEf8mJslEwb3PscVx7SHGzapWIgWrTVKnHPo9NvXOIqPMqEt4sW51VBg9ONYg4P6h
	 c/vZOXLUyPwTnu9MRhR9IWkFdCi83u9ddpE0H6MhS0SWCqSmexYg+x7kbHYem53agKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046573;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aC9wSOo8uKwn8m7C5g7PhIR4LNjXjft0QF9ZGhscgMQ=;
	b=VtML2Ca5kMqVxtKLF4XCgGH4b3y6EOQwHjwZyeM6SYWRFBkTd1T5m8uzeNtgRMDzEAhR
	 Ee5AIqCwMznbgZo2qja3VrFVt6RKFqtmFNWu/j8jPVYOKlSb4dzlZS/VVih/8ZY2XaMTp
	 5iXyXD9UQvBqs7Vs7DxjD9feWXIwu2sWM+WFnGjkhcJpHDEQXoZwQck+u+Ch01looSBf+
	 XIaU9thESjNySyPSFvMbVgx4YB3gnG+zKitkX0BbF1JjlYztAz3w7IzuC99nReivl4k3w
	 5MpNs1xXVUH02veslSGNNCFTcDy4VtxhdgHPMViqYK+4qUVcFCOKLePAUev3aU4SYHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Demm9j1W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E57606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Demm9j1W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A5F1F008A1;
	Sat,  7 Nov 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794046572;
	bh=aC9wSOo8uKwn8m7C5g7PhIR4LNjXjft0QF9ZGhscgMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Demm9j1WglGS5IabakHMJA2oOK4MTmR842KjhUnmbxAc4PWIyuXpXF8P1Y8eH6b+P
	 O8kDnJvmEgLMt59y9Nsi2EFpSSobzCdIWt4GjVfNOrVzILGfbNgD9WGMzdEP3Jnznu
	 F1f7fNmFY/oehFy5untwsAczlGRwD4bZUCcwO0CLQmQmNH/U28W8AhLIrfeU3Ax+jp
	 iit2kYsSXQXyOZuzwrLLI6oRh/EOtZfaiaSkT9MIPiw+jX3w+Wk9veiHTvSY+GIcNh
	 Jj4MwemWtcthO8BTYXSX6qdnyz3kf1hj73UPMeUf9G7IplhA6mMQ7C0bo8O8wiByAb
	 nvws4ofaF0iNQ==
Message-ID: <sashiko-outbox-202814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-b4-gadgetfs-ep0-v3-2-62089dc0ec07@gmail.com>
References: <20261107-b4-gadgetfs-ep0-v3-0-62089dc0ec07@gmail.com>
 <20261107-b4-gadgetfs-ep0-v3-2-62089dc0ec07@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 10:16:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: gadget: gadgetfs: unlocked dev->event copy and event
  loss in ep0_read()
--

commit 7de7074f8592544c9b5457f297c92470cf9e3ac3
Author: Jing Lin <kayano050408@gmail.com>

usb: gadget: gadgetfs: prevent ep0 event counter underflow

This commit adds an event generation counter and clamps the subtraction on
dev->ev_next in ep0_read() to prevent an unsigned counter underflow when
the event queue changes during copy_to_user().

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 87aff568aa596..6db3b7879c94d 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
[ ... ]
> @@ -1174,7 +1175,7 @@ ep0_read (struct file *fd, char __user *buf, size_t=
 len, loff_t *ptr)
>  scan:
>  	/* return queued events right away */
>  	if (dev->ev_next !=3D 0) {
> -		unsigned		i, n;
> +		unsigned int		i, n, generation;
> =20
>  		n =3D len / sizeof (struct usb_gadgetfs_event);
>  		if (dev->ev_next < n)
> @@ -1188,6 +1189,7 @@ ep0_read (struct file *fd, char __user *buf, size_t=
 len, loff_t *ptr)
>  				break;
>  			}
>  		}
> +		generation =3D dev->ev_generation;
>  		spin_unlock_irq (&dev->lock);
>  		len =3D n * sizeof (struct usb_gadgetfs_event);
>  		if (copy_to_user (buf, &dev->event, len))
> @@ -1199,12 +1201,16 @@ ep0_read (struct file *fd, char __user *buf, size=
_t len, loff_t *ptr)
>  			 * concurrent ep0 readers may lose events.
>  			 */
>  			spin_lock_irq (&dev->lock);
> -			if (dev->ev_next > n) {
> -				memmove(&dev->event[0], &dev->event[n],
> -					sizeof (struct usb_gadgetfs_event)
> -						* (dev->ev_next - n));
> +			if (dev->ev_generation =3D=3D generation) {
> +				if (dev->ev_next > n) {
> +					memmove(&dev->event[0], &dev->event[n],
> +						sizeof(struct usb_gadgetfs_event)
> +							* (dev->ev_next - n));
> +					dev->ev_next -=3D n;
> +				} else {
> +					dev->ev_next =3D 0;
> +				}
>  			}
> -			dev->ev_next -=3D n;
>  			spin_unlock_irq (&dev->lock);
>  		}
>  		return retval;
> @@ -1252,6 +1258,7 @@ next_event (struct dev_data *dev, enum usb_gadgetfs=
_event_type type)
>  		fallthrough;
>  	case GADGETFS_CONNECT:
>  		dev->ev_next =3D 0;
> +		dev->ev_generation++;
>  		break;
>  	case GADGETFS_SETUP:		/* previous request timed out */
>  	case GADGETFS_SUSPEND:		/* same effect */

[Severity: Medium]
Can ep0_read() still drop a newly arrived GADGETFS_SETUP or
GADGETFS_SUSPEND event or race on dev->event[] during copy_to_user()?

next_event() only increments dev->ev_generation on GADGETFS_DISCONNECT and
GADGETFS_CONNECT.  For GADGETFS_SETUP and GADGETFS_SUSPEND, it deduplicates
existing events of the same type in place without bumping
dev->ev_generation:

drivers/usb/gadget/legacy/inode.c:next_event() {
	...
	case GADGETFS_SETUP:		/* previous request timed out */
	case GADGETFS_SUSPEND:		/* same effect */
		/* these events can't be repeated */
		for (i =3D 0; i !=3D dev->ev_next; i++) {
			if (dev->event [i].type !=3D type)
				continue;
			DBG(dev, "discard old event[%d] %d\n", i, type);
			dev->ev_next--;
	...
}

Because ep0_read() leaves the n events in dev->event[] until after
copy_to_user() returns, a new GADGETFS_SETUP arriving during that window
deduplicates against the old entry still at dev->event[0]:

CPU0                                  CPU1
ep0_read()
  spin_lock_irq(&dev->lock)
  /* event[0] is GADGETFS_SETUP, n =3D 1 */
  generation =3D dev->ev_generation
  spin_unlock_irq(&dev->lock)
  copy_to_user(buf, &dev->event, len)
                                      gadgetfs_setup()
                                        spin_lock(&dev->lock)
                                        next_event(dev, GADGETFS_SETUP)
                                          /* discards old event[0] */
                                          /* writes new SETUP at event[0] */
                                          /* dev->ev_next is still 1 */
                                        spin_unlock(&dev->lock)
  spin_lock_irq(&dev->lock)
  if (dev->ev_generation =3D=3D generation)
    dev->ev_next =3D 0;  <-- drops the new GADGETFS_SETUP

Dropping the new GADGETFS_SETUP event leaves ep0 control transfers wedged
when gadgetfs_setup() returns USB_GADGET_DELAYED_STATUS and leaves
dev->state out of sync with the queue.  Also, because copy_to_user() reads
directly from dev->event[] without holding dev->lock, concurrent
next_event() calls can overwrite or memmove() entries while they are being
copied to userspace, or a GADGETFS_CONNECT/DISCONNECT purge can write a new
event into dev->event[0] that gets copied by the current read and then left
queued for a duplicate delivery because dev->ev_generation changed.

Dequeuing the n events into a local buffer (N_EVENT * sizeof(struct
usb_gadgetfs_event) is 60 bytes, which fits in tmp[RBUF_SIZE]) and updating
dev->ev_next before dropping dev->lock for copy_to_user() would avoid the
underflow, the unlocked read of dev->event[], and the lost events.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-b4-gadgetf=
s-ep0-v3-1-62089dc0ec07@gmail.com?part=3D2
