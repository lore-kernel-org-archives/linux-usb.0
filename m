Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209525;
	b=z8V9+8DVKJQKzdUqw4eOMdO1fLJ4L2C7MmwPcAONB0a2Hl/PrLJfwnpcwtX/DgjCAECS
	 BLr7XyDyTzcPr9ErdnmSaixZBj8xlJA/zFToQkvNvzCVI6nwwJnSqkWbIb9EtY0VMjv7r
	 Mtfx+C/8Bzr9HecMnSCQMNyttK3XaUAOHjcIZ3bI9jwCS1YfVOfuOwLuPDikvUM28qSRs
	 BVL28iJ3ys8ucCEMJuuPko1vVaswvAC68vKm2rfA6pLZVff+RwYLiNzyESEes/Vv3m/II
	 aFhhnn1nuySDVaZT2PEMujwm19dW+g1dyVsiZlw8rUQky/KO6g+3bjOQXh0uG4OLwNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Dum3C+vg8LxmrbCTXH0i3d9x2FDCTE8m8rwmfdoY+OI=;
	b=1TVc1tm5GVGMgRXxvSXiXoe2qvdJRvGe8iqVLTF6c98p75+VURyOc8P9kPLswf7pZLpM
	 UcZjnJgueXIArK5VUqhC3rFLxvjCWSzUTIL3Sh/jNtXUmaWX37c7qBD/f8Zeclo2mtoJi
	 Q1upS+cPBs5GObYt7oDb4t6lk8S0LePXX3+lp2tSrHGOB1I+3RaofC3elHLD8UWtV2Aui
	 1io5UoVH2MQC+NlN1fctTJJHJDt+7dagJYwCFIRuSE/XZGfJKvzWD7NYa5vnqgFIYL9Oo
	 xX+NhhyARpJoWNHvbGQaWT59xVYhC9PNiNNYDh2u3NqzHoLBNavm/tJ0MR6jBrR5ukA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfkR2BiY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD6606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfkR2BiY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70861F0089F;
	Mon,  9 Nov 2026 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794209524;
	bh=Dum3C+vg8LxmrbCTXH0i3d9x2FDCTE8m8rwmfdoY+OI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DfkR2BiY1RvKLatLZI0Y6o8SYLfSgirFbiGQDnsD5EjO/1yRYvwhE5aS2WXWFz3N9
	 cWn8thM1Kqjc6OlxbXY/qRErnmubZdFubXWcH+xuX07rcRu7GsG/5Fc16ftL1INnv/
	 LfR53/7Wt8AEKFba+YH76Ck98zyW69Zv6i8dnrM5JBBVHsE9NBiFNqFEVpP/4Ko//d
	 MJBypDYntI0tgQZdYshQ9PNAG49OLx6fELp9DyfjzyHfkm4ESq9vyhV2iM3Vm9+T+t
	 NNZnQ3mLv29zr1X9qUiplW5pktmJ0CXH0A7mdxCutJduOXHIjlbdF5htQLASgwIqIu
	 qDLp5O+Vik2jw==
Message-ID: <sashiko-outbox-204544@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-1-b410e3dced89@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-1-b410e3dced89@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 07:32:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] usb: gadget: gadgetfs: unbind race with dev_req_complete() and
  ep0_complete()
- [High] usb: gadget: gadgetfs: unbounded hang in gadgetfs_unbind() when
  ep0 dequeue fails
- [Medium] usb: gadget: gadgetfs: ep0_poll() consumes setup_abort via
  ep0_check_abort()
- [Medium] usb: gadget: gadgetfs: early returns in gadgetfs_setup() skip
  setup_abort
- [Medium] usb: gadget: gadgetfs: ep0_read() wait misses state and
  generation changes
- [Medium] usb: gadget: gadgetfs: 0-length ep0_read() clobbers control
  OUT payload state
- [Medium] usb: gadget: gadgetfs: ep0_write() sets STATE_DEV_CONNECTED
  before user copy
- [Medium] usb: gadget: gadgetfs: ep0_read() overwrites
  STATE_DEV_UNBOUND on setup event
--

commit 143b1de0fb83afcb84b9c88be79a0db5944a14a3
Author: Jing Lin <kayano050408@gmail.com>

