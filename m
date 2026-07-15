Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02335283FCE
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 05:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093665; cv=none; b=YCDNYzAXSVFqReVy+8CKVyzqKgNYp5OWeQCzpt7BfbQ+LPdRpKXS3j5E40P3Q5ZpMLqt7XOsEihE9/uJCaW4uJkIkAIc1O2d4SME+JNPB2AvletEd4NURDQXaQY0Rn8LVE/OCW2OwoZbgbvQD2NHszxMb6BeTNkqDjYfGXEIjGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093665; c=relaxed/simple;
	bh=zxczRmFlgL80bpV/DYtMF+mlbt4jOVvndkOtJVGbW94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EdN7l3llSxsH9eCXmFjoSsFZTDl/yWD4Sy1WLF1SYTo1HaY9PMSJoVwbzbrMnxRJ93SsQ52lN0yYk+Zb4DjWEFs6blFVqyuekAw+Ai8ONX4WlvU6gWadZp6zSVYK5jD3HnxSLLRomyKsrvOGZZJz4glovPj0vjbeCmO93XvZ94I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4SsJSBa; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4SsJSBa"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8efef6533aaso17492996d6.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 22:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784093662; x=1784698462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjHH+FMkakpyFDgNWCbAnIusGPkRsb+vc761IxBrtvA=;
        b=F4SsJSBawelW6PWaH7d+OmZeNohJb4QWM2PfipiFmcx5DlRJKT2F5BvKLoSGud9ZKP
         P4alw6j8JzdHhucD7ox9U6lCNC3KM9/EBLdgz3zp2T561Qg2icJq3fnqSbkqp206FYuM
         EepdhopCfByyc53qzLdM0f+Pwk1Jmh2YyiaVLx3Gwf/9bc4GqfAtmk2Q2CecVTAVcaDe
         g9yIs39vk7aErHHGNSumnhSwsnl8O2jJZsNXXT3VkDCbFEekTfewh9dI2kw0A5TenR45
         x2R+gOrsUnlbaoTIh/A/WulBR4/AzEpGyl87TB+qtYKK89aAYs9+INRBKzbHAuPBi5qc
         e3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093662; x=1784698462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjHH+FMkakpyFDgNWCbAnIusGPkRsb+vc761IxBrtvA=;
        b=q/wDcKSHKnMci6kQ/IvZzqqJUx9IkuDSel9H3iVgm+BuSGelIBRLjdNUCTVQd4/HvI
         hTwdZdaOWUsivGzcTVxEU/d/vp0fQ56LzFBsgSi2zZB6nSIBZ2Iy5ZeLUKZxp8kNNM6W
         NP9IqCt4zC6yTDW1102wsQR22gRxZIVT6kfeWWuCJdlDNSUM+Tn1zh46gmW0LqwRKDEF
         k5zQycxotHg9y6Lnx9Or2KoJL1AqtJJow5sjObUQ/YzPJ9aWrqhU1rRCp5cz8AVTeUhn
         FCbJYpXOfCAq0xMp8quHb4kUho3x7stgrFSwzNUh515Oq809JYYD+1cXBUmytmteg0Vd
         9Osg==
X-Forwarded-Encrypted: i=1; AHgh+RpnykcUFJSBLf0vIOpbEiFTYYsufHxdRwsD5DwLeQhVcxVv25wkVqUboG0aDyLKk2e7VYakbQkcy+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+AKuNhszI1JUGUxgkFB92kgT6cf5tWkmF2qeGetS+rhzhsysy
	jdSSysWGoedll3HSmSGvLM1vyJ0COAHjR1hNFMPukUVJ46crjEXWce5+
X-Gm-Gg: AfdE7cnSBHkuHCtuthdP2X+16Qgks6TUPItJWxSn2b2r8arMXgtbHLPlwX7bFCs27pQ
	gfdmATIjkfXyhFB1ZG2l/SC9MUStVYTz6u4J7QlCEGV4F/EYadPCXO98fs05/0Ydgq4FD//cBPo
	VzYaCa/8oauBoEuf9cs9519/hJCkkpwU5ccKHb+F6vgUfX4huTE3o3K9eceCISpdnT+YL0wPxX6
	HaZEZWxjzh2J3I7zcKhyDkSLJ5HP/ArQ95nT1maa2en7Lvc+Fqe/ZxSbP+nXIvvRLt1IjGVp91k
	O0YbfjJBWsmRSDWWYKEr0OSL54URzbOcmYnDsKsdcApTd1TtKwQr4Y2v0PfPjeF5GnVq4qhlPgA
	PJ2USFr8acx00jwUsA8+QEsQEPHijm2tTxsARpTEiUGMiihQ+fIsCy4379w7uFJIp/CUvaMVf9x
	Drf22pss1yLAABaaT0A1K/Ei9oKPNgePRuGuRZLe4VL1xBmlJIW9LTLjA=
X-Received: by 2002:a05:6214:3992:b0:8ee:a2f3:af32 with SMTP id 6a1803df08f44-90401578bb0mr198230206d6.38.1784093661755;
        Tue, 14 Jul 2026 22:34:21 -0700 (PDT)
