Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800664;
	b=vus4uzwRT2JmkBA4Gf8O7nu3FKKb1gf2Xrz6u/7Vj+6EVzkR/cqohFpu/PtjFG9v/ArY
	 3rw1D3R4VJxibJJAOS/tSpVqtYkOAWWHcJFw5zzHDYt6u6Jo+byRLjAkvyHTAxXpeyw+V
	 /gJGv+0VEQM1PvUFvDTht8Gjr8+Q0S0cATUpqK24ugQffmDh54P/EFBTIwJD1NXWpyVH0
	 1wlHSO+pNtkWLJFlwhllFBU2rfLYmZaRi1VVMLTHcYS6gJYTPwy9/JGM7pWVY5rozvh6b
	 0pe3PCG0P/wrCOfVRJapEb+hlPHz4W1Nca6pKg0XdP5B40IA64IVMJCWDG09Y/r7RWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
	b=KqhALkK6ThYDrtV8j6RDY+nKww29fu61+I2gV0aFQ6WTeHp7TQO6vzYhsU+mB2THzONg
	 DE8UasxAAnSO80dq+cHk4OQzT/W6Zz8W8NJcnzxa2U0vVD6XCuRkY3Oxm4g+syzQ/CSzA
	 YIhQ32DauzzmM8xutplsqKpOLDt/9hgtNO5D7pZoz1d3pZeK2qZLyRC4N60UvYTlcVWEC
	 9jZqHwqSvekO9LFDQC8GzpNhwn14bpt8Do1jJMdMy4fWRX9wuffzmtyxezzW+rBjbh1w5
	 VCIPyfG6RGUpeiHqbKZw24K6lDzI/+oLD5bu66zPyLlHX7MywK0awyaDm5qh/CfWveA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqgyJjOI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKmhtW9w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E62606A338
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E62606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqgyJjOI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKmhtW9w
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba2Qa1150070
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 13:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=; b=OqgyJjOIOi6iq+fd
	6/3OBwbnpSFHEDMFcK7Im0ACldgSNml8YIy0PJwjZAU1hj2G5fzGu+hHMp8056s7
	Olncqm0L78ev3PsNmS0/XHdwu61jdjOZEfqcqK4/0x6Y+D/hvNGkv30UNI/jO5y4
	8A7QyyMBeSaMmEs2VHEnZQo1rRVCZ6ZepqX8m9SCIEmSfeDBz9UA1ipEZo1x3dG9
	UHkaeWa7OpfFDAWhjEFmCsDrvthSADRAjhDR66qfTf5bH9LgzFQ+qZMryQEH7oPj
	yAH3gkR4bN1RZKuYPffLbDXg9h5kHvAIGCJd8fmRPWy7yukYEcps+E33R/cXv87T
	65Zlew==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y425p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 13:57:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso2665589eec.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793800663; x=1794405463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
        b=iKmhtW9wZmHN45O287/KnhiDYIBjv8PNNqn6CK7AKAkJkNN+ycBQZzKEfjz1UC3Vqb
         /2P4ovSauS6AfbvyuwFtEoMhZG25InJ9gQVqe+eZTgO6xlbMmt+YpnbSi6Dc9HjdEBoJ
         OMGrZhP//IJZgbNVsMkfSV4TpZro1rwwF8YflXeeVD2hv5sbWX9NtaQdTlpFNmzkQ9Wv
         VfAsFO2ldbULk7fOJujKPCbwMnhra+YuKLUYHOQlOy8k/bQmX3Eg41UYaztGA28SwVRL
         T/F7OC+0WH5jQxVd1JJ06BmQ/mN4wtb5EXQndPtQf4a1X9luGr9SRDhY/qaWEopHQoKS
         HUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800663; x=1794405463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
        b=XO4GS+kaUKJwnnMlzPj5UoesmCNAquhkM1RoZcSDG+R99UnI8MJbJq832tjnTw317M
         bdIaizEB0yE5FHKW+2oE4UOeNSq51J9OL6lc+WJLktv815xPxSqQXAmphCuNSVXLHvG8
         OjJLNocQwoQOncf4dQ9TR8MDPY1uvow5JmmEjMKu5VZ2bxdHXqaQCQ3m65RzBXhZDtgz
         cEEa8pWt/qEZTArAWJDCpVD6EbFhS3wVb+j1fPjeVWtz3EaG9n8tD6G5bI4YqHhyVadx
         VxNcwPV58Z3527fxnWz12/EYxn4xnYJW9AWUnoKd843ilVWN7ljs9tlUY7YHfiDbUksv
         Cizg==
X-Forwarded-Encrypted: i=1; AKwUvBxtuXOEA6HNmcbkxXnku+AJzsUykJdm65bolk7mjEWAFHaKKZ8rpYy3VgQmuMMdaVZh+jDf1S889PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fzHsvHL5hRVQcaeJXvtiN1Da6FPVc1en2aj+i0ZoMZT3dFxND
	cxUC6iTcsO30tJqBthXuaY5o0tA1SNQ+Kv6uNy9pOu6niuflMSyKvz1qPBtyNLmtd6jKuc8U0qv
	1FfBc87FmFL9rD0sZYFQ5xaJaWV2SL3m8Om7vMqz9RGIitOvK58d9iUvAcdkY75CF4M12FYM=
