Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B83815DF
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312955; cv=none; b=mEccR1voa7KBp/8kpPybmy/gQ3FJsXzVXdEL+daKWpu2bdm35UP/STMECgsm/h088r5Va4MTrGaAwDQWe6AZHsfJDnGI3cMap7h1cvKJ0xRKSo8RKNSyjzOM1AlkILLriAZ56PnO6vs628zaUO6c9haFirJd2zFlfxgy5skRuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312955; c=relaxed/simple;
	bh=zGSBq8TP2vV0ug250mrJYh76EvvO2lDemSOUoRq6efY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbB1vcuPD9MBtwHEIRdkprRKZKRRtpmzW7oRT1JnldOobog/2syTyRtCc8U75MaCR0iBuTlb9H2Z0kqyuXaTixtSPB+PT/zxi88ns7bXK/3kAVJ885NbaaKL6tKt51HqVofqmw0EOwDvqjmTBJBW9/MSxB9o+JgJOsiwx9knkUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUfi6u4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkRNzkAf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUfi6u4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkRNzkAf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7eoMq944286
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 08:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVY4kPy7mmCf8OpNkC60OekZP+7VUv6YvfJB3j3TAU=; b=mUfi6u4T/BDgsHZn
	qXYaMbCXES7wU7ckvZWiAlzlQ69VEcp5bBaTajcpbEfsesh7NIPexhHZo/6HTWPj
	CQ+S8j+PsoyuSpAgYz4qPt0IpPMH42ytAEhgykEKi3z9VATEL8+VY0/Vj88WHyPW
	UwhHJOuPAge6pd22JQhaejuRekXF02CwSFgC6hcYT0s90qGSJkPDmCm5mjrgcy3j
	6jvCeOH3yuMsyH5/CrgBhj78MbE65jGmEeXAy5In8gcJecSq4gX5D+WfLtWg5OOa
	rrNDmtYY+1uhariSdFacQTUv1auPQaE//qgdWFJN2zc169TVUUwvFx0eIBGNfZfE
	XE8KSA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm0js1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 08:15:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso1090901b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312952; x=1785917752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUVY4kPy7mmCf8OpNkC60OekZP+7VUv6YvfJB3j3TAU=;
        b=LkRNzkAfmOS60KSRKCdxe6sjnyeoxbo9GCn35phv1wIjbwhQA6aMe34LUFElWWeJ5V
         pK6rzdBRX3qbH8uTsRq1PqsOS36GY+cFq5vdcb5d4v9+z4J7N6DiBFJXGqKqvYDEJOAl
         3ZyljsODyIG2F+trFjkt3ilTkX+bPYJzNdDd6Fg/qW3LzdRI8cxnlNSOAr/WZaWg0MSB
         AyKB43FwkMELjPmySVAvWFLc5bFHp8oK+TALnUkYz+fOUBz2wLsEyZCR03ctaTZgM/ZH
         6M2gI4FNLfAdDfOfcAnQbWg/d2AYodTAUSY7KVhUG9EssrrPlKNW0jTq2x2H00ClkQNY
         o+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312952; x=1785917752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUVY4kPy7mmCf8OpNkC60OekZP+7VUv6YvfJB3j3TAU=;
        b=kgxT19YcH2gFwIYH+A4SlwH0du5hPODHpn4ECCUnf+sgWlaF8JRCWyLlpjbLm+l1MT
         ToXZVwfximc+2vjHyQSezQP4uS26o71325NcMn0l11dwElZeBVY8tsn+OBevQ9zS0GN8
         P0s3OJ1SOBIlwUqrE/3X4bHMiJDTFLUEBC0jhd/9djRWD9kA2UsWkoQ8jRV19FE4TIsf
         nJUuMIR1sACgoq6YIGwiWt85QG2tc0IWR1Mz8jLeR8e+h9Zb6RwhzYsD6ud35xj7m6jB
         OOgolkh8pjJ11RMX5ehqHbhGo/T1FO3HWv9NW5zin0UJHBS9q8Gr0midd00kDB8qO4Y+
         0n3A==
