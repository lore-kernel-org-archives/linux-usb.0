Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B644541B36C
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970234; cv=none; b=kTnIoRVdD3TVWYxTgTc0F9pyzprkIGRuUg9raCfea6rm0kmx7OdAC4rgdLoovDW7Lbe09Kr1ZNMGbu80QaQcyK6pWVSLNJoQeLIp80dvndvWAkE4VGwKvK8HxlYpjOAyjOrSshietxpwzzpM+LhzZzaavWClCkArTDPeUXflWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970234; c=relaxed/simple;
	bh=XI5xTyvbfGiAmFocmMfUlPa2OTEVl2XwGWUa7ebZ/fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBrSeUg/xGMjhNdf6BMsaX72IHFOIf3fOLDHn9OsY79RKbwb1VtcWKSKXUHttmXPs9qPuCaUJHBW96g6RYEwZQMeuYbp6D0XitRg6IdxZqb/VeL92PxiE49vtXPgrx8IlZf1rprLJGw5BQCTRooEB4MSxNxj55j+ZMfjrEexSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTe7mwKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQEmAdu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTe7mwKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQEmAdu8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9joo3329637
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=; b=gTe7mwKonglaFvUI
	W/VdR/tCuYIHhlhbLWIlAEjoBjWFoSeACqiZp3K9a+FNGw55ZAgKlUaB+KXPNfUY
	S/yhUzlM2ZyaCfBkDXtI4VChJtLvcL+v4ocogXjtrl/Ld4AXv5JzoKjJ9hZZLekM
	BkYp7QzSfCKAIYItA1a2rc+lsLBqiHZfl3nN8cB9ZtV3WDqLSinCZAO7JDvYGxZ9
	AyoeVZpYD9Pqvp3qLpUGhYDmKcBqe9l8sYf6Xr/OGVCOZFQyd5cwvJHT8kSUb7h8
	TZYF+2XjM6YjO2bbcfo8BoLOs/lEuEHzX87Z9gB+7CAtr2FgZuoU0VgeSxu71882
	sSBBWA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7krsb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 12:37:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-74ab6065f97so68334137.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970232; x=1787575032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=;
        b=OQEmAdu8Fstu8CUT3RMcCu8V8Bp3V54PxHz08itl3Cg57QEm8B+roOrjHsnX8XzKB/
         ec70ZrGMQEsuMtaSF1bjTYhQMHLIkRVT2g88T3GzZjazwdpNiHtdgnw9fbFi+wfov6wb
         2pMxPnIz8YMTCSdZmH1XFHIBDmlrymh5KxzePe0LlIfsNoCSwBFkguBBiIsKk0lEM3RR
         +Co8kBamAhrUZftcWiT9g5q4zwK8gHquJUiqfQgvlR5OgnyBNEgIWamcszDekF0a6Kyh
         D17UtzeUgr4Efue9mBdE+XSAoG5UjjXkPVwB3AXiFs7/XSkrGmqJIAeNNaCWw8Nu0pgy
         wsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970232; x=1787575032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=;
        b=PR0ACh08c9bFPO6RghfVVDMq5M/7Eq29K/Sj7k1XybI8AJyziaB/bnvZcuuLJRKYMG
         JIUh4eNhwVktHdmT91bh3hJ5DB12x/XbxF1jlrGxKABYKmUMEvNMx8RvDNa+tTD7ZY/2
         GPDjOA572/a7DPgIYZ83u2lL5uw+sRVlbPgW3Jj0/zhp2SjXr51dR49QBp+Cyl3mOyWX
         baUDhokxL/cTvCPy8nOgN0Y8zJToMcaz44O89ZmxaltIyp0UvfcvjwDoIgzfpCL8SG8w
         y+13w6QNrjrEEJd31s+7TyIXpB6jzPj0bmCvx5a4jR+DmyS520lgJkHVDkkkOdVxspFK
         oZYg==
