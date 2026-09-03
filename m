Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF77341A4FB
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423126; cv=none; b=l3gx8aWhzd6iy94cKsz2M5Z3vi20yXt3MaV8UIEg7hfDQpzybX5Xa7i18qCgSkkcacpYvlrBoDWadNWMnUx3O3V22Tuj7SyOgdd8veXpyqicWzGTondI9rW/JdISO/o6NCSwFTpbN5FKB1MtezSae7Oh4X9qeuvdTRU3y7X1pBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423126; c=relaxed/simple;
	bh=LP+faQ2q9FfsPkGPTysKaeADczY8Bs1t2OWTsH1X2fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxpGijXx2t6UWNLiGqaif4gdLwFnUUny9OcUsm5fp7MCJVIGTAKdA4Og2IyJMPUQVyyiRUCRKtfNdXD45xHdLQwBhCjnvrkWELtpyoLbul50mJC9y73Y6rKTeav3X89ofspPCX/dEULjpQMr780Pk5nQnozht/GIi10PrR0CtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiTy2hYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQOEG3dh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiTy2hYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQOEG3dh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lkZq3642049
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 08:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=; b=NiTy2hYpa7IuGlYu
	8mZj5GcLAaf9exfWJdVMyg5wT7ljKakRvRQ39170wM32MBQbIM/DeaTAJD0ZWsrV
	xsJBGdtjRQJCHM9iQLIfps0ZONC/qjWBe0cMQpHzZc+8SIFiK3Xlat5J2C84aCWc
	4Q8ZqXbG5gqVWfQbexlVZzpoOvO7N6MQUca15GjaThDZ11YcHkQf5Uyb+Ufpxqzf
	ZVPquDIt2fkLHnV+w7n0DJibOI9pElrFNoTANJwe6+b5uUMhB/2F9ywBx+UKI7S9
	pJ3xoHnHMVo3teVbcY2ExGvvf4MJG15LOR0N9dAQkYFlQCktFMUsQR9ku5yyVAfh
	YI3lhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrduv99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 08:12:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso900508a12.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 01:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423121; x=1789027921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=;
        b=LQOEG3dhyDqhVXZGMWshC6M8KB4sdIv22E37hi6myRnyIWbpzCO7HjFi49zrCiLz2p
         wiy1ZaUP2QA0t7l2PiIcuPlUyEvT86OdAU1Am0jCNpHlc/n5lmGLUUbKB7Qh13pS8pfP
         u6QaEqIxLjPbZeCQyMqxafPBCnnqU5wym4vf6p07oUrG7KkKBCktSDlXXmpEQbklYXJk
         FNoptrBr0Ghe/2KdiYOrpbdBKgHQSc+i5xwYRPl0fmHfeCOLBKvU0PMgyxaC/t4dDDX1
         e1OqimtcfrftJFFOdsGb5EF3dYbp8ZrliQ9XsnyyX+dlnWdnEq1gCw7xLtLRIS5GxB41
         TY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423121; x=1789027921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=;
        b=pqYZLnvMOG+rUu478EmdDsj/dFOzy6iKK+2Rky4uvDWedhPZxtlcUlbfGyAaBJSO46
         w3r27WiE6bwiQx3lKX0VFiGsjEX9/A2e5jGukiKmrxfD7npzVWCbf0CEAfjpNU7NZY46
         2HZpRGUfjdgi4F+kSAe+Ccvfk6ogkP9noZWZNh+V4pyIdSMyYmVLHF8NcSgVSoeHhhcu
         EgpadAccnopMXcZ3z6upA3ZUOhWAHtt0BfE7yNyc2N56IdxFdCyGJvb5/rN4dYRdM5BO
         dDTX6EGhFYeN1pZ/71OH2W6mzdHHg33MlO4I7O83TF7oeRKsaJZjWs5vQU/gb+RDT0my
         S/Cg==
X-Forwarded-Encrypted: i=1; AKwUvByCNr//ITVR8O/dfmls0iA/N7Qlhn85O4UNq0vpRq6O1d6hUSiQ+apLpXeXe9LhE92JOxx/96gZpgI=@vger.kernel.org
X-Gm-Message-State: AFuF++ki6MsTvHz5PlR8BgaCjKvg1329/GYiNbDQuSZqUZELs/lxFrZZ
	gWhujj5PkokV8xk8UQmyK1L3dZVa9QI5e+Wg2MbgHBsfvQSNw61xQWYnn/hTz0noxHUmGRgGq1N
	Q0F0ebcp/o8uCbKTxP4ILAR+NBT/C5ZEbG2oW6hm0lkNj8XBVDtev1tCjzpOliWA=
