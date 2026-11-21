Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302171;
	b=4/lm+Iv+/Zj6DCTiMkikpNgbPpJ1sFBNBxXD/IGC0SXlkFxX73aSnz5eaSxcu+qeBvup
	 iycn7sjHz0tfkRBrNXvpjezLZg3JF6uIdfNtLKcWuUAkCVEMjLDFpxLNceboygVrVd0y+
	 stH7YqOZF8yururmVLL9nxpECYL9iF646O6zErRoQRirBRvN5KR1cYJMkQrkvn6TO5r8W
	 lUal6V5F63DunW3SIqY14NQ8tgfbc3UBPFO7oa87+M9HRI1QfGsXZX/LCowTxZG53Cya4
	 5//31MEdl2z9e88C9RkrQxaQUrUABUstyEWYp4oibswpkIIaqf5g21OKzOoWaDAa7zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302171;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zTl7dim7n5pDya8NMdSHAJHDRKwJ3ZR64y5BLySiJnk=;
	b=4xd6s8b/W2bvgcmU61IVgwQ/uNNP5Hc/yzLRBIhRZ8+FEop1SdXgNLcMIgYctpvQIIag
	 ueHo21hjioRpDH+32KCCO096QId/j9XhhtqU3Oa7Aw8Jn00gkFaIVkUxDjW7iLE0JMm54
	 7xS+0tT89t486lR1OSTu88rfwCGAryMmeg72Iy7EtMgyizV5nexIR/qq8PrHElQA8FUBH
	 q550DeUavnrhSGXT6PbM5rsyCVN62Uv+zp8f+finh2PeWXM7WdBJO0mHFTpMNDGlk4bkY
	 ksJxdevV208j5L3dpmYPkXdhuznQQhZ1nFdVIdxDmpFQepOB//J9yTlSVXF2Z/YIIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7EjUIbq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD8606A320;
	Sat, 21 Nov 2026 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a7EjUIbq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81A21F000C0;
	Sat, 21 Nov 2026 23:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302170;
	bh=zTl7dim7n5pDya8NMdSHAJHDRKwJ3ZR64y5BLySiJnk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=a7EjUIbq+J9Lb5FL9xDl8uQeCd0GDV7IGmgajxQjqCNbIDq53XjFU92SK+qd+Eu98
	 dKuwtTXA5fB01lHdxI3hnnSkNXpmLU+xLXow4bGVgUfOX8ajBZRrqqwFVUgTUNv0Eb
	 VHJ/mMIh1TwFluS6q0N94oiODSfxgb4r8Df4PPu3xjLT0Apt7WrIu+VTIGAK63bTXD
	 yn3mR5Tf0qzLxPGKVlq1rg6O0Kk72FLLoXauDgvc4KPHcmsmW1D4OVYQuRZbFx7PZm
	 qIgm03f/aCSpuLvB8KNuEjwfF5XMTrWJl/4ZFFKKHElPnzfWnvOkeluAi3dtuLq3n6
	 hbp5AHFQuR9mA==
Subject: Re: [PATCH net] net: usb: cdc_ncm: don't flush the TX timer into a
 stopped queue
From: netdev-bot+sashiko@kernel.org
To: william@wkennington.com
Cc: oliver@neukum.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, Jan.Kloetzke@preh.de,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 23:02:49 +0000
Message-ID: <179530216937.3135.2477795214247865968@kernel.org>
In-Reply-To: <20261118034122.315979-1-william@wkennington.com>
References: <20261118034122.315979-1-william@wkennington.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 3 (1) · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new retry branch in cdc_ncm_txpath_bh()
  (drivers/net/usb/cdc_ncm.c:1519-1528) can re-arm the TX hrtimer with…
- [Medium] The new 'the queue will be woken again' test in
  cdc_ncm_txpath_bh() looks only at dev->txq and dev->done.
- [Medium] cdc_ncm_txpath_bh() decides between keeping the frames and
  flushing them from lockless reads of netif_queue_stopped(),…
- [Low] The new comment in cdc_ncm_txpath_bh() (cdc_ncm.c:1515-1518) says
  the retry is based on TX URBs that are in flight or 'completed but not…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but
  cdc_ncm_unbind() has a teardown race that can leave the TX hrtimer…
- [Medium] This problem wasn't introduced by this patch, but two other
  cdc_ncm paths still flush buffered TX frames with…

--

The six regression comments are below, written as an inline LKML reply to the patch. Four are about the new code. Two are marked pre-existing: an unbind/hrtimer use-after-free race (High), and two other flush paths with the same drop (Medium). Each comment is placed next to the part of the diff it refers to.

net: usb: cdc_ncm: don't flush the TX timer into a stopped queue

This commit changes cdc_ncm_txpath_bh() to re-arm the TX timer instead of
flushing buffered frames into usbnet_start_xmit() in one case: usbnet has
stopped the TX queue and TX URBs are still on dev->txq or dev->done. The
existing flush path is kept when nothing is queued, the interface is down,
or the timer is disabled.

> diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> index e92dc7f011ea7..e5d659dd74369 100644
> --- a/drivers/net/usb/cdc_ncm.c
> +++ b/drivers/net/usb/cdc_ncm.c
> @@ -1509,9 +1509,26 @@ static void cdc_ncm_txpath_bh(struct tasklet_struct *t)
>  		cdc_ncm_tx_timeout_start(ctx);
>  		spin_unlock(&ctx->mtx);

[Severity: High]
This isn't a bug introduced by this patch, but is there a teardown race
between this re-arm in the tx_timer_pending branch and cdc_ncm_unbind()?

cdc_ncm_unbind() does:

	atomic_set(&ctx->stop, 1);

	hrtimer_cancel(&ctx->tx_timer);

	tasklet_kill(&ctx->bh);
	...
	cdc_ncm_free(ctx);

cdc_ncm_tx_timeout_start() checks the flag and arms the timer, and nothing
serializes that against unbind:

	if (!(hrtimer_active(&ctx->tx_timer) || atomic_read(&ctx->stop)))
		hrtimer_start(&ctx->tx_timer,

A possible sequence:

CPU1 (tasklet, tx_timer_pending branch)
cdc_ncm_tx_timeout_start()
  reads stop == 0, timer inactive

CPU2
cdc_ncm_unbind()
  atomic_set(&ctx->stop, 1)
  hrtimer_cancel()    <- returns at once, timer is inactive
  tasklet_kill()      <- waits for CPU1

CPU1
  hrtimer_start(&ctx->tx_timer, ...)

CPU2
  cdc_ncm_free(ctx)   <- ctx freed with tx_timer still enqueued

Can cdc_ncm_tx_timer_cb() then run on freed memory? cdc_ncm_free() does
not cancel the timer again.

The new branch added by this patch can't take part in this.
usbnet_disconnect() calls unregister_netdev() before
driver_info->unbind(), and the new branch requires netif_running().

The race needs the pre-existing tx_timer_pending chain to still be running
at unbind. That is more likely with a large tx_timer_usecs.

Would taking ctx->mtx around atomic_set(&ctx->stop, 1), or cancelling the
timer again after tasklet_kill(), close this?

>  	} else if (dev->net != NULL) {
> -		ctx->tx_reason_timeout++;	/* count reason for transmitting */
>  		spin_unlock(&ctx->mtx);
>  		netif_tx_lock_bh(dev->net);
> +		spin_lock(&ctx->mtx);
> +		/* usbnet drops the whole NTB if its queue is stopped. While
> +		 * TX URBs are in flight, or completed but not yet reaped by
> +		 * usbnet_bh(), the queue will be woken again, so keep any
> +		 * buffered frames and retry a timer interval later.
> +		 */
> +		if (ctx->timer_interval &&
> +		    (ctx->tx_curr_skb || ctx->tx_rem_skb) &&
> +		    netif_running(dev->net) && netif_queue_stopped(dev->net) &&
> +		    (skb_queue_len_lockless(&dev->txq) ||
> +		     skb_queue_len_lockless(&dev->done))) {

[Severity: Low]
The comment above says the retry is based on TX URBs "completed but not
yet reaped by usbnet_bh()". However, dev->done is not TX-only. RX
completions go there too:

rx_complete()
  defer_bh(dev, skb, &dev->rxq, state)
    __skb_queue_tail(&dev->done, skb)

So a non-empty dev->done doesn't mean a TX completion is pending.

usbnet_bh() drains done quickly, so in practice this probably only adds a
few re-arms before the old flush. Should the condition, or the comment, be
changed so they agree, for example by checking only dev->txq?

[Severity: Medium]
Does this miss the runtime PM case? cdc_ncm_driver sets
.supports_autosuspend = 1. When EVENT_DEV_ASLEEP is set,
usbnet_start_xmit() does:

	usb_anchor_urb(urb, &dev->deferred);
	/* no use to process more packets */
	netif_stop_queue(net);

The URB goes on dev->deferred, not dev->txq. usbnet_suspend() has already
emptied txq and done through usbnet_terminate_urbs().

Suppose a TX burst to a suspended device fills one NTB and leaves a frame
in tx_rem_skb. The queue is then stopped with txq and done both at zero.

The cdc_ncm timer uses up its tx_timer_pending re-arms long before the USB
resume completes. At that point this condition is false, and the code
falls through to usbnet_start_xmit(NULL).

The NTB is then dropped at the stopped-queue check, which comes before the
EVENT_DEV_ASLEEP deferral:

	if (netif_queue_stopped(net)) {
		usb_autopm_put_interface_async(dev->intf);
		spin_unlock_irqrestore(&dev->txq.lock, flags);
		goto drop;
	}

usbnet_resume() later submits the deferred URBs and calls
netif_tx_wake_all_queues(), so this is also a state where the queue will
be woken.

Should !usb_anchor_empty(&dev->deferred) or
test_bit(EVENT_DEV_ASLEEP, &dev->flags) also count here? The EVENT_TX_HALT
recovery after a synchronous -EPIPE has a similar, rarer gap.

[Severity: Medium]
Can these lockless reads see txq and done both at zero while the queue is
stopped and about to be woken? If so, the code falls through and
usbnet_start_xmit() drops the NTB, which is the failure this patch is
meant to fix.

In defer_bh(), the last TX skb is unlinked from txq before it is added to
done:

	__skb_unlink(skb, list);
	...
	__skb_queue_tail(&dev->done, skb);

A reader on another CPU can see both lengths as zero in between.

In usbnet_bh(), done is drained first:

	while ((skb = skb_dequeue (&dev->done))) {

and the queue is only woken at the end:

	if (dev->txq.qlen < TX_QLEN (dev))
		netif_wake_queue(dev->net);

If every in-flight TX URB completed before the drain, the queue stays
stopped with txq and done both empty for that whole interval.

On -EPROTO, -ETIME or -EILSEQ, tx_complete() calls netif_stop_queue() and
arms dev->delay. usbnet_bh() won't wake the queue while
timer_pending(&dev->delay) is true.

Once the remaining URBs are reaped, txq and done are both zero, but the
queue stays stopped until the throttle timer fires. A cdc_ncm timer flush
in that window still drops the NTB.

Would it be more robust to make this decision under dev->txq.lock? Another
option is for usbnet to keep the NTB, rather than drop it, when the queue
is only flow-controlled.

> +			cdc_ncm_tx_timeout_start(ctx);

[Severity: Medium]
Is this re-arm bounded? The commit message says:

  Keep the existing flush path when nothing is queued to wake the device,
  the interface is down, or the timer is disabled (tx_timer_usecs = 0), so
  the timer cannot rearm indefinitely.

While the interface is up, the only exit is dev->txq or dev->done
draining.

Take a device that stops servicing bulk-OUT (it NAKs and the HCD keeps
retrying) and then sends NETWORK_CONNECTION=0:

cdc_ncm_status()
  usbnet_link_change(dev, 0, 0)
    netif_carrier_off()

After that, nothing appears to unlink the TX URBs. __handle_link_change()
only does:

	unlink_urbs(dev, &dev->rxq);

TX cleanup is left to usbnet_tx_timeout(), but dev_watchdog() only calls
ndo_tx_timeout when:

	if (netif_device_present(dev) &&
	    netif_running(dev) &&
	    netif_carrier_ok(dev)) {

usbnet_bh() also won't wake the queue while the carrier is off. So
timer_interval stays non-zero, the netdev stays running, the queue stays
stopped and txq stays non-empty.

The (ctx->tx_curr_skb || ctx->tx_rem_skb) test doesn't end this either,
because cdc_ncm_fill_tx_frame() can leave an NTB with zero datagrams in
tx_curr_skb:

	if (n == 0) {
		/* wait for more frames */
		/* push variables */
		ctx->tx_curr_skb = skb_out;
		goto exit_no_skb;

The tasklet would re-arm every timer_interval (400 us by default, 5 us at
the minimum) and take netif_tx_lock_bh() each time. That continues until
the device completes the URBs, the interface goes down, or the device is
unplugged.

Before this patch, the chain ended after at most
CDC_NCM_TIMER_PENDING_CNT + 1 firings. Even with the carrier on, the same
polling runs for up to the watchdog timeout before usbnet_tx_timeout()
unlinks txq.

Should there be a retry limit, or a netif_carrier_ok() check, here?

> +			spin_unlock(&ctx->mtx);
> +			netif_tx_unlock_bh(dev->net);
> +			return;
> +		}
> +		ctx->tx_reason_timeout++;
> +		spin_unlock(&ctx->mtx);
>  		usbnet_start_xmit(NULL, dev->net);

[Severity: Medium]
This isn't a bug introduced by this patch, but ndp_to_end_store() and
cdc_ncm_update_rxtx_max() flush the same way, with no stopped-queue check:

ndp_to_end_store()
	netif_tx_lock_bh(dev->net);
	usbnet_start_xmit(NULL, dev->net);

cdc_ncm_update_rxtx_max()
	if (netif_running(dev->net) && val > ctx->tx_max) {
		netif_tx_lock_bh(dev->net);
		usbnet_start_xmit(NULL, dev->net);

Suppose a sysfs write to ndp_to_end or tx_max, or an ethtool coalesce
change, happens while usbnet has the queue stopped. Wouldn't the flushed
NTB also be dropped at the netif_queue_stopped() check in
usbnet_start_xmit(), with tx_dropped incremented?

>  		netif_tx_unlock_bh(dev->net);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118034122.315979-1-william%40wkennington.com
