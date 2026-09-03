Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862A73F9F56
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 06:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417764; cv=none; b=S+We4PoOkcNnVIg3s/1Rq/WpsmTnKJe/YN3xYC8mw4C/6wdt41051HVrImkr4mCxN8diSn9yeEXOqSob4iuFwl6YTXs2+es6gW3E0z1S3Wjj7shl8/00Npn62GitOyJrK1YV1HcG8Hcl6bQiN1qUdOgTv/4EUEbIfkvQut8dc7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417764; c=relaxed/simple;
	bh=coE+A/T6OYtv7EloBtl7FHeKXqEGRgr30Nuq5NB6xjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2iX4QP5O8prHqZ9xWtlrGYsh+KW6uC7kfnbrR4TUMtQoJT+m7wIdEogyweUSUQKsGEDUmRg1jqrDmEJaD4m3m+prgfwLJcjrJDvxxlIJjjLoJBWN1kmj0C/rbqwLsBraIfAZlb2de02c7d1xPEo3lfh9K8F7ox7B4R+4F5OBxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lu94deNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNhubKrC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lu94deNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNhubKrC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835le0n3176916
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 06:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nY9b52v+DMvSwQj8tMDjZurLWIWOyHhy9GI9sNJbL/w=; b=Lu94deNH2niA1kju
	pvKGlpE3wf3qlQGsDZDywUPlfX4g3iBhdCbiGpO14W2c/hX+GaE730KDq/V3cQ4a
	S+afsGgl4PcasT1iiwvv8fCEsgExGvyaotTUYLy9/ONQ0pJ3uMlSIQB0y7d5alom
	/ufL38pp7nGr5jXdPetCbypJR9WLqeNVDls0jLq7zeTOkfk6reOiP0mT3tdjOFD2
	m1Rj9tk8nPUyzABgwNU/bPyb4Ghge2Il3Duf1ekUq0KRitJRNkT5569II0afCJ8f
	07rENu8bMnH1QtoJ55GuCFltRythCNEvIrPU4i9RhowoenuKzJpxtRz+itG7g3jL
	K50c9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4uuwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 06:42:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a312222dso35346385a.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 23:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417754; x=1789022554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY9b52v+DMvSwQj8tMDjZurLWIWOyHhy9GI9sNJbL/w=;
        b=DNhubKrCMl9JweXTot0xGOdGZKrNdMvxUAhpJOQrZoy3FVXqcef+I+IaragWnvgWN2
         2hOx/VkFX+NoQPZU6k6v+1BUbAhlIc5Fbgwq2udIJW8kZ8ve4WiRG4shY5r7Of7noskq
         kvmGAVtiZKrNdYPhIqDCbGqycszqlPfbEWfFtA4CVPqxl3ZCd5jXbO/ZHyNsjcPEvWum
         wouRfBt23+TREx9QYf6fSoL32LlmW6FY3WQDoF0QyIgMN3xWrVa7q9yDDDjaoDD76E8q
         1hVubkXpW+YzLauo2eaut38KIIdL1clTUIxJq3O4GWlPaIH2Cu14Xu9N8eSBNYAp5o4m
         LWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417754; x=1789022554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nY9b52v+DMvSwQj8tMDjZurLWIWOyHhy9GI9sNJbL/w=;
        b=NJkeosJHIj+lXamu1Tuj07RTMrC1Oly0+XXl6jxamg37w4Mk0EG7vVFPBfne7Oo3h0
         YLThEkmFwpK4pBoYuLLGNJC7E+kiRLOfJZLZ/QUptsRfN8cSCKstJBudw6/vW3XEHej1
         TMInpq8l+piwSL/7iRkhnRnngs02BXShLatV9K/LxLe5zg5IdljBK79xHjRPyy5jLWXK
         gBmB4UCnOkcPlN0YMoxCuVOe8zAO9mwM+/ZKCiJtrVV1qb+DDwkcfrtVGma3pvJ/zrgC
         iuTu+MU1xbsKxwwUfyAb1DIenvz9g2He3ioEDi0zz4tuy451kcTDSU6HRTh+qBHV6/si
         0kZg==
X-Forwarded-Encrypted: i=1; AKwUvBxlQGNh5f/hB4S3SbeGH6p7vk3Uz/W9p4S6UqOHOulZNoMicZn2Sl8hh2eq6kXUbio1t3GKAwx+k04=@vger.kernel.org
X-Gm-Message-State: AFuF++ncQZUcGzRu3dRPr2aZqYOaJlrdq7AFehFPYYklQGlk1uJ6wycy
	C5VllxGhQF2cxbPqY3k5tJ1Pf6BVyQUtODQjlI2DENoo5n6ql45oB4dyY67hgQTeLBRbxxAOUcD
	wt97SZ24W62tUwuAL6x7Vf3CEgPKdpQk2o2GGhggAHqNDSpw1rkjFvQhqlhh6j0Y=
