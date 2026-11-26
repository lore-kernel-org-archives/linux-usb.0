Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679816;
	b=ahuRzgG+CIe3HrYdvVWLjGnGT6KLs8Gn1NgEs9ImG4d5vNTAW3bBh7ozLFO/n3rznvi5
	 VfoWPTlH8wOX3tMPHc9Y7AIBNPPwgPl4EdaBRwiJ24PPy7NU11HVfbrOfkQoQUqauLssd
	 L10UXoRZV964x95+XX0hux+Rj9qAD6OHJUk9XzLyoE6h/s5x0AOp5pXoB/SzKQTJlQ7Gz
	 ffxjEqBifkBgyJ+yqZfD+Qnj7g0Ksw5T3DFx1F5yz6/cr2y6df1/P31PcGq/7aP0ZEn8t
	 57vFbDZoGgPwVyTBoBzOcKxnCuQdDBK7+q2OSDVgpwddbodD4ybk+5jz/aMi6s8WakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NYx0XisGINA35a2jnUvjIsXSYICI+WPZpr3rg3FSgww=;
	b=TyMpPIRVA0rEaE0wpqZ0N8v/shuqdYZt37h/csnipe6+GQqig36I6qLI3PaKs6aY09GV
	 LGrBDhBlTz/UocMV6e+OxnXK0MecOQ2geP0XhRynKmZFXZlclRgdZXtRtSxOfZzsfKcaX
	 ZRF8DsmKvz5oda4uyN2+SwgYl02dUfOFiEjV4MnQfxmRVNbo3Zay/TMbVJXlCOWDDqMXy
	 Kpevx3INQkK/2SEo/aldeEqVna+b7TbRXetu6z9JusMX68j9zAnlhcI8W0jzpupZ8K7NO
	 KK50Bc3lkdyq+jczkoyTmiCsopR9DJzI57Fnv+M29GZiY5sm1IaZiplrMH2hNssFB7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THk6i2J3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E8B606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=THk6i2J3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3264A1F000C4;
	Thu, 26 Nov 2026 07:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795679816;
	bh=NYx0XisGINA35a2jnUvjIsXSYICI+WPZpr3rg3FSgww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=THk6i2J3jUcqy+hy5V/wV7G3OEeEVuce1ykY7d26usngMVZAZkUMd9MirpfCYuttx
	 5UKvq/KGnZNFcbQ3PqzOlbAYwAVgh9gOoM5R5jeFpY/kFl/EO2D/QCZxS41oPyTLRN
	 ti6R15NFyUqsQ+LqfNYWBLVck6ymQbyft+mccY7Z5eGnYElM43/2QYneRBPzP0TvXD
	 ERV2lhicTYV9XeZfYXS+0wzH6p483Pjkft3HpZX4GiXh3ud3mu5VwDgtRfZFwYwO58
	 cPo78U/yjrxcb6QekUw7ALAOpUfVxeNKkdv8nJYad5yOLiD16nb4Kwfx3Cr+Rbj6Jg
	 k1mcXqjh7I7hQ==
Message-ID: <sashiko-outbox-234979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] usb: gadget: gadgetfs: NAK new setups until
 control-OUT data is read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-gadgetfs-ep0-v9-4-81b464c6e641@gmail.com>
References: <20261126-gadgetfs-ep0-v9-0-81b464c6e641@gmail.com>
 <20261126-gadgetfs-ep0-v9-4-81b464c6e641@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:56:55 +0000
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
- [High] usb: gadget: gadgetfs: ep0_complete() wedges ep0 on aborted
  control-OUT
- [High] usb: gadget: gadgetfs: missing state recheck after
  queue_ep0_req()
--

commit 9c4e5fec69f29dc68b826d0e75ee968e904766c3
Author: Jing Lin <kayano050408@gmail.com>

usb: gadget: gadgetfs: NAK new setups until control-OUT data is read