Received: from [198.18.0.1] ([48.45.163.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82e8ffdsm190584646d6.37.2026.07.14.22.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:34:20 -0700 (PDT)
Message-ID: <15e5b802-b43a-44c5-97b6-a599f28bdee4@gmail.com>
Date: Wed, 15 Jul 2026 01:34:13 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: dummy_hcd: prevent fifo_req reuse during
 giveback
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 bigeasy@linutronix.de, eeodqql09@gmail.com, kees@kernel.org,
 surban@surban.net, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, stable@vger.kernel.org
References: <20260714064829.172098-1-wangjinchao600@gmail.com>
 <c7de3923-1f68-46f9-986e-33899dce112c@rowland.harvard.edu>
Content-Language: en-US
From: Jinchao Wang <wangjinchao600@gmail.com>
In-Reply-To: <c7de3923-1f68-46f9-986e-33899dce112c@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/14/2026 5:13 PM, Alan Stern wrote:
> On Tue, Jul 14, 2026 at 02:48:29PM +0800, Jinchao Wang wrote:
>> dummy_hcd embeds a single shared usb_request (dum->fifo_req) that the
>> "emulated single-request FIFO" fast-path in dummy_queue() reuses for
>> small IN transfers: it copies the caller's request into it
>> (req->req = *_req) and queues it, treating list_empty(&fifo_req.queue)
>> as "the slot is free".
>>
>> The completion side (dummy_timer/transfer/nuke/dummy_dequeue) follows
>> the standard pattern: list_del_init(&req->queue) unlinks the request,
>> then the lock is dropped and usb_gadget_giveback_request() invokes
>> req->complete().  But list_del_init() makes fifo_req.queue look empty
>> *before* the completion callback returns, so a concurrent dummy_queue()
>> on another CPU sees the slot as free, reuses fifo_req and runs
>> req->req = *_req -- overwriting req->complete while dummy_timer is
>> mid-calling it.  The indirect call then jumps to a clobbered pointer,
>> causing a general protection fault / page fault in dummy_timer
>> (syzkaller extid faf3a6cf579fc65591ca).  The clobbering write is an
>> in-bounds memcpy on a live shared object, so KASAN cannot flag it.
>>
>> Add a fifo_req_busy bit, set across the lockless giveback window via a
>> dummy_giveback() helper used at all four gadget-request giveback sites,
>> and require !fifo_req_busy in the FIFO fast-path guard so the shared
>> slot cannot be reused until its completion callback has returned.
>>
>> Reported-by: syzbot+faf3a6cf579fc65591ca@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=faf3a6cf579fc65591ca
>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> 
> Wow!  I'm impressed.  How did you figure this out?

With a hardware watchpoint: I armed one on the victim field
(req->complete, at arg2+56 of usb_gadget_giveback_request) only while
usb_gadget_giveback_request() was running, and it caught the writing
memcpy with a full stack - usb_ep_queue <- raw_process_ep_io <-
raw_ioctl - on the same request that crashed an instant later.

The watchpoint setup came from a small tool I am working on; I posted
it as an RFC in case it is useful to others:

https://lore.kernel.org/all/20260714182243.10687-1-wangjinchao600@gmail.com/

> 
>> ---
>>  drivers/usb/gadget/udc/dummy_hcd.c | 40 +++++++++++++++++++++---------
>>  1 file changed, 28 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
>> index f47903461ed5..fce3c3ba7a63 100644
>> --- a/drivers/usb/gadget/udc/dummy_hcd.c
>> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
>> @@ -278,6 +278,7 @@ struct dummy {
>>  	unsigned			ints_enabled:1;
>>  	unsigned			udc_suspended:1;
>>  	unsigned			pullup:1;
>> +	unsigned			fifo_req_busy:1;
>>  
>>  	/*
>>  	 * HOST side support
>> @@ -330,6 +331,28 @@ static inline struct dummy *gadget_dev_to_dummy(struct device *dev)
>>  /* DEVICE/GADGET SIDE UTILITY ROUTINES */
>>  
>>  /* called with spinlock held */
> 
> That comment line is supposed to come immediately before nuke().  Your 
> new code got inserted below the comment instead of above it.

Right, will fix in v2.

> 
>> +/*
>> + * Give back a gadget request with dum->lock dropped around the callback.
>> + * If @req is the shared fifo_req, mark it busy across the callback so
>> + * dummy_queue()'s FIFO fast-path (keyed on list_empty(&fifo_req.queue))
>> + * cannot reuse it mid-giveback: list_del_init() already made the queue look
>> + * empty, but the request is in flight until the completion callback returns.
>> + * Caller holds dum->lock and has already done list_del_init() + status.
>> + */
>> +static void dummy_giveback(struct dummy *dum, struct usb_ep *_ep,
>> +			   struct dummy_request *req)
>> +{
>> +	bool fifo = req == &dum->fifo_req;
>> +
>> +	if (fifo)
>> +		dum->fifo_req_busy = 1;
> 
> Don't set the new flag here...
> 
>> +	spin_unlock(&dum->lock);
>> +	usb_gadget_giveback_request(_ep, &req->req);
>> +	spin_lock(&dum->lock);
>> +	if (fifo)
>> +		dum->fifo_req_busy = 0;
>> +}
>> +
>>  static void nuke(struct dummy *dum, struct dummy_ep *ep)
>>  {
>>  	while (!list_empty(&ep->queue)) {
> 
>> @@ -729,6 +750,7 @@ static int dummy_queue(struct usb_ep *_ep, struct usb_request *_req,
>>  	/* implement an emulated single-request FIFO */
>>  	if (ep->desc && (ep->desc->bEndpointAddress & USB_DIR_IN) &&
>>  			list_empty(&dum->fifo_req.queue) &&
>> +			!dum->fifo_req_busy &&
>>  			list_empty(&ep->queue) &&
>>  			_req->length <= FIFO_SIZE) {
>>  		req = &dum->fifo_req;
> 
> Set it here instead, so the flag is set during the entire time that 
> dum->fifo_req is in use.  As a bonus, you can then remove the 
> list_empty(&dum->fifo_req.queue) test above.

Indeed better - the flag then covers the whole lifetime of the shared
request instead of just the giveback window. Will do in v2, with the
list_empty() test removed.
 

> Otherwise this seems fine.

Thanks for the review, v2 shortly.

Thanks,
Jinchao

> 
> Alan Stern