X-Gm-Gg: AYBFou1boa+C6O3e7nhRbpDixpz/MV2EdMdAXTJB6VJ8fcXzEdCV7MiGdH02BA13Hp6
	4Nhf3dMkvKPO0lqNI58yXgAWhj3mzJtDRXRGGYGZZcGRoeCvrsbBTJFygk6aTA8YVXDYEuEu9Bs
	LAEAiB+oRIeiXzbBbsQpuBaIYiG+v/Th3YcrftfroFVwjNQUVaHu3D4ynrWqs1Vsj7Uz8BuuDGW
	F8lsH1DqfiLs/66ue6foNSs+YgvmsAt2L/aGxLgcDc1qbmRMxTB5EPSqKLXcb2TIQz9uzq/zDPR
	mfob1nga2h+lTt2icHUN9uc/ZN2QEv2KbFAX5A0ON+gsOkDymXtu2mtMkpqf03eRlET6ollWb0s
	uFFI1qqo7spF6ALXuAkH8gQ==
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr721069385a.0.1788417753995;
        Wed, 02 Sep 2026 23:42:33 -0700 (PDT)
X-Received: by 2002:a05:620a:470e:b0:939:5924:e319 with SMTP id af79cd13be357-93960898d62mr721067085a.0.1788417753456;
        Wed, 02 Sep 2026 23:42:33 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172516sm53588966b.21.2026.09.02.23.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:42:32 -0700 (PDT)
Message-ID: <9c63c0a5-0730-4730-b210-18a36ce57287@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:42:30 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <06bce1c2-8498-4988-b5c0-ab42bfba86cb@oss.qualcomm.com>
 <dd3c20f3-89dc-4b5a-935e-e0e142988e4d@oss.qualcomm.com>
 <b192753a-b7c1-4086-9c15-4af2008a5670@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b192753a-b7c1-4086-9c15-4af2008a5670@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OCBTYWx0ZWRfXxmzaTXQYhCE+
 /o14NJAoEXb3OHhxOLum7sQDQ5iT7ubVNIyebrWQOWyt6mGiBnR4o+pqYLAPg9149Y4OIuzIpZY
 qiclYgrCgiFsOdEGXfKxfIYuZtI9bq3uEK7UmoLRTjkXtkzHwOuRAsBKhT9kQdy8CG8iy/nsaIP
 E4u9klmA9O+aj+BI/F1DzJI0a8gSHh0nPpvwXnEE3+J/MDKf4/6YNzCDWT03DCJZibchGH6MvPU
 J9KlFf5NhMk9slCJpF3WqbfFhPVOsmaRjl1SnuF/i7eN6t9JqicKQO6shS8iuSsWi6hhFj88bYd
 74+YjUdvqy38jRsqU4K9pQbw/QVvt4THUnzwc2MaEyakzrQ/6nMtFzFmMoM6kmOHufU0euL6MjY
 HaKzD8pAaSVGEolOw5kN22pxsR6N74RAPZMukXj8VB05VUn32bHAnPAsYavaLutJr2zqRQzM8KL
 XEc2PmgS3EBoZlrDoTQ==
X-Proofpoint-ORIG-GUID: rF-pDLBZKOwQeDBj5wYRjGAGYW46jgrp
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a9916da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QueW_K6hlHS4BuxnnA0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rF-pDLBZKOwQeDBj5wYRjGAGYW46jgrp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OCBTYWx0ZWRfX48lyrh0nqIOp
 eLFRTKMVmhOlsvuLQyVW4LJOywDRwtjJq/CIcLHleQVN6o2jmv2xuhKnVdW4kBE4wT4BrgtGoZ+
 MkhnfWOHz3WzKFcqL9+fHr6d3pSxCbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030058

On 9/3/26 8:40 AM, Krzysztof Kozlowski wrote:
> On 03/09/2026 08:32, Konrad Dybcio wrote:
>> On 9/2/26 6:59 PM, Krishna Kurapati wrote:
>>>
>>>
>>> On 9/2/2026 7:40 PM, Konrad Dybcio wrote:
>>>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>>>
>>>>>>
>>>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>>>> present.
>>>>
>>>> [...]
>>>>
>>>>>>>>                  - qcom,eliza-dwc3
>>>>>>>> +              - qcom,glymur-dwc3
>>>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>>>                  - qcom,kaanapali-dwc3
>>>>>>>
>>>>>>> This changes the ABI without an explanation.
>>>>>>>
>>>>>> As per the harware specification, the controllers do have both
>>>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>>>> info. Will update the commit message accordingly.
>>>>>>
>>>>>
>>>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>>>> incomplete? Lack of context here is not helping.
>>>>>
>>>>> If they have these IRQs but it does not matter, then it is not a good
>>>>> reason to change ABI and you should just add the clock as optional to
>>>>> the end. Was this binding already released? I think yes.
>>>>
>>>> IIUC the intent of the patch is to allow specifying the currently
>>>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>>>> Bundling the DT change would have made that easier.
>>> Yes, I wanted to add the missing hs_phy_irq. I didn't want to bundle in the DT along with the usb binding changes. DT change was posted separately:
>>>
>>> https://lore.kernel.org/all/20260803-glymur-dt-usb-fixes-v1-1-0f5f52853102@oss.qualcomm.com/
>>
>> Shipping bindings and DT changes in a _series_ is preferred, what one
>> must avoid is changing them within the same _patch_
> 
> No, DTS cannot be posted within USB patchset.

Aah, I missed that point..

Konrad