X-Gm-Gg: AYBFou09uRgTLu6JB9KqXlOeM623+0ThyWb1qUz+tr7HLO5IaaHQpyQdSK5YeDMgBDb
	20SRXzD1gtxhfWXyqkWvgs9O9pA+EqMRtAdjqUGsBhY4gIORIy0teCd7QxfKU/2iY2KW5P8tAE/
	6UFE8MFSMEJQI3FBi1rv0AW3TjYeuOkW79PS8uX+hKn/Kbu+jRIFMORKLycPl+d9T08DbAUcyCe
	eIlTTjN6w9GTuMnbwRb0++bGn5KbK4rbMnDz04M++ItH4I9d8YfrNOYP1lsjUxcLs9537wuie8e
	oRf3o8rJhM+b2VfwyQP82WtBoq056lLRknoJc5PP9MTNjlvUv65SXcZBMW69t6/ado3R0kYaWhi
	NCFTutGGTtOl6Y4pu+SS4+806nwnIOXyCLaCV4Ek5dXMJ0kwpjuDMrYFDtrtNC6nvblAbe0jR3J
	0Mb9cSmlKEvidWlKbY5G4y7CKR2cYR8h9Xkm80Zag=
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr24419807c88.11.1793800662384;
        Wed, 04 Nov 2026 05:57:42 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr24419767c88.11.1793800661636;
        Wed, 04 Nov 2026 05:57:41 -0800 (PST)
Received: from [192.168.1.2] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm7874697c88.3.2026.11.04.05.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:57:41 -0800 (PST)
Message-ID: <59c79112-0079-42b0-b6c2-d311f20e0dd2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:27:32 +0530
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
Subject: Re: [RFC PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
 <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WCgYulvQlokJZ5uf9MEFJrsDkykyXo5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7U13ThQwIKjv
 FrVSG56Tu3UbAzFcEa01a4gYjPNzIW9fO5XsxoqxWZ68cD4gjZ2FvSXc/OyVaUk25GiYXEg3/5g
 rIgJle6PHJpL8tt+T6j3JzAmuewOPQJZj4G0F8N7vhsxbtD3M3jgXIXcbnuczVCEm2issEJ3tLr
 eTA0g1ic5dEwqq9OtM7VtsElQXgDo8FSpveuJQ7C6rcGWT4fOJW9YDV7QAcHKuMzebump41tE/e
 GR2INgPqoQCyFKK8CKiW/FwbXuCKbMUsRWzrbZWV5UGpKIsYvrO6J2iw1p0yg4tw/SVD/5I0l54
 OttEuxCqpTgm9a55t4mpKHzv1rQ05WaiS88uZpVXvLfzbcmOh9vZdn346rOL242+0B0wUSq8BdE
 8VTqlMFAzpHaEtjLc/tnjIhKsEaEs9ZyRVKApIS3UjABg8Yip/HtEWbBEtgRg0H0bNys6gS7AUV
 pJxBHaPizyOwgoTPuNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX1Dt6ium/5+M0
 6bZ5UjHAP+ogDKqyscYs7MgfDslGEc0f3PrdULc3zqTRiK80riC1BzWivCdda2rmbel8RkxgqOO
 stbi1EQpYGloRqFmGdHrx8NA/cAu7QI=
X-Proofpoint-ORIG-GUID: WCgYulvQlokJZ5uf9MEFJrsDkykyXo5W
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeb39d7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=X1iYf39TFmsXOEfCDxQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055



On 11/3/2026 11:44 AM, Peter Chen wrote:
> The "wakeup-source" property, as described in
> Documentation/devicetree/bindings/power/wakeup-source.txt, only says
> that a device is capable of waking up the system. Whether wakeup is
> actually enabled is a policy decision, and drivers use
> device_may_wakeup() to decide whether to arm the hardware wakeup logic.
> 
> Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
> property is present, so USB wakeup is enabled by default and users who
> do not want USB activity (e.g. connect/disconnect) to wake up the system
> may have to disable it through power/wakeup, otherwise, unexpected wakeup
> may happen.
> 
> Having wakeup enabled by default also costs power. In host mode,
> when device_may_wakeup() is true, system suspend keeps the controller
> and PHYs powered (dwc3_core_exit() is skipped and the genpd is not
> powered off) so that the wakeup interrupts can fire, even on systems
> where USB is never used as a wakeup source and could be fully powered
> off.
> 
> For USB controllers, keep the wakeup option default off and only mark
> the device as wakeup capable, so that the user decides which USB port
> is used as a system wakeup source. Users who need it can enable it with:
> 
>    echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup
> 
> While at it, drop the local wakeup_source variable and use
> device_property_read_bool() like the other property reads in probe.
> 

++cros-qcom-dts-watchers since this is used in chromium userspace and 
modifications might be needed there as well.

Regards,
Krishna,

> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8116dc94c181..1451b5eaccce 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -653,7 +653,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	struct resource		*r;
>   	int			ret;
>   	bool			ignore_pipe_clk;
> -	bool			wakeup_source;
>   
>   	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>   	if (!qcom)
> @@ -757,8 +756,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto remove_core;
>   
> -	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
> -	device_init_wakeup(&pdev->dev, wakeup_source);
> +	if (device_property_read_bool(dev, "wakeup-source"))
> +		device_set_wakeup_capable(dev, true);
>   
>   	qcom->is_suspended = false;
>   

