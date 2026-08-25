Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C52F263F5D;
	Tue, 25 Aug 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640669; cv=none; b=H93JCr1dTkfOirn5sOzzkRfqgVNJMYGRJqBFywBSjqgzAgRMq1qMm5k2+jYafdhUXoOMmAS38XwU0YGrus8/Z6SYZSXk8ADt4mte4xjjcxpev/JhOCR3iVblj0zH7iQf9LB9L8NRkWqk51o9RSUDUu5dJ6fGBTceLSl1waqM2RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640669; c=relaxed/simple;
	bh=amtI3pr7Wb5Wng/emdxLjSyGRAd+3wdwdoIxyejP9Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILV4EDZ5bbAHBfo4e+XANn3W+Z51be71s9aOjBZLRhNMm1s2qwWbmmGwPW6samZZgW/rgjppwkiS1HkGXjcar1MWwOTEGBJR9f9OvvFirEYqueQWg14XY0jGHJcgEDytUqQ7Xjaam+F4YjNmZFCJMXPYEZxLO9Y4aHMSNcAfO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 53e6642ca05111f19a56ed5b684f684d-20260825
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:03c4a63b-bc58-4491-bb01-a06ba0099df8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:57dcd37e78c43dc5055e44e3468642a7,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|52,EDM
	:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 53e6642ca05111f19a56ed5b684f684d-20260825
X-User: dengjie03@kylinos.cn
Received: from [10.42.12.246] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1761605993; Tue, 25 Aug 2026 14:50:58 +0800
Message-ID: <154cb7e0-f2ae-4ed4-b661-0904a12b9e06@kylinos.cn>
Date: Tue, 25 Aug 2026 14:50:55 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: cdns3: Fix NULL pointer dereference in
 cdns3_pci_probe
To: peter.chen@kernel.org, pawell@cadence.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260810023626.70669-1-dengjie03@kylinos.cn>
From: Jie Deng <dengjie03@kylinos.cn>
In-Reply-To: <20260810023626.70669-1-dengjie03@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,
Thanks for the review.
I've sent the v2 with the Fixes tag updated to 7733f6c32e36
("usb: cdns3: Add Cadence USB3 DRD Driver") and your Acked-by
added, per your suggestion:

   v2 patch: 
https://lore.kernel.org/all/20260810023626.70669-1-dengjie03@kylinos.cn/

Could you please help pick it up when you get a chance?
Thanks,

在 2026/8/10 10:36, Jie Deng 写道:
> The Cadence USBSS controller is a two-function PCI device. The first
> probed function allocates the driver data and stores it with
> pci_set_drvdata(), while the second function reuses it via
> pci_get_drvdata() when pci_is_enabled() reports that the first
> function has already been probed.
>
> When the second function is probed while the first one has been
> enabled but has not yet set its driver data, pci_get_drvdata()
> returns NULL, and the subsequent wrap->devfn assignment dereferences
> a NULL pointer and crashes the kernel.
> logs:
> Call trace:
>    cdns3_pci_probe+0xa4/0x300
>    local_pci_probe+0x44/0xa8
>    pci_call_probe+0x54/0x158
>    pci_device_probe+0x84/0x100
>    really_probe+0x184/0x3d0
>    __driver_probe_device+0x80/0x178
>    driver_probe_device+0x44/0xe8
>    __driver_attach+0xec/0x1f8
>    bus_for_each_dev+0x7c/0xe0
>    driver_attach+0x28/0x38
>    bus_add_driver+0x110/0x238
>    driver_register+0x64/0x128
>    __pci_register_driver+0x50/0x60
>    cdns3_pci_driver_init+0x28/0x38
>    do_one_initcall+0x5c/0x280
>    do_initcalls+0x104/0x1d8
>    kernel_init_freeable+0x140/0x218
>    kernel_init+0x28/0x1f8
>    ret_from_fork+0x10/0x20
>
> Return -EPROBE_DEFER in this case so that probing is retried after
> the first function has completed its probe.
>
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> ---
> Changes in v2:
> - Fix the wrong Fixes tag: 8bc1901ca7b0 was reverted, use 7733f6c32e36
>    which introduced the driver in the current tree (per Peter Chen's review)
> - Add Acked-by from Peter Chen
>
>   drivers/usb/cdns3/cdns3-pci-wrap.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
> index eb5760f75b9d..fd06a3d8e638 100644
> --- a/drivers/usb/cdns3/cdns3-pci-wrap.c
> +++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
> @@ -96,6 +96,11 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
>   
>   	if (pci_is_enabled(func)) {
>   		wrap = pci_get_drvdata(func);
> +		if (!wrap) {
> +			dev_err(&pdev->dev,
> +				"second function not initialized, retrying\n");
> +			return -EPROBE_DEFER;
> +		}
>   	} else {
>   		wrap = kzalloc_obj(*wrap);
>   		if (!wrap)
