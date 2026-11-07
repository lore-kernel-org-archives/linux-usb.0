Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092904;
	b=rdvhrJHeCFJ7RdnXtz9xKCY8glVOOxTCP3z4ITRZoHRITm1XegBmIgAFwQPbXHp/Mq/f
	 6snc5hXeGvE4yw7vlIAjMSJ0SnT03iSJzEBAeZ1mbApdJ0NGIfd/q3vrogiGGesctkMu2
	 ePBRcNaLreXzdDmOOBV5AdY4Yu135n5+zORwVJRlLX+Ch0L1Ql+zDxtFYbftgi+cW1clE
	 oCLaqFTxUqki702bc5cgRL+7nDedwY5jAL37/lfskEcsCuyFVv7/cNGSb7RzYOfHEsdVe
	 /CfYRFg0CxWSHkA58iEU2esFDk6oIVSR7uswXeyQEBTmEyzu6gnq3YSnr4HPP0OGLpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=RiWWFK5Yf30SlopCjvVOtFqcpYgrQCHqfBBIPIoZ+9w=;
	b=kBR5JluqTz3IXDsfRROJwepUwSV8pglm0WRC+2wnMEtuW+eFEy/bSiOupQpqekCC0+h0
	 7aPqhmE+K1882kxcdlQBOhiRTEkTIt00m9uHQxn+SM+DGB142wV9QiAtZv8QcpdcWuMkl
	 XlH7Gmn9whPkJREkmmcCQzsFyGJXSS1f+Zb8W09ByV68SX15D3cODjzOXC/+fSoIlIUXd
	 Yaf0i+glhXWvs17hCIwgsKyZP3uRmdX+layA4iex4tfokDMP4+GEJ7U49tkeZCtvwKj70
	 Pd5+70zb7b5gePut5POlZzS0JJQtRMUVWfrjqsUOFKu+gWVQdsd1WB2oxOaod5e595w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwBcsiuA;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BD606A32D
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 23:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F8BD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwBcsiuA
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so7909666b.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 15:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794092902; x=1794697702; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RiWWFK5Yf30SlopCjvVOtFqcpYgrQCHqfBBIPIoZ+9w=;
        b=nwBcsiuAY+aykOgr5u1QAjbCUgpuWtre1b5B0Pjl3dkGLzQEdJzIqrp5kh2bEr3k5m
         ciklvg8ks3dqWpvcTlhHFFRdtyU90Wik7i0MEXKYfm8WdtSXK4xupGjKAHeQtUfgcSr9
         rBc8swizUwQN8SbtMtj/QEFzBaDCdpLtiGJNAoxn9DUThHyi5nt9aGFMlyX/3aKjnsIt
         Oo1fc1TBTuqRSadQixfLKiYhqSvou1yLhA3hRAv0r1QFHvTPQXJDW5m90DyNGYXf7ny/
         FfebhYGO0Okf318DpxSZ5h26/TRxA6lEUxPZ93XNFOX+HDhl/h2oG8BDcE3o30GDTm6G
         SC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794092902; x=1794697702;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiWWFK5Yf30SlopCjvVOtFqcpYgrQCHqfBBIPIoZ+9w=;
        b=n9Fpam9l5LcBS3/NWV9Ms5gXlJDEqk+TpE5yt1rj9GDSe15q2T3eu1buFle0tiD+LR
         /JIxbys1ay7lKAdG/KNs77Wf6Tsj7Uxzg1hJrvrHd/rYYqpKRF65o5T6YXoniZBYhP6P
         DfD+3jg2Ac+ue5aKvjzin+q4z3IfFroOJ/kvg2XZKpCD60jaa0GAyH+00SxE3iuTTF/e
         MYYEnV32SsWWRp+0L/Vv5lAaRy63yK8t2s6IkiycnB3O+PBlfl3w/7+g4zp50ry2CNIr
         ZEE5jpYV0Z+7OlZysNX1iJr9+up4Z68bSieY2409lbM/tfS5QwGM4INRZccBMJRFGYmX
         4KrA==
X-Gm-Message-State: APuU4Z/ISy8XChnINg4vf+m8BpVzr598InfcS3aS+vE3M9RO4iTKUOgX
	27O9AXJDfSkcrp/9wsXxuatfScrhoI4qmWHi6ZKF80wT1RDAEg1Ko3Fv
