Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF945C6EF
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515329; cv=none; b=RNmrRiRDDVTJTg/Dk5RbHc96ZdVnb6Hgq9K5Q1R9R7X0dyWMOpZ6UH0HGV7Zjc54X8tIdCmMAYUzVOLGPLtC52xYNsY0A2OEJjwFzgXPHXvzsdJJVkz4RkvVrwDnFxsF3P8alvXrTCPcWwvQ4GDD7HKMs9zyGuTnlNVpXZFpmOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515329; c=relaxed/simple;
	bh=tdIckQhLNbQNSl5V3HKeuTWwIdJ326oXapW+yHipcXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKRuESlFKU2B3Bwwa4rjvNquCCRRiG3lPe/Uf76+n9A+H0peLeu6WWZQf5xbESqIudri7k7KjGW5nwz47ZZNr7I/6slifwC696b+ivtVyy10LdR2hDdh2d5sOnBnDEbFkcJbicAnV5dhe56rW5hup1dkyeyai5+tianCyDFFiNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZ8qIkc1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ij+QHXfM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZ8qIkc1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ij+QHXfM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO5DQ070846
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odqlC2FoPgYqgWEtEvIgQYwkoAQU4wo/OhJb44epMDs=; b=OZ8qIkc1cHBlefwq
	b3qjVnJ8PnTRnT34MU6TTLI1d9MoAw85if6r6CQ0NNPsGxay+j7cvZOyCdLN4hGU
	r6urCOKM+LE9QgfStgCLq2U9Q8cPMBqyavVsGP2daCwZ4ckwdHiTapyf6Hj6euWX
	8pG1Y3O3rGwW6ZsuVHCud2J6RV3aIQKvAs7mZiTij1wAdLYwrM52hCK8CMn+BZTy
	GdMnIMLjy+XL9Hg76VRNpGPraAAmswRz7/flMZYVKpTENLRFTl3MZQpHEV6fMZjr
	vhKVdXT70XhcpO63gDAfuj6oAPdwqskwSgXaevdhCojU0d/4vYUYhXvYqCQuhWuw
	KVr1mg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqha3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:28:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c15c77619so2070271cf.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 09:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515326; x=1786120126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=odqlC2FoPgYqgWEtEvIgQYwkoAQU4wo/OhJb44epMDs=;
        b=ij+QHXfMm3ZugorQqwNO0wvUt3HGu+157KxGKVszUKpY2lMjMTMpZrR593Ngfpadlf
         QEVdt8mrUsEjNpyg6leYkVdmLhS42kqI8CwCsLhh+ZYCsLacS/JjJjkhqx7rV5whUNRR
         HlBwe+1RIgzKKB+Fp/pGOi4+TNdcgftvSD90xk2rF7L973oV4udF6KH9qr3RoeHurBAH
         Qnt2DHsubb9/o4uJJcuqAXyeMo4N1iGPu+x09EQSS3DM1STZXVs2IYOAGu2EIqAI+pLF
         RPP+Ad6b7IrWNse2qjBCw96Bz7jWu65tBKXdYZwPgEQ0H72ZmhgVSUdI1H9XrF60TMJG
         SGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515326; x=1786120126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odqlC2FoPgYqgWEtEvIgQYwkoAQU4wo/OhJb44epMDs=;
        b=Obi9Tnqn/nFax+jJQ7BSMiygGyaafTL9VXmCuQ+T/XfiNyzOT3t/5n5nrHffndayy/
         x7TAuVp1mAnBH0zkk9IUaPqf2mrhmRHKfqGaSb69a0WcuIQ/KOp/3VM24w7Onv+UoSxN
         n3FvrmNVK4i6MCPsF7buOE4Uuw+cUvpYtmcslKzGhy0n3FWayKpS4ji2IoJso61i9302
         DBn/COakyXzawe9e5P9TQ8c1Iz6IeskkbXDxK7wZl0Q32ck6ojJ/gK635j9Lg9BPvPHO
         SWlAYohHQfku+tBiVdLpEhZsZ0w3w9MLvTssyM/D1radvCp92zqCv/Z390TBqROyBxt0
         sZEg==
X-Forwarded-Encrypted: i=1; AHgh+Rolw68Y8tmWQXyi3zcQy4vV7kOtBlgCLCknipD2WImpIhuygrAipBOuHcuExhzIdkf6LiMLwQxR2p0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/KR71mdtTNZFXAqedlbrUN0/FlZxXlJBXyz6HykxPWWhf5PCG
	+tYcG8h6AZ59TxIIjyo0MDbrSBBommwuFENhPqJAW7knwwQcT523q/dhFiZvigOLpCARB0/KOah
	qJ34iKNTmHPRu/Q/xGR7R5AhyzatYXklnUmupuUVHnwQt0WHkPw1hQDjxxc1tf7M=
X-Gm-Gg: AR+sD125T75c98e1v/tDqw1f8OLHq+ad8H0NpBl+Jw5l4yKGsTVkgCsfLfjHN0QyCPQ
	PSpsISz+laD9fiSQIfJFO14axLOacIaGo/2eCxNq6NxuTHQd2tzR0ji1RrPM/31LO2nfHPXPfbu
	g260DEXbTp36SGyZHvMn6j1bn05lGbLxV6Y67VuW83eZty5pc8gn2I7kU3NeHryu7dsz6sywNEE
	I2ihNw/f2pNH1fFbBXNjfjMplmgu/cvR4CUujQcVT/vSkk9NaqunEPqZ5Z1O8AK8w9RVC7pBVKk
	l/0v27f9cqd99hIp/5zDNX3IJ6q/LV96rFG9O+Y8EV1P63dVCvmIaK991QGSvNCDMndNS7KIWjv
	Jg+wsg0RAaQVsy53RyoV6sYCI
