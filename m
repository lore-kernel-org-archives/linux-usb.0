Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B263C5540;
	Thu,  2 Apr 2026 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130937; cv=none; b=eCLtuwlv32e7I95cKQhQgsIrKKE/wAxHSDYLeIiLVqmWU9LZbZI0JxhRbwIFoHnbdm4Z/5nIJkfwzREnSiqF33y6SeVnSZRMvf4aLm8AbagV/7KnORQWFqtXcvy/a+UzVWfbzb3z2So2UI3UJ403DNUf6rNV+2TdKsJTpxn0owQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130937; c=relaxed/simple;
	bh=8dKPwEZK0EhVu+2pOF8nmqB1qHDzQ9h2mn+aioqId9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q1F3YQS/qt1cJUWVts6HgJTxDqUwcNPZPSBUWw2/ZLyMZU+VqelCSzwHoTXgVicaLukCSkJ/u6EXgYJI2cTK9267ZWxLgh++Da61Ck5v//Ve6ee2D8cNm3YFFxWVIaFxPPtbZsVjDwBSlC4zZmcoPwH81him2IDJ10N5sn9kFBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=GAklXbuD; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=GAklXbuD; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="GAklXbuD";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="GAklXbuD"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ywv+qzuUlgKNjIPtV7UVr0n2CwXwvA1rhtGPcFqH3Fs=;
	b=GAklXbuD38bmIhpunLlbpyC2XC8klDoT+OIkQJuwMDiuKZk4GBodDAOv3i2b39bKOuJ5gy6ip
	pUjRcK/mNb7oeV81SZWTmWgEOeWNBiHY0C7N4j7EGU6PXi5ow5jQGKxG+CRuUmzs5M7b5ZS3CZo
	FP7yHN7IQBIFOT7jgZdBr6w=
Received: from canpmsgout02.his.huawei.com (unknown [172.19.92.185])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fmgJp4HD5z1BG5b;
	Thu,  2 Apr 2026 19:55:06 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ywv+qzuUlgKNjIPtV7UVr0n2CwXwvA1rhtGPcFqH3Fs=;
	b=GAklXbuD38bmIhpunLlbpyC2XC8klDoT+OIkQJuwMDiuKZk4GBodDAOv3i2b39bKOuJ5gy6ip
	pUjRcK/mNb7oeV81SZWTmWgEOeWNBiHY0C7N4j7EGU6PXi5ow5jQGKxG+CRuUmzs5M7b5ZS3CZo
	FP7yHN7IQBIFOT7jgZdBr6w=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4fmg9z10MszcZyt;
	Thu,  2 Apr 2026 19:49:11 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id B61B74056E;
	Thu,  2 Apr 2026 19:55:17 +0800 (CST)
Received: from [10.164.148.136] (10.164.148.136) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 2 Apr 2026 19:55:17 +0800
Message-ID: <85ad518a-f87f-4ca6-a11c-1ccc37d60bd1@huawei.com>
Date: Thu, 2 Apr 2026 19:55:16 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
To: Michal Pecio <michal.pecio@gmail.com>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <20260402114421.738e375a.michal.pecio@gmail.com>
From: "Xuetao (kirin)" <xuetao09@huawei.com>
In-Reply-To: <20260402114421.738e375a.michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk100018.china.huawei.com (7.202.194.66)



在 2026/4/2 17:44, Michal Pecio 写道:
> On Thu, 2 Apr 2026 10:14:00 +0800, Tao Xue wrote:
>> As specified in Section 4.14.2 of the xHCI Specification, the xHC
>> reserves bandwidth for periodic endpoints according to bInterval and
>> wBytesPerInterval (Max ESIT Payload).
> 
> For SuperSpeed endpoints, yes.
> This follows from USB3 spec 9.6.7.
> 
>> Some peripherals report an invalid wBytesPerInterval in their device
>> descriptor, which is either 0 or smaller than the actual data length
>> transmitted. This issue is observed on ASIX AX88179 series USB 3.0
>> Ethernet adapters.
> 
> Damn, it really does.
> 
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0008  1x 8 bytes
>          bInterval              11
>          bMaxBurst               0
>          wBytesPerInterval       0
> 
> Any other examples besides AX88179?

