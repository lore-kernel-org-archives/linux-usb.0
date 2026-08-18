Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2543E06B
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043362; cv=none; b=NqMuRjs0TQoeGgYE+aP3he0N0vLOukhYsN6tuOLXtBp9umjsuDmksnaC1AxvHTw6plquUmbWuU1lYCdOEY++6qsZITS8SQQlGzw4lNbdfvXiqPZ01lMLp9TCDLPY4hdWdJyDriFSWXQsUOiLgEtN04T5P1EJl0BINmGCurM1Jg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043362; c=relaxed/simple;
	bh=jdXUg6ge+CkuqPJatY4gmfdrXLXrsfR5VvZfoquwTog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQft6AV12PCsp9lTPuxbJ6+ux4I9ePhpb635qbRP6NTEAFPuaXsPzmItTKFQVsgQRZTL2Lj4OxixrfNJ/T/zM/w6/Cxs4f96tcEo6NKSXg/jtlEcWE2JEKt4+bVWtfngDJHxTt5hClQolewoWvX8ekMzuBuaP+/+OwBWuKBNj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=llLLalVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We/mdQ/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="llLLalVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We/mdQ/K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BIF6243024
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XpOqc5E/x3j21BWFeP0v8ytaBSccBnOmabQ+CpqYvE=; b=llLLalVu0NRbDmfe
	/V10Tdhur2wSfmzs2NdTbXiVbs0u2xWQRvvwMtIm501Xle5gwGHobaaC413KYLJ6
	zRGO7V2aJqlNsQc2AtMAk5RTICkrKgKpY8T6NDcnlUZ5Au+nhYU2OU+e8C/9KuvI
	Qgs3iYeFKxYJKAvBGYbSF1zv9TklNA7uKkMufdX9hpBVUQyjs+PUfStWyLwAE1Hg
	wc7pPm9FkVJsVxeq3LxUIkPkSX6vENOLUjMPanm7x5NHRd+2ruwvToHMtajeWsId
	0qdmFHM5X/ogKCdY8IgqzV2aRIbAXa7m6h2YIcTTo4lb2bmZjLHvFn9oFF5KpOQ2
	T9B4fw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hn34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:55:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-903694fd3bfso761816d6.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043355; x=1787648155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XpOqc5E/x3j21BWFeP0v8ytaBSccBnOmabQ+CpqYvE=;
        b=We/mdQ/KzJwbg9pfbzAzox2t4ZWCYdp6RyBjsk3G9SwXL43whQAkS4kyBB2jendlhd
         iN9MIthUlSX8jHOYD2UKCRojK0SEpEppUibEqzK2c+VtRzxRJmZdHO30vUjYw9W0uPn7
         tSU3TnFNft9xB5L2I0PBfvYaOMxQkoAjKZZKa8i0R+EG0nXukGyc/X7fAo6kd/SOoKZL
         +Ua79SN0JMlsHttHi6YAU/QgOaQFJDtWHmcFBs1VcwhJ8cmHzhEEqfBiiUJ8ytjMzPXP
         v6PWQPz59vZx7qefxH5CPHolS4bVLEXiy3FgGBTEUNmRxKeRHGxd4UWV/n9CKgNLZ4bk
         hH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043355; x=1787648155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5XpOqc5E/x3j21BWFeP0v8ytaBSccBnOmabQ+CpqYvE=;
        b=Lti+Pro2fSfHbdhAMLfq9QLba13herQzguWPfO/VX0KaDerCCm7FeYe0MAdEIuCCVj
         CMOCdLFf6BK2Qu83mGV2geTDQiSZ4K9t+CGDW+I4SyjknxuOuijD/bVW7ot5RR5U7WwB
         ef0UW3y1hybNZzsnZCSRxYZ3Qmdbhpx/pChWAuAUWIlm5i97O52pmCT7W2pR0izb2x2r
         qIKPgqg+mp47LxLQ/EkNczxvUzhDig+jKxGMt1jre9ZuSURWmKqaMdT6mC20GcJp/DnE
         ZUEgLQSgZnWAbBZ85NEbXmLu17vxxnckWm3OvDhFQMmpireIc2mVZMEjqi3Kt3qgZasy
         zp6A==
