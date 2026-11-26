Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682299;
	b=fkig/3pHzv+J+x0u8LmnRe3Eh0p7zgi/jpTGdWG5Pvkt887UANuzPMdJW5Cx6iRH4ZIy
	 E1yV8noFdZU5mkci8UJ6c0dar043ymhTmJh/OTajkph3eBCH+rQ6rpjWe9eN43g5Nu2no
	 0txArzcWSkzdNxb/JMKEY0Y5+VX6LeH+wSuTHIUpeqnLPABqqVjTU3kjJbeFysajbX9DI
	 CMZaNuuNvRtWeeZDq86ekisCG8x5QVaYnU3qqzPlDwd5hlLMHc8hix3ZYHDcLDxwQaliS
	 CvmU12WKYqqoysv7r5oX9pBYV71tCLtTxeQAGE1P4flcx7gMkyv0EAkEU726Etbjjqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682299;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8UnhI6Hg0IsQmptuwYNB77Nl9LyJk/JxYHrTwbm3Gg4=;
	b=EQxHfMbSKGzawyngxw38TaNhBuOfyQmJ+oE6uGhCxCtP9jbFt1D6+8bIaUgTlZPB0xeq
	 +7/HmU4oEOkgQBH7ZQSO+dOAkhoKF4ftSP4djdHsTd73kcsIZZPAlLLQbSVPlVezJyw9L
	 YWMqiEAb5IGpsyve7Munwr1BxsQpSaT/ypF67M7BMPqB5fOcCcL+NxqdZhMjds+LiwJrk
	 4gC2gN3C7MDLts+oSlQHeC/4nI366cjZq3IKWoOwVMkZpxzRx+Sgr76NyeLKRRSSlUbLZ
	 WqyWFZa/IxQQFfNKPTbomAXMYl+P1HHWko3TAD3psBNskCm+Uql5F31aa2C+QKzRKEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6QzYZNf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B4dnxhLp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D6A606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6QzYZNf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B4dnxhLp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B55U3548359
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8UnhI6Hg0IsQmptuwYNB77Nl9LyJk/JxYHrTwbm3Gg4=; b=A6QzYZNfSML0Veq1
	Z36dFY1uF9Z5PwwBSDf58xfKsHLLrUHgmnrjBr5GhOBq4lqJCrLn/IytDR3Q25KG
	S6U42TO1ERvx/aGnmZLY1RoMRJY0n4/DDS8Y1VmkBlTffNh4k1kjGMANdUr40mZB
	WmntcK9FQ/TylJ9fIrMxXEs5kxQJjfMTlONBSoXvWfZOZFvO0S+l4lWwWgmAHBAO
	jV1gur9szl9H7/6EjRswvTXk2M7c0eMebZndn630MO2CxgSdanXETYe2Ki+UrXyu
	rTZR8BUzqm1QPOyF9GTM/FPpXaCtiOjUoFjz9dGEWd+9XjZCwxorNV1pQeOz1ogw
	PkOKQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau2df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:38:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so13997581cf.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 00:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682297; x=1796287097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UnhI6Hg0IsQmptuwYNB77Nl9LyJk/JxYHrTwbm3Gg4=;
        b=B4dnxhLpDkTopXQIm3XqAvKpxYT03WF2kvyR66UkdgqlCT7unbZisPM3vQImreHQRe
         Mp+gzeXtXyulpupZnymioBXYVd6BAV5GL4lGJigH8CekHZjfBRGo97EHZzZ6jDQ9bKQn
         I6fziK4eCCuDjJvdIFqGCh5q/n7dFNFRXsrAq/Vsbz9Duas/x3w+z6Kbkhpw/K+9w8EC
         MBBw0L3CD5OZEKWWgLBesMSzaCiZsQHpPYhuNDpNJRQFejKTC4I3L/F0XAXaU5dfKmz0
         7QJtQiYYXnM3kvy3lBzDapQeXl/6VtE9ehRcduWzxARppJdnvSfDrGvi3ArbIF6iFRR6
         x2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682297; x=1796287097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UnhI6Hg0IsQmptuwYNB77Nl9LyJk/JxYHrTwbm3Gg4=;
        b=rMZ24HwwZD7+QkbCeyTBR00qqyjUwaB9DRT8wtHW0Hoo/EianF5LN20PPjIydkiT8X
         4yayYFNx1uSbOD0Yfm2o58L045C5VLfM93UYAyKwprXx6U8RYnnfX5pMf2gURmle0+FO
         aWEEEAvaaaTnciHD1zd4+eJyrXVLK+DeNAs6Nokw7CA9e5tzZ6BWj8gJdBfaMPU3Yuex
         SwBg8x2Lvdyz09adFxdU6yiA8B5B28RvfII+V05mYqzHnGhieOY66YrBN27lsYqPmjFW
         FN0vjQgoKBUCwzC/EEemrr5W+3lLc6OW8F03qNpS9wtQgWC9k41upoKYJ+V7F9GysRBA
         XjQQ==
X-Gm-Message-State: APuU4Z+xM5VQHzcE5PmggQGShX7KKbVs52ykundgEIohES6l3noQA9T2
	xJGXoWxpnQFHsi4qMrGvi72EC8e3WJrPXByS848quXap3rDaTac7fEpuzUCWeJ+PXhevEhOqQbk
	z10bRtzocvd5Gyqsgn8L/Ycq9h3ASYl+br2xd6Zg/sjXCIgAmTKX03Kvi7fQbwV8=
