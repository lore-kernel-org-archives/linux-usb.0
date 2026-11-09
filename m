Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243069;
	b=4/SfogD7tjCaSDtd1lYf9ItVLwACJso3W+/xBMESq7bvXMe/mUmneKpN87bjWeJd8aUa
	 c8KI4xUD8v/xifrp1N6q9TpSpk8gMDg7IGyNo+b9JZKZHJ/JQUgEZ2zqSyEmb69CkUuAS
	 ayPzekAge76XQPX4V1dTxhOJuThrivKggMsj2a9P8zcnkd2Ye7g5W6Aa0uoVLMSj/RBxR
	 Fqv5cw35pJ1FTfsS3KAeam/234dH2JXNcxsB7ic3v6qG+MoaStLM+V3yE0mK7IqJkrZ2M
	 la2U1tBvl8YGzGqWI+/vY3T4Ftx5UXEa0XNqoBO50TXbu8XT8pGLS/9pTsg1BIt08Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pRmx0w+ZK8QYZ3Le9mlwOie4ZXY6jj6xLVnd9zUts7M=;
	b=QHQtV652lhlvYcTewYjGjKYQ32fBTup3h1M+Gb3r5LIr73mDAYKL5jpzBvp8jd/Ly6L4
	 vEe3RslY8NJqN1KDxWAnkgjsrc7AWU4tCCErF5kE9e997Q4EZCG9oKChWPLcMOGYf9VKd
	 RJ+ChQ9MUoE5ET98ztmSPmbOiBVjJDo0myx5C3EUPUtNE1M0M3ZqahIzKsnATrE/IxyRM
	 5RYTkjAfKUjluGILaxLOFLsYC0DSjcKBS5B3X/xsZd5TfyDyf9yLFC4SXp4y+tYHp0/ef
	 /ZAmChfZHoSPJWTSf4imXXH3+gO7/5km8eaYlAZQ2twqDdou7eTrR64Wbe4KExq/2Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eVUtPdlI;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11F860A2628
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 16:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11F860A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=eVUtPdlI
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91c6ce60697so13411646d6.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 08:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794243068; x=1794847868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pRmx0w+ZK8QYZ3Le9mlwOie4ZXY6jj6xLVnd9zUts7M=;
        b=eVUtPdlIxx2K2Thn4bqSyzcFLOC9yflVfdzDBaB4D+MZJCGwgOy31UmzpcqO46/0m+
         NqWjbSsE1jkuTeEv23cQkZpnXMJAhTVCr5b1jIlfQ6X2NXmuFQvqIA4hPTtsZaHKBZJG
         6gjTfeUHOhB45RMJCn8msDinbGOCyzFB9RzGNN9IMDXOiShevnhn6LLswqZqui2OdzcL
         bEDax1ClcWmvMhK3nGHlz50MOXdBGC7DHdg3Q7evUMrq2fJWPAhFYJvqFC0ZwE/mPUsY
         XqJfT7QBn8XjXpnh4GqL9BuuEedeOkge01onJ6F/wC2JYQyl0aWoW4Y/OkIDSzQNqsdT
         FAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243068; x=1794847868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pRmx0w+ZK8QYZ3Le9mlwOie4ZXY6jj6xLVnd9zUts7M=;
        b=vMy329pE7mu8Rzw9d7sGUGKUoJU2mIMf8wiaaMu4kDP08RQzRED8y84TaE3ESDBoGe
         TopDdQrXsIdp1vgYQmRlEjt86c7YByN9YgQPIn26cAS1DekMdC9l5QcY7I3NC2GNuL2B
         XaEc2VyFZisekuQ1OuwAY6sRbdr28Bp4yUWhTly7++Er/7LHGxZ5Yei21LFRP7jbXPs+
         hUrvNxVV1TVIY90CxAR3BsKwR3E5EP+igXCPBwPXQw56Hib9d31JC+HRqQIZpOc+iklk
         f11akP6XOw4mylzhsns+EQsn44h8rGJyJYPy4cTGbxq2zVjZsXnft7iSJQ2OATMwo2lW
         GQNQ==
X-Forwarded-Encrypted: i=1; AL+hErHa5zvLZOWX9tr33tC0DJAmqSdmhMt7OlVpj2FPWj29NdsxlvKOi5NgMw4Q91uh9ACWHqWH0EUGlts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6/81oTJhT5VRL3SFOiLR5BWtEx03s7+3/MwF+RTp6wo00nSBr
	C2tQUMCDFuSgngUw/URwBLP4nFs/s1NkJN3NXxWDsCygDC2Kh8E7DodtLRNdHYh4wQ==
