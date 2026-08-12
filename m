Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4D41D102
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528114; cv=none; b=RqAnASMKs9OtfikV1Y7fz+YX8jlQ6x4mrJkxnEfVsoYEHhGM5MGyK79OiBhTO4NdKznNYViHc0NBxzPJgJFC4dx5TaEKAxHaRcw/ck0r3YLqW/pFZN7NPMHgQ9lFLKifqK1usK9rU+EzEIuoI8IujA+E+jbrs6ytE2Zz4CCdWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528114; c=relaxed/simple;
	bh=iaJUI/0XDvAWP+CA81WLf+ts9AvhQ1y2O/VPirV2m+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfDb8tEinkViChpRcuCEpiuTgsapXS3rIrBCYskTbNkslUGHXowXQoqdoBGPh3/bmKJl9+oebn36UE3fEgjdiLRa9zLLXResU4fkYXmr4E4xYBhbeRDnXGZE0ujJyCP5Q1iyzPjMEyjOiE3GJdeJPVeYt3TWFfvGSHsSlQGWyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PLN+1N8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBWwO98X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PLN+1N8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBWwO98X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9fxjP3452190
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 09:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IM6yXMq39DX30NkVLM6SooXzKXIisePn7EGQ2VUuLjw=; b=PLN+1N8NUVDYJ3Ob
	AkzQiKCeVrtP8N+qV6WANuf/Y3cCi56hjsEQ3WyZHDyb7hmD9/h9SDQtsbTpNjk8
	PW8ZJTa4A0h4tNi82OoGZvW+x2b2vUAdX/XoaHHZ+giOnEu9M5/m0DNbrG2VCS8f
	BsOucgS3EczX/X2cRRmgHf9O2P6m4Gr014qAUEZklKbbNzVoyarlPGjVsRdQScq3
	Yg1We0jlcFepIiQCV+tFu3Zxe+U4lw9JrTSYt794klvz4veLZAGvRNO+utPsGdsm
	VKM3kGWKUYJM1hWYrIOVspsYnM7h2lPvVHfqAU/o8+YX/j8/h5ck/VfFkg7hZXZL
	4RKh5A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrh0sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 09:48:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484f26852dso896496b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528111; x=1787132911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IM6yXMq39DX30NkVLM6SooXzKXIisePn7EGQ2VUuLjw=;
        b=WBWwO98XuURbohQ++MrCRug9kaY7arY+cAAB5002ejqyARXOi3reCcImW9QYQW+p5F
         cA+JF9WSYg0QXVpl3p4l+SgvZQHnE+VtR+kcu2y6YXaD+G33GOlNvssEhPoa52nnxEXn
         5oYdAsqX618Q+mbHTYSp7oDgEa3IZlPLAuGRVXFSW3tqTEvGfyX/lUvcNr3kC1dCv76g
         Y691YJLNpCAWvIhbD66Gd6XgkxepSn7aMLAKpPd9Kn0Y7PClUVruzO+K8uoAizhim00i
         boMaCZ9xrdXJMdjBhR+IU7PB9Ihqx8moNnKr/rmF17JuRmJ2stdQ1vnGiquV4f9gnbc2
         gG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528111; x=1787132911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IM6yXMq39DX30NkVLM6SooXzKXIisePn7EGQ2VUuLjw=;
        b=aWV7Rk0MF8P5gZllvYURHBQ1FO7R6wCpuQFswH7SpJAUBws/k5/Zwinatm0QdOdlym
         z68mR0PNAx1NbdO2aNSG1/EF0LEercPeEtO1s2sq5aXz0v2x1ugz5tnvzzQ75h/M8Lwn
         JJQ+8WW1MNPRuCohpLvh1B4LeSipghVkBWJz4GcI0RwlWEaSyZt4BJHqWO89p8dFGLdI
         FxrMzAQeKnttl8U86gFHGmnEy+6VuWYMlYsJs0o5E+vvzIh78Z2K20D2TPJN3r8Ouffb
         tP8Gr4yAqg0Yk488P424sppO1i6pdV+Q9oFgnCbMQZ6QwjlSTp/PycGe4nldSxi/8O24
         YqnA==
