Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF0519DF0
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790090005; cv=none; b=aGS2KCyQLDjqfvXTa6Bz7kxmaF+d1zGGauH9pW+LPlRLQVLFEPIUdJNaUgXAjGyILW2/Kh5QkADHXZxwCYclwVOcveC805ijPCzINm8vsvHNrHTLBTlagOfj0Eq0Hjqf+y/4y6zPlrwi9SzWQJwEP+ffVTqXJXPMOXGgS8oipNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790090005; c=relaxed/simple;
	bh=V+7rsFQPKnOBAlz/LmYg2ZdalQA3vgQb/HuQrB2V3dU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=N3U8xQjwmgllPb7zYmVPq35w44VnUsHJkzi58XT91y1LvnOxCYCd4VO+qnHosoTu6/KowMIwP641r82GU72xxgk03EGAomv656sgO2hJYgMlputbCrsCCtLOJEaDHg9UtFbZlkbnOqBfvXfq5QhTRi5U3/QAYYHLPHF8T3872bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ccDAFl+W; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ccDAFl+W"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso5234563a12.3
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790090000; x=1790694800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8GaZEEmN9wNq82T/9Yu9vmbJ6QJ0MSvGHJAIrLmYMR8=;
        b=ccDAFl+WGZzjKVGFWYJdS8g/1qurWy5XMEGe54eSNxr3yJn8jUY1aTE7kkCP9oKWOI
         Q5aaqnl0TiDrZz5hT4Tt55RunzQxDZnUAHbgmHvpL5ZUy7O9jvBVX6lXZjXtbQhyfl++
         wNnrBeVSy2inQsONMB49cg2bOWFcD+SWCyj5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790090000; x=1790694800;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8GaZEEmN9wNq82T/9Yu9vmbJ6QJ0MSvGHJAIrLmYMR8=;
        b=m52yTG0O7+18qaXxdSKtSznQcn5nsWntsEGKeTHUqPL+nkPh1kpJaMoFeVPFq79v+H
         2c9PXT5IzG3WiAKjekPbvwXXjO9rnFGsUsHaILmTdP9ejJ11apW2wYkzMeOdqTQxJotg
         r7/t+Ed3g70gaMI2ICKli9ZpvKXh/CERX6qUGq3Si5e6agmhBlVDRgn1hKTIGSyrpIy7
         5LHG55C/1NYcuw6prIApl1iMqwuvbtGblF1+UAiEIhzRLD+24wuJ8WF79SwlsifswJx4
         4t/iPDXc8VpGHye/OP6kyzGMDNC8fn9nQvUpjAATMNS0fkTVXfPdeyFePJ/fVhuikIP+
         /JVA==
X-Forwarded-Encrypted: i=1; AKwUvByMO3PBj6lkeX+ioqZfq9yb/IPWNOGZrNm+q60PUHFDGzkSt4nffSMrqjw/kI6qzzG8cIWbxfa1sIM=@vger.kernel.org
X-Gm-Message-State: AFuF++ln36shQ2nr55N/1htyfj02B/8vrS7EdPWd/jV0ezeTbr2v+/FT
	KrCkzXzTYhhUZ3+Kf3FLRY6WCImlFVU6+kuscFR6AQtsq0hmMyk9bwqMy7dtX+fZ/78y8HP7str
	IOGvPri06Dw==
X-Gm-Gg: AYBFou3GTMkQtHFS64Rsszh9P7J3rAEUvExVjVvM4CGsstHwSrJNX3KBQoHnYmj7Gan
	1Ho/Z158oxxgE0phY2rHC0diFeRFxzRMvi+1Hnwlv7C9s8JZKbWVc1Uup4OWYyfNCDcDprI/h7x
	U3GnkxlsXSUSDl2rRX5Y9022xWS2gZmI+KTpNPosdDQOyn5F0HOtCZegd+zndUfgEGqyf0jcFP1
	04dQXIZCczH5uze0LtjlhjU3N0Fl5arfFFKk+DkoDkAnPVcGYNnG+FGMtvM5/IszzAB03o/OXgG
	BjBiJoNYF7jxECEPIGa+4gKPiscVVzuuUBIFwukik6fgVU+cGnR2BT8R++6jLJtyHd8RKIpKINU
	19x0AiwpW7M7hPOOvZLFVPQDrySi+QhI+vpGZ7Mc2Em9kx2Qnh0NxM7+yWowzBf6T76Kb8tqg8T
	2YYKTSdyLZvouJTZjykSYCzJUSpn5ks3R7ybgE5ubUJ+pQdSiv3l/FRvlrWQRHII2z77yqog==
X-Received: by 2002:a05:6402:3209:b0:6a7:ee54:f89e with SMTP id 4fb4d7f45d1cf-6aa531b8f50mr11963548a12.34.1790089999809;
        Tue, 22 Sep 2026 08:13:19 -0700 (PDT)
Received: from [10.214.128.75] ([38.97.137.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa44f9a77sm1278240a12.17.2026.09.22.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:13:19 -0700 (PDT)
Message-ID: <bc0459ae-390f-4d48-b517-53388b0c5452@linuxfoundation.org>
Date: Tue, 22 Sep 2026 09:13:14 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: fix wrong variable and double le16toh in
 list_gadget_devices
To: longlong yan <yanlonglong@kylinos.cn>, linux-usb@vger.kernel.org,
 valentina.manea.m@gmail.com, shuah@kernel.org, stable@vger.kernel.org,
 i@zenithal.me
References: <20260818020140.1863-1-yanlonglong@kylinos.cn>
Content-Language: en-US
Cc: Shuah Khan <skhan@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260818020140.1863-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 20:01, longlong yan wrote:
> In list_gadget_devices(), the sprintf() call for idProduct_buf incorrectly
> uses idVendor instead of idProduct due to a copy-paste mistake. This causes
> the displayed product ID of vudc gadget devices to always show the vendor
> ID instead.
> 
> Additionally, usbip_names_get_product() is called with le16toh() on
> idVendor and idProduct values that were already converted from
> little-endian to host byte order on the preceding lines. This double
> conversion produces incorrect vendor/product IDs on big-endian
> architectures, leading to wrong product name lookups.

Why isn't this a problem on little-indian? Shouldn't this double
conversion cause problem on both little and big endian systems?

> 
> Fixes: e0546fd8b748 ("usbip: tools: Start using VUDC backend in usbip tools")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>   tools/usb/usbip/src/usbip_list.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
> index 3d810bcca02f..85e6a8a1fc36 100644
> --- a/tools/usb/usbip/src/usbip_list.c
> +++ b/tools/usb/usbip/src/usbip_list.c
> @@ -298,13 +298,12 @@ static int list_gadget_devices(bool parsable)
>   		idVendor = le16toh(d_desc->idVendor);
>   		sprintf(idVendor_buf, "0x%4x", idVendor);
>   		idProduct = le16toh(d_desc->idProduct);
> -		sprintf(idProduct_buf, "0x%4x", idVendor);
> +		sprintf(idProduct_buf, "0x%4x", idProduct);

This is a good find. How did you find it and can you send me usbip list output
before and after this change on little and big endian systems? Are these systems
running linux?


>   		busid = udev_device_get_sysname(dev);
>   
>   		/* Get product name. */
>   		usbip_names_get_product(product_name, sizeof(product_name),
> -					le16toh(idVendor),
> -					le16toh(idProduct));
> +					idVendor, idProduct);
>   
>   		/* Print information. */
>   		print_device(busid, idVendor_buf, idProduct_buf, parsable);

thanks,
-- Shuah
