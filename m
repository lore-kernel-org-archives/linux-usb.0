Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793024593;
	b=2gZGmZ3wk1ZgMDfisljko6U0MEh1EiEoPYRtmOijqkYOLiGzzBOP4JvpPog2AGdaSmk5
	 nSns+tqOT8SL2BdyiAys4NAd7GHKWZzZRcSjggsIymai+boo3WkJPATYZhibxWWVL/+Xk
	 fME0OWtHN3Q9o/8EX6y2CjSv09jHVzv0SIMJZYZDy55fZqJ61/LW6zCWjAiWeBUJ5W/GD
	 W89w0hU+H44bs23KERd7Y+oL6gpnFMh579h6F+Q5g1E26U/Fqcr0tFpvQvP+Y9UZP05ea
	 FJKceNu1NaFW8VdLdlbFMyUFgnKqyz4KMn0UQEb+KqrYXJAz6QvBV9SL0BVqK+/1pLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793024593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
	b=JCL3PdQ+aE4vMGzbihGCm+Sh9LboLoPnjoifTqwDHIHH5nobABYp6pX+YO6MUnXD3qsc
	 6sjalBof3DlL2LKNcU2wOAAsUNsIfxIfrzL6G6LYe/z/r6xGeQ7yiTGnqFFor5juok9Wx
	 Y4MRXpAOIoq2nek7OOHKd0xCEyxU51CxZO+toZnejdE+rmkYpskLcWGikOl91BayEQ9bV
	 M5MERPCyoYlpgPNhAz0Nu+AXjE8MPvBJpdF2/xbOHeGFssoWhEZebOqN7u8wwwOHikjUW
	 +Uu42YFVCObsVN57CfQO1ZiHNONVq6rgZLCYE1dAonVEsezGOwrEQtGsvUuotZxxlAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0zH+rPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvtL0J0G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2CF606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D2CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0zH+rPM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NvtL0J0G
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsmBw2168521
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=; b=D0zH+rPMcrb+kex9
	RMk7N6WejxHJypspAeFfRqfzDj1NLB01Qr4+Zx9JPOrOboDGUal2SLVIpYxHC5ee
	OCrvD07eqCRvhNfaWxuUnieEPmq+VFBe9FRqxpN45wYODryXF284Kf01kLpBN9eq
	uAWvf8Gl/XzfglHllNpwf6hBux+OhZIDHDh5vFq0RgeQxlyC3+tSg8b2NUgB9xJr
	ziYJHtzx8lJyajv6XiZAOVy8UTEmzULjsEVkbunqRy02ctMejz/kpOZgXHlCnHhe
	h9NyxmJ3zxBr4VtxFimFoPaSL2ria2jTmlsJaMMEzmL4o8PsQP3Et1Dt198B6mnu
	x4sXCQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u61609-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:23:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaad898904so88130e0c.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793024591; x=1793629391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
        b=NvtL0J0GZ3DCwpRijq+GpXmHH7YM1UUlUhX+Wwc09arHzquApQNgLnYpoGqB19kKWf
         hIfNOUjSgakyTJnUH4plJ4y3sf3TFKsEnci61QNj5ikP8hu8jK8WNOJpvHYxLUOtQG8Z
         HlJ67cBbypuI9EzFjqa8RjOADybJF1Xz02RPnQnbDZ2Q63Q/UkV3W9Y9QDfoTrEF2zaU
         1fRhIajOHvLGOhjK/8BnPM9Qgst2qsva09jAVRwMj6AWxiZMOEEaE32dkn8LtPz6MnGY
         Vm9JKG8viILrzZPVqiwQhtV/FXcB4j2r7dNbP4jHI90vAk+V+knMYmH2w/N2s67H24oV
         E31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793024591; x=1793629391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lxFqYB5pBZiAa1putHmzekSVtSEmnPZDxaN10xaQFI=;
        b=JWZh+nkggYdPnfnqULVWcknm9NNFWgG8O2jl3/Xi6oqv5He+Cbk5UsE6jRbGBATOEx
         Y92xHO+4bWgt6AmA2lATspLeTzg6EDWeXxLEpeXqFdtyzIZzin1nDgowJ9jpxtbeRwOk
         JfTh2Rnlo6Fk5ohkjaGZ1/T6GBND+FExJTppdAfaJBK3NCdm4/X0jxuWK0m14SdldfZb
         rPXcGuv/6tsCrg+CRUbe6tsI/uDfq7XZpPQzqoMwDP65+zk0l/ScYu0MwlNFLlnUJdBi
         wBRM7dIb0eXmM1BygCcghroxrwyY7nI/Q+v8dATp0pMFT9t7t5FGwB1JNDrT5PkFX8Dc
         acxg==
X-Forwarded-Encrypted: i=1; AKwUvBzj/Dsu9m8vcJsHQVg7ZJwcTJcG3VVsh1U/4NIh76QGulps3Jf6nqiAr1wghq0A/ww+JjEwhe/wIDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQOPGogR6LNbOiEpfI8i3+UZ6pYQ+t6qNxFY5pJ7QH++Mu60mf
	9YEGa3f+xlCZULm3T5ME6u1mzq2DgapQyXJLFA50DGZoyMSSkpPYrhLXgeT3cgbuPnscTHYqCIr
	Ua+XujDWCH7YsrRyOviZ369iZvp/bCsQo2bP7CMa4immFXkjdy8VI7Pfwfg3hoq0OHFiuLT8=
X-Gm-Gg: AYBFou0bsHt1WWsk6FKnT8w4Rd0ivm3ghEX+74AHUcWYmF/0Dg0ipRnPWWToH/UTBAu
	07axzqlyxP9j7zaTIfBkqSuzQXGlZ0uq5eSEvN71lOsPVAaQfGmOLsk9TfgvWapd26PFHCebVIq
	8piJKXfXrtOzMyU2D/sTtvgL50VlKX+sK7I7iCJ97S/4pb4ROtrwG+Y49jGcCPywkM/PblaDkCN
	AScHiZLAFlrfvwziBwyDbUl26EmN9hNnwFET+fHXb6npje3wYeyvTUqQs20+CPyCOLg9REBc5r/
	PBUSZDqmtomAhphNrAzUXdRl7GrK2X1FXmN5n6MNZGecvQ7uRCN7FdqiF3zVlPB/BLOvwDW5v/K
	Y7pTgQ8v3M12ZTH7dNi03Fw==
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2115543e0c.3.1793024591086;
        Mon, 26 Oct 2026 07:23:11 -0700 (PDT)
X-Received: by 2002:ac5:c8af:0:b0:5e9:397d:b197 with SMTP id 71dfb90a1353d-5ec232688d9mr2115521e0c.3.1793024590603;
        Mon, 26 Oct 2026 07:23:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b47sm326826866b.40.2026.10.26.07.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:23:09 -0700 (PDT)
Message-ID: <23131f02-0df2-4875-a409-b9c9340d0dd7@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:23:06 +0100
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
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
 <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
 <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c28fe0db-6ce2-494b-b3d7-9261e3045b41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SnWCLdIMmdTeHbUAEvXuiUspGOiJvidq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX3YW+hmMjSyMt
 zB1DK9sKPEEEBEj3q216dmbpvzEiSo/35sx75dc7ufymX86ZR/Fm6cS7X+OMM7t9JUrKCIF2bP1
 QpiY3R0lK674DmtNNjE3vVTJi40/wPut1lh+TzlYU2cPfaIZqz7cbHnFExzHUm1vkIylcyc3ZOT
 jp1I3qdp/3KxACpOUjvHRApLXyT8fZk2rgcPAHG60Zlx7NYNMrHywzclFIto45VI46e0hugIbpZ
 WYRqJ2o4rZo6PuCzSfoxGi7gF6zeh1XRj9Vz+37kh4MBAwuWy5cb+Ag4CYnUoL4fgxVVsc5qHai
 AIKOWJRkP9tQkPbn85aabxiyvSPXdwwTGDPLGM8rjWpbv5JPLJ7U5pmEjfqaS/L+/DveIHBWJHg
 BoMh/BkP7u3UO9tTKQR1d5MeGNW3EkC9nCflK0x8S6Jc+veqBh5NBeUpGQZRwwGN2iz/adVN0DN
 Jb/zU7fJ9tCxNz9qLAw==
X-Proofpoint-ORIG-GUID: SnWCLdIMmdTeHbUAEvXuiUspGOiJvidq
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf6250 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rqGjVLSmFW5gv3Cq8oYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX1zcaU9GQ6ydl
 WHPZ1ZSr9PwMZdiPQbZ+pKKgT/dFNfgVIrysdyu+3hKDfdebaknGcRfWxyD4Nm4j3b48pMrSf9f
 LBLlX3ZK44fjsVvKHK/kEA01VAIYpGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

On 10/17/26 3:16 AM, Elson Serrao wrote:
> 
> 
> On 10/15/2026 7:43 AM, Konrad Dybcio wrote:
>> On 9/29/26 11:35 PM, Elson Serrao wrote:
>>> The EUD hardware can support multiple High-Speed USB paths, each connected
>>> to different USB controllers. The current implementation uses a single
>>> chip-level role switch, which cannot properly handle multi-path
>>> configurations where each path needs independent role management. Since
>>> EUD is physically present between the USB connector and the controller,
>>> it should also relay the role change requests from the connector.
>>>
>>> Restructure the driver to support per-path role switches and remove the
>>> chip-level role switch. Additionally, as EUD need not modify the USB
>>> role upon enabling, remove the unnecessary role switch call from
>>> enable_eud().
>>>
>>> Reviewed-by: Peter Chen <peter.chen@kernel.org>
>>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>>> ---
>>
>>
>> [...]
>>
>>> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>>> +	if (!sw) {
>>> +		of_node_put(controller_node);
>>> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
>>> +				     "Failed to get controller role switch for path %d\n",
>>> +				     path_num);
>>> +	}
>>
>> This will always probe defer on a fixed-role controller, we should patch
>> dwc3 to always register a roleswitch
>>
> You mean for fixed-role controllers where an explicit `dr_mode` is not
> provided in DT and the fixed mode is derived from the HW capabilities?
> For explicit `dr_mode=host/peripheral` cases we bail out earlier and
> never reach this path.
> 
> The EUD databook does not explicitly mention fixed-role controllers,
> so I was assuming all DWC3 controllers relevant to EUD are DR-capable
> and register a role switch.
> 
> I can see how a no-op role switch would address this case. Would it be
> reasonable to handle that as a follow-up improvement for controllers
> that resolve to a fixed role at runtime, rather than as part of this
> series?

I think so. Generally true-non-dual-role controllers (i.e. by HW
limitation, not through DT/firmware configuration) are probably
unlikely to ever be hooked up to EUD.

Konrad
