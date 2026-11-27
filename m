Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787808;
	b=yIFfPGLJUUSQRRlgQP0G65w859jlQOuinwVCTYxh586qHkAV/9LQcmlp4KieXF1BPx2b
	 iY0xX/UY7rDLUKwxvCIrl3nrWi/+qiiZaA8wbFQe21Sl3baNJD3sZumbZmkzQbE9SZ7im
	 jOYj6zIbUOLeU7puaWmZZRvZcDj3XZs7UOX6fyKewySFFQ+vPIOQgRMpDyquKCtIcLU5h
	 d0/7VeMLptSCQb3vNCIm8Exv/kxeIIxEVvxamgTkR68QQd+sqWKEYj8UIk5p0tRn9kf7l
	 BdkbE6IOiVwnLfwiLFMJjTkrSHkkbPq2z4eAewOqfYhGv5xps50F9GkO+PkfaeB9eKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787808;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K60IL4s35LTiidUbi1xENnyiLT/P0TF2GJqZQKSTayY=;
	b=nGwpTS+EXODelH8FqS4d+jd4ewrZHI1H5iz4lgDnWxjdsX3qNgQakMKmxcWX4uvS1/Ac
	 pfnBY5aaBp+GpXBI8t5b/8JgY+rMOfiPUA2ZK2mSiIKwqg4qAL85QIBuwmthuVTtPDIix
	 EJyYYjwKzyCPcm4GzFIM7RwlArDmb8ymhTAnoSe7JS2c3cmjfdt57DylDM+qfob8dxXTc
	 T9yFsQvUMMenw0/AQu4gz8rKkrrp+1rH+MGX/AZfwv3tf7P9EToril7XYoAVuPb7D2YgG
	 eunygsJE7QIMeE/VaBlNxeyeA6XA0xNuiNIxSkKY2sc/DTF1Ae/Zel6Ta/3ZzLNHUlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1yPYNboi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3781E606A323;
	Fri, 27 Nov 2026 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1yPYNboi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F251F000C1;
	Fri, 27 Nov 2026 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795787807;
	bh=K60IL4s35LTiidUbi1xENnyiLT/P0TF2GJqZQKSTayY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=1yPYNboi9b8CUiEPajfuzek5/mL0GmWJQ6460VUGZbH+uZXpc5V6Mxr/O082QIF7s
	 rwIgviLa2w3WH7g/RddLLZpMvWECqWcs0AbfbjAQs9NeK9UBrli7VADdjR6S7FrRDb
	 1vITsqM+KPjm44PxTpnyG3JEa1Udc9ztWBBzVU4w=
Date: Fri, 27 Nov 2026 14:57:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Oliver Neukum <oneukum@suse.com>, oliver@neukum.org,
	Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: core: Fix use-after-free in anchor wakeup
 protocol
Message-ID: <2026112752-comic-stream-65a3@gregkh>
References: <179578612505.44635.14553263875690325600@kylinos.cn>
 <179578613111.44635.6383445613775882412@kylinos.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179578613111.44635.6383445613775882412@kylinos.cn>

