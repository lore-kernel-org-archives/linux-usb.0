Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867114;
	b=xJ4OCVvyNzVcVMGEi0dfYitxUB0jrgf2JCXNq3zATaw0GoGa7feU6593xl3mAJHfmEgg
	 B0mwlvBK786dPAhS8XV9FsQLVFFbH+GXqO5wX/WV+5PZDfkykMgL/cMx0Py6EH2bGxKpT
	 CVsUZKiYDAtg0olWPSMfIDOGEyEP1ubgzj9vnk888n/rl9QTTq4wcwZCoOiuKZmGlT7xa
	 +Bks+r2z69pmoBbxfmIfEKCC7HVKpcMxqBT6R9lfEcx9NpEci+D22CHH8FsXcP4A8Ntjz
	 8ZK3kF6gT08Ad//Ld6QlpGbzHO8hrkULdASN09nnrwtWLfhy+f4F3rGAg1zPsZ4le6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0gF/IG6G/H5tqcsRBL8CcYqfoN8INLX7Sa1OZ48PzGk=;
	b=RAkSWckwcKXTp2fC8x6KY9VNfuVOXF4xhx/ueih1RKiYFEvhJ0zqOC+2ojaKvCX4BTev
	 Qhr2EV/9BKfHV2Zehtllovkj2KsN75rrwNxldhD5F+0czkIZTmg9xeqWyPXARRh7xfcmx
	 y9ZPdYtzGm4JpuXJ/7coERLncLzP+YYlzZ87MK2vLz5BtXzgFBiblFto0T50dcWtzGYPw
	 pPLqwILKJbCAe3Zic+2hnQYAZi/oqq8HbXAZWUfVOcBceX5yVNAQUGTj531hfiMQw9BQV
	 EidfEybEdScKMaughGeXrdTelEU/cym/F5CcJOVK7L/xv7AnolPgud5q9ZExgmT0lTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="iQBW2O4/";
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426E606A331
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 22:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D426E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iQBW2O4/
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso1890770a12.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 14:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794867113; x=1795471913; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gF/IG6G/H5tqcsRBL8CcYqfoN8INLX7Sa1OZ48PzGk=;
        b=iQBW2O4/5mvxW9v9NcnF7nDBZGpi3fxHBrxt6nUGv9IRUnoJr9CU4fTCcnSP8xS5bJ
         im18IuqgZuphH/Ep4cNP1EhEN4CPueq+EqIp2+7Z54bfvGcIV82v5zqGlAtMgbYiEKhd
         eWHZwoBAKeZDvt8op5WRv4qhkDvV28qLG8J26C7YsT+UJsqSPxg03ohDGx/NM2XeSvki
         l/aYm71CrdbKdHzD/DQRVckdOq1mGGSdw/TYKBNS16PKLidPp1wAJvmSeHZu+nCgr/M6
         WruLqYX2XykZcxpcJIZakmbeLVc7sn+XDyGvwRyhz/j04+Nl6N4W+HUaJvu+O/SECw2c
         jUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867113; x=1795471913;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gF/IG6G/H5tqcsRBL8CcYqfoN8INLX7Sa1OZ48PzGk=;
        b=iMFT7svNVoMyVQ03rytzvMO5RQEqUpGgbed3taZMbgWrVCBX4XKtMrkfamT4nthCOp
         skZmrJmXhDrNW7s96HyrEwRwlbyKwS03C11zKnbskcLEAmI1g/kG2TyBg7Y9jFYa9Hur
         wQcEnWDBrYThNmVRh4JRUavIxzh5yw4SeDnzoLPTlVGorYQ+n8lVCT4+d1bwN8icLNzw
         DNyjVfRrvTMcufT8Yl1AvpdD6mF3B23b1bKK2VUhgWO/yFqa2p1Fr37hyBbbAqjyPV5K
         89Odq7sbrE22x2qIDNrKKLp1m5aKiFORGbw6rlIgYtZJAaqQeLJR9haXjnNbzhZtJ/Uk
         HyKg==
X-Forwarded-Encrypted: i=1; AL+hErGDeYffQpVMh9Ul2j3vT65WLDjo0CleWhVN5ee7pHfDCsLN0rEb538VQDYrnZqP9ih3hOwc0BjE/Hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SQcjtS1MgSswV0RIR4wXLb1Uxpme1mOPNZzIzIsyALLbv+8iN
	9ZNX21w04wx3WhtYnD7LPkXUSBn6SFgHMB4XfePAP9bI9ko194z7dslDukSBO3ryrAqza8xZ/vE
	DlAclAh3SCQ==