X-Gm-Gg: AYBFou17w48yDbX9fltRMDrXlYYt0ICiI+UFZ4+IFoTTUYwceLwX/P5LAj+7QsfIQlO
	luC5ZLFgS44AXbqwI4+EVht1QODD92CdufKDOsvAFf/rYH9nnwyw5Y4BcsRaCzVSsRLtJ4HL+y7
	1lMIw7w3iVtqu898YvqQGUFi4f4xcnjmV1IpqiLGCPR1Y13hCt4B1wFXanO6aXEDhPuQrX8SCTr
	iWlM26NQmRcLILbR6U+liHu2v1xArWqHueFxQKcC6X6Uk4SIFcnjOikxl/+CHV9AAYY6DIQkjjB
	vYK1MfjOJooQuCWNeLHXI99jrAvKlQQ/KrfpELsj9xcbmp6g6Ygb/ML25vgMK0dYNoSKIpgA5qg
	eUV5m5Tv4zdi++z7yuZgjT7Ic2hJgLtHGGPbqRhXczYBnLkAtW7xZdi+pncSe//MMhA==
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1762169a91.15.1788423120758;
        Thu, 03 Sep 2026 01:12:00 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1762152a91.15.1788423120264;
        Thu, 03 Sep 2026 01:12:00 -0700 (PDT)
Received: from [10.92.216.81] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm4332855a91.14.2026.09.03.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:11:59 -0700 (PDT)
Message-ID: <80f21ab6-3d4e-445a-b156-7326b0e92998@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:41:54 +0530
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
 <3574212b-1a4b-486a-97df-1d6ae7895097@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <3574212b-1a4b-486a-97df-1d6ae7895097@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a992bd1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=hQxA1nNTofH2dBn-U5oA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 40iqYGTy7_x-Vp9-8JTT5W-EcVPgJGek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX9lybWEv8Nkh5
 +cdfVlruZVfiH4e7dLFJEQi5sChvXnpbrby4q0tnS+fc/igJdiPGPM+51/tHEubdGNaY8f/2l3A
 /FUpeLvb9mJMG2fqFxi2tF1f5aDPV8dGRPVccHlr8tlctEFqSnMWHXrz3gHrmsw+HLOsKLvnC5/
 cUWhno/+w5MHeyne/7IZQQ3Wqgech8qI6hQKoar4QEo1cGCwbEAWt8cpyCbXvA+Fxg1ZSLNrBkf
 w7GzARzlbC4i6+c9rpTQYzThwT0xVYB7eGny7rFn0a2UrXYi8W9K7GWKpdJVGkkj3QscfVsKqX0
 RbyGm0oxL4LZlc0SRM47Q6vmxFXEdgxjfYV6DCLgnxGF1OA5pnCIKqLRsIDA5J1E4dDGLcR14oq
 aNzHikvOZRlgEgyZeoRgmnmqa62VYvhVXcipNud6XLJXgozaCcGvqXN0Vqq8C4rMgUQepW5dhb7
 /HDX3M/cS3fsFY7L7+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX7Ghzw4oee4Fa
 byZdxvmUQ0oX1dH9BrJ7014lyQJtFDPgKPxqAyI1G+KUe+lP1kY22oMLYUHawz0OCZzoEsG29Vx
 saWLkTCUKhDpwv3HE4ZZjD8AF2jdcy4=
X-Proofpoint-ORIG-GUID: 40iqYGTy7_x-Vp9-8JTT5W-EcVPgJGek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030072



On 9/3/2026 12:11 PM, Krzysztof Kozlowski wrote:
> On 02/09/2026 16:10, Konrad Dybcio wrote:
>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>> present.
>>
>> [...]
>>
>>>>>>                  - qcom,eliza-dwc3
>>>>>> +              - qcom,glymur-dwc3
>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>                  - qcom,kaanapali-dwc3
>>>>>
>>>>> This changes the ABI without an explanation.
>>>>>
>>>> As per the harware specification, the controllers do have both
>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>> info. Will update the commit message accordingly.
>>>>
>>>
>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>> incomplete? Lack of context here is not helping.
>>>
>>> If they have these IRQs but it does not matter, then it is not a good
>>> reason to change ABI and you should just add the clock as optional to
>>> the end. Was this binding already released? I think yes.
>>
>> IIUC the intent of the patch is to allow specifying the currently
>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>> Bundling the DT change would have made that easier.
> 
> This does not answer my concerns. So repeating: patch is changing ABI
> without an explanation. This means contributor needs to provide
> explanation for the ABI change in terms of actual impact.
> 
 From a functional standpoint, there would be no effect. I was trying to 
make the bindings reflect that the hardware has hs_phy_irq.

Regards,
Krishna,
