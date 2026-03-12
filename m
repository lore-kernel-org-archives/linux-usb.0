Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57312282F25;
	Thu, 12 Mar 2026 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773281894; cv=none; b=ZrC5g/kAKp5WcnGp2kuOw9oifqj64MGs/G6mVzgScuUwSv6DEFs9ZkaAxXCrwD5eM1WK/jJY+73GsLCog6fh85E+VTZhdjCASdMQGz/gMyOJ3psxZfzEmBEgK51wdHxZC2omJ6iHHbbGJq8YTwKTM1Yv/7Z9j5Ie2r3YcEJWuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773281894; c=relaxed/simple;
	bh=tLkHZKkkL1juKVLojW5Lj3Id0Mii/8EmP+LsQMqnY/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Alb/immXjVIoUR3fqhQdrJAfADNCOAnAsiMJ7/+ycijYXSmrtEBFE+AQx4my2d8ii7b+Fxwotx5e7zkCY5+pRz0ZejohS8A3zGIlahMx6aaRaVJK3TyojaJZPjkWGOjvs576Ou+B7a2pjDTwY3fF2If7Ab7vy1ElRbg5pavBeog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U7Xalnuq; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U7Xalnuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=7SAkg5n2rv4dkPxvNreHxCALh5eOJ32bG0lBV3Va+1U=;
	b=U7XalnuqDdC80HwjVAWpjek1AanSwtcdifIqhZJ74bnhJREDV18T7ANBw1NA1I
	Abi+K/pHxgl4XIuULhkUagVdT3XGVhkycW6gllL4h7uzt7754qtSYxRWPenXSuWm
	lDCfAuq8HUKoYDf4Xpw+0EcPFJiKONbgAZK/kTlGbY4SA=
Received: from [10.42.12.46] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgB3SNlPIrJpGkIpSQ--.247S2;
	Thu, 12 Mar 2026 10:17:53 +0800 (CST)
Message-ID: <01a0cce2-0938-472c-85a8-61283ed134b2@163.com>
Date: Thu, 12 Mar 2026 10:17:50 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: tools: Add usbip host driver availability check
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>
References: <20260303081720.84868-1-min_halo@163.com>
 <2026031146-battery-ripcord-02f6@gregkh>
From: Zongmin Zhou <min_halo@163.com>
In-Reply-To: <2026031146-battery-ripcord-02f6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgB3SNlPIrJpGkIpSQ--.247S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1xuF4kXw1kur47Gw1Dtrb_yoW5Jw1xpF
	WUKFWFkrW8JFsxXwsFqF4xCa4Fgws7t3yFgF1xJw1Ygr47A34ag3sxtrnY9w17Jws7XFnI
	yF4qqFyDGFyUJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v3UUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8xGjT2myIlHE-gAA3c


On 2026/3/11 20:13, Greg KH wrote:
> On Tue, Mar 03, 2026 at 04:17:20PM +0800, Zongmin Zhou wrote:
>> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>>
>> Currently, usbip_generic_driver_open() doesn't verify that the required
>> kernel module (usbip-host or usbip-vudc) is actually loaded.
>> The function returns success even when no driver is present,
>> leading to usbipd daemon run success without driver loaded.
>>
>> So add a check function to ensure usbip host driver has been loaded.
>>
>> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
>> ---
>>   tools/usb/usbip/libsrc/usbip_device_driver.c |  2 ++
>>   tools/usb/usbip/libsrc/usbip_host_common.c   | 31 ++++++++++++++++++++
>>   tools/usb/usbip/libsrc/usbip_host_common.h   |  2 ++
>>   tools/usb/usbip/libsrc/usbip_host_driver.c   |  2 ++
>>   4 files changed, 37 insertions(+)
>>
>> diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> index 927a151fa9aa..6da000fab26d 100644
>> --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
>> +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
>> @@ -147,6 +147,8 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
>>   struct usbip_host_driver device_driver = {
>>   	.edev_list = LIST_HEAD_INIT(device_driver.edev_list),
>>   	.udev_subsystem = "udc",
>> +	.bus_type = "platform",
> I think the "bus type" is changing in newer kernel versions, so be
> careful about attempting to hard-code anything like this.  Devices can
> move around between bus types just fine, that is not how they should
> ever be referenced.
Thanks a lot for your valuable feedback! I fully understand your 
concerns on bus type hardcoding.
I sincerely apologize for not fully considering the compatibility of 
kernel version changes
and the design consistency of the project in the initial patch.

In the current usbip codebase (libsrc/usbip_common.h),
macros such as SYSFS_BUS_TYPE (defined as "usb") have long been
used to manage the sysfs directory names related to bus type,
and functions like write_sysfs_attribute rely on these macros to access 
the driver's sysfs interface.
So, can I follow the existing design plan? add macros in usbip_common.h
to unify the bus type definition of different drivers.
This way, any future kernel bus type changes can be adapted by only 
modifying the macro, not scattered code.

Looking forward to your reply.
Best regards.
>
> thanks,
>
> greg k-h

