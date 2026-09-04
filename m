Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F5C503BDA
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541648; cv=none; b=r3Y1mW/YK/qIUKoJogumBT9XXU54bFrUDmQjE5BnHvsEB+x9h43bWcBdlbsAghUcXlUQdJsWaORx+m7/XP0jT7z1tphBPEcJ8RcQJrmkX9i/TZv/uQt97hTgIaRpighi1eWcUSDxVNcemJhWD6sv51z83S3pUs6v0A/xYrN3k0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541648; c=relaxed/simple;
	bh=s5Ffwvup63+Hi6e8aKuYEBFVfqThjAtM0tTa1+Hw7T4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df7qRcs0SQqpl02xs7do4ap8Ey27tsGXNwzzVg3qINf5XyFT/MKqbtA4ravuIqY9kGDJMxfdBzCe0+p8XLJpUX93hwQXGuar2OJ0/6TiVmkQ7kuJ4dltjem8oJLidtfH4TYaO+3TGldMz6+zLh9nsMM3+t/gJRpxYamOGkpj9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eSD2/IJY; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eSD2/IJY"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46ac24346b1so766663fac.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 10:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788541644; x=1789146444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VvYqJtGV/BhVgB0yqrWGgaEzlxiF8+XwHAuoqD3nTQQ=;
        b=eSD2/IJYIJDQt6UamB0PoOseMyC5XzZb2AdIBJEGyF6FCu7A1xMNnJam0mAC1kD9gU
         hLmOcbp3zBl2HtixNJk9IObEshtHk9wLveocQwt/tRizdwqxF23SSa8xdQp+cLNxvQBf
         NXopXroF3tykuuEL5R9nKDbm/Lz3mEP6Ln2Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541644; x=1789146444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvYqJtGV/BhVgB0yqrWGgaEzlxiF8+XwHAuoqD3nTQQ=;
        b=jroBHkhTflYV/52yj8JyMf8vuJ2PmaQhDLGYrr7lP2uObhPd4C5ymrbIglzTgOyzZJ
         PInO74HByaAeYy7mYdGHFc8j/wDkcCktYIfyFrRMt4P/+FM5NZJ9tzyyNR5DCNA899hr
         2pTBZN1kgkdhsCrmUxjqdyYK5meIJEGEdCN6hbqMnVmoc46VHwPg/CY5kuKViv+PTLxO
         9lhyGmu9VEmcpQulPkShIDCzPfPEcgfVViQcVLgcPEUDnXP7OdjE6aMLZBnLIpy+ZSTm
         aTw9FgOHDEt1JaWxsJnLS30JthdjXGMRDAqYw2SXB2ptwuf7WeBNMCh7SItnvBKJNY5U
         Oxqw==
X-Forwarded-Encrypted: i=1; AKwUvByFj6O9EULOzXG4COEc5iVBTJ7nnlXq6X+fP6EIsqc/NzmWRw0YFVkhi29f3xGZgq4dYLdCrGctv/s=@vger.kernel.org
X-Gm-Message-State: AFuF++mv4HsD2MCoea897NGrQwo7CUYZ0nfyfq/tj6++Cod6L9wANDSV
	G7QVg3pqbSEQc8eqRexbLSvq/kuKVP9XiMg84cyBgDR0CX+P2dgOiKRTEvivKOILZMo=
X-Gm-Gg: AYBFou29T4xYXzCysY9p4GafTrKyUibPzjZKomEkiR30wS9HM2xJrHcQU5pD0SnfmDY
	MDWmL8OZmtJSsp2MI/tCIMkAk67YKV4Irszn20w2V50byJ6iO0b3Y+m57w4rr4ipnw0SEfDeDoJ
	8/OwxZwQzTzNhwo3bBqks8MNrGtouvqLfhjGghYRqSoDb7nkznwf0xYTqTsV18YPj/Q/04MwmJh
	w595kD63zd9fYR1v67J9RxdVLzNYfSPw50HAr7muyaisxdVavpa2OU5n+29JyqE/Boyh8FusNBo
	Kx0oiBFDuQY7zN3A75ehvDJTCYGOdveKuDdlkheJCFMVv/QU6hmQPVGEkCjarcmaAfH5vxk8Ri7
	2exHKCVJ+TEoblz5mfizKdPYflikvxiLY5xOkwpVo0CHE7iwwNwTqyJ7PT+WcCHgUAhsMxTgyLY
	l75oK2XPXHJEooag/f8czExbkHa7zisucGHgVJYLiPI24k4lHsFZ4f957cOtOUz7PJyAwYBA==
