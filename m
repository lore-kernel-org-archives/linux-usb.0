Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308223EA8B
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047777; cv=none; b=lHUIUW6AmGdlXIBao+z/KJlMr8CJuTqyjcjMBMBKQTdihxaU+I8NQeSZzOFYIx1Z6KInNH7WDK8+R5v034viFfzUQWxjgjNca48B11FZ4KAOs9KP8m4JZB3PMa9OOd3egEKYFjxM6fUQvjnEKSr9k/T25mgWwiBs7x/8el4OMmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047777; c=relaxed/simple;
	bh=FCAsqH+2yPXBkPxNZiTIltc5+xJiGT29wxDHDroGmXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGVtu92SsTVN6pghm+y1b2lCgxXO/+FPpaUuh4j1SgnRD3+ZMF1bHW8iRkh3rrnjVNI/+b4FbGmj5NkBmK3plJaKKM/4e4JPIBzyGk2JHeLEbi0LB9qIudvE+bQ2ezvgeyf5976XEDfGU+qAm/zNysVwHSsGXbx5ByOqCZ47yE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ah44Q4sY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WzNdm2Ad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ah44Q4sY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WzNdm2Ad"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BImQ722678
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pviJHTasWouuNyvj3di1PtY92WvpKmSMA/f48Z2Jhd4=; b=Ah44Q4sY+ut0+g7j
	L5IIuCegXFLzcK5ou3twjYl96ERo1dOZCK45srKkBHwuKP7IM39cEVlrFqYZLbyH
	hcmoPnujZhbqp67nUr7qItlFyG1G+IiJFxfPv56TkvLU8Ph614WkzkadAn92OuJ0
	DXAoegVRCxZDFjkl13zQFYbG57YbxSmE5qj7IKas+UuuoddGvrfkKkdwB4DNM97z
	nM5wYPiuP+cN2w3ZCdCh3d98uQNBzw7xQwTdQ2lBSRBQOJ7CGARdn/7OiwRs9Y8K
	LS+jtn6NXcPBgB1lKTCpMOaYACnp2mzVvrjKz1034U9wwylw/pDjIDo03i+swxZY
	4ne8oA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615kuvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 10:09:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930f80ae4f0so28489485a.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047771; x=1787652571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pviJHTasWouuNyvj3di1PtY92WvpKmSMA/f48Z2Jhd4=;
        b=WzNdm2AdarQWGebU/7WFszqHZ7mZjAHzUP4O8E7eDKtiElxlq+3nDO97fKxnDHzXJK
         gHyNDFZW6B5JIZS5/1ahR7DPhavghKw0r1LhOzU9tepLQHrOW0vzhhm1PhwseFWgOzGw
         Jrs5hTCUS0r8HRCENw3JePmJV8BbeN1xRXaxyaQ55I5X1WKCxp4eTxuCzn8xoUNdZOJL
         C2XQ4xT86SZch+BNJ8AslY2tX9EOEhd6Gc/0SjZ/cZhE3jdnVoqfwl4yYCbdbHCErK6U
         iVma4J1rxK28b8IVcF2yAfBGinr6Y8zrX/L6aZkOlQnm7Jswo53OOvOPzaEVqNFWV1kE
         Y4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047771; x=1787652571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pviJHTasWouuNyvj3di1PtY92WvpKmSMA/f48Z2Jhd4=;
        b=XiXnMt7eU0SsHEbQDy8x5OE9EgNrmaM83WMNZcvGV9Ug3COFBrxg7aLIwOmOkh5INq
         gpS5YiRXQPXYmm8gufHtwAU3HkQDIrdXic2B3FP2JWfnAONqOekoPVfv3IyChtsgItUE
         uxmx+Zr3gwnat/LoAMxVYspTYmvWzabKF6L2oKWQ+SAARLoVtoa6rPtMJJ93KwJKefzu
         m6AOTgdYc0Hlq+aoU+Cqrs11hK9H4GsCZ+fq8A1WB0DnLH1xpuwUM4YzSmR5jsX3lmoU
         7zX4PJR9c1VlXfTG7gAL9C7vc5ju9Mxac4jKO14dqOPgZfjrv4ilFuMUTQzrNQosdEv8
         +P7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp3GjbZbGQcWJgkL5QhKC/Pkv2Rc4JOFHSJ+WIvDrIvzkQneV6wZWTnkeuoqEreSfjYK5eQfTuidF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQZhYdXXxUqU2GbEh/WdW8a+aVFH8IwtteqbOsRq9TGfYsVoV
	hQ5KQFz8HBXO2uKBRHoS16Moa8QMLG5lTTIhJudt6AecWJn0DFhA4SFpo8tzSipj55tiIFIIhvJ
	VZ0zDuY8jGoRgbbHCLu+DYcc5dhYMWFdoalRoQYbC2IcRbwNGdVRcSP+tqO42mHA=
