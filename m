Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C6327C09
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784051312; cv=none; b=YAGsTWcdRJVJukS1Ky+xZc5AwfoMn2uq5Dul616uz0xlwcv6t8pY5lB6IR5lR0hRUFQUvZmjlcwH48HnIMnEsusbowaX/eyrhhLtzSD08YG8r52Oj1T8W3qWYOlcrFqqGAcIou7yJFHeJWdTj+5nUgTm+FldfYgVCJCKQA79uow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784051312; c=relaxed/simple;
	bh=IFAu/AhxORYk2IwnhBrpXKy17QBG4QbHZp5F52W9HMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvT7fqNRb/ZvUw/X7FXxRJv7h4zhqk/XuLmkSUObH9opKmxwZJYSLyoNeXiNA6dxTqNm0Lo4yLLmukirae3Lu8HBxEyvrBPFn7ojl7TAb/3R5GSixqgBSNT8r1iacJTpxwHG7xVVKaqK668AF50Tfl66CioHP5BbdC2WxDn2cio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C+zGCpj8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C+zGCpj8"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1246138f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784051295; x=1784656095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8wrUq4T5WG/sDi1QzY5+qWQz+ouZt+E86zcQiC6M5Y=;
        b=C+zGCpj8Ki941D0TPKfjudTMiW8wnU3KkXr4QFQMbPSaL9rIyniEnwvQZFiFhtnsNZ
         Gd8ISSrNgZlC70mQOVR4x6oLGKF/EvYWfHa2c2CeoakM7+8MjdI2mWxyJmU2T1f7r9H1
         Pa7LULVxmyT8v+5JGSdyBESTcMuRVcKzkLaba4mMGrgbv3sBOFuEZspQAFvr4rm3aODx
         jscIa4/BLneKOQQKJo6Xj1Azuc9c5dXpGEFVyuxasL7l0WQ6zcQSc/U1iyRDS+iOGZjl
         PzGsxsTxd3U1WiJ6yTBMma3jeqNnljxjDCw/vfDPTTqOaXZ0v36MKIyO0e80DwY8He0g
         QQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784051295; x=1784656095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8wrUq4T5WG/sDi1QzY5+qWQz+ouZt+E86zcQiC6M5Y=;
        b=qyVG70x8IbcEHu+mXNoyqeER3xJPDQKqEedKLuD23tZdDdWkBw5qEjSCht/PdmIgjx
         YL/CxOLmkuigGGItvIowX+e2VQn57tqz2ftPms84wi4jtYzBujnXAJaqo90eGYqcSwYu
         B6cQyYMUrfa2e1eyWi32urcbZ+828uSd1tSQ0XL4FxX+I1cKftVgasZvRKnRF5U+4OBH
         xqH0tDI9y7VrFtTlNJP4rKb1W6Rnuy9AjUKnoXkIr3hjjJsIFXMQXQrdzvVNm6m48dxl
         Xt1//HxLHlPCUfOWixINK+0R4B8Mo4dYlBxWGfH+CeuvXmWGYREL7lbkkJ8pw/6l4qm2
         PtXw==
X-Forwarded-Encrypted: i=1; AHgh+Roc/lR9payIFD/DDJVfKi4PE1IfW8n/QcMVzmX+1LRREI4DjBLZhG5QtJcRIzFLUB9mPmdNHYC0ggk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZD7M6GxkBvOw+5PpNX2Y+itcXr34kCgeR8KZSnrvzIM+E94J
	nAVahHVhvCgsnNbN5J75vLK+AxKnkzUUc/rgwhpzgfqqmrOLMTMDOn3jnN14Mcnb2vQv8pOS7ed
	iG58N
X-Gm-Gg: AfdE7cnI6A6c2QuAUW/SUG9LWyf+dg9N6zIobUf0XU7se1zmHxDOSbQRyAeyEvqMQd+
	EEI3HjLdsOFUOC8oVrvN/pC4LyYfPfhci8aVhmM004piizfDGamX67blkx09UkogMHXnskpvhdO
	5BLbxqLvEkN7efh5AR7tOPXJJlCKhUcDI/7/aDaW756H8MOcbPrdKwGOTOuGAIQ2DZVtb7npH6A
	+zqZubzIgh4w3Ib/k8cehjao47hRH829OFUtWW9NcZWJBGAgPn/h7v1YAGZBL6GFZaUWeb8zFH1
	2hNv4QIMcjrdUG6CW/c5nQrh4b+EXlMfcHnV49zBN6SkNxVXCxeOx/wMT1xVxePqmUlV/cLkq7i
	4ktYjRI5o/sU/yJn86Vqf51WtaNMo6Ag5rn/R/RcdUghMnFZMFtOY3NyXxaR5MV+PvTf64qTQRc
	5Vl20G1AKMzbeNYFFRpeddBodLoQuERZd+npobUWJipX/8GT/7C8BQfGw=
X-Received: by 2002:a05:6000:40ca:b0:47d:fc20:e7b4 with SMTP id ffacd0b85a97d-47f2dcb5c7amr16880409f8f.10.1784051295376;
        Tue, 14 Jul 2026 10:48:15 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm11710975f8f.18.2026.07.14.10.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 10:48:15 -0700 (PDT)
Message-ID: <f5e4f3d4-34f8-46b9-90e2-4f21e90983b7@suse.com>
Date: Tue, 14 Jul 2026 19:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Strengthen error handling in hub_hub_status()
To: Alan Stern <stern@rowland.harvard.edu>,
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714-usb_core_patches_2-v1-1-4229a368a633@kroah.com>
 <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <f66a5507-5e83-424f-9c11-15b1882be499@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.26 18:32, Alan Stern wrote:

>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 5262e11c12cd..0d2166b8923a 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -991,10 +991,12 @@ static int hub_hub_status(struct usb_hub *hub,
>>   
>>   	mutex_lock(&hub->status_mutex);
>>   	ret = get_hub_status(hub->hdev, &hub->status->hub);
>> -	if (ret < 0) {
>> +	if (ret < sizeof(hub->status->hub)) {
>>   		if (ret != -ENODEV)
>>   			dev_err(hub->intfdev,
>>   				"%s failed (err = %d)\n", __func__, ret);
>> +		if (ret >= 0)
>> +			ret = -EIO;
> 
> It would be better to put these two lines above the preceding test.
> That way it won't print confusing things like "hub_hub_status failed
> (err = 2)".
I am afraid I have to disagree. We would in effect say that get_hub_status()
has returned -EIO. That is simply not true.

	Regards
		Oliver

