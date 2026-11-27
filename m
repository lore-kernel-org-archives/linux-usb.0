Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771289;
	b=2vNZV4v8s96/BkX0DZCqNrpD69seJQ4s8sh3iFDPutxMijbwXOSBH+j9usQbNsIBj2AN
	 naD9cu5Nx0Uf7kfVz1VExK/QmVzQahs+gb6KhU0gGl2ipxUnfBWGvKh3BWfGqXQefXc+P
	 8R0lm5Rqv4McM03GvtuhMCSnhXKSG/dTqpKt+zypJNVJm8LHrmVIhh0oKmcNCrV8OPQVF
	 vOWB76rVos9hV4/JbpUO9jGIyKaVuU39LLEnQ8N7DSeKBoyQMN8ZNfrPvy1t+cQF2JjFg
	 oqmG+YrYnI6NOj8uEaUWFrhGMwhOD5j0OZBkX75SXHq+rykLZLApFcjQIYvxL7k1Ucg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771289;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2I63z9Guzd2lcUM2WSgBjZw7u7ZuJP6JRFEl3hL5nz0=;
	b=JXTptyI1Iv8GUK1INFLhnSeS6rADwEkoyTpwkFZz9xd7EamegDxXnjCBF25h6E81ws8j
	 SIZOEV/9XBguq9BVYePVqXMBzNxB3WhKJOtZfZFXJiLyGKdvDOeEcarnZIR4YR3+C0SN/
	 c1FVD2HLZPcE32kblve+rNxjta7WSMegdvvBbBC/IIEeCAiNTpJ4Ubgp/I2YL80TMwUjc
	 FFZkFVMfY7+/85qnKz9kZHPrvq0/DlnxhlDgpRve/msSD4PtLVE2O1TJh2d4CTBeWuWoz
	 trU3dgYwOlRmzkKYOL3nQeZb6+Uj3dKW9DuaKQ3D2NQAS+QhiUSrIHnNunAWWrb6uvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVkIMKnH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97506606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVkIMKnH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A041F0089A;
	Fri, 27 Nov 2026 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771289;
	bh=2I63z9Guzd2lcUM2WSgBjZw7u7ZuJP6JRFEl3hL5nz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVkIMKnHYHVmk3ZfZWdh2ZmvvsYXAuJW3r9JcKt4B6E6uUZ/Ugg8bJJVo+Ywn6JRD
	 H6XLfvGg5rbCnuFn3+CZub9lehp+Ay/CX6WUCOJsKNG2stDTr04sFEafuVXnvxGTB8
	 E0rrhuQ+JJpSpP7nOFvC6mc9VDoTklTecNUFFPM+FS77Txj3RKu3nvOR+IsxCHqD+1
	 +00fhWCqQxFw2JVEmZP7WT8dWfB4RJfw0MuqkLyoRbyS4EI6wJD6kLEFHrn/aABgsk
	 4dF+iUea9BSiuGxRgWR4HoHq2wZEcfRp0oJq4nmFr09ZLCSMXC//TsAphfkywJyTXR
	 cd3AdXUEjctdg==
Message-ID: <sashiko-outbox-236965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usbip: vhci_hcd: time out unanswered unlink requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179577001740.23588.17598940424505809386@kylinos.cn>
References: <179577001740.23588.17598940424505809386@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:21:28 +0000
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
- [High] usbip: vhci_hcd: mod_timer() in vhci_urb_dequeue() starves
  unlink watchdog
- [High] usbip: vhci_hcd: vhci_recv_ret_submit() leaves unlink watchdog
  armed
- [Medium] usbip: vhci_hcd: timer_delete() in
  vhci_device_unlink_cleanup() races timeout
- [Medium] usbip: vhci_hcd: UAF on vdev->ud due to late
  timer_shutdown_sync() in vhci_stop()
--

commit 6905f74cb6251ec6155915442dc359b42470939a
Author: Hongyu Xie <xiehongyu1@kylinos.cn>

usbip: vhci_hcd: time out unanswered unlink requests

This commit adds a per-device watchdog timer that tears down the USB/IP
connection if any queued unlink request remains unanswered past its 5-second
deadline.

Link: https://lore.kernel.org/all/1d6db53d-07ab-46ad-adc4-d09c95b2c83f@mail=
.kernel.org/

> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 39e8faf4c18cd..2200513394451 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c

[ ... ]

