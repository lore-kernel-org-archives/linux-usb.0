Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879609;
	b=paq3RoyIPi/QR/qaQAcilPfhmhTTr2/OZX/bJwdV6aDejMC75Yd4TUCCZJy59NcdfrGW
	 oZ+MXjMSG0wnMy/kuKbHq4qBoxUwj9qsHYv7Sd84A9kLHtOGLmEPyDup0HS56zXilbXc7
	 JeCkuGtBO0mx76pKkQ1nGKuHX6huVkHq4vKCOAz8VcBYXEF3i8C8/OZAncJXMBh857+xL
	 8RVKzVjcLwjYVovbpqlIziqBk29wGN5r4WQZL76/AM/eEcrSbf/XW6J4YcrRh8602u3Ib
	 nelKmAfJxJUEoK0N+wGvvqykctaZ8E692Yu8wv42iSjd16NFC9uPdQ3vj7W6Y6qca2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HxeQRAzqUAVtmjjD5cM+lfc+nv6xOYi7h4CqR5Xxty4=;
	b=U6pSxz3qIwQ8te6drMhRWZCZiHNALy2RezTPANp6/v1kGFeZUwWWVCgw1tlyyzV1PY7r
	 iAg+uZrAL5KTpBNA1T9mT8NYKNc2RFtshwkScIAISRzevmtFS3/vcyemRsm45TAXFt3OY
	 V38u/06e3WQe9FfwYBcfN9Ug5jno6RP5Jy2Oqu7xLZ/qWJCceUFRvAk45CR8Rm3ZE6zep
	 JQyyzFl2ZpyD6ZwoAIt5S1kYklEvssV267071gZ/u7gxJNZKAVP0dt4Vg/h9HIt6oQMFV
	 THkbZiMEgROL6pbKHlGdaOCY7O6WkSMD6UCAGOpHZL6IBVeg/wCWz6PjWGTY0HYrRow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z+Ennp60;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B87606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 22:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76B87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z+Ennp60
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so17971165e9.2
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 15:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792879607; x=1793484407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxeQRAzqUAVtmjjD5cM+lfc+nv6xOYi7h4CqR5Xxty4=;
        b=Z+Ennp60zU5xjSD/H6r9yrndkA9jr5apGRTkqmpoOq0yZ7TQqQlYL+U2Lmzo9xQ7sc
         0nd6KgEou+zir8J/tRqBuJQWv/BbiAy2tq6mBXySukRsiAqV8NLpTHwq4kBNFGAmcr4L
         //p0uSQYaDIdfMp7g8RqtkXBJU4Klktt9NsWi3ACZUeaRuIESS4unXuQwHvvY7wtVK9Y
         3rIZs9av2N42gHP5UntG/ZWh639NBLP434WI5If0fISDH8MhDFNaoiC8fkZrGsnG5yC3
         CkRRAMS9rZVJxzKHX/3GCvcrxvclHhBOlNCap3QMkU0LKu45KEeVucx5GbYLJvdQar2f
         l83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879607; x=1793484407;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxeQRAzqUAVtmjjD5cM+lfc+nv6xOYi7h4CqR5Xxty4=;
        b=pl26QXBFY+a5OsWgWoXfig7naQop7/ezWEoWpsRYkMYCa57YdSlTg1ddJs9waQYuWi
         PIsrqsXHNKRGQCZBCqHXuhJdhN2ZEuRJdgKrA0nK8FzRgkT9IINmv73RUIpDsmiHoOak
         BhK8VV7ik5BIc9/0Ot5S/k+rfLHpon4Vj/RQ798F7JRnHhyGVlDasW5XPV7fWADDbf77
         ZMDjWZLC/0Vv45W9MNFOgxISLysnwmf8QhwrBUVKO96LJ5bvVKzMCloAI0HDJm5KuwaX
         LnbOJsdWRLZANs/r6S7A+rhB5uBIhMLsIQp2BuOmirh3DfPWecBi5sF6YdZeltZ/qIxa
         C/WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEqr8cZIoCMM7BjjwhvYzP3EKsZnROj1JrgV6kdBONO9N6RjDewL4GsoqVKFDJyNoVu/JgAl6HeNE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5FNZRzBXj8vmcKV2UmY1bu6KDy9ZVvwjCIrkwCs3exNlaPxyc
	fBRnrj/Bksf7KPnUYYDaqxvCdMQhmArKzYve21HxcIPNjq68J2j3sUnK
