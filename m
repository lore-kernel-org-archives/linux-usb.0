Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FA23822AA
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939461; cv=none; b=IGwBsmqUj3pCfzs3c9tHMHBXp4OjAxogXMscwaEx2goUTcPgemmys0LXShAXjrruVY3giCJNXVi91l9AsZifH9S3v5pr80uuQPsLOapkPW/ltUZWi0cB1eZO8B81FuuiB8N5UCB0A+qCsKmzIEvoGAciwxxSdGXQiDCaQ1glqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939461; c=relaxed/simple;
	bh=rIQghz1DdBqWmQCzB2UZAKvYVAzvTlzPkeyezBhS2hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hO+jI+/V/i0bet6bB01ab504boCbAEfjQK2VON9ni5BI/2l5XlNF6FSLehJofftxsrn/fMKCmwfj9DQE4l5OHUnKYZQJ7CfCJvMEOcZ+4und60yZ9KOmGpjJ7AQ3e6b7Nu+eJxUqPv+WzbXEs4PtI3TKhOgcV059Joyt1rcbakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIjSZK74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIp5mvcR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIjSZK74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIp5mvcR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGK6qo3418635
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 17:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=; b=KIjSZK74jDbrkl6X
	sFtBt8IqND77X7UIXtKK33M5WQbN56AdcNzvWsp/uYLfKD8H1EL52xzqL1UFZMjn
	uMsKw+fEce6lilkYuuR74yxa0ERjCQMb5L21QsypQuo2So591WTUT6vLQ7g6CNX3
	ITjWhIIa3vENHANfOX0B6po5j7pJKo39u0l4aNHbuABV2TkfNICvzHytf7iB/lEk
	ecDd20JUWTgtgRnaSJCPs+33ymh61bC8vls794CA+40FN4Wf+dvAP3hLzahsv5CX
	ik5rjBDRPXzs4j/3qfphrvc30SzOj2Og/5hL6ZJZ3mUFWrF7c3VdpPABW2ZlZ9l7
	0fqtQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3be6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 17:50:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2197044a91.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787939457; x=1788544257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=;
        b=NIp5mvcREgpYBbkTbG9qe2Vl8GUdeUhB9AzQlYXSr5UlWslaWqo0FoZvXda9Dr5mC2
         ety4Bs+8CtwWNMlyr+QQSZXiICUwJ5jviibQ3VFJVnId2Qk+sHR81u4F+g4KAgFKgXmb
         Ozw2zUFt9/pOX/2ZDRjdlEDabUtfrqrftr0eTKuruoqMRnDWrC4Wj5bh6x0k8mvEFh3g
         dXzsEFDo0MqBEVwdlapRLinBMrTh2phivh0QCdAZuD9NIKjAG7OFVd2hpW68mjW+UTeC
         5ZjmPCgy65p+qUCKtTdgOd0US7GBoQoevtN/tFpo7ytTdMdFx48hcik3V8XbSw3yF1EQ
         VDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787939457; x=1788544257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/OxxXV9WtxfoOsHrFSeDk4/H9j66TfeNbkxSbwQuzw=;
        b=Mq7PXF9EVIFyV/m7J/mzvZIhpnlI6TTbob61/6b31BeWfRJBUF+0Q8jGjne2lGTT/Q
         0ukEOR4KgCobvfxHx5HyIMUOw93qt1lv7AYafzB9PhUe+OxMAq+qkkSS0+EqFcE2OTCa
         HKxMdOsk+w3A/rYkX2L63kcXeMmm3JR2HrNBLei0cdcYzTFb8waoX36v61cia7KPwlqm
         iRPMCOoIiQIZzaiTkT+EYxcxCXuUGWh+1ZGiSvJOrfhvbAsTW2idrQRC0hCqILWmrq8L
         IMlYMYFTC3g/wZrodBTDuBmLOWDi6b6JyWKI8ya0TUcb5KgSY60NLzhbyvJZ3y9SGMwg
         BS4A==
X-Forwarded-Encrypted: i=1; AKwUvBxjVre2/Xk9Wm5p3DxOCuq1zXkH6/AWxwgqLpgZC73Sep/fyQo8qr6zaPGBxReOOI9fPnNJFZZVOb8=@vger.kernel.org
X-Gm-Message-State: AFuF++msjGbQF6ub19df1WDyduZADYBVTeUUpcYk+iTJ0x8jbBQWumzs
	al4o/19knFuhtEaW69NpqpAMKGBaUQC9oG8Ra+bYuM/lxoiKh0z1clxdI7D7KAyQvHK+R4aLUmT
	ddHHuPDp53USJ9oIUo2WM7+XibAO6fM3BbkrfWiwsVEdBKzAyue4WkX/kC0Air3g=
X-Gm-Gg: AYBFou2ulsoBEAwZfbVHWx0NHcrgrlgzqU2kB80YCPARMEp/s+4XlzDTa1DQEIDgrat
	pkv9PEqR4cAQjg45p76Bel86fDznizpCIFAILgdIlF2qtn4R6Ssp2x/GZlTJv/DAI1gwNdIfmO2
	0kpKCUuo0Ao1/0kf2SiErTnpsKBvLGKZTzT9x2fWs0YYj9llMlrJYuVzmkB7hv5vJwghxS1xq4e
	5R0jT1OAH5SI+emqs1KbUaBehH4xugY7dtsteZl9i+LJyeMS7DQcR2iynzVKa77+3IDdvbi4fU0
	Hq35HV3CICTaaPZYI7uwsCbZdc5HfOa9rMIyU9pshzgIxSrzU65n++CYQTOylsU6LCx+9Qt0/Gj
	QJJqZll5+ff9U1tjE/zn94ItOL67LO+t/K5sSVpSGJ8M/ApvJ1jrOHP+zK/7vKCFEn70=
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-3989bd40d7fmr2370347a91.18.1787939457154;
        Fri, 28 Aug 2026 10:50:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1d04:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-3989bd40d7fmr2370286a91.18.1787939456661;
        Fri, 28 Aug 2026 10:50:56 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.243.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fcfa3asm8082192a91.6.2026.08.28.10.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 10:50:56 -0700 (PDT)