X-Gm-Gg: AYBFou3LO8gELfmO4Z8Dt0n9N6nL4Z/TYb4Hk+bHxz2zxwV32beRuQoa78Hky7m6EXb
	7Vk6F83fSSfqNO5INuoHN4qi3wIou+8jNLwZ2f/KwHcE36fip4M5SDE5pRu1P8HC0xUyL2TegWO
	6y5kypn7QfdBqTi4tgU62ORP6aP0QTYSmY8U4HnZw/vah/1nxtXDYRcB4XK0CJpnsxExM6jxU0b
	2Z0xYNwb09wsutS49c7MqeaWmm9oopUnqKl6c+s8ykF2lUKkjq5cMNEPLRdE8ezEB5EbmzJntpv
	A4kDtjWp3XR3/9Ujr2d1ERf87B4iFySjbISTDVKb+R7xp/b0XOUYDcuggrd+kRPQ4j9I1p5v39j
	KPxkhCcpnntx33HKV9YS/Z4Z1oKPgOF57euF/Q52O5cL/h27hyiDqhDVJuQp4DwiFqy2jTE/spM
	1uERAo2Shv4fNXFkEcwCRtc/1JVUJgPYisxos85OSv+uTwUVey8hfuLvpPNvB4k7qBu/sHgEF1+
	QHgYrFSKcIhjoZDXlJVAbmy9fPqsv5gnM9PRO1US/sZnGn6MNhu8bDma3PbLxhRMA0HDEnj3Kb+
	KKzPN1BKsZHzU3nPIgLrJne/MFs3
X-Received: by 2002:a05:620a:2b8e:b0:945:f5c0:a63f with SMTP id af79cd13be357-9479f228752mr4974385a.5.1794243067581;
        Mon, 09 Nov 2026 08:51:07 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7ce960sm12830485a.31.2026.11.09.08.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:51:06 -0800 (PST)
Date: Mon, 9 Nov 2026 11:51:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 1/3] usb: gadget: gadgetfs: fix ep0 request lifetime
 on disconnect
Message-ID: <72c56e59-9e78-4536-a0e8-8007aaa46fda@rowland.harvard.edu>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-1-b410e3dced89@gmail.com>
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
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-1-b410e3dced89@gmail.com>

On Mon, Nov 09, 2026 at 02:50:51PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_unbind() frees the preallocated ep0 request after disconnecting
> the gadget, assuming that no I/O remains active.
> 
> With dummy_hcd, disconnecting does not necessarily drain ep0, so a delayed
> userspace response can leave dev->req queued when it is freed.  This
> triggers the warning in dummy_free_request() and a use-after-free when
> dummy_udc_stop() subsequently drains the endpoint queue.
> 
> gadgetfs_setup() and the userspace copy helpers also race on dev->req and
> req->buf:
> 
> 1. ep0_read() versus gadgetfs_setup().  A delegated control OUT request
>    is queued by gadgetfs_setup() and completed by ep0_complete(), which
>    leaves the payload in dev->req->buf and sets setup_out_ready.
>    ep0_read() copies that payload with copy_to_user() after dropping
>    dev->lock, so the copy can fault and sleep.  If a new control transfer
>    arrives during that window, gadgetfs_setup() reuses dev->req for it;
>    for example, GET_DESCRIPTOR(config) points req->buf at dev->config.
>    When ep0_read() resumes, clean_req() frees whatever req->buf points to
>    at that moment, which is now dev->config.  The following
>    GET_DESCRIPTOR(config) dereferences the freed descriptor.
> 
> 2. ep0_write() versus gadgetfs_setup().  For a delegated control IN
>    request, ep0_write() prepares dev->req and copies the response from
>    userspace with copy_from_user() after dropping dev->lock.  A control
>    request that arrives during that copy can point req->buf at dev->dev
>    or dev->config, so the userspace copy overwrites a descriptor buffer,
>    or it can reset req->buf to dev->rbuf, so the request is queued with
>    the wrong buffer.  Completion then calls clean_req() on the wrong
>    object.
> 
> Copy completed control OUT payloads into a separate setup_buf in
> ep0_complete(), copy control IN payloads from userspace into a stack
> buffer before preparing dev->req in ep0_write(), and reset req->buf when
> control transfers finish.  Track whether dev->req is queued, reject reuse
> while it is queued, and dequeue it without dev->lock before freeing it in
> gadgetfs_unbind().
> 
> Only the buffer allocated by setup_req() belongs to the request, while
> descriptor responses point req->buf into dev->buf.  Track the allocation
> explicitly so clean_req() cannot free a descriptor buffer when a request
> is destroyed while an in-kernel GET_DESCRIPTOR response is active, and
> wait for the asynchronous usb_ep_dequeue() completion before freeing the
> request.
> 
> Count setup callbacks and recheck the count in ep0_write() after
> copy_from_user(), so a control request that arrives while dev->lock is
> dropped invalidates the stale response instead of having it queued for
> the new transfer.
> 
> Wake an ep0_read() that waits for a delegated OUT data stage when a new
> setup aborts it, and include setup_abort in the wait condition so the
> abort is not missed.
> 
> Consume setup_abort through one helper that returns to
> STATE_DEV_CONNECTED only when the state is still STATE_DEV_SETUP.  This
> keeps the following event read out of the control data path without
> overwriting STATE_DEV_UNBOUND when gadgetfs_unbind() ran concurrently.

