Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0353AAF52;
	Mon,  3 Aug 2026 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748678; cv=none; b=o9VVZj3uaMzvCukwFL7710kjv9hzq3aA7flEMpXc15C5e53xSDLFlRx9ZIxV4FOmHWJl04F2RFYZrMRJcK6nPCAHK7VhCpIYvI5KxwcJSkW1TeYBR48b/X1rBIaLxpO4CPeCTtQ67yjfdd/beET+TYbExCxWIC9UH/T0rKvoaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748678; c=relaxed/simple;
	bh=6tJb36IQIl4M/hIoIza0r3ITMx+BeTOA9edD6ku6540=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V79AECNvcgK8agTgGp2hqofWvvZIpGtvv1vPXLMa8ZXjsxIWu1zLnenyeSA/f+wl5P3/AqZAsYeozupiUUQoh8S1K1/fA4mmAItZElI7tF9pFS6M9KRYHdObALRcAAxiJCI+0fmsfO5RFhT2cJ67SoywrqddF9Mt1ZELNftL0Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 324e36f08f1c11f1aa26b74ffac11d73-20260803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b34cee77-80fa-4736-bdca-82d7860a39d6,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:10
X-CID-INFO: VERSION:1.3.12,REQID:b34cee77-80fa-4736-bdca-82d7860a39d6,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:10
X-CID-META: VersionHash:e7bac3a,CLOUDID:3ab735096aefcee35ea0a98f21b20b09,BulkI
	D:260727221958KSOMDUM8,BulkQuantity:3,Recheck:0,SF:10|64|66|78|80|81|82|83
	|102|127|136|841|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:0,File:ni
	l,RT:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,
	DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 324e36f08f1c11f1aa26b74ffac11d73-20260803
X-User: dengjie03@kylinos.cn
Received: from [192.168.12.74] [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 492639429; Mon, 03 Aug 2026 17:17:49 +0800
Message-ID: <b5b614f4-1207-4e62-bbb2-ec6cb455d9bd@kylinos.cn>
Date: Mon, 3 Aug 2026 17:17:26 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
 <2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
 <e0c37a75-0569-45ac-acd0-534a24b6e3dd@kylinos.cn>
 <20260730064817.79e3d1af.michal.pecio@gmail.com>
 <d71b1b08-eae8-4e0a-a58f-bbd6b131d5cd@kylinos.cn>
 <20260731125737.073cedb3.michal.pecio@gmail.com>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <20260731125737.073cedb3.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, I looked in the company but couldn't find the Asmedia3042 PCIe card.
Therefore, x86 + Asmedia3042 cannot be verified.
I conducted the test using x86 + uPD720201, and the issue was not 
reproduced.

在 2026/7/31 18:57, Michal Pecio 写道:
> On Fri, 31 Jul 2026 15:38:22 +0800, Jie Deng wrote:
>> The S3 test script is as follows:
>> #! /bin/bash
>> #
>> for i in $(seq 1 $1); do
>>       echo "the $i th s3" > /dev/ttyAMA0
>>       echo "the $i th s3"
>>       rtcwake -m mem -s 20
>>       sleep 15
>> done
> That's simple enough, I could run it for a few hours on x86 PC with
> a few different PCIe xHCI cards.
>
> Just in case, are some USB devices supposed to be connected, or not
> connected, or maybe it's known to make no difference?
When I was conducting the test, I connected a keyboard.
>
> You mentioned that the problem occurs both in D3cold and D3hot, on
> my system I'm not sure if D3hot is possible with S3 so I would end
> up with D3cold or use s2idle instead of S3.
>
> I recall that in D3cold most of my PCIe cards don't supply AUX power
> to the xHCI. Was AUX power supplied to these chips in your tests?
> If so, I may be forced to use s2idle. Or maybe will just try both.
I didn't supply AUX power to the chips in my tests.
>
> Regards,
> Michal