X-Gm-Gg: AYBFou0qr1ke3k1ucCe5GDnHsNk9ciSLglO0f1lLGgNMbMZ66EOvLWoiQDxxjnUgE2f
	U9BVFSV5uDC8Qgr0HyOVsPOm/BCCTQarKQY58hu9ZMrT05WAyB9gA95MzKVakzhPa+v9FnV+2sW
	/Vy8mgUv2mtpYMPDiIuQn69qkt6oaX3z3iPyJMii116QvwqfWzuGqcv508vHGn8iMc7RftTren1
	Kupbk1gCIMuE9JR+OtPZM667pP+4KJxxkyEqFiWHwbCw2ooamHH5N6yKmJwcSVtLj8M4/dv85J8
	/HrCA8zrtmAqg5ZlQ7sRcn7LdhpBlM2l2chNOpFpT/xUd8wBcTrepHAS5In01ek5SRKbYTAEpdw
	ccFV3IchslHC+hCWi9r1mmxgNkOF+D9a2YMlknsgavMCN23zayU4p+dHbOn7A91RPimmGVHCaDN
	2rJ9i0X7aq3wOM7/zgJZZsPxD+T4jYvRRFojqUPgX+gMIHhUQHN9OCrYPbnbLUZA37omPwh+tBk
	kg6hY30BXMO6bI87rlKUy8tm3osgsONMy0YoaICdDKX/THmi4JKZJteVAW1BPtvVEZ8w4rOSFXI
	I68DxX6e39KImeLZUM9mpVPDrPB/ZdSjBtm7LxNc9FsTtVGWvIUUt9+EZLhS+xtX
X-Received: by 2002:a17:907:1b18:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c4d6d160d03mr24113766b.7.1794092902179;
        Sat, 07 Nov 2026 15:08:22 -0800 (PST)
Received: from localhost (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474b2bsm16348966b.35.2026.11.07.15.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2026 15:08:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 00:08:19 +0100
Message-Id: <DMPCURRCFE4Q.1OLZYCFH1GY27@gmail.com>
From: "Elvira Khabirova" <lineprinter0@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Elvira Khabirova"
 <lineprinter0@gmail.com>
Cc: <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] usb: musb: gadget: count givebacks in busy
X-Mailer: aerc 0.22.0
References: <20261107221904.82487-1-lineprinter0@gmail.com>
 <20261107221904.82487-2-lineprinter0@gmail.com>
 <sashiko-outbox-203368@kernel.org>
In-Reply-To: <sashiko-outbox-203368@kernel.org>

On Sat Nov 7, 2026 at 11:35 PM CET, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] usb: musb: gadget: no TX restart when busy drops to 0 in
>   musb_g_giveback()
> - [Low] usb: musb: gadget: missing Fixes trailer for ep->busy race fix
> --
>
> commit 38e2611af12585f304377ba06a8095186ff11968
> Author: Elvira Khabirova <lineprinter0@gmail.com>
>
>> usb: musb: gadget: count givebacks in busy
>>
>> The ep->busy flag is used by musb_g_giveback() to signal that
>> req->complete() is running on an endpoint, the ep is busy and
>> starting a new request is not appropriate right now.
>>
>> It is only a flag and not a counter currently;
>> musb_g_giveback() saves the old ep->busy value, sets busy to 1,
>> releases musb->lock, runs req->complete(), restores the old ep->busy.
>> This works when there is no possibility of two musb_g_giveback()s
>> running in parallel.
>>
>> This does not work when musb_gadget_dequeue()->...->musb_g_giveback()
>> happens at the same time as musb_interrupt()->...->musb_g_giveback().
>> The above save-then-restore can get the busy flag stuck at 1.
>>
>>   CPU0 (interrupt)                CPU1 (usb_ep_dequeue())
>>   giveback: saved 0, busy =3D 1
>>   unlock, ->complete()
>>                                   giveback: saved 1, busy =3D 1
>>                                   unlock, ->complete()
>>   lock, busy =3D 0
>>                                   lock, busy =3D 1
>>
>> ...and this gets the entire endpoint stuck.
>>
>> This was reproduced and the patch was tested on a Pine A64+
>> (Allwinner A64, four cores, no DMA) with PREEMPT_DYNAMIC and lockdep,
>> using a specially constructed f_fs function that keeps two AIO requests
>> queued on a bulk endpoint and cancels the newer one with io_cancel(),
>> in a loop. Tested with both a bulk IN and a bulk OUT endpoint.
>>
>> If musb_g_giveback() were to be started from some other context,
>> the same issue would come up.
>>
>> "Promote" ep->busy from a flag to a counter.
>>
>> musb_gadget_enable() should not reset `busy` to 0 anymore because
>> musb_g_giveback() decrements busy, and if these two run in parallel,
>> it would be problematic (cause an underflow).
>>
>> Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>
>
> [Severity: Low]
> Should this concurrency fix include a Fixes tag?
>
>   Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")

