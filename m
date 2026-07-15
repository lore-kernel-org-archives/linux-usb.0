Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5358619ABD8
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109914; cv=none; b=r3LynT8ntc1jlLHhKnfe9CFYXrH29jO+r9iZv0sM3H0xLNox5+6CgUP8cQYpIzLhE/s4zgJNLGUtJ92HnxqCU8WlCqQO/DGdue6OIgekxUA7pRBkTxoIJS02nhNAV/MBIEK/rLv5F3y8GREzNqIv6gofUNemXEel+5ctCYlK1+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109914; c=relaxed/simple;
	bh=t0VxO5AoI6WaXZR/bzY16SQl+04y8VBdsQe8wdrSMrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pt7L2ynHbw7L2MyijXoheQoLUqmEuwbk0gQNP3Xm+sF+0lXEioB8vUnQ5XzD0ne19xWLTZC5aQpoTs1gZPGZuWzaAicN0m4PJEUVfwegE6hjY0OKDKzgkKXALfkvYR+YJjD8XnJNfrTKuXLSvjsvtPZsbru6Jul5cOFYR5IxJO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IjN6JzF8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IjN6JzF8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f75f7172so35882215e9.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784109911; x=1784714711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFOu++CtmU630//iU/ke2TXUjjYHp2ph7ufYpB5NBWI=;
        b=IjN6JzF8yNyhM5xRF1BRkP5jU+jBvf4kn1xezG6fXguWDuq5OOTK+Zct72pTnVVJZh
         9w9pA67PziRE29HzD1Bun+sRUzqz1aYr2Kd1/gFtqtY+6CoQ9uBrXB5HI4Krwkp/tvma
         60+oTHxbtN2V3888uqTIceas7jJl24150sSEVPBcJQGr0n944ozbDxrTE0vX9i39824G
         PxGDUTr6ZVPc8igwkuN989vmEGsaI9GMadLdWkz8P1fO7WtvltbFrWkE1LlJlHgWJqi3
         KkZ6qllJVHyjDmxSr7zM5dO+9rCe1HxkW6MLIG0tzZxjYjaeXRTGb1FaZl6wMoSci+To
         tSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109911; x=1784714711;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFOu++CtmU630//iU/ke2TXUjjYHp2ph7ufYpB5NBWI=;
        b=EyVA8Ij6bbLP1Cvwic1RjDF7gQVLqNC8rnmFB32Ea96g39RqgRwoW1Bnk86A8cjGaC
         SDOQBE3UYAutBifIhO19FZ19gSr9gbEHrOzFJg6CKGmOpKf5egQLXs/mOe7WFdG7Y51G
         NdlZ0MPGqAOWrDMxnf3Y0zFlaGtaYYVRR0ZdPz2LnBYa2pw9BmhDJTXBhrQjU6Q3Avwz
         2gZJsL97t9W5jok1uwHa4t3kllnebuQtKgPEAcOvjtKZN9Oqo7OA4EHKuz7i0EDkJY3z
         hnEJJrNkXNfu5zW01xox3TLWwsa6LSyt552ZSI/MYD3ZavcZFEzWlksFc6e3yC7LiDSq
         8/lw==
X-Forwarded-Encrypted: i=1; AHgh+RpFEb0yuDg0nh6MN3UjZ+w365igEULcHJ/pxUab4+Kx+KBpzH4pcYpSTyfR9JN8OkPhRAPxEqM/q50=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLus3ak2Nv3Bh5hmNaXfIVty7aQopUMaiq1nhobpAOzoCNaQoI
	NSpX+L8JnJbH2/Fd8pqG6KGdJD2tGunuiDCYhPMgBUOCjawIwKize3H9ZeIuuJxDgJc=
X-Gm-Gg: AfdE7cnEwGwDEWHUxdK3DAnObBJilF2e3WurOsoNSNnkSttWMtZCKHm6JS0IpBErFxL
	S1xTpu+wtXM3FBLPxHFu/+QTDyOigiNI+fef/Q0J3pCBFbCCo1grQVehAJrfN/WgLxXsz+vzMSr
	CWVJRa5emcdPjMXanxCCe7ARlNw5ACze0erBUVucRzIJAJqC9iFYPBHxx9kKShf90S8o2ywUs7X
	r1RWFTQnPjZGmjEfvM1mun9cKyQd3VkKCcviwYwXpCFrEr1JZ5hB/YYT09VrgsNVQTxfy4QhFFz
	MHUegYnjgQRfUeF8HzEV1PYNvJXSgcgJWFCvU1luhXjbU5KhjIHuzCOJlStip4DKtKO6ERtEVLU
	xJIfcZ6YCCi0ot2Sg0LbnyVZEeeMf6jBQ15rqLCnD6RjQEEkcfYm2OzohMAOv+ZsOTh7xxm02kV
	Z9SQ1ibEM+FyxIXz1YB53BPLE35e18fKbU8O3VJe7S6hPML2EvC90e
X-Received: by 2002:a05:600d:6444:20b0:493:b91c:6bf with SMTP id 5b1f17b1804b1-4953c27b2admr18203405e9.18.1784109911496;
        Wed, 15 Jul 2026 03:05:11 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ce:401:1956:1436:cd75:71ec? ([2001:a61:13ce:401:1956:1436:cd75:71ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950871e830sm142797915e9.2.2026.07.15.03.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:05:11 -0700 (PDT)
Message-ID: <a410147d-29f7-427d-a8cd-bff0397f1988@suse.com>
Date: Wed, 15 Jul 2026 12:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: sierra: deal with insufficiently long
 notifications
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, jkrshnmenon@gmail.com,
 linux-usb@vger.kernel.org
References: <20260714183305.1331363-1-oneukum@suse.com>
 <alc1KYBzqiOWUx4u@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <alc1KYBzqiOWUx4u@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15.07.26 09:22, Johan Hovold wrote:
  
>>   	/* Resubmit urb so we continue receiving IRQ data */
>>   	if (status != -ESHUTDOWN && status != -ENOENT) {
>> +skip_too_short:
> 
> And please move the label before the conditional and rename it after

That really makes no sense. If we encounter a short packet
the status must be good. We wouldn't be allowed to look
at the packet in the first place if that weren't the case.

	Regards
		Oliver