X-Forwarded-Encrypted: i=1; AHgh+RrZzsBfShXiB7nXfPOkHd23wYXsJ8msS/ntyzudIz2qWeLlI8n4BAo0e5I6yu7XM8hqLT+gbeBn6jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbE2Eqc+x/kDYu+EpznhqppfEyPwCJ+IuIQ+LH8FK9QmhlZcyh
	P0R7D/Uf73RpftVVSDO4yO2m4fdYoNmpYE5c6kKbClTFou7pSYUiN4LMlamzvl83tRsNf7yjrn9
	kU0mNXsgTPWK1F4gREXmUY83eYUBRCRveRj62VAtcedNzt71xpSJ3l55vqc8M57o=
X-Gm-Gg: AR+sD112MY8a52EZVv2gQp7BffX1uhoCmIpJhZB3WOOPWRL4zSsxyF7N0USsdVtfVAO
	W7LXATGB+kCeZ0AkGBvznyDOBpDzfGp8HWfA7PlnJI8nTny01h84hSohbDdwH9Vd1EhAq+6ri4E
	ZYgLLpY6RLuJpRkRNTyMFzCKtRIjHuwj5KsBA6h/y6KJhQ3yQ+VcPtecoeni34Ywkp1SAH/HXXG
	5iHDFrl2uodI79Bhn2T+MVoHHTMugC7edCPQWgpLI8CrMv87/rLoQ+JN2v5CtYlJQa3FtrRBBUe
	chmIwB829AlbznhIgowIvwXLVUfFnz0TLR596/iQNFmhcKYgCNtg5MLzZj22TlRCQLCBZIWAfy6
	3Jess1d1worpqbm7Rpng+mDih
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-76f2cd6ba90mr1393151137.3.1786970231975;
        Mon, 17 Aug 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-76f2cd6ba90mr1393132137.3.1786970231506;
        Mon, 17 Aug 2026 05:37:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00ab34sm362466e87.58.2026.08.17.05.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:37:10 -0700 (PDT)
Message-ID: <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:37:07 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w4LOwblxijxdLUR53KButyqUDgIRkTfC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX9Of2jyWL+3qZ
 smD/i3tm1AfIUZXy6IiLoNQtk1xmSn2uo2s4uJ+eXUqaSgdbrlMXR2wQ29LkB59hdsZ0NaLHl16
 1kWJKMcp8JsPEYYCfd/KF4YfqPt8Vro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfXzzaZHZpVjSXN
 HlxczEmx+6Vt+waeIaE5x0kiMXgh0MznKiYZjSUAWWmJsaba+xQ0amnLg67QFcxJbsAV70yblM7
 Jg/vJxd3evFlDEoUwwHblqZjiEwiUuB5/pSKtrGBWAHedQjcYbwecMmdv4ajjMFHEr0LefkzwsN
 uAlb6QmKfqZTRyP1pvANjx2+oPpKvwD6+9G+2O4zxgZKCNd5rD+f8x0zbvu2zmg7mPJ1g14YP6m
 VruavTM1XPKHWwqPQPhWhlKi9Q4rV4skJMVdoJao71rkxVzOWmJ3SKgh2TN9hFd2vucGQ2O1zOD
 XrihqMlXozN9oi6Ex9nBr1rWl3aVwQYLFiNQ+nXxXm9GCXE4UpN/xQlwM2dDpaQv+055HcYaqNW
 DVzQ5I3CgJoFatmj+amW6B98QbOdt6058OLcw3zmlFc5KrwZd6R/iGmN2Hroa7jm8uqrRhx4Q2N
 j/PlrwkgC4+Msd7Cd+Q==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a830079 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Wkax7JBLRjVfAwrBdP0A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: w4LOwblxijxdLUR53KButyqUDgIRkTfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170096

On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
> On 13/08/2026 12:28, George Moussalem wrote:
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>>>> +
>>>> +    phy@4b0000 {
>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>>>> +        reg = <0x4b0000 0x800>;
>>>
>>> That is the same address as PCI PHY, so you have one device, not two.
>>
>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
>> same MMIO register space in IPQ5332. To enable USB3, the compatible
>> string, clocks, resets, and related USB3 properties override the PCIe
>> properties. In IPQ5018, the PHYs have different register address spaces,
>> hence representing it as a new devicetree node.
>>
> 
> Same MMIO space is same device, IMO, especially that you have the same
> registers (looking at the driver).

It's indeed one device, fittingly named "PCIE+USB COMBO PHY"

Konrad
