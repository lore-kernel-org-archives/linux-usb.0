Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687945;
	b=A6xbHRS/3PkO+l3IlBIF0YH9a7P4WpY07uli2Obkm+h/tK3f9F7BPbRkVfF/dy9MvU6g
	 FhJLNMLuaWde287aLNfQW16Ud+6jtfkITu+RLgqzY/5yD19/H+mY+lrEjt4VMrJ/xJD6p
	 uccXUHcLez6HbGPuV2hjVv16olrNIPqeecGnggxG3eKIW6LXfiPFtaKdBICnFML/iK+mq
	 +GyW96N8b3SVRBSJmn/0/0LrbN4vq8kVSua6YfX/cn6kRKMO19M2xZiLChZp0YMqBmU4r
	 tEKVV5WmhygjMNAryf26V30pJwyYMpLJGDzs2li0J+JlqqhC+id/KU2Ly3L6wtvH9aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
	b=b0yvCIvonJ/rKC94b/oS0Umyrsz3jXfDrzxI0kr0+ku4NEGETLPz3PaOzarpuZaGZcJm
	 NGZFJSViyf9rqXhydNqrirZjzu6BAyTnbGrqtB6Ka11fQ1fF96v+q7J5WXPEU9HeHhEXf
	 FJL33ALZ0US4W918YsFbDzkVZXh79iHvV3OwnhttCVFO0eBY1doFM534ljNnFWas4hFaJ
	 fyOcPHs/RPqKQcDdM015dHg1Ql/EM3BqOOypUyjxB5Qcxw9pfn2VhlPD0s+fZPmujXjKR
	 CpMvi0M+7w1FiLmn4hjZlRcBiqHCoY6FSIwx5htqUs79ZJxaYdGS7AsvuVtPDgL5bGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EAE606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4cE2595120
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=88afsBd4DBJZJXNBN2MdesvR
	9kKs2U7zYJzInFyRPBI=; b=GYoqK8CNmbpXI/XAZIXWy1BCQTbfYjkSAYGNe0uk
	oyB2cpyJ8jC+F8LetXo2cqGdEUUl/gu0SVDDgcf0dbwCW56zqRRByFBD0MMeN6yd
	DDEsA7dq0oqe43XJt/j7D1iw7gg9xEKqBrXTGqFweEcrCc9stnxkyove9DnNG4hN
	3sRcFNdJv9yzoI3NalvvlNLrqOZQSa3M5EuSmd9f//KgVLBjiyF87+CdHg7sMrnU
	043OBZbhOBG9evZzdsZlsFIC7rAtWgydU/nzVB/zTH0fe9IrA6Of0UkjxIvKmql2
	mGCdQJpAsBnB8+4Nzd93v/RuUQ5CXdmXfRrOMgiE0oV62w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662san8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso7384187eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687944; x=1796292744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=f8q2npDWeyMusPOpBiBYQ2BjTAlMpAEMs0MoHLCd9uJK7UkqQGMsilOi1IHA/DXKmm
         fW1rBnDfiatVDz5lJwZaFgrtDviXx2FFMZ3aRsB5VhFzOOEOyGBLLGDwJ3PF5Q1Bl54z
         ISYAPAYxDo2gR7/FqQ3BnvIM9o01Pd7pPKhw3WSqGuwf5xvY6P/Tqff56p2yAiyQfOPq
         sZMBmF7tSI/JbgmsM+ahE4taVkS7tNyepkYgaODnT+pupD3xNXl9xBvvkeYg9lXPZVUL
         raH0AjLU6Qt11P192i93wtd0bY4eawZfAEhF2sbbFxGrKCfmAV0jvvvKqDF0+zyotB3F
         7ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687944; x=1796292744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=r5cIAs2bRoNV2S5Z7dupWNBS7GTPeHKVV44jb/T7DvNi4DE0DxZ7lHUgVm4U4YQmdI
         aZObvDnzIqaEOSFpv0NLWbLksT0MIn8NUaFhHNaTLQzdRojgSIsF/8WAS+NW1DG+FX9m
         HKtkQRIcoV1R0OCaqfbsb1XU4TXEc2RpMC4rYpUm/pJ94uiPpnAaqCqlYVo8xWljHKWC
         f+821yEBW4IoAKziLcQQkR7A7gGJDN0PvDEfOP0PJjH6FwGxd29+jbQTllf+HSLGvfXt
         TpGH1vynnYAK+LCMsGXu/b8H47Wswfv0DTGl3BHODAihTr4jw6zEMaJL1islUn8ZeHwH
         2ZQw==