We tested 18 different USB 3.0 docks, but they only contained two 
different types of USB 3.0 Ethernet devices based on VID/PID.
The dwc3 controller works fine with all of the devices mentioned above. 
The other USB host controller works fine with all 12 Realtek devices,
but fails with all 6 ASIX devices.

1. Realtek USB 10/100/1000 LAN (12 devices)
All 12 devices share the same VID/PID and descriptor values.

VID = 0x0BDA, PID = 0x8153
wMaxPacketSize = 0x10
bMaxBurst = 0
wBytesPerInterval = 0x8

2. ASIX AX88179 USB 3.0 to Gigabit Ethernet Adapter (6 devices)
All 6 devices share the same VID/PID.

VID = 0x0B95, PID = 0x1790
(a) 4 devices:
wMaxPacketSize = 0x10
bMaxBurst = 0
wBytesPerInterval = 0x0

(b) 2 devices:
wMaxPacketSize = 0x10
bMaxBurst = 0
wBytesPerInterval = 0x8

We also tested 3 different USB 3.0 camera devices. On all of these 
devices, the wBytesPerInterval of all SuperSpeed isochronous endpoints 
is equal to Mult * wMaxPacketSize * (bMaxBurst + 1).

> 
>> These errors may lead to unexpected behavior on certain USB host
>> controllers, causing USB peripherals to malfunction.
> 
> Out of curiosity, Bandwidth Overrun Error or something worse?
> 

This host controller reports a Babble error.

> It's an oversight that these URBs aren't rejected with EMSGSIZE in the
> first place. IIRC zero-length interrupt transfers are allowed by USB
> specs and a zero-payload endpoint is probably legal per xHCI, but then
> submitting non-empty URBs to it is not.
> 
>> To address the issue, return max(wBytesPerInterval, max_payload) when
>> calculating bandwidth reservation.
>>
>> Fixes: 9238f25d5d32 ("USB: xhci: properly set endpoint context fields for periodic eps.")
>> Cc: <stable@kernel.org>
>> Signed-off-by: Tao Xue <xuetao09@huawei.com>
>> ---
>>   drivers/usb/core/usb.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
>> index e9a10a33534c..8f2e05a5a015 100644
>> --- a/drivers/usb/core/usb.c
>> +++ b/drivers/usb/core/usb.c
>> @@ -1125,6 +1125,8 @@ EXPORT_SYMBOL_GPL(usb_free_noncoherent);
>>   u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>>   				      const struct usb_host_endpoint *ep)
>>   {
>> +	u32 max_payload;
>> +
>>   	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
>>   	    !usb_endpoint_xfer_int(&ep->desc))
>>   		return 0;
>> @@ -1135,7 +1137,12 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>>   			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
>>   		fallthrough;
>>   	case USB_SPEED_SUPER:
>> -		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
>> +		max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst + 1);
>> +		if (usb_endpoint_xfer_isoc(&ep->desc))
>> +			return max_t(u32, max_payload * USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
>> +					ep->ss_ep_comp.wBytesPerInterval);
>> +		else
>> +			return max_t(u32, max_payload, ep->ss_ep_comp.wBytesPerInterval);
> 
> Obviously a kludge is necessary here to make these abominable devices
> work reliably with xHCI, but OTOH exceeding wBytesPerInterval violates
> USB3 9.6.7 and it's unclear if all devices would be happy.
> 
> There are devices which define such odd isochronous alt settings with
> apparent intent to allow fine-grained bandwidth reservation:
> 
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               1
>          bMaxBurst               0
>          wBytesPerInterval     512
> 
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               1
>          bMaxBurst               0
>          wBytesPerInterval    1024
> 
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               1
>          bMaxBurst               1  # 2 packets per interval
>          wBytesPerInterval    1536
> 
> Isochronous drivers use this function to size their URBs or select the
> right altsetting for given bandwidth. UVC has obeyed wBytesPerInterval
> since forever with no apparent issues and UAC has recently been patched
> to work like that too with no issues so far AFAIK.
> 
> Maybe start with something specific to the known bogus hardware, i.e.
> interrupt endpoint with one packet and zero payload? In such case
> it's high chance that the device actually meant it to be wMaxPacket.
> 
>>   	default:
>>   		if (usb_endpoint_is_hs_isoc_double(udev, ep))
>>   			return le32_to_cpu(ep->eusb2_isoc_ep_comp.dwBytesPerInterval);
>> -- 
>> 2.17.1
>>

