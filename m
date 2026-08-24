Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008034C83C;
	Mon, 24 Aug 2026 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560736; cv=none; b=XE3YpqTizs0sq75DQtYvsHwDHhfoNkKmGIBbiQ+TOlamhFeFmOK0HhZMHznuxUthW6cEhoS4u1FxD8LNHFhDkHjTb15nXZJVCAEc+p6+mqvEPeBwC0VW85QzCeNsxdXF0FDaS+Nmuv0z45PV0RTuiFmFwdbCkhz79y4fnofIsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560736; c=relaxed/simple;
	bh=kQJFB6nu691ZqCFDmqsccCZgIkT+WFkRQEnY7yk6vzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oykDTywdW4xVRpmagD1ocqPblfL0I2fmLqdKhiHx1irASpEbkKRCywxqC1MyTYUDwqYf38XwxB6QbRUsHBKLdiC3FnObP94B1VZjdriVd6hAtnddNigUy8tlK2wrkhkBoQhxsKoqTo9jgGXsFQI1XQ399Zgh+YteFHlNkPbvc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c+nYZ37v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c+nYZ37v"
Received: from [192.168.68.124] (unknown [149.106.186.222])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1BA66DF;
	Mon, 24 Aug 2026 10:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787560640;
	bh=kQJFB6nu691ZqCFDmqsccCZgIkT+WFkRQEnY7yk6vzc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c+nYZ37v7bUCpp8z/Nnn/2pORqupAD6bAOuPp5ceSKCBtzAUkigrA1ITweKS1+iEE
	 sDyWymus8tUClLrYVra6zA+3ZC0CwDo9H/KdSVa9uxBUZsF7TK3a20xnpbZNUCEeYF
	 HpivF83RF8ctMTCnaNmx4yIil1vvZefdxweor6jE=
Message-ID: <49d881a6-6ada-4801-bbaf-097b08623137@ideasonboard.com>
Date: Mon, 24 Aug 2026 09:38:40 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_uvc: fix Extension Unit descriptor heap
 overflow
To: Haofeng Li <lihaofeng@kylinos.cn>, gregkh@linuxfoundation.org,
 xu.yang_2@nxp.com
Cc: hhhuuu@google.com, kees@kernel.org, kai.aizen.dev@gmail.com,
 andriy.shevchenko@intel.com, rdunlap@infradead.org,
 christophe.jaillet@wanadoo.fr, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, 13266079573@163.com
References: <20260822194705.4151650-1-lihaofeng@kylinos.cn>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260822194705.4151650-1-lihaofeng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Haofeng, thanks for the patch

On 22/08/2026 20:47, Haofeng Li wrote:
> An Extension Unit descriptor is 24 + bNrInPins + bControlSize bytes long
> (UVC_DT_EXTENSION_UNIT_SIZE(p, n)), where bNrInPins and bControlSize are
> configfs attributes each accepted over the full 0..255 range by
> kstrtou8().  uvc_configfs stores the computed size in the u8 bLength
> field of the descriptor, so once 24 + p + n exceeds 255 it silently
> wraps: p = n = 255 describes a 534-byte descriptor with bLength = 22.

Ouch, thanks for catching this.

