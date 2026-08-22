Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA03DA5B0
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 14:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787408773; cv=none; b=raNBaSOxQS7AyeEVyxLwKOPWyUHSZGn3vCfsAI3O0gPTMwt8GZM4RsygGzkgfPrmRnwLL8Zl6sTSyN5a0PX6yUf7W9D1Et8kFdGGBRF6n5LcwlTF1kLyc8oOlEXLbM8PD4cH0kszBuGwzm6EaA5YDNnudZaJgIO/jbTvjn1E4rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787408773; c=relaxed/simple;
	bh=D9P13HZLz2tXpulE4iL5mbSlf5R4Da4cdrXGawoW90o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Psw2PXCRJtCzf0aXEtYIlB5ioRMwcvJlpE5vAPv2xDcyVJLBLCTgvHtU5aL4vGRD+Sj9c0kxmK2woU1QVkB35EX3BJ0q4bJthmi6YQfL3JqoxCkbK8rn0TJcmFKUlXs1IgDMLIxyH8hNiaKpJu7JyJK1xXZKJ+Lm293h2hzo3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4KWgXFI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4KWgXFI"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca12086c06eso1528109a12.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787408758; x=1788013558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lyWb3rtx8eCSA0XJUKHW0Z9SW4v0CMFCGQPdVFOD9AE=;
        b=W4KWgXFIN+Vw/vpC3AZuZYPfepGGmnt3EOhR6PbpBisFylHN21uqTjcQN4GsHgy4Tf
         Ssj71PgK1MAVzPKb6bS+FhHohXSX41zdzM8D4Uijl7PXJV/duA3liCAtUp7tvlazJnCu
         NkrQS+Vv78RZXvu+bQvwSs5lz95MqzFoSC5y3bD3JCz7fVtaAG0g9rZhCSVgjAN+4TpD
         Ub5IlM3boLHYM52cmx+Mkqsypj234vl8VeQ5Qau/jTibWpmgn1az2GsDS2HM6m0ay5iR
         ClbpOdKZDi89m0c4D+M9Z6tYFOZO6V5aVvslNevSb7T0gPzuk/H6TKxXta/yoWYtKk4i
         4LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787408758; x=1788013558;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lyWb3rtx8eCSA0XJUKHW0Z9SW4v0CMFCGQPdVFOD9AE=;
        b=h4xWNpeJ9sGfCLh75UtcrFLjuOWro37UI78F/Nm8lEU77MG5mk0iqfpzMvmIOmQvmr
         HqMKxHqT+NlycE1aftKfiUmJ6y352lOVRaDfU+pbpbXIxJ6zNs+DvA51JjtmNanFNyu1
         uRmKMjCnH8Nhpdk5caHQbGZ1PffLIwqsJs9J2UfPpuHpRkNDugGR6AA1cj4wL7fDCDmj
         H4dpUkS4mYaErbekRhGsOIn/hRCxmWDy564sgoS0dtqvMC8qGA2FCSFfngIMgIeDt8Ke
         CJNIwMXTqSqMpABrpdnGz0VROLqcZhSZoIseBLn8J2H/F02NxYRmajCTfdYl/GdEMAVQ
         sX5Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro8tlDPWYu3nDs+EKFL/8jYjSMQJqPHv/pCRPTPNmDCfny6ctbQeNH/iUjqswng98nkpYUgxZ6RG1c=@vger.kernel.org
X-Gm-Message-State: AFuF++nNJhEf0vconxCZyCzXnEhJSW39G1kvIAsOMX9fK/Sjy2lQnV8D
	Qk5MQmejg4Q4VFOcUcyMjZibcdGChge6VNr0Ahh6k+0eca4RhWp2eijR
X-Gm-Gg: AR+sD13aWW0BOpaSXW/AEyCN7u7uuNCuyV5GvZssGuqamkty9q9E8OiLbWdtZalclBJ
	77FMo9lw7hL/Lo1RtLECKOR58oIAwr46pIZeWBOTDGwSq372JLzn8XyVu+G6J24vy7AUj8IyjCP
	s3t9dGWs/WbaZv4xv0ahNhSJ9/asW/AbCyNFztlaVpj/IowXXwhiu1MLfouqoUoQMIWkrqb/hEl
	8mdQSWKI3s7rBVf39q5rt4cMkhcw2PX65KgcTqJMxqtwFsFtwt0SfyOP2Nl/ULH6Q6DzpEWwbcC
	qNTQKb8yTRczQgDWkqYLOpZsXt0lnWckR6iSa+vNxGjzTGyTz5NAGvIk+hrdjm2PwuG6LRw60l6
	p9++v1c8SNYDRWDvoEtPbY+oZa6TRIs/r+850KD3NjMCRhuGooU0hcPluTctX9lj8PVwJGlD8dt
	qe5+qNbY5HEwRMo8z4+Xba7uxn4IGOd8Yl7oq/diaoTZbfOa75NtfcohfMDaNjm6hJKzSitjNn3
	ydoaF93WBbTaVyoTDE8SH6E3wOMUIWwDOL+PA==
X-Received: by 2002:a05:6a21:8cc9:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3cd4ba0d216mr12137711637.6.1787408758156;
        Sat, 22 Aug 2026 07:25:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909adc8sm7995795eec.2.2026.08.22.07.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 07:25:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cfd8fe7e-77a3-477c-852d-de59fb5bb40c@roeck-us.net>
Date: Sat, 22 Aug 2026 07:25:55 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] hwmon: (aquacomputer_d5next) valid the data size
 before reading the sensor data
To: Edward Adam Davis <eadavis@qq.com>
Cc: gregkh@linuxfoundation.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, me@jackdoan.com,
 savicaleksa83@gmail.com, syzkaller-bugs@googlegroups.com
References: <tencent_6A66F77626CA5371C36D2968E3AEC4409705@qq.com>
 <tencent_5F7DC370E96643AEA458177FB76E86C8F305@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_5F7DC370E96643AEA458177FB76E86C8F305@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/26 07:05, Edward Adam Davis wrote:
> The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> fails to handle cases where the sensor data length is too small when reading
> the data, resulting in [1] during the read process.
> 
> Add a data size check, if the size is less than that required for the
> specific data item(includes: Physical/Virtual temperature sensor, Flow
> sensor, Fan speed and related, etc.) to be read, abort the sensor data
> read operation.
> 
> [1]
> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
> Read of size 2 at addr ffff888108aba257 by task swapper/1/0
> Call Trace:
>   get_unaligned_be16 include/linux/unaligned.h:48 [inline]
>   aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
>   aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
>   __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
>   hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
>   __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
>   usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
> 
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> v1 -> v2: change to check the data item and update comments
> v2 -> v3: check all sub items and update subject
> v3 -> v4: add speed and flow check
> v4 -> v5: remove dbg msg and update comments
> 

Your code was and remains way too complicated.

Guenter

