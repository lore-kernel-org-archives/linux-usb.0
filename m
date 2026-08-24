Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A083EE1C7
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562246; cv=none; b=lJlTXTolKSRVnD93o9yo6GA68bQonO3LyghsiY/JNrws33P6YG1NoEz/yrWPnDfrxeMLm6zHEdjwtl9+cVUeU5AXD3WAMEvVS3QUkovA1HoH4ctX+Bzjp/a856zzKgsJEPKxR0NhUrPGuDjpY5/1TAPdWKgRAeg2Na2Mtq7lNNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562246; c=relaxed/simple;
	bh=auF2pO2Hmg9N2RW//a8wPjHGAi6Mit9yV+sAZphKf7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qf/up5TBtCkagN8yZJpN3MREz/C9UMUXsf+QXYdnBbb982TC/Sq8MxEc8rh6AVSFQ4P/ew0CXlKjQv2niIyWaR1Cu/0aH8aFVDrryEeTbh9mbFdPCg9dUXptB3acHKoHZyt6MkIU5uQeIAQdi0EJqzQCpY/Zyp1IYTScsHVj66k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUdhx2wM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQi4vLul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUdhx2wM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQi4vLul"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67cAI1662617
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1tg+9GkDewkaIGXkzfNnMwEh50htryN5gYb6ZgOR8w=; b=IUdhx2wMC4jBzqQA
	RYhN2tPt6/sXODOh+KV0x0ucDTfua/yQSnTS5B5imfiQevVkBizpHMrzdLkrf2jx
	yTA7jXFnHmYcKxy9dExIM1oJZAYxjNpOHj9PBGRSzLk+MWQFp8Ll82VJA9ve25fE
	GujNJmf/hoXtgHbm/NFQBiUcBMStm0nr6nakgXK4udBFuWwxgGxADG2mnY9qWLsd
	3ty/al48kJrzKqcixd++RIQ3Hpx58W4YfjzjDgn4HAy26MocgHtBGCn8Agecyu4E
	uiAPCHaGwAJ18inyePO55eUHYhSYtKdVMMjgbbajyEtQmZRQRL6Dk6+ZxmhHfg36
	+yMvmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgshb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:04:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d57d17d6cso6871801cf.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562237; x=1788167037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1tg+9GkDewkaIGXkzfNnMwEh50htryN5gYb6ZgOR8w=;
        b=FQi4vLulmPp6ns3/qlmxtzCrCfwJV89IjTTmRtXnIXOqFxfx9nrfDBr92ohGV5fcni
         euW0LYwpjoPVbBCS+5LWJbcvciKgkYf7nnzMKqXhgpvut9i7He3wBj0isd/YB9MPFUB3
         hadxC86jBGGaJtTYFtgASDV2kRge0FqqU+PYdghQdumjBs7TKmE9wwdcrKUeA+wRUpW9
         Gzi26Z9DeqDC4payQfc9nlGMF01BX0tTCgSSAMEmN+zCBDIWl61gBAYbLrJEUllBOz7B
         XBGzTWyC67vHk5amcBEKwBG5cD3LUao/g9FJ9chWjU1L7gVn5TnofBS7+Hlygim5Poch
         WQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562237; x=1788167037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1tg+9GkDewkaIGXkzfNnMwEh50htryN5gYb6ZgOR8w=;
        b=W/PBVDuhi4UTjxcUPAANCSOwZUASk4sC6Y0Bsnf1nac4xFc0GgAJSvLTI4ljzx3B0g
         vb5IbesSuiGtuJs4TcbqrJ3apUZ2Yz28fgzO/O5+hPFh4v7ryvzrqkisvrrbvsV/PiZq
         CXvFok2ZiApmK9klklMn13EXjRMk9CcbGpHvcCvtvNplkFoYoyR6Sjr5NIk9ij5mWhSv
         WxZd1fP4HJEzXFjXfsP6bDbo9pwWX2rZDd7GNJ8GTsxbaEkDe4XrfbINYqJTl64MGcBI
         K15xAjuxgcxpk5XrcOOODOV/V01zd8TAdILqRvZNyiMVU9dcsLma6xnJ7GceBgGB+uP9
         sv2w==
