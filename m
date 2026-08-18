Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503CD43F8D4
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043453; cv=none; b=HAwMLg7keWuv+O1GQKVeDONIQ/qSlCGb1dB3JJSn4UHq/nnXwXjzTecSVxfDFEKIT5rZLEGMTrAbVAdWj8Ggoj+5jSKcApWnC3egkR/0oSqRbZQ7Y7cRpWGmqd3O60oHG5kwJ7VouIYUxEcK7vj/EpfS6RB2RPMR9d1iR092ag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043453; c=relaxed/simple;
	bh=v69QcsW2mOGfUzf1hWEyuWqfUsnkP86q/3Zcf5zRAjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1wLFDIK5zD50E8mRa4JaKbSAxAy9K2gOTf2E3nBTXRG4qyVdwje36rbbVgINcUDfydfoblV66KdCbKr0bYzgY4aYua4+Y02G7HiuO54GgzGOTBmfXoMaKKtcFOiFQ6tWmmxrrSZAtGBBS4SF0G9ws6uCsxkm/999HZ2xEjwkY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1YXZb/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr8DXtYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1YXZb/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr8DXtYu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BI05722659
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=; b=h1YXZb/apjm+o+yj
	D6/wwFQ+XyMLCBzqrCPZ89IVFPd0h+hrIPReUhWaX1Y9ILspzdYjczNngWvafd4A
	jHJ8MQl0iaTXzw4mqPw+LQfgjdr4EaawzIRYNaiEPGf59azu2DG+PIEzWs2xbadP
	jFiWIxXRm4EsKbaySytz1alkgyPbnS/u79oYPeDDcRnK+fhnHoFeI0nIT2BUXSgB
	8t2sC2j+YV7BoKTCwq6YUoAPoO2+HrrDlGTcu1EnEr1d8WNyrXDty1rLmmrNjjb6
	LscySl1vtsb1GVd0BzojtT+Ai/eZQfWIRi3UnEZel0Ovrg3wSRQOszTZqdRY8PWn
	b2TvRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615kka0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:57:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936bd9b045fso2926085a.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043449; x=1787648249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=;
        b=Rr8DXtYubw8KGhDyHXleT2bKC6PMethFt4mZyezLWuQ2jkM7Pmrl051N3UKlNweT+p
         sCLutcZVPxkzGBuQSIAWSLkGlgr1h9bg81m2B+eeXsdlu+QHf1glnr7rnsVpV20TTwPu
         TFYdg6VT44IqmA2phGQ3Dboz/QGaq3SdSNSKDaerCCITXtJmfNRY1oqAq/KMd37tSiex
         eJ2IHqVXNjOvFMewHCgrplbBbJXXmzJiVlH2kRPs0cp+lAstYUiHqNPxEWi2fCh/7k1V
         1otB0Mq8rHLocgludIjIGywT2LPSYsGhSkvBr5eaaDxO18Tqa794YzUt7/SkpBOBxQLE
         vtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043449; x=1787648249;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWoV3r+YPiscKAy3H5JzA7RjIekZzVMMLL5OXDd1iD0=;
        b=L6R/JCyIYe1AKl9Nio9RgLTucbUTOpp1z4JP6oo+kRsJAkExnZKSjnbRNZQJmJ6+qJ
         0243jv1nSqyTIw+J3+x1bkK553uOYkzp1AWUL3qPh/o1j15BEdzM+ZyyJVsDSYeEnBnn
         Fn+ryKxGLRWxd/xOUom6vKeoiDK1+NPyzoxyFzG9tx6k/4KdA79ar2iK3awRVj3bkdMi
         +P1e7zckGytl5K9/FaF+JQSo3CslCp0Wt3l0f+f9emTt2jWcgU3pJutwcjCGGcui/l2c
         eI6ew2P+Qx+/dW6tNcIXl0FSdnPYkJ1mW/NFqfjDvhrnTZR1qBrxfxL06EU1ItFrOlnG
         mfTw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+lZ405Lry/9oIwP4MN+nnlvzdp67JS36u9tsJSR6wfYFLnm9NNS0gq4jhqx9p9vm9XthINimoViQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq670awQ5/oLPiAH/v3qgt+QUIjm3B5oh0uPZ9cO073piGCVwG
	vN9/2iNpT7Y0/oHCyfA8/0i0QTotgJzMJrY1MlJ8J2zrREZjboTDLoWIY8QkMTipT6QZIozULG+
	VpYKk0q0nZOEW/TiYxa/AGs2f52ta1yDKP+CFg5vdYXn2GfUbxHVFeeO3z2dLNxE=
