Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0923BF68D
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043930; cv=none; b=GWZxOrcWJVyIJMOJDjhQ4O0VViOiV1g/xo30HD30BL1ngRXv75JwVtA8X9//e8ZRkcJzDWPNXVglH7yyrr/3xAymo8lGojjEkkb6GNVqVTMuvUEUXlzzBOYJIsGHQvVc8YyZS1PJPA8V0onmJKvcTbq11eqYVsvtxNZiPPWp9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043930; c=relaxed/simple;
	bh=RVtwFuhUJgUcHEDCgo3IekEMlPvs4oM/6xaTaNcKoV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Inxy1cgRncfuNRB6an0k9MTCTv9GUExbquOUKB/FlcFg2PvRxQM6lHHCx+K8qQykBo3GL1PlUs+X8AHEguMJGxhXqfo1MZEd8oxu6nXku6bB9Yaz0XV1USWunY0/8IcqlM7l7dFW5D16uBfIMmQh+fI1hcA/upwedtUSBHDMpb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/qXW6Iy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtAinJ1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/qXW6Iy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtAinJ1l"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJUL1270773
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVsl8LA6QDxrYkwyUvOEgaTIiz3CrQGPLrxqITO8Sbk=; b=a/qXW6IyPmOjZlD9
	zPlkBesoLG5auMRYnUJbR143u1a+GJmV3i580T2Sgfz1Tv9M32Lu+qw5bAnC9cqI
	6qGxjKJB+Q0P0U9IZ/ETu8lPyDR3EYqxktyNGE+tf14ji/QeBVjc4fG30IuVJcZi
	eJxFpEDO8z8SUn3E+D5hqJvBHzQ9pmLIj8xc/r1dE/D+dYak+wBOT8VnL+MUCSaL
	CwZFJRdB3Vk60woIvN4J+v7ia3lhh8Ygsvk26xqk7tIZcMsOvwpk0GPP8OfDuN6J
	IJKfHbIujqEovEOH/CJM1q+7svNG78tQ72OJHMzEfYVvq8FoqDLoePMpiC4Dq2br
	783oPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn1ub2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 09:05:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so113814685a.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043927; x=1787648727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVsl8LA6QDxrYkwyUvOEgaTIiz3CrQGPLrxqITO8Sbk=;
        b=ZtAinJ1lKQBb2aoU3LKb/YxJaig2LApYmfT2bpUbJRiMjAZ8z7Fry54MwQaSzrH29U
         enFZO4/YHwKXoiyS+9XAXJULNtKrwkcQBCQbTB6uGgUGo4v/ktrZxW3OaHa+WWhR08Nl
         KY7xti5ihUNxkHlpMIEa/iLZExk57kuYPeyBl11JB7vrjZDOjiT5O+OxnxGSd+ozkzex
         QW5J8yhYwN8AaJ7SxqUuPg7stpnP6u3Q1yIoW2eizadv/8RCj2UnxjqjJLf7hpf/l5FK
         KXcsz3W81Agj9ZVdBuBf6GMz17GDJvmltN8ZrGhLPGh91LtAbb/eKw3pYeajH1yUeyif
         sluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043927; x=1787648727;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVsl8LA6QDxrYkwyUvOEgaTIiz3CrQGPLrxqITO8Sbk=;
        b=m9BcCZZV/91QuPrQ0qrlWNrcCIZ74oFBWsVNDiym45PfzJf+4Kg7a4wtBqYEsIQZjn
         BpTxH1RF82u3EfYdyOB513ywHVACrpVCMCLf2sAuwk91PBtDZbreUMBdImCDb14nAmpJ
         LECEffi4F6MXgZRNOElB1Jf/8MVDk2Sv1Z/QZO7ttA4otVLvNl4n+kiPxLnDupsdJL4a
         7nh6AG+/KJ/nnK6kLgUTiCFn/CMuUu/ERgXZ59hUCyws3XifluP4ir3wfjZXL7j6urJI
         cqTh9mIBb2j8nBlR37dK/X01w4sC08Wjn9hei3hGljVWIamxEnQcZxjbN6qcF/MLRg8H
         gzSQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGLrl32kqHR0l3bZhTEDRy/7QBlXhLYWOa5PQPcq3itpRotJA4OTXkNOQoUkug6lRvG/FdqdcrGRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3xZCvyrI8afPtzJZ1l9aD/V4nDQlTPxD8JejsUK/RG3FbyCB
	Xss4ltl6k78qRN/yrMin8bglS8pkJjm33b/5M/8nfGlFw6JCCzNybJJtP6tF7EGpVLiTUySXcY8
	KxyQ+3phhGaVuqBRg7oAUMri0h/Hf50Ds1M7WcrmgRIsXj0alUFq4GHmqOFc5ixA=
