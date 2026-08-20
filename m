Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E4387363
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 18:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251097; cv=none; b=EXYnDHhrgEUj4PjUkuxN5QMo50bNhAA6CixmNL5+FegueBYmcjCMA2D4u3AdtXBxAX1gJg2SCR39bNCDZriqZwuGVfbRD9p2RtdtUZbOl8H0EtAKx2vqGbJqIkHNsXyxi6qPvN9aOhy7wKR8WVdj/nskIexzLdiBbNk4ReL6Jc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251097; c=relaxed/simple;
	bh=fQ5f3+9GI85NgNrSAZm13wfXn7vkIjjblxUZUpisIjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n616x64QKGhXG9k1YMMaP5Nh/Er74vJQwhb0cPzO2xm17Ocld9rqqHuFFWgm++cQLyFnFpCvA+au4lcD47UWEcR7r1rjDL2IZ3Zy74o97op76582b/OgnZnFiOiqNjb2A3TjWrMEfZNUaLSXcL9FOd8BpAO7QkQPZ8Do3x240TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3VpsG3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECAHNbMv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3VpsG3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECAHNbMv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJBAd3009664
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 18:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qc+7njUReQUFZe7+fYwWzGrp
	ycZ78k0Mq9dJrYEsPJ0=; b=H3VpsG3yyz4jelTLI/7tvO6YKF+p2D3dbsBWlyk4
	XT49xseBZPbYKsCp30ZDi+zFWxU+47EcX+BzcaRJwFYN4tQx8QK+xgIvjSPeRUni
	WaG/9xVlxBC7cxB2udAeWxL0ZG4S3Ur3I/S2SDax5yoQnk6QMPwKi8kBaaEBoOU3
	UBuhVndgannwJNTIAlBiSPEnASmDBM92Fe6fjhgWZ2AIaeEdT1EeDrZuuSNRRX4a
	MAw2KJvGjRO4bRSTAKNs7KBsgoRSMHFqBJ2TWYKAwHjJ6zwkx8eUToyL6C/8FBQe
	aSVZ89PtNidI/ftTeMncRxffBT+Ou0h+YXWvXT8j503rNQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05tnyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 18:38:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso2420111cf.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787251094; x=1787855894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qc+7njUReQUFZe7+fYwWzGrpycZ78k0Mq9dJrYEsPJ0=;
        b=ECAHNbMvbeYWYAvH3edTwPIepF9xEXaM3zsnCOt+u9fcZRfBD4Qz7I0cysNXbqniJr
         GrJcxB3SkCbmVEu4uUKeXuzO203q9dEckhIJLfcNhWLjMYpCfASGwhQ1gFtcm3bQhIaU
         6dImfH0tdukhpy0C4ELce/nzYxmhN3aOUO1DrTmw8qzb8K4xnrhv3wtfqMEA3myhHcdm
         YsFZ+hDg/+miKHMW4VoFQzrtNGBS0bHWM/00ymRHdAVE35R/jk/5KYGSNGJ5m7Q7NxEo
         gYJGoA8TiLyqw58W9NwneMJpPkI0+7+8+boQGILucmajrffvKcn2UMFw9/lATD+j2Mfo
         Lpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787251094; x=1787855894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc+7njUReQUFZe7+fYwWzGrpycZ78k0Mq9dJrYEsPJ0=;
        b=L70yWpVRhBgiE+/5CYBmKlQFX21+KZby0RuBBjAq4xnKbkP8k2x1iPUt4ag1u3Q1yp
         4G/Ef0K426LYdxTmFoCEutv4JYp1ziLbien9aw725oVLmhfdrPs4NEB31c1Y1NOiB3Dk
         +lg+50oBP6jqewUcaZAgZEkhnwi7r3JRXbKtVpMyVvrFMl4hyZO7WR7qJXN/5tMsFM8v
         Fkzit1ovzCLvWgHdsN/cMHCh6u1CxExD4rmGReEXbWtvwDkdKleg8X57f1oaUxppeVFI
         by2i3TXfYiV8JgOI2Pdv4176OJFZIAO97Hgmrpw4YkUluotVOHCCSVTl9aWkN2xdu8Or
         sWLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXcV/8xXYRbTxuxkpeMJSu0yp885dzPZSXo5vAooyPf6bg6fEVPeHQSt8yixqDOPB5mCkOW9y5ovk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyan6zRzgRZLpSFmrV+I5MDsxxUW0rKDkZB1wN1iUq9PcoVbX0K
	s5q+tfyBBbNJzLNQ6pHC6GV5HJZTTniC7Gg5Vko9rTWwlFLE+AYQYHl9ElFYmlAvZPuCo8FEgQs
	BO/Aej7N4fqPI7Lx9RPp5hcY408S018NTLt46YMKI+HRo6psFb5asde5djlJ6ykwHBcj8Vtk276
	Fu
