Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011570;
	b=A+K3KDQMANnQ2cpckcgWOqLAXR5ojXmD2Gu/B5Bj8F+DKIr3iWHOri1dXL2EG35hPm3A
	 hv3ND7yLmzQx5dXxxH7H0nsUcoCTifIHVfdiw7/ifFvki1vhYRKUmmYzqO2UV92TWWgt8
	 pvEPd7tYGPClMd6l1rWdox5MKvXv5AlQ8SUROwdGtizLSeSKcJz7efzkBhXzdDSzIaBev
	 xILZzJCH5BhktLPGP+gxUDY3v5IVxZFNLgkUPcVE0XTtcy59JOeMDUI947QPRrstDh1Zo
	 E22tHXAXaLwwdHh7ePkX6G/qKtmClOPzn1OrDCT3Ji48BYvdETaEGwgmy9YT7vYT5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011570;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6tadhw+AXdrk8x69B3my0xoxqIHXU0eA3dlBDVo3nX4=;
	b=gCd6quoM7+RXMZ6QC9smGSVbkUj71e4Unk3qyRrdnNLfJwsduuBmq9RK5JjLyQl06XA+
	 moXBOfWhGaBlsaQEvgckrK8iJZl1I3kmnQkcv6Xflk8VVIQU9S/LLcgoV9yBT+h4KSe1w
	 0RQSCg2Vllwxs+kBi+U2L7GwWhaGqgivzi7Vf/FHWtgmDnHiLV80ohAKIUy5kR5ImhaW3
	 edBQ96sCpayRxEp0XDXsgkes2Iirl9fFDcYlmawUvySgyPSTlD3OSdXtThLwgqq1HXdaB
	 PrSisBvsKy/FHc/Isxz8aa85opKicNv2EElsDpOrepH7aeHYYZ93054e//35HT93yUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9CDyIH0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A960D606A32E
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9CDyIH0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0001F0089F;
	Sat,  7 Nov 2026 00:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011569;
	bh=6tadhw+AXdrk8x69B3my0xoxqIHXU0eA3dlBDVo3nX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9CDyIH0L46OkuKR/kinnTxfKure82XWwjHmtPW4xWrddpLwINQmIIN/BeyzgGMto
	 +OLzdJIHkwQp+HSv2AXYJEgj05eUBE5BE4ek3XH3b/GoEOOzISZx1LRJVIFjVDNRpe
	 Bc19m0dwR6iuMdSNkVMfEL4AxPtEMJo0DBex0aast791OUFnsKRaCW0Kqd6sKc5bAG
	 vQLwvDWMPpBXgNUR3X+LDtW5wA/3b4lNp+goEUXOATDvedYDgi7nNNBJycpa96vMZY
	 p67LT/mtTG1+opCz/dCQhB8Q0NTHJDTqP1zopCziuJTi1eRUJhVd9xIqq7p3Q46WJL
	 5ITtlu7oQUJ7Q==
Message-ID: <sashiko-outbox-202428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: gadgetfs: dequeue pending ep0 request
 before freeing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-b4-gadgetfs-ep0-v2-1-d8896e1ad517@gmail.com>
References: <20261107-b4-gadgetfs-ep0-v2-1-d8896e1ad517@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:32:48 +0000
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
- [High] usb: gadget: gadgetfs: ep0 wedged with -EBUSY when
  setup_out_ready stays set
- [Low] usb: gadget: gadgetfs: unresolvable 12-char Fixes SHA
  1da177e4c3f4
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] usb: gadget: gadgetfs: unsigned ev_next underflow in
  ep0_read() [1]
--

commit ce956a44f005ea8d17296fed54d8ab804ecf6baf
Author: Jing Lin <kayano050408@gmail.com>

> usb: gadget: gadgetfs: dequeue pending ep0 request before freeing
>
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
>
> With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
> userspace response can leave dev->req queued when it is freed. This
> triggers the warning in dummy_free_request() and a use-after-free when
> dummy_udc_stop() subsequently drains the endpoint queue.
>
> In addition, gadgetfs_setup() can reuse dev->req while a completed
> delegated control OUT transfer still has dev->setup_out_ready set waiting
> for ep0_read() to copy the payload to userspace and call clean_req(),
> which can overwrite req->buf with descriptor pointers and trigger an
> invalid kfree() in clean_req().
>
> Track dev->req from submission through completion under dev->lock and
> reject reuse in both setup_req() and gadgetfs_setup() while either
> dev->setup_out_ready or dev->ep0_req_queued is set. Reset req->buf to
> dev->rbuf in setup_req() when len fits in dev->rbuf. In gadgetfs_unbind(),
> after waiting for active UDC users to finish, dequeue a pending request
> with dev->lock dropped and clean up any unread control OUT buffer before
> freeing dev->req and clearing ep0->driver_data.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dc73e1942197af9f54ca3
> Tested-by: syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

