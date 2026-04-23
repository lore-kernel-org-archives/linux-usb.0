Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890B92222CC;
	Thu, 23 Apr 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776956152; cv=none; b=E1NBMLz09Ia3UDeWOlV92269JZzVu8UH/xjdw3NXxS4QruGLakrVqMYd1bfl8njn0t+FdjXs1LOtJCWu78dclt3tucLY+YbQLUea8dGA/o+ETf/s5pffXmIEfMTyzknnvFCq8nvEJu8H53mDtiXbRN6H0zP4BMPZ99M7giz+L70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776956152; c=relaxed/simple;
	bh=CS5nDsdvJN6eRA9ml/s2r4StPWrJH8Jfg0QQbf9gcGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FMD1c8ziWRSEfIY6Yo7vQ9QCb7a3izCz8YLlnICfeewfPV1f3J7mV35PUwD0z9bGlvSrAObmHbMmMO7dBafNvitboxsgGCFbllKrM6wnLCS24T3vg1J60ACCuPn1BzPH12gwNQRVLOYCZR0IxfDs/bCpPzMJbZKGGUBvA0EyyP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=TTeG7v7D; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="TTeG7v7D"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Jdftkmk80qoqcBBGjWt+Qw2nz+05vyuj9sVwyf/+MXA=;
	b=TTeG7v7DWw+71UiIAzBVyMZGahZr+emHwfYfbQIvdymJgCD6AC6Zb9ilQUXJCc1ts5yCuOaF1
	YLX8c2Vfctu2I+mbAINd0f2PDVGyS0vO6Bvo+awL1Drz0uazL0dETzYUq8/1JS97Hd7bC1F4Rar
	wCBjFRtMR/XE3JZ52G8UX8c=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4g1f9k6HstzcZyN;
	Thu, 23 Apr 2026 22:48:58 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id F13FF4056D;
	Thu, 23 Apr 2026 22:55:43 +0800 (CST)
Received: from [10.164.148.136] (10.164.148.136) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 23 Apr 2026 22:55:43 +0800
Message-ID: <132cd569-44e3-4a0a-853c-1feb43500cb8@huawei.com>
Date: Thu, 23 Apr 2026 22:55:42 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: core: Fix up Interrupt IN endpoints with bogus
 wBytesPerInterval
To: Alan Stern <stern@rowland.harvard.edu>, Michal Pecio
	<michal.pecio@gmail.com>
CC: Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
 <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
 <2026040221-reclusive-garland-6281@gregkh>
 <c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
 <00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
 <20260423110517.664745da.michal.pecio@gmail.com>
 <20260423110648.158ec861.michal.pecio@gmail.com>
 <20260423110959.0e2f1a4e.michal.pecio@gmail.com>
 <0ae0316b-90e4-469f-990b-408518f09056@rowland.harvard.edu>
From: "Xuetao (kirin)" <xuetao09@huawei.com>
In-Reply-To: <0ae0316b-90e4-469f-990b-408518f09056@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk100018.china.huawei.com (7.202.194.66)



在 2026/4/23 22:04, Alan Stern 写道:
> On Thu, Apr 23, 2026 at 11:09:59AM +0200, Michal Pecio wrote:
>> Tao Xue found that some common devices violate USB3 section 9.6.7
>> by reporting wBytesPerInterval lower than the size of packets they
>> actually send. I confirmed that AX88179 may set it to 0 and RTL8153
>> CDC configuration sets it to 8 but sends both 8 and 16 byte packets:
>>
>> S Ii:11:007:3 -115:128 16 <
>> C Ii:11:007:3 0:128 8 = a1000000 01000000
>> S Ii:11:007:3 -115:128 16 <
>> C Ii:11:007:3 0:128 16 = a12a0000 01000800 00000000 00000000
>>
>> Most xHCI host controllers neglect interrupt bandwidth reservations
>> and let such devices exceed theirs, some fail the URB with EOVERFLOW.
>>
>> Assume that wBytesPerInterval lower than wMaxPacketSize is bogus and
>> increase it to the worst case maximum on interrupt IN endpoints. This
>> solves xHCI problems and appears to have no other effect. Interrupt
>> transfers are not limited to one interval and drivers submit URBs of
>> class defined size without looking at wBytesPerInterval. Any multi-
>> interval transfer is considered terminated by a packet shorter than
>> wMaxPacketSize regardless of wBytesPerInterval - see USB3 8.10.3.
>>
>> Stay in spec on OUT endpoints and isochronous. No buggy devices are
>> known and we don't want to risk sending more data than the device
>> is prepared to handle or confusing isoc drivers regarding altsetting
>> capacities guaranteed by the device itself. And don't complain when
>> wMaxPacketSize <= wBytesPerInterval < wMaxPacketSize * (bMaxBurst+1)
>> because enabling this seems to be the exact goal of the spec.
>>
>> Reported-by: Tao Xue <xuetao09@huawei.com>
>> Closes: https://lore.kernel.org/linux-usb/20260402021400.28853-1-xuetao09@huawei.com/
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
>> ---
>>
>> Note:
>> Compared to original suggestion, this is a conservative patch which
>> only addresses known broken devices and tries to minimize disruption
>> for spec compliant ones.
>>
>>   drivers/usb/core/config.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
>> index 6a1fd967e0a6..bdd912627bac 100644
>> --- a/drivers/usb/core/config.c
>> +++ b/drivers/usb/core/config.c
>> @@ -191,7 +191,14 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
>>   			(desc->bMaxBurst + 1);
>>   	else
>>   		max_tx = 999999;
>> -	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx) {
>> +	/*
>> +	 * wBytesPerInterval > max_tx is bogus, but USB3 spec doesn't forbid the opposite.
>> +	 * Experience shows that wBytesPerInterval < wMaxPacketSize on common interrupt IN
>> +	 * endpoints is usually bogus too, and recent HCs enforce interrupt BW limits.
>> +	 */
>> +	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
>> +	    (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
>> +	     usb_endpoint_xfer_int(&ep->desc) && usb_endpoint_dir_in(&ep->desc))
> You can use usb_endpoint_is_int_in() here.
> 
> Alan Stern

I tested the current patch, and it resolves the issue I encountered 
before. I believe this patch is effective.

I also just tested the modification that replaces 
usb_endpoint_xfer_int(&ep->desc) && usb_endpoint_dir_in(&ep->desc) with 
usb_endpoint_is_int_in(&ep->desc), and it works as well.

> 
> ) {
>>   		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
>>   				"config %d interface %d altsetting %d ep %d: "
>>   				"setting to %d\n",
>> -- 
>> 2.48.1

