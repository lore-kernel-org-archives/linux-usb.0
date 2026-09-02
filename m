Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B8374A05
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337474; cv=none; b=Adk5QG6Uu+cqCqB3ElV2p7ExoDAykTnw3vYSVvmmZrqqss+xU1vor7zq+ux5k0NwmwH897tD+u8FLy13NL2SvEebf43IyveRIDThXRY0qfYf01sbz1c5VUCIXKwp348WxBl6OstJhFME67B98mF7POrTh+akWJmXNCAq0Fuiq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337474; c=relaxed/simple;
	bh=USw1vEHEnGZ577Me1GPxccUL9xDu+6I1Z7yk0147Z8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gp75CoohehfmGGjJ5B+D03MnX8aO29ku0SPxL9Z27L0cQObcfprQixGULNJhK5WnLilF0nz4twZ1fBviiolCLozvQXzXTOmK+YFEWd9QD+OWKwGVbmQf0Tw6tG6Fikm0XLyrWPT9adaTNNvjnEgMVgwgyHlLbDnXOz4ORe06+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=binH7OZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLjs2LGa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="binH7OZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLjs2LGa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WC32588392
	for <linux-usb@vger.kernel.org>; Wed, 2 Sep 2026 08:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=; b=binH7OZjSuchccFh
	TQeSgoaZ082lvCimYr2/uz0AL8xWGNhoCbRPgif+gh0Rtd1sdPUtuNm3V6c111Ol
	lMsSr83w7FYMfRdu8S1mqr5v3t9quTnr9M9RX4CeXCtRejok91MeSO+qd+6ri+52
	/g/3DvinbHoWNBjr9gyeCRP4quke3x2ov3AhLqgzH4Q+QgBuaOePo1PLwoiZt6m6
	zYbUa88jESItg1CX27yfBdqakJEqRwdiFCgv3RGJTn7YPB1yg07ETa9YmOejKVgJ
	CsFQFXOqWLu3nYGnTSRq5b9nYJkqCZqnpXNcYbCo7TmPIhVZjilWTROZtO31hPQQ
	biPmKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435tnyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 08:24:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso21530585a.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337471; x=1788942271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=ZLjs2LGapL2m0EWHymMXmVl7grS5qQyIrmJVsQkEj6AF+ly3QMrwL4lJ89KqowwOdk
         h27PYtNwpwHxM/mhsDDEc13LFmPmprObAS91vL94vEczyiQ6fzvxKvqUjeCbFPmiJo3b
         MOlwvhsy68POCed1w+CnbdMEj/aiULhzqASz+/wTdQWymDEBrggAqoSkDOz6kLc4S6dO
         bGd30QiFPuqKlSoPuFGWmiD/xSXQ0zPRT5/ESouFNuIaqzzG9t8WLwq4M401EQreOrIw
         QDXeYFR33jGpIXwCTaLDpddEHCLzeNsK5PuyqTJ2A8S2S1hJobElD9QYmeLrdEUcR7DP
         LBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337471; x=1788942271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=BnB2sfNbxhRY1Yqu+bnBFULoeB8aqOzIAoQoVNcUg4ExijUH+gBGeHSE9UzbTUAKVV
         2CpnmXr7tIZ9pgv5YyJHJspNw15/ZOePzKsrFmy2JyMtIdrfVe8xX1aX6RTpIAEgHILF
         LiUIEeT/4exx19T0QadS8qQz2cPKLr5UTdPpyW0fnPl3XXgtDQaYINV7HZ5uy1tL+FAx
         U8cH3xJ6E7v06NeAY8THnF/aySW9HP4LhTLeco7dWVvZDlGHD1aG8ofvf6+uohE4Ft2W
         9jtvRv6AqWrLGRNo8f4RJfTCbuivVWq3eyOPm/xyjhCvelJeYJ0G/cPXwqpAs/QZJx11
         avzw==
X-Gm-Message-State: AFuF++m0pMR+BDO/nremPmLRcbv53UAknPzrcACKk7XVlyhCSXz8bvNU
	VuOFCQaW+rSG/zgn/3l/U5KQ1QlHkW+3wyXYfeGClH1Sjhi7PrEgoPejP6m0Xq4iie7Qpzh1GoI
	G3LueIYoHsgHuTN3Nkm1C7jSXBZbTMFnHrYbzfr82Y2NWgq/CudZR5nYAB1l4X6o=