[Severity: Low]
The 12-character prefix 1da177e4c3f4 in the Fixes: trailer is ambiguous in
the kernel git repository and cannot be resolved because it collides with
another object; using the 13-character prefix 1da177e4c3f41 ("Linux-2.6.12-=
rc2")
or Fixes: 520b72fc64de ("USB: gadgetfs: Fix crash caused by inadequate
synchronization") avoids the collision.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 7f6d8460152f9..9b74476dd8c98 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c

[ ... ]

> @@ -1073,13 +1087,20 @@ ep0_read (struct file *fd, char __user *buf, size=
_t len, loff_t *ptr)
>  			struct usb_request	*req =3D dev->req;
> =20
>  			if ((retval =3D setup_req (ep, req, 0)) =3D=3D 0) {
> +				dev->state =3D STATE_DEV_CONNECTED;
> +				dev->ep0_req_queued =3D true;
>  				++dev->udc_usage;
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
This problem wasn't introduced by this patch, but can ep0_read() underflow
dev->ev_next [1]?

Later in ep0_read(), dev->lock is dropped across copy_to_user() while
copying n queued events, and next_event() can reset dev->ev_next in the
meantime:

CPU0                                CPU1
ep0_read()
  spin_lock_irq(&dev->lock)
  n =3D dev->ev_next
  spin_unlock_irq(&dev->lock)
  copy_to_user(buf, &dev->event, len)
                                    gadgetfs_disconnect()
                                      spin_lock(&dev->lock)
                                      next_event(..., GADGETFS_DISCONNECT)
                                        dev->ev_next =3D 0
                                        event =3D &dev->event[dev->ev_next+=
+]
                                      spin_unlock(&dev->lock)
  spin_lock_irq(&dev->lock)
  if (dev->ev_next > n)
    memmove(...)
  dev->ev_next -=3D n                 <-- unsigned underflow
  spin_unlock_irq(&dev->lock)

When n >=3D 2 and a concurrent disconnect or connect resets dev->ev_next to
1 (or another reader consumes the events), subtracting n wraps the
unsigned dev->ev_next counter near UINT_MAX.  Subsequent ep0_read() and
next_event() calls can then read or write past the end of
dev->event[N_EVENT] or hit BUG_ON(dev->ev_next > N_EVENT).

[ ... ]

> @@ -1508,6 +1531,11 @@ gadgetfs_setup (struct usb_gadget *gadget, const s=
truct usb_ctrlrequest *ctrl)
>  	} else if (dev->state =3D=3D STATE_DEV_SETUP)
>  		dev->setup_abort =3D 1;
> =20
> +	if (dev->setup_out_ready || dev->ep0_req_queued) {
> +		spin_unlock(&dev->lock);
> +		return -EBUSY;
> +	}

[Severity: High]
Can this check permanently wedge ep0 with -EBUSY after a 0-length control
OUT transfer?

When userspace handles a 0-length control OUT request such as
USB_REQ_SET_CONFIGURATION, gadgetfs_setup() sets dev->setup_in =3D 0 at the
delegate label and queues a GADGETFS_SETUP event.  Userspace acknowledges
the status stage by calling ep0_read() with len =3D=3D 0, which calls
setup_req(ep, req, 0), sets dev->state =3D STATE_DEV_CONNECTED, and queues
dev->req with req->complete =3D ep0_complete.  When that 0-length request
completes, ep0_complete() sees !dev->setup_in and sets
dev->setup_out_ready =3D 1 without calling clean_req():

drivers/usb/gadget/legacy/inode.c:ep0_complete() {
	...
	if (!dev->setup_in) {
		dev->setup_out_error =3D (req->status !=3D 0);
		if (!dev->setup_out_error)
			free =3D 0;
		dev->setup_out_ready =3D 1;
		ep0_readable (dev);
	}

	/* clean up as appropriate */
	if (free && req->buf !=3D &dev->rbuf)
		clean_req (ep, req);
	...
}

Because dev->state is already STATE_DEV_CONNECTED, ep0_read() never enters
the STATE_DEV_SETUP OUT-data collection path to call clean_req(), and
because gadgetfs_setup() now rejects any new SETUP packet while
dev->setup_out_ready is set before reaching delegate:, dev->setup_out_ready
is never cleared and every subsequent control transfer on ep0 fails with
-EBUSY.

The same permanent -EBUSY wedge also happens when a delegated control OUT
transfer completes with req->status !=3D 0 (ep0_complete() sets
dev->setup_out_ready =3D 1 and ep0_read() returns -EIO without calling
clean_req()), or when a completed control OUT transfer is aborted by a new
SETUP packet (setting dev->setup_abort =3D 1 right before returning -EBUSY)
or by gadgetfs_disconnect() before ep0_read() collects the payload.

[1] https://sashiko.dev/#/bug/linux-46aadf2a-f589-49b0-82b8-c3857e4081c7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-b4-gadgetf=
s-ep0-v2-1-d8896e1ad517@gmail.com?part=3D1