> @@ -846,6 +855,67 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, str=
uct urb *urb, gfp_t mem_flag
>  	return ret;
>  }
> =20
> +/*
> + * Is any queued unlink request past its own deadline?  Each request
> + * carries the time by which the peer must have answered it, and the
> + * timer may have been re-armed by a newer request before that, so the
> + * callback decides by walking the lists rather than by the timer's own
> + * expiry.
> + */
> +static bool vhci_unlink_expired(struct vhci_device *vdev, unsigned long =
now)
> +{
> +	struct vhci_unlink *unlink;
> +
> +	list_for_each_entry(unlink, &vdev->unlink_tx, list)
> +		if (time_after_eq(now, unlink->expires))
> +			return true;
> +	list_for_each_entry(unlink, &vdev->unlink_rx, list)
> +		if (time_after_eq(now, unlink->expires))
> +			return true;
> +
> +	return false;
> +}

[Severity: High]
Can vhci_unlink_expired() trigger a spurious VDEV_EVENT_ERROR_TCP teardown
when an unlinked URB has already completed normally via RET_SUBMIT?

If the target URB completes on the peer before CMD_UNLINK takes effect,
vhci_recv_ret_submit() calls pickup_urb_and_free_priv() and gives back the
URB, satisfying the unlink caller, but leaves the vhci_unlink entry on
vdev->unlink_tx or vdev->unlink_rx and vdev->unlink_timer armed.

When paired with the in-tree usbip-host driver, stub_recv_cmd_unlink() sees
that the URB is no longer in sdev->priv_init and queues a dummy RET_UNLINK
without waking sdev->tx_waitq:

drivers/usb/usbip/stub_rx.c:stub_recv_cmd_unlink() {
	...
	stub_enqueue_ret_unlink(sdev, pdu->base.seqnum, 0);

	spin_unlock_irqrestore(&sdev->priv_lock, flags);

	return 0;
}

If no other URB completes on the device within 5 seconds to wake
stub_tx_loop(), RET_UNLINK stays queued on the server and
vhci_unlink_timeout() tears down a healthy connection even though the
unlinked URB was already given back.

> +
> +static void vhci_unlink_timeout(struct timer_list *t)
> +{
> +	struct vhci_device *vdev =3D timer_container_of(vdev, t, unlink_timer);
> +	unsigned long flags;
> +	bool expired;
> +
> +	spin_lock_irqsave(&vdev->priv_lock, flags);
> +	expired =3D vhci_unlink_expired(vdev, jiffies);
> +	spin_unlock_irqrestore(&vdev->priv_lock, flags);
> +
> +	if (!expired)
> +		return;
> +
> +	dev_info(hcd_dev(vhci_hcd_to_hcd(vdev_to_vhci_hcd(vdev))),
> +		 "peer did not reply to an unlink request within %d msecs\n",
> +		 VHCI_UNLINK_TIMEOUT_MS);
> +
> +	/*
> +	 * Reuses the teardown path taken on other peer failures, which
> +	 * gives back all URBs waiting for their unlink reply.
> +	 */
> +	usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_TCP);
> +}
> +
> +/*
> + * Stop the unlink watchdog once every queued unlink request is answered
> + * or given back.  Safe from any context: a concurrent watchdog expiry
> + * re-checks the per-request deadlines under vdev->priv_lock and becomes
> + * a no-op.
> + */
> +void vhci_stop_unlink_timer(struct vhci_device *vdev)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vdev->priv_lock, flags);
> +	if (list_empty(&vdev->unlink_tx) && list_empty(&vdev->unlink_rx))
> +		timer_delete(&vdev->unlink_timer);
> +	spin_unlock_irqrestore(&vdev->priv_lock, flags);
> +}
> +
>  /*
>   * vhci_rx gives back the urb after receiving the reply of the urb.  If =
an
>   * unlink pdu is sent or not, vhci_rx receives a normal return pdu and g=
ives
> @@ -968,6 +1038,14 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, st=
ruct urb *urb, int status)
>  		/* send cmd_unlink and try to cancel the pending URB in the
>  		 * peer */
>  		list_add_tail(&unlink->list, &vdev->unlink_tx);
> +
> +		/* if the peer does not answer this request within the
> +		 * timeout, tear the connection down
> +		 */
> +		unlink->expires =3D
> +			jiffies + msecs_to_jiffies(VHCI_UNLINK_TIMEOUT_MS);
> +		mod_timer(&vdev->unlink_timer, unlink->expires);
> +
>  		wake_up(&vdev->waitq_tx);
> =20
>  		spin_unlock(&vdev->priv_lock);

