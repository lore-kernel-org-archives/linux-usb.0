Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F2288BA
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782402524; cv=none; b=tXjt5Sk+YpDTXO4TUSAtYBWilsLB1Hvqofl2u2cLmB4J1LwJxPA8wNNvsMOsgA/wDHNMOH7geVF+tAnUNoXPm764WYJHfz1V0oqq+4oqgiN9MozdC9ZCDTp1TzId0zS7dh6dd+WuIPeL36DTA1xQbjpjYR9d8m7PPNlN8vekQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782402524; c=relaxed/simple;
	bh=sCwojiFVvX7kd/Rk8l/ktH87rhYVen5QJMkjzVGe6v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elEuUsVjwgtN2Zb8ZeifTZLtbgpGCcsovVzJVocfmKIGE27FDLosKcj9Cl+vh+WW6C+vcV9MrPfBvI2+vowT9QZ6gbxTLX31FR/1JzSD1JGild1dVnHB6wS9HY0/2lrekk9sD3ZA+0d8Aq9L8nyDcFf42PfGxZyW9BInu4lgpyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WGTqlsmz; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WGTqlsmz"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4471fc9e933so1079862fac.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782402522; x=1783007322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3Di0Z5TSWm8aYxLWNKsOX3Bf5Uoik2bldczZ7u1zrM=;
        b=WGTqlsmzMFirNYjyalyvPU3RImW3yBtk+xb6cHGrYsXuWiBqZg01p8RiUzD74ZC4vt
         udoOqwb7d46wxN0wWjX30q3H58h8rC4zltk+5vSzyfNQ4EisIZ6uTDTO05r3zzeTX8qm
         4SqPZS75Qgi3q/ciorL5HPNdyt14ew/AijcEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782402522; x=1783007322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3Di0Z5TSWm8aYxLWNKsOX3Bf5Uoik2bldczZ7u1zrM=;
        b=CH0EN+T5Sv6UGnzlZR0VJ/LhpxZhSfw6B9nMQGEdLbSB8ocyLLJLdZIkikWfg+Nox7
         n3O5zPFYJJUFxQHY+a1GzemfVdY1FFnN4y5zJ//Te1UyCCdXtoP4QTINfrJeVEUrtMzI
         X8Xm50tqhDLuSVAtRnSvEIKv1w53dc4bJTmHNzO8Isf2zkhreDE/LHRjppWdtLf2qUUP
         XYQ/qHKfuiLamPMVGWSqCcHCGHgZncIHrmaT1k8Ip8+6QtD3k2k1Vh6pY5fJgYiC97OM
         ZfoQnWeZK6zf3FV0jK6xL0QiCzidXBBomOylm9y8/46s2dPhhZCV3EXPkjNXiVj4x9Yi
         LZqg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh5XLnD3VzLRYbudobV5jdPviFtr9F+RPuxHbtadXPmKde24aP2aaals03tlivfRWBh3EPMMOGCFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzahM488q5NtskEzx/4waCitzvrPiYnjjRMu1mFGZVbgqa+MzEL
	RSLir5UwrsUmKQ9q7ibG96vdig4Gm1w14k3qr9oqjLag68g2erDEMZiy4HeHwoVIox8=
X-Gm-Gg: AfdE7ckChJVauRQlGFIk4Xf1cnqID++507RNE9fS6PdLBAikGYFuhp3P7rfyME84D3U
	A2SHDKPv4qHtwoCwwnjc0OUA3pkiMNQNMdcZ1l9Zh7NrSfJFpaev73z1HH1dvEF6ZYxq3Wcm9sU
	VPPi7DA9Bae44V+IAgXo7tRlCWmScWnc8hjnKzeItKTVyvKFgyj+bn3fGLALklGdOsyNix8jFA/
	D7AqhwFMMhI1b7q5hkOMlfyz/OPGvlLO5029nHEktIkCSh83NJMgOlJPV/JmmIobTmG1W8z8Sqj
	7FaUV+tNOxIZUDnzQEmgCk6ros0cb5KmywuLlapDLgpoBaXlSIZD1xvhWWV/eK+0z8iIRD+4bGn
	Q+OIXwV2bYUfyeChNu83ZvgVzTXnlSnOkybW4Za1NRtqD//2AJES80p+daHvtvoJNFtfeAlH3fQ
	a3g015DW+6xSkvpuK3l4/A
