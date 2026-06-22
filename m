Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF31283FE6
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 19:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782156022; cv=none; b=Zpqh3TNNuzKMkKQhkqVy660Ox4IfDAYPkOXg7o1eW6uPF10rLU0kBXglWTyMTAYCWqQaebyyfsumykjhoXbS1hEOf1TsiO2Y3b7XgCac/C8x3XI/TwU/04u3wNmh28zPeQmMEcybP0uB7p48DEZUIXRk7URPIEr0KB8eruOcRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782156022; c=relaxed/simple;
	bh=j/h+URImDdxSyb0+bU+8F0V9rJuPI+Pnc3VjZ6LMoEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oakN0Dx0iv5CTWWI/x5rHSnvPMJaiMq976AKPhVPowhy3/C6c8Yp7kbz+ApozTEu0O2Tqo+SsYQMVov2TcWlND8XgwF4TTaY9gAgtnIlZzboIdNU2kksX9RJbnH5pxsnWOVizDfPmH4UWbNsA0bB9nzz2vkHHYY3u1X0GKFHzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F9Yqzx1e; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F9Yqzx1e"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6d991991dso3965546a34.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1782156018; x=1782760818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqKEqkgorRteBv1u8AcOLPP9p3Ks9lbIdi91P4utQN8=;
        b=F9Yqzx1eHDUCizjeNFE1t7u6ubgKrGBklA/Kqfg+XsLHJrdqq2c4hkde6+T+KaBh+o
         DX6Dr5enlNPU2LKz+3YVtuEVuTSuS3HX3/8lZs/qsEDHXvKg4cKJtS1gPbEirVzZF6rB
         oLrDHOnn3/OIGg1MmsPWg81IQ+sSZk0/cIEXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782156018; x=1782760818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqKEqkgorRteBv1u8AcOLPP9p3Ks9lbIdi91P4utQN8=;
        b=G4bQWa5XIoN3ghFnKw30rVKxXEuV5TnsCYuldZ73mpexaoV72VGkJ0b6PPB4PlgT1f
         GlWZEpZJEOQKlBSvW2+Vlj7R/npxm1rUJso7GQxyTWQtX2pLUWrnJhnItBqcGYELNqxi
         SSNAUTRgV2RW+z02bdyTa8aANyDnQJffH4Re62ZoTpAlv1+m0yvcqEUo/HLkuqlHqUkE
         Ioc3lYRLHrJDUhVe1OdvWAGgfBVVqqZPypqNAB0XOo6MTSsDWwGQxkpl+bDYyaZBZ9ar
         ayBK10exH6xH7WdqiuFOgyTd4QpuVYVWRGLID1vo+2rfwJ7IWL0EDQgpR1KqtuFpLL47
         3JTA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rsokbq7V2b0dXSuuxv+9vifdhUuyZAYIWfF/cduSyHiPFeqZ54jH23klFj1s3bbNmPhBoPi8tZYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxe8Zs74Dq+lPgzuY1PT8+XLXlytML4PN3lROrZWD9lHzfVvVO
	tU8nhr+HIjSDmFUo+vafOjedbC9zb1Tcz6DGGHlV8pXxaXK7f0SSkkpxmJjm6Y2P2N8=
X-Gm-Gg: AfdE7ckHNfipBKQVPxzerp+Lf+QJlUmgOtMhpSGnh8iuU6Z8vAH551FtflfmiA2yrKf
	vwy68q6XdfnznSdodaO04vZmBOBTfu+h+NaEHWjP1FKvB7DXnZQEznp5hzB83drZc15YnOF8Aat
	Ys+vTDZHa+vSX08M5hQJFpfjSGXKbKWpqLO4Uun/ZcZGo/c5gfNpumgzZRhVRz6/FB/KyKhXRX+
	vMywjaCxye7L+wbVFDWvq5wUb1KfrXAkVyuqIC+Qj7pdZd7N4aQoReid43A7EEm3hQvoLdSueT/
	DEL6Rz2thXuOweco37v0AbCpObgk0iSk2Uu3cLHo1g5K62cypfNARN7jW0STb1x8B9m+TuCVzDG
	UL1wmRoAOeYoHj5awcJLztwa/qtRJuKnKpm0ra/aWSdnh53EMPnZcOOgppvugLDJGwlPtpZmZm3
	C9fxSNxusJE2S1pvTlPRyC