X-Gm-Gg: AZFdTZcvYUCEP0S25qAHT2bJgnV4fSdwEIRY1u47EP+JPZkw446tIRzj8Q6juxycPYK
	4hMPYf0620un4LtRCnN0Nr5ozZ3Phlw8uBlEwACzxfPQ6V2GQzUmorU9A7X+q7MvnP3L9GFcs1u
	kTO8WZvwiVWOdeRIJeziXy4RG55AMsZI57BalbG8O4LobguOQVXEqv4HYF8CfKoyesk+X0f/geO
	eYu0Il7YkHVFk55oTuMvpURBAOZKRcz92tZVmNMQ143mz/eJYYIVq9x1nz7JgDf9iGa9u1DafL7
	Dr83TltLzqhPY/6BVmyKsJCR+Rmmx1WR5u+hTegJiF601r68tEbXwpwWQXHMoIFnVfFQKpbztk0
	fmnGfSkkSbBxkxtJBIlQYZRqSDhuYURxHBE5q9QjUs9utX7egWCGRUTQVV3XgtJPhFKbcB2E=
X-Received: by 2002:a05:622a:22ca:20b0:55d:3123:cc62 with SMTP id d75a77b69052e-55d768889bdmr337894011cf.1.1795682297511;
        Thu, 26 Nov 2026 00:38:17 -0800 (PST)
X-Received: by 2002:a05:622a:22ca:20b0:55d:3123:cc62 with SMTP id d75a77b69052e-55d768889bdmr337893881cf.1.1795682297055;
        Thu, 26 Nov 2026 00:38:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51beef91efsm90747166b.14.2026.11.26.00.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:38:16 -0800 (PST)
Message-ID: <eafaa164-50d5-4d64-80d2-468dcff3d184@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:38:14 +0100
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
Subject: Re: [PATCH] usb: dwc3: gadget: destroy connect_mutex after
 usb_del_gadget
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, usb4-upstream@oss.qualcomm.com
References: <20261123-topic-dwc3_gadget_fix-v1-1-dec7679b81b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-topic-dwc3_gadget_fix-v1-1-dec7679b81b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX0bA0CsLOu7Jm
 j0RmMdL6a1U823Ca/H1hVXVc0A4ko51ctLoGwrCj6NVAzPeaejLhrGh1sbXTtDnQWxvCWcdjFBx
 WlzXI2gMuiOQLYoXSSybo8cKt/rLwVo=
X-Proofpoint-ORIG-GUID: HT6nSfY4mF8uSHgxrjxaNN_JDh9T7_P7
X-Proofpoint-GUID: HT6nSfY4mF8uSHgxrjxaNN_JDh9T7_P7
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07effa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=U-xFEZZi9E6mVrKhWgYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX8QiP2kJL3nYh
 /I7pEM0zT5VgJkwXL/J2ev5EBLT6dpHKV0drok5caWT13mjGTnExYTZs4SGywySAQYeh5L90nwg
 aLX3uSwxJTeOz34NWfUvyqHhuyo3xKIYEb9j6CWfTEoXVoGRdzLT6Eginb/5oHWOnDdiLdB6cew
 FBVqjmQ0RAoz1gBsOKQGuj4o6jY98z//vsRCVcgyu2nuuu1IyfeesGMhn319mAnpKOREiLALY8/
 Xj+bhORqswvkwTBbdW4eu5BMJ/84t+knx/9MZM6RBaMf//KmHqj/nu/8t9PTZ18CexWqpe9OVwX
 C/1CFc3DP9q2nUOj1ZwYzMsx77A+TqOL3DQE0AkeaAcPqUmmS/u0ZD6T2WLVpOjwBhKctBsd5AU
 jGDLaYVR96+BxkJ1E0BCO1nC4tvDCEKw4yM1eraaZ8YQH9NzgNOoikMpmqKLvZo5u59HDY3eFQ/
 JrhYzWcoViKtrrMScgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033

On 11/23/26 9:13 PM, Konrad Dybcio wrote:
> usb_del_gadget() unbinds the function driver, which may still call
> dwc3_gadget_pullup() and take connect_mutex. Destroying the mutex
> before that point leaves a live lock behind during teardown.
> 
> Avoid it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a76f669a796c2e0eb955969a88523affcb672ae2..673f4bffb8ca85778d084820ecfed49f50d1cac3 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -5027,9 +5027,9 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
>  		return;
>  
>  	cancel_work_sync(&dwc->err_recovery_work);
> -	mutex_destroy(&dwc->connect_mutex);
>  	dwc3_enable_susphy(dwc, true);
>  	usb_del_gadget(dwc->gadget);
> +	mutex_destroy(&dwc->connect_mutex);
>  	dwc3_gadget_free_endpoints(dwc);
>  	usb_put_gadget(dwc->gadget);
>  	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,

Looks like Marek's patch (in next now) fixed the same issue,
ignore this one

https://lore.kernel.org/linux-usb/73cbf05a-e25d-46de-b956-504086660570@samsung.com/

Konrad