Message-ID: <26da98ca-8074-4116-a1cb-291f306f55bf@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 23:20:50 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: xhci: add xhci-no-soft-retry-quirk
To: Matt Eaton <linux@divinehawk.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828-xhci-no-soft-retry-v1-0-b9c264b56601@divinehawk.com>
 <20260828-xhci-no-soft-retry-v1-1-b9c264b56601@divinehawk.com>
 <1aa6d82a-0d35-45a4-9ebd-1c3d8929e611@kernel.org>
 <CABUBpLfsjscV1-ftUPjKbL4EYq-9NSHYSCGJ_vqStM7k4FtkdA@mail.gmail.com>
 <14fd70cb-d07a-456f-9800-d3ece4039529@kernel.org>
 <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <CABUBpLfH+bi3Q5hD+WWG0QnyCfmQMRt9TkUN+zC1pvH44ez90w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1NSBTYWx0ZWRfXySsj3MiicRk7
 zWuQDsQALztGzsvlYh85xRIIirOn5UWg3IVT/Wa2Zy7fxhbNSrDaeQDx+rckZF8wRoIq8tbFpsD
 pHk0ai1rH14QT2viKEZyvmVOuWyBOXERP2mc7f8IbB0mm2d1nI/Jw1A7XNX9xvJmeToBCq2X5i3
 OFyCEQkbFteMFtwm1FDZNsqCIMMmJ54AAKuvZ8cLfeD9yoZt0ohXcr+MuZu0/pw/jiEMfNt07k7
 /Kk4mpVSBtlKC3LqB2TwcvTzp9eKxGRFAKuDXAdNdKzgtG8OYUNB0Py5P7Yx/cuef17tFD6dHVH
 6JWcW8Tj/ERTlQ21fbG3pZxRjf30z50tLAmhh0yq+aSRLSv0DYPh7YWNJ3LaavvRusSIE0q8sNb
 G9VQcH8fOsf4BIONX1CmBBM/qlZ4jTQacIVfrviqDqN6u1ISotGLGOGaGUSFOOscUp4n8jfqtNd
 31Fov7jSzg7NSINLi+Q==
X-Proofpoint-ORIG-GUID: KOmgZxMIZ22r5YToXXTfL6d8RXYLmd-Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1NSBTYWx0ZWRfX75hyD/q6peFS
 ypYNw+GPkAe37lbkr/TWXItJdjWdAJmFFB2SF28HFx+Lc8JDpszZqrNGe1GIOhk1P8dH6N/an3a
 GO1ry/LNEdIiqFSQN0UYsQfzyer1Kz8=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91ca82 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ypuo+zZCpu048z3kylcvuA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Chss0xDGAAAA:8 a=_7onyXRF9wsX3SFU1x0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=VZ1z_dUGxXw8Qzmhq9nZ:22
X-Proofpoint-GUID: KOmgZxMIZ22r5YToXXTfL6d8RXYLmd-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280155



On 8/28/2026 9:37 PM, Matt Eaton wrote:
> On Fri, Aug 28, 2026 at 3:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 28/08/2026 15:18, Matt Eaton wrote:
>>> On Fri, Aug 28, 2026 at 2:39 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 28/08/2026 14:37, Matt Eaton via B4 Relay wrote:
>>>>> From: Matt Eaton <linux@divinehawk.com>
>>>>>
>>>>> Document the xhci-no-soft-retry-quirk property, added in the
>>>>> following patch.
>>>>>
>>>>> snps,dwc3-common.yaml refs usb-xhci.yaml for every dr_mode other than
>>>>> peripheral, so a host-mode dwc3 node inherits it and dt_binding_check
>>>>> accepts it there.
>>>>
>>>> I do not understand how this sentence is relevant. Please describe the
>>>> hardware needing this.
>>>
>>> I came across this while porting the UniFi Travel Router (IPQ4018),
>>> the stock Qualcomm kernel is 4.4.60 which predates the soft retry
>>> code. The command ring hangs if you disconnect the device while it's
>>> transmitting. Reproducible consistently when using USB to tether to a
>>> phone.
>>>
>>>>>
>>>>> Signed-off-by: Matt Eaton <linux@divinehawk.com>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> index 4238ae896ef6..5d67a41658f7 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>>>>> @@ -25,6 +25,10 @@ properties:
>>>>>       description: Set if the controller has broken port disable mechanism
>>>>>       type: boolean
>>>>>
>>>>> +  xhci-no-soft-retry-quirk:
>>>>> +    description: Set if the controller cannot perform xHCI Soft Retry correctly
>>>>
>>>> Why isn't this implied by compatible? Looks like controller's property.
>>>
>>> The xhci device is created by dwc3 core as a child device, and so
>>> xhci_plat_probe() is used. I think a DT property is the right
>>> approach, similar to quirk-broken-port-ped, but to set
>>> XHCI_NO_SOFT_RETRY.
>>
>> Linux driver behavior should not matter here. DT property for telling
>> Linux what to do is not the right approach. As I said, it's implied by
>> compatible unless you bring hardware reasons why it is not. Driver
>> reasons don't matter.
> 
> Will rework without DT property. Appreciate the feedback!
> 
If you have any upstream QC target that needs this, you can use the 
following patch as reference:

https://lore.kernel.org/all/20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com/

Regards,
Krishna,