X-Gm-Message-State: AOJu0YzSl5HCbMKR/JvM97t55sU+PYz69afh0QHKNXveknM3xD6zCFe6
	EnYWowdXuS5VI/WkW3BX43xdIbm5ThW3dbN7U04r4fDuKn7mIk8LJkzTeu3xCy6NvNrKQi+GsIu
	YYUQUxIRqvZEvI0Q46a+7R86cGdpMmbvbQs79Td3+3jlczT4giRqsHVUIW5A4lb0=
X-Gm-Gg: AR+sD12MxO3DqrKyIfQlZwB0YrjOe3Pf1oSbeGvCgarYAXUKbmmHU0xxPP8VCeBG7xo
	3Vjt0XXo6u1h4c4ZoXPAppF/vFNivzeX7YAonVMVGsU6xG+5l1G0oU6PBb5KHUDMwc3VmfHPIL1
	K8ZoZEKG9VMZeUf5qUzY5QYXWSEb2xPUk85/nVni+rENyhoY8J/F7bt6ZlNGjmF4xfcTt1DK0oS
	VaavaKY1vExonJWYgTotljZ5J6gjday4eCsf+W853Hh1pBrBYukK/0H7lkUk28ns+ZhjtTB2rPT
	0XwToN0FhTkxGwzMTkGQCVJITRgcGhFVsKyF4d90X+d881DtgQV30qfKc29nsbNmLjBC2ueqIDZ
	RFtGqXNBTNW2zvNaM9i9TZx13X+swzT7Rq/7iTofBUK26h3Uav0/g+Yzml6TpEY5ubin/
X-Received: by 2002:a05:6a00:2386:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84fb54dcf49mr3751739b3a.19.1786528110513;
        Wed, 12 Aug 2026 02:48:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2386:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84fb54dcf49mr3751698b3a.19.1786528110077;
        Wed, 12 Aug 2026 02:48:30 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2645bsm731052b3a.50.2026.08.12.02.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:48:28 -0700 (PDT)
Message-ID: <0802e0ee-499d-4f47-a8d9-1a6eae635ff3@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:18:24 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] usb: dwc3: gadget: fix IRQ storm on invalid event
 buffer count
To: Jiazi Liu <jiazi.liu1984@gmail.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Jiazi Liu <liujiazi@amazon.com>
References: <20260727092258.1121-1-liujiazi@amazon.com>
 <20260812082127.79610-1-liujiazi@amazon.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260812082127.79610-1-liujiazi@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfXxumfQvEXVUbs
 M37zKYwcEHs1GhVB2QFSP3m1a8TUJI2E8cJ/VuIAiCSCMulia3+W91hVJ+RkwCqfB0uqdQzBfQk
 RZ3Z+WDbLUkVi/WTlQ7R+kwLEB6qkUUu5ubpvKfIF4kOR6Sp3+fbqfiaHoHKajx/uu7CP4npvBX
 QYoVJrP+zaKQoTyHrSoNuPQLzfWhy0wAGUUd3ufKJRzXSp+GkOzCC3lIFH1pLqpgwRs2Ye4smRi
 ZLPfPQn2kW+4YeuJac8ifph2mKHEmXtufj/qxhIvnwMAXAMpvJKxS6BggOinpQJIobwMox/zyKs
 Erm8tnG/jkaZ0bmoCeMt2TAwIMV8QTR0L83QtC1BbxhGUUvkRqsKHl0OUF8+j0+1GRekb2EIFVB
 pq/p+FFrFC2n2QzWfb0udSQEvo5R/YMmNhZNN/3zTeeAWmtdqQkHTnc0HCZtp/ZidGww6nZmQfQ
 xMi4zPjRp2q1GLs6HKw==
