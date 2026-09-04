Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC23F4101
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788502196; cv=none; b=jcoxiyKohnu+JaDhzAOPOAEjSa+CC8lyUuwqHpqi0fcCnW1tZb6X/05hpPdNuvJIwpbgQ/9ViRJykNS81XSNStNIUztgZkqGmzzbRoqQ9plukN36leADOrG0sFxNobtQEbAmsd+DpkYL2uccP0Bv7R+BGwc1laKOqI56/TucinA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788502196; c=relaxed/simple;
	bh=6i1H7/7wQUtpbrY5xzX/0W4P8TBzBKtLRiVT/SoT7ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjx1pceVsTRI15n9gzyxfJa+Qh/BwDdvEJnG+cFZmLQO61TdL9U5c3aF8gO10rwi6O/8TE9g8t/SCX4vxoyzcLl78uAOnFmbKzzBN4o/p4Du59SH7Cki7WdF5Lh64I2lJNZXzDClGunRWN1YiQmMD8xLYi1B8ICB6LRqqV0bSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJ0VNFv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a09VwbJS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJ0VNFv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a09VwbJS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462Rcd2750616
	for <linux-usb@vger.kernel.org>; Fri, 4 Sep 2026 06:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=; b=AJ0VNFv1xDVDBSVz
	KoJgiGxblWZQ+uOGSLDeYQVFq2t7yCAGXUj+JrgF7dNtbZDzKoae0nCEEahBXe2w
	500aUGcmg+LO3TM4dk2PXc+4kwAsa7yLQkTIp8o3ezwYQc5/MY6yADr7c0coirIq
	eb/63gLiiFUK47FHiWw5AbJWsdb7X5O3V2gtyXt6eSJIHutneQ7v0ytvPZYfJh3P
	/e96YI1wiXkogsbivyr9UUs7T4yv29wZHooCp4irattsRDS9a/DCyq35ZcniqV4q
	pjeDbA+B5jxlE1R3XeF16anijzr0BYV6aV+APFWInfuJBmNXIQIFU5uj1HKMsgK2
	IhjPlw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxja81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 06:09:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so922736a91.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 23:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788502194; x=1789106994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=;
        b=a09VwbJSpxWqNoGZu/bBtNKK38qIMIMuuQAfofT+fCulQO+EMY1LuUgTrOVn+iw2lX
         ggD+9VgQRMIinkI+IBM4fTHt52Yx1LpDcrO5K2dpg29WYYfIxGJ6726tNljNK0YHEjfs
         NYAbouzTuTZDCgq5dme+klnZMcCSroYR3twAQFjPv0xfCpNJH4gfgxCMuG/aW4IpYR/h
         ib3Ln5LwFSHZsuVAOHzayOUZfkwiW+8AgSiOhAYhlN0gTzF5B+m/kXCmMH+h2YoktjJG
         xWkaeOKlVtR+Z9mWFPbeN+DLSpbPERu5BynBjgo2/VD2jcYB0Ckd9ISmMTwBiY86RhNQ
         3nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788502194; x=1789106994;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toQXcTH0dbYcAFdl5EjWItBSNnEY93ZM4mZFCsTYmHY=;
        b=JZsppg/u+cClAbtmMVq+rQgYVcD9pf+4qVO+l0Tz5CO3J9LL4/AFq/NXJ1VSEWXV2+
         BNW3D6jDsM674mX2ptICtzIS7CBrK+u1GPMOBjbM79ejLTr0/RxN+Ks6OxzFIKGhB4KA
         cc8U4x1y3QT0umCpa6jbeNj/eB1cscKTgbKjn1EUDMP7pXM45LuS+QQhcg7TUgyRFZte
         j/UM5ObRZNcpY88mMfwEL34tuxuPGFAxkI2Fu7BvqjsC8OMpbRCfLZZXvOa9ahNvaf8+
         1jArzpRAAy242xiPOg6KYBw0zcaoRXndRnzddpZECFudq80YXb7X7kIiJHu+Szui+qXz
         tInQ==
X-Forwarded-Encrypted: i=1; AKwUvByCX9+UNA5aBq79Y32XxS4vfPX5J01MLf5ZW+JXOYnzlnTBKXk1HRVO3/UDNk71YhbjHiriNXH9Qv0=@vger.kernel.org
X-Gm-Message-State: AFuF++nwC35/KkxsnhOaUkpSNnzbqc1lWOn0VeIO00bBVJEZaVen7FgA
	gG+EnFjKfs8xCU0FHPrDXjjrzwKPuSLXTBAt3Jn/EUDFSNIR35zbmTdXqpN+IY6zXDq9W9jOkG9
	NsPgUZ/o1CT0cWpJ1kwUZ5HmGoNwaGVyGRDxKZ5UuhhLScKuALw2nZNhUJANE11c=