X-Gm-Gg: AYBFou30uc4DP+u2HRaUpy5WYkNT96c5+5O//f4edpKeVyuzaLhQkSxGLzOI2E7XXyi
	bb42ZT9SzFXgj6lzq2Yx6ZStQjHWUbXzG1hP+hA+1NyqSVJlwcYMm7y2zeNkx+x8bO8i7ZAQMDF
	Z71VOnvCSHkI/+6IbbxvLVf+VSZ9EyQw0rMRMAnRiZX8OC50xElSWz9BtJZZ+COxoR/mSidZlwY
	ZuD16yCHlH4093n89+igP5Nn2FxvSu2hEGwEy9rUkx5u4BPu2k3fgQKO078ZWl/IMip8P9WXlDl
	m3/1s+5svx/w+SUQxRLCnhTbb8zK27zlA5Y+i9so8NbckaERM4GJo/WYZGvJ6Gr2fB1go2VEDdK
	afg3KeZ06514lfFq3UJhznw==
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205846085a.0.1788337471108;
        Wed, 02 Sep 2026 01:24:31 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205842885a.0.1788337470667;
        Wed, 02 Sep 2026 01:24:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002e542sm89009966b.14.2026.09.02.01.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:24:29 -0700 (PDT)
Message-ID: <e9a0a9af-defd-4894-bb3b-e6e19ba3370a@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] usb: typec: mux: ps883x: add a delay after writing
 config regs
To: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX9uv82izf2im3
 w/dSm9abVG5xqK6hOzdhoWcrVZRV9VbLN1FT+4Pe6N6AotlUdePY0+lvbn0c2J78sMgf+mS+t8T
 SDE/vopvBLIdoHMZa+YrfEOOCbNYRM51k6ntTvWNCMts7kYEouAu93hQFOGPqHgV3oBSaqjppm9
 84ggpAfGCNXZEJvXzrZk4DWD0KEBGPeccX/sSPDd9MRfl6CxB6bUh0lBoZqwlYIyXh+zmFjKhVI
 aSA/TZ/pzhnLRPXdRHU8PJiliRPa/WW7bLTJrrhrNKyyh8DLKPvIRx6yoptqJ0hW1sD2cJZDW33
 FTULbLABznPAQZYNOiRDwhAXnJu7DXfnTwfKDngLyLitxyHAO44rajqFU7EQ/nR6qV9UJr7+WWq
 ABEOcH8XqPE8y7dvgTw/Yp9opzQa+F1Bvqy8X8out0/SM24HuKdsZ/2bCQ4qYKxbT5fxqy6saPB
 Ps9Eu+er6UorPdX6+Xg==
X-Proofpoint-GUID: ZQNUiARUA4IvyNysBtuq2Sck-wUYsdbc
X-Proofpoint-ORIG-GUID: ZQNUiARUA4IvyNysBtuq2Sck-wUYsdbc
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97dd3f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=vq9KN19LKcxqXYNRiqoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX0j1QwmuGigGo
 ChGqfU7kccrgxgElf6p8tUeika7UL2Zv/9xcs2Vc5WbG6C+N7talqaFRnPrb21f1KXjhtAqNTVB
 VscaMzcZdkFB/iE1w1OBmG4eUqi2IfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020073

On 7/18/26 7:06 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The config regs seem to need a few ms to propagate the changes through the
> system (like, PLLs). This improves the hotplug dp altmode success rate
> on the Lenovo 40B0 dock to 100%.
> 
> Tested with T14s G6 and 40B0 dock on the HDMI port with a type-c host cable.
> 
> Assisted-by: Gemini:3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 3533d4f363286..3ca2952e6a0a3 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -185,6 +185,8 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
>  		return ret;
>  	}
>  
> +	usleep_range(20000, 30000);

I learned our firmware (which drives the retimer on Glymur, instead of
the OS) does that as well.

With Heikki's comment addresed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