X-Received: by 2002:ac8:7e81:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b567f85bamr10459981cf.3.1785515326342;
        Fri, 31 Jul 2026 09:28:46 -0700 (PDT)
X-Received: by 2002:ac8:7e81:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52b567f85bamr10459421cf.3.1785515325767;
        Fri, 31 Jul 2026 09:28:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44542d2sm229079466b.35.2026.07.31.09.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:28:44 -0700 (PDT)
Message-ID: <2ace2703-79cb-4046-a2b3-8fdeb9b2c99e@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 18:28:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
To: Esteban Urrutia <esteuwu@proton.me>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
 <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
 <20260731-savvy-piquant-chowchow-f516f2@quoll>
 <9718d7b8-7303-47a2-9d75-58bbde6385e9@proton.me>
 <c4ceda32-d4c8-4fd9-b0d6-3f4519485bde@oss.qualcomm.com>
 <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6fc5165c-95b5-475a-a0a6-e1d7b9721222@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX7YLGz/h4eWZc
 soAgo2bAtqASQyP6n4HXgIazNzQQAN5WsvMDFUy1qmYwoncKHDb/8I5YGyKMAqZn4zjfUuDh8AD
 s57QZjh7VlwjQuyPu3KWbkq2YFYrO1CWNFx/Dm1tXowX6yQ1NGvJwhhiYnuKI3Se8dZJLkz+5xp
 /bVyvKnM9RDxVg7NMIMKrGsRP5ZOCyqcDQll3VWX+CXzVSGwBGZZeH988DC3t6wQ1EEtdQv+NQN
 watIbA+/e2aRwRk4lLRHfgX5M6tljdJJB7I8klq3n8ciUR3Q+UkYZ5CR9Fry+el1tnei7DduK4l
 SsOrz4X1JlzU2M+7mILTgc7n5Cumx4jRfdjzW3wlkyjG4D+FkR/g4shFpGjGHvbShqmIijQ+WFs
 ffSlqNfrB6Xt3jvpboSJTEu629WHe/8E7ubx5W+mKG35bAqCKRtLNqWcuILdXYxEvUjLKQ67EVu
 Kwp6eCcuVKHQVcMFkdQ==
X-Proofpoint-ORIG-GUID: rMNBw1N--LmzsFTcpF19-a2Ke1DLtudZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX8aJ3cnRJPR3E
 bYOrP6OzbaaVvfx8uiglAI2aduchQf4uQ+8c6p2juM9EFviVEOrCUHUH9mUiIHzrFtca9q9f9zc
 HfWJ+FZzRdTlFKLYFyCxjR3WKU9GpGQ=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6ccd3e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P4BrIvBfxGhJqZf7NZgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rMNBw1N--LmzsFTcpF19-a2Ke1DLtudZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

On 7/31/26 5:54 PM, Esteban Urrutia wrote:
> On 7/31/26 11:30 AM, Konrad Dybcio wrote:
>> On 7/31/26 4:44 PM, Esteban Urrutia wrote:
>>> On 7/31/26 5:58 AM, Krzysztof Kozlowski wrote:
>>>> On Fri, Jul 31, 2026 at 01:00:08AM -0400, Esteban Urrutia wrote:
>>>>> Due to a different process design, SM8475 (4 nm) SoC takes things from both
>>>>> SM8450 (4 LPX) and SM8550 (4 nm) SoCs.
>>>>
>>>> What things? This is just unspecific and not useful. And I doubt that it
>>>> is even "different process design", because how one would know that?
>>>
>>>
>>> The process design is specified on the corresponding datasheets for
>>> these SoCs, which are flying somewhere around the internet.
>>> Also [1].
>>>
>>>>> Add a separate compatible string for this SoC to avoid possible confusions.
>>>>
>>>> No, explain the hardware compatibility.
>>>>
>>>> Add foo bar, which is not compatible with baz because it uses bam bam in
>>>> different setup (difference in registers, e.g. XYZ and ABC),
>>>
>>> How does this commit message based on what was said in [1] sound to you?
>>
>> That made more sense because the electrical differences are what made
>> the PHY init sequence changes necessary. Here, Krzysztof is trying to
>> express that the pmic-glink interface found on SM8475 is likely no
>> different than the one found on SM8450 (and SM8350 and so on)
>>
>> Then, since it's the same, it can reuse the same driver match data,
>> so patch 2 is unnecessary, since the driver binds said match data
>> on the fallback "qcom,pmic-glink" compatible
> 
> 
> I don't understand. You're implying that the pmic-glink interface found
> on SM8350 and SM8450 is not that different but they both have different
> quirks on ucsi_glink.c.
> No quirks would be applied on SM8475 if patch 2 is not in place either.

Somehow I confabulated the generic compatible being present in the
driver... I was trying to explain that 

And yes I didn't notice the 8350/8450 difference. But anyway, the
resolution will be one of:

// 8450 is fully compatible
"qcom,sm8475-pmic-glink",
"qcom,sm8450-pmic-glink",
"qcom,pmic-glink"

or

// 8475 is special
"qcom,sm8475-pmic-glink",
"qcom,pmic-glink"

depending on what you believe is more correct. I think the first
one fits better.

Konrad