X-Forwarded-Encrypted: i=1; AHgh+Rogjiz3VdRJgM19vKisOpoIaAf2Z0FRiZxx5d6/6T0OLLd8A78Z0cdGkXLT0EMNJwTpFisK+3q0wBE=@vger.kernel.org
X-Gm-Message-State: AFuF++nW8uPa5RZSRAO5En3AD2wZc51Gsee/BA2ZNnM8wyH36lv1Ecbk
	6yQqqR1R0cxAXVyDZmSwv4ADTpK2Z82kA6hyuKJlvJWqq4rPny88QGhpWa/oAqenaVBiPPncd2o
	reQ5z6THdQNdQCSjr4CnMfWP6uwfEMIKhE+3OfjP9HZ1+bXc8pGSghSOdZOrHRRc=
X-Gm-Gg: AR+sD10BuFBtbObbUkqbSB6nMrI/8t5wyDU0RSNHYUyUgrMckIvNwEm/d3RS+IFZWs3
	6LMwh1+Zg9a8xqnli0/WA1b8dB9yZl7Ne0rZN0fdziHahhC20BoRe0WLbxgjkBpJDoDh0KuvIJ0
	0Ennlnr9yHYNAfolXWsvcN5pPIldCaxdOoPwNK76AxSpY6dXxke4FM9DJaCX62n+A64KvLYyS2P
	VJTT/au9BYK/mBZYVe+pzH9leB+WpMv9qCbSgBifS11x7UNFzOZmM6lkmdIN6fIlruqikI+B+gn
	5Ti6tcm/luB+RGF1Ba0ktn+tR1FVsmu4FVLEWvmDmdT9G6O9HiY6fYkT5hURNlkxgUmvFzKWK2Z
	BiBTw5ysfLiaMVxGIgQkI4odY
X-Received: by 2002:ac8:59cf:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52df560bc24mr185932971cf.1.1787562237353;
        Mon, 24 Aug 2026 02:03:57 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-52df560bc24mr185932601cf.1.1787562236910;
        Mon, 24 Aug 2026 02:03:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1192392566b.42.2026.08.24.02.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:03:56 -0700 (PDT)
Message-ID: <f95e1af9-0808-44cd-8323-687b4de3f158@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:03:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ebFo4NgfQD_Yh4eQQ1KtwC6ylmiVvMwi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX3R0a/KLqE7X1
 gjV9+iDW2AoN9t3sqOcbQfM1AMQx+I1pr09p630q7uIbUec4BBxvja7G8RAIYyj5es1NPJE4LUo
 HL8YJSo01WWN8EEZPlrdjD9jhnBTeOT1BpOq5C0VtA7GN5NpZw/tnwBqKhCa1FID3TkBs0sjzxW
 IMTjEIk3iohYoQATT8/r5XObCu1EuTrt1wwoKTta5GiTMcMlzR+9I4G1wn0c92CKk9H0ClgD8wO
 fxxUZUzn3z8f94S9Al9zlXr1uLySUtER1RHLwi0eyDzdIKwzJNYmEKsuHjYjV8CjIwCe994MSoM
 5lFn8Krz2K1Y03lUUBoWcnaz+C5vZj7EDGUE6aPPJAI0zYYKoPwuKaNAXJP/FwcRn3pbpr2ERvp
 Gk4+uZ1+iTGGC2paau35705J9a3BwpBz+wY/gjyfpmWYcnmv3wT2Cx2prcu5zPVwHK1C11fAOj6
 MDcIc46isBnEEkKciBg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c0902 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=13kpQq0dworOtm3SAaAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ebFo4NgfQD_Yh4eQQ1KtwC6ylmiVvMwi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX98UqllMQqUvW
 OT2frDg3AAN8NcTsc2WVMFXmIZrKHhd3s7e4b0RRqi/G5GWOwsCw17R58LhRo44XzVgUuX6Mjkk
 bnwUI5q5m5BNOKNpbU382reF2akGLjw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the 5V supply regulator and enable USB Super-Speed PHY support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index 8efb2b21ed9e..ca29f271e673 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -22,6 +22,14 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	regulator_fixed_5p0: regulator-s0500 {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "fixed_5p0";
> +		gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &blsp1_uart1 {
> @@ -119,6 +127,12 @@ &usbphy0 {
>  	status = "okay";
>  };
>  
> +&usbphy1 {
> +	vdd-supply = <&regulator_fixed_5p0>;

I think we'd see fireworks if this chip got a 5v input. I'd assume
this probably needs the usual-for-qcom 0.9 V and 1.2 V regulator pair,
but perhaps +Kathiravan can confirm whether this holds for the router
SoCs too..

Konrad
