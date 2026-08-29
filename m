Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1BA3ACEE3
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022101; cv=none; b=Mg5tsF3QVZZ86ByuwI2z98h0S1V1+dT9cgR+OgTtMckDwRvFs2BkoRXbF/EarGtoIaasSADV6iHGdaBPuD61YC6+vQMlRgli+qZlm98z15vq6hvZh5VJZOwTfVUaHT7ICWy/gll8Utk8vDBZjM+mRoHvYUOkmRy6JI5Feyafz1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022101; c=relaxed/simple;
	bh=jBpyxIKAfMKLZ4/3cCqUNTosNoFDYK14Zh5fd45UyDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZYGvuYdrLvj5YCuoPrcPOg5aSwrOykIEVR6rnEQPRt0+angRx1/XQhdItdQGU3A7EgSoemjiT1S5DbnH3NOqRhVpNssZoaqEXhuGHq+9BezJEvseC8gBJGcnykQiX15+7CFoxG3L/OKoaO64V0VxVtndsQKONMyp8Cp07A80UmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRnfKq/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekYuBq76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lRnfKq/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekYuBq76"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TE1rDg2662244
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyNtz9xYx4S4Gb6wibJXt3RyN9cWyWzJC6meo/SzVnU=; b=lRnfKq/hg2GAG043
	iJejxvgJn3qe091W4+4Buzm/CiXoMigwnA0VQUxVgRfepycvYdVhluBgPjFRD5RJ
	6Uj2aQX7YVpQwAjNeBTZKWMqn6wIbx+NVBI4A5e9lFQm9hRHEYWmgFUmWwthRSpx
	7JRNev3At+DFBsJWNMgsr5NtK8PKYjIa9jNhDv83X57oY12uy3VeH9SWxmT/fxW1
	GUvPMvFwMQisL0Dci491TaMnmG7lREfF0vqXCqrHXQm9xFONJIojXycv0AehIp4b
	C0qxHW70wR6vYkEY0rc7/JnODaIt5mOMjL8Ul22E/43S+wzPTaWwRdRN4OnJCb9D
	s21Tkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfhdpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 16:48:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so2569529a91.0
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788022098; x=1788626898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyNtz9xYx4S4Gb6wibJXt3RyN9cWyWzJC6meo/SzVnU=;
        b=ekYuBq76aEC83gpZYbNDghhy+DeBQQIqRd6gNfHuio7IGQLxNd91zP+uH16fONQOFj
         Xv83y7pz8iPO3uE+A202gbHuBx/iCsihBqDnyjDmQbfCigdbHgjAiB+5ZLNE/GghfbWa
         TawY99ZDjD7bWfL2Dangj199yS6/SZcdTBGcoASAP+qTcv/eLG7W7LL9nD3bS/KnX+St
         g/vomJESNE3hYbOAYnrVfU8IJu732SJYJyc1cmkstu/BXMPKDdXtg0Wwkm0Mgg1xEmq0
         cPyCYcG3jQkOAWLst/1FLId+wzhu9kO+z9Iau1q1u2O04/BjaDPd5IoXYyq4v5ZFWUsO
         bVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788022098; x=1788626898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyNtz9xYx4S4Gb6wibJXt3RyN9cWyWzJC6meo/SzVnU=;
        b=cd+lhhniEwH4Siqy0HQUCynDlLUd322UNckuzEqy5jNo1UGthb3iqKkO26CtNc0P0O
         HD3uwoM6qY2GsGXyNpHLg5jDvKCNdlLql4R+lB5t90N0Gjn+YsHb9Gpp0cHtTpPIkkBE
         QNIRaZsvTwkvuErRZTube9qvalEGIrXmlX3wWhhtgqr9xad+zI4XQvm/BEd0rwmtaL1X
         YU2bbXSmeKgqATdWi35Tkm0iiewVQDTJ1wER0YY/reWiV2gbm2qn/U2LA81aLG/1Mf95
         SntwBp7kwEngQaRWE7vdHNJNNEBFwLItUa7+jIlXNGszFsupnG9YNwI/i4Aa8GW0zKyI
         mA9w==
X-Forwarded-Encrypted: i=1; AKwUvBxq1WQMYziqXqGDerczx38elnmKc7hIoWT6JOdyYAwfUEw1Li5k46lfIm2nC+nwbJQYVSlJNU+9Arw=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ3/D6emT0wv0zq57ICSu6trpT3+VIA9pTqzN6DYJFxkOSzWgH
	uLD2TwJ6bfy8JI2ocYL9vP3LiuJbBew3VxKj4g6HbsGfUeQkI2jLNgOfoCer76xpKcXKwah7+pt
	Ivoq09sblVAEv/o1niz3ZoxKPpZRSltr0Ni08tNFSmbuqo3Z8qUI8L5XYVs/LSJc=
X-Gm-Gg: AYBFou0ebVh3y/QUhdLsq7lwYkhOsW3CPfkwrEpst3HohsZC7iIW583GI79oXNxnssF
	GOpDNfmh9/CEQEu+MNBxZWGXE+gvpNdSsMBkQH4tsysIq+Cj77ObSSDKoU58bMv973D+ujPt4TB
	dVn0apxAHwxn+B3ZgjWkO0jgu/6M+VvmGXfcxG81QM6U8PW/pT39tw+m9lGHDaP5OKACB6wfBru
	ybirzveBBGaxlIa1P0R/CGzALu8MCSiikiPTH/7+Zu6rmYgtY94w6Huc0GUdyM8drZlkrCHK0mS
	gEdqB0OsisnhHz/1PXNPV96+xp09pc6UHFuic+CBtqdiyaaGEYEyuZpD2U/Nc9bl/Bdwb2vxAWs
	VaQSyk0O+ckUz7HNpE5oRhOQUykkKc+QP2R0pm8hohIr7E2EhMuNNZUqkwKDaQ+aoszA=
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr3326114a91.2.1788022098233;
        Sat, 29 Aug 2026 09:48:18 -0700 (PDT)
X-Received: by 2002:a17:90b:588f:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-398bf7eb378mr3326048a91.2.1788022097757;
        Sat, 29 Aug 2026 09:48:17 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.241.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186807bsm12915180a91.12.2026.08.29.09.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 09:48:17 -0700 (PDT)
Message-ID: <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 22:18:11 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
To: george.moussalem@outlook.com
Cc: linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0NSBTYWx0ZWRfX1zgx5lsksP7Y
 UR2oMmpEqSWE28FxCtt9M84JqbB9NDVi3lh0ZPMTaUjm5/s9hG92+nDf5T8JvRFI35LcdrMv8/v
 DVaBpj6dzYNestHDg7b18+lB6RiBoBFBvqvg6y/MK1ONmPqZZ5Qwjr/4ixA6BufjYImDSzi+3jf
 1GEGakrsQvHqnD+xfQgsfdpQtHsak3+trwmNamUbHWN9rqQye47jlDXnqU1t3ytFpNKZxnzEFCR
 /6AcJ/P52l/0y0SYXHKed5q1qdNYNIK7/gQTpPGnUTrrrASkaCKafp8pZBl0uXzcHVkoPn7fK/Y
 vDqJIB5I9Q6gt0XNbY8PFnrrhSsC/yVAVgZzQorUtRdl0K5GRzPorTbFqn+hRIqDVZKSHCYIyPG
 Xt3sxpFkqtzUsfa2RapdhA4Q1y64O7ALT1VwH1tPds41INl2scNf4qI7qpRK3Ug7enjRE1q79yZ
 Ko9ojQgzk4VFfOLHCCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0NSBTYWx0ZWRfXwMH1OO2rLPvC
 MXeq8PAVPRH3U4b5oH78fumkm80qdueKGn+emxNIrqpvcgPVYmvAzJMnrqs7gizFVXhOH7lnY8+
 lvRmok/hX2WjRlc17jQAxFP4WhQbBAU=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a930d52 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=PZ14JaS8AzYbITig/tPzRA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=0nupcxNY4bLKEn-PqUgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uG3_FsPLaGlpugJ-JVL1HViFikKjBz8v
