Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779420;
	b=NdHrqA5jcIejtdQQOjHN9h7l3v79e4ANa8MaMpNmxFtFWn0dv2SgA8/aN1mXgeVBTC+l
	 XQGSnaNbivrp7NQwNjBpUMNdZ4k7ZOL4kdalh0BvcMp5BY1ZeJIsqIbRHnZrIqe4a94Ns
	 aiiIZQLOHcIBius6u5NIyn0SU6Kr9lHFBHuQOzgnUysznMHDfkh5r4qgeo/ZJsGXp8Bna
	 fvAXpfDQQAxtQzFvE/cB55uTsbGmE7yXI6mFsUkxifr3gOv021hcbkOQvAA9c8HH8vhpt
	 BpnYbsrNHxDUdeHj6B/5ud5xNnoNxoccZj0dWxeEngNnrFAMBuKMYJRqiVRNGrjFj3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Ai60qcFMqjPux2cwI6i7/nNHXAnmCyXmowZbY6dkcc=;
	b=uDrD3wek+YZ2UFT8N0G2GUzirD+gU5IvFV81vQZCJFCycymAwdwy0Rmyu9vvh2o4VpDH
	 2Meo/axpncUUDa7glqGLMvf+tgbvorijNSdKmqyAq0Nw1XfFWElyd2nWy+o7lkhwaRpi2
	 8vXMvyo9v5Ill7puEHPcIBXlD/hLT7+ihUXy0jGQ3NExTXp/ddd9u2dtYXjAsJB52ZFw0
	 Hc6sqDYVpzKT/16o/gUthyDm/gnjLSR4ISzyAX9VyoGGdNqlhkxUJMmTOq/FAEa3J7xoz
	 l7lPH85Jv1lihgUqCqAXBOB3v/CwOQ44F0Tf1s519aDxGtncXZooUoZhggHSe6d2M4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LvMyveaE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tw9egtQU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8CA606A333
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC8CA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LvMyveaE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tw9egtQU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4701h1838284
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 08:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Ai60qcFMqjPux2cwI6i7/nN
	HXAnmCyXmowZbY6dkcc=; b=LvMyveaEsHHfNVsHgWb373NO2fBtK+rbkCM3DUTd
	WhkXWwdNThdyOwJJls177o8TjnH42jVqBBWUKT4FqkGnFAZtm0nLLkPtgf22hLfR
	HvvKBYNEoIBlmrNuygNr/dHyGkDP9BqLBmdCibcny2HvpH9B6N2MvXjdpC8Q/ZP3
	3ath5Iu+tfPS3NKh+E4jrHp5T3a6656wVj3cddrbvm2Ngh8hjC7ClFbBXVEYuu70
	MaaPjRlNcMP0OZmhohnyx3wnb0DW/Oa50swEFo9Mdi61m4s6zDTTk82dnRHt5dPf
	KRtVRPG3XllsMHEu7KEGZKsZtJ7rVJ7gLxdZVnOuySA7dg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mtrvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 08:03:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d2a94abf7so148824eec.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 00:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779417; x=1794384217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Ai60qcFMqjPux2cwI6i7/nNHXAnmCyXmowZbY6dkcc=;
        b=Tw9egtQUiDwjq1UItrlW5tj4EAzhfFXZczLU3M6sO9lYlXJYvaH9UciBwkl2Ww2qzp
         qLC9sXa2DPjMCoyxaRGgI6UoaD1XN6tCIfnbsGsA9XbqHAlQ9Fb4Od2Ja7T2+4RvfuTt
         ehriA2w3hVYCJAyB+w26oAZZraB28oPaeTbCHxKi0RM5MK+CGXH1HWR2fgu7OFZyEy06
         942po7Ei7I+Ylprg6/fHB+BXZcRqC1a9gIXeeEkPYM7ScUc0cG/0QiUBLKrCDvHrGNtG
         TuCB9oBq8PvOBkCXn3hEnPsFMMVDCC2JvH2heWD6JqwAhcSskvji2o53pTh+yp9kTpzq
         JdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779417; x=1794384217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ai60qcFMqjPux2cwI6i7/nNHXAnmCyXmowZbY6dkcc=;
        b=iKgp0WM4nNynxICQtutiGYzkT/eGbjsgFx47QC6UPOvZjJEVe2CdRhSPRhBGgxacO3
         b7YUn508nuTzfGdP7StMwTe8slfAxI3/LmACa675QVdPKQYDMeB9plvEZlJ93Nhlbn1w
         qU7prYruJN4Pp0aG6BTvzt0lqT4int2HVF1NdiN/H3VYRMYMZ6LgJ8SFbANUA39/2qdC
         EbzS5VlCkCwkVX3H0j+LWRdZOj8NwP4yYeyIKay8oHdAswFYZPQBjiqfFwRXjIFontIE
         3bz89C67kOEOLtZEH4xVcUsyPyKMU9GxgrEmzXElq46B/9QhFzQK3DX4KCctAyfMDLKX
         hwmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4kRL+uFbdRu2nzXMItiFT+lov+2fpmPvPPc1YUuj9xyqKRun2iQ1XurlP4nR+vrWRpjNvdGNa8tU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LmAZ54RQjEJeSwW2Ku1ssGkvY9QcZSFiSUcLw739TWQypcshh
	NIzztvZPCWTMkfmRywY1/E49ORat0sKXTyPKmJo14DsPAI3CqrDo5pABHgzNaZNBmG/v92Dtnpu
	WCISznhi53Q4/x88aoPxfMtm7cDaToE0vcTKXNbHrux8iyK5euhmVFpw+RxOSrVo=