X-Forwarded-Encrypted: i=1; AHgh+RrVIOZNY4CmAl9/P5Z2qA6KX5ntIxevwI6oP+leqlp8A/3ujG6TqtPFEFJr3wqzPafSaBdYa6oyxmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOaccujMepksoVW/4IGwL5wsMHSzDN/Z3aameLsQW2dOXRWx6
	xrl3ATxjcxFb587cgsvnnH412SaKnzPn1A611QBwaWSQuUd4HyTz1cBORhfNA3RNaWe/nCMLF3w
	dmsY1iXrV513Xp49Hgxikm9MhfvznRIKRjHz+Z+i23QssuZUgrY+riQ7qFT9/cVI=
X-Gm-Gg: AR+sD12KTKhCZ7kJ9/KeCSGOsPMhtiBVW5pJYH6gJZydOrBxQBxV0u1LQT/mqXccKes
	mEjehCvJuuqqCuXnMizP6x2HzstXhXNZAonTqB4+r1+/je4OvGUZN3dXRF+mooioEpFGPtGtPqV
	On3NDbpq8YAYZ0LsPKkI8qdnwlnG7gVg0J6OD1AjiC0wZ8Lh3QBFKLWPmQQQ9Or9PVG7k3B2Emt
	o+bm/NXITDVebwpWBwKCEeO7KSUVJMNIhY0dD0nfbd/U4WscjCDS8ZKwX2wyla+CjwYo/xaDYGG
	q1yELjltqE1v4oppgGM8tIrB64CLxzkdmYYLd5XOHL9NDK8MO+W2Eb6IZr8o7hiCVo2V2+91Em1
	5BeQT55e+CVeXs7QeXupFyIOTzCMsZMZKUOjp9Wczakx4rPozMIOZd67xeVg853fAP95b
X-Received: by 2002:a05:6a00:4094:b0:84e:538:476d with SMTP id d2e1a72fcca58-84e933b0551mr6185158b3a.50.1785312952397;
        Wed, 29 Jul 2026 01:15:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:4094:b0:84e:538:476d with SMTP id d2e1a72fcca58-84e933b0551mr6185128b3a.50.1785312951846;
        Wed, 29 Jul 2026 01:15:51 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84eade11c0fsm212812b3a.20.2026.07.29.01.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 01:15:50 -0700 (PDT)
Message-ID: <a9197221-99d3-45c8-90c6-3ceeeade77e0@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:45:48 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: gadget: f_hid: allow setting different interval
 for each speed
To: =?UTF-8?Q?Arthur_Cr=C3=A9pin_Leblond?= <arthur@marmottus.net>
Cc: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260727152705.79384-1-arthur@marmottus.net>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260727152705.79384-1-arthur@marmottus.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f4ZqC6tilnzlLh4Dfut2wR3qiePJ4UAM
X-Proofpoint-ORIG-GUID: f4ZqC6tilnzlLh4Dfut2wR3qiePJ4UAM
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69b6b9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=VOzrI096AAAA:8 a=NpvcilucfdXaNkCOI3sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=uGZG8zJEB4yaku3Yq-x7:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NiBTYWx0ZWRfX4y/jk31T7IP2
 mfh2Qy5e37EnYKI3P/bjmpwSPMVbr9O77KoVcfLO05PO21wj25rDWrrC6SxeEFor18IZHriWCH6
 DjGjjgE6Kr2XVC5sSnx7baqOZnYhv7SEIJnwXymh6ffGdASXUuSBmUHtHuWNaJT1SRVSwTYGYgl
 tkiezYcxwE3OniQm3zF4DV8beAKtHb4yfSJCRQJVZ1y5/iu83DYj5/uyxqalqjZB0MiPTyAv5Bk
 pzswT/sX7gHvSDtCbSxUkPS/nIKI9jEsQT/Kc8O0uAGhCCi2baJ2a7HtheTeScVRo6ghVfo/qi7
 sbhLaXEZaVMSRiVaBcHeq/GvolJ7ejKm1Ps5Wk3jlCAL83K7Tffi25snLbL1aGoD8LwQXfVdnX7
 eFjAmpiIS6QUxmhOvqR6rM9eAMPbbGGJ0SwqegLmBKJJkHywpPnn28OC0LbtWjoKfyGGRRKX3sj
 MeEtFz8L6RTl9aTsDdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NiBTYWx0ZWRfXyCHVqoiaccNx
 wqs4PsqWqcKsmZ8LoDl5BdqbWJIsxrWNHhrxxSi/TFOTWPh7QxajXNA0QdIWhQxXeCzHqLngNGm
 0+7giSioKRc4W8kdTgBrgGUJteWJ3wE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290066