X-Gm-Gg: AR+sD127eSq0Jl3uUj9vVZzCaW/7YeKNDuAkEs4uHGPNM2NV5ynRg54tsW3FKIh7O0w
	mHgy8ptkzBlsza26S0+39rUGm+NlNS1T9+0zFz4ppnRw/tCjAnoZnr+Y2YnhI5SM6jOAZbC6J9M
	e5TGnARsKIgl9UV9qIe9tpg5BK+ZPnpObSABxTfmFE10BmsW6daBIkhZuanyq8HoG3Ex1f1gVJD
	9sWHuasvR5hNFVAmq5R1l9+bbhkfg0BVxoTlXKga0izxGZFjCNv8G3KV2A3ZR4I5SKOGQHkfTcU
	lEimzlxlOAHBhKmKgFNc840QH7SfYXjf4v2wEfFNMM4YvkNk8V4L9TthJ0WqL4SMlVKPAN7RBNE
	X5Cf96GPyLydogZl5H1KGdIpQ
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2230380385a.0.1787043926994;
        Tue, 18 Aug 2026 02:05:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2230376285a.0.1787043926484;
        Tue, 18 Aug 2026 02:05:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc9697sm126034166b.61.2026.08.18.02.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:05:25 -0700 (PDT)
Message-ID: <c938fd61-a01f-448f-8a9a-bee0b427806d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the USB3 controller
 and its PHYs
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-9-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eMm1iTNKuNoJ8vLKljnumPSQMhmrt5Xj
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a842058 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=lS1l__rWwDhSR1qZn34A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eMm1iTNKuNoJ8vLKljnumPSQMhmrt5Xj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX+HT9ynuFhnXZ
 gB9xzhYeWXX2M1pH/pKaUTgf/7vdbTu5vlUOZeI4EoaEiMD4UnRNACBK6Dth86lkGzT6E1G6MLM
 jCDbcFWdRXsoEaW2NeLm5ESaBT3FEP2UXh0ONg+RvbiwNiuWd02v2Cj19dzXdkT8jz69aCZnaWX
 rsZSNuLDUBP/xs/0aMakjPldm30VOJVZoTsenqxypzuj85oljA3Es4UJ4KvZYAnm6FD6fXXpnpI
 YAm47BKygY1swJFobht5HZSb510NJoUk9CyHs/cu8lPZ6RkOETDTFNtq2q8oqS1kxuH/lBx00fb
 d7oZ0AQccIM3Givwj9k6ZTmfcGN5FddXpffHCqYaady4S1a6CXVExUAXewIJzVZ2fVExuKKWVh0
 NYQIHL38ptk+ItdtQnxSTpLyzYnGFLZ9ujYL8qhFZjJGYxrPqCFWwUbTkEZzJo14sOapiKhgjzD
 iGnhjxvkv/lEpaiOukA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX6J+0TSGVKKRY
 miRI0YhqeARdjZDbACMViLE/eXXDxH+9RLfTc524JmxLepmUPQAAzVp96hsBgXvGRHiMv9uQzrb
 KvZSKxwx6e727udKd0Rjchbaf2HMaPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The primary USB port of MSM8974 - a Synopsys DWC3 behind the standard
> Qualcomm wrapper - is not described, so boards can only use the two
> ChipIdea controllers.

[...]

>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 47 ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index 06c0af0aa317..bac3c8772e0a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -713,6 +713,53 @@ blsp2_i2c6: i2c@f9968000 {
>  			#size-cells = <0>;
>  		};
>  
> +		usb3: usb@f9200000 {
> +			compatible = "qcom,msm8974-dwc3", "qcom,snps-dwc3";
> +			reg = <0xf9200000 0xfc000>;
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3", "pwr_event",
> +					  "hs_phy_irq";

1 a line (also in a couple cases below)

> +			clocks = <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
> +				 <&gcc GCC_USB30_MASTER_CLK>,
> +				 <&gcc GCC_USB30_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_MOCK_UTMI_CLK>;
> +			clock-names = "cfg_noc", "core", "sleep", "mock_utmi";
> +			assigned-clocks = <&gcc GCC_USB30_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_MASTER_CLK>;
> +			assigned-clock-rates = <60000000>, <125000000>;
> +			resets = <&gcc GCC_USB_30_BCR>;
> +			phys = <&usb3_hs_phy>, <&usb3_ss_phy>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_enblslpm_quirk;

We usually have 10x as many quirks here, I guess +Wesley may not remember
the suitable values at this point, but I think he mentioned there is a set
of "common defaults"

> +			status = "disabled";

\n before status, please
Needs power-domains + required-opps

> +		};
> +
> +		usb3_hs_phy: phy@f92f8800 {

I don't like re-claiming the memory space.. Should we make these PHYs the
subnodes of the qc glue?

Konrad