X-Forwarded-Encrypted: i=1; AL+hErFiiNUXPtO8ZhorbwJ55hgj1TiN2ejS4RRVmeyzMAD2NZIQDFCp3RbmXH5ISmUsYUxREO6G8Ee8D3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UWoyJrb6rod7seYeSbdDYqtmuI8UV5yrZttbWJE8UBDvUQU+T
	wBvWGNuD0TZPtL4N6Ari4QInMZKbJi4X2bMGRrG5DI8kmWMgfqRhUVFFs6opl+r8oOXyj0P1boT
	/aYPQMnjD2a6NsznxiMQ/90u+TKn2mywzWwfoAjRpnMW2ned9iSoEnOB7O/J1ulk=
X-Gm-Gg: AZFdTZeLDDbbbMuZ/6qWqz0Yr+CzpQj5kSRB/PKNsJ2zGbn3PvqBtBNAa3kqpelMfvL
	1SOfZE/28fTIBCU3LPsQTFboglOnEV/WF/YSE/LgrUXM6E07mnwqpTFzqH9HynvYjlaSLrp5lwb
	QbXJcQSEEO/B9UgNhJC30orSo42m7jREC+PVi9fj5xQJb0Ew2fORzweHiMoViK7AhNg5zbQTnQn
	IDYYCpGCF1g8vSlk1gFcAhpnSLprkhImg5KoNbDPumv9ga+YSv5IbwDqGOc93RbmZIZO75vw0wM
	v3Ty7KFvXySvISLRnVVjOfxWd1QOmSh4A2hqodxQolR0duLmT/MQ9wV3K2C34QsfkOLpaV284nD
	24F2Y4eZX/Opekn9krE9PuXpmjyFnUDdPNnv1mGAgnyz5Mr7V9OstFtrmFEQAm/++3/+PmVZ68c
	S3rYGN0wO3J1aIw4QsFQNOouI=
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331253eec.1.1795687943985;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331226eec.1.1795687943439;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm51643252eec.25.2026.11.26.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Date: Thu, 26 Nov 2026 02:12:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <awgGBW9-cxJRlA_b@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080608 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y33D9nhtfLLIXgUvc_UA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: NwfxPYUbBtijuUZCkBMn9eoj0je1yjl9
X-Proofpoint-ORIG-GUID: NwfxPYUbBtijuUZCkBMn9eoj0je1yjl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfXwguDe7QjQT5m
 /UQehxmzFqXJIfV76FvnDt6CC+rK2IJ82rnq8KT0GJNdkHSnIFe2vMwo4znKeYBQH09YN54XbdN
 QpZseuncAqiWaSXGSgjBYMzfzGDn/amrqy2ilgoK6slURDS07c+RorZ6AE21KfdQiHnR0vXI9C/
 ypZ7qteoodMAs0TyoS7u0mqQmnVOh2OMdwIZBqERJtj7ivXvIP5dblb/2rV7f1g6Zr5vD2Mn8V2
 CdjsgvM34/eokq1bCYeWIpgHN0qAmEW9fqXjGJ8EbSM2MOcWRjwINvDmGo+sYmxZQhlFHh0t7/8
 Cmxgty1pDOUhl16lvMbfPvr/eLLVVW5QHnyzn4QrFgzSVTghPTlhg3FwP+L+h4J3lJ8I23l8Tph
 pBhLwDcyiJs8UDRmMessfzqvxZWdmA8v0t/6Kp1fQYI8O2JMzKADz2dScKN/Dt93GeMfBiUhnfX
 ssiAIdkk2mZ89dRbPRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX6TYFiG7I7Cfl
 asJL7t+N6bgvHBA/LGlLHP7dpw5sXXLFmsVcoOS5pwPJiuN46KG3n3a8e6eMlMeKtIkliqV8WFD
 BfpOVbaxp2HA3RVUD+9k+9ObwRcR8Us=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260039

On 26-11-23 16:17:26, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override once at probe, after the initial role has been
> determined, whenever that role is USB_ROLE_DEVICE. This also covers the
> dr_mode = "peripheral" case, which previously programmed the override on
> its own.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		qcom->current_role = USB_ROLE_HOST;
>  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>  		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>  		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->current_role = USB_ROLE_DEVICE;
>  	}
>  
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>  
>  	qcom->dwc.dev = dev;
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