X-Gm-Gg: AR+sD10ounzAh82m8iCTV5ipe2GIKmi6vSKxZFLJ22hgmJ7F7f9yrpu0KG5O50YBjtM
	/zQBQSrb9Rz1FKOfYVa6LSxfkubBIflIjFhXH3wFb+i54zyWwmiJjc0UkXLq4XYknhd176iT6fq
	BjDEIK5gAmyKNMGMK37Eb/P29NlrJp1o9tuxRFRMYTQvnIFaYFbRuI6cYFV5TuDKt8pqblzdfyd
	CgALPTG81qbdCgU/hZgB8mEAjVj/+1F8ktYL/znMRuDWaioW713XCdSO50zrXw52NwOQD7YCU8f
	5Rp86AyBg1dnY3SEUQv7yLuIyd92u2fTU0UFn2mNi6CA4MImx4oNTYzrJKjeYF9VjU5GLQXruyM
	6t6nPHZXi9m0ppFE=
X-Received: by 2002:ac8:5a46:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52df5a93f45mr2744351cf.40.1787251094334;
        Thu, 20 Aug 2026 11:38:14 -0700 (PDT)
X-Received: by 2002:ac8:5a46:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52df5a93f45mr2743681cf.40.1787251093676;
        Thu, 20 Aug 2026 11:38:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b29e19f2sm53748425e9.4.2026.08.20.11.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:38:12 -0700 (PDT)
Date: Thu, 20 Aug 2026 21:38:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
Message-ID: <7ahrj4udyuebngj3dqox643ou3byb23qkbf5yfcdqk2anvyo6e@tjqu2igyvwqh>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820145036.2035641-4-akash.kumar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qvzxyXy54TctiTMNVQuZgBrJaBpFjM02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX/M+hiA0TPrOu
 MUNhC6UdccNgdKBdVyew6TqEYT0zTMmZ3Bj63zLmaqPuVJca6C/1a5qjWGYKj/mTs+i/vYKu4S5
 23yYDw3PHHzcnBdeLv0+6daj2+AWnkpyEqjbVmedxZUNcbGff8awWhKlHeB3Ya7n+ZWz+OTPDH9
 b8Mu1vk9kSkF6nW0F3QUvHDQgj7DDcLUGd9ifN56qFLcWqLY1EJg/rP5J87xI38yyHCYtBXQfu6
 hDrLpZJMt3P1dif0JWG9iWgzeH0V3uin1JRuOlF0rw6b3E0a31vyooF3a86nhbShu0qCDKJwlnm
 5EO88GPDe3Esp8davn0B1ll6e/SfHqa8MFbpvkcJO2BeRbkWsmrVj+0K4EC6RgmBY0V1ZSy9OUR
 6vSBN2naD9XlkaxDIkO2LNEdtXe2xI5S0ZwLk57ydvDcNVupy3Hc416AcR3BuCzsYMjILJn2HTT
 DN20tGpWd50KKYx0pHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0MCBTYWx0ZWRfX/cdyrVWOMPpQ
 FO1R5jMUdd+qCOHNwu1XeOpPOurhpXTLL68wHyQDJFFTlTWKbpGAkZNjxk1N73gFxRolDq17ff8
 dDvvrA5RzMnt7l+5tJxIqGMM+JSAAOw=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a874997 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ba2XhVvwmFK6ezhSYYYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: qvzxyXy54TctiTMNVQuZgBrJaBpFjM02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200140

On 26-08-20 20:17:38, Akash Kumar wrote:
> On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
> the primary Type-C port and Cypress PD controller CYPD6129 on the
> second Type-C port. On Shikra IQS platform, usb-role-switch is
> handled by Cypress PD controller CYPD6129 on both Type-C ports.
> 
> Add the CYPD6129 typec node under i2c3, wire its connector endpoints
> to the corresponding DWC3 controller ports via remote-endpoint
> phandles, and switch the associated USB controllers to OTG mode so
> role switching can take effect.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  64 +++++++++++-
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  64 +++++++++++-
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 108 +++++++++++++++++++-
>  3 files changed, 223 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 3866ab8b0faa..c92ab8e6cc0c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -42,6 +42,43 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	typec@40 {
> +		compatible = "cypress,cypd6129";
> +		reg = <0x40>;
> +		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&usb0_intr_state>;
> +		pinctrl-names = "default";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ccg_typec_con0: connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			label = "USB-C";
> +			data-role = "dual";
> +			power-role = "dual";
> +			wakeup-source;

AFAICT, this fails dtbs_check because it isn't allowed by the
usb-connector.yaml.

I see you added it in the example the new schema you added. That
should've failed at dt_bindings_check.

Same comment for the other dtes files.

> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ucsi_ccg_port: endpoint {
> +						remote-endpoint = <&usb_1_dwc3_hs>;
> +					};
> +				};
> +			};
> +		};

Where is the second connector?

> +	};
> +};
> +
>  &sdhc_1 {
>  	vmmc-supply = <&pm4125_l20>;
>  	vqmmc-supply = <&pm4125_l14>;
> @@ -58,6 +95,23 @@ &sdhc_1 {
>  	status = "okay";
>  };
>  
> +&tlmm {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio136";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&usb_1 {
> +	/delete-property/ dr_mode;

I don't think this property is actually defined anywhere. I wonder which
tree is this done on.
