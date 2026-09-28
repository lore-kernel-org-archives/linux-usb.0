Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C34D596C
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604886; cv=none; b=ZPL7B07QGA7nHVkmtYGWrZsE4G8/HScAZEaWcSl72YS5a/+y2EW3wxG0+U16OXrl517Pgzpgm02kP/K3RoxyrE98cp5ZL5x+isdJpHnygbiitKN+gicUglfdd8WD+epOo/q1n1PxhSVEWd+gkfODPDP3MuQNDsVhTcF+dyUuQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604886; c=relaxed/simple;
	bh=7fmmu/OsS0ybDnKRBy1YDaqCk6xFwY4kjcPp6hJw3mA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeTYhcy8vlck+47I4nqFtcUkLozbN2hpRASemGez7RxCV+uJ1wF3Bso1Bt3Ezc3VNzqxQk+1m2sJ/yH5s1R3FzASQ+Feat8ySXTZ3h/FGTH+6WYVJAN6aNxLY55X4tHV9HaLNiEz/f4SlDxK8XiFgIk8PKeXH3dUQkav/LidV8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1yBh6J0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKpIIaFO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1yBh6J0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKpIIaFO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBARJe1450510
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBhwQB4VLhD/2KWOJXfWnm00PDgiRoZsF7cvuVs80Tw=; b=l1yBh6J0Z+4UcHz1
	kIGKj8nZxJHDk2Y4yrxHqbBIou+0lb0yKLg4f9USDqIPhC8KI9hi8Lwgl5k37373
	/SvlyLihFIAdIy9gpk5hJTyXAz/gxMR//Hm9FHyyVkNDJr8tGGQotHkb7XLRrp43
	6JGmx7+g+DTjp/fnWOLjCXO365GhpK2CUh6dYmK6lGrX7yP0WOhzwmkjU0/jYWR1
	Ljc8ChLQM+1X3dhZ1h8iH9NQBbhVLm/CQm5rvyAVxO1zw9snqnf3/TfNEXw5TKTN
	e4ULcTDV6DW7UZr3Fm8uAOxOkGBOrz/kZZvng6BEus3UEyLrh1Xlt6O5om8kSkRn
	Env+1A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxhtda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:14:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b2f700b30bso628608137.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 07:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790604883; x=1791209683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBhwQB4VLhD/2KWOJXfWnm00PDgiRoZsF7cvuVs80Tw=;
        b=aKpIIaFONROAp+NbOHiZHA/Kf/gqd+eBhKTwYW57dhRG1qfW+6FBYCEdh4SMzunSSI
         i8QNh1N5eUVFJOiuwl8RcrA6Ejclb6fUo6RibdMVO4kwOlI5WQw87/PR2mfbxoyjLFsi
         lvIP/5xXfJivBG2iWZewBWtZ6xQXs+8TQMOm14NSxGrTpP7GShrSzKswnOUufKCbsXHn
         mG6/0m6RdRSMtKJMoO9P+EOJeTvbPrJgVmLlHdPuVKnF/jHps4VDo8JfbtROjWbv7UA+
         9fH4JMQUbt46R7ScfzM4qY0SnnqPxvRHXI/bjAzK1jNG9DYBp6N/8hMe6aBDHyyNVK9a
         j3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604883; x=1791209683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBhwQB4VLhD/2KWOJXfWnm00PDgiRoZsF7cvuVs80Tw=;
        b=KnTa1+4BmRic65F416vcURFELWvV+hTT4qV+a6R/izjaZyrKzR4Zd138MyuisBn0nn
         nELcIoxYB0/passwpI5e/C5fq4EVA7TYn2pEGooS59ouCkFk75HeZv8e2gKTiW9scVHm
         u+Tl2XNQg6DDewZrx01LePyxDL+iH6OcCXsspl4R9cxR+4SO2HFFXPgQQe5otX79bpGL
         qyEEMGWDRFsOoFo1BR20CQ8ZNRF5GPkSCrWQ0VoqH1fjaob/xcssZbUV2yYGpVmabLtQ
         rRNL/u/vqEVTDb0/tGpCB1khyl9kUFUEq8c7Yk6/3Q0Iuxcv/ZjJ3mo0TWlv2ckA65G1
         CQmA==
X-Forwarded-Encrypted: i=1; AKwUvBw39Kborq0/PjtfcpYm2ft2Phv2yKzIhAYDnwx9UE52JrDeFslJKvd7OAeqJ+Z1N1xV84FBt+q4cIM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnNVwnhKlIVdV/wISHpZtR1SCHso8V+yahCNMwBdpEMQThty/c
	vJ23E9RlPAEydA+Z/XPvkeNDo5131EjC/nwOpmKke4wgGk8Gh36qEzcYQXntU5k+77p5PZRiIZt
	QOXbR/s2gr3HjPhHiy1aOe01s+qqNVKqbzaSfby2GeHXTTKwU7W8qSDM4yiebK/A=
