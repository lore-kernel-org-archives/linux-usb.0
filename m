Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302180;
	b=AGHGTRX/YVdAigE07dXM8ie3yGW5GiQAM0nkly3UEcn0/pcG0TYOLEHHpcupuPhghSZw
	 SWHgkm+Y+z+k2jTgunodjbN2FQPJxp/qPrDhrLf57KLQRej79i+26XyZwgXYJVhbhPAqP
	 EhCA+ps6XTHe25d26p1LiQohFkwg/D2X3iFd/8XhKuwxUvUntzu2zJKjSgIHugdko8xUX
	 u8Ud/b3oK/wrDDN4m9soWKqFuv2cpUewq//uXpCUrZNtS2hix70O6+zrFhCVP9wrdcED4
	 RcVwTLG+mn/YbknYoDCBrMoeE8SSvTEv5JKhifHcI14NxP5y9aXI4nWeJgywgCn3S4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302180;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vi6Jgwc6TTLYkbHGmqEuP1xt7X0Hvny/9CR4U2gZGgY=;
	b=xbqrS7BYB/FwprffOjm0Rk1X6PGsNUaCMMPfymUIxhx6NTecGaUhgQhNUrpy8ZJlTPWg
	 EuBGKGlDbmmu5wb5Z1d/ZV+9y19xNZBvVSCjOR/KGsw+XXakZ8oYLXRO1MfgnRctAT2W7
	 U782fhaOzaBoqXt2GCF02JaA/JH2OOaAKJtgnNUbEJJFbcuinlTd8zEdi5GKXR9ySO3VT
	 dlwiYs3UNjlx9fYtk6u44aNQQrXJUCApmGzZNjKeox1LkzTlk98r/eefb6sjjCYh1FaoP
	 fR9OeGmgSwLOLyIlfPeWhfhjVMIvizRU2Y/skFhu4wn5b5NCez6a3nwWXhJ3rGC9Rhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYLLdz9o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35DD606A33F;
	Sat, 21 Nov 2026 23:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYLLdz9o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B971F000E6;
	Sat, 21 Nov 2026 23:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302179;
	bh=vi6Jgwc6TTLYkbHGmqEuP1xt7X0Hvny/9CR4U2gZGgY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YYLLdz9osX2szQUNhd6zJ/6b9f6Tc7ycsLvdyYdL4B0Qi3bvBSsWXiBRkgCPmxXwg
	 J07ix74tCN1Co2Z3/9IMJo/0sDnF9WvagXPN6E7jJuih6J34gFzzGgZ0GlJ84RNhse
	 Fw/RJCIL6u6yz3KK+dLFBlCPz0Iy5pQTbxMawk4b+iVHWQGTjxI3af0eu524sEcde0
	 Uz4ktTRygnLZ/DRGBvPAlwvJvfYJ+PfJ+Zx+pClRkmAS8B2XZTawY6Tlk5AV3EXIrk
	 XqJZRzkDXiwKHghs9uuSRH+cVWa6PUMfvFVHpviJ5v9OWGsSEHNUaf2zMrImxdlDlC
	 0BlZ1rLQiaZhg==
Subject: Re: [PATCH v2 net-next 1/1] net: usb: rtl8150: break cycle between
 tasklet and URB
From: netdev-bot+sashiko@kernel.org
To: oneukum@suse.com
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 23:02:58 +0000
Message-ID: <179530217871.3135.15339133875090021236@kernel.org>
In-Reply-To: <20261118133550.955312-1-oneukum@suse.com>
References: <20261118133550.955312-1-oneukum@suse.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 1 (1) · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Poisoning the URBs does not break the cycle.
- [Medium] The tasklet/URB resubmission cycle from the commit message is
  still open in rtl8150_close() and rtl8150_suspend().

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  read_bulk_callback() hands dev->rx_skb to netif_rx() (line 430).
- [Medium] This problem wasn't introduced by this patch, but rx_fixup()
  has a second self-rescheduling path that never touches a URB.

--

net: usb: rtl8150: break cycle between tasklet and URB