[Severity: High]
Does calling mod_timer(&vdev->unlink_timer, unlink->expires) unconditionally
on every unlink overwrite the earlier deadline of an older pending request?

If an older unlink request goes unanswered while subsequent URBs on the same
device are unlinked at intervals shorter than 5 seconds, mod_timer()
continually pushes vdev->unlink_timer out to the newest request's deadline,
starving vhci_unlink_timeout() so the caller waiting in usb_kill_urb() still
hangs forever.

In addition, if an earlier request is answered after a newer one has already
pushed the timer forward, or if vhci_unlink_timeout() fires before the
remaining requests reach their deadlines, neither vhci_unlink_timeout() nor
vhci_stop_unlink_timer() re-arms vdev->unlink_timer to the earliest
remaining unlink->expires.  Arming the timer only when it is not already
pending (or to the earliest pending deadline) and re-arming it to the next
earliest deadline when requests remain would avoid both problems.

> @@ -1029,6 +1107,8 @@ static void vhci_device_unlink_cleanup(struct vhci_=
device *vdev)
> =20
>  	/* give back URB of unanswered unlink request */
>  	vhci_cleanup_unlink_list(vdev, &vdev->unlink_rx);
> +
> +	vhci_stop_unlink_timer(vdev);
>  }

[Severity: Medium]
Can an in-flight vhci_unlink_timeout() callback race with
vhci_device_unlink_cleanup() and queue a stale VDEV_EVENT_ERROR_TCP after
connection reset has finished?

CPU0                                    CPU1
vhci_unlink_timeout()
  spin_lock_irqsave(&vdev->priv_lock)
  expired =3D vhci_unlink_expired(...)
  /* expired =3D=3D true */
  spin_unlock_irqrestore(...)
                                        event_handler()
                                          vhci_shutdown_connection()
                                            vhci_device_unlink_cleanup()
                                              vhci_cleanup_unlink_list(...)
                                              vhci_stop_unlink_timer()
                                                timer_delete(...)
                                          vhci_device_reset()
  usbip_event_add(&vdev->ud,
                  VDEV_EVENT_ERROR_TCP) <-- spurious shutdown/reset

Because vhci_stop_unlink_timer() uses timer_delete() rather than
timer_delete_sync(), it does not wait for a callback that has already dropp=
ed
vdev->priv_lock on another CPU.  Once event_handler() finishes resetting the
port, the delayed usbip_event_add() triggers a second shutdown and reset on
vdev->ud, which can tear down a new connection attached to the same port in
the meantime.  Since vhci_device_unlink_cleanup() runs in process context,
it could call timer_delete_sync(&vdev->unlink_timer).

[ ... ]

> @@ -1269,6 +1351,7 @@ static void vhci_stop(struct usb_hcd *hcd)
> =20
>  		usbip_event_add(&vdev->ud, VDEV_EVENT_REMOVED);
>  		usbip_stop_eh(&vdev->ud);
> +		timer_shutdown_sync(&vdev->unlink_timer);
>  	}
>  }

[Severity: Medium]
Can calling timer_shutdown_sync() after usbip_stop_eh() allow an in-flight
vhci_unlink_timeout() to queue usbip_work after the event handler has
already stopped, causing a use-after-free on vdev->ud?

CPU0                                    CPU1
vhci_unlink_timeout()
  usbip_event_add(..., ERROR_TCP)
    if (ud->event & USBIP_EH_BYE)
      /* false */
                                        vhci_stop()
                                          usbip_event_add(..., REMOVED)
                                          usbip_stop_eh(&vdev->ud)
                                            /* event_handler() processes
                                             * REMOVED, sets USBIP_EH_BYE,
                                             * wakes eh_waitq */
    set_event(ud, event)
    spin_lock_irqsave(&event_lock)
    list_add_tail(&ue->node, &event_list)
    queue_work(usbip_queue, &usbip_work)
    spin_unlock_irqrestore(&event_lock)
                                          timer_shutdown_sync(...)
                                        usb_put_hcd(hcd) /* frees vdev */
                                        usbip_work -> event_handler()
                                          ud->event <-- use-after-free

In usbip_event_add(), ud->event & USBIP_EH_BYE is checked locklessly before
acquiring event_lock and is not rechecked under event_lock before queueing
usbip_work.  Calling timer_shutdown_sync(&vdev->unlink_timer) before
usbip_event_add(&vdev->ud, VDEV_EVENT_REMOVED) ensures no timer callback can
race with controller removal.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179577001740.23588.=
17598940424505809386@kylinos.cn?part=3D1
