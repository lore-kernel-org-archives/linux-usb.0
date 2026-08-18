Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E763C583B
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044013; cv=none; b=n7vLdhD10R1rVI/KY59TKGlRJo/9wk6Z8FiIXdmrd64iIgWSi/4fqmGbU5pNfosMAW27vVL6mZ8tloM8hHU9hUvLvcRlNe8BtTeS/TuM1y6iF6yjUEYoervvc81/vZTzUzIB1vcHmS3fmcHambI+ZRFpeD3V8EFU9Rll1BZrhtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044013; c=relaxed/simple;
	bh=z50Dwbp+KUqqg693Z4+fUtNTAtaDy+2EmV7rI7a0Zx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDZ5f3ZfP3IfpZGkb2VdsQmcBoe8q77RAzf2cYhC4knhabF3NS0+cQjyjwr7zQUaLhve7+exv5YIeIYuO0qC8XbM42rrR4VL+04Mk6dBYd2Kw1vVMXQSwsuUAm7vvy10AC8ph7Cpm4QgrD3ckHZ/B9L9ugwdZR9PVzBzl2jl5Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G345N9gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdySb84O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G345N9gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdySb84O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BIwd325429
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=; b=G345N9gh/SFKyB4U
	SVhrtb9xePJszi1CVrMpyXPWaCMaoHoMJmL0etlaE9gt8oUi83kFV8fZGq50WgeY
	JhQZsQ4yheYCfcwNibUm/ASYX2MfA06Pmhvwe6Qux3C2fm8js3mo8roxjDpVvUNr
	MHdDc2NRR3fneCEhJnLehXNCBrZHRIY4M/i3ouvMJfQv0h8bHxOp8HsnyjfVvj6D
	B65slKFoPSIVlOdY1ls6+6RPPL2pQGKXaHfVhlLluvHrFz4h44ZFahpcs83u6Vzj
	H1EJdj5jOJG7ewaSjXg6KAO5UCFt4F8cH149SRFVwPpPQrEnXueF8QXf1dW1NPlU
	bI7RdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtshhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:06:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso42586785a.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044010; x=1787648810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=;
        b=DdySb84OA+NgPwRdFS0TAaQERTCDE42ernfnK283vnfMWb8mHn8BzGzP6Q8jY9HkGN
         divOCalEhpNouGBmyBmvDMPuO4Lcgbah7XCHynpb8yPffFV9IhnvfD9vcY0VSl0MzhwE
         Rpix3VrT2DVli1GkWwC1UtUaDPDhHuMe6lUkCcd0zgYaOmsYaPX3XfxbpkR2sF9xsWvJ
         gmAhVxXZpiFc4epEtVbcv7r/LfsPtJsjp+xWPmisxoh1435jq5W/rrDq4v+lsz18mcqi
         B20ay+0U54/BbDqXSmivfJ3R8c48k67JhVciizKRdUjK47jPj2lGdABvlkdExEeTM/Z+
         Yg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044010; x=1787648810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=;
        b=qB2Ds3goOY2oqp7wW3O5tzsgatfZ1nsB1tIO2ukVfwW1ogX8+I8CVnx91QP7G/xSgH
         VgbBBhuPaU2Cbg7GniDw3Ooumq/4LlCu49uxXY1vC3mBuBthC6lTMlQZ00NB97H6muht
         LfWjQs0HRVOJJctGE+RtoMHW/RpXoArkNMJ0PMsPSqEnILxTqKNQQKldSQcqRRMCONCl
         NOYUQGuXR840Uj7TawYRR7EtoNPfnPFDmcL2zxclBBpAeAipYXJmTvZQT+9T7ysVGL+p
         LHmk0wCIenbX/X5vZx/P9Gass9rM5xAojPm++8Ley5i1rxUbwxYSQqh7XuMaaGdKUIp5
         iiMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru7YB1Ls+thd8Z0ojffMn3eQ1UO6fbpwDHZRXkCN7KxdQmFLZDXzrQZCWlo/2EEvV4yTIJDbnVp6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLr4krblrfQ4CseFr8FVjSrPiSAW6Sn08ZXpcKWoAngzqyhljU
	DRlVu1X92qBGexzf9z1OrZlf/av4J30m79+vhe8YZWfVmt3SklhlYKz/8nwQDDST9P1iTlepjm8
	3XoCsie+ueRDf2SkQQypUY5TTldXQPbMwacz/tpBlkV7IFH4gUFgndkOoHoW+oBA=