X-Gm-Gg: AR+sD10t9gGYHIEdWABOqjlhgHsXG7Bt9o3baQ4VIkv9AlFt4C2ag5dY9cZaeg5rqIg
	1l6Y4gVri4o55NDldyxbSrN/D8JBtZIDQ2a5QOGFkAxxhIN5eYOYRV8O5eHL1TzBzvBsHQX/rT3
	FfG1R1a8Uzl4d0j4gGIpjkYfBiozFS1aFlil88olyF2Kae2Y8JWx1Q8mVNSTmPL38Esx/7e6mn4
	MSJ6kNLmihH+zd/9UQskptBkE+zGIuAixDiyOFqQGIak5/t5Baqj6Xnc9nOj8kAjIlcLBEXuFZt
	dzuywHtfW+MgNPVrQGesx5CDsUlgl7go4ufvoZlBK3X/SfsVUu+ZjdokxiTnslwrGjm8R+2SkpW
	5Iykqg/Cd1NBdchCvYD6wvoNB
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr2194643485a.4.1787047770571;
        Tue, 18 Aug 2026 03:09:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:92e:6071:7cc4 with SMTP id af79cd13be357-936d23a402amr2194640285a.4.1787047770192;
        Tue, 18 Aug 2026 03:09:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85886bcsm1736914a12.16.2026.08.18.03.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:09:28 -0700 (PDT)
Message-ID: <66f8e084-9bc2-412d-b617-70baf0f9f4cd@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:09:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] usb: chipidea: host: calibrate the PHY after
 starting the host
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9-R9aySjuTjMOwr5e7jNZvIKELYi5aPX
X-Proofpoint-ORIG-GUID: 9-R9aySjuTjMOwr5e7jNZvIKELYi5aPX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXxr78fi8oiA+o
 7OFVXhQU4VkWO73vBEFBXEcCJQGTKm0eoIwJX/jBYS8YX+zSMyUjCb9JpuTW+PMlo5cAvGbeeiS
 9MB6zQ9aSu8OidRI42ezQdaY7jGGoEfKXLAZbsa8kbdBD/2EdlrDHIuqI5DaRLppnaTKukrtlWI
 iwMIGhfqsi/PnJDU1TYqgQyLmUF9yMe9vAC2yF41iNMWMt1GUtViWM6VsKzwQXcmFvStJPT/s1X
 jpQkoz1JqIAZNBtlpzCcSkSsY8wxbC2ZCHqfZZhcuWXT1fB/LsqZCLDqQlkUCIxbQhgPN6u3yz+
 6xsdqXa2yTqriEdXoai0eQTRxGvksHTyggbWTxkBB2rb9PxjlR8dA6wIERLfwaN8G+bo7pd9ivB
 ScjwtNphcsJRdLDgs1Iy7ewdz/R3rKSIiV00F1mPc00jvJM5P0RmWjIawoGM2TUCu8XeaNr8wKp
 uOnehEQfx9Td2FREqVw==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a842f5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QSrdRFCPdf6-eOukQi8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX28uLXYEr6i5w
 qNhk1+CnvU13svfCWSHwj4oGo3bG6PoUBFIQVnUYDYiFFlS4ep5Bm4g9jJV60KlWvgwvf/oaarl
 e6Y3/kIDGVv1ujTNIpq0/U7PSbSKxK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> Some PHYs need a final programming step after the host controller is
> up: the Qualcomm HSIC PHY latches the device connect at the moment
> HSIC mode is engaged, so that write must happen with the root port
> already running, or an already-connected HSIC device (the strobe/data
> lines have no hotplug) is never seen. The generic PHY framework
> provides phy_calibrate() for exactly this kind of post-init fixup and
> dwc3 already calls it; the chipidea host does not, leaving no place
> for such PHY work.
> 
> Call phy_calibrate() once the HCD has been added, next to the existing
> i.MX HSIC active-event hook which serves the same purpose. PHYs
> without a calibrate op are unaffected.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

PHY APIs happily eat nullptrs fwiw

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

>  drivers/usb/chipidea/host.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index ced6076a8248..62bb2999edb6 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -15,6 +15,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/string_choices.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/phy/phy.h>
>  
>  #include "../host/ehci.h"
>  
> @@ -192,6 +193,9 @@ static int host_start(struct ci_hdrc *ci)
>  			(ci->platdata->flags & CI_HDRC_IMX_IS_HSIC))
>  			ci->platdata->notify_event
>  				(ci, CI_HDRC_IMX_HSIC_ACTIVE_EVENT);
> +
> +		if (ci->phy)
> +			phy_calibrate(ci->phy);
>  	}
>  
>  	return ret;
> 