usb: gadget: gadgetfs: fix ep0 request lifetime on disconnect

This commit serializes ep0 request lifetime and buffer ownership across
control transfers, userspace ep0 reads and writes, and gadget unbind.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 7f6d8460152f9..1277982f194c2 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c

[ ... ]

> @@ -984,54 +989,82 @@ static inline void ep0_readable (struct dev_data *d=
ev)
>  	kill_fasync (&dev->fasync, SIGIO, POLL_IN);
>  }
> =20
> -static void clean_req (struct usb_ep *ep, struct usb_request *req)
> +static void dev_req_complete(struct usb_ep *ep, struct usb_request *req);
> +
> +static void clean_req(struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct dev_data		*dev =3D ep->driver_data;
> =20
> -	if (req->buf !=3D dev->rbuf) {
> -		kfree(req->buf);
> -		req->buf =3D dev->rbuf;
> -	}
> -	req->complete =3D epio_complete;
> -	dev->setup_out_ready =3D 0;
> +	/*
> +	 * req->buf may also point into dev->buf, which holds the
> +	 * descriptors; only the buffer allocated by setup_req() belongs
> +	 * to the request and may be freed here.
> +	 */
> +	kfree(dev->ep0_req_buf);
> +	dev->ep0_req_buf =3D NULL;
> +	req->buf =3D dev->rbuf;
> +	req->complete =3D dev_req_complete;
> +}
> +
> +static void dev_req_complete(struct usb_ep *ep, struct usb_request *req)
> +{
> +	struct dev_data		*dev =3D ep->driver_data;
> +	unsigned long		flags;
> +
> +	spin_lock_irqsave(&dev->lock, flags);
> +	clean_req(ep, req);
> +	dev->ep0_req_queued =3D false;
> +	spin_unlock_irqrestore(&dev->lock, flags);
> +
> +	/* gadgetfs_unbind() waits for this before freeing the request */
> +	wake_up(&dev->wait);
>  }
> =20
>  static void ep0_complete (struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct dev_data		*dev =3D ep->driver_data;
>  	unsigned long		flags;
> -	int			free =3D 1;
> =20
>  	/* for control OUT, data must still get to userspace */
>  	spin_lock_irqsave(&dev->lock, flags);
> -	if (!dev->setup_in) {
> +	if (!dev->setup_in && dev->setup_wLength) {
>  		dev->setup_out_error =3D (req->status !=3D 0);
> -		if (!dev->setup_out_error)
> -			free =3D 0;
> +		if (dev->setup_out_error) {
> +			dev->setup_out_len =3D 0;
> +		} else {
> +			dev->setup_out_len =3D min_t(unsigned int, req->actual,
> +						   sizeof(dev->setup_buf));
> +			memcpy(dev->setup_buf, req->buf, dev->setup_out_len);
> +		}
>  		dev->setup_out_ready =3D 1;
> -		ep0_readable (dev);
> +		ep0_readable(dev);
>  	}
> =20
> -	/* clean up as appropriate */
> -	if (free && req->buf !=3D &dev->rbuf)
> -		clean_req (ep, req);
> -	req->complete =3D epio_complete;
> +	clean_req(ep, req);
> +	dev->ep0_req_queued =3D false;
>  	spin_unlock_irqrestore(&dev->lock, flags);
> +
> +	/* gadgetfs_unbind() waits for this before freeing the request */
> +	wake_up(&dev->wait);
>  }
> =20
>  static int setup_req (struct usb_ep *ep, struct usb_request *req, u16 le=
n)
>  {
>  	struct dev_data	*dev =3D ep->driver_data;
> =20
> -	if (dev->setup_out_ready) {
> +	if (dev->ep0_req_queued) {
>  		DBG (dev, "ep0 request busy!\n");
>  		return -EBUSY;
>  	}

[ ... ]

> @@ -1073,13 +1123,20 @@ ep0_read (struct file *fd, char __user *buf, size=
_t len, loff_t *ptr)
>  			struct usb_request	*req =3D dev->req;
> =20
>  			if ((retval =3D setup_req (ep, req, 0)) =3D=3D 0) {
> +				dev->state =3D STATE_DEV_CONNECTED;
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
> +			} else {
> +				dev->state =3D STATE_DEV_CONNECTED;
>  			}
> -			dev->state =3D STATE_DEV_CONNECTED;

[Severity: Medium]
Can a zero-length ep0_read() during a delegated control OUT transfer queue
a bogus status-stage request and clobber dev->setup_out_len?

Previously, setup_req() rejected requests while dev->setup_out_ready was
set.  Now ep0_complete() clears dev->ep0_req_queued as soon as the OUT data
stage completes, and the len =3D=3D 0 branch in ep0_read() does not check t=
hat
dev->setup_wLength =3D=3D 0.  If userspace calls read(fd, buf, 0) after the=
 OUT
data stage finishes, setup_req() succeeds and queues a 0-length request
whose ep0_complete() callback sees !dev->setup_in && dev->setup_wLength,
overwriting dev->setup_out_len with 0 and setting dev->setup_out_ready =3D 1
after dev->state has already returned to STATE_DEV_CONNECTED.

> @@ -1102,32 +1159,43 @@ ep0_read (struct file *fd, char __user *buf, size=
_t len, loff_t *ptr)
>  			}
>  			spin_unlock_irq (&dev->lock);
>  			retval =3D wait_event_interruptible (dev->wait,
> -					dev->setup_out_ready !=3D 0);
> +					dev->setup_out_ready ||
> +					dev->setup_abort);
> =20
>  			/* FIXME state could change from under us */
>  			spin_lock_irq (&dev->lock);
>  			if (retval)
>  				goto done;
> =20
> -			if (dev->state !=3D STATE_DEV_SETUP) {
> +			if (ep0_check_abort(dev)) {
> +				retval =3D -EIDRM;
> +				goto done;
> +			}
> +			if (dev->state !=3D STATE_DEV_SETUP ||
> +			    dev->setup_in || !dev->setup_out_ready) {
>  				retval =3D -ECANCELED;
>  				goto done;
>  			}

[Severity: Medium]
Can wait_event_interruptible() in ep0_read() miss a disconnect, unbind, or
superseded control transfer?

The wait condition only checks dev->setup_out_ready || dev->setup_abort, so
if dev->state leaves STATE_DEV_SETUP without setting either flag (such as
in gadgetfs_disconnect() or gadgetfs_unbind()), ep0_read() stays blocked
instead of waking to return -ECANCELED.  In addition, ep0_read() does not
snapshot dev->setup_generation before dropping dev->lock, so if a new
delegated control OUT request is read and completes while the first reader
is asleep, the first ep0_read() can wake and consume the new transfer's
dev->setup_buf.

[ ... ]

> @@ -1267,29 +1334,45 @@ ep0_write (struct file *fd, const char __user *bu=
f, size_t len, loff_t *ptr)
> =20
>  		len =3D min_t(size_t, len, dev->setup_wLength);
>  		if (dev->setup_in) {
> -			retval =3D setup_req (dev->gadget->ep0, dev->req, len);
> +			u8	tmp[RBUF_SIZE];
> +			bool	zero =3D len < dev->setup_wLength;
> +			unsigned int generation =3D dev->setup_generation;
> +
> +			dev->state =3D STATE_DEV_CONNECTED;
> +			spin_unlock_irq(&dev->lock);
> +			if (copy_from_user(tmp, buf, len)) {
> +				spin_lock_irq(&dev->lock);
> +				return -EFAULT;
> +			}
> +			spin_lock_irq(&dev->lock);
> +			/*
> +			 * A control request that arrived while dev->lock was
> +			 * dropped supersedes this data stage; do not queue the
> +			 * stale response for it.
> +			 */
> +			if (dev->setup_generation !=3D generation)
> +				return -EIDRM;
> +			if (dev->state !=3D STATE_DEV_CONNECTED)
> +				return -ECANCELED;

[Severity: Medium]
Does setting dev->state =3D STATE_DEV_CONNECTED before copy_from_user()
leave the state machine out of STATE_DEV_SETUP if the copy faults or races
with gadgetfs_setup()?

If copy_from_user() returns -EFAULT, ep0_write() returns without restoring
dev->state to STATE_DEV_SETUP even though no response was queued.  Also, if
a new SETUP packet arrives in gadgetfs_setup() while dev->lock is dropped
for copy_from_user(), gadgetfs_setup() sees dev->state =3D=3D
STATE_DEV_CONNECTED instead of STATE_DEV_SETUP and skips setting
dev->setup_abort =3D 1.

[ ... ]

> @@ -1360,8 +1443,7 @@ ep0_poll (struct file *fd, poll_table *wait)
>  	spin_lock_irq(&dev->lock);
> =20
>  	/* report fd mode change before acting on it */
> -	if (dev->setup_abort) {
> -		dev->setup_abort =3D 0;
> +	if (ep0_check_abort(dev)) {
>  		mask =3D EPOLLHUP;
>  		goto out;
>  	}

[Severity: Medium]
Does calling ep0_check_abort() in ep0_poll() consume dev->setup_abort and
reset dev->state before ep0_read() or ep0_write() can see the abort?

ep0_check_abort() clears dev->setup_abort and transitions dev->state from
STATE_DEV_SETUP to STATE_DEV_CONNECTED.  If a process polls ep0 before
issuing read() or write(), or if a concurrent poll runs while ep0_read() is
waking from wait_event_interruptible(), ep0_poll() consumes the abort:
a waiting ep0_read() can miss dev->setup_abort and stay asleep, while a
subsequent control-data ep0_read() sees STATE_DEV_CONNECTED and falls
through into the event-reading path instead of returning -EIDRM.

> @@ -1470,6 +1552,10 @@ gadgetfs_setup (struct usb_gadget *gadget, const s=
truct usb_ctrlrequest *ctrl)
>  	u16				w_value =3D le16_to_cpu(ctrl->wValue);
>  	u16				w_length =3D le16_to_cpu(ctrl->wLength);
> =20
> +	spin_lock(&dev->lock);
> +	/* invalidate userspace copies started for an older control request */
> +	dev->setup_generation++;
> +
>  	if (w_length > RBUF_SIZE) {
>  		if (ctrl->bRequestType & USB_DIR_IN) {
>  			/* Cast away the const, we are going to overwrite on purpose. */
> @@ -1478,11 +1564,15 @@ gadgetfs_setup (struct usb_gadget *gadget, const =
struct usb_ctrlrequest *ctrl)
>  			*temp =3D cpu_to_le16(RBUF_SIZE);
>  			w_length =3D RBUF_SIZE;
>  		} else {
> +			spin_unlock(&dev->lock);
>  			return value;
>  		}
>  	}
> =20
> -	spin_lock (&dev->lock);
> +	if (dev->ep0_req_queued) {
> +		spin_unlock(&dev->lock);
> +		return -EBUSY;
> +	}
>  	dev->setup_abort =3D 0;
>  	if (dev->state =3D=3D STATE_DEV_UNCONNECTED) {
>  		if (gadget_is_dualspeed(gadget)
> @@ -1505,8 +1595,11 @@ gadgetfs_setup (struct usb_gadget *gadget, const s=
truct usb_ctrlrequest *ctrl)
>  	 * then ep0_{read,write} will report the wrong status. controller
>  	 * driver will have aborted pending i/o.
>  	 */
> -	} else if (dev->state =3D=3D STATE_DEV_SETUP)
> +	} else if (dev->state =3D=3D STATE_DEV_SETUP) {
>  		dev->setup_abort =3D 1;
> +		/* wake an ep0_read() waiting for the aborted data stage */
> +		ep0_readable(dev);
> +	}

[Severity: Medium]
If gadgetfs_setup() returns early on w_length > RBUF_SIZE or
dev->ep0_req_queued while dev->state =3D=3D STATE_DEV_SETUP, does it leave =
the
aborted transfer in STATE_DEV_SETUP without setting dev->setup_abort?

Both early returns happen after dev->setup_generation++ but before the
dev->state =3D=3D STATE_DEV_SETUP check.  An ep0_read() waiting for the pri=
or
transfer's OUT data stage is never woken, and a subsequent ep0_write()
called to answer the aborted IN transfer sees dev->setup_abort =3D=3D 0,
snapshots the already-incremented dev->setup_generation, and queues its
stale response onto ep0.

[ ... ]

> @@ -1781,15 +1883,29 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  		usleep_range(1000, 2000);
>  		spin_lock_irq(&dev->lock);
>  	}
> +	queued =3D dev->ep0_req_queued;
>  	spin_unlock_irq (&dev->lock);
> =20
> +	if (dev->req) {
> +		if (queued) {
> +			usb_ep_dequeue(gadget->ep0, dev->req);
> +			/*
> +			 * usb_ep_dequeue() may return before the completion
> +			 * routine runs.  Do not free the request until the
> +			 * controller has given it back.
> +			 */
> +			wait_event(dev->wait, !dev->ep0_req_queued);
> +		}
> +		dev->req->buf =3D dev->rbuf;
> +		clean_req(gadget->ep0, dev->req);
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req =3D NULL;
> +	}
> +
>  	destroy_ep_files (dev);
>  	gadget->ep0->driver_data =3D NULL;
>  	set_gadget_data (gadget, NULL);
> =20
> -	/* we've already been disconnected ... no i/o is active */
> -	if (dev->req)
> -		usb_ep_free_request (gadget->ep0, dev->req);
>  	DBG (dev, "%s done\n", __func__);
>  	put_dev (dev);
>  }

[Severity: High]
Can gadgetfs_unbind() race with dev_req_complete() or ep0_complete() on
dev->req and dev->wait?

CPU0                                    CPU1
dev_req_complete() / ep0_complete()     gadgetfs_unbind()
  spin_lock_irqsave(&dev->lock, flags)
  clean_req(ep, req)
  dev->ep0_req_queued =3D false
                                          wait_event(dev->wait,
                                                     !dev->ep0_req_queued)
                                          clean_req(gadget->ep0, dev->req)
                                          usb_ep_free_request(..., dev->req)
                                          ...
                                          put_dev(dev) -> kfree(dev)
  spin_unlock_irqrestore(&dev->lock, ...)
  wake_up(&dev->wait)  <-- use-after-free

wait_event() can observe !dev->ep0_req_queued and return before CPU0
releases dev->lock or calls wake_up(&dev->wait) (especially in
ep0_complete(), where ep0_readable() wakes dev->wait before clearing
dev->ep0_req_queued).  gadgetfs_unbind() then runs clean_req() and
usb_ep_free_request() without holding dev->lock while the completion
handler is still executing, and if the last reference on dev is dropped,
wake_up(&dev->wait) touches freed memory or triggers the
BUG_ON(waitqueue_active(&data->wait)) in put_dev().

[Severity: High]
Can wait_event(dev->wait, !dev->ep0_req_queued) hang forever in
gadgetfs_unbind() when usb_ep_dequeue() fails on ep0?

usb_ep_dequeue() only guarantees a completion callback when it returns 0,
and several UDC drivers (such as musb_g_ep0_dequeue(), mtu3_ep0_dequeue(),
pxa27x, pxa25x, and at91) do not support dequeuing ep0 requests and return
-EINVAL without giving back the request.  When pullup() on disconnect does
not nuke ep0 before unbind(), ignoring the usb_ep_dequeue() return value
leaves gadgetfs_unbind() sleeping in TASK_UNINTERRUPTIBLE forever.

[Severity: Medium]
Can setting dev->req =3D NULL and gadget->ep0->driver_data =3D NULL in
gadgetfs_unbind() lead to a NULL pointer dereference in setup_req() if a
GADGETFS_SETUP event was already queued?

gadgetfs_unbind() sets dev->state =3D STATE_DEV_UNBOUND but leaves queued
events in dev->event[].  If userspace calls ep0_read() after unbind, the
scan loop still transitions dev->state to STATE_DEV_SETUP when delivering a
queued GADGETFS_SETUP event:

drivers/usb/gadget/legacy/inode.c:ep0_read() {
    ...
		for (i =3D 0; i < n; i++) {
			if (dev->event [i].type =3D=3D GADGETFS_SETUP) {
				dev->state =3D STATE_DEV_SETUP;
				n =3D i + 1;
				break;
			}
		}
    ...
}

A subsequent ep0_write() or 0-length ep0_read() then sees STATE_DEV_SETUP
and calls setup_req(dev->gadget->ep0, dev->req, ...), where ep->driver_data
and dev->req are now NULL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-gadgetf=
s-ep0-v6-0-b410e3dced89@gmail.com?part=3D1
