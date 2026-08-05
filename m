Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2E4A35;
	Wed,  5 Aug 2026 01:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785893531; cv=none; b=hByIUtVP1EfJh+VONaFH3UWUB2E0rvEV8jY1iNVDsOfZ6fW4GRge1Ryfoj5CehMdgjU5heJaKLyeFRNciCBCnnXXzhH4w6862SWSaOX6tLSORmI7QOh8wnSMlKq0KV6jBQ7uFFep+9gAHI8KRua2rXivdoQI3MambJZ8cVUF7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785893531; c=relaxed/simple;
	bh=xPLhBGeRnPmobU6R3EgnbUtrAgG2IamqwEt28v9kMYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRptlU57l1US1ZFVJKy26pfKgITKWtVgipcJP3C6oYC5Dp+8sTVjPdXDfpNnRSmCxDDX9oVbbjSX24/zkbhP1akJ/gWsc0FKloEFWhDbGUe0QDTmblkntJIgFwnygQSRXJzOL3e2eOOjW749376XJc5gkv3hH1k9cnmQWh+o7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 760c0db6906d11f1aa26b74ffac11d73-20260805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:32ca85a5-8abc-4e59-8447-11acaced60ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:14283c1325ca7542f9273ef09ed54938,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 760c0db6906d11f1aa26b74ffac11d73-20260805
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1836438752; Wed, 05 Aug 2026 09:32:03 +0800
Message-ID: <e277f387-0255-413c-88f7-f08e8d26a2d6@kylinos.cn>
Date: Wed, 5 Aug 2026 09:32:00 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: gadget: Fix use-after-free in
 dwc3_gadget_free_endpoints due to race condition
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <0ee247a4142f77eb8d38581d0b31beac7621b474.1785837121.git.xiaopei01@kylinos.cn>
 <anKMP_9HiQzgp35o@vbox>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <anKMP_9HiQzgp35o@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/5 09:06, Thinh Nguyen 写道:
> On Tue, Aug 04, 2026, Pei Xiao wrote:
>> In dwc3_gadget_init_endpoint, &dep->nostream_work is bound with
>> dwc3_nostream_work, and dwc3_gadget_endpoint_stream_event can queue
>> this delayed work on system_percpu_wq when a DEPEVT_STREAM_NOSTREAM
>> event is received.
>>
>> If we remove the gadget, dwc3_gadget_free_endpoints makes cleanup and
>> the memory allocated for dep with kzalloc() is released by kfree(dep),
>> while the delayed work mentioned above may still be pending or
>> running. The sequence of operations that may lead to a UAF bug is as
>> follows:
>>
>> CPU0                                      CPU1
>>
>>                                           | dwc3_thread_interrupt
>>                                           | dwc3_endpoint_interrupt
>>                                           | dwc3_gadget_endpoint_stream_event
>>                                           | queue_delayed_work(system_percpu_wq,
>>                                           |                    &dep->nostream_work)
>> dwc3_gadget_free_endpoints                |
>> dwc3_free_trb_pool(dep)                   |
>> list_del(&dep->endpoint.ep_list)          |
>> dwc3_debugfs_remove_endpoint_dir(dep)     |
>> kfree(dep)                                |
>> // dep is freed                           |
>>                                           | dwc3_nostream_work
>>                                           | // use dep (use-after-free)
>>
>> Fix it by canceling the delayed work before kfree(dep) in
>> dwc3_gadget_free_endpoints.
>>
>> Fixes: dcfe437492e2 ("usb: dwc3: gadget: Reinitiate stream for all host NoStream behavior")
>> Assisted-by: Codex:deepseek-v4-flash
> 
> Please include Cc tag to stable and this ack:
Thanks! I will send v2,and add this.

Pei.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> Thanks,
> Thinh
> 
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>  drivers/usb/dwc3/gadget.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index fa0f16ffafef..fa944856f956 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -3508,6 +3508,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
>>  		}
>>  
>>  		dwc3_debugfs_remove_endpoint_dir(dep);
>> +		cancel_delayed_work_sync(&dep->nostream_work);
>>  		kfree(dep);
>>  	}
>>  }
>> -- 
>> 2.25.1