X-Proofpoint-ORIG-GUID: cyk46qtqad2R9NZrk-tAQjAyesCG2oK_
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c416f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=fsXfUb1GuYEfvJEzrroA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: cyk46qtqad2R9NZrk-tAQjAyesCG2oK_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfX4nQF+HXTRrh/
 ag54EgY61Z8PMly5GLT5k/k4t4yqPuPmc04dnzFfCc8UP0xVABFD+5TSxwiuGDzRtvw3D9HPvcM
 8qh6por3jC3QzfgQyrghhc+2osv2EN0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120077



On 8/12/2026 1:51 PM, Jiazi Liu wrote:
> From: Jiazi Liu <jiazi.liu1984@gmail.com>
> 

[...]

> ---
>   drivers/usb/dwc3/core.h   |  7 +++++++
>   drivers/usb/dwc3/gadget.c | 41 +++++++++++++++++++++++++++++++++++++--
>   2 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 608daeb7ef10..b1cd888eca77 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -49,6 +49,7 @@
>   #define DWC3_ENDPOINTS_NUM	32
>   #define DWC3_XHCI_RESOURCES_NUM	2
>   #define DWC3_ISOC_MAX_RETRIES	5
> +#define DWC3_ERR_RECOVERY_MAX	3
>   
>   #define DWC3_SCRATCHBUF_SIZE	4096	/* each buffer is assumed to be 4KiB */
>   #define DWC3_EVENT_BUFFERS_SIZE	4096
> @@ -1004,6 +1005,7 @@ struct dwc3_glue_ops {
>   /**
>    * struct dwc3 - representation of our controller
>    * @drd_work: workqueue used for role swapping
> + * @err_recovery_work: workqueue used for controller error recovery
>    * @ep0_trb: trb which is used for the ctrl_req
>    * @bounce: address of bounce buffer
>    * @setup_buf: used while precessing STD USB requests
> @@ -1171,6 +1173,7 @@ struct dwc3_glue_ops {
>    * @wakeup_configured: set if the device is configured for remote wakeup.
>    * @suspended: set to track suspend event due to U3/L2.
>    * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
> + * @err_dying: true when controller is in error recovery, reject all requests
>    *		  before PM suspend.

How about gadget_dying or gadget_died (similar to hc_died in xhci). The 
variable "err_dyring"is misleading.

>    * @imod_interval: set the interrupt moderation interval in 250ns
>    *			increments or 0 to disable.
> @@ -1186,9 +1189,11 @@ struct dwc3_glue_ops {
>    * @wakeup_pending_funcs: Indicates whether any interface has requested for
>    *			 function wakeup in bitmap format where bit position
>    *			 represents interface_id.
> + * @err_recovery_count: number of consecutive error recovery attempts
>    */
>   struct dwc3 {
>   	struct work_struct	drd_work;
> +	struct work_struct	err_recovery_work;
>   	struct dwc3_trb		*ep0_trb;
>   	void			*bounce;
>   	u8			*setup_buf;
> @@ -1420,6 +1425,7 @@ struct dwc3 {
>   	unsigned		wakeup_configured:1;
>   	unsigned		suspended:1;
>   	unsigned		susphy_state:1;
> +	unsigned		err_dying:1;
>   
>   	u16			imod_interval;
>   
> @@ -1429,6 +1435,7 @@ struct dwc3 {
>   	struct dentry		*debug_root;
>   	u32			gsbuscfg0_reqinfo;
>   	u32			wakeup_pending_funcs;
> +	u32			err_recovery_count;
>   };
>   
>   #define INCRX_BURST_MODE 0
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index fa0f16ffafef..05f3ffab6e47 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2054,6 +2054,9 @@ static int dwc3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
>   
>   	int				ret;
>   
> +	if (dwc->err_dying)
> +		return -ESHUTDOWN;
> +

Not sure but should this check be added for all gadget_ops ?

Regards,
Krishna,
