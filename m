Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226139CCFC
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093910; cv=none; b=EQ8RrzPEziD3CCGEvZj/Cqe6pMpCCKhPCe2o2BOggi+dz7AVly564I4pcAz4KGBgEcmyE7nr73hIl1WKSV/GBtzF7EwxYMXcAd8FOjCx7MlUaBk7fsFvQ7p67R70M9IO0thN136aTq0+rB2Plt2CV2u1RLZfV+3Duu9O0bNDh4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093910; c=relaxed/simple;
	bh=i3/b9t7IlZg8KXkmOMXMHUx3N5cuv2mcPJfMFSHaElk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GIfnzj9EPhIQEixy3n+uIAF/z4qWNnrtiljgQTbQhHeUdOax2OfFEi2lFTmXdhCUOdgPQGYDkvhbv0zZ268MRZwNgc563/LjRA4xh/+q+S/gqOo2dM1VgdZXZai4043mf11BlyHqZAebhIYlceYVBruhyz4zYWPj4Zj9D4gi1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNbG5je2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5nCbF94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNbG5je2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5nCbF94"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lHuD2621111
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=; b=kNbG5je2M9021Jl7
	805Y52gTi9m3iLyQOHaYYyqnSv4+iz+DcJDIFouVe9/fY7ZC1W+0T7cgyQ9BlaSi
	w1w7KqrfwIZIjCYH4aBnEWz3s/C+RX0qgNObDhwaO3jMPz1fMvGvTspPnnwvNiQx
	0IWxiLI3kXyasDYXu044+A6SWzbNgd9g75gb0c9vZg8tcbA3yg739R0gqJV1rtQw
	35l1hXy7JwlTG14rWRgqu/7e2RlOaEUMZS8PmSpgmzfKvMqPkuySLWTkSmJAEuMd
	kTKWnGS3Y5iJnmrAIvh1+q+DPPpy4YU7BKqTnV1qIjnc6Xm9GiSS4bROKgUS3yXx
	V5Z6MA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vgqq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 05:38:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848568a6f62so9048622b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784093907; x=1784698707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=;
        b=d5nCbF94oHGZByIABiJVpgPNxoPy7kfU/mViUHQNJPBpWazB1tJpJ0WSf0RYtQOIq7
         37ihGcj+S+gdaFo1BZ/hRtKusMUuKydyfVyK0iWznKADyZtphgHlD+V05LuByICUOfCz
         MPt7quEZr02uvO9Wq/XAGxtoZK0sGghWxdIrFgXeTs5smwIP5faB8alKuAzM7mr6vmvh
         tSuZbrG8n3WXDfDY0r1xNLG2MfP724BnsdMBjTtweyikhW8MW5YtwRLJEol/sfuJv7M2
         nKsLJd/q3jpW4xudshU29U6uTdPL+h7f+P+OFC6hiN60F+v2qYhYxq31Oa+QFAMGaZHH
         GMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093907; x=1784698707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=covuqpyp9O+Jd+SJApZyarU+kXKaweFVvywrnTyrtdM=;
        b=B78rZ+cPUxVshlBmEBCgqZZ7GPGA62lktkrPPcWHRfUv5E77bgph3bPyRk4tIAnPkP
         y54r+6W8tzqPgBR/8grh2hu1qFPmgak7l7naPIXD0tDbPn1pRY7LI26EBape4oebBbcC
         ANNLMrH6QzCsYzLX1IhdGpM6JODQdAbcT/p+W84mIT577uqL5aDG7S837BWv3pHZGzKr
         wCZTNmQtfNWslyfyfxSt09gBscsHX0xInZK3P98dgNSnrl4J6N69F/dgXquEla+LSmVP
         NaRZGXN8Fsysq3hxuJq/ShC+UjvF7gteDiaK+hM/PFuz5A+7jOpAYYDQHUk/rctb0B5S
         yFIA==
X-Forwarded-Encrypted: i=1; AHgh+RoHjUbZydux3FVWa4O7jRpo0qgwNY9k8sjJsjyqYDhWP1n6zc8+Nw6qGD0dQL6YWIUDGcxdfGoaghw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJLNohyf1QfpmfUZ0dpFlGfM7AwjxZOIS3SELYr5CiyRq8nj1E
	NTaqULadIhMGlvFOHFChjQi9+DGTHLxsw/UOKB3HJ3G/AiCWP7+ryG2kdOeO3oyYRZvPZegeNfr
	VK8oTSKMpIkxHg6A8mnU+fM26zYnMjJk1XWRwcfY6pv9ivxTrH0zM9i+zV4in5U8=