X-Received: by 2002:a05:6808:120b:b0:489:4d48:56e7 with SMTP id 5614622812f47-4896ac031e1mr14500472b6e.25.1782156018429;
        Mon, 22 Jun 2026 12:20:18 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aedf23f7bsm5336450b6e.11.2026.06.22.12.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 12:20:17 -0700 (PDT)
Message-ID: <d2c461a4-9271-43b5-9ba4-8c3c9c63c134@linuxfoundation.org>
Date: Mon, 22 Jun 2026 13:20:16 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: support SuperSpeed Plus devices
To: raoxu <raoxu@uniontech.com>, valentina.manea.m@gmail.com
Cc: shuah@kernel.org, i@zenithal.me, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1B3C4D10DA532DC9+20260622100802.377751-1-raoxu@uniontech.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <1B3C4D10DA532DC9+20260622100802.377751-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/22/26 04:08, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> USB/IP reads a remote device's speed from the server-side sysfs
> "speed" attribute. read_attr_speed() converts the string to
> enum usb_device_speed before the value is sent to the client.
> 
> The conversion table only recognizes 5000 Mbps. Devices reporting
> 10000 or 20000 Mbps are therefore sent as USB_SPEED_UNKNOWN. The
> client then selects a USB 2.0 VHCI port, and the kernel rejects the
> attach request because USB_SPEED_UNKNOWN is not a supported speed.
> 
> Map both SuperSpeed Plus sysfs values to USB_SPEED_SUPER_PLUS and
> select the SuperSpeed VHCI hub for that speed.
> 
> The issue was reproduced with the following server hardware:
> 
>    xHCI controller: Intel 8086:a0ed, revision 20
>    Subsystem:       Lenovo 17aa:382a
>    USB device:      Silicon Motion 090c:2320 mass storage
>    sysfs speed:     10000 Mbps
> 
> Before the change:
> 
>    $ usbip attach -r 10.20.12.170 -b 2-2
>    usbip: error: import device
> 
> After the change, the device attaches and uses usb-storage:
> 
>    $ usbip port
>    Port 08: <Port in Use> at Super Speed(5000Mbps)
>      8-1 -> usbip://10.20.12.170:3240/2-2
> 
> VHCI currently exposes the imported device as SuperSpeed, so the
> client reports 5000 Mbps instead of 10000 Mbps. This is a separate
> speed-reporting limitation and does not prevent attachment or I/O.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   tools/usb/usbip/libsrc/usbip_common.c | 2 ++
>   tools/usb/usbip/libsrc/vhci_driver.c  | 1 +
>   2 files changed, 3 insertions(+)
> 
> diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
> index b8d7d480595a..d91872a425f5 100644
> --- a/tools/usb/usbip/libsrc/usbip_common.c
> +++ b/tools/usb/usbip/libsrc/usbip_common.c
> @@ -29,6 +29,8 @@ static const struct speed_string speed_strings[] = {
>   	{ USB_SPEED_HIGH, "480", "High Speed(480Mbps)" },
>   	{ USB_SPEED_WIRELESS, "53.3-480", "Wireless"},
>   	{ USB_SPEED_SUPER, "5000", "Super Speed(5000Mbps)" },
> +	{ USB_SPEED_SUPER_PLUS, "10000", "SuperSpeed Plus" },
> +	{ USB_SPEED_SUPER_PLUS, "20000", "SuperSpeed Plus" },

These are duplicate strings? Shouldn't they
be unique?

>   	{ 0, NULL, NULL }
>   };
> 
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

Won't this continue when hub == USB_SPEED_SUPER_PLUS?
Doesn't look right to me.

>   				continue;
>   		break;
> --
> 2.50.1
> 

thanks,
-- Shuah
