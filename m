Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866488;
	b=CxGwDJK95uLOx9P+kqRZrSsk0xb8LNdTZrzo/08ZMrjLSwtX1wtHbuNsQ8xUd+n+vQ93
	 NabgBglQaUdjEgLe028O5QlOYmYIlO6MZVkEt0Zeo3g/KQD+LeHmsGr1Px5xnjgge1tCI
	 BZspFeLKhaQGqukkJjHE3sgUoLIWlbAxAFYBmUfEyQruDppACyDOwa5uZNsi2Vv9rhS3j
	 MMvjHc31/HcCkcmpYQj3yx5UV/vSAl3rzr484n+3iaspw4HfjcUL139Hsh9SZKv9v7j+M
	 MMlYpzQBNV3PigbKVr48f1zIBTkM4nqJKNJFYkgK/hG4HcGfZcXkHOplkRjKu88wmAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HZGm2VHNwK7IrcWUVc/yEaWLTgQRlsvvFiY8hoXSYTA=;
	b=Vir+idmeG+HcXfNkf7KGoP1FiKT8x9Kb0ffAnkveQ/BIJSvMEEMY/fl2DYX5cJdCkP/M
	 0JckcbwS0HDDUCMdzCJpJ9kGU68vImzwEllZduLsh5c0Q2gOyYjAIFslwq5GdhHIJo7U1
	 yGKlZThQHgL6Vn6qpV4tHeGsSfoRBMBQf6yaTWB6ZuwnRZpAiY3BH094ucuBzuCfj8j0r
	 mH6enovo0CXOkDmgV3f438OeB3N8BBniVDrW6I6fcplerV3O+TBL8jqo+RLfJbUCVUmIk
	 JMUUbMGyAm+VzaV9ftTh5VpCchwqkwqi7YmycqqqQKT60QFIn3aP/jlm+4luYVTQhDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=scIcMFgs;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1190B606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 18:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1190B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=scIcMFgs
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-536717a4d83so15609331cf.2
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792866487; x=1793471287; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZGm2VHNwK7IrcWUVc/yEaWLTgQRlsvvFiY8hoXSYTA=;
        b=scIcMFgsc+uJLHXtfb4EryYJUQ0LWywirVYNvgIkXvoxkzFgXwEjiUddcF0ZjeBq/i
         ZtsgduTxgNZI4HxAnjkv4FNBKHhx5a6VjAhcNurUtXAAuRDQ7mtLQaDLNWQ1T55KUvb7
         Q4bqTItwdu52r4vx7R49J2MHxtThw+DXD35/mRnSksqQkZOJyQs2rHkBpna82bX9nS03
         DMod6/5rRRHUKYzQR3/1Qx2VG6CEAI7wouJX7OvnA5c1M3ptLhrbr7fnMr881IO5tWG2
         9k5z2i6lPJD3qFpLjvn75ZDUpOyM5TQs4D8oM5mmg61cEsoXicjzH/r6CQP/9ITapnQm
         KNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792866487; x=1793471287;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZGm2VHNwK7IrcWUVc/yEaWLTgQRlsvvFiY8hoXSYTA=;
        b=XXqgHx0MUscjlzCNNwMzdRvfE5h9Z+jOCEcHa0dqE+TgdZ68w9Qhxcs+OPNg3ABVR3
         /olB9NG+VwecgDdlr0U3lyDDFDBuAq9ax2n9p8zG6oQY0p9wUY00nCqJ3LQSG5LL49L3
         0s+E4NkthQ/JLtRiFPLlNGgViFXnGbtpWRKsjlfTjLz96UMKGk5mQboT+KunhFTxAd+m
         TG7WL4haA/Ecx6xg7sBDmbudZr+UCzFZVjqPkKt1hOGHeDe5nN2YDsxMjkNLCCDrYZNn
         IazkKyZsQp1KNgyTOXVLPJN9fnLZlEzl9usfLUZZY0jxfdmFVts8cNwYwtUQzSkNm7nP
         RvTg==
X-Forwarded-Encrypted: i=1; AKwUvBxkx2eY0cVffmqiUPtKHtleH6NXTcM/R4mMGHv91MapxIRbKGhrSOXt+cXSQVtBqlCk5wjf4AV1r0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ80wpnlZLX+5Iy9KBN25EZcNUT1ATSlvb/6lqVLnkwkrr43bB
	RN0aO9I1oU5NQn+CYBWx6Vq5VpDMq7pCrHbPP2G51FUmipufCm3gmlTiBSp41Wtxow==
X-Gm-Gg: AYBFou06P90xGMRQBy2dkl0RBMIw8ZPBe+2BuBZsFk2vWgCmi1CVxH/+ztmR3UEs9v0
	AMkZDseIWM7+gV1RSU0P68kUnagjf5zfQTCDlL6dFMCltIrZcikXGXjpJXPw3ljD0yS97DGN+Dv
	r8fMk54ur1ZU27TPgo1jav821yxtXrg440cVzi9LiIxVdqrrYorZse7R3VRKqrDGpJSnrRLAujZ
	qID65Qy9nH0XgvwQDnTSlTffyVZpawLJIghxIp3Mp7cXiOwegBl2lCvZ2O3EBd1azzPiHoUnfFH
	dcbLvpx7CLqClrYQN8x5li1cLLDLUVbfj6Y5jdczXWkMAA9c4u/Nnu+3BHpd5Kt+5CUewvo/LMi
	Y0N86FKZYvd8L2bVlxRaDAureyW6P1RPR41ru50zRNsvBoOT2WIicfjijKCFYKJoAgdGrUd8SRS
	Tm5CJjCnqdUhbzO3+ZWg/6wfwrgs9gQHXK7bHBS/zicBze6wMN3vnhJ1odb7Jqhqgkzu7I+lAzU
	3iM1k3Wh8sPuk1AVVVe8/jJJcBKPQ8SJDHgjlOhG5igxUFEZmsg0IE9
X-Received: by 2002:a05:622a:410e:b0:536:566e:6b52 with SMTP id d75a77b69052e-5383b5ebe08mr38603831cf.27.1792866486889;
        Sat, 24 Oct 2026 11:28:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd0865sm26558646d6.14.2026.10.24.11.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:28:06 -0700 (PDT)
Date: Sat, 24 Oct 2026 14:28:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <c1f1a281-de3f-4966-b4a8-e9fd0b5268c2@rowland.harvard.edu>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024155614.2732-1-igorpetindev@gmail.com>

On Sat, Oct 24, 2026 at 06:56:14PM +0300, Igor Putko wrote:
> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be executing
> on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
> and wakes up waiters in usb_kill_urb().
> 
> Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
> after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
> completing_ep or clearing the running flag) after the memory has been
> freed, triggering a slab-use-after-free write detected by KASAN.
> 
> Ensure all giveback work has fully completed in usb_stop_hcd() by calling
> flush_work() on both high and low priority BHs before deallocating.
> Also remove the misleading comment in usb_remove_hcd() claiming
> flush_work() is unneeded, and document the queue emptiness in the
> usb_stop_hcd() kerneldoc.
> 
> Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> v2 -> v3:
> - Remove obsolete comment in usb_remove_hcd() regarding flush_work().
> - Add comment in usb_stop_hcd() explaining why flush_work() is needed.
> - Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
> v1 -> v2:
> - Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

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
> +	 * Even though all URBs have been given back, the work routine itself
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