X-Gm-Gg: AR+sD10ehuDRlFOaR6zi9sUB2mEeXfHVuZNkepzhQdjkqKDU/RP6dPMLZnG7EzZbTVV
	uQK9zbJ0s6phuZ4nImyxDxbhOAKRx3LcldDs1ARpSRNlIYRmkh6g7dyxE4gRo07W+j4/+qLN7Hb
	KYk4/ZOQLy6pomDsGg4LwGgzdMKeUcEO1ZANxEdX5o4SWHm2fJbUgBQtO3MjBwuUwH6W8mgUeP7
	T9yQMivHpSzyi97vfiQyalDsnJKMcSp7ZBhn9lhrvk9ga9zr74YvvdHQW2tIBokqwGDag7ePCIu
	c4mKiScLS/uAJO2Z6v0f8m9kf4iy8dkIebJmyEajpvTCOZPKdsZliMljfMT+Mx6fQfOl2ICbzT9
	PVcZ1CkifA7ncgLSrs3kQb0P5
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2213171285a.0.1787043448938;
        Tue, 18 Aug 2026 01:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:45a8:b0:92b:7420:bd58 with SMTP id af79cd13be357-936d1ed8aa2mr2213169285a.0.1787043448574;
        Tue, 18 Aug 2026 01:57:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9a35sm117355966b.63.2026.08.18.01.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:57:27 -0700 (PDT)
Message-ID: <17cbf5f8-c23f-4b97-b971-6b6f4f3226c7@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:57:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] phy: qcom-ipq806x-usb: fix the SS PHY
 TEST_POWERDOWN bit
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-5-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nLlH1IpXjZhctghYN5N2lHZUHGj99ifn
X-Proofpoint-ORIG-GUID: nLlH1IpXjZhctghYN5N2lHZUHGj99ifn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX9uOSv34WCFmN
 2AtBxEywv46j6k6yZpJMja+lk/UORtB1BI/qGTwf0+Y5Il5tStrC7zJuaQ7U9HEqd1JFKBJ0nH8
 3RdOhuGgjaxL6C+Ba9dRkeB+umQqWXY7yucO9GEX+276UxnbH9gYq096DBDy2EsWgCadf49U99h
 v8/HDpBkwRO88BTFYb2525gQN0BwJ/GHmsGQ3R5F/d9StHscGY+N8/HknNM6+bOzSL5do/mGgBT
 kx0T5lVC3CZ2DIjaW8F5D70rGip7ZS1fBar5YgKK0MyQVhXvwSNWfn7zxVi4GUIEM+xpji8rCYH
 iTRBcPLnQqBC4/VcCv2XjNPSM4ChAkLwbB02OxIx4074NrMSFMGuGCMBf+qn17bhNZtjgVNgtpz
 KSUepsStiMTp19zGrzT1MQte9kyNgC5ZKD7soFB6/ck+zslXcqRR6WbPCyOB06LYY9J3alNtGvP
 Cv7s1oiykshEnzNG3bg==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a841e79 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zhQxU6SgEyqCUrVtDRsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX6FMsKtzQq8qo
 DRpUIWB7e76aW24QK2Sn/0hZcvj08roYoqmMMR5X/KbzmJkPQ7H/pDbJArlovkqw+If7J3mt1Wr
 dZXp6Qhue7y6+Q6C0X73L8S/pTYKRV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The SS PHY exit sequence tries to put the PHY into retention via the
> TEST_POWERDOWN bit of SS_PHY_CTRL, but defines that bit as BIT(27). In
> the DWC3 QSCRATCH SS_PHY_CTRL register TEST_POWERDOWN is bit 26 (see
> the downstream phy-msm-ssusb driver for the same IP generation), so the
> sequence pokes an unrelated bit and the PHY is never powered down.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
