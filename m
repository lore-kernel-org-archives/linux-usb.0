Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639514D8D9D
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604121; cv=none; b=Mek+VnUboWizdEzCxqL1AjVDwV9Gl7AHYSReB7fcNZhOLBrF57yqjqUFvURXupDd0hQQ+liWgBTE64pTAZPrdUrcFvNYJhLjCJLIgxBKMb0lKAmkXA+9ZEBgxVNku1Yur7KZFdVIlXtNcCwlxmCwVlXuDF5nP6uMb59hPAc+rz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604121; c=relaxed/simple;
	bh=j6IKKHSOAk/HYxjkfsqppu6/7M/o19dHiItXcDuAZbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1l8xfe/kaHA0gMcEElraWhcuPhYv3B1l6Qoj7MQYvsoB1PMQs3cLZxKbqKi8cH+2yaOiKPVf8IKEIIBoY9gNYzodPut7giK0Q/MF0w/HLdv+LJ7wxFkBgUpk1cT55yVUaHk71WtdxL9n1hRyKpLsfdjbQVVvJBFbq3dO/DpFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdotMERF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6+wpYNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdotMERF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6+wpYNV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SC55t9040554
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfjqqOB3VBxrec3RIQrCgVLmbWd75rCeJ2KFV/mqCC4=; b=KdotMERFGMBhy1lU
	inwa1Edq6xySXxOF0Mye3eizcNBBmfS61iClF+ZBxjfgtXC/TdUiNdxzxQYZ/HLV
	nwKdJ2TNYcj8Ih0/Pit/0/t39vZ1kjwn4K++t+Mr+zlkEutknFDQMJ9Lf2q6k7yy
	gR5jgvT1iSfssHKOSQY44k0ZThbsUfzFYBG+KMu99+UZokwrLXQCfxuswbQEohk/
	qUCesb4SJck2QT6I7ZFJ5lCpVvAEbykmE+a6nT8skZPM0q8bsjtE/d7ZXWUenIP1
	a18RM+5st0wdB83+ZVLqdAkyTAOBeDGCgr7Z4z1mWeeIGBdeL6si4P3znJF2nXqb
	NdqgHg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx38ds3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 14:01:59 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-986e79a43b4so1959885241.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790604118; x=1791208918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfjqqOB3VBxrec3RIQrCgVLmbWd75rCeJ2KFV/mqCC4=;
        b=i6+wpYNVRsoA76EVLWzmfRpyfVlNGQGbrfHieiG+CiiXL33XCyJCRrGaWi4bYvFzTT
         IltB9T0z+Dzb9VLnmRFJZ7wwrqxIdF3J10e093q+ci9cBJHVPWy3YFRhQXUwQk7TP8IL
         0xIpFXSQUjN0/1JoxzdgXpxWRPzeLo3x6F4jK/6XYIgAysmhMZS9pWeroCTOfdqdFaLG
         wLudu8ILsZGsnVO85KioDj0g6cwiPBXf9zqewN2GEQqhhKtlWUKxDKi+QBr/XmxmCnjO
         iGGtp5RtqW+ELYNhtwuYfOn7px77fKom2pYfSB5VI9pD5XJSztyhjCBtMD/aNMnAj4tP
         LPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604118; x=1791208918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfjqqOB3VBxrec3RIQrCgVLmbWd75rCeJ2KFV/mqCC4=;
        b=Wr98gs63vfw/LnZ3kEn7wvlmuvkR4Ma4++39ULGWZtaUEB2QjS85KJCO++tbVQBbmg
         JHZL1+O0R798UvL+NFF7q3evXY+vG/UqXbcx2o7aqk68zruMGSFy/+9zM06BR180oe7B
         5BbvUvEjUDGYgN9nWTn7kXMCuzkPyA2QlzkTJKN50QyyLfQmHsf/PA7q0aG1Nd3oUps8
         oQMCeRGWGAKu1yVXIH4EKlEvnGmXbcdJUfqOaBefUd/yNCuROB5Lv44IVNSCqfElIeas
         RJZfYceqL04vi22UKq12NXoXJVIUJvZlE8ump2KE18PMbawkK3Fy6xpTK+QCUf/NN3k5
         rpKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8zpIN2QagLDM99LlpIiqOs/LH9myb7aSa5ZzfV4af0wDck9hCPN9ACeyzJ0MuenE9FTBwIdByfmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVgvVX9dVYSdZRYwJkpJxz0FrS/45KzzEScQhQ0xhGy2VRfJpW
	wqViW9EqIDsm5jK8AqVJ4qjcg8uzJJf7zzcPbZ6QFGkCJNi1FmQsmm0eSJUdPQ+juVNMsNFL7rs
	JYYIJE6ZZmwKb4yLNWrkGhycYp6lggnBk7aRKDp+xeVNJehZ1ck9P47ZUkGKQBX8=