X-Received: from pghv12.prod.google.com ([2002:a63:f20c:0:b0:cdd:9f2e:53e5])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8047:b0:3fa:2a08:8fb3
 with SMTP id adf61e73a8af0-3fa2a0890cdmr5095189637.17.1794867112860; Mon, 16
 Nov 2026 14:11:52 -0800 (PST)
Date: Mon, 16 Nov 2026 22:11:47 +0000
In-Reply-To: <20261112010928.23716-4-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com> <20261112010928.23716-4-shishunbo@cmss.chinamobile.com>
X-Mailer: b4 0.17-dev
Message-ID: <179486710796.2938203.13522037990167268712.b4-review@b4>
Subject: Re: [PATCH v3 3/4] usb: gadget: f_hid: fix race between userspace
 report update and GET_REPORT response
From: Neill Kapron <nkapron@google.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: nkapron@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

> The GET_REPORT response is served by pointing get_req->buf at the
> data[] array of a report_list entry and calling usb_ep_queue().
> The request completes asynchronously, so the controller may still
> be reading the entry's buffer after get_report_workqueue_handler()
> drops get_report_spinlock.
> 
> At the same time, userspace can update that same entry via the
> GADGET_HID_WRITE_GET_REPORT ioctl: f_hidg_get_report() copies new
> report data into the entry while holding the spinlock, but the
> transfer reading the entry is not serialized against that update
> (the lock was already released by the work handler).
> 
> The result is that the host can receive a GET_REPORT response that
> mixes bytes of the old and the new report (a torn write), with no
> memory-safety violation but corrupted report data on the wire.
> 
> Serve the response from a dedicated buffer allocated once in
> hidg_alloc() and freed in hidg_release(): the handler copies the
> entry data into get_req_buf and zeroes the rest before queueing,
> so userspace updates to the entry can no longer race with the
> asynchronous read of the previous response, and no uninitialized
> slab memory is exposed to the host.  Placing the buffer at the
> function-instance level (rather than bind/unbind) means it is only
> freed after all USB activity has ceased and all userspace file
> references are gone, so no disable/set_alt/unbind ordering
> constraints apply.
> 
> This also removes the now unused get_report member from struct
> f_hidg.
> 
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 36 +++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index d7ba30323414..8c2adf392389 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -94,7 +94,7 @@ struct f_hidg {
>  
>  	/* get report */
>  	struct usb_request		*get_req;
> -	struct usb_hidg_report		get_report;
> +	void				*get_req_buf;
>  	bool				get_report_returned;
>  	int				get_report_req_report_id;
>  	int				get_report_req_report_length;
> @@ -128,6 +128,7 @@ static void hidg_release(struct device *dev)
>  		kfree(entry);
>  	}
>  
> +	kfree(hidg->get_req_buf);
>  	kfree(hidg->report_desc);
>  	kfree(hidg->set_report_buf);
>  	kfree(hidg);
> @@ -568,6 +569,7 @@ static void get_report_workqueue_handler(struct work_struct *work)
>  	struct usb_request		*req;
>  	struct report_entry *ptr;
>  	unsigned long	flags;
> +	unsigned int copied;
>  
>  	int status = 0;
>  
> @@ -587,7 +589,10 @@ static void get_report_workqueue_handler(struct work_struct *work)
>  	ptr = f_hidg_search_for_report(hidg, hidg->get_report_req_report_id);
>  	if (ptr && !ptr->report_data.userspace_req) {
>  		/* Report exists in list and it is to be used for immediate response */
> -		req->buf = ptr->report_data.data;
> +		copied = min_t(unsigned int, req->length, ptr->report_data.length);
> +		memcpy(req->buf, ptr->report_data.data, copied);
> +		if (copied < MAX_REPORT_LENGTH)
> +			memset(req->buf + copied, 0x0, MAX_REPORT_LENGTH - copied);

Isn't this a silent UAPI change? f_hidg_get_report() already
initializes the report and req->length is already bound by
MAX_REPORT_LENGTH. Can't we just memcpy req->length bytes to keep the
existing UAPI behavior without exposing the slab memory or needing
memset?

-- 
Neill Kapron <nkapron@google.com>