X-Gm-Gg: AYBFou3x5ncM1pDI2+xiJFt10QU36HoRn3E/BTtCMpOhkD13zucYSgVZFsBrpSxGF2n
	tCPHRL9McfWC4UN4SmD+pR75Qgh328j6snivo+JHB6Mu84PQqtCy9lb+0ndBO78J57rI8NQ2Swy
	JxWdoQfLCPNtGlRAlMmwFdz6e9fPJQj5205oK3R0UkIot67or3PSChstiq1ymamZmD2vQebfk+M
	FQzPBMinq3LkMOoqXVxy93xlgmN8FA6yYuj5fZiho9olTCwvpHDcfWxsNuIP1AMM3q/IfglvjcW
	THBDhVH19QcKwb4YEhKatDcw3mLVEYj45Gs/UEnq2yuxaEJEvTy6EtCukJDqeDXmzZOvbhHcCyd
	914NbFcN7wM09y6sS+SuVxFewS6UTtEZ77S2ULEAEM8m6olC6O22HHARrKSCvkPC3oYydNUC6ru
	FjumSDuTiMFUyzJPjSPYAU
X-Received: by 2002:a05:7022:5f02:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1abe9b88aaamr21487207c88.5.1793779417450;
        Wed, 04 Nov 2026 00:03:37 -0800 (PST)
X-Received: by 2002:a05:7022:5f02:b0:1ab:e9b8:8a28 with SMTP id a92af1059eb24-1abe9b88aaamr21487182c88.5.1793779416867;
        Wed, 04 Nov 2026 00:03:36 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6198243c88.22.2026.11.04.00.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:03:36 -0800 (PST)
Date: Wed, 4 Nov 2026 00:03:34 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdnsp: drop runtime PM reference on gadget init
 failure
Message-ID: <aurm1tM212A8jOSk@hu-petche-lv.qualcomm.com>
References: <20261104021503.1468519-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021503.1468519-1-vulab@iscas.ac.cn>
X-Proofpoint-GUID: NL2wBV_L82gzrIcojoVDxAMnb0_I9CT_
X-Proofpoint-ORIG-GUID: NL2wBV_L82gzrIcojoVDxAMnb0_I9CT_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXyG5XFtgJJnTl
 f8VNVcHugyLGfTF0s8dg2r9sLNFDSN4CBAC2Wj+MAauwiQiV4Qjf9jRs+OeX+VmfuhnvbVvFDCm
 wc7KWn8gCr0aR93NdBaFu027SAmaUWyAebML9GWtI9GO/lobMfuZWI1FTg3pwz5QtzppcHonzW0
 0yc++fxbVdVv3/aZ6UoMHN1X8yU2OjqMHZN75+LMbJgKxpslfVkPVgFWmo16jdZYurwSfhyrnW0
 hHGuazGN4+HyJ0UyEZnpTN2W35LdeBgRDqNg2N7HwfLGcEaEVA3zpxHaUC4rvT5AfLW6u46B8ie
 5Pf1DsEOA/zq+Ulr4sPWzv5hyseKR7cgxulS9XJ5tb44CkC9gmyHzVsHVB8A/30Zk+EDumfQyrh
 7FXvw/dJQPPEf0dDetuIEx2XzYnhDLteWI9mfhF8FMJFp2grezRZVM4TK/9DaGwglieXLVL40A3
 LpfQtx9hwWcn0qi+APA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX9NS9Ysdi/oW1
 udOyHTKrEa018rs5k8GQXlJIcay3JgbU4ax0i44X93Td59YKlCsTcV05+5WE6Q1CWVoAX6sV9I9
 tcF9M+OM0IHnOrQhRJvNRWFhhEH9cR4=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeae6da cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=XiXqwvOuJS2uOREp7OwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On 26-11-04 02:15:03, Wentao Liang wrote:
> __cdnsp_gadget_init() takes a runtime PM reference with
> pm_runtime_get_sync().  On success the reference is dropped by
> cdnsp_gadget_exit(), which the role core only calls once the role state
> has been set to active.  The failure paths return before that, so the
> reference is leaked.
> 
> Drop the reference on the common error path.
> 
> Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/cdnsp-gadget.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/cdns3/cdnsp-gadget.c b/drivers/usb/cdns3/cdnsp-gadget.c
> index e84405352caa..d3df4bc4a17b 100644
> --- a/drivers/usb/cdns3/cdnsp-gadget.c
> +++ b/drivers/usb/cdns3/cdnsp-gadget.c
> @@ -2083,6 +2083,7 @@ static int __cdnsp_gadget_init(struct cdns *cdns)
>  free_setup:
>  	kfree(pdev->setup_buf);
>  free_pdev:
> +	pm_runtime_put_autosuspend(cdns->dev);
>  	kfree(pdev);
>  
>  	return ret;
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen
