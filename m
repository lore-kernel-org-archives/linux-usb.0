Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474960;
	b=D9m8AIISiESNy19JsGNB2mfGQM7lqb46gAMamCG20BE06uQlIJtGIp7b29z6GWU+zpQY
	 WkwsfJosjY413rJhm4WrxU4xZOdwtjGmDKYU5koRLw3CKYolzLsg26zT0bBB9C6R8G0CF
	 SAbmroGJCQ/ewLEy81AR2uadEFB48fPtbsOEKaKdOIQEBxKfzWG47eK9Gt+7o5p/E6Hh+
	 K6stFMLFTGmfMo9o24jOwo/98kvwid+F3/ThkVklyvTCnYVpoopVyEhdCSV+45FkW1Eo4
	 K7qqo41/uV/3XQBabHAddKigG1c1rJkO8HG3TOBaHumlrNcus3Mb6Cvi8eC1nGy/6JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
	b=xsOhQdBaQVaDQjACloWr8CiXhMeCmlbkh+KP0bZcGASFhYGEyUiym06ify6yBR10OHJ8
	 Uo51WT77ml0ak6gxh8ZSSw6zRUILXHOgEOhKcgindjNOeFsAH1DDny9qpqmmchu01P/W2
	 gTr8E4jYDUCdW8QvXsGn6py5CUborivWP3ktSL+DofxG5yzfFgZFyz9Uq8QopEU+vZH/U
	 8BIoXoXoFmLffoWtH9kxzjGqkv/VlF5EUaWcxO7cnRqU1ollI+rxPNC83/s75cfJmleXY
	 bk07JawBs0JSfQAMpcYpVJ73XQ97i5iIQAkNq52qzsigMUjPrPj9h/122Z3U+vG4PuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqDq8bmM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1yUwpIg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7A606A32E
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 09:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E7A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqDq8bmM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z1yUwpIg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8uhO84149288
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=; b=PqDq8bmMBO3nXfxg
	aSqmeUQiTKT/yujxY7YIbp9ISBVRoCWHUkhBG+ZQW4PKPkfKUY6STNVS/L+1cxYz
	SNiRyHQZsNJMbiALMTPbQ0j8zArDup57HdMCO+HOUWfiN22b5FdhaAf0DvFgvzpv
	npm8GB+mnNKP2Oh217jLN4ZDXKYtAUvhGbgEp55P/JIwbYxTgO+tLRs4Fg4hn2tQ
	0p1/xxlVKRcr+K7krvBTRli16kzrU8MMVPGSiYH+051WDMdIWNTTOiCgnpPLm10g
	a/gRG1BV0URfMYAoIzlhvxcauWH7j3mxXieU+idb2B0ulluVgS5fGMJ3Kr8Zg5sF
	Sz/0Hw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc62qev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 09:15:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8aa185840bdso3161915b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 01:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474957; x=1795079757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
        b=Z1yUwpIgZ5OKhJJroG610EXma8lJiCg/jLUvWXgxwk5Htt2oMWZBVm5gRp2E7ixvPp
         xl4hlk4BX2M6Elri0UjwpXXKrlbOD/5geTU3ibUB5HMHymK5CQk0SCeTrdQgtOnJ9ibo
         3iPOhQSHKe/26gbdJrFtmpv2uagIu/VWbzm2Y0UJubrRwLw4CU26pap2PiMOPulCB1Rv
         D0JQxsofS6h9ts2qGLhkEUzZ28FTpeyDiASrNgApPBbMrP9qCHNAw7YlFuJ1UdyVlckD
         RLw0uEbVp2KZ/V4TolRAHmQMIW/wDm4TDDuoLTcyCPz4gmlA11sG7+vNpSclwaOjRfpI
         YvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474957; x=1795079757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEnoxCVc3mFsHG46MOit1/TCAB8kmZyxFDbzRzr1Hwg=;
        b=lrmT2zpfvSncdoIVfZa4Hi0Uc4TnrpTvChaFsXD1JneONbVOrJQBx3dNvsh+uOlxyA
         zn2ufiFoFnSsVzLywrTk7CNKD/6WuhKGwavuCuIOIekjc/vGjKCYDkggoHK1+tCcce5R
         iIGhrop0a+izK7V7JuJiBMrTi580cuMHYz0SE/4sMwPLS8YsBPShsTm5JH8wMhTxneWu
         2BDqyshNC2vbD57lJvUh1IRXp1Y9exmNpg1H5cPF7uj/gweiFdRqQOcH6TkxN0Ks0ppt
         GQTuzPWKKDfBpmOhS11QDswrkX5gXuc31dVQQGl1zFrPJdXpYu6Fj7XVmYZAAMZKAFl9
         7bpg==
X-Forwarded-Encrypted: i=1; AL+hErGdfKgHP9CjO1QMq8eXck9P42gY5cBG4GJrN2LyT0LTRQAp6hAavaRsQp5uXmofG360Rf4UnqmyTmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f8FonXGjY9b3KtFJErfWypBQZDOTQwMsXukDgUuRbY0P+vM3Q
	9+kbMU1onTCwNUbYLa1fir3uNQ2bNm4ozA30Ng3luNSqR891gwT1JE5ciLaIEfLzlbCyvqFFmUb
	J6yaIveemEnUhtKf4gFMS3HX8Mm8gp3NIOBnWVC2Rzn2mrI4efkEAgkuGO6I6gKU=