X-Gm-Gg: AYBFou0VodvC7zy+J/+gLIMB63lN6i3AZfwUrbTRx/5zfi/6gKJHxRgf3vaXO65eA3P
	66jGthkRTQ8E683XNY54wiCgZc5f40uvfHCdhb5XV9p9QyJnhrlWJelPzwjNRACEkQ6CR7Jrepu
	mu7d/31qqQNBK7hIOB1Dfj1QdahsnYV0WzjZXDVqzwSypRFIEPy2cpnGVDKlhLOcvBkQIZT7j1K
	peMNk+mpgTQj0leVoMstUTDTL0YAfN/MUfCS8VzFAzCanb1eo4MxjEPwhi57ouIEMShLLySPep2
	djPGLgCYGUF0VVcJH8hu15EBS/3NL1vbSv1cPKCysfo2U180ippW6QP4ABoCLvgriOjnSKeuvYL
	1P5IlztQeL1ytzvbIAGgypAwvTVsWWrJIxL4ruwMtG/c/0ldhKLvMWF8yCRvytOQkuzFF
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr6332335a91.22.1788502193730;
        Thu, 03 Sep 2026 23:09:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f997 with SMTP id 98e67ed59e1d1-39b262dfaeamr6332268a91.22.1788502193296;
        Thu, 03 Sep 2026 23:09:53 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.244.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c3a526sm8911619a91.10.2026.09.03.23.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 23:09:52 -0700 (PDT)
Message-ID: <fd9f1fac-e4e7-453e-a830-a32e8be2f965@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:39:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for
 power-loss resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260903153827.3463313-6-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UbnYVABbY0yPu5AjUmO1qbZPL2XekykZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA1NSBTYWx0ZWRfX71YN1NKzDOYX
 Yv3GjLf7E4x3NYhkRtfeTiVAoRerqY3SXNrELhvVZznfmPdPoD5f5xpJjg7P9nHgomWMt3qS8Qk
 PShELtlb+DSguu7+hNlqfAY33vreap0=
X-Proofpoint-GUID: UbnYVABbY0yPu5AjUmO1qbZPL2XekykZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA1NSBTYWx0ZWRfX1uBUb6yiE3dY
 Z6s+XhTG9Xq/VeUW2Ye0zDiS3o7CD1x84iFin2YNYrlTarJWKbgP7XPeN5VM/rhA7lmrXc68j0A
 UDNS26bOvGF/SHUdjC2fYHh+6blvsmTtpOBBC4Zdtuy9MoAPm04uC10ADjWuGvXryRjcppamaBQ
 Es3OY+1KixHBncfx3QoGZYtFIa8C0xJ4pQyfrwzfw9VW3TD9QQrpmRvSyI0rP5FlPLFRFvLs94D
 +ReTyHDcw4b/A5EPxlEP65v9BO1MDaip+clmRFfRHI+hamLSr6KKvkjtNYgQHr+DvTMzSfBy1tl
 kCcd5dTcn/sYaSObUo9A0u/KU51/jO3+h1pYgkO2k9Oe0kX2ShNcm4M/A6fzET7KtNjp7AgyuEe
 NFEq6ss9GEwhyWJM6O5/sIk3lBLC+x0lO+V9jsKxui2qLmo8b+XSjTWbtwtCVUrXX7yM4V81DRp
 PL/J9hCS1wRYVh4FKkg==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a60b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=oP200lxkGh9fc4MeAAR85Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UW7aF9AyQ5xqPRIsElAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040055



On 9/3/2026 9:08 PM, Faisal Hassan wrote:
> On platforms where the USB controller loses power during system
> suspend, like SA8255P, resume triggers a Host Controller Error
> requiring full reinitialization.
> 
> The xhci driver supports XHCI_RESET_ON_RESUME to handle this,
> but dwc3 previously lacked platform-specific quirk configuration.
> Add a device property "xhci-reset-on-resume" that enables this
> quirk for controllers needing complete reinitialization after
> power loss during suspend.
> 
> Let dwc3 manage the quirk for the usb controller using
> software properties.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/core.c | 4 ++++
>   drivers/usb/dwc3/core.h | 5 +++++
>   drivers/usb/dwc3/host.c | 5 ++++-
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index fd5c2cd36c59..eb6ffd5148a7 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1712,6 +1712,10 @@ static void dwc3_get_software_properties(struct dwc3 *dwc,
>   					       &gsbuscfg0_reqinfo);
>   		if (!ret)
>   			dwc->gsbuscfg0_reqinfo = gsbuscfg0_reqinfo;
> +
> +		if (!dwc->xhci_reset_on_resume &&
> +		    device_property_read_bool(tmpdev, "xhci-reset-on-resume"))
> +			dwc->xhci_reset_on_resume = true;
>   	}

xHCI plat does look for properties in xhci device node as well as the 
ones above it in the parent chain:

"
	/* Iterate over all parent nodes for finding quirks */
	for (tmpdev = &pdev->dev; tmpdev; tmpdev = tmpdev->parent) {
"

So adding device_add_software_node in dwc3_qcom must be sufficient.

Regards,
Krishna,