X-Proofpoint-ORIG-GUID: uG3_FsPLaGlpugJ-JVL1HViFikKjBz8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290145



On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> This SoC has two USB controllers of which the USB3 node had a ref clock
> populated in the DWC3 child node. Add property to the USB3 node only to
> select UTMI as reference clock for the DWC3 core to calculate the right
> values for the period and frame length adjustment.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

[...]

>   
> -			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy";
>   

You are adding pwr_event irq here. Do mention that in the commit message 
or send this particular interrupt addition as a separate patch.

>   			resets = <&gcc GCC_USB1_BCR>;
> -			status = "disabled";
>   
> -			dwc_1: usb@7000000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x0 0x07000000 0x0 0xcd00>;
> -				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&qusb_phy_1>;
> -				phy-names = "usb2-phy";
> -				tx-fifo-resize;
> -				snps,is-utmi-l1-suspend;
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_u3_susphy_quirk;
> -				dr_mode = "host";
> -			};
> +			phys = <&qusb_phy_1>;
> +			phy-names = "usb2-phy";
> +
> +			tx-fifo-resize;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			dr_mode = "host";
> +

If this is HS only, do we need to add "qcom,select-utmi-as-pipe-clk" ?

[...]

> +		usb3: usb@8a00000 {
> +			compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
> +			reg = <0x0 0x08a00000 0x0 0xfc100>;
>   
>   			clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
> -				<&gcc GCC_USB0_MASTER_CLK>,
> -				<&gcc GCC_USB0_SLEEP_CLK>,
> -				<&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB0_MASTER_CLK>,
> +				 <&gcc GCC_USB0_SLEEP_CLK>,
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>   			clock-names = "cfg_noc",
> -				"core",
> -				"sleep",
> -				"mock_utmi";
> +				      "core",
> +				      "sleep",
> +				      "mock_utmi";
>   
>   			assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>   					  <&gcc GCC_USB0_MASTER_CLK>,
> @@ -692,32 +686,31 @@ usb3: usb@8af8800 {
>   					       <133330000>,
>   					       <24000000>;
>   
> -			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "pwr_event",
> +			interrupt-names = "dwc_usb3",
> +					  "pwr_event",
>   					  "qusb2_phy",
>   					  "ss_phy_irq";

Same comment as above.

>   
>   			resets = <&gcc GCC_USB0_BCR>;
> -			status = "disabled";
>   
> -			dwc_0: usb@8a00000 {
> -				compatible = "snps,dwc3";
> -				reg = <0x0 0x08a00000 0x0 0xcd00>;
> -				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> -				phys = <&qusb_phy_0>, <&ssphy_0>;
> -				phy-names = "usb2-phy", "usb3-phy";
> -				clocks = <&xo>;
> -				clock-names = "ref";
> -				tx-fifo-resize;
> -				snps,parkmode-disable-ss-quirk;
> -				snps,is-utmi-l1-suspend;
> -				snps,hird-threshold = /bits/ 8 <0x0>;
> -				snps,dis_u2_susphy_quirk;
> -				snps,dis_u3_susphy_quirk;
> -				dr_mode = "host";
> -			};
> +			phys = <&qusb_phy_0>, <&ssphy_0>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +
> +			qcom,select-utmi-as-ref-clk;
> +
> +			tx-fifo-resize;
> +			snps,parkmode-disable-ss-quirk;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			dr_mode = "host";

This controller is DRD capable. Please move this dr_mode property to DTS 
file.

Regards,
Krishna,
