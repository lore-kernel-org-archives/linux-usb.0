Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E39F3233ED
	for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872464; cv=none; b=VGkc7bK+mkp2moOYBFbRaAc6+6uLuVVxWJVopp26UnkFnTsL1NfMrri5OTFslyDPIIWLAWSd/S6Lm5Qh4hm1WT9mbyHTJRxgJsFs6IhD/ofAlAEmNCnWEBne+BWjaRrAV51thCkm5wOEuhuL0CyacbdxuwEheFQmRt/QZLI6zpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872464; c=relaxed/simple;
	bh=TFPLhR4MLlfnYvoATa8D8wog2i2+9kKhDe2PK3kabKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=cNANIBGe4g2ZeT4580MaqovORZ1xDgJyBX6H8vuC8FNMwUWStqf8xyXVBjP2M8V8he5JgSTVCfQ33d9P+0bGcZp3QqoIwbYvNO8rFhpmY2CPrAg/CPrxCbEGijOA9ruSHNDuy0F/vDgn+UhwJrF54jidIa4ukfaRAbQjXH5D3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=appB/nlh; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="appB/nlh"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260619123413euoutp0285f964eaa35f72eb91ca6c08814303c1~6e45If2q12042420424euoutp02R
	for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 12:34:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260619123413euoutp0285f964eaa35f72eb91ca6c08814303c1~6e45If2q12042420424euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781872453;
	bh=QZWDoXZ2PQ0x6/SMzTbUAs3v6q9dpSxo1wKl+L04RBI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=appB/nlhEr+KZtNwcl+Qod6LkNCBHoAbH8S2c6u8k3k4PvpjeUcpQk/JM9JHNE9Ms
	 r+QbEtDBCA/j1h6fXDt2+vhGp2eOj7oH+5Fby92aQcmS2nEZ2cwk0Up5TCCxT5r+EE
	 0POfKsqRHUi1t1Dh/WejRZVcnR7LeDZsTpiolURA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260619123412eucas1p1a1cc6b07d7edf3b3f6cff15c9f7470f1~6e44XYMUe3240832408eucas1p1B;
	Fri, 19 Jun 2026 12:34:12 +0000 (GMT)
Received: from [106.120.50.52] (unknown [106.120.50.52]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260619123411eusmtip130521ece6ef159bc040e2e8af4df7764~6e43IQO8_2673926739eusmtip1d;
	Fri, 19 Jun 2026 12:34:11 +0000 (GMT)
Message-ID: <55bd7e53-9f90-414e-aa07-f228d8b2b35f@samsung.com>
Date: Fri, 19 Jun 2026 14:34:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vudc: fix NULL deref in vep_dequeue()
To: me@samcday.com, Valentina Manea <valentina.manea.m@gmail.com>, Shuah
	Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Karol Kosik <karo9@interia.eu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
From: "Igor Kotrasinski/Security (PLT) /SRPOL/Engineer/Samsung Electronics"
	<i.kotrasinsk@samsung.com>
Content-Language: en-US
Autocrypt: addr=i.kotrasinsk@samsung.com; keydata=
	xjMEaZL2IBYJKwYBBAHaRw8BAQdAvUmLmhxMQ0BlwZGuLemepi5ypJs6Yjjar+1jdrW8ecnN
	Xklnb3IgS290cmFzaW5za2kvU2VjdXJpdHkgKFBMVCkgL1NSUE9ML0VuZ2luZWVyL1NhbXN1
	bmcgRWxlY3Ryb25pY3MgPGkua290cmFzaW5za0BzYW1zdW5nLmNvbT7CjwQTFggANxYhBG5k
	fRePp7i54VvfwyFa+/ugg4keBQJpkvYgBQkDwmcAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQ
	IVr7+6CDiR6wfgD/eSy7+zw/l0TD294VtS0rkgFmxz87LE5qp0MwppVmWWQBAMICVmVtobFJ
	chcKnth+QyVUzobU+2qTZTmIr/76pDUDzjgEaZL2IBIKKwYBBAGXVQEFAQEHQDEsN2IVbTF7
	Au+2GHOdmWLY2bRQb/QEZjsXKqkGUJQEAwEIB8J+BBgWCAAmFiEEbmR9F4+nuLnhW9/DIVr7
	+6CDiR4FAmmS9iAFCQPCZwACGwwACgkQIVr7+6CDiR5aJQEA/O2jzcH785NF77p1mOkgmW6t
	nR5Q1wzCl3H09LsoL9wBAIX1jHib04j6DZxbOL35M1nQVahHZd8NdTIMbj4thksG
In-Reply-To: <20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260619123412eucas1p1a1cc6b07d7edf3b3f6cff15c9f7470f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260619002859eucas1p2ac95b8f06a59a44eeb7e1a8b4bfc3a0d
X-EPHeader: CA
X-CMS-RootMailID: 20260619002859eucas1p2ac95b8f06a59a44eeb7e1a8b4bfc3a0d
References: <CGME20260619002859eucas1p2ac95b8f06a59a44eeb7e1a8b4bfc3a0d@eucas1p2.samsung.com>
	<20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com>

Hi,

> From: Sam Day <me@samcday.com>
> 
> vep_alloc_request() wasn't initializing vrequest->udc, so cancellations
> on the FunctionFS AIO path were arriving in vep_dequeue without a valid
> UDC reference.
> 
> AFAICT this bug has existed for ~10 years. Seems that nobody has really
> stressed the FunctionFS AIO path on usbip's vudc.
> 
> I tested this fix in a QEMU aarch64 guest driving FunctionFS endpoints
> via AIO. Before the fix, running `usbip attach` from the host would
> cause the guest to oops with the following backtrace:
> 
> Call trace:
>   vep_dequeue+0x1c/0xe4 (P)
>   usb_ep_dequeue+0x14/0x20
>   ffs_aio_cancel+0x24/0x34
>   __arm64_sys_io_cancel+0xb0/0x124
>   do_el0_svc+0x68/0x100
>   el0_svc+0x18/0x5c
>   el0t_64_sync_handler+0x98/0xdc
>   el0t_64_sync+0x154/0x158
> 
> Assisted-by: opencode:openai/gpt-5.5
> Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
> Signed-off-by: Sam Day <me@samcday.com>
> ---
>   drivers/usb/usbip/vudc_dev.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index c5f079c5a1ea..2f1f141909b2 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -279,15 +279,18 @@ static int vep_disable(struct usb_ep *_ep)
>   static struct usb_request *vep_alloc_request(struct usb_ep *_ep,
>   		gfp_t mem_flags)
>   {
> +	struct vep *ep;
>   	struct vrequest *req;
>   
>   	if (!_ep)
>   		return NULL;
> +	ep = to_vep(_ep);
>   
>   	req = kzalloc_obj(*req, mem_flags);
>   	if (!req)
>   		return NULL;
>   
> +	req->udc = ep_to_vudc(ep);

We can get rid of udc in struct vrequest and call ep_to_vudc() in 
vep_dequeue(). All the other places do it, I think I missed that one 
during a refactor before submitting the driver.

>   	INIT_LIST_HEAD(&req->req_entry);
>   
>   	return &req->req;
> 
> ---
> base-commit: 5cd1731cc883a9914d91e3b93d4597317b5b5339
> change-id: 20260619-usbip-vudc-deque-fix-d316de3d3f16
> 
> Best regards,

Side note, there are some checks for udc->driver being NULL that I feel 
are either redundant or should be behind a spinlock, just like setting 
udc->driver is. I'm not sure which, will have to take a look.

BRs,

Igor Kotrasiński