> uvc_copy_descriptors() reserves xu->desc.bLength bytes per Extension Unit
> in the descriptor buffer it allocates at bind time, but
> UVC_COPY_XU_DESCRIPTOR() copies the real descriptor contents, i.e.
> 22 + bNrInPins + 1 + bControlSize + 1 bytes.  With the wrapped length the
> copy overruns the allocation by up to 512 bytes.
> 
> Attack chain (write access to a UVC gadget's configfs attributes; no
> race, no USB traffic, a single bind triggers it):
> 
>      echo 255 > .../functions/uvc.0/extensions/ext.0/b_nr_in_pins
>      echo 255 > .../functions/uvc.0/extensions/ext.0/b_control_size
>        -> uvcg_extension_b_nr_in_pins_store() /
>           uvcg_extension_b_control_size_store()
>        -> bLength = UVC_DT_EXTENSION_UNIT_SIZE(255, 255) wraps to 22
>      bind the gadget to a UDC
>        -> uvc_function_bind() -> uvc_copy_descriptors()
>        -> kmalloc() sized using the wrapped bLength: 22 bytes for the XU
>        -> UVC_COPY_XU_DESCRIPTOR() writes the real 534 bytes into that
>           slot (22-byte head, 255 baSourceID, bControlSize, 255
>           bmControls, iExtension)
>        -> heap out-of-bounds write during bind
> 
> Reproduced on 7.2.0+: a stock build (FORTIFY on) can derive the remaining
> allocation size at the bmControls memcpy and BUGs in __fortify_panic()
> during bind - a deterministic kernel crash; with FORTIFY disabled for the
> file, KASAN reports "slab-out-of-bounds Write of size 255" in
> uvc_copy_descriptors() against the kmalloc-192 descriptor buffer.
> 
> Reject combinations whose descriptor does not fit into bLength at all four
> configfs entry points that can grow an Extension Unit (b_nr_in_pins,
> b_control_size, ba_source_id, bm_controls), and make uvc_copy_descriptors()
> refuse an Extension Unit whose bLength does not match its contents instead
> of overflowing the buffer.
> 
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> Assisted-by: opencode:deepseek-v4-flash-free
> ---
>   drivers/usb/gadget/function/f_uvc.c        |  6 ++++++
>   drivers/usb/gadget/function/uvc_configfs.c | 25 ++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 73dc7e42875f..0d3432f80cae 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -598,6 +598,12 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>   	}
>   
>   	list_for_each_entry(xu, uvc->desc.extension_units, list) {
> +		/* Mismatched bLength would overflow the buffer sized after it */
> +		if (xu->desc.bLength !=
> +		    UVC_DT_EXTENSION_UNIT_SIZE(xu->desc.bNrInPins,
> +					       xu->desc.bControlSize))
> +			return ERR_PTR(-EINVAL);
> +
>   		control_size += xu->desc.bLength;
>   		bytes += xu->desc.bLength;
>   		n_desc++;
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index 70a1415ea401..a584a6b85b06 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -845,6 +845,15 @@ static ssize_t uvcg_extension_b_num_controls_store(struct config_item *item,
>   }
>   UVCG_EXTENSION_ATTR(b_num_controls, bNumControls);
>   
> +/* The descriptor must fit into the one-byte bLength field */
> +static int uvcg_extension_check_size(u8 nr_in_pins, u8 control_size)
> +{
> +	if (UVC_DT_EXTENSION_UNIT_SIZE(nr_in_pins, control_size) > 255)
> +		return -EINVAL;
> +
> +	return 0;
> +}

I think my one comment on the patch is that a warning message would be worthwhile here, since the 
error can arise from user input to configfs. With that:

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks
Dan

> +
>   /*
>    * In addition to storing bNrInPins, this function needs to realloc the
>    * memory for the baSourceID array and additionally expand bLength.
> @@ -877,6 +886,10 @@ static ssize_t uvcg_extension_b_nr_in_pins_store(struct config_item *item,
>   		goto unlock;
>   	}
>   
> +	ret = uvcg_extension_check_size(num, xu->desc.bControlSize);
> +	if (ret)
> +		goto unlock;
> +
>   	tmp_buf = krealloc_array(xu->desc.baSourceID, num, sizeof(u8),
>   				 GFP_KERNEL | __GFP_ZERO);
>   	if (!tmp_buf) {
> @@ -930,6 +943,10 @@ static ssize_t uvcg_extension_b_control_size_store(struct config_item *item,
>   		goto unlock;
>   	}
>   
> +	ret = uvcg_extension_check_size(xu->desc.bNrInPins, num);
> +	if (ret)
> +		goto unlock;
> +
>   	tmp_buf = krealloc_array(xu->desc.bmControls, num, sizeof(u8),
>   				 GFP_KERNEL | __GFP_ZERO);
>   	if (!tmp_buf) {
> @@ -1055,6 +1072,10 @@ static ssize_t uvcg_extension_ba_source_id_store(struct config_item *item,
>   	if (ret)
>   		goto unlock;
>   
> +	ret = uvcg_extension_check_size(n, xu->desc.bControlSize);
> +	if (ret)
> +		goto unlock;
> +
>   	iter = source_ids = kcalloc(n, sizeof(u8), GFP_KERNEL);
>   	if (!source_ids) {
>   		ret = -ENOMEM;
> @@ -1134,6 +1155,10 @@ static ssize_t uvcg_extension_bm_controls_store(struct config_item *item,
>   	if (ret)
>   		goto unlock;
>   
> +	ret = uvcg_extension_check_size(xu->desc.bNrInPins, n);
> +	if (ret)
> +		goto unlock;
> +
>   	iter = bm_controls = kcalloc(n, sizeof(u8), GFP_KERNEL);
>   	if (!bm_controls) {
>   		ret = -ENOMEM;