This seems like a lot of material for a single patch.  You could break 
it into two separate patches, one to handle the ep0 abort races and one 
to wait for outstanding requests to complete before freeing dev->req.  
Maybe subdivide it even more, if you think that would help.

> The setup() callback runs in interrupt context and may not sleep, so a
> mutex cannot be used to serialize it against ep0_read() and ep0_write().
> The shared request state is protected by dev->lock and the payloads are
> handed off through private buffers instead.

This sort of material (saying what you decided _not_ to do) doesn't 
belong in the patch description.  If anywhere, it should go in the 0/N 
summary message.

> @@ -1073,13 +1123,20 @@ ep0_read (struct file *fd, char __user *buf, size_t len, loff_t *ptr)
>  			struct usb_request	*req = dev->req;
>  
>  			if ((retval = setup_req (ep, req, 0)) == 0) {
> +				dev->state = STATE_DEV_CONNECTED;
>  				++dev->udc_usage;
> +				dev->ep0_req_queued = true;
>  				spin_unlock_irq (&dev->lock);
>  				retval = usb_ep_queue (ep, req, GFP_KERNEL);
>  				spin_lock_irq (&dev->lock);
>  				--dev->udc_usage;
> +				if (retval < 0) {
> +					dev->ep0_req_queued = false;
> +					clean_req(ep, req);
> +				}

Here, and every other place where dev->ep0_req_queued is changed to 
false, you need to call wake_up(&dev->wait).

>  			spin_unlock_irq (&dev->lock);
>  			retval = wait_event_interruptible (dev->wait,
> -					dev->setup_out_ready != 0);
> +					dev->setup_out_ready ||
> +					dev->setup_abort);
>  
>  			/* FIXME state could change from under us */
> @@ -1781,15 +1883,29 @@ gadgetfs_unbind (struct usb_gadget *gadget)
>  		usleep_range(1000, 2000);
>  		spin_lock_irq(&dev->lock);
>  	}
> +	queued = dev->ep0_req_queued;
>  	spin_unlock_irq (&dev->lock);
>  
> +	if (dev->req) {
> +		if (queued) {
> +			usb_ep_dequeue(gadget->ep0, dev->req);
> +			/*
> +			 * usb_ep_dequeue() may return before the completion
> +			 * routine runs.  Do not free the request until the
> +			 * controller has given it back.
> +			 */
> +			wait_event(dev->wait, !dev->ep0_req_queued);

Otherwise, how will this wait_event() call be triggered, if it is 
waiting for a failed submission?

Also, it would be worthwhile to create a separate subroutine just for 
submitting dev->req.  The same code is duplicated several times in the 
driver.

> +		}
> +		dev->req->buf = dev->rbuf;
> +		clean_req(gadget->ep0, dev->req);
> +		usb_ep_free_request(gadget->ep0, dev->req);
> +		dev->req = NULL;
> +	}
> +
>  	destroy_ep_files (dev);

Logically, this destroy_ep_files() call belongs before the dev->req 
stuff, because ep0 is created before and destroyed after all the other 
endpoints.

Alan Stern