X-Forwarded-Encrypted: i=1; AHgh+Rr7pxtUOO9WhwLRcxGzUAWo9X8GI44HPRGEuzkEi4EVcd8OqOCE8tGCqI9vFZUvcioydHSZjjX4gmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4VDdTLmERgrpNZcJGi/Gbn9S57v6Io3XjvOVHAVy4rrRlvnI
	QfyAn+SfkDDWLb19KpuNuww2k8WzaRI6VRDYPc8KmcD63PK0Ls3Ucl3zYv1k6SIGZyqD9XKeh7q
	hJNqCJOADupbRmTUSvG6FFxwnhKFxRLtUxb1SBgzJo7y+eLDoH49PYCOcaxgSfN4=
X-Gm-Gg: AR+sD10e8+DDq/2hwAHV9XxDlnwB1ssK5K1rCaIeWH1t/Vw5YWjo5HlY2UnOH/vCJX6
	tTGIgXjDvL7o5OX/7Rp34r9mm+FrM88I/uyAXe/m8VSJZBQePjQifNrNpOuRY/sF1xm/5bzeP91
	wayjH07JHlpO3OMEU2WfWKHUJW4Xw86w+ESuaJ6mA7ufjeIoAyPtLLR2LIh4c1ITZUB9wQTy1fL
	ORj3hNmLytg5HMwy0l2KAZ0DWcm0DFTc9AD7ZkWfuHzARr3XVbEOxmJ38D1VDiWATB5N3PJOJvP
	T866bqOscKo7XWB769rrOrpDu75H0+nDsysiv7PfsLG7KV3kMJ5enQb7+IGR/eYorokeyq41JFL
	udF7AuUwSiEsJC4PiC/RrLogA
X-Received: by 2002:ad4:5aa5:0:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90a91e84256mr216308736d6.5.1787043354996;
        Tue, 18 Aug 2026 01:55:54 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90a91e84256mr216308486d6.5.1787043354537;
        Tue, 18 Aug 2026 01:55:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed68f9sm154596166b.27.2026.08.18.01.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:55:53 -0700 (PDT)
Message-ID: <eb7b528a-6d5d-46af-b0d7-410bd9acfc0b@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 10:55:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] phy: qcom-ipq806x-usb: add MSM8974 HS PHY support
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
 <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-4-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfXxILDCxFLhmWi
 hhldfLLBPFbXhX5cZ1gX/zICIK5lNEWHIVYNu+oQYx5HRQi2XiCjzxLPMiVtUaqBZb75FHjNpwK
 u7LXLntMM52lzZgAKqY4E4DYVfGIOQXMHREjF34XgBLNH1KSZi+HQJwhDH/ugUyiMIK7a5h/4CP
 z1wUKVEAfZBrnjV3kHUGcJRTD4bNHpB7kPPos03JmtZF18bSULunZ8ryGzNSFfyOsiSRFt1CIrG
 j3YSOJuIRvhHVC8R/5ewJMzHYCTB++1oNJX+Q9dIks33QKZkIDtj5Wzp86POMKEu8kjv+2PWk/X
 C3TUN5BUYF70jvMi9HQKmHppAh4toSD21n2quM4jWbQfObyQLkzzQmZJ9tl2TisuN1TgrK/JLKX
 WTzFoO3rKRW9BZlbLtq5Ott3ZNR4iXIJPLvlrGQZhARiGadJ0FDauFB5qbAT6xuD1f8LazRUK+G
 CFLGstgxIwjNK7ubpmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NSBTYWx0ZWRfX7occMXfz1Sv8
 ZpRADapSPvUl2UtmzMfxDSXe7//FhZPnxiG6tyu8S61pcvELeAlAyoPGy2J14jojz12x2VXE3hg
 1cjE27tPEzVawtUay9OshPEM5pYxgOM=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a841e1c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HI9WjpCpug938Zx-P8EA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: gF7UzSgoYcQUJ5ODq7ugQw1-_7OkcEVL