On Fri, Nov 27, 2026 at 09:28:51PM +0800, Hongyu Xie wrote:
> usb_wait_anchor_empty_timeout() and the anchor cleanup helpers
> promise that once they return successfully (non-zero, for
> usb_wait_anchor_empty_timeout()), no URB giveback is in flight for
> the anchor any more, so the driver may free the memory holding it
> (xpad, for example, embeds irq_out_anchor in its private structure
> and kfrees it in xpad_disconnect()).
> 
> Two windows break this promise: the waiter can observe "anchor
> list empty and suspend_wakeups == 0" while a giveback is still
> about to access anchor->wait.
> 
>  1. usb_anchor_resume_wakeups() decrements suspend_wakeups -- which
>     makes the wait condition true -- and only then calls
>     wake_up(&anchor->wait), with nothing in between serializing the
>     two.  A waiter returns, the driver frees the anchor, and the
>     late wake_up() touches the freed wait queue head.
> 
>  2. __usb_unanchor_urb() wakes waiters while holding anchor->lock,
>     but usb_wait_anchor_empty_timeout() evaluated the same condition
>     without the lock, so it could observe the emptied urb_list in
>     the middle of that critical section and return before the
>     wake_up() and the spin_unlock() had run.  Reading the two
>     condition fields locklessly could likewise observe a stale
>     suspend_wakeups value after the giveback's unanchor on weakly
>     ordered systems.
> 
> Complete the locking protocol that commit fbc299437c06 ("usb:
> core: Solve race condition in anchor cleanup functions")
> established for the kill/poison/scuttle helpers:
> usb_wait_anchor_empty_timeout() now evaluates the condition under
> anchor->lock (a self-locking wrapper around the lockless check),
> and usb_anchor_resume_wakeups() performs the suspend_wakeups
> decrement, the wakeup check and the wake_up() within a single
> anchor->lock critical section.
> 
> With the decrement and the wake_up() atomic with respect to the
> locked condition check, a waiter can only observe the condition
> true after every giveback that has incremented suspend_wakeups has
> stopped accessing the anchor: the guarantee that the wakeup is
> delayed until the completion handler has run now extends to the
> anchor memory itself.
> 
> syzbot has reported this race repeatedly since 2019, most
> recently as:
> 
> 	BUG: KASAN: slab-use-after-free in register_lock_class+0x8d1/0x980 kernel/locking/lockdep.c:1333
> 	[...]
> 	__wake_up_common_lock+0x25/0x1e0 kernel/sched/wait.c:105
> 	__usb_hcd_giveback_urb+0x3ac/0x530 drivers/usb/core/hcd.c:1653
> 
> 	Freed by task 7828:
> 	[...]
> 	kfree+0x14a/0x380 mm/slub.c:4390
> 	xpad_disconnect+0x359/0x490 drivers/input/joystick/xpad.c:2194
> 
> and:
> 
> 	BUG: KASAN: use-after-free in register_lock_class+0xe6a/0x1120 kernel/locking/lockdep.c:1336
> 	[...]
> 	__wake_up_common_lock+0xb4/0x130 kernel/sched/wait.c:136
> 	usb_anchor_resume_wakeups drivers/usb/core/urb.c:958 [inline]
> 	usb_anchor_resume_wakeups+0xbe/0xe0 drivers/usb/core/urb.c:951
> 	__usb_hcd_giveback_urb+0x2df/0x5c0 drivers/usb/core/hcd.c:1674
> 
> 	Freed by task 3889:
> 	[...]
> 	kfree+0x173/0x390 mm/slab.c:3786
> 	xpad_disconnect+0x1cb/0x530 drivers/input/joystick/xpad.c:1905
> 
> Both reports lack a reproducer; the analysis was verified
> by walking the two stacks against the code, not at runtime.  All
> in-tree callers of usb_wait_anchor_empty_timeout() (and every
> driver which frees an anchor after the anchor cleanup helpers) are
> equally affected; xpad is merely the one syzbot found.
> 
> Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up till completion is done")
> Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
> Reported-by: syzbot+7f5e98b052c766f47f68@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/r/00000000000090170a0614431f47@google.com
> Reported-by: syzbot+59d3714b44d79d02f944@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/r/00000000000038435e05e9f94cd4@google.com
> Cc: stable@vger.kernel.org
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Oliver Neukum <oliver@neukum.org>
> Cc: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
> ---
>  drivers/usb/core/urb.c | 51 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index ae0d61b5081f..bb1778d9e9db 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -139,19 +139,39 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor *anchor)
>  }
>  EXPORT_SYMBOL_GPL(usb_anchor_urb);
>  
> -static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
> +/* Callers must hold anchor->lock */
> +static int __usb_anchor_check_wakeup(struct usb_anchor *anchor)

Mark this so the tools catch it when that lock is not held.

>  {
>  	return atomic_read(&anchor->suspend_wakeups) == 0 &&
>  		list_empty(&anchor->urb_list);
>  }
>  
> +/*
> + * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It is
> + * meant for waiters which do not hold the lock: the critical section
> + * serializes with the URB giveback path, so once the check succeeds no
> + * giveback that has incremented suspend_wakeups will touch the anchor
> + * anymore and the caller may free the memory holding the anchor.
> + */
> +static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
> +{
> +	unsigned long flags;
> +	int wakeup;
> +
> +	spin_lock_irqsave(&anchor->lock, flags);
> +	wakeup = __usb_anchor_check_wakeup(anchor);
> +	spin_unlock_irqrestore(&anchor->lock, flags);

guard()?



> +
> +	return wakeup;
> +}
> +
>  /* Callers must hold anchor->lock */
>  static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
>  {
>  	urb->anchor = NULL;
>  	list_del(&urb->anchor_list);
>  	usb_put_urb(urb);
> -	if (usb_anchor_check_wakeup(anchor))
> +	if (__usb_anchor_check_wakeup(anchor))
>  		wake_up(&anchor->wait);
>  }
>  
> @@ -835,7 +855,7 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
>  			usb_put_urb(victim);
>  			spin_lock_irq(&anchor->lock);
>  		}
> -		surely_empty = usb_anchor_check_wakeup(anchor);
> +		surely_empty = __usb_anchor_check_wakeup(anchor);
>  
>  		spin_unlock_irq(&anchor->lock);
>  		cpu_relax();
> @@ -874,7 +894,7 @@ void usb_poison_anchored_urbs(struct usb_anchor *anchor)
>  			usb_put_urb(victim);
>  			spin_lock_irq(&anchor->lock);
>  		}
> -		surely_empty = usb_anchor_check_wakeup(anchor);
> +		surely_empty = __usb_anchor_check_wakeup(anchor);
>  
>  		spin_unlock_irq(&anchor->lock);
>  		cpu_relax();
> @@ -927,12 +947,23 @@ EXPORT_SYMBOL_GPL(usb_anchor_suspend_wakeups);
>   */
>  void usb_anchor_resume_wakeups(struct usb_anchor *anchor)
>  {
> +	unsigned long flags;
> +
>  	if (!anchor)
>  		return;
>  
> +	/*
> +	 * The decrement, the wakeup check and the wake_up() must happen
> +	 * under anchor->lock: usb_wait_anchor_empty_timeout() waiters
> +	 * evaluate the same condition under the lock and may free the
> +	 * anchor once they observe it true, so this function must not
> +	 * touch anchor->wait after that.
> +	 */
> +	spin_lock_irqsave(&anchor->lock, flags);

guard()?

And please reduce the llm-generated comments and changelog spam, it's
not helpful.  It can, and should, be much smaller.  Delete all of the
changelogs and write them on your own please.

thanks,

greg k-h