X-Received: by 2002:a05:6871:206:b0:430:29c3:9d15 with SMTP id 586e51a60fabf-44811ca5f7emr2511128fac.1.1782402522067;
        Thu, 25 Jun 2026 08:48:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472eccb19asm13542095fac.6.2026.06.25.08.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 08:48:41 -0700 (PDT)
Message-ID: <46d758d2-090a-414f-8d1c-0791f8bf5b8d@linuxfoundation.org>
Date: Thu, 25 Jun 2026 09:48:39 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: support SuperSpeedPlus devices
To: Yichong Chen <chenyichong@uniontech.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: i@zenithal.me, gregkh@linuxfoundation.org, zhouzongmin@kylinos.cn,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <00C828F338E43447+20260617020613.199086-1-chenyichong@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <00C828F338E43447+20260617020613.199086-1-chenyichong@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/26 20:06, Yichong Chen wrote:
> USB devices running at SuperSpeedPlus report "10000" or "20000" in
> their sysfs speed attribute. usbip currently maps only "5000" to
> USB_SPEED_SUPER, so a SuperSpeedPlus device is imported as
> USB_SPEED_UNKNOWN.
> 
> The attach request is then rejected by vhci_hcd:
> 
>    vhci_hcd: Failed attach request for unsupported USB speed: UNKNOWN
> 
> Map the SuperSpeedPlus sysfs speed values to USB_SPEED_SUPER_PLUS, use
> the SuperSpeed VHCI hub for SuperSpeedPlus devices, and recognize the
> gadget current_speed string used by the kernel.
> 
> Fixes: b2316645ca5e ("usb: show speed "10000" in sysfs for USB 3.1 SuperSpeedPlus devices")
> Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
> ---
>   tools/usb/usbip/libsrc/usbip_common.c        | 2 ++
>   tools/usb/usbip/libsrc/usbip_device_driver.c | 4 ++++
>   tools/usb/usbip/libsrc/vhci_driver.c         | 1 +
>   3 files changed, 7 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
> index b8d7d480595a..f4734f552d31 100644
> --- a/tools/usb/usbip/libsrc/usbip_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_common.c
> @@ -29,6 +29,8 @@ static const struct speed_string speed_strings[] = {
>   	{ USB_SPEED_HIGH, "480", "High Speed(480Mbps)" },
>   	{ USB_SPEED_WIRELESS, "53.3-480", "Wireless"},
>   	{ USB_SPEED_SUPER, "5000", "Super Speed(5000Mbps)" },
> +	{ USB_SPEED_SUPER_PLUS, "10000", "Super Speed Plus(10000Mbps)" },
> +	{ USB_SPEED_SUPER_PLUS, "20000", "Super Speed Plus(20000Mbps)" },
>   	{ 0, NULL, NULL }
>   };
>   
> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> index 1dfbb76ab26c..c9b3619d86f3 100644
> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> @@ -57,6 +57,10 @@ static struct {
>   		.speed = USB_SPEED_SUPER,
>   		.name = "super-speed",
>   	},
> +	{
> +		.speed = USB_SPEED_SUPER_PLUS,
> +		.name = "super-speed-plus",
> +	},
>   };
>   
>   static
> diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
> index 8159fd98680b..4ca3783ee5b7 100644
> --- a/tools/usb/usbip/libsrc/vhci_driver.c
> +++ b/tools/usb/usbip/libsrc/vhci_driver.c
> @@ -338,6 +338,7 @@ int usbip_vhci_get_free_port(uint32_t speed)
>   
>   		switch (speed) {
>   		case	USB_SPEED_SUPER:
> +		case	USB_SPEED_SUPER_PLUS:
>   			if (vhci_driver->idev[i].hub != HUB_SPEED_SUPER)
>   				continue;
>   		break;

This looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah

