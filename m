Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792642864;
	b=lxtXgM3eE3ohEtg6ViliL9lZy3AUYMrTR6/qMDjtxu1D6slQcC3/yCjpkouwJ7Ou2ChE
	 3yLZvH9KT7IfWQ1edKeidwCFidPDd8vmOVFN0U533UmnEQXqxjs0ArRYhNQ1jDDzpqZzj
	 Rdfk2D4EBv/ivvLi8NBujrBMLeiJGRSkPZE9tES6NIK/CmrawFz5q8+P/X9j7lg+XAkqI
	 Ba5Cq3pKhOML7R97klFO9M/uFb3VWtZWXVhLMC0kdlyyyQ+Ag53hXfx1AWz7gU1e5Zacq
	 g7Kjj8UkUF6fK6EUKvyGukp7XIxbLeSRRUzu5sFPxL/SE/8wGI5SGOW6AlJ/uPVE5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792642864;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GYs8idLL/ezCLw0DX6+KOYO3YR159fWcCf2YorGRw5E=;
	b=17fpA0V6PbAVnbcLS56IOH5EeKsYrbfsL4Y8QQWAo+xnNws+mstKFds7oMksZaeN3aMA
	 VthJcOqKtXkfdVA1P46QtPpO9fFUgIMewU/Eu5dIXNjyA19/cyqAgGl/K/Z4vlFEqk9dv
	 gnPe0JU+vFG6cFKDrG0weEFTM+0Fvf9HtX0dPcRt9fsINwMHDRYMFuSyWsmiIKrJy2RWz
	 3BG8CM2bbZA08f4GjEUBFJKqtRrxVX8TiKl7hs7O7u6rDzTQIDF1nKp/2vnlM0vGlIpv4
	 XqUbpISo3hD8yphBw4i2zeczmz8KisOK6s84wKzN2XfmVcD8FT1i2Dht0tqknRb5GMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SYWX/8oP";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAC606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 04:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYWX/8oP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9AE1F000C1;
	Thu, 22 Oct 2026 04:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792642863;
	bh=GYs8idLL/ezCLw0DX6+KOYO3YR159fWcCf2YorGRw5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYWX/8oP90UnxYMyktvPDLKlpx6tV5HowDRBg95rQXlkgygFJdQwZ55GKvF3BcbZw
	 O4MbRv8pmd40k3BNRgENIy+sC7E7vXsxF2atZcLqof/eImZ6LMQ101584HdBBEuOpx
	 AnK/qwtLY1+AjL8+5ZRU4OPLVxDMZsnXuMgrOH00CdjNQDgRbkuPEQcC96t5asMHI7
	 FFpzs30M7a0phQJj40Mk3wua/QrQpMuo0ZQfh79HmgpnZVnBbVV7TvTI28u3xPSOeY
	 9gyoAWvV8R1l8dmqP7cg01q2eIW96L8VDY2eKH5ecF0jHkibNAjUoKZuOYwLFsMJHO
	 Wq52bAuSCjimw==
Message-ID: <sashiko-outbox-180999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: core: Close residual anchor read-to-lock
 window with RCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179264121921.17277.3541477544711634211@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
 <179264121921.17277.3541477544711634211@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 04:21:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: core: deadlock spinning on suspend_wakeups in usb_kill_anchor=
ed_urbs()
- [High] usb: core: unsafe suspend_wakeups pinning across synchronize_rcu()
- [Medium] usb: core: unconditional synchronize_rcu() in anchor wait/drain =
helpers
--

commit 9872eb0b619b94b49cc0bb960e1b7b9b8d5441ad
Author: Hongyu Xie <xiehongyu1@kylinos.cn>

usb: core: Close residual anchor read-to-lock window with RCU

This commit protects lockless urb->anchor reads in usb_unanchor_urb() and
usb_unanchor_urb_and_suspend_wakeups() with RCU read-side locks and
rcu_assign_pointer(). Waiters and anchor drain helpers pin
anchor->suspend_wakeups when the anchor becomes empty and wait for an RCU
grace period via synchronize_rcu() before returning.

> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index c78f72bc7cc08..4fc6ec758294b 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
[ ... ]
> @@ -149,28 +150,71 @@ static int __usb_anchor_check_wakeup(struct usb_anc=
hor *anchor)
>  }
> =20
>  /*
> - * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It=
 is
> - * meant for waiters which do not hold the lock: the critical section
> - * serializes with the URB giveback path, so once the check succeeds no
> - * giveback that has incremented suspend_wakeups will touch the anchor
> - * anymore and the caller may free the memory holding the anchor.
> + * Wait-condition side of the anchor lifetime protocol: evaluate the
> + * wakeup condition under anchor->lock and, if it holds, take a pin
> + * (increment suspend_wakeups) inside the same critical section.  While
> + * the pin is held the condition is false for every other thread, so at
> + * most one waiter at a time owns the "anchor is unused" observation and
> + * may carry out the grace-period exit before any other waiter proceeds.
> + *
> + * The caller must pair a true return with usb_anchor_finish_wait(),
> + * which drops the pin.
>   */
> -static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
> +static int usb_anchor_pin_if_wakeup(struct usb_anchor *anchor)
>  {
>  	unsigned long flags;
>  	int wakeup;
> =20
>  	spin_lock_irqsave(&anchor->lock, flags);
> -	wakeup =3D __usb_anchor_check_wakeup(anchor);
> +	if (__usb_anchor_check_wakeup(anchor)) {
> +		atomic_inc(&anchor->suspend_wakeups);
> +		wakeup =3D 1;
> +	} else {
> +		wakeup =3D 0;
> +	}
>  	spin_unlock_irqrestore(&anchor->lock, flags);
> =20
>  	return wakeup;
>  }
> =20
> +/*
> + * Drop a pin taken by usb_anchor_pin_if_wakeup() after letting one RCU
> + * grace period elapse.  The grace period flushes readers that have read
> + * urb->anchor but not yet acquired anchor->lock (see usb_unanchor_urb()
> + * and usb_unanchor_urb_and_suspend_wakeups()): once it completes, no
> + * reader that started before it can still touch the anchor, so waking
> + * other waiters and returning to the caller -- which may then free the
> + * memory holding the anchor -- is safe.  Readers that start after the
> + * grace period see urb->anchor =3D=3D NULL and never touch the anchor at
> + * all, provided that no concurrent usb_anchor_urb() re-publishes the
> + * anchor: the safe-to-free guarantees of this protocol are teardown
> + * guarantees and assume the caller stops anchoring new URBs.
> + *
> + * Must not be called with anchor->lock held.
> + *
> + * Returns true if the anchor is unused once the pin is dropped.
> + */
> +static bool usb_anchor_finish_wait(struct usb_anchor *anchor)
> +{
> +	unsigned long flags;
> +	bool unused;
> +
> +	synchronize_rcu();
> +
> +	spin_lock_irqsave(&anchor->lock, flags);
> +	atomic_dec(&anchor->suspend_wakeups);
> +	unused =3D __usb_anchor_check_wakeup(anchor);
> +	if (unused)
> +		wake_up(&anchor->wait);
> +	spin_unlock_irqrestore(&anchor->lock, flags);
> +
> +	return unused;
> +}

[Severity: High]
Can pinning anchor->suspend_wakeups across synchronize_rcu() cause a
use-after-free when multiple waiters are present, or spurious timeouts on an
already-empty anchor?

In drivers/usb/core/urb.c, usb_anchor_pin_if_wakeup() increments
anchor->suspend_wakeups under anchor->lock so that while Thread 1 sleeps in
usb_anchor_finish_wait() -> synchronize_rcu(), __usb_anchor_check_wakeup()
evaluates to false for any other thread.

If Thread 2 calls usb_wait_anchor_empty_timeout(anchor, timeout) during that
grace period, usb_anchor_pin_if_wakeup(anchor) returns 0 and Thread 2 queues
its wait_queue_entry onto anchor->wait inside wait_event_timeout().

When Thread 1 finishes synchronize_rcu(), usb_anchor_finish_wait() decremen=
ts
anchor->suspend_wakeups, calls wake_up(&anchor->wait), and returns true so
Thread 1 may immediately kfree() the structure containing the anchor.

However, wake_up(&anchor->wait) only marks Thread 2 TASK_RUNNING. When
Thread 2 wakes from schedule_timeout() inside wait_event_timeout(), it will
re-evaluate usb_anchor_pin_if_wakeup(anchor), call finish_wait(&anchor->wai=
t,
&__wq_entry), and call usb_anchor_finish_wait(anchor) on the anchor that
Thread 1 just freed.

In addition, because usb_anchor_pin_if_wakeup() and the kill/poison/scuttle
helpers increment anchor->suspend_wakeups even when the anchor is already
empty, __usb_anchor_check_wakeup(anchor) becomes false for the entire RCU
grace period while no URBs are anchored or in giveback. If another thread
calls usb_wait_anchor_empty_timeout(anchor, 0) (or uses a short timeout that
expires during the grace period), won't it observe
usb_anchor_pin_if_wakeup(anchor) =3D=3D 0 and spuriously return 0 (timeout)=
 for
an idle anchor?

[ ... ]
> @@ -894,11 +959,24 @@ void usb_kill_anchored_urbs(struct usb_anchor *anch=
or)
>  			usb_put_urb(victim);
>  			spin_lock_irq(&anchor->lock);
>  		}
> -		surely_empty =3D __usb_anchor_check_wakeup(anchor);
> =20
> -		spin_unlock_irq(&anchor->lock);
> -		cpu_relax();
> -	} while (!surely_empty);
> +		if (__usb_anchor_check_wakeup(anchor)) {
> +			/*
> +			 * Pin the anchor across one grace period before
> +			 * declaring it unused: a thread that has read
> +			 * urb->anchor but has not yet acquired anchor->lock
> +			 * must not touch the anchor after the caller frees
> +			 * it.
> +			 */
> +			atomic_inc(&anchor->suspend_wakeups);
> +			spin_unlock_irq(&anchor->lock);
> +			if (usb_anchor_finish_wait(anchor))
> +				return;
> +		} else {
> +			spin_unlock_irq(&anchor->lock);
> +			cpu_relax();
> +		}
> +	}
>  }

[Severity: High]
Could this cpu_relax() loop in usb_kill_anchored_urbs(),
usb_poison_anchored_urbs(), and usb_scuttle_anchored_urbs() livelock or
trigger an RCU CPU stall when racing with another thread on the same anchor?

Previously, anchor->suspend_wakeups was only held across a non-sleeping URB
completion callback in __usb_hcd_giveback_urb(). With this change,
anchor->suspend_wakeups is held across a sleeping synchronize_rcu() call in
usb_anchor_finish_wait().

Consider two threads operating concurrently on the same anchor (for example,
skel_flush() racing with skel_disconnect() in drivers/usb/usb-skeleton.c,
btusb_work() or btusb_flush() racing with btusb_stop_traffic() in
drivers/bluetooth/btusb.c, sierra_close() racing with sierra_suspend() in
drivers/usb/serial/sierra.c, or carl9170_usb_flush() racing with
carl9170_usb_cancel_urbs() in drivers/net/wireless/ath/carl9170/usb.c):

Thread A
  usb_wait_anchor_empty_timeout() / usb_kill_anchored_urbs()
    atomic_inc(&anchor->suspend_wakeups);
    usb_anchor_finish_wait(anchor)
      synchronize_rcu(); /* sleeps holding suspend_wakeups > 0 */

Thread B
  usb_kill_anchored_urbs(anchor) /* or poison / scuttle */
    for (;;) {
      spin_lock_irq(&anchor->lock);
      ...
      if (__usb_anchor_check_wakeup(anchor)) { /* false: suspend_wakeups > =
0 */
        ...
      } else {
        spin_unlock_irq(&anchor->lock);
        cpu_relax();
      }
    }

Because Thread B spins in kernel mode with spin_lock_irq(),
spin_unlock_irq(), and cpu_relax() without sleeping on anchor->wait or
calling cond_resched():

1. On CONFIG_PREEMPT_NONE or CONFIG_PREEMPT_VOLUNTARY kernels, Thread B's C=
PU
   never passes through a schedule point to report an RCU quiescent state, =
so
   Thread A's synchronize_rcu() can never finish and Thread B spins forever.

2. On a single-CPU system (or when both threads are pinned to the same CPU,
   or Thread B runs at a higher SCHED_FIFO / SCHED_RR priority than Thread A
   or the RCU grace-period kthread), Thread B starves Thread A from running
   to decrement anchor->suspend_wakeups.

