Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298572236F7;
	Tue,  7 Apr 2026 02:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529285; cv=none; b=WudODJPMFrdVKK9G9+4mTstZTHRS3qtqgHDlJbdby2WKLacOyW6VaZmPHFK6gqARPFeu64BV/8Uha2oCTwGHh57et76bYeBeab93+gZWEb7JhSSh0Tp3N1Rj2XwkBHd5QrAmGRRdUol2B1y/ABboEnn3cQ0IMQRa4Gb5mqqKZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529285; c=relaxed/simple;
	bh=DCVpwV8CJv49Fw7jvnahDPcP6K1p86JgWpJhsRipuzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BybsTPfwXWbCyDUHonZpn+kZKCGI0iTDlgU7/n7aY9cSbNU5oAHw72kCk4oVIw8UmUmV+zc2NjjsjGBAlfCi1udiQCvgGJfKhBjTCX1LTtESfelgByJmlIKIH8XhSbonuf+ASnT0A6tXD2FWSikcRVKPg08OD/yD6wo+T2NJaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dOLth4t2; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dOLth4t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=NVZ56ZW2ABj5q6V8BjqpCjSu/xsRKmS3w8Rcar5lorg=;
	b=dOLth4t2ZzWAPjt8V+YTNLk+c3mF8V6MmNC6JPrtBL3G6Xt5sxCzTstNzV9EJO
	kstm9IxwZBrJId1qz+9ZApJEMgR3IIA+irBDvWwDaiEFDDlyD204vd84g5P/wk2+
	bq1AdtJLMumfdteNYhO+x5gW/HLOjNVfj+IaiL9moll+Y=
Received: from [10.42.12.46] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCXvTYebdRpYCfJDg--.713S2;
	Tue, 07 Apr 2026 10:34:08 +0800 (CST)
Message-ID: <d862672a-878e-4208-9bb8-0044ed62b615@163.com>
Date: Tue, 7 Apr 2026 10:34:06 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usbip: tools: add hint when no exported devices are
 found
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <8d7000a9-981c-468a-bd4b-60111e0b77e9@linuxfoundation.org>
 <20260402083204.53179-1-min_halo@163.com>
 <83e82b09-a617-4e56-980c-563d8fba2045@linuxfoundation.org>
Content-Language: en-US
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <83e82b09-a617-4e56-980c-563d8fba2045@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXvTYebdRpYCfJDg--.713S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGryDXr4UJF45JFyDtr4fKrg_yoW5KrW5pF
	WUJFW0krWUJFs7WanF9F1xZFW0gw4qq3yFgrn3Jw1UurnrAasIgr9xtrnY9ayUGr4UX3Z2
	yFsIq3yDGa4UXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTCJdUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC0gDynmnUbSD7NgAA3D


On 2026/4/7 05:12, Shuah Khan wrote:
> On 4/2/26 02:32, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> When refresh_exported_devices() finds no devices, it's helpful to
>> inform users about potential causes. This could be due to:
>>
>> 1. The usbip driver module is not loaded.
>> 2. No devices have been exported yet.
>>
>> Add an informational message to guide users when ndevs == 0.
>>
>> Also update the condition in usbip_host_driver_open() and
>> usbip_device_driver_open() to check both ret and ndevs == 0,
>> and change err() to info().
>>
>> Message visibility by scenario:
>> - usbipd (console mode): Show on console/serial, this allows instant
>>    visibility for debugging.
>> - usbipd -D (daemon mode): Message logged to syslog, can keep logs for
>>    later traceability in production. Also can use "journalctl -f" to
>>    trace on console.
>>
>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>> Changes in v4:
>> - Printing behavior adjusted as suggested.
>> Changes in v3:
>> - Just add an informational message when no devices are found.
>> Changes in v2:
>> - Use system calls directly instead of checking sysfs dir.
>>
>>   tools/usb/usbip/libsrc/usbip_device_driver.c | 6 +++---
>>   tools/usb/usbip/libsrc/usbip_host_common.c   | 3 +++
>>   tools/usb/usbip/libsrc/usbip_host_driver.c   | 7 ++++---
>>   3 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c 
>> b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> index 927a151fa9aa..1dfbb76ab26c 100644
>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> @@ -137,9 +137,9 @@ static int usbip_device_driver_open(struct 
>> usbip_host_driver *hdriver)
>>       INIT_LIST_HEAD(&hdriver->edev_list);
>>         ret = usbip_generic_driver_open(hdriver);
>> -    if (ret)
>> -        err("please load " USBIP_CORE_MOD_NAME ".ko and "
>> -            USBIP_DEVICE_DRV_NAME ".ko!");
>> +    if (ret || hdriver->ndevs == 0)
>> +        info("please load " USBIP_CORE_MOD_NAME ".ko and "
>> +             USBIP_DEVICE_DRV_NAME ".ko");
>>         return ret;
>>   }
>> diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c 
>> b/tools/usb/usbip/libsrc/usbip_host_common.c
>> index ca78aa368476..01599cb2fa7b 100644
>> --- a/tools/usb/usbip/libsrc/usbip_host_common.c
>> +++ b/tools/usb/usbip/libsrc/usbip_host_common.c
>> @@ -149,6 +149,9 @@ static int refresh_exported_devices(struct 
>> usbip_host_driver *hdriver)
>>           }
>>       }
>>   +    if (hdriver->ndevs == 0)
>> +        info("Please load appropriate modules or export devices.");
>
> Is this message needed here in refresh_exported_devices()?
> usbip_host_driver_open() and usbip_device_driver_open(), the
> only two callers of refresh_exported_devices() print info
> message with this change?
Shuah,

Actually, refresh_exported_devices() has more than two callers:
1. usbip_generic_driver_open() (called by both usbip_host_driver_open()
    and usbip_device_driver_open() functions)
2. usbip_generic_refresh_device_list() (called via usbip_refresh_device_list
    from process_request())

As we discussed earlier, placing the message in refresh_exported_devices()
covers all scenarios: usbipd startup, usbip list -r, and usbip attach.

usbip_generic_driver_open() is called only once at initialization.

Best regards,
Zongmin
>
> thanks,
> -- Shuah

