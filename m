Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B526738B
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782401879; cv=none; b=pKEWQ6cqZ53EYASYTWQtJuQxExFThSiI1VRPEptvszPfK/Xt5zZe70Glg9uXLedcGt0hiKJe/sRFfGoLVgnpFZB5jykuHoYa03f2xsZeScdpcJHrJihc9aPe+GPPqEYey4PtEgzaADqJmMQp0vF6qZB2E2NrL2fDV5scPEA/XjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782401879; c=relaxed/simple;
	bh=XCiyN2t+pubmU+TId5wjtZxQ4PDKqqjMsgC4L0ovpx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5iyGRmpB8TCOi1zLPonro3TqSlMXxV6UW1HA/t8t3F+sba4a1RbXM/HIN9m0eKr+6wutkwXBerTSdsQlefO4gxlybCQ4ifVbv09G7HMQrLJvVH9oWr+vWYGQqXnttESRpqXjZVnvPjcRb0O3RUZN1DEF47bMnU7jyiXAgHpEfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TaertQYY; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TaertQYY"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a0a38a013eso993863eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782401876; x=1783006676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APys4KeLv4YSCQ/l/Owb8+z+6axIvcyEL3NASaVFnbA=;
        b=TaertQYY03CKsry73K9QxsG8Ca9RY4oeO8JFo7lMl3XUzwtkJ0a5appoHwbryNWmz0
         +ongHyI1A7F4FDWT3npYzQgWdTwpB0nq9WabC6wJVxdQ1WEAZFrwLbTPUUIkU6cyj2/p
         gkqeR7QDN3e1vVVe+nIRqgUDzthutcmrRhU10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782401876; x=1783006676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APys4KeLv4YSCQ/l/Owb8+z+6axIvcyEL3NASaVFnbA=;
        b=FZ20QTL6pygn2bvami96fj3V0AtJK8+/tI3vQzSY3/rg2wbHrs6sWJnCMgdp6jwmTN
         21H6dZwRhCCMdJr07rq0N4i5DafD9SwArKgGNlvhMwWN2CEE8CS6dCad+CD0JLjSWgL+
         VD7eGar67xDT9uI18bv1nB04roKUwrafb2wcRdcIT9Vk00hcCOCelKRRjM4gFkmdk9kR
         /zd+ueJwI67emWs53OL/R2Od+IBZbRRX1i7fzmm/tEY5UNUbiKkeAOk/kt8QMOOOwZ8Q
         5Trv60zTMO8s7jJ3KAZaMWF6sR/idAUj4a8xpUnyGKIgvH/c2b4X2JpRoJ7t5FxbhdQ8
         lxeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NMMqrzifhX8wGZAd+THINYJx0NeSTAZ3+wJ1lTOnrUTtx4xZUdt5w1iVIP3BjKBg2+BKeKYDOQlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUabXa8YvD5ZkX9uNRnDfyCx0uwOj4tcKBGcBel+mnzd6g4gV
	WivzLx+Ji3H2KB21PhZVyvsuHgm5wACFdSpKtjPb6hfGH200schr7ihc4dy/fT67NUQ=
X-Gm-Gg: AfdE7ckTU/XxgAFNA/z89vO7LD8phRnRPe48QaDgECH40Vq8h9IBIQ7c+FMfg3wH/zc
	ljfnK2vZ9yV2303xBlg4Lt5hxUn7jqTSpaQYjNVx/u/P1pEjUpyTOs53kpyEG6tsj/6hYmLKK6q
	qhxagLEe4z8nArGzobQLoR13gBujZbUA4p2aBu1SZt4A/80ZaGnxWscSIfk+V8eXS7F3Fl2xlRm
	Z3RlTAiL3UISsaNmBsf8xHYn+srXYGUwCTLHFLuIqr7GcRLv3iugFhbZpdQv3ZUXYJ9QbfJ8Pc0
	G55o1zp/9lvbRVLZ7r6VahEBS45wZRhP16QNsHALSBAIF3+LvU9YoLWReVUNL8lOyH1BS2jUFcd
	DVMgTXM7R7QCLTLZHIeBjMEAQzbZ80mvJp2mgrqU7EsnA7prjyNgh2H7qDZrd25g9WezYGTq9yq
	5xRTkMT8g5AneQlYqrsX1o
X-Received: by 2002:a05:6820:2015:b0:6a1:1015:30ec with SMTP id 006d021491bc7-6a134243f7emr1795364eaf.7.1782401876014;
        Thu, 25 Jun 2026 08:37:56 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0ea0c378csm10262630eaf.10.2026.06.25.08.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 08:37:55 -0700 (PDT)
Message-ID: <74d0c7dd-50cd-44b9-9723-101f3bcf4760@linuxfoundation.org>
Date: Thu, 25 Jun 2026 09:37:54 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: support SuperSpeed Plus devices
To: Greg KH <gregkh@linuxfoundation.org>, raoxu <raoxu@uniontech.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <1B3C4D10DA532DC9+20260622100802.377751-1-raoxu@uniontech.com>
 <2026062527-unmoral-drop-down-9ade@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2026062527-unmoral-drop-down-9ade@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/26 09:09, Greg KH wrote:
> On Mon, Jun 22, 2026 at 06:08:02PM +0800, raoxu wrote:
>> From: Xu Rao <raoxu@uniontech.com>
>>
>> USB/IP reads a remote device's speed from the server-side sysfs
>> "speed" attribute. read_attr_speed() converts the string to
>> enum usb_device_speed before the value is sent to the client.
>>
>> The conversion table only recognizes 5000 Mbps. Devices reporting
>> 10000 or 20000 Mbps are therefore sent as USB_SPEED_UNKNOWN. The
>> client then selects a USB 2.0 VHCI port, and the kernel rejects the
>> attach request because USB_SPEED_UNKNOWN is not a supported speed.
>>
>> Map both SuperSpeed Plus sysfs values to USB_SPEED_SUPER_PLUS and
>> select the SuperSpeed VHCI hub for that speed.
>>
>> The issue was reproduced with the following server hardware:
>>
>>    xHCI controller: Intel 8086:a0ed, revision 20
>>    Subsystem:       Lenovo 17aa:382a
>>    USB device:      Silicon Motion 090c:2320 mass storage
>>    sysfs speed:     10000 Mbps
>>
>> Before the change:
>>
>>    $ usbip attach -r 10.20.12.170 -b 2-2
>>    usbip: error: import device
>>
>> After the change, the device attaches and uses usb-storage:
>>
>>    $ usbip port
>>    Port 08: <Port in Use> at Super Speed(5000Mbps)
>>      8-1 -> usbip://10.20.12.170:3240/2-2
>>
>> VHCI currently exposes the imported device as SuperSpeed, so the
>> client reports 5000 Mbps instead of 10000 Mbps. This is a separate
>> speed-reporting limitation and does not prevent attachment or I/O.
>>
>> Signed-off-by: Xu Rao <raoxu@uniontech.com>
>> ---
>>   tools/usb/usbip/libsrc/usbip_common.c | 2 ++
>>   tools/usb/usbip/libsrc/vhci_driver.c  | 1 +
>>   2 files changed, 3 insertions(+)
> 
> Isn't this covered by this change:
> 	https://lore.kernel.org/r/00C828F338E43447+20260617020613.199086-1-chenyichong@uniontech.com
> 

This one was sent first. They look identical. I will go review
that now.

thanks,
-- Shuah