X-Proofpoint-GUID: gF7UzSgoYcQUJ5ODq7ugQw1-_7OkcEVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180065

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The MSM8974 DWC3 wrapper embeds the same generation of QSCRATCH
> controlled Synopsys 28nm HS PHY as IPQ806x, but the driver only knows
> the IPQ806x variants, so on MSM8974 the controller runs on whatever
> PHY state the bootloader left behind.
> 
> Add the qcom,msm8974-usb-phy-hs compatible with its own init
> sequence: unlike the IPQ806x one, it must not overwrite the whole
> PHY_CTRL register, as the power-on values of the reference frequency
> selection straps have to be preserved. Only enable the UTMI clock and
> the DP/DM MPM clamps, signal VBUS valid towards the link, and disable
> retention.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 35 +++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> index f22c0000479f..21b59d4ca8d2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> @@ -17,6 +17,7 @@
>  #define HSUSB_PHY_CTRL_REG		(0x10)
>  
>  /* PHY_CTRL_REG */
> +#define HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N	BIT(26)
>  #define HSUSB_CTRL_DMSEHV_CLAMP		BIT(24)
>  #define HSUSB_CTRL_USB2_SUSPEND		BIT(23)
>  #define HSUSB_CTRL_UTMI_CLK_EN		BIT(21)
> @@ -27,9 +28,13 @@
>  #define HSUSB_CTRL_ID_HV_CLAMP		BIT(9)
>  #define HSUSB_CTRL_OTGSESSVLD_CLAMP	BIT(8)
>  #define HSUSB_CTRL_CLAMP_EN		BIT(7)
> +#define HSUSB_CTRL_CLAMP_MPM_DPSE_DMSE	BIT(26)

leftover?

>  #define HSUSB_CTRL_RETENABLEN		BIT(1)
>  #define HSUSB_CTRL_POR			BIT(0)
>  
> +/* PHY parameter override register (eye diagram tuning) */
> +#define HSUSB_PARAMETER_OVERRIDE_X_REG	(0x14)
> +
>  /* QSCRATCH_GENERAL_CFG */
>  #define HSUSB_GCFG_XHCI_REV		BIT(2)
>  
> @@ -115,6 +120,8 @@
>  #define LATCH_SLEEP				40
>  #define LATCH_TIMEOUT				100
>  
> +struct phy_drvdata;

Can you just move the declaration here?

> +
>  struct usb_phy {
>  	void __iomem		*base;
>  	struct device		*dev;
> @@ -123,11 +130,14 @@ struct usb_phy {
>  	u32			rx_eq;
>  	u32			tx_deamp_3_5db;
>  	u32			mpll;
> +	const struct phy_drvdata *drvdata;
>  };
>  
>  struct phy_drvdata {
>  	struct phy_ops	ops;
>  	u32		clk_rate;
> +	u32		hs_tune_val;
> +	u32		fsel;
>  };
>  
>  /**
> @@ -273,7 +283,8 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
>  		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
>  		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
>  		HSUSB_CTRL_UTMI_OTG_VBUS_VALID | HSUSB_CTRL_UTMI_CLK_EN |
> -		HSUSB_CTRL_CLAMP_EN | 0x70;
> +		HSUSB_CTRL_CLAMP_EN | HSUSB_CLAMP_MPM_DPSE_DMSE_EN_N |

This will *disable* (_N suffix) the clamp on ipq806x too - is that intended?


> +		phy_dwc3->drvdata->fsel;
>  
>  	/* use core clock if external reference is not present */
>  	if (!phy_dwc3->xo_clk)
> @@ -282,9 +293,14 @@ static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
>  	writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);
>  	usleep_range(2000, 2200);
>  
> -	/* Disable (bypass) VBUS and ID filters */
> +	/* Set XHCI_REV bit (2) to 1 - XHCI version 1.0 */
>  	writel(HSUSB_GCFG_XHCI_REV, phy_dwc3->base + QSCRATCH_GENERAL_CFG);
>  
> +	if (phy_dwc3->drvdata->hs_tune_val)
> +		usb_phy_write_readback(phy_dwc3, HSUSB_PARAMETER_OVERRIDE_X_REG,
> +				       0x03ffffff,

GENMASK(25, 0)

Konrad
