Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203337702B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560935; cv=none; b=QYeDttvsxhUPb8iiPqe40xXs2SJvrST4mbMFt9ozVKkAfWTtGfRpmg/h2sUMxIqhPmdG1k/A6AyZrpUv4UY4RwwgiDoJjSIKZgvJj8h7DV7D9Rbp0NDP4BlJAxRps/sOtcxbRqOX2dPjdLiQVnG72xdxmddWZtWaJftH2bDN/9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560935; c=relaxed/simple;
	bh=s9N4SJWPym+C4tYVnt9KaGPrfIXadQwubQeB0Il//RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqX7G0EnHU0iBPMIzwsL1n3krMswDk2LMYeGul/d9wabTh2q++AeMyWdMFRtyPh4WrvlH/Q5RUV4EhXA7Jsh7spjgxDXKtg6ZgzscbJUW/APPUu8H8DR5uv7xUf7AQVCAOtn6GlNoG/bqER3Qj58SWuCXdBMvs6Ef6rUOj/x4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4jxqPJS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4jxqPJS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso68230495e9.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560932; x=1792165732; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXF2z4vyGmmSKHlETLZ0cQ9sneHBE6Aoyzr8KR9FOqU=;
        b=V4jxqPJSWbrOhz0wgaQndEPsVaNdMlz9J+iO1dariQy6pKN86MUnBcpMQaF72ZpNz3
         WnM45VD6wcvv9mnj3a0+vIGCOPMswww2yabn2Ewz+2gb7gwJ8SF8KF4+fkvEqvMlJMcz
         ouvOOkfRXVHqQOFHJN8tjuBdJGQYTAr0v7IF7qFSsVezfVEIapl2vVmk5hJYRjvfqJIS
         0mZop9T+ofwRm6bCBSQL6MiV5rm5Zi/zNknpuEHIRHrHN2p5pHemBTgUm2b4QItuY8Dq
         mWaKxIH32GewjWJIko5RYzw01uvzTBZmpDOua4ut5Kb9zlIx/Xl2ZaUXNvB9zg5uSKN0
         qODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560932; x=1792165732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXF2z4vyGmmSKHlETLZ0cQ9sneHBE6Aoyzr8KR9FOqU=;
        b=LKRmdhsYRNcD9ds6oXibQYTnbtIqPBSYIgBJglP6NLFmw0IzpDiBwFJkMFfAlVZQ9s
         IirvyOpIqA740jXwNTujKzUuhSrikP2Qvv8sdfyFKNfvtrFGcGyRw4IPKRVop+1KGQ1w
         /AuhUvROI7Qe/9JfJYrhyKs0FQUpsLzsr6TJqrnDPU6hlVb7Fe6PZMFBh2MwQ1iYXSaX
         GtMS6s/swFjO/ffq4Rl+aJ7iyecBCwFpvkdAinhKpOeFdUMLBnSt/Ba+NNY3x0XMmpJq
         +8gzb+g/OSGfTatmL6lS8uNwizloP6b/yUxlXR1iVkEPzTVQnV31aRZYpbV47AFLyAKc
         5KPg==
X-Gm-Message-State: AFuF++lSFCJR1NyW0+khqbZ9tp/XZSDwlqXXmqzS4dYDujfblcFc7Rvw
	IaL1jhr1O1clDb/5CTcAF6CbTwGHnNj/TOmktbnVjg0D3QLHH0iLD4Aw
X-Gm-Gg: AYBFou2WypKDYrop6Nv5vl62kK+IwWJgyQtTptT+TmZmnAHnJft0JYKHWH93N9O4tzf
	cplnbHtSTCFXfD4Lab9URhBd8G2QwIyW9Gwx2tUw4q5bnYZ2IuPu+kR8pYmFlK6ezhOru1n3wo5
	8og1A/9BWWvn2XbBGtaw+0CoC7NCmtdNXk8EMngnGAO0Dg/zaESpSRYsJtRZbd4YxHMdCK9u1xI
	jG2fxRszFLhKyToiWHC80tr0NPm20XPPeIo5LP1EzaEbtuM2ymR5JoodVlZfQtu3UQ5i2HCHCaG
	JhqJxfwNKEjQwBrxkUO7v7AvedjXQWiGe0eHdyUBpBUGhl2Wc2lNgkhK0M7ttoHI6YxyYNan9Q7
	qYNKfmavdJwiLqXZsbgb+B0tjeWCPkxF4a0BIgVGH5B3t7AcxIYGxQzkZlhQVG9iyYHFdftGa/W
	ym8Hr2eO8iRQmDDKSav2DdNVM0NU/85l3WD1jsJgqgWjbcw3647miOV6hIPonDsT2HURmzvIIVj
	ipyJUjFRFZIITmX+nU=
X-Received: by 2002:a05:600c:3e8f:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a18e4a3fbdmr46298095e9.16.1791560931844;
        Fri, 09 Oct 2026 08:48:51 -0700 (PDT)
Received: from [192.168.18.21] ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm120627275e9.9.2026.10.09.08.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 08:48:51 -0700 (PDT)
Message-ID: <cc9f0c2d-7f41-477b-a1dc-9d5a7146af71@gmail.com>
Date: Fri, 9 Oct 2026 18:48:50 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261007220311.113827-1-omermetekaya0@gmail.com>
 <sashiko-outbox-164620@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?=C3=96mer_Mete_Kaya?= <omermetekaya0@gmail.com>
In-Reply-To: <sashiko-outbox-164620@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/9/26 01:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] net: out-of-order packet delivery during RX resume
> --
> 
> commit 7148b0b2b0b945f31b2120d7f4cbc269acf91635
> Author: Ömer Mete Kaya <omermetekaya0@gmail.com>
> 
> usbnet: fix EVENT_RX_PAUSED race in usbnet_skb_return()
> 
> This commit addresses a race condition in usbnet_skb_return() by protecting
> the EVENT_RX_PAUSED flag check and enqueue operations with a double-check
> pattern under the rxq_pause lock. It also protects the clear_bit() operation
> in usbnet_resume_rx() under the same lock.
> 
>> diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
>> index a19ecf718f36a..d1ec3ba1e10e6 100644
>> --- a/drivers/net/usb/usbnet.c
>> +++ b/drivers/net/usb/usbnet.c
> [ ... ]
>> @@ -700,15 +705,16 @@ void usbnet_resume_rx(struct usbnet *dev)
>>  	int num = 0;
>>  
>>  	local_bh_disable();
>> +	spin_lock(&dev->rxq_pause.lock);
>>  	clear_bit(EVENT_RX_PAUSED, &dev->flags);
>> -
>> +	spin_unlock(&dev->rxq_pause.lock);
> 
> [Severity: Medium]
> If a new packet arrives concurrently on another CPU via usbnet_skb_return(),
> could it observe EVENT_RX_PAUSED as false here?
> 
> If so, it would bypass the pause queue and immediately deliver the new SKB
> to the network stack via netif_rx().
> 
>>  	while ((skb = skb_dequeue(&dev->rxq_pause)) != NULL) {
>>  		usbnet_skb_return(dev, skb);
>>  		num++;
>>  	}
> 
> This seems like it would cause the newly arrived packet to be delivered before
> the older packets in the rxq_pause queue are fully drained by this while loop,
> leading to out-of-order delivery which can degrade TCP performance.
> 
The out-of-order delivery window between clear_bit() and the drain loop
is a pre-existing issue in the original code, not introduced by this
patch.
