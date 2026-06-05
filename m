Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDCC3A168C
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780682734; cv=none; b=GF0IWDcyjHM1k+F/Dg73cXmpKKnR2Tiyah7eJXmi+bxifRiAWevl+lVGWWRy6P2oHT/GQ6ST5nWNX4wT0HpnT1tiyiI5GRRpTbaeq4RMmnAU3DraPSgj8byv2/KV747uiX6ruiCXFfhG5kDuOH25eFbKdmATOCz2gOvLDbRkxPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780682734; c=relaxed/simple;
	bh=MWQpVz6mI0I32LN+oi4vCe1pzKjUOWpiarigsce9YzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5UNJj1jYVOXKjL+CycPOlk4kbTJsEUt8H9AU/Q9jDsj2M4X45ZhbQe/40OYaA5zs+ijSZBuH1U4Po71exAVzUvt2nrl9mnxbpcaF70pM0fGPoxV1bMaPArefT+2vWzlqQ+1qjS32UEZldGp9LNAMzla2KpWTJrNe57ljt7eTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fmIAlIa0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fmIAlIa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780682729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hAOg9orqrzODNnWCYrZ2iDbkCKOJXEC8T7V/aprMX4g=;
	b=fmIAlIa02usViv+PCaVYZ96Je5KHzCCxNrdbUexemntbc38DLkZOLXqvYurhOHmdZ8EMsO
	2p2/rrJ9klukaXBW0cizgBiueO369SGWVbikeP5LTNXMVA/U4vksJI5e70e0Sxh6Ei/RWG
	k7On5DbEJDqu7qBiXaR8YX6awZDjYQ0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-mrtGH3t3MziWxKa5ynLtnA-1; Fri,
 05 Jun 2026 14:05:23 -0400
X-MC-Unique: mrtGH3t3MziWxKa5ynLtnA-1
X-Mimecast-MFC-AGG-ID: mrtGH3t3MziWxKa5ynLtnA_1780682722
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3CB3019560AE;
	Fri,  5 Jun 2026 18:05:22 +0000 (UTC)
Received: from [10.22.88.138] (unknown [10.22.88.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B89BE180049F;
	Fri,  5 Jun 2026 18:05:20 +0000 (UTC)
Message-ID: <6789ae0a-3c87-4d62-970f-2662e0050062@redhat.com>
Date: Fri, 5 Jun 2026 14:05:19 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: hub: Make usb_hub_wq type depend on
 isolcpus/nohz_full setting
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Alan Stern <stern@rowland.harvard.edu>, Kuen-Han Tsai <khtsai@google.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vratislav Bendel <vbendel@redhat.com>
References: <20260521170659.984284-1-longman@redhat.com>
 <ahb97cx_4dqPayDW@localhost.localdomain>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ahb97cx_4dqPayDW@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 5/27/26 10:21 AM, Frederic Weisbecker wrote:
> Le Thu, May 21, 2026 at 01:06:59PM -0400, Waiman Long a écrit :
>> A Red Hat customer reports a kernel stability problem where hung tasks
>> are reported with occasional kernel panics. Analysis of the core dump
>> indicates that USB work items are running on isolcpus+nohz_full cores
>> competing with RT-class tasks running on those core while holding
>> usb_hub device mutex transitively blocking other kworkers waiting for
>> the same mutex leading to hung_task reports.
>>
>> As the usb_hub_wq uses the WQ_PERCPU flag, it will run the work items on
>> the same CPU that queues them. For many use cases, it is a more efficient
>> setup leading to higher throughput as it reduces cacheline bouncing.
>>
>> It is a different story if the system needs to run latency sensitive RT
>> workload on dedicated isolated CPUs. Having the kworkers processing work
>> items on the same set of isolated CPUs will likely break the low latency
>> requirements of the RT tasks. As the RT tasks have higher priority,
>> not much CPU time will be left running the kworkers to process work
>> items which, in turn, will block other tasks that have dependency on
>> the completion of those work items. In this case, using a WQ_UNBOUND
>> workqueue to avoid running on isolated CPUs will be more beneficial.
>>
>> One solution to get the best of both worlds is to make the workqueue
>> type depending on whether the "isolcpus" or "nohz_full" boot command
>> line options have been specified. If at least one of those options are
>> present, usb_hub_wq will be created as an unbound workqueue. Otherwise,
>> it will remain as a percpu workqueue.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   drivers/usb/core/hub.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 24960ba9caa9..f79e5edd627a 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -33,6 +33,7 @@
>>   #include <linux/random.h>
>>   #include <linux/pm_qos.h>
>>   #include <linux/kobject.h>
>> +#include <linux/sched/isolation.h>
>>   
>>   #include <linux/bitfield.h>
>>   #include <linux/uaccess.h>
>> @@ -6066,6 +6067,8 @@ static struct usb_driver hub_driver = {
>>   
>>   int usb_hub_init(void)
>>   {
>> +	unsigned int wq_flags;
>> +
>>   	if (usb_register(&hub_driver) < 0) {
>>   		printk(KERN_ERR "%s: can't register hub driver\n",
>>   			usbcore_name);
>> @@ -6077,8 +6080,17 @@ int usb_hub_init(void)
>>   	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
>>   	 * device was gone before the EHCI controller had handed its port
>>   	 * over to the companion full-speed controller.
>> +	 *
>> +	 * Create WQ_UNBOUND workqueue instead of WQ_PERCPU if either isolcpus
>> +	 * or nohz_full boot option is specified.
>>   	 */
>> -	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
>> +	if (housekeeping_enabled(HK_TYPE_DOMAIN) ||
>> +	    housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
> HK_TYPE_DOMAIN is supposed to be a subset of HK_TYPE_KERNEL_NOISE anyway so
> the first should be enough.
Yes, that is the ideal case. However, that is not currently what some 
users are doing as they haven't changed their setup yet.
>
>> +		wq_flags = WQ_UNBOUND;
>> +	else
>> +		wq_flags = WQ_PERCPU;
>> +
>> +	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | wq_flags, 0);
> But then what happens if no isolcpus= is passed but later cpuset creates
> an isolated partition?
>
> Tejun and Marco thought about introducing a WQ_PREFER_PERCPU flag that would
> do what you want above. And the workqueue code should also handle dynamic
> isolation, that is switch from per-cpu workqueues to unbound ones or vice-versa
> dynamically.
>
> Marco is working on it.

I was thinking that it will be done with a later patch to make it works 
with dynamically isolated CPUs. Good to hear that Tejun and Macro are 
working with a new WQ flag. Will switch to the new flag once it is 
available. However, the current patch will still be useful especially 
for backporting to older distro kernels.

Cheers,
Longman

> Thanks.
>
>>   	if (hub_wq)
>>   		return 0;
>>   
>> -- 
>> 2.54.0
>>
>>