X-Gm-Gg: AYBFou3U+2CdygGt3sbLpZFtzThPatid1D5X4v6koqsvYybk3HLe1h9lKVjzC8rWxt0
	dU8RtXeBD7xQBfM4kCuC7JIMiH6Bk6XRfzDn/ystEqkO+5d5RnmpSLE3/7S+qVizPDE5Lul32zh
	bTgZqP5nrrxW731aCdeDlwfKsCA8uNPf1N5XOa9bwhI6/GGrPPG/vGlqvhidm1pWy5O8Ydrqk6J
	InZFeWCZ7ivF6pc2TVAbTiTAwZ+gBGfttjmD4uL4sJtjAD6oatBNTtK3nujXjYCHmh7vpq243CB
	zz66nlQD4+HOYf6vQODOQg4W6aFPA6btpvsT88xcPfJbT6gh+Y/BnZrU3CjUh9vb532ZUoQephk
	0uV5+9/hJIk/YzsHpW4J58/xiodfO1w==
X-Received: by 2002:a05:6102:e10:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7af1c58e8a4mr3937091137.8.1790604882629;
        Mon, 28 Sep 2026 07:14:42 -0700 (PDT)
X-Received: by 2002:a05:6102:e10:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7af1c58e8a4mr3937070137.8.1790604882052;
        Mon, 28 Sep 2026 07:14:42 -0700 (PDT)
Received: from [10.224.243.150] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae600684esm4601864a12.30.2026.09.28.07.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:14:40 -0700 (PDT)
Message-ID: <477aa40b-8116-4b00-81ad-b726a83f2bfd@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:14:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] virtio-usb: add protocol header and skeleton
 dual-role driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowangio@gmail.com>,
        virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
 <20260924160907.145405-2-igor.skalkin@oss.qualcomm.com>
 <2026092509-slightly-driver-1b18@gregkh>
Content-Language: en-US
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
In-Reply-To: <2026092509-slightly-driver-1b18@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wsVi-aY1h3W6MvSfiq5zLrKJFeqYWiow
X-Proofpoint-ORIG-GUID: wsVi-aY1h3W6MvSfiq5zLrKJFeqYWiow
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NiBTYWx0ZWRfX3vZSCIt6YniZ
 jg7qZ3ZvQAuRHql5FoSV90TJfLHy5N7hiukQiNb282YkdosNTJH5hL2mJ9lycFwGlu06Q0s8YR3
 T2yLCi2A8YR3uudrFMRTNA3X7ydI+YQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NiBTYWx0ZWRfX6LUkWt4KQIOX
 kzZfY6/TKOkQOKLUJPweEMSD5guBpYnBFR6CgNOMV7WvB0kAPnaPmsps4Ro75O0zJH0yE51Tfge
 g8Lg0leqEr3YCq3ibacwr+wDBqaLnvUjVK8e0Dp17nuLyWAkXowAFSP9vuoOyDnq+FjUH96CYCT
 EUn9bxyaLCrW47QSPc7LV+Tglpvac6cDVwITusEJkCJFMNSNYmYtxlx6/c0eQ3c9EfVdJkT89Yh
 YhZn546tJd5aUV7ugG8GS4UqtzBvl2khCwK0617TWKHq7yJ5sLuqMLKNHNTNG9BHzdhxY54gpgn
 lp9NNqtenETtHzJjitwj2rd3DJuTptaMg6D2HJaw0ogzbY5tc3/P6D1jVoj45C6M6zEGkaETuJV
 aJUWmIaTwhGORE0SDfM+7O5wSS13vGtXSroFiLd14kEKpLCRUh5/L/3Rc8/M9o1driEA1dffv3I
 JE6DSvPT/F6iHxFp6HQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba7653 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=yoz57VtyOFrzIFqIlQoA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280056



On 9/25/2026 7:21 AM, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2026 at 06:09:00PM +0200, Igor Skalkin wrote:
>> +/* VIRTIO_USB_EVT_HOST_PORT_CONNECTED/DISCONNECTED */
>> +enum {
>> +	VIRTIO_USB_SPEED_UNKNOWN = 0,
>> +	VIRTIO_USB_SPEED_LOW,
>> +	VIRTIO_USB_SPEED_FULL, /* usb 1.1 */
>> +	VIRTIO_USB_SPEED_HIGH, /* usb 2.0 */
>> +	VIRTIO_USB_SPEED_WIRELESS, /* wireless (usb 2.5) */
>> +	VIRTIO_USB_USB_SPEED_SUPER, /* usb 3.0 */
>> +	VIRTIO_USB_SPEED_SUPER_PLUS, /* usb 3.1 */
> 
> Please enumerate all of your enums with explicit values as these are
> going to userspace.
> 
Will convert these to #define constants.

>> +};
>> +
>> +struct virtio_usb_host_port_event {
>> +	__le32 code; /* VIRTIO_USB_EVT_HOST_PORT_XXX */
>> +	__le32 port_id;
>> +	__le32 speed; /* VIRTIO_USB_SPEED_XXX */
>> +	__le32 padding;
> 
> All of your padding fields MUST be verified to only be set to 0.
> 
> These are basic "how to write a uapi" things, did you all not read the
> in-kernel documentation for this?
> 
Agreed, will be fixed.

> thanks,
> 
> greg k-h

Thanks,
Igor