X-Gm-Gg: AYBFou2IwtxLpxFGTCGOTv8fR9CYlacA6KUcv/zRmnZRLhw8EQlfYTcJ1qdJ5mfFdxB
	iAGJF3GjeqL6nKx2emqNhoKQaZzxM6/YnBK30nlDnSgnE3TWLMQY0Usx+kqDmwLFcBPSWadfXT4
	PRPavvdjr3Cl25JLppzDkvGVayZQNAeGTn12mQWhjj/iuhPWDwSHgdAimcLrjWCdNsJYaU7j6sk
	Xw3ijASVJRZILhtmrYeeJqO98YsYc/KufdbOon5FMJA464UnhUCz1NoETTOQj6vQa6/p0oeOM1X
	0NaBnurDWAsA0RyuJFs9cJb3+B76K3i6M0Lf4BZqErJyu6Nw5l1pBwxNqGEyKK5DapEfvF0WP1c
	VbLL5p6dmJVPZQpX1LlA6ONDqFOcUNcVIWs1QDI7KZL43tJsTIGWOG4mjXLD2BVGxgKxtgcaZtE
	oOupCPi2c1hrGhWElNBqerdgj5iuNz4MPfH8NOLkXEoV53rUgkFPaO8usnzwvOGa1w0UC8dD7SU
	I29EGraDTJhgamotpTGgoH4OynNYa0ZPYOxFJurUDwlR8uqLj45+PT1s+9BeKQr
X-Received: by 2002:a05:600c:83c7:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4a35aca5824mr44913385e9.21.1792879606729;
        Sat, 24 Oct 2026 15:06:46 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm217549655e9.1.2026.10.24.15.06.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 24 Oct 2026 15:06:46 -0700 (PDT)
Date: Sun, 25 Oct 2026 00:06:43 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, Tejun Heo <tj@kernel.org>, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <20261025000643.425c57ca.michal.pecio@gmail.com>
In-Reply-To: <20261024155614.2732-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
	<20261024155614.2732-1-igorpetindev@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Dupe?

https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/

On Sat, 24 Oct 2026 18:56:14 +0300, Igor Putko wrote:
> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be
> executing on another CPU after __usb_hcd_giveback_urb() drops the URB
> use_count and wakes up waiters in usb_kill_urb().
>
> Since the caller may immediately free the struct usb_hcd via
> usb_put_hcd() after usb_stop_hcd() or usb_remove_hcd()

Is usb_stop_hcd() relevant here?

I placed this in usb_remove_hcd() where other works are cancelled.
This seems good enough, because no URBs (or wakeups or dead) should
exist until usb_add_hcd() completes successfully, at which point
I suppose usb_remove_hcd() must be used, not merely usb_stop_hcd().

> the running worker accesses the embedded giveback_urb_bh structure
> in its epilogue (e.g. clearing completing_ep or clearing the running
> flag) after the memory has been freed, triggering a
> slab-use-after-free write detected by KASAN.
> 
> Ensure all giveback work has fully completed in usb_stop_hcd() by
> calling flush_work() on both high and low priority BHs before
> deallocating. Also remove the misleading comment in usb_remove_hcd()
> claiming flush_work() is unneeded, and document the queue emptiness
> in the usb_stop_hcd() kerneldoc.
> 
> Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH
> workqueue") Reported-by:
> syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com Closes:
> https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a

No such domain?

Looks like you trusted an LLM ;)

> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> v2 -> v3:
> - Remove obsolete comment in usb_remove_hcd() regarding flush_work().
> - Add comment in usb_stop_hcd() explaining why flush_work() is needed.
> - Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
> v1 -> v2:
> - Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.

But why?

Cancel costs nothing and turns potential UAF into a leak, sounds like
a win to me. I did the same thing deliberately for this exact reason.

This review bot is completely hopeless in out-of-spec and bug-vs-bug
tradeoff scenarios.

> 
>  drivers/usb/core/hcd.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 8e8a5f59b319..f403795b17ba 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2773,6 +2773,8 @@ static void usb_put_invalidate_rhdev(struct usb_hcd *hcd)
>   * usb_stop_hcd - Halt the HCD
>   * @hcd: the usb_hcd that has to be halted
>   *
> + * The two giveback queues should be entirely empty when this runs.

No disagreement,

> + *
>   * Stop the root-hub polling timer and invoke the HCD's ->stop callback.
>   */
>  static void usb_stop_hcd(struct usb_hcd *hcd)
> @@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
>  	/* In case the HCD restarted the timer, stop it again. */
>  	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
>  	timer_delete_sync(&hcd->rh_timer);
> +
> +	/*
> +	 * Even though all URBs have been given back,

but does anyone actually believe this here?

Hundreds of drivers written over three decades, often
without linux-usb review. I don't trust them at all.

Regards,
Michal

> +	 * may still be finishing up and accessing the usb_hcd structure.
> +	 */
> +	flush_work(&hcd->high_prio_bh.bh);
> +	flush_work(&hcd->low_prio_bh.bh);
>  }
>  
>  /**
> @@ -3059,16 +3068,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
>  		usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
>  	mutex_unlock(&usb_bus_idr_lock);
>  
> -	/*
> -	 * flush_work() isn't needed here because:
> -	 * - driver's disconnect() called from usb_disconnect() should
> -	 *   make sure its URBs are completed during the disconnect()
> -	 *   callback
> -	 *
> -	 * - it is too late to run complete() here since driver may have
> -	 *   been removed already now
> -	 */
> -
>  	/* Prevent any more root-hub status calls from the timer.
>  	 * The HCD might still restart the timer (if a port status change
>  	 * interrupt occurs), but usb_hcd_poll_rh_status() won't invoke
> -- 
> 2.47.3
> 