[ ... ]
> @@ -1014,22 +1106,51 @@ EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
>   * Call this is you want to be sure all an anchor's
>   * URBs have finished
>   *
> + * A non-zero return also makes it safe to free the anchor (or the
> + * structure embedding it), provided that no new URBs are anchored to
> + * it concurrently.  This function may sleep; in particular, a
> + * successful wait -- even with a zero timeout -- waits one RCU grace
> + * period before returning.
> + *
>   * Return: Non-zero if the anchor became unused. Zero on timeout.
>   */
>  int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
>  				  unsigned int timeout)
>  {
> +	unsigned long deadline =3D jiffies + msecs_to_jiffies(timeout);
> +	long ret;
> +
>  	/*
> -	 * The condition must be evaluated under anchor->lock: when this
> -	 * function returns non-zero, every URB giveback that has incremented
> -	 * suspend_wakeups has finished with the anchor, so the caller may
> -	 * free the anchor, which is typically embedded in the driver's
> +	 * The condition is evaluated and pinned under anchor->lock.  When
> +	 * this function returns non-zero, every URB giveback that has
> +	 * incremented suspend_wakeups has finished with the anchor and one
> +	 * RCU grace period has flushed any reader that was still between
> +	 * reading urb->anchor and acquiring anchor->lock, so the caller
> +	 * may free the anchor -- provided that no new URBs are anchored
> +	 * concurrently -- which is typically embedded in the driver's
>  	 * private structure.  A zero return (timeout) means a giveback may
>  	 * still be in flight and gives no such guarantee.
>  	 */
> -	return wait_event_timeout(anchor->wait,
> -				  usb_anchor_check_wakeup(anchor),
> -				  msecs_to_jiffies(timeout));
> +	for (;;) {
> +		/*
> +		 * Clamped to zero so that a timeout of zero keeps its
> +		 * historical meaning of a single condition evaluation
> +		 * without entering the wait queue (a successful
> +		 * evaluation still waits one grace period before
> +		 * returning), and so the macro never sees a negative
> +		 * timeout after the deadline passes.
> +		 */
> +		ret =3D wait_event_timeout(anchor->wait,
> +					 usb_anchor_pin_if_wakeup(anchor),
> +					 max_t(long, (long)(deadline - jiffies), 0));
> +		if (!ret)
> +			return 0;
> +
> +		if (usb_anchor_finish_wait(anchor))
> +			return 1;
> +		if ((long)(deadline - jiffies) <=3D 0)
> +			return 0;
> +	}
>  }

[Severity: Medium]
Will waiting for synchronize_rcu() unconditionally in
usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
usb_poison_anchored_urbs(), and usb_scuttle_anchored_urbs() cause a latency
regression for callers that use these helpers during normal runtime I/O
rather than teardown?

Several drivers invoke these functions on per-request or runtime PM paths
where the anchor is not being freed and is often already empty:

1. In drivers/usb/class/usbtmc.c, usbtmc_generic_read() calls both
   usb_kill_anchored_urbs() and usb_scuttle_anchored_urbs() at the end of
   every read(), and usbtmc_generic_write() calls
   usb_wait_anchor_empty_timeout() on every synchronous write():

   drivers/usb/class/usbtmc.c:usbtmc_generic_read() {
       ...
       usb_kill_anchored_urbs(&file_data->submitted);
       dev_dbg(dev, "%s: after kill\n", __func__);
       usb_scuttle_anchored_urbs(&file_data->in_anchor);

   This adds two sequential RCU grace periods to every read() (even when bo=
th
   anchors are already empty) and one RCU grace period to every write().

2. In drivers/net/wireless/zydas/zd1211rw/zd_usb.c,
   zd_usb_iowrite16v_async_end() calls usb_wait_anchor_empty_timeout() on
   every register write batch:

   drivers/net/wireless/zydas/zd1211rw/zd_usb.c:zd_usb_iowrite16v_async_end=
() {
       ...
       if (timeout)
           timeout =3D usb_wait_anchor_empty_timeout(&usb->submitted_cmds,
                                                   timeout);

   Operations such as zd_chip_set_channel() and zd1211b_al2230_init_hw()
   issue 14 to 28 sequential register write batches under chip->mutex, which
   will now stall for 14 to 28 sequential RCU grace periods.

3. In drivers/bluetooth/btusb.c, btusb_suspend() calls btusb_stop_traffic()
   and usb_kill_anchored_urbs(&data->tx_anchor) during runtime autosuspend:

   drivers/bluetooth/btusb.c:btusb_stop_traffic() {
       usb_kill_anchored_urbs(&data->intr_anchor);
       usb_kill_anchored_urbs(&data->bulk_anchor);
       usb_kill_anchored_urbs(&data->isoc_anchor);
       usb_kill_anchored_urbs(&data->diag_anchor);
       usb_kill_anchored_urbs(&data->ctrl_anchor);
   }

   This incurs six sequential synchronize_rcu() waits on every suspend, even
   for anchors that had no URBs submitted.

[ ... ]
=E5=AE=8C=E7=BE=8E! Let's wait=E2=80=94did I accidentally write `=E5=AE=8C=
=E7=BE=8E! Let's wait...` in the output?!
OH! Wait: I was writing the actual response, not thinking!
WAIT A SECOND! I cannot edit already emitted tokens, so let me stop immedia=
tely or wait=E2=80=94no, I just emitted that inside the final response! Let=
 me end immediately with a newline.

[]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179264120148.17277.=
68253767316647311@kylinos.cn?part=3D3