X-Received: by 2002:a05:6820:4dcd:b0:6b1:29c1:3f37 with SMTP id 006d021491bc7-6b6fcfdc537mr5650357eaf.23.1788541644401;
        Fri, 04 Sep 2026 10:07:24 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dea11aeasm3670717eaf.14.2026.09.04.10.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 10:07:22 -0700 (PDT)
Message-ID: <2977dab3-70a3-45b3-ac08-41bc362121a2@linuxfoundation.org>
Date: Fri, 4 Sep 2026 11:07:18 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: usbip: add NULL check after calloc()
To: Greg KH <gregkh@linuxfoundation.org>,
 longlong yan <yanlonglong@kylinos.cn>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260902070932.1440-1-yanlonglong@kylinos.cn>
 <2026090249-poking-monorail-0d2d@gregkh>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2026090249-poking-monorail-0d2d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 02:42, Greg KH wrote:
> On Wed, Sep 02, 2026 at 03:09:31PM +0800, longlong yan wrote:
>> Two calloc() calls in the usbip driver lack NULL return checks, leading
>> to potential NULL pointer dereferences on allocation failure:
> 
> This is in userspace, not in the "driver".
> 
> And how do you get a failure for calloc() in userspace?
> 
>> 1. usbipd.c do_standalone_mode(): the allocated `fds` array is
>>     immediately dereferenced in the following for-loop via fds[i].fd
>>     without checking for NULL.
>>
>> 2. usbip_host_common.c usbip_exported_device_new(): the allocated
>>     `edev` is immediately dereferenced via edev->sudev without checking
>>     for NULL.
>>
>> Add NULL checks after each calloc(), returning -1 in do_standalone_mode()
>> and using the existing goto err path in usbip_exported_device_new(),
>> consistent with the error handling already present in both functions.
>>
>> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
>> ---
>>   tools/usb/usbip/libsrc/usbip_host_common.c | 2 ++
>>   tools/usb/usbip/src/usbipd.c               | 4 ++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
>> index 01599cb2fa7b..8ad367e09e78 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
>> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
>> @@ -71,6 +71,8 @@ struct usbip_exported_device *usbip_exported_device_new(
>>   	int i;
>>   
>>   	edev = calloc(1, sizeof(struct usbip_exported_device));
>> +	if (!edev)
>> +		goto err;
>>   
>>   	edev->sudev =
>>   		udev_device_new_from_syspath(udev_context, sdevpath);
>> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
>> index 3e22b651c754..cc707dea2882 100644
>> --- a/tools/usb/usbip/src/usbipd.c
>> +++ b/tools/usb/usbip/src/usbipd.c
>> @@ -544,6 +544,10 @@ static int do_standalone_mode(int daemonize, int ipv4, int ipv6)
>>   	dbg("listening on %d address%s", nsockfd, (nsockfd == 1) ? "" : "es");
>>   
>>   	fds = calloc(nsockfd, sizeof(struct pollfd));
>> +	if (!fds) {
>> +		err("calloc for fds");
>> +		return -1;
> 
> I don't think you tested this :(
> 
> You leak stuff here, right?
> 

Thank you Greg for the review.


longlong yan, I am very reluctant to take usbip patches without
solid evidence of a real bug that can be reproduced and the patch
fixes it.

I am seeing a few too many usbip patches these days that don't fix
any bugs.

thanks,
-- Shuah