X-Gm-Gg: AYBFou3Sg0bLmN5u2CGWZRKDsn7IbwFhxFJ0iKUki/fw6ET7GvOfeJy4llolFGsSQwV
	WA/hXlKhSEq073ejGQbPzhgEiKOim1tPMqp+qQymHCrV8qZ1xREd5mH4wL3TFQInmWE4KQLiOII
	jSsxPFwOk8lk0m25wiIzJWqym3gP5GymmB1I9j321AhtdYmpdmglAfuOxvCyI0vzdD6KJRqfKwL
	IftoAuzhAwF+peicE/2CLkxk3AIKXxK3xN9sVNl/JFvxZCmV2qdxxUQCRrApknO/jt7p9TfG8l/
	mWy2VkwJw9j9X9XiUNBPR2Cry2Lop/Z0ypPOUzBFeqd1EQxj1pON2JZ7pdYoX7OCXFa+6T6uULA
	WijDl26qbaIif0QHD//zFGwPSSq/QuQ==
X-Received: by 2002:a05:6102:8099:b0:7b3:4199:2dd4 with SMTP id ada2fe7eead31-7b341a88730mr2300453137.20.1790604118304;
        Mon, 28 Sep 2026 07:01:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8099:b0:7b3:4199:2dd4 with SMTP id ada2fe7eead31-7b341a88730mr2300417137.20.1790604117624;
        Mon, 28 Sep 2026 07:01:57 -0700 (PDT)
Received: from [10.224.243.150] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae84ba822sm478321666b.7.2026.09.28.07.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 07:01:56 -0700 (PDT)
Message-ID: <2c3db726-0024-436f-b33e-3c3475382312@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:01:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] virtio-usb: add host role (USB Host Controller)
 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowangio@gmail.com>,
        virtualization@lists.linux.dev, linux-usb@vger.kernel.org,
        Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
        Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
References: <20260924160907.145405-1-igor.skalkin@oss.qualcomm.com>
 <20260924160907.145405-3-igor.skalkin@oss.qualcomm.com>
 <2026092531-giddy-annotate-7a58@gregkh>
Content-Language: en-US
From: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
In-Reply-To: <2026092531-giddy-annotate-7a58@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e0eSsgdQlp4bLZ12WcBDVLToCTxjO4JU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX4ejQMaLw0Ahy
 2JZBDur7OMeWsrh/WpBWa2FXUZ5Z53pNrOq+zovgaY4lu30OKkHRHp6ffrTefZMfEDfCoVG1p/b
 Qu+tAg5rsQQ/nVTjPydXV1oemK4dlZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX1ZM8iiR+mphZ
 WCFh6yGce0xcFmfFVIV3xMvCYlr1YI5gF3VgUo3y5EnYT6/Rjh8wgmUT7Q00QuyWK5izcpDuiSe
 SN7U6u93DFg7hE/FeFRuMrC/RQn5hUDNoljNFtLbo0N71CAh49tQ8EgWJ7/PF4xeORL1JnZ/vaX
 7WEYLy1ToYZvdzD8+Wyrsl8OIi000DHALD/CEIEhUrb4AD+/Z3hpfsbXbRzJz8x8VNXycTYyvRA
 rTJe4gNlMF9/bQeL0PYeKwp6SlxJxhhsP1mge0o5U3T5DWz9UgTV5DknLLfXUwaRRCuNrKE2HU4
 sTL6ysojbY4/IeFmeJoaBbr5615+HFC0rlA9baGeuvKneJfMbeURV6yJdu7fzUonKoc6b0xnPyt
 sXjwySoeOgOiY7n2fX2WSMRnwQ8Fkw==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba7357 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8ZnIRRjJf6gdNzwMttMA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: e0eSsgdQlp4bLZ12WcBDVLToCTxjO4JU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609280055



