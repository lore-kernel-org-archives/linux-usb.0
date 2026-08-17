Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CD241D10F
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970337; cv=none; b=qgNKZ9JxCEq2Uklo337JjHlJfifGAJKHzxplS7UUeFN16r5LyKOlzKmQk8zexB9ZXQC9ENKdigGV/Iqm+kyr5jH655E38F/+04NgOupR0jmRsM0m5vqKAGvqvfA4y+Q0zs1xuJpL7e1wDkz2ovUuTChP8meCHy62t2lpCsFgS5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970337; c=relaxed/simple;
	bh=KYx3mX+tRxRFaAr2MGjO0ScJYuXqBRBzixjQqV5/Tko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AE681VhTfEaAubHBxt4Aw1sQDb24dR9hNE6HwHZAzzf+6GP1KTOudTNZLfWnOvr3q2iRS+x1Rib9ugKXU92nl77YBY1W9UDnn5Q4mjomPCC9rkSHFu3OvtEB0DZw9a6HhgNzQvyoW1wleJqI9iVBkPbXzJwgZBT9Eb7CzDoZwBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJho7w71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eW+pijVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJho7w71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eW+pijVf"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9tYP1388523
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzZHJBJkIIxfrqdLYm/z/DMmA8vst/cUsQ96Y/1xjDg=; b=EJho7w71vafwzMhR
	3ArrlxASDAsklAfAiIfKUsgBzQ8g7XpcZ9bmPNijpyDquj5IOGQAbWFdHwcQQaCb
	NxxIsaF+m/49zxIptgMlYU3N1Bqs0Dm9dZ/+2LIrLMCqYpdJC0LKnURdBZbIde8l
	pfYnMgeF1jTeUPjyBrLUGjIBB5D0AL2EbR+A5IUA8UKfI5jqayfwp85Vb8vwiRWb
	BVeWK1+AKyNBYwrVTXMFji4fiz7TQ9m5N05umRocXHRAdn0/IWEdMkEGeuZ11+vF
	SkLlaC3c4EpdE093hNSoQvpfDMYh+lDjIW8pdHTlCPmiVsPcgbfSlB7SyezZiLhM
	1g/4xw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30h29m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:38:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso9833371cf.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970331; x=1787575131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zzZHJBJkIIxfrqdLYm/z/DMmA8vst/cUsQ96Y/1xjDg=;
        b=eW+pijVf+fpTNPLSK+VBffzuHferXO+bdlJdaGFxwfTnLMq7lMrQ3GWye6dmeThLl2
         pCB9wwwQX9laRBNC2PQkzK0Cxn3tbVtQJTF0ce371CvTdTyqO8+lpnIhgyLAY1hpetJ7
         a6LCRmKO0SYYYfeh7VjwuWRzy+8iZ+FGL1JywaGsig+jTtQAL+b5gpPnsG4pIz2pA9t6
         ofpGcxsi6sJoQ81s4019HELTQTC2I6NNVX2JIglYCqaHaLyDfc09X9gWExPK4fsDcPcQ
         sapav463laIvzB7+vcZhJHN/JZaGTEB31aGmyC+W4OkJwgv9/19+Kx+8EC/XIEWhdn4D
         FaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970331; x=1787575131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzZHJBJkIIxfrqdLYm/z/DMmA8vst/cUsQ96Y/1xjDg=;
        b=SFl9o1jqXhWkWfr1deChx1LrZJlD9Nrf+gDPfgwzckGRthhR5PtVRqmYhjovA/4PS5
         fP1z/4Kout/UykPxlJiiORERiiKcSKfxNyW2plZGsA/GiUarAfbMk4x/tS3imlDUt/R0
         FsQLDyikGlvXuSJMjLfFFhqdj2jvnbNZDLR3bhVg/LIIsWCt4Q30ZF9s/tYXLhlpu5eD
         1UzHXAW/qeEVoSo0T/vh2rW63bOPLxPcuHXl8J86GlbB+lR0y3QB1EZfU2vrWjJyWShj
         yJYlDUCagVesAK8ma2YDLRhezuPPwCL+ifQzygBxbEUk9pUZlD5/tq74ATMgd0rUZxUH
         V83g==
X-Forwarded-Encrypted: i=1; AHgh+RoGrZ6jTNBR5TKS21H3N+0fmwZnQcI2DbmALYgwKZwcFNskHY3lMrsrNGCVf77uCl+ZU3TMYzEiMoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRDe3ISwnTDgdCwUqmrDJA3qEL2mvWkabqrDfSg8nTg1Keon/
	LX/rSS88+8KyhU6MOWtgNQbo8BCB1RHYcQ1aZbOlGofJ3LP4TDBXc18T45Bpio1ldPvPlKOaS0B
	cM7wH7DiM1qaYPNkpS9qK85WKaM7B0ytn3CQ7ka8skq+7Lys6rxfz8amnVV3qs8k=