On 7/27/2026 8:57 PM, Arthur Crépin Leblond wrote:
> The HID polling interval unit depends on the USB speed.
> 
>   - Full speed: the units are in milliseconds
>   - High/Super speed: the units are in micro-frames of 0.125ms
> 
> Exposing directly the bInterval means that the user needs to know
> which speed is currently in use and has to convert it accordingly.
> 
> The solution is to expose the interval for each speed:
>   - interval_fs: bInterval for full-speed
>   - interval_hs: bInterval for high-speed
>   - interval_ss: bInterval for super-speed
>   - interval: legacy attribute that takes precedence over the per-speed
> attributes and sets the same bInterval for each speed.
> 
> Cc: Ben Hoff <hoff.benjamin.k@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Arthur Crépin Leblond <arthur@marmottus.net>
> ---
> v2:
>   - Expose a specific interval attribute per USB speed
>   - Use a define for the default values
>   - Update ABI documentation
> 
> v1: 20260716144921.1120265-1-arthur@marmottus.net
>   .../ABI/testing/configfs-usb-gadget-hid       |  18 ++
>   drivers/usb/gadget/function/f_hid.c           | 191 +++++++++++-------
>   drivers/usb/gadget/function/u_hid.h           |   9 +-
>   3 files changed, 142 insertions(+), 76 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid b/Documentation/ABI/testing/configfs-usb-gadget-hid
> index 748705c4cb58..a81f5b527b59 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-hid
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
> @@ -11,3 +11,21 @@ Description:
>   		report_length	HID report length
>   		subclass	HID device subclass to use
>   		=============	============================================
> +
> +What:		/config/usb-gadget/gadget/functions/hid.name
> +Date:		Jul 2026
> +KernelVersion:	7.3
> +Description:
> +		The attributes:
> +
> +		=============	============================================
> +		interval	HID endpoint bInterval for all speeds; if
> +				set, it takes precedence over the
> +				per-speed attributes below
> +		interval_fs	HID endpoint bInterval for full-speed
> +				(in milliseconds, default: 10)
> +		interval_hs	HID endpoint bInterval for high-speed
> +				(in 125 us units, default: 4)
> +		interval_ss	HID endpoint bInterval for super-speed
> +				(in 125 us units, default: 4)
> +		=============	============================================
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
> index 3c6b43d06a6d..f5ad3ae3e02b 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -30,6 +30,11 @@
>    */
>   #define GET_REPORT_TIMEOUT_MS 2500
>   
> +/* Default bInterval values */
> +#define HIDG_DEFAULT_FS_BINTERVAL 10
> +#define HIDG_DEFAULT_HS_BINTERVAL 4
> +#define HIDG_DEFAULT_SS_BINTERVAL 4
> +
>   static int major, minors;
>   
>   static const struct class hidg_class = {
> @@ -63,7 +68,9 @@ struct f_hidg {
>   	char				*report_desc;
>   	unsigned short			report_length;
>   	unsigned char			interval;
> -	bool				interval_user_set;
> +	struct f_hid_opt_interval	interval_fs;
> +	struct f_hid_opt_interval	interval_hs;
> +	struct f_hid_opt_interval	interval_ss;
>   
>   	/*
>   	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
> @@ -1204,16 +1211,24 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
>   	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
>   	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
>   
> -	/* IN endpoints: FS default=10ms, HS default=4µ-frame; user override if set */
> -	if (!hidg->interval_user_set) {
> -		hidg_fs_in_ep_desc.bInterval = 10;
> -		hidg_hs_in_ep_desc.bInterval = 4;
> -		hidg_ss_in_ep_desc.bInterval = 4;
> -	} else {
> -		hidg_fs_in_ep_desc.bInterval = hidg->interval;
> -		hidg_hs_in_ep_desc.bInterval = hidg->interval;
> -		hidg_ss_in_ep_desc.bInterval = hidg->interval;
> -	}
> +	/* IN endpoints: set defaults unless user set */
> +	if (hidg->interval_fs.user_set)
> +		hidg_fs_in_ep_desc.bInterval = hidg->interval_fs.value;
> +	else
> +		hidg_fs_in_ep_desc.bInterval =
> +			HIDG_DEFAULT_FS_BINTERVAL;
> +
> +	if (hidg->interval_hs.user_set)
> +		hidg_hs_in_ep_desc.bInterval = hidg->interval_hs.value;
> +	else
> +		hidg_hs_in_ep_desc.bInterval =
> +			HIDG_DEFAULT_HS_BINTERVAL;
> +
> +	if (hidg->interval_ss.user_set)
> +		hidg_ss_in_ep_desc.bInterval = hidg->interval_ss.value;
> +	else
> +		hidg_ss_in_ep_desc.bInterval =
> +			HIDG_DEFAULT_SS_BINTERVAL;
>   
>   	hidg_ss_out_comp_desc.wBytesPerInterval =
>   				cpu_to_le16(hidg->report_length);
> @@ -1238,16 +1253,28 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
>   		hidg_fs_out_ep_desc.bEndpointAddress;
>   
>   	if (hidg->use_out_ep) {
> -		/* OUT endpoints: same defaults (FS=10, HS=4) unless user set */
> -		if (!hidg->interval_user_set) {
> -			hidg_fs_out_ep_desc.bInterval = 10;
> -			hidg_hs_out_ep_desc.bInterval = 4;
> -			hidg_ss_out_ep_desc.bInterval = 4;
> -		} else {
> -			hidg_fs_out_ep_desc.bInterval = hidg->interval;
> -			hidg_hs_out_ep_desc.bInterval = hidg->interval;
> -			hidg_ss_out_ep_desc.bInterval = hidg->interval;
> -		}
> +		/* OUT endpoints: set defaults unless user set */
> +		if (hidg->interval_fs.user_set)
> +			hidg_fs_out_ep_desc.bInterval =
> +				hidg->interval_fs.value;
> +		else
> +			hidg_fs_out_ep_desc.bInterval =
> +				HIDG_DEFAULT_FS_BINTERVAL;
> +
> +		if (hidg->interval_hs.user_set)
> +			hidg_hs_out_ep_desc.bInterval =
> +				hidg->interval_hs.value;
> +		else
> +			hidg_hs_out_ep_desc.bInterval =
> +				HIDG_DEFAULT_HS_BINTERVAL;
> +
> +		if (hidg->interval_ss.user_set)
> +			hidg_ss_out_ep_desc.bInterval =
> +				hidg->interval_ss.value;
> +		else
> +			hidg_ss_out_ep_desc.bInterval =
> +				HIDG_DEFAULT_SS_BINTERVAL;
> +
>   		status = usb_assign_descriptors(f,
>   			    hidg_fs_descriptors_intout,
>   			    hidg_hs_descriptors_intout,
> @@ -1334,14 +1361,17 @@ static const struct configfs_item_operations hidg_item_ops = {
>   	.release	= hid_attr_release,
>   };
>   
> -#define F_HID_OPT(name, prec, limit)					\
> -static ssize_t f_hid_opts_##name##_show(struct config_item *item, char *page)\
> +#define F_HID_OPT_U(name, prec, limit)					\
> +static ssize_t f_hid_opts_##name##_show(struct config_item *item,	\
> +					char *page)			\
>   {									\
>   	struct f_hid_opts *opts = to_f_hid_opts(item);			\
>   	int result;							\
> +	u##prec value;							\
>   									\
>   	mutex_lock(&opts->lock);					\
> -	result = sprintf(page, "%d\n", opts->name);			\
> +	value = get_hid_opt_##name(opts);				\
> +	result = sprintf(page, "%d\n", value);				\



>   	mutex_unlock(&opts->lock);					\
>   									\
>   	return result;							\
> @@ -1368,7 +1398,7 @@ static ssize_t f_hid_opts_##name##_store(struct config_item *item,	\
>   		ret = -EINVAL;						\
>   		goto end;						\
>   	}								\
> -	opts->name = num;						\
> +	set_hid_opt_##name(opts, num);					\
>   	ret = len;							\
>   									\
>   end:									\
> @@ -1378,11 +1408,54 @@ end:									\
>   									\
>   CONFIGFS_ATTR(f_hid_opts_, name)
>   
> +#define F_HID_OPT(name, prec, limit)					\
> +static void set_hid_opt_##name(struct f_hid_opts *opts, u##prec val)	\
> +{									\
> +	opts->name = val;						\
> +}									\
> +static u##prec get_hid_opt_##name(struct f_hid_opts *opts)		\
> +{									\
> +	return opts->name;						\
> +}									\
> +F_HID_OPT_U(name, prec, limit)
> +
> +#define F_HID_OPT_INTERVAL(name)					\
> +static void set_hid_opt_##name(struct f_hid_opts *opts, u8 val)		\
> +{									\
> +	opts->name.value = val;						\
> +	opts->name.user_set = true;					\
> +}									\
> +static u8 get_hid_opt_##name(struct f_hid_opts *opts)			\
> +{									\
> +	return opts->name.value;					\
> +}									\
> +F_HID_OPT_U(name, 8, 255)
> +
>   F_HID_OPT(subclass, 8, 255);
>   F_HID_OPT(protocol, 8, 255);
>   F_HID_OPT(no_out_endpoint, 8, 1);
>   F_HID_OPT(report_length, 16, 65535);
>   
> +F_HID_OPT_INTERVAL(interval_fs);
> +F_HID_OPT_INTERVAL(interval_hs);
> +F_HID_OPT_INTERVAL(interval_ss);
> +
> +static void set_hid_opt_interval(struct f_hid_opts *opts, u8 val)
> +{
> +	set_hid_opt_interval_fs(opts, val);
> +	set_hid_opt_interval_hs(opts, val);
> +	set_hid_opt_interval_ss(opts, val);
> +
> +	opts->interval = val;
> +}
> +
> +static u8 get_hid_opt_interval(struct f_hid_opts *opts)
> +{
> +	return opts->interval;
> +}
> +
> +F_HID_OPT_U(interval, 8, 255);
> +
>   static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
>   {
>   	struct f_hid_opts *opts = to_f_hid_opts(item);
> @@ -1428,53 +1501,6 @@ static ssize_t f_hid_opts_report_desc_store(struct config_item *item,
>   
>   CONFIGFS_ATTR(f_hid_opts_, report_desc);
>   
> -static ssize_t f_hid_opts_interval_show(struct config_item *item, char *page)
> -{
> -	struct f_hid_opts *opts = to_f_hid_opts(item);
> -	int result;
> -
> -	mutex_lock(&opts->lock);
> -	result = sprintf(page, "%d\n", opts->interval);

use sysfs_emit instead here.


> -	mutex_unlock(&opts->lock);
> -
> -	return result;
> -}
> -
> -static ssize_t f_hid_opts_interval_store(struct config_item *item,
> -		const char *page, size_t len)
> -{
> -	struct f_hid_opts *opts = to_f_hid_opts(item);
> -	int ret;
> -	unsigned int tmp;
> -
> -	mutex_lock(&opts->lock);
> -	if (opts->refcnt) {
> -		ret = -EBUSY;
> -		goto end;
> -	}
> -
> -	/* parse into a wider type first */
> -	ret = kstrtouint(page, 0, &tmp);
> -	if (ret)
> -		goto end;
> -
> -	/* range-check against unsigned char max */
> -	if (tmp > 255) {
> -		ret = -EINVAL;
> -		goto end;
> -	}
> -
> -	opts->interval = (unsigned char)tmp;
> -	opts->interval_user_set = true;
> -	ret = len;
> -
> -end:
> -	mutex_unlock(&opts->lock);
> -	return ret;
> -}
> -
> -CONFIGFS_ATTR(f_hid_opts_, interval);
> -
>   static ssize_t f_hid_opts_dev_show(struct config_item *item, char *page)
>   {
>   	struct f_hid_opts *opts = to_f_hid_opts(item);
> @@ -1490,6 +1516,9 @@ static struct configfs_attribute *hid_attrs[] = {
>   	&f_hid_opts_attr_no_out_endpoint,
>   	&f_hid_opts_attr_report_length,
>   	&f_hid_opts_attr_interval,
> +	&f_hid_opts_attr_interval_hs,
> +	&f_hid_opts_attr_interval_fs,
> +	&f_hid_opts_attr_interval_ss,
>   	&f_hid_opts_attr_report_desc,
>   	&f_hid_opts_attr_dev,
>   	NULL,
> @@ -1537,8 +1566,13 @@ static struct usb_function_instance *hidg_alloc_inst(void)
>   		return ERR_PTR(-ENOMEM);
>   	mutex_init(&opts->lock);
>   
> -	opts->interval = 4;
> -	opts->interval_user_set = false;
> +	opts->interval = HIDG_DEFAULT_HS_BINTERVAL;
> +	opts->interval_fs.value = HIDG_DEFAULT_FS_BINTERVAL;
> +	opts->interval_fs.user_set = false;
> +	opts->interval_hs.value = HIDG_DEFAULT_HS_BINTERVAL;
> +	opts->interval_hs.user_set = false;
> +	opts->interval_ss.value = HIDG_DEFAULT_SS_BINTERVAL;
> +	opts->interval_ss.user_set = false;
>   
>   	opts->func_inst.free_func_inst = hidg_free_inst;
>   	ret = &opts->func_inst;
> @@ -1628,8 +1662,15 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
>   	hidg->bInterfaceProtocol = opts->protocol;
>   	hidg->report_length = opts->report_length;
>   	hidg->report_desc_length = opts->report_desc_length;
> +
>   	hidg->interval = opts->interval;
> -	hidg->interval_user_set = opts->interval_user_set;
> +	hidg->interval_fs.value = opts->interval_fs.value;
> +	hidg->interval_fs.user_set = opts->interval_fs.user_set;
> +	hidg->interval_hs.value = opts->interval_hs.value;
> +	hidg->interval_hs.user_set = opts->interval_hs.user_set;
> +	hidg->interval_ss.value = opts->interval_ss.value;
> +	hidg->interval_ss.user_set = opts->interval_ss.user_set;
> +
>   	if (opts->report_desc) {
>   		hidg->report_desc = kmemdup(opts->report_desc,
>   					    opts->report_desc_length,
> diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
> index a9ed9720caee..e666cd9968eb 100644
> --- a/drivers/usb/gadget/function/u_hid.h
> +++ b/drivers/usb/gadget/function/u_hid.h
> @@ -15,6 +15,11 @@
>   
>   #include <linux/usb/composite.h>
>   
> +struct f_hid_opt_interval {
> +	unsigned char value;
> +	bool user_set;
> +};
> +
>   struct f_hid_opts {
>   	struct usb_function_instance	func_inst;
>   	int				minor;
> @@ -26,7 +31,9 @@ struct f_hid_opts {
>   	unsigned char			*report_desc;
>   	bool				report_desc_alloc;
>   	unsigned char			interval;
> -	bool				interval_user_set;
> +	struct f_hid_opt_interval	interval_fs;
> +	struct f_hid_opt_interval	interval_hs;
> +	struct f_hid_opt_interval	interval_ss;
>   
>   	/*
>   	 * Protect the data form concurrent access by read/write