X-Gm-Gg: AR+sD131A0Urg0azrbL/9y3AG6mDryKf1G0XvfwhNNvg/0RKfCW8+5fS9yXzYz64SFL
	rnso8jyiFrFUFT4dCRRggg/42xqBGYVZr4xFjlO01m1VSPWfkWq/c5EEvM0MkJ0830c/aPcZPg2
	t0oRDZpNMPUCpEvvtFU29WvQtVCNNW0kXI9LcVhVeDwtOhEAcMiTTAkkf5BuWFgRM9wE3ZYJ82B
	W+IbTwvIp1X8hALbMCNQR7Jmu4qpUCV/nMW9SnKj+Nh4Qh3Bd20IyihLvXYBCNA6w2I82tZ2Fl0
	1Ttoh4cuQ79Gb7jT54ntn4sFK48QscF1af5+OZflu9WPaERfKl6A85uyz2LoeAw/Fh3WauYGRoz
	g97SpeZc3SAStR7zh+GW3JYoY
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2349734985a.0.1787044010709;
        Tue, 18 Aug 2026 02:06:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2349730885a.0.1787044010319;
        Tue, 18 Aug 2026 02:06:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed68f9sm155764166b.27.2026.08.18.02.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:06:49 -0700 (PDT)
Message-ID: <dc555512-3161-4c4b-975a-7ec60a8f1a48@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 USB3 host
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
 <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX4WNYrbIuOlGl
 GsbzhGiJWPXbVxh4iX8YngmfeUINmAzo1RmUdDuNzEEhw9jd9Uo1Zz78luv303JLF+l8o8e+LMp
 PcNUU+uU8xeo4lj2M5ipilTIxHIg8EI=
X-Proofpoint-ORIG-GUID: wTCodfAsh4BJPX5KuMezcjT4rgLW-Y4u
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a8420ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LTL54F7UJFTHhO7zyW4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wTCodfAsh4BJPX5KuMezcjT4rgLW-Y4u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX3NZnJmkX8jA+
 mFc5X3OTxyoE+sOY52JC6jZGrpYuHE1fMh5WKsoL1cuO8FKwiFZBE+ri/t24FFKdurrhmt/izZQ
 iALO38q1J8SmvrnVQn7mpQMNfC3TlIbjm52k3B/J3gA+gC5oW1x23GA17wuwq5qAmrPnHmKGb43
 nB50OKqrwo1CFiSEhaUNmfB76YXFVycWZ2maXMZzTkg34M3veQgP1UlaT63uhz5jguaSJKKZS+G
 Sln90lv3dryiBA/SNh+LDfe/akq7z4yVegrN+0/pH0VBPAnEosMX2BzJfnR3PVsm7uR05L8ECTF
 Fncy3tzCjdOFg9qmMEy9w17sovSQo6wVCB2fxSrJxp1VGRqwHX3KlkfbzaOJUyp/lbqXSRP0Wr+
 fVqjM2u2qEvcUy4nyDgiidCR4KnFfvovmo41TPMVesHM5gNmR9itfUc9uyWQSQ7ukp6qh0B7xlM
 1/WDpszioj73SKjUxag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The USB3 port of the dragonboard drives the onboard TUSB8040A hub with
> the AX88179 GbE controller and the PL2775 USB-SATA bridge behind it,
> but the controller is disabled and nothing describes the devices, so
> their reset lines float and their supplies are unmanaged.
> 
> Enable the DWC3 controller in host mode together with both of its
> PHYs, and describe the onboard chain as device nodes under the
> controller: the TUSB8040A hub pair (with the EEPROM-programmed
> 0451:8041/0451:8043 IDs this board reports), the AX88179 on the DN2
> port and the PL2775 on the DN0 port, each with its PM8941 reset GPIO,
> all powered from the always-on 3.3V carrier board rail, modeled as a
> fixed regulator.
> 
> The SuperSpeed PHY is required even for the hub's USB 2.0 half to
> respond: with the SS PHY left uninitialized the hub connects but never
> answers enumeration at any speed.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