In rtl8150_disconnect(), this patch swaps usb_kill_urb() for
usb_poison_urb() on all three URBs. The goal is to stop the rx_fixup()
tasklet from resubmitting rx_urb. It also adds a second tasklet_kill()
after poisoning, so the tasklet is stopped before the URBs and skbs are
freed.

> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e033..6d20f52d52efd 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -353,6 +353,13 @@ static void free_all_urbs(rtl8150_t * dev)
>  	usb_free_urb(dev->intr_urb);
>  }
>  
> +static void terminate_all_urbs(rtl8150_t *dev)
> +{
> +	usb_poison_urb(dev->rx_urb);
> +	usb_poison_urb(dev->tx_urb);
> +	usb_poison_urb(dev->intr_urb);
> +}
> +
>  static void unlink_all_urbs(rtl8150_t * dev)
>  {
>  	usb_kill_urb(dev->rx_urb);

[Severity: Medium]
The commit message says the tasklet/URB cycle needs to be broken. Is it
still open in rtl8150_close() and rtl8150_suspend()? Both stop rx_urb
with usb_kill_urb() only, and neither one stops the tasklet:

rtl8150_close() {
    ...
	if (!test_bit(RTL8150_UNPLUG, &dev->flags))
		disable_net_traffic(dev);
	unlink_all_urbs(dev);
    ...
}

usb_kill_urb() raises urb->reject only while the call is running. If
rx_fixup() is pending or looping when close runs, its submit fails with
-EPERM during the kill and it reschedules itself. The next run, after
usb_kill_urb() has returned, then submits rx_urb successfully:

rx_fixup() {
    ...
try_again:
	status = usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
    ...
}

The tasklet can easily be pending at close time. read_bulk_callback()
schedules it whenever the 4-entry rx_skb_pool runs dry, and it keeps
looping while GFP_ATOMIC allocation fails.

disable_net_traffic() has already turned the receiver off, so the
bulk-IN URB just stays in flight. On the next ndo_open, rtl8150_open()
refills and resubmits the URB that is still active:

	usb_fill_bulk_urb(dev->rx_urb, dev->udev, usb_rcvbulkpipe(dev->udev, 1),
		      dev->rx_skb->data, RTL8150_MTU, read_bulk_callback, dev);
	if ((res = usb_submit_urb(dev->rx_urb, GFP_KERNEL))) {

That would hit the "URB %p submitted while active" WARN_ONCE in
usb_submit_urb() and return -EBUSY. Wouldn't every later open then fail
the same way until the device is replugged or rebound?

The suspend path looks similar. A tasklet submit can follow the
usb_kill_urb() in rtl8150_suspend(), and a later resubmit of rx_urb
after resume would then fail with -EBUSY.

[ ... ]

> @@ -970,7 +977,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
>  		set_bit(RTL8150_UNPLUG, &dev->flags);
>  		tasklet_kill(&dev->tl);
>  		unregister_netdev(dev->netdev);
> -		unlink_all_urbs(dev);
> +		terminate_all_urbs(dev);
> +		tasklet_kill(&dev->tl);

[Severity: High]
Does poisoning actually break the cycle here? It makes every resubmit
fail. However, rx_fixup() reschedules itself after any submit error
other than -ENODEV, and it never checks RTL8150_UNPLUG:

rx_fixup() {
    ...
	if (test_bit(RX_URB_FAIL, &dev->flags))
		if (dev->rx_skb)
			goto try_again;
    ...
try_again:
	status = usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
	if (status == -ENODEV) {
		netif_device_detach(dev->netdev);
	} else if (status) {
		set_bit(RX_URB_FAIL, &dev->flags);
		goto tlsched;
    ...
}

On a soft unbind (rmmod, sysfs unbind, or a forced unbind from
usb_reset_device()), the device is still attached, so usb_submit_urb()
never returns -ENODEV. Instead:

- rtl8150_driver has no soft_unbind, so usb_unbind_interface() disables
  the endpoints before calling ->disconnect. Submits then fail with
  -ENOENT from usb_hcd_link_urb_to_ep().
- After terminate_all_urbs(), urb->reject stays raised for good, so
  submits fail with -EPERM.

Either way, once the tasklet runs it reschedules itself forever.

tasklet_action_common() clears TASKLET_STATE_SCHED just before it calls
the callback, and the callback sets it again. tasklet_kill() waits with
wait_on_bit_lock(SCHED) in TASK_UNINTERRUPTIBLE, so it can only win
inside that short window.

On a non-RT kernel, a waiter on the same CPU cannot preempt the softirq,
so it only ever sees SCHED set. On UP, wouldn't this be a deterministic
livelock? rtl8150_disconnect() would sit in D state holding the device
lock while ksoftirqd spins. On SMP the waiter can keep losing the race.

The loop can also start before this point. On a soft unbind with the
interface up, usb_disable_interface() flushes rx_urb with -ESHUTDOWN
while RTL8150_UNPLUG is still clear. read_bulk_callback() takes the
default case to goon, the resubmit fails with -ENOENT, and it calls
tasklet_schedule(). So the existing first tasklet_kill() already faces
this loop, and on a soft unbind the new second one always faces it.

Could rx_fixup() be stopped from rescheduling instead? For example, it
could check RTL8150_UNPLUG on entry or treat -EPERM/-ENOENT as fatal.
Another option is to disable the tasklet before killing it.

[Severity: Medium]
This isn't a bug introduced by this patch, but rx_fixup() has a second
self-rescheduling path that never touches a URB:

rx_fixup() {
    ...
	spin_lock_irq(&dev->rx_pool_lock);
	skb = pull_skb(dev);
	spin_unlock_irq(&dev->rx_pool_lock);
	if (skb == NULL)
		goto tlsched;
    ...
}

If dev_alloc_skb(RTL8150_MTU + 2) in fill_skb_pool() fails while the
pool is empty, pull_skb() returns NULL and the tasklet reschedules
itself. Poisoning in terminate_all_urbs() has no effect on this path,
and RTL8150_UNPLUG is not checked.

While GFP_ATOMIC allocations keep failing at disconnect time, can both
tasklet_kill() calls in rtl8150_disconnect() stall the same way as
described above? The stall ends once an allocation succeeds, so it only
lasts as long as the memory pressure. A check for RTL8150_UNPLUG at the
top of rx_fixup() would fix this along with the issue above.

>  		free_all_urbs(dev);
>  		free_skb_pool(dev);
>  		dev_kfree_skb(dev->rx_skb);

[Severity: High]
This is a pre-existing issue, but can dev->rx_skb be stale here?
read_bulk_callback() hands dev->rx_skb to the stack. When the pool is
empty, it leaves the old pointer in place:

read_bulk_callback() {
    ...
	netif_rx(dev->rx_skb);
    ...
	spin_lock_irqsave(&dev->rx_pool_lock, flags);
	skb = pull_skb(dev);
	spin_unlock_irqrestore(&dev->rx_pool_lock, flags);
	if (!skb)
		goto resched;

	dev->rx_skb = skb;
    ...
}

The pool has only 4 entries and only the tasklet refills it, so this
happens routinely. Nothing ever sets dev->rx_skb to NULL. The pointer
is only replaced by a later successful pull_skb() in rx_fixup().

If that replacement never happens, this dev_kfree_skb() frees an skb
that the network stack already owns. It can fail to happen in two ways:

- dev_alloc_skb() in rx_fixup() fails on the run during which
  tasklet_kill() wins.
- A completion passes the RTL8150_UNPLUG check just before set_bit().
  Its tasklet_schedule() then runs while the first tasklet_kill() holds
  TASKLET_STATE_SCHED through wait_on_bit_lock(). tasklet_schedule()
  does nothing when SCHED is already set, so the tasklet never runs.

The same stale pointer also seems to affect rtl8150_open():

	if (dev->rx_skb == NULL)
		dev->rx_skb = pull_skb(dev);

Suppose a close/open happens while the tasklet is still looping on
allocation failure. Wouldn't rx_urb then be submitted with the freed
skb's data as its DMA buffer?

Because of this, the "if (!dev->rx_skb) goto resched;" check in
read_bulk_callback() also looks like dead code.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118133550.955312-1-oneukum%40suse.com
