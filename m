Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD348095A
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709497; cv=none; b=Bgh/eQGu+9BXZHVt3aR6iBxMUfB8MCvrx9BwK5/JPFDWgPvZnYRsikF6JzVsy6ovCPrFBtjPIql5uNAdVD2wPANcBU1ay3rwFw7JAO8twCYZpFURynGCWD0i8W06IQD7wBruNSLnzqQym1pVzVoJR5b1YVM609ezWVQ6J4HLDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709497; c=relaxed/simple;
	bh=BtsYYEHrsQGdtNzG/ZD49nVUIeQyN9jJZqM5D7LHHj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zoj/1Y8msEHlv/te2YzSTnoxKm4YYChaFC/aAUlcxZDeI5T/NMTJMueHTzQcLZVMfMre4sHNkY99V1QOtvWutMLsNDdXI6s5PY5jyGQqAj8blaBIQ4h2gN+bDI5p5lolIG6Zo7K/mGnO6A11ite4rSLktSTEQmo49UOD7+yWqrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bSKdX8nV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bSKdX8nV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781709494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ht2tpYqt9pTA2BitKVGtaRUnqcHgUu7nD7bwqySH/M=;
	b=bSKdX8nVDE74UN7ul2CkWV145i+1wOpyESBHh/RJPBsLOAcuOSWIdTS/siHkECnOFLo/Dj
	I4PLDxaDRRqMW7dG1BWY3MafXSpYepxJS5oSrtqGDZ3BQBA2n0p1UJmZsKuOwF1dpOwFIC
	y24QdRxd8ssHaPjKDPlSblGXMQMqVYw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-StotR2qSOlSrzrFsF5Js_w-1; Wed,
 17 Jun 2026 11:18:09 -0400
X-MC-Unique: StotR2qSOlSrzrFsF5Js_w-1
X-Mimecast-MFC-AGG-ID: StotR2qSOlSrzrFsF5Js_w_1781709487
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA01318005A3;
	Wed, 17 Jun 2026 15:18:07 +0000 (UTC)
Received: from [10.22.65.196] (unknown [10.22.65.196])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 615E019540C9;
	Wed, 17 Jun 2026 15:18:06 +0000 (UTC)
Message-ID: <57bc3250-e81b-4c72-ae17-a12e94ce250a@redhat.com>
Date: Wed, 17 Jun 2026 11:18:05 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: hub: Make usb_hub_wq type depend on
 isolcpus/nohz_full setting
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 Alan Stern <stern@rowland.harvard.edu>, Kuen-Han Tsai <khtsai@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vratislav Bendel <vbendel@redhat.com>
References: <20260521170659.984284-1-longman@redhat.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260521170659.984284-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 5/21/26 1:06 PM, Waiman Long wrote:
> A Red Hat customer reports a kernel stability problem where hung tasks
> are reported with occasional kernel panics. Analysis of the core dump
> indicates that USB work items are running on isolcpus+nohz_full cores
> competing with RT-class tasks running on those core while holding
> usb_hub device mutex transitively blocking other kworkers waiting for
> the same mutex leading to hung_task reports.
>
> As the usb_hub_wq uses the WQ_PERCPU flag, it will run the work items on
> the same CPU that queues them. For many use cases, it is a more efficient
> setup leading to higher throughput as it reduces cacheline bouncing.
>
> It is a different story if the system needs to run latency sensitive RT
> workload on dedicated isolated CPUs. Having the kworkers processing work
> items on the same set of isolated CPUs will likely break the low latency
> requirements of the RT tasks. As the RT tasks have higher priority,
> not much CPU time will be left running the kworkers to process work
> items which, in turn, will block other tasks that have dependency on
> the completion of those work items. In this case, using a WQ_UNBOUND
> workqueue to avoid running on isolated CPUs will be more beneficial.
>
> One solution to get the best of both worlds is to make the workqueue
> type depending on whether the "isolcpus" or "nohz_full" boot command
> line options have been specified. If at least one of those options are
> present, usb_hub_wq will be created as an unbound workqueue. Otherwise,
> it will remain as a percpu workqueue.
>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   drivers/usb/core/hub.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa9..f79e5edd627a 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -33,6 +33,7 @@
>   #include <linux/random.h>
>   #include <linux/pm_qos.h>
>   #include <linux/kobject.h>
> +#include <linux/sched/isolation.h>
>   
>   #include <linux/bitfield.h>
>   #include <linux/uaccess.h>
> @@ -6066,6 +6067,8 @@ static struct usb_driver hub_driver = {
>   
>   int usb_hub_init(void)
>   {
> +	unsigned int wq_flags;
> +
>   	if (usb_register(&hub_driver) < 0) {
>   		printk(KERN_ERR "%s: can't register hub driver\n",
>   			usbcore_name);
> @@ -6077,8 +6080,17 @@ int usb_hub_init(void)
>   	 * USB-PERSIST port handover. Otherwise it might see that a full-speed
>   	 * device was gone before the EHCI controller had handed its port
>   	 * over to the companion full-speed controller.
> +	 *
> +	 * Create WQ_UNBOUND workqueue instead of WQ_PERCPU if either isolcpus
> +	 * or nohz_full boot option is specified.
>   	 */
> -	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | WQ_PERCPU, 0);
> +	if (housekeeping_enabled(HK_TYPE_DOMAIN) ||
> +	    housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
> +		wq_flags = WQ_UNBOUND;
> +	else
> +		wq_flags = WQ_PERCPU;
> +
> +	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE | wq_flags, 0);
>   	if (hub_wq)
>   		return 0;
>   

Ping! Any further comment on this patch?

Thanks,
Longman

