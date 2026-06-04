Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03E37F007
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780544651; cv=none; b=I1AaTFFZYx+NKBpFfXUylGaIvYB9OEVeZ47POuezL99SlhSRW1mZwvMnnmg68sXbMH5epra6WrkedbRf/GOSNo+IHfLP81JAV1MDC9b428ECLQvnd/gX7+nXLBF9lbpA3o7vahE/YQr5wTGQpZbnsK0PIic4eaNBBqu/q2+jAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780544651; c=relaxed/simple;
	bh=GVUrTFHWfKbP7BPQBwxHjJiAldO45+2g44/XMUp4QN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWpxXHkd4568qvPOhoJQYia2YnK0sKHXrtDpEP+2wPNLaCGYuG88Dcs9DaHBWCQEEio9Bogs5MhMsB48mqQT+fzy55qpf9kbi7derfkOsHaBAgt3a0OnM62PEpr1eAuvD1vGvKu+XwLkqPqgGRbYwQ5UOoPmI+EIPNU2XOqgzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm/xXaND; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm/xXaND"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0b7ca8831so528415ad.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 20:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780544649; x=1781149449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzk72M4ewlzxGUDCkZjiIwUqM5Q/ys2Vzl6V4FwZ3I0=;
        b=cm/xXaNDWZc6oiRkYiEf3rhI5Frq8BcsTM1UEm2qaHQvktdYOZN/Lj1rPnYwq7ts60
         k36L6mfiY3xKnFBaCLH7tjRWHaZW6D6t5FJeYqFWLEjHKmRiByEJEm/RzXaGMhAhpdoi
         Colrdn8Jxh8TMaKjgDgFWDBddXIEaNQvOgoKMfSiHcXeq4xfycXeQGWCER5uDnKOd/Hm
         1/+sYJrINtKiRg4nL8pqmljlsl5wTqumsktClDX8yhE+dWExpxnX9zFl+m0jpg8mu8cT
         q4UssRPU3sHZX1gFO5m4zve+Olxd0U5d8/qR+mOVFTwV+9iT7bgMZbEnZj8L0T8tSJQN
         zjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780544649; x=1781149449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dzk72M4ewlzxGUDCkZjiIwUqM5Q/ys2Vzl6V4FwZ3I0=;
        b=jdxkTb4aT+Cpx+DsX47EolwcmPHf5FVPEDEchbWtnIh9Ji9jXctO97AJQHY+eMqo2W
         YOLMyJLTEa16eRGlu3FuNOhq3gfLBV+Chqcxv+zXwJaIVscbwOfG3rPeaGBMKUhimb0e
         dRpF6I9hFHsB7ASGaKWSJeN3R77xW2XPMR56KlG2O6VeJd/oioFMRCGKNtRLqZo95WuO
         FgsT+nNd/SDjUdUji9KMDSfAlsdCDNihy6wICIn+unNYxQbSnJd7Hh5Sf/ZPc3vsDvvH
         RXwir0MPeOt5nZV65ytyY1kt2NnLs4b2kNRjSDmyHY9NMwe+3y86vVYwILw53bTeSU8f
         tfVQ==
X-Gm-Message-State: AOJu0YzSfcVAlV/ba9XfWgwbrrwZCDJeCHf7GdnzFD4hxS1ycWcd2I3i
	3hKyrfJl0b8oulei/mN7uvO9t1AvgFbC6w6cCfcGwDWph+MBP0JbEBn5RKmbs1pA6U8=
X-Gm-Gg: Acq92OEvoT9NTaHR03kCA69BRE0X00jy8CSVdvQK2zEb1s1qyL1OecJCfPGBwk3aFXB
	u1j93O8B5Hg0K9nCPE1bJzmq6MjfmCqczqQgWPyuzrJjPwGpxXDC7g3CWULb4PZ/pOMT/oD9o/6
	ftRC1IScwPnuF9x1hWWSeZX3BAmzBwPzJCgvpBh/626E4blTPxC6DOFETHwqeKAokKmqV5o5oq/
	vQoLOdLn2bwjN4lk9KY1NAKK4FEVu5pW9jwn3BEiGf4oQSRjx+Xor5VBTb2qjVH6kQJbAEvxyYK
	Zf+Q4UzJ/6oBBmiWrtJrl93Jr9KiE0sUM/xMTXkAdVBlmKRyISyN+k4eG/6tAXCmx231l34rt8W
	C3DkdYAu+F5PzogPubuiwDa0+/rlR4+vjzhR/CIQTnE1BWbkHIIULcFAH0S5FREl3quCf3i6qkA
	AFVBc38CJ5IAWk0MwmGmMDiyFf6MC9D7U3XLV4faL5br3M
X-Received: by 2002:a05:6a21:1519:b0:38b:d93f:bbf5 with SMTP id adf61e73a8af0-3b4b8115151mr578811637.0.1780544648870;
        Wed, 03 Jun 2026 20:44:08 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.166.161])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c85df043216sm3684818a12.10.2026.06.03.20.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 20:44:08 -0700 (PDT)
Message-ID: <e56c532c-921d-4e3c-bc34-47373068f3d3@gmail.com>
Date: Thu, 4 Jun 2026 10:44:03 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
To: jackbb_wu@compal.com, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-06-04 09:04, Jack Wu via B4 Relay wrote:
> From: Jack Wu <jackbb_wu@compal.com>
> 
> Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81ea Rev= 5.04
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> - Link to v1: https://patch.msgid.link/20260601-dw5826e-option-driver-v1-1-e0a0a72cfe1b@compal.com
> 
> To: Johan Hovold <johan@kernel.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v2:
>   - Blacklist interface #1 (ADB) using RSVD(1)
> ---
> ---
>   drivers/usb/serial/option.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 48ae0188f2e9..070e0c553d7a 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -203,6 +203,8 @@ static void option_instat_callback(struct urb *urb);
>   #define DELL_PRODUCT_5829E_ESIM			0x81e4
>   #define DELL_PRODUCT_5829E			0x81e6
>   
> +#define DELL_PRODUCT_DW5826E_ESIM	0x81ea
> +
>   #define DELL_PRODUCT_FM101R_ESIM		0x8213
>   #define DELL_PRODUCT_FM101R			0x8215
>   
> @@ -1125,6 +1127,8 @@ static const struct usb_device_id option_ids[] = {
>   	  .driver_info = RSVD(0) | RSVD(6) },
>   	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
>   	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },
> +	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_DW5826E_ESIM, 0xff),
> +	  .driver_info = RSVD(1) }
>   	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },	/* ADU-E100, ADU-310 */
>   	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_500A) },
>   	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_620UW) },
> 
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-dw5826e-option-driver-e9bac038e2b5
> 
> Best regards,
> --
> Jack Wu <jackbb_wu@compal.com>
> 
> 
> 
Thanks, it looks fine to me now
Reviewed-by: Lars Melin <larsm17@gmail>
