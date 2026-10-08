Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA83D30F927
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462231; cv=none; b=I2lIDqFU0nhd+zseIQoCqCBr5iIYUgadmuIoVPbNQJ4fjRWJE9EvQJK3Eyh2Y3weOyhGapGIHy315phFugwr54W28N7Ny+4KYeZgn2mXt4AEvIZeL43sgn6akcdD265wKjMeLjX5rnFJ7Nz7mGD2B/8u7EAEXvTC62NekyA4N08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462231; c=relaxed/simple;
	bh=/94MuIVErglrL3RdFi4pD399voatsGTs/CiWGdoWybs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tE7cX0YIzSz+eGZD8uJoiHriLyrHiML4GK7w2hkEJPun+d/mucHm9HzFFeDenpFwh4V9l+S13rmfszkmirXt41q8ea6e7HT1jVV2QApxFIWjMe+qnvu91BXGUQEdRg2TV9CHqb5DW16YSbi+fJU9ACvhvWkzQyK1IODVSR8uP7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTrF9got; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTrF9got"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C721F000FF;
	Thu,  8 Oct 2026 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791462230;
	bh=h+0fm98mFUz+ZAQiwv4c2hirloWNxeH3IwR5khCQvEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fTrF9gotsoSnLaISHRonX1X5zXFGSa68Wu6JLlF3RWpSEootJUIP+7ivQknJYPrVE
	 kgzk7iHW5xtKNCJIqtadvPADvHRkCxOCscwDXSFcPGwTg0VfwIG6u6VQNh9fJfV3ns
	 9zVHHtA5LHy7gWKzL+CWwwxEd4M9l1aYoIdxiMq2kUolGCihLqWJsJX3bfWWka1EpY
	 ZN8YApsS1+Tsef2LLqQx5tuqBQQfZcqc++u0peOLAi4Ne0xKAJWmqFRYGII8zsRDF+
	 Mvcv36Axgnyh0/X4kCkv76mQWDP9eKa0C8IK1lqBx0W7Bbk22Zq6IELE3c84Kogmli
	 tQV8LINU9IuPw==
Message-ID: <sashiko-outbox-164140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] xhci: dbgtty: convert rx push tasklet to BH workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kun Luo" <luokun485@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008120605.174601-1-luokun485@gmail.com>
References: <20261008120605.174601-1-luokun485@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 12:23:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: xhci-dbgtty: UAF race between teardown and event_work queuein=
g BH
- [High] USB: xhci: DbC TTY double free due to unprotected port->registered=
 check
--

commit c7660e30ebb6c7dc3548c7784608b00e579fc030
Author: Kun Luo <luokun485@gmail.com>

xhci: dbgtty: convert rx push tasklet to BH workqueue
   =20
The kernel is converting remaining tasklet users to BH workqueues so
softirq handling can go through the workqueue path. The dbc TTY rx
push path is a straightforward bottom-half: schedule from IRQ /
unthrottle, run the same work, kill on port teardown.

> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtt=
y.c
> index 3d51e8d82659d..c18215751d921 100644
> --- a/drivers/usb/host/xhci-dbgtty.c
> +++ b/drivers/usb/host/xhci-dbgtty.c

[ ... ]

> @@ -189,9 +190,9 @@ dbc_read_complete(struct xhci_dbc *dbc, struct dbc_re=
quest *req)
>  		}
>  	}
> =20
> -	/* defer moving data from req to tty buffer to a tasklet */
> +	/* defer moving data from req to tty buffer to BH workqueue */
>  	list_add_tail(&req->list_pool, &port->read_queue);
> -	tasklet_schedule(&port->push);
> +	queue_work(system_bh_wq, &port->push);

[Severity: High]
Does this code introduce a use-after-free race during teardown?

If a USB hot-unplug or unbind event occurs while the device is in the
DS_CONFIGURED state, and a bulk transfer event is actively being processed
by dbc->event_work on another CPU:

CPU0 (teardown via xhci_dbc_stop):
Calls dbc->driver->disconnect() which calls cancel_work_sync(&port->push).
After disconnect completes, it calls cancel_delayed_work_sync(&dbc->event_w=
ork).

CPU1 (concurrent event processing):
event_work calls xhci_dbc_giveback() which drops dbc->lock.
req->complete() calls dbc_read_complete().
queue_work(system_bh_wq, &port->push) is executed.

Because cancel_work_sync() on CPU0 has already finished, the BH work is que=
ued
on a device that is about to be freed. Once CPU0's teardown completes,
xhci_dbc_tty_remove() frees port and dbc. The scheduled BH work subsequently
executes dbc_rx_push(), dereferencing the freed port pointer.

>  out:
>  	spin_unlock_irqrestore(&port->port_lock, flags);
>  }

[ ... ]

> @@ -479,7 +480,7 @@ xhci_dbc_tty_init_port(struct xhci_dbc *dbc, struct d=
bc_port *port)
>  static void
>  xhci_dbc_tty_exit_port(struct dbc_port *port)
>  {
> -	tasklet_kill(&port->push);
> +	cancel_work_sync(&port->push);

[Severity: High]
Can this destruction path race with concurrent disconnect events, leading t=
o a
double free of TTY and FIFO resources?

If a concurrent sysfs disable write invokes xhci_dbc_stop(), and a physical
cable unplug event is processed by dbc->event_work calling
xhci_dbc_handle_events():

xhci_dbc_stop() reads dbc->state =3D=3D DS_CONFIGURED under dbc->lock, but =
drops
the lock without changing the state. This allows event_work to also observe
DS_CONFIGURED, handle the unplug, and return EVT_DISC.

Both threads then concurrently invoke dbc->driver->disconnect().

Since xhci_dbc_tty_unregister_device() checks and clears port->registered
locklessly before calling xhci_dbc_tty_exit_port(), both threads bypass the
check and proceed with destruction. This causes a double execution of
tty_port_destroy(), idr_remove(), and kfifo_free().

>  	tty_port_destroy(&port->port);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008120605.1746=
01-1-luokun485@gmail.com?part=3D1
