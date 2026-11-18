Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027822;
	b=C791mn/mLw/1XPk5Q4VbOCyndtHskg1XCXCgN6CEPRFp1+qp+M40v8SzRs5ESMsAP17/
	 ERqPzc583EIwU7PTAybHin+5Hei+QUNCdmd5nRkCUjh3MfsFXENRMeURmWYEQsdfOXE96
	 duBPE1cCDG08maz7Lj/bBaitqy//e+06zIkUUaw2lT3UNM5y3BoVHcrQdbINH6DGigxkp
	 aEkFD91auTQkMP7q89CHkFUKxYjxpUS2v2dDd9nBGGLVTSfXijShpMxuffocFeHvETUeP
	 aQZyCjQDfCnp49XSufPCSDw9PnJJzZWe/THKRhUS1SkCvx6Q9zi/bJkQER92oamsmjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027822;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=vHogMY4mjZlAmS/ipMn3gXGjhwXap4VkA7eGbTB9yTI=;
	b=Ewll7RURQd+TC9OvL/cA9pPT7U/6h/D+jUNVmfxqGc4i2pWNoiM2wUY+lpGi3Wvzvr+c
	 7S3Mbgh17NencQsAcTCNSFBGIs/Cmgwt6FD+NjRA4TyX6zGv+juemY2KBiqxWIkd4Q49+
	 hgx6Ci9V40W+tALZ0hl6Yhk44kj+qegGniXcaHCnLclNHAe5uF2k+mKnNaZhftzzdgUWd
	 nk8NMprJrcD9Dxr9sWrU6hIJvObZMITRXEQ3rA9RCNwx6390NAeHgctU6ilFl5HcFaRFZ
	 fY6kGveHVziX0wBJB1ZJ75AtI7p5kG/NSi1imBmXdB+SUGXryXr+Pq2ZKNsJOHpw2+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="uwy/VvsA";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B8606A325
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 18:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 609B8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=uwy/VvsA
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261118185019euoutp0292cf59b637c5100710569a69a61f4972~pOEqd4Dbk1778317783euoutp025
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 18:50:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261118185019euoutp0292cf59b637c5100710569a69a61f4972~pOEqd4Dbk1778317783euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795027819;
	bh=vHogMY4mjZlAmS/ipMn3gXGjhwXap4VkA7eGbTB9yTI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=uwy/VvsAX2odQlpe+zOcCW8LO87+tdDCAzC5qoMU3nWD3YU4FKEwFi+WLh5Ox3QOH
	 ggwy/fn37jHnAMcjwvDLfYIpoJ2ZvBMV8tBlRmBZOmx2oMXRYCD/x1OBgfQuQcM+y0
	 13LmcRHlGei15fVpKymB+XXg7xyaGg6PQPt1/A0w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261118185018eucas1p1add388a2f52f2016066c1e7406e241db~pOEpwSPvD1323013230eucas1p1V;
	Wed, 18 Nov 2026 18:50:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261118185018eusmtip2f1e81d1327f34442b1da6999bf6dfe8e~pOEpLDbTU1118211182eusmtip2n;
	Wed, 18 Nov 2026 18:50:18 +0000 (GMT)
Message-ID: <73cbf05a-e25d-46de-b956-504086660570@samsung.com>
Date: Wed, 18 Nov 2026 19:50:17 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] usb: dwc3: fix use of destroyed dwc->connect_mutex on
 gadget exit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiazi Liu
	<jiazi.liu1984@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ar79_M-IMnz2fUQK@vbox>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261118185018eucas1p1add388a2f52f2016066c1e7406e241db
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261001213926eucas1p18003977c0313cf3395a7413d22043df6
X-EPHeader: CA
X-CMS-RootMailID: 20261001213926eucas1p18003977c0313cf3395a7413d22043df6
References: <CGME20261001213926eucas1p18003977c0313cf3395a7413d22043df6@eucas1p1.samsung.com>
	<20261001213905.3290308-1-m.szyprowski@samsung.com> <ar79_M-IMnz2fUQK@vbox>

On 02.10.2026 02:43, Thinh Nguyen wrote:
> On Thu, Oct 01, 2026, Marek Szyprowski wrote:
>> dwc3_gadget_exit() destroys dwc->connect_mutex before calling
>> usb_del_gadget(), which unbinds the gadget driver and ends up in
>> dwc3_gadget_pullup() taking that already destroyed mutex. With
>> CONFIG_DEBUG_MUTEXES this triggers the following warning on reboot:
>>
>>  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>  WARNING: kernel/locking/mutex.c:625 at __mutex_lock+0x4bc/0xb88, CPU#1: systemd-shutdow/1
>>  ...
>>  Call trace:
>>   __mutex_lock+0x4bc/0xb88 (P)
>>   mutex_lock_nested+0x24/0x30
>>   dwc3_gadget_pullup+0x88/0x150
>>   usb_gadget_disconnect_locked+0x44/0x1f0
>>   gadget_unbind_driver+0x48/0x124
>>   device_remove+0x4c/0x80
>>   device_release_driver_internal+0x1e0/0x23c
>>   device_release_driver+0x18/0x24
>>   bus_remove_device+0xe8/0x1a0
>>   device_del+0x14c/0x414
>>   usb_del_gadget+0x90/0xe8
>>   dwc3_gadget_exit+0x40/0x9c
>>   dwc3_drd_exit+0xe4/0x14c
>>   dwc3_core_remove+0x140/0x17c
>>   dwc3_qcom_remove+0x38/0x120
>>   platform_shutdown+0x24/0x34
>>   device_shutdown+0x158/0x260
>>   kernel_restart+0x44/0xa4
>>   __do_sys_reboot+0x118/0x24c
>>   ...
>>
>> Fix this by initializing dwc->connect_mutex together with dwc->mutex in
>> dwc3_core_probe().
>>
>> Fixes: 1ff77cbefe5a ("usb: dwc3: gadget: fix IRQ storm on invalid event buffer count")
>> Assisted-by: Claude Opus 5.5 <noreply@anthropic.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/usb/dwc3/core.c   | 1 +
>>  drivers/usb/dwc3/gadget.c | 2 --
>>  2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index fd5c2cd36c59..f977bc3eeb79 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -2373,6 +2373,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>>  	}
>>  
>>  	mutex_init(&dwc->mutex);
>> +	mutex_init(&dwc->connect_mutex);
>>  
>>  	pm_runtime_get_noresume(dev);
>>  	pm_runtime_set_active(dev);
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index ee837235630a..8fd1fd9b0db3 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -4879,7 +4879,6 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>>  
>>  	init_completion(&dwc->ep0_in_setup);
>>  	INIT_WORK(&dwc->err_recovery_work, dwc3_err_recovery_work);
>> -	mutex_init(&dwc->connect_mutex);
>>  	dwc->gadget = kzalloc_obj(struct usb_gadget);
>>  	if (!dwc->gadget) {
>>  		ret = -ENOMEM;
>> @@ -4977,7 +4976,6 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
>>  		return;
>>  
>>  	cancel_work_sync(&dwc->err_recovery_work);
>> -	mutex_destroy(&dwc->connect_mutex);
>>  	dwc3_enable_susphy(dwc, true);
>>  	usb_del_gadget(dwc->gadget);
>>  	dwc3_gadget_free_endpoints(dwc);
>> -- 
>> 2.43.0
>>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> Thanks for the catch.

Greg, gentle ping for taking one.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