On 9/25/2026 7:18 AM, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2026 at 06:09:01PM +0200, Igor Skalkin wrote:
>> From: Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>
>>
>> Add the common virtqueue handling code (command, event and data
>> queues) shared by every role, and the virtio-usb host controller
>> (HCD) implementation, wiring it up as the host role of the dual-role
>> driver on top of that common code.
>>
>> Each host-role virtual port gets its own HS+SS usb_hcd pair and its
>> own root hub (struct virtio_usb_hc_vp), with a fixed
>> VIRTIO_USB_VP_MAX_PORTS (8) leaf slots pre-allocated at VP init time
>> and reused across connect/disconnect - never dynamically alloc'd or
>> freed. This lets the backend forward more than one physical socket -
>> and, for host ports behind a physical hub, more than one leaf device
>> per socket - as independent virtual ports from the start, instead of
>> collapsing everything onto a single shared root hub and having to
>> revisit that decision once more than one host-role port needs to
>> exist at the same time.
>>
>> virtio_usb_add_hcd() derives each VP's HCD bus_name from the parent
>> virtio_device with devm_kasprintf() rather than a stack buffer, since
>> usb_create_hcd()/usb_create_shared_hcd() store that pointer as-is in
>> hcd->self.bus_name without copying it - it must outlive the HCD
>> itself.
>>
>> Every port is host-role for now, since no other role exists yet;
>> vports[].role is populated unconditionally until later commits add
>> device role and OTG-based role resolution.
>>
>> Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>
>> Co-developed-by: Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>
>> Signed-off-by: Anton Yakovlev <anton.yakovlev@oss.qualcomm.com>
>> Signed-off-by: Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>
>> Co-developed-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
>> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
>> ---
>>  drivers/usb/virtio_usb/Makefile     |    4 
>>  drivers/usb/virtio_usb/controller.c |  105 ++
>>  drivers/usb/virtio_usb/controller.h |   35 
>>  drivers/usb/virtio_usb/host.c       | 1335 ++++++++++++++++++++++++++++++++++++
>>  drivers/usb/virtio_usb/host.h       |  203 +++++
>>  drivers/usb/virtio_usb/vq_common.c  |  740 +++++++++++++++++++
>>  drivers/usb/virtio_usb/vq_common.h  |  163 ++++
>>  include/uapi/linux/virtio_usb.h     |   16 
>>  8 files changed, 2585 insertions(+), 16 deletions(-)
>>  create mode 100644 drivers/usb/virtio_usb/host.c
>>  create mode 100644 drivers/usb/virtio_usb/host.h
>>  create mode 100644 drivers/usb/virtio_usb/vq_common.c
>>  create mode 100644 drivers/usb/virtio_usb/vq_common.h
>>
>> diff --git a/drivers/usb/virtio_usb/controller.c b/drivers/usb/virtio_usb/controller.c
>> index 2fc6f50..216edfc 100644
>> --- a/drivers/usb/virtio_usb/controller.c
>> +++ b/drivers/usb/virtio_usb/controller.c
>> @@ -6,9 +6,16 @@
>>   */
>>  
>>  #include <linux/module.h>
>> +#include <linux/moduleparam.h>
>>  #include <uapi/linux/virtio_ids.h>
>>  
>>  #include "controller.h"
>> +#include "host.h"
>> +#include "vq_common.h"
>> +
>> +u32 virtio_usb_cmd_timeout_ms = MSEC_PER_SEC;
>> +module_param_named(cmd_timeout_ms, virtio_usb_cmd_timeout_ms, uint, 0644);
>> +MODULE_PARM_DESC(cmd_timeout_ms, "Command completion timeout in milliseconds");
> 
> This is not the 1990's, please do not add new module parameters.  Just
> make it work without manual configuration at module load time.
> 
> If you really need a configuration option, make it per-device and use
> the correct, modern, apis for it.
> 
Agreed, will remove it.

> thanks,
> 
> greg k-h