X-Gm-Gg: AYBFou2NrJGQ1fYW+yNWGliwj42cAtefaJvpMhuDSAArFwdAZyzx3NH5CUZdFs3T337
	SrHGeLOe4BeAal4Y9nWGNLmmFsi7hoHX6Q8NlMKZtsHVbMcjuzYWR+OB+GQU1QM7lsx9WvGWsK7
	/vuoH3lBOQR9fR/Xg5QARrCaqBwyadhz/Rpk+RPo2m0ZSgg/mvQth5zHDoksX+fm/RgLtsHP3Iz
	RFnWIZcNMSUudiKYOxoBuscvwyqF5Uv5lVgdc/9haLY+Z0BPUDd1srGwRr0lJ1KMedlA2VtbUA0
	zaBePCfsiXO46ACnHfIn7KWGuR9Dkx9Tx+NB1ev2SnUOfOyaFFWn+JbT9qEfZnW+l8uQOYWeEnG
	2BOyZ5D1OT5vHarhecGY30HmcrEj6UkitiJg+I0CDut3sRkjXglSrRwkVYDE6LZKT2hJI4fvoSd
	rcr3g7KxxIRvOhOnanGCzYqXCTJebwSx+Kh+Qwlax1
X-Received: by 2002:a05:6a21:498a:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3f2fdfa38ffmr4070805637.50.1794474957497;
        Thu, 12 Nov 2026 01:15:57 -0800 (PST)
X-Received: by 2002:a05:6a21:498a:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3f2fdfa38ffmr4070779637.50.1794474957003;
        Thu, 12 Nov 2026 01:15:57 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bd30c8e6d4sm1051351b3a.48.2026.11.12.01.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:15:56 -0800 (PST)
Message-ID: <6ed0793c-76ce-4d04-af5f-8987311c5c0f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:45:51 +0530
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
 <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
 <asNji2_GUda8x245@parshuram>
 <3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com>
 <033c8432-4a03-4f38-b0a3-28f5d551b0ef@oss.qualcomm.com>
 <avV4B4g-NWtZbLuX@parshuram>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <avV4B4g-NWtZbLuX@parshuram>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gkg1QGRAYAiiUNMVrHqS07Bw6MuS0lLj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX4RgbxEqSt5aT
 3ii2twnsX5cCT1xZ3eINh0dvKVZmmq+z4dO7mPU08CEYnMU5XHXhUErVrtM9YCtZxeM+fEqfldI
 Zq10PCFVEntaEk6Ksz6maLVN0HDHrIJBteEy+dtEPHVbm50tEEW/HKwa0xc3sFoGmINyCUZGFoc
 /bky+QkQ0oDEHY+OZLuQcjblFCjB8mfdeaozd9F+AzKLuKD9JpWvSVs5yGi5GYWeDT0ggoZiPjx
 vGsP64AHcvxLtdS7QPmPB0pMSlWbXxNxYtLzIOX8wdtV3GDOu1qJJq6sLLl2/DxkjkjPnkgQdtx
 OAdCxpcI+acmiQP8i1VL0mrM70v4gernmHGLK4ubIQsdy3sS2y1KHjMjmfVvR0eNYfQo2rJfS87
 eLAu/WPK/gR+0GQE5m6BKGtIJa0/SitJnlVsHQYLVHf6rp3SUUZADFG0r1Uk5ZqEmgOt47VQ82c
 EyaAGINO5KqdpP0Xusg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX05gdunT5PVOF
 aCPTcrwlsaPLW+YlInqBQrAZkzhHHbOWezHxJHKNsoKGV34weiJy080zOb0eCdhAegm+2qGn7XZ
 /QsT03D0WFirP9RO/aUPeCZXCX+uaOI=
X-Proofpoint-GUID: gkg1QGRAYAiiUNMVrHqS07Bw6MuS0lLj
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af583ce cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DY95BI2w6Jwo1tMKFB0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036



On 11/12/2026 1:55 PM, Vinod Koul wrote:
> On 27-10-26, 13:37, Krishna Kurapati wrote:
>>
>>
>> On 10/9/2026 10:29 PM, Krishna Kurapati wrote:
>>>
>>>
>>> On 10/5/2026 2:14 PM, Vinod Koul wrote:
>>>> On 13-09-26, 20:10, Krishna Kurapati wrote:
>>>>> In cases like USB High-speed phys which can be either USB2 or
>>>>> EUSB2, it is
>>>>> required to know the type of phy (rather than the operating
>>>>> mode) because
>>>>> DP and DM interrupt lines need to be configured differently for each of
>>>>> them.
>>>>
>>>> Does the controller care? In preceding patch you defined the EUSB2 in dt
>>>> type, so this describes the hardware. So phy knows it is usb or eusb...
>>>>>
>>>
>>> Controller is agnostic of whether the phy is usb2 or eusb2. Phy does now
>>> its type, but it needs to communicate the same to controller.
>>>
>>>>> Add support to cache the PHY_TYPE and add the following helpers:
>>>>>
>>>>> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
>>>>> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
>>>>>
>>>>> - phy_get_type() for the consumers (like USB controllers) to query the
>>>>> type of phy connected to them.
>>>>
>>>> I am not convinced that this is the way to go... Driver already knows
>>>> the type and should use it...
>>>> we alreayd have mode, i am inclined to not say yes to adding type here
>>>>
>>>
>>> "Mode" attribute describes the current operating scenario of the phy
>>> (device mode, host mode, high speed, super speed etc.,). But it doesn't
>>> describe the type of hardware and hence a new attribute.
> 
> Not really. A combo phy can be usb/type c and we do set that mode...
> 

In this case, the type can be "QMP_COMBO" and the mode can be: 
"USB3"/"USB3 + 2 Lane-DP"/"4-Lane DP".

QMP Phys can be Combo/Uni phy type but the mode they operate in could 
change at runtime.

Regards,
Krishna,