This commit defers incoming SETUP packets in dev->pending_setup while a
completed control-OUT data stage is waiting to be copied by ep0_read(),
and replays the pending setup once userspace finishes reading the payload.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 4915906d782c3..12ae17f45898c 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
[ ... ]
> @@ -1021,23 +1025,25 @@ static void ep0_complete(struct usb_ep *ep, struc=
t usb_request *req)
>  {
>  	struct dev_data		*dev =3D req->context;
>  	unsigned long		flags;
> -	int			free =3D 1;
> =20
>  	/* for control OUT, data must still get to userspace */
>  	spin_lock_irqsave(&dev->lock, flags);
> -	if (!dev->setup_in) {
> +	if (dev->state =3D=3D STATE_DEV_CONNECTED ||
> +	    dev->state =3D=3D STATE_DEV_SETUP) {
>  		dev->setup_out_error =3D (req->status !=3D 0);
> -		if (!dev->setup_out_error)
> -			free =3D 0;
> +		if (dev->setup_out_error) {
> +			dev->setup_out_len =3D 0;
> +			clean_req(ep, req);
> +		} else {
> +			dev->setup_out_len =3D min_t(unsigned int, req->actual,
> +						   sizeof(dev->rbuf));
> +			req->complete =3D dev_req_complete;
> +		}
>  		dev->setup_out_ready =3D 1;
>  		ep0_readable(dev);

[Severity: High]
Can ep0_complete() set dev->setup_out_ready =3D 1 for a control-OUT transfer
that was already superseded, wedging ep0?

CPU0                              CPU1
gadgetfs_setup() [setup 1, OUT]
  gadgetfs_do_setup()
    queue_ep0_req()
    next_event(GADGETFS_SETUP)
                                  gadgetfs_setup() [setup 2]
                                    gadgetfs_do_setup()
                                      ep0_discard_event(GADGETFS_SETUP)
                                      if (dev->ep0_req_queued)
                                        return -EBUSY;
ep0_complete() [setup 1]
  dev->setup_out_ready =3D 1;  <-- wedges ep0

Before checking dev->ep0_req_queued, gadgetfs_do_setup() discards the
queued GADGETFS_SETUP event and resets STATE_DEV_SETUP to
STATE_DEV_CONNECTED:

drivers/usb/gadget/legacy/inode.c:gadgetfs_do_setup() {
    ...
	ep0_discard_event(dev, GADGETFS_SETUP);

	if (dev->state =3D=3D STATE_DEV_SETUP) {
		dev->setup_abort =3D 1;
		dev->state =3D STATE_DEV_CONNECTED;
		ep0_readable(dev);
	}
    ...
	if (dev->ep0_req_queued)
		return -EBUSY;
    ...
}

When setup 1's data stage then completes with req->status =3D=3D 0,
ep0_complete() sees dev->state =3D=3D STATE_DEV_CONNECTED and sets
dev->setup_out_ready =3D 1.  Because no GADGETFS_SETUP event remains queued,
ep0_read() can never enter STATE_DEV_SETUP to consume the payload and clear
dev->setup_out_ready, so every subsequent gadgetfs_setup() call defers new
SETUP packets into dev->pending_setup forever.

The same wedge happens if a control-OUT transfer supersedes an earlier
STATE_DEV_SETUP transfer (leaving dev->setup_abort =3D 1) and ep0_read() at
scan: consumes the new GADGETFS_SETUP event: the next ep0_read() hits
ep0_check_abort(), which resets dev->state to STATE_DEV_CONNECTED and
returns -EIDRM without clearing dev->setup_out_ready or replaying
dev->pending_setup.

[ ... ]

> @@ -1725,6 +1789,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const st=
ruct usb_ctrlrequest *ctrl)
>  			dev->setup_wLength =3D w_length;
>  			dev->setup_out_ready =3D 0;
>  			dev->setup_out_error =3D 0;
> +			dev->setup_out_len =3D 0;
> =20
>  			/* read DATA stage for OUT right away */
>  			if (unlikely(!dev->setup_in && w_length)) {
> @@ -1733,7 +1798,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const st=
ruct usb_ctrlrequest *ctrl)
>  				if (value < 0)
>  					break;
> =20
> -				value =3D queue_ep0_req(dev, false);
> +				value =3D queue_ep0_req(dev, process_ctx);
>  				if (value < 0)
>  					break;
> =20
> @@ -1745,7 +1810,6 @@ gadgetfs_setup (struct usb_gadget *gadget, const st=
ruct usb_ctrlrequest *ctrl)
>  			event =3D next_event (dev, GADGETFS_SETUP);
>  			event->u.setup =3D *ctrl;
>  			ep0_readable (dev);

[Severity: High]
Does gadgetfs_do_setup() need to recheck dev->state and
dev->setup_generation after queue_ep0_req() drops and re-acquires
dev->lock?

CPU0 (ep0_read)                   CPU1
ep0_process_pending_setup()
  gadgetfs_do_setup(..., true)
    queue_ep0_req(dev, true)
      spin_unlock_irq(&dev->lock)
      usb_ep_queue()
                                  gadgetfs_disconnect()
                                    next_event(GADGETFS_DISCONNECT)
                                    dev->state =3D STATE_DEV_UNCONNECTED
                                  ep0_complete()
                                    clean_req(ep, req)
      spin_lock_irq(&dev->lock)
    next_event(GADGETFS_SETUP)  <-- stale event after disconnect

When ep0_process_pending_setup() calls gadgetfs_do_setup() with
process_ctx =3D true, queue_ep0_req() drops dev->lock and enables interrupts
around usb_ep_queue().  If gadgetfs_disconnect() and ep0_complete() run
during that window, ep0_complete() sees STATE_DEV_UNCONNECTED and does not
set dev->setup_out_ready.  gadgetfs_do_setup() then queues a stale
GADGETFS_SETUP event after GADGETFS_DISCONNECT; when ep0_read() consumes
that event, it enters STATE_DEV_SETUP and the next ep0_read() blocks
indefinitely waiting for dev->setup_out_ready.

Similarly, if queue_ep0_req() fails after a newer SETUP or disconnect has
already arrived while dev->lock was dropped, ep0_process_pending_setup()
will call usb_ep_set_halt(dev->gadget->ep0) on the new state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-gadgetfs-e=
p0-v9-0-81b464c6e641@gmail.com?part=3D4
