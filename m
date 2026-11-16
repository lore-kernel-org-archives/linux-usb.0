Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871979;
	b=deLf5AlO9UfldSFU9JhyyETgruhqj8u/WgbN+9Ly0RUWRZ/bpHId3+6HzBhvvjw/nNXu
	 Pa/GrgndCYoGq6ECnXjf74tSZhl7BdFm+7EQeqcpJNkc5WoN6VVP6M8xMa+2lR2UJC8Hd
	 Q4qO9nZ8ykIojdZ9MB/8KY6b/9aQdbXixtzEcTs4s/weBL/7M+I/HezxdGllWF6ey+ReE
	 HvtoAzcxZkZP6HWEtd2RBZphPQ0AQFG2XEphlUqWiKcGfN5rrECoK+nsfjvRbDLwhWMNA
	 150m98G/BIEiisYJTkcQ8Z87CJe++cgnJ8JVW+FPjelN3BX91fNt+Yedm84aqE+zlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NbDV/oUH7DmLBR99ZCXlpV/lvpPdYUZq0PS9L+eWuac=;
	b=rVezb7W4sp5Fb44FPJivA6Qa+pbIY9y+RibxV4CzMaTskkbyOuXG/wJxxiQQHaikm+yv
	 aLKJUyCZMlMj/q46tMonUb45RSoiFxhfXJJcH5clafEknFynt63VSm8URtLhiaEJ5Jw9q
	 LFn2yHUKNB82bNBqeRo3MB/fYtP9m5B8WRkr6WCIr1BdfOihZLDgW/YToChQ3zsC0KJZW
	 Zw7dkclR1yXgTmXX7LqJfoLFc5uf5lDU8XY2z3n7n4/muq8YjoQVsxeacdYGrCggIKfY1
	 Td2gLcJT+iUq+YejmZuBC+v0opZL/+yJb7mN3nJ/crvrySHBCtHrTno/27s0LTReAhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hV2sfdDP;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13208606A8B6
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 23:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13208606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hV2sfdDP
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efa29ad91cso17418235ad.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794871972; x=1795476772; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbDV/oUH7DmLBR99ZCXlpV/lvpPdYUZq0PS9L+eWuac=;
        b=hV2sfdDPdLrZB2llhRTqpaRPzc/9TbjVUyddrXaBfs+Edr4vV7+cFhbuksKBgZeghc
         khE3fttLhxMcRYgmS4ZrRqt4qrpS1x6KSUCWJYU+zKTeInX9S7tGXmBrEmzYzV5YTipH
         tZEA5YJ3eDhak02bZcs3uwEgxn9jf/HVUao6zjPvRY0iWpBxQ7u3i3sBuAz96SyaedoM
         tvmHdOpIJ1hPpiAN2KVpMCXV8ox6FHHLdAGRmRFtzAtDMhu4QzDadS5FlNcw9h3CRJNW
         YP7gfltlfzAcF680t5Q2rt0/gKORlJ3/dy2z3Azd/nB4sl+jSyOzg8IRmZtpNSgrpwa/
         Tn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871972; x=1795476772;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbDV/oUH7DmLBR99ZCXlpV/lvpPdYUZq0PS9L+eWuac=;
        b=Ao5+qrYu9beaX2xh7c5XSliPhoPnTd6dC9/lWj8F/dC5Fz1UKvMfihOj6XChtSKsQ6
         cEjbQ3vEGeelIQC0ZpIKApNyEOiJ0sB9iEnN/OQQJyOQ230/U9V6iqqEpjxhLhkSfTvT
         GpW80kK5qBwJYVfLL49YQ7Z4HIHUOOw1IVsQaj3Oj2GZcB2pPOXN3snSjdeI/401riQQ
         gFYKqf5MuSDzxG9DMk64ynFPEaFDTFc6v5VeMRO0RAMCJvPYukQ1PZMMwsggmYoiWmAG
         NIENcw+d23FFOf/MlWF9ILdR0GniZzHmNBBRRSysD24UusDo/XoTzxGTf4vLXZHvSvuF
         8v7w==
X-Forwarded-Encrypted: i=1; AL+hErFAuQSKi+ZH7NNtgvfawnnjN0p+M3i7aai8NIKgrDYUtVD8vzflRTVU6PhrsBs3fkul8msJnIYER4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xY04UjpW/7eYA87Kqwfs9+68wSwTwulP7POXQXefHESNgzGGT
	Zr4PvUDG7AmFazQD6K8DOxeTe+xELWWX2vG75g8WX6PJQXTXPnE9zIRJhyg7i/1xSVFRWE30AdW
	yGDZik2IzPQ==
X-Received: from plka3.prod.google.com ([2002:a17:903:f83:b0:2ea:dab4:d40d])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c3:b0:2e5:54b9:6b37
 with SMTP id d9443c01a7336-2ee0de56f82mr113942965ad.28.1794871972018; Mon, 16
 Nov 2026 15:32:52 -0800 (PST)
Date: Mon, 16 Nov 2026 23:32:48 +0000
In-Reply-To: <20261110171222.22633-3-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110171222.22633-1-ingo.rohloff@lauterbach.com> <20261110171222.22633-3-ingo.rohloff@lauterbach.com>
X-Mailer: b4 0.17-dev
Message-ID: <179487196868.2938203.4555043762269001898.b4-review@b4>
Subject: Re: [PATCH v2 2/2] usb: gadget: f_fs: register cancellation handler
 only after request queueing
From: Neill Kapron <nkapron@google.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, nkapron@google.com, 
	me@samcday.com, michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
> successfully.
> 
> This also undoes commit e78dcb1f7ec2 ("usb: gadget: f_fs: Fix
> Use-After-Free in AIO error path"): The described error is avoided by
> making sure the cancellation handler is only registered, if there is
> something to cancel.
> 
> Registering the cancellation handler adds the kiocb to the context's
> active request list (active_reqs in aio.c).  If usb_ep_queue() fails, the
> request was never actually submitted to the hardware, which means the
> request is not active.  The aio framework already deals with calling the
> completion function ki_complete() automatically if you do not return
> -EIOCBQUEUED.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>

Thanks Ingo, this is cleaner than the -EIOCBQUEUED hack in my original
approach. Can you add Fixes: and Cc: stable tags on a v3 addressing the
feedback below?

> ---
>  drivers/usb/gadget/function/f_fs.c | 70 +++++++++++++++---------------
>  1 file changed, 34 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index d3fd1dfcd454..135c2979f737 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -264,6 +264,7 @@ struct ffs_io_data {
>  
>  	int status;
>  	struct completion done;
> +	spinlock_t aio_completion_lock;
>  };
>  
>  struct ffs_desc_helper {
> @@ -887,7 +888,9 @@ static void ffs_user_copy_worker(struct work_struct *work)
>  		mmdrop(io_data->mm);
>  	}
>  
> +	spin_lock(&io_data->aio_completion_lock);
>  	io_data->kiocb->ki_complete(io_data->kiocb, ret);
> +	spin_unlock(&io_data->aio_completion_lock);

ffs_epfile_io() grabs the lock while holding ffs->eps_lock in interrupt
context. Therefore, I think this could lead to lock inversion if we
don't call with with spin_lock_irq() and a spin_unlock_irq(). Could you
send a v3 with _irq() or the save/restore equivalents here?

-- 
Neill Kapron <nkapron@google.com>