Feels useless to mark this as "Fixes" for a commit from 2008
that brings MUSB support.

>> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadg=
et.c
>> index 016d3f3fc1e05..b500e0d8b0bd3 100644
>> --- a/drivers/usb/musb/musb_gadget.c
>> +++ b/drivers/usb/musb/musb_gadget.c
>> @@ -129,7 +129,6 @@ __acquires(ep->musb->lock)
>>  {
>>  	struct musb_request	*req;
>>  	struct musb		*musb;
>> -	int			busy =3D ep->busy;
>> =20
>>  	req =3D to_musb_request(request);
>> =20
>> @@ -138,7 +137,7 @@ __acquires(ep->musb->lock)
>>  		req->request.status =3D status;
>>  	musb =3D req->musb;
>> =20
>> -	ep->busy =3D 1;
>> +	ep->busy++;
>>  	spin_unlock(&musb->lock);
>> =20
>>  	if (!dma_mapping_error(&musb->g.dev, request->dma))
>> @@ -147,7 +146,7 @@ __acquires(ep->musb->lock)
>>  	trace_musb_req_gb(req);
>>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
>>  	spin_lock(&musb->lock);
>> -	ep->busy =3D busy;
>> +	ep->busy--;
>>  }
>
> [Severity: Medium]
> Can an IN endpoint still stall when a new TX request is queued while a
> concurrent dequeue giveback holds ep->busy non-zero after musb_g_tx() has
> returned?
>
> With two TX requests req1 and req2 queued on an IN endpoint:
>
> CPU0                              CPU1
> musb_g_tx()
>   musb_g_giveback(..., req1, 0)
>     list_del(&req1->list)
>     ep->busy++ (0 -> 1)
>     spin_unlock(&musb->lock)
>     req1->complete()
>                                   musb_gadget_dequeue(..., req2)
>                                     musb_g_giveback(..., req2, -ECONNRESE=
T)
>                                       list_del(&req2->list)
>                                       ep->busy++ (1 -> 2)
>                                       spin_unlock(&musb->lock)
>                                       req2->complete()
>     spin_lock(&musb->lock)
>     ep->busy-- (2 -> 1)
>   next_request(musb_ep) =3D=3D NULL
>   return
>                                       musb_gadget_queue(..., req3)
>                                         list_add_tail(&req3->list, ...)
>                                         !musb_ep->busy is false (busy =3D=
=3D 1)
>                                       spin_lock(&musb->lock)
>                                       ep->busy-- (1 -> 0)
>                                     return  <-- req3 is never started
>
> When musb_g_tx() finishes its giveback first, req_list is empty because
> musb_gadget_dequeue() already unlinked req2, so musb_g_tx() exits while
> ep->busy is still 1.  If req3 is queued before CPU1 finishes
> req2->complete(), musb_gadget_queue() skips starting I/O because
> musb_ep->busy is non-zero:
>
> drivers/usb/musb/musb_gadget.c:musb_gadget_queue() {
> 	...
> 	/* it this is the head of the queue, start i/o ... */
> 	if (!musb_ep->busy && &request->list =3D=3D musb_ep->req_list.next) {
> 		status =3D musb_queue_resume_work(musb,
> 						musb_ep_restart_resume_work,
> 						request);
> 	...
> }
>
> When CPU1 then decrements ep->busy to 0 and returns from
> musb_gadget_dequeue(), nothing calls txstate() for req3, so no further TX
> interrupt fires and the IN endpoint stays wedged with req3 at the head of
> req_list.  Commit "usb: musb: gadget: don't flush a waiting RX packet whe=
n
> queueing a request" later in this series defers and kicks RX when ep->bus=
y
> drops to 0, but TX requests (!request->tx is false) are not restarted
> there either.

Yes, it can. This is pre-existing and not made worse by this patch.
This needs a separate fix.