X-Gm-Gg: AfdE7cnERiDiijs1uf84IdiQhKBLprV2QDOfMPbjUEE6FSSv2pHH52V7QwMCcnckZAL
	V9KgVVkIaMVOfMxd+am+UevdsuXgCyrV/tCKulki6yRNP0By/hOPS7qnE2Xe6dSeqtPZxqBwUcL
	eJOuXazqwAb/BZNA/qXapbITugiLgQawp8y2fZlMd4XEr+hkFeqscXcsUTUhTfUYkSswvSCWupz
	CuPlPKZv+DcN8Aavj11yhEPS3RAXyVIPtSTkskE6ka8L3VEoyZUdH124OL9RkSoqntjWKyKbfIG
	x+C+fznVnTl6lehAEfx6wQv+xjB/SEf4H+5jbqK0IQb1jKj5XAc1HJ439VQVX+Q4YgrJTlWOyy2
	2RD08yCqcb8aeguYKJxzFWNDwY7wRtIsSxWEmQz4wH3+rLv4xA/bWhxrEhddZ9pPCUOQqERkN1o
	iTbVw=
X-Received: by 2002:a05:6a00:3d4d:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84a55624dc2mr5302054b3a.20.1784093906515;
        Tue, 14 Jul 2026 22:38:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4d:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84a55624dc2mr5302034b3a.20.1784093906014;
        Tue, 14 Jul 2026 22:38:26 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dadefsm2420750b3a.45.2026.07.14.22.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:38:25 -0700 (PDT)
Message-ID: <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:08:20 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox> <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org> <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com> <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com> <albAccNnsI12AIUo@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <albAccNnsI12AIUo@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a571cd3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=jzwohxEhcxs_Eh9CruUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NlWDhk9Vhg78gIehQ95FycgtLeU23J0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MSBTYWx0ZWRfX2bB6tvyzMj8v
 Uhd6KF/qD4g9oicerBbmMVRcvXZFpFkEe0djhc60nvsIljcD0I/pLHK3a+1BEAbtYrjaGIxGhTl
 61unP4EZNhAGZVIt45e7SU4rCb09OsQHT1dCgDweU+Ogc5btxghvpOIExRb7UTbU0yXtS1KCbaR
 vG98rUxUygTAO8cQ7QfV8R2nuhwuG2+PsC2wUGWdWocN3XUF6tcyfgzXJa4n6qeHkX7KiUY6FkZ
 C2DKXyu0jti1IkQSqukhl0SiQ8h1baG9RtAIK0hB6Cl2oSKTzI3KlTvmRQfwtqs4Z7SwrOOgrWT
 j5iu+W7EdX2gBmb4kHGmuOINLD32/+VO+nVwOXTv6EVMC4lqIJK0AQLgTXq92afiHA2y1L6J1ZC
 aYywvg9Ym7yYoikcbAWKgmhUp+4zsSqxDHrNJqAqIGan0jwWkfqh0f7LTDu7pslHbvLkQ0USVLE
 phlyLK0tgBP3e71yALQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MSBTYWx0ZWRfXwhBQl3rbnq6Z
 +xoshsVf1ZvZx1arhXLoKrdR+uW0TPPEv+eajhSrn3NuFF02jhY6YNNX5EyvGFe1545vSvYonm2
 c+9Eg44U6WIZ5jq2u7Zap+uzaJuRaGM=
X-Proofpoint-GUID: NlWDhk9Vhg78gIehQ95FycgtLeU23J0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150051



On 7/15/2026 4:53 AM, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
>> On 26-07-13 23:41:14, Thinh Nguyen wrote:
>>> On Mon, Jul 13, 2026, Peter Chen wrote:
>>>> On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
>>>>>>> And Dmitry already said this at v3.
>>>>>>
>>>>>> And I've already responded to his comment in v3:
>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$
>>>>>
>>>>> It does not change the fact that type of phy is implied by compatible,
>>>>> thus you do not get a new property.
>>>>>
>>>>>
>>>>
>>>> For USB2 PHY, it has property "phy_type" already, it could extend support
>>>> list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
>>>> or re-use dwc3->hsphy_mode depends on where it needs to use.
>>>>
>>>> diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
>>>> index 1ab134f45d67..5cbf17d493ad 100644
>>>> --- a/drivers/usb/phy/of.c
>>>> +++ b/drivers/usb/phy/of.c
>>>> @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
>>>>   	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
>>>>   	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
>>>>   	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
>>>> +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
>>>>   };
>>>>
>>>>
>>>
>>> eusb2 uses utmi, so it doesn't fit here as a separate mode.
>>>
>>
>> Hi Thinh
>>
>> Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
>> Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
>> Features.
>>
>>
>>> To go this route properly, we'd need to introduce a new phy type
>>> attribute in the phy framework, which will be a bigger change that may
>>> impact more than this driver.
>>>
>>
>> It is not at generic PHY framework, it is just for USB PHY dedicated.
>>
>> I do not see big changes, it only needs to change above files and related
>> dt-binding files, and other users may leverage it if the controller
>> has special sequence or settings for eUSB2.
>>
> 
> The usbphy_modes describes the interface between the controller and the
> phy. eusb2 still uses utmi, so adding eusb2 there is sematically
> incorrect. If we introduce the eusb2 mode there, we'd have to audit dwc3
> and every other driver that uses usbphy_modes to handle the new mode
> correctly.

Hi Thinh,

I don't think any existing drivers need to be modified after adding 
this. If anyone wants to use the newly added enum for any eusb2 specific 
purpose, they can do so in a diff change/patch I guess.

Regards,
Krishna,
