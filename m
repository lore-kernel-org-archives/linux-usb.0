Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1661C84A0;
	Mon, 10 Aug 2026 02:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786328441; cv=none; b=oLFesHfgOABvykhkr/uQnHcesVa33KxhFXd+8HXpHjLPtZS1OcO8mLB5tcy8ivQMVK1BEiY/5SBucEkDUyBBslfDJP098QPA6akZ7+KND7eCLN3wQNGideENlBNYmvhY/9PgFEjWV2YupgOwKr3fZ9j3l+hcuhynkoMRuGgzFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786328441; c=relaxed/simple;
	bh=pj6+ywvqpxCOEAx6Uw/i3YbpI/Ce3Z7qaVJo/UNogzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxRCzAYVRM7tb9EQEAfVZFb0FO7hXbxvLQ5dT3Xfa1lxBN6KPpg0sCZ6hlxRPOkEzbEx2Bj83Zoj/HCZ7jyAsAGXPqDJgNq5atvqGtZOXJzHVoclX1uhJ2ge+h7jtogItlEe18C1VET928CIaWBnlU9wlPY07VxgVH4lgUuOw6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1032907a946211f1aa26b74ffac11d73-20260810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:75b3433a-0b67-446c-9c7d-0e042430c472,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:aade752dc357fa1d33a50d92e74af715,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1032907a946211f1aa26b74ffac11d73-20260810
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1072434717; Mon, 10 Aug 2026 10:20:32 +0800
Message-ID: <f27de7ac-86f5-47e2-8cb0-848306b52072@kylinos.cn>
Date: Mon, 10 Aug 2026 10:20:29 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdns3: Fix NULL pointer dereference in
 cdns3_pci_probe
To: Peter Chen <peter.chen@kernel.org>
Cc: pawell@cadence.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260806022258.3764848-1-dengjie03@kylinos.cn>
 <anWvZMPQ5ARWMu3o@hu-petche-lv.qualcomm.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <anWvZMPQ5ARWMu3o@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/8/7 18:11, Peter Chen 写道:
> On 26-08-06 10:22:58, Jie Deng wrote:
>> The Cadence USBSS controller is a two-function PCI device. The first
>> probed function allocates the driver data and stores it with
>> pci_set_drvdata(), while the second function reuses it via
>> pci_get_drvdata() when pci_is_enabled() reports that the first
>> function has already been probed.
>>
>> When the second function is probed while the first one has been
>> enabled but has not yet set its driver data, pci_get_drvdata()
>> returns NULL, and the subsequent wrap->devfn assignment dereferences
>> a NULL pointer and crashes the kernel.
>> logs:
>> Call trace:
>>    cdns3_pci_probe+0xa4/0x300
>>    local_pci_probe+0x44/0xa8
>>    pci_call_probe+0x54/0x158
>>    pci_device_probe+0x84/0x100
>>    really_probe+0x184/0x3d0
>>    __driver_probe_device+0x80/0x178
>>    driver_probe_device+0x44/0xe8
>>    __driver_attach+0xec/0x1f8
>>    bus_for_each_dev+0x7c/0xe0
>>    driver_attach+0x28/0x38
>>    bus_add_driver+0x110/0x238
>>    driver_register+0x64/0x128
>>    __pci_register_driver+0x50/0x60
>>    cdns3_pci_driver_init+0x28/0x38
>>    do_one_initcall+0x5c/0x280
>>    do_initcalls+0x104/0x1d8
>>    kernel_init_freeable+0x140/0x218
>>    kernel_init+0x28/0x1f8
>>    ret_from_fork+0x10/0x20
>>
>> Return -EPROBE_DEFER in this case so that probing is retried after
>> the first function has completed its probe.
>>
>> Fixes: 8bc1901ca7b0 ("usb:cdns3 Add Cadence USB3 DRD Driver")
> The patch is okay, but the Fixes tag is wrong, 8bc1901ca7b0 was reverted,
> you may use below tag:
>
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
>
> After above fix, feel free add:
> Acked-by: Peter Chen <peter.chen@kernel.org>
>
> Peter
Thank you for your reply. I will send the V2 version patch later.
