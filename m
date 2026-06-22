Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DAA3655CA
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113800; cv=none; b=eKW2IjfEMiY3swPxwPBKDfVjp6NoG+/j5N9r4lkgXEg41HHoEz8JNIHJ9/047FfeLyJ2y+/Gi8niLu952fDOUEgGIS1pBUuGH9NIitgWJaSTP95mFg7A5p4pXKw7Hvn3BwyIFk+qyPHNLcACOBH6z6PXqEKD48fYgvoJpF4xN9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113800; c=relaxed/simple;
	bh=8FdBmptxZuWyWUQr6N8IiSxM5rMqZvN1Xhis0a6J2Gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Nl8i33KLzF3ULin7PSRQ1li+beZGRZ2ZddQBwcahgBqk54VPcUtNHXe/6FvDh8wESm9vTcAA3FO/Kjvie9o/xRAdQuMT2yRzjIT65a4+MXgdNFOXUJyLQBbxBhVwlllNlG7Gu9AkEzY7lm5Hh9ysgnpK8MMZZItf/keLnDN9ARc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rlQvQpXt; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rlQvQpXt"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260622073636euoutp018643a0f7857e8a89151b9a1acbbe5260~7Vw5Np48v0449304493euoutp01b
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 07:36:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260622073636euoutp018643a0f7857e8a89151b9a1acbbe5260~7Vw5Np48v0449304493euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782113796;
	bh=fTFWnZmc9I2m0RJhQ4S/yBbPBljIRaH2EJhymF0OQhU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rlQvQpXtq5pFQWdaFcDonIPdCIcsgsmVHIQoaEw9R0VpkZBvYsK1nOJKpdXzZp9Le
	 uBknArD36PiVmMHBkI5xjAB82fQNTihZ6Y0VPGJkfIR8dwbT0PDXrA4te1J9KShI2O
	 FA0uTbYGOrtWJrp88MyP2sd0DXgDUMXz07OPAL44=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260622073636eucas1p28b4aa1cb353242b1137ae11f4fe94e9d~7Vw47CE5W0533705337eucas1p2W;
	Mon, 22 Jun 2026 07:36:36 +0000 (GMT)
Received: from [106.120.50.52] (unknown [106.120.50.52]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260622073634eusmtip15eebff80f171b4fa0e8e29055dbefa0c~7Vw3l_JfR1387213872eusmtip1W;
	Mon, 22 Jun 2026 07:36:34 +0000 (GMT)
Message-ID: <5ef0713c-1b8c-473a-8cc4-6e8553ae1d9c@samsung.com>
Date: Mon, 22 Jun 2026 09:36:32 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbip: vudc: fix NULL deref in vep_dequeue()
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
In-Reply-To: <20260620-usbip-vudc-deque-fix-v2-1-d1913ab4611b@samcday.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260622073636eucas1p28b4aa1cb353242b1137ae11f4fe94e9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260620001816eucas1p216d49bf6a91cb50717b1bb9e1420d0d6
X-EPHeader: CA
X-CMS-RootMailID: 20260620001816eucas1p216d49bf6a91cb50717b1bb9e1420d0d6
References: <CGME20260620001816eucas1p216d49bf6a91cb50717b1bb9e1420d0d6@eucas1p2.samsung.com>
	<20260620-usbip-vudc-deque-fix-v2-1-d1913ab4611b@samcday.com>

> From: Sam Day <me@samcday.com>
> 
> vep_alloc_request() wasn't initializing vrequest->udc, so cancellations
> on the FunctionFS AIO path were arriving in vep_dequeue without a valid
> UDC reference.
> 
> Since vrequest->udc is never actually properly used anywhere, we opt to
> remove it, and update vep_dequeue to obtain a reference to the udc with
> ep_to_vudc(), consistent with the other vep_ ops.
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
> Changes in v2:
> - Reworked to remove vrequest->udc entirely and a call to ep_to_vudc()
>    from vep_deqe
> - Link to v1: https://lore.kernel.org/r/20260619-usbip-vudc-deque-fix-v1-1-9021463b1903@samcday.com
> ---
>   drivers/usb/usbip/vudc.h     | 1 -
>   drivers/usb/usbip/vudc_dev.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> index faf61c9c6a98..5ef0e7d9b23a 100644
> --- a/drivers/usb/usbip/vudc.h
> +++ b/drivers/usb/usbip/vudc.h
> @@ -38,7 +38,6 @@ struct vep {
>   
>   struct vrequest {
>   	struct usb_request req;
> -	struct vudc *udc;
>   	struct list_head req_entry; /* Request queue */
>   };
>   
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index c5f079c5a1ea..f0a1a44c18e3 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -344,7 +344,7 @@ static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>   
>   	ep = to_vep(_ep);
>   	req = to_vrequest(_req);
> -	udc = req->udc;
> +	udc = ep_to_vudc(ep);
>   
>   	if (!udc->driver)
>   		return -ESHUTDOWN;
> 
> ---
> base-commit: 5cd1731cc883a9914d91e3b93d4597317b5b5339
> change-id: 20260619-usbip-vudc-deque-fix-d316de3d3f16
> 
> Best regards,

Looks good to me.
Reviewed-by: Igor Kotrasinski <i.kotrasinsk@samsung.com>

BRs,

Igor Kotrasiński