X-Gm-Gg: AR+sD12GLE+s2scFsY9AiwVR12C7Eqg1DqIC+J2vahYSC85FAerF66gpiS8MAcZuBp5
	63wXjbRJ8LlwnLJNe8ACwhIHy/R7FIss6ZaX3EGzRNueZ1yuHpwPE46vhaOQzlDJ/QOiZPcJ+3K
	HfFvjoMgkQTNvAxVEKniM8EX56bgBsgKgA2xRjJlRFISuAdZlayqHCBVsZQTY8cvltlmhfC0WfN
	gKO/tHbK4R92LsIsjjhpDmG/aCU/LRAav6OUrszSTWrTAI3193QfJtrjBByDRMaGht5zjlZVEyb
	gGe4xnISmhtxper1FmmibfeBHsSGqsUhLcRoycsSS/WZD29gdFb90i6SwoiwtF8v7qUw9fiQQjR
	mD/cPwAM+dCoMcdWZk1LCqurH
X-Received: by 2002:ac8:58c9:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52d85529b51mr185899091cf.5.1786970331281;
        Mon, 17 Aug 2026 05:38:51 -0700 (PDT)
X-Received: by 2002:ac8:58c9:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52d85529b51mr185898611cf.5.1786970330791;
        Mon, 17 Aug 2026 05:38:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcdd7sm4280841fa.33.2026.08.17.05.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:38:49 -0700 (PDT)
Message-ID: <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:38:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX88qAtd/Z0uFs
 FbcQqiMVGeX0GYi1mHHctwUbSadzGTmM1yPh5ccw/FdwwYk59vdtUbRbaw9NbPBrkQcDhyd6J7Y
 mUcB8xThhYqHAkPin0qBF2YfXVlIVuMxggb2DyJUr//z0jwufdCcO00nVq7ruuA3L90QuYTUD0V
 KGhG23GycONPkNsHcROyp8/a9NUssSI/65DsFwIBJ2OkHBRelKajBSZPBQamf1zsmny8rs2NNot
 t99GXejPfp6xcR5+FbdldxG7xJaNacBHaScoCXobr/Whh5utnIQTK8Jxa3n4M+OEFA6UiQ9OWPc
 Gp94q9UbYrKIvF8IXflDaESRF9jFFDXYzWoh0zJuaKlzDCYlL5IIgZWzo14YjC5Rdjsd0BXgQ9w
 oP3dtY+IY/URxeC6NCO+U7iBtSGIgBry+g+SWM7NYFyKZyIsmDJSiGPd7fQ95irhYOfUtQfIFu5
 yfK066CyKvhUidS4uBA==
X-Proofpoint-GUID: HEf5exQq3MQYFXDGoW9GxJwmh8D3Z1cH
X-Proofpoint-ORIG-GUID: HEf5exQq3MQYFXDGoW9GxJwmh8D3Z1cH
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a8300dc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UszWgs0Efp_EzN_vPCIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX/quf7LlyTpCu
 8UESaXSbYgR4oxmH/mgpiuMvUa9h9LyslcmBPL7HDMDkp1DvXzJlmc9RF2MBZ94Md+G0n6WZIHv
 Jd39hugHMWEdSPcr9lYGocNPuAvbOic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170096

On 8/17/26 2:37 PM, Konrad Dybcio wrote:
> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
>> On 13/08/2026 12:28, George Moussalem wrote:
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>>>>> +
>>>>> +    phy@4b0000 {
>>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>>>>> +        reg = <0x4b0000 0x800>;
>>>>
>>>> That is the same address as PCI PHY, so you have one device, not two.
>>>
>>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
>>> same MMIO register space in IPQ5332. To enable USB3, the compatible
>>> string, clocks, resets, and related USB3 properties override the PCIe
>>> properties. In IPQ5018, the PHYs have different register address spaces,
>>> hence representing it as a new devicetree node.
>>>
>>
>> Same MMIO space is same device, IMO, especially that you have the same
>> registers (looking at the driver).
> 
> It's indeed one device, fittingly named "PCIE+USB COMBO PHY"

so the implementation, matching prior art for similar cases should be:

- phy node with #phy-cells = <1>
- consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
- new driver in drivers/phy/qualcomm to coordinate the two modes

Konrad
