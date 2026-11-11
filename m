Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371428;
	b=QuVhbA2Zb7YrtW1NhMddJw3q41Mct3Uy50ZnY0OsLFS+5RWr+nAEEZ+yZ+Ll34La0rQQ
	 g5wxqxT1vXeMB/OGoEMkk9Qot6z9HO5MlMZwR4IkwTOEXnaxHW1rHLtoeBOCg3umStZ2/
	 ulYQa5MYdPfh+6YY9SK/HuqGN5MrTQ/hrO+WUa4OaLzB9fV8kBwiQJ3ERovmsxG9aVUGY
	 n2CFcanw5P+sIrdDE1SNSSIYXRFPvbFRUZ9wOSxdLcHiUjBrge+ixNSKSiGDUX7WeoAVo
	 Li9j+FtUNzSe+Ro6G+pmuc7foOfsSaEjo3+lwDr5hMeiqffEjO6is+dmuLwFd9kyI2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Si6MSlu3RUwj/HwWiWYl6GV3URXCS64ssYkt9IuSeLE=;
	b=O+YUVecEDhfFZlLQkE2KaQ+WnUiMrvVn+dK+iB0ngrREa/LEEnGUR/P0c8L7uB8RKwfD
	 txHXVJMHx+7Eil2AX+7ZZSgJDyuGMh2WtmwUOTo5zaa9EgnhtLGl/+WVz+haWR6q7dUa8
	 0u/0SOq3BmY5NWrQwPGZnrOdpHGIu00VBsL8bF2P1VjVdV8K04JXF/ALKlue1t/CAFkAj
	 MJZr5V9LyySAmzFAieM6BhUDaqE3KLzH/OMLLT++SKiPo9YmgiV8Vs+55Aw8zk3RLmXO6
	 j4eeXMo/tm5Z5JKnAHjBA8h3GzteJCWK66cCpReNzzkl2NuUCusXvJ0ELe2T7f7EHvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7+6TVRc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0BA606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7+6TVRc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC761F0089F;
	Wed, 11 Nov 2026 04:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794371428;
	bh=Si6MSlu3RUwj/HwWiWYl6GV3URXCS64ssYkt9IuSeLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q7+6TVRcLzFQFhxLCsBdztWNrd05hISylypbP2ztlI99bAGM2aqRv8oFUdU6uIiTX
	 yv46D+u5/QvZe5283o5tkGMFInlAMFhpaFT/f23YygzkWvBCZUIS+B3wUDIzVPO9Wr
	 qE8q4L5+b8ErJ9a9lts6sJzhcE+8paOtOxyEZpApNxmCIG3lAQH/aWTnOuzW3kjtJ2
	 4KkHct3L83klnCTayP/gv7wm/Oj/0opO1rFVwVTOcVDP+xEcnevXW7qHyBS2mGATT/
	 6t4LqCPGzocd8njIymHHPHHOmUu4A3zwRfMxiX7fNYVibBRH9ufW9PoSrwv0EZNsbG
	 4EZxDeKFwai0Q==
Message-ID: <sashiko-outbox-208285@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: rtl8150: fix rx tasklet use-after-free on
 disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110043016.56986-1-mhun512@gmail.com>
References: <20261110043016.56986-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:30:27 +0000
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
- [High] net: usb: rtl8150: tasklet_kill() livelock in
  rtl8150_disconnect()
--

commit 80f52c420ee74481f60c886504dda8b0ad26ab4b
Author: Myeonghun Pak <mhun512@gmail.com>

net: usb: rtl8150: fix rx tasklet use-after-free on disconnect

This commit adds a second tasklet_kill(&dev->tl) call after
unlink_all_urbs(dev) in rtl8150_disconnect() to drain any RX tasklet
scheduled by a late URB completion handler.

> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e033..98c36c3779564 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -971,6 +971,8 @@ static void rtl8150_disconnect(struct usb_interface *=
intf)
>  		tasklet_kill(&dev->tl);
>  		unregister_netdev(dev->netdev);
>  		unlink_all_urbs(dev);
> +		/* A completion may have scheduled it after the first kill. */
> +		tasklet_kill(&dev->tl);

[Severity: High]
Can this tasklet_kill(&dev->tl) livelock and hang rtl8150_disconnect() in
TASK_UNINTERRUPTIBLE when a late read_bulk_callback() schedules dev->tl?

During driver unbind, usb_unbind_interface() disables the endpoints before
calling rtl8150_disconnect(), so usb_submit_urb(dev->rx_urb, GFP_ATOMIC)
returns -ENOENT rather than -ENODEV.  Unlike read_bulk_callback(),
rx_fixup() does not check RTL8150_UNPLUG and reschedules dev->tl whenever
usb_submit_urb() fails with a non--ENODEV error:

drivers/net/usb/rtl8150.c:rx_fixup() {
	...
	status =3D usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
	if (status =3D=3D -ENODEV) {
		netif_device_detach(dev->netdev);
	} else if (status) {
		set_bit(RX_URB_FAIL, &dev->flags);
		goto tlsched;
	} else {
		clear_bit(RX_URB_FAIL, &dev->flags);
	}

	return;
tlsched:
	tasklet_schedule(&dev->tl);
}

When read_bulk_callback() schedules dev->tl before tasklet_kill() runs,
TASKLET_STATE_SCHED is already set on entry to wait_on_bit_lock().
tasklet_action_common() clears TASKLET_STATE_SCHED, wakes the waiter, and
immediately invokes rx_fixup() in softirq context, which sets
TASKLET_STATE_SCHED back to 1 before rtl8150_disconnect() can acquire the
bit:

CPU0                                  CPU1 (<softirq>)
read_bulk_callback()
  tasklet_schedule(&dev->tl)
    /* sets TASKLET_STATE_SCHED */
rtl8150_disconnect()
  tasklet_kill(&dev->tl)
    wait_on_bit_lock(...,
      TASKLET_STATE_SCHED, ...)
      /* sleeps */
                                      tasklet_action_common()
                                        tasklet_clear_sched(t)
                                          clear_bit_unlock(...)
                                          wake_up_bit(...)
                                        rx_fixup()
                                          usb_submit_urb() -> -ENOENT
                                          tasklet_schedule(&dev->tl)
                                            /* re-sets TASKLET_STATE_SCHED =
*/
      /* wakes up */
      test_and_set_bit(...) -> fails
      /* sleeps again */              <-- livelock

Checking test_bit(RTL8150_UNPLUG, &dev->flags) at the start of rx_fixup()
(as pegasus.c does) or using tasklet_disable() before killing the URBs
would prevent rx_fixup() from rescheduling itself during disconnect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110043016.5698=
6-1-mhun512@gmail.com?part=3D1
