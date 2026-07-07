Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD142087C
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 23:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466430; cv=none; b=DqCb5femAvqtYRe3cjGR+Ww9R5pijU0fS5pzm9VtRbIzV0dKB/YvCAYhbU7DNPqXQLSpxOGtzQAZbhX25HwDvqlaSUTdg2/WlRhMOEB2iH+dcj+F5lmaA8uBH6G07g6O93Jn4dTETijBpnNiI3z6DGguHo4DPDAQgZEq5Fg9rc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466430; c=relaxed/simple;
	bh=nNLvNAxE8oTJKmVhdhD1v29LtZ3M/VtNU3SAL14/dFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLj9Qh8VBbw8LEF7dtv1MPuPpCFh8GKXohxxX3DFbEQlfwQGzrv1kJqNt+ChzeQstSXMBuFC4inAlsuAwnY5X1XDME8ORQVUtta9FdlLrR4AZFYi3wAGxNlKHQWMbBVDE27+UKsJNmmJZ6mdHwbigYHL6SNrp6w4JpevmZ5KGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtwjNrEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV64NLRn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtwjNrEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dV64NLRn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MctlZ749973
	for <linux-usb@vger.kernel.org>; Tue, 7 Jul 2026 23:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=; b=DtwjNrEPrDz+RPMT
	28n6Ywp74gEkEl0i6Dx3KqJ71xVDkKuZOdHv4Toa2NVLlVvfnoH6UBT3kjpw9vvr
	FUapcSuo4TOIsCJ6E0JRcpR64M59Qmo98TmXUhRYikfGec2ZHDznSwpF6b6HTuK/
	X8R6F4Yk+etS1xKyJCugWEaufx0Mo9t92quwkImca0cIL7bzGSI6DaO+zICmX0ul
	F14oooUEmA0JL3sCfExEGaFFrSbUmyzJx4GhE21hHAtTaUhAh3g5OMwxSrUo70wm
	vpL98Htea2Oj8ODo/cgw9lnwBJR+Pmze3d6K0k+dwxsn82SE4mJ9Cb/L74dc1iID
	Z/67BA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u10pts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 23:20:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso16144a12.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 16:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783466428; x=1784071228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=;
        b=dV64NLRnY+3LchWeoM3ff1v9DfJ92zJ2M0OrnLZ0zvdi9QX7bingjNxqSONwpd4CA9
         PqEJAC/u5/OOc5mvlPN5etIZ0FGo18v+PLB7N15CboXM88KdbNJBmsXAQeDMXuOpSY4D
         rpyAgYo4MP0PsUQ2Gb2b0k01KyzWYtyJ5GAYqkzaWVDRPfl//38O4OT+IZuPja9acnio
         2N07jnBnOalWn9LrkZqj9dBoFdq6QOq6kFC2bIT7OhB0C65Lte5kA3PpJUPuNEkVu3Tr
         u1GCQ9QDm0Jroz/gSNpiLgaGIvZjfTar+cXNfD3BabN50UHDHd3lB8D+URsC3wGcrG+n
         aFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466428; x=1784071228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGjjqLq+Ks/g3qQWYtvwlz79UBgaLrZTTvu4D5iBSCQ=;
        b=oN6bc/IBf8A+GCJgyWa3rPzSSpL8fsIy+utBqMSMK1DRVVIGw7/4T1VmKD12AiVGm4
         qB1IJTDR/edD+MlaSiDDjf+cxy+bs74s+wi6FcAlCzOA6a0HgmZb8n6lOtgSA76KF//i
         UPqw2VgdRhe8GwIa9pETGMvX2SpAxv2teUUka8KQD1v0lPEicuEr+ecsRxS58YkkYjdE
         0/ygZ6/kezWYFyyIb6qNiTkmsRNybA+Ty4mCi+TcWE+Rq6ZT2KweQ1tX9EfQMjIg6xZY
         zpuZbfgXsT4JbxaevmSlXB4DlwkcisWeXF5OvW2ihxM2P4AUVN0AbqtnyDAk0HMzFkJo
         IZjw==
X-Forwarded-Encrypted: i=1; AHgh+RquMowe2W4MGQ/Zq7CB0by76oxtR6JivH7BgfPXmMpLM7YuQBHO1H9MmkT66rf2zpa8DQvP5RYNZUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCISg786DyNvcUv2fJ+N7zDoT58tFUEVBLIDnpEg09gqk0CJZ6
	oQDTLW0Hx9GSOx47j+7rtbjGNI5FvpoWahzE8GpJ7kV3JI0kPpSaTihG5OivgkPAjpuccpMXq9Q
	D7BBRU44s+bfSyhRr5BctXkJ3ewEUhyLlhnqYcZOt8N/wT0GyORa6tkeRqvCr66A=
X-Gm-Gg: AfdE7cloQp724FjHeaAOsgMmLSW8lL//MGb7ZEPLE7jBtwlC1JVJE34cVuQmsa4xUYC
	EUU/g5pM/Sg3RcfZaie9XamrHh07rD4YgqpP/XWR0GRAqRi7Jcn+28QXYyQ/X2yDe6X4IhN/G5a
	kmkLoXbeKjnkhukT3rnmrIX3sCbLxpgRxXDhpXbm+YBjBGMM8ytNX0BhCk/NrXo3k6PH1QB9NzA
	+0UWoMIjC+klIhdoFRqpiy+Bebep0o+pbjWQhD2dopYxEjdryduYQ6X2Yc8p95hSxsRDnr4vA0U
	o+34RoF+xj0RJpKsIXADRLoW2gfiJFLlMqbRpVttH/IFLzoQosYMl8iZIB8b9PAL1LdOuzLVDu3
	B0SRrcx/zH8G8TFN46aQk+uwiNGDHbLfqH0BMtkigvQNxyiuPTm96i8+NiBZRN5Pf9QcV8N6UeK
	vjjHE=
X-Received: by 2002:a05:6a21:1f81:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c08ee371e3mr7498709637.29.1783466427592;
        Tue, 07 Jul 2026 16:20:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f81:b0:398:840d:39aa with SMTP id adf61e73a8af0-3c08ee371e3mr7498684637.29.1783466427149;
        Tue, 07 Jul 2026 16:20:27 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac0557sm15675242eec.26.2026.07.07.16.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:20:26 -0700 (PDT)
Message-ID: <c2e03d2e-fbab-4632-b4bb-25c6a11bf88b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:20:24 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
 <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
 <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pzWXgslCguImvV4TYIcRlWcE6NXS7EoX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyOSBTYWx0ZWRfX/bIZ7Fqq1b1z
 GuRRolGGiy7rBte+UKR55i6RUVVyODa4Q8V6GzjJp3rBGZsZUMLe22OVcmIpD4CgBJFcGjCn7fm
 cs09qI31vpiVPe5y2DSYuN2qkpBGxEg=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4d89bc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Xh3BmAQj8LICq2LrjkMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: pzWXgslCguImvV4TYIcRlWcE6NXS7EoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyOSBTYWx0ZWRfX3l4MBX6URvD7
 81yo7L/nqHlwBLDEDehPPxMNMnGA9ngIv4MqkvvrTf7GRh1AMUuSY1Z757ec3mp/trze89iGvp1
 ckW9wBO+TGcIC9B+B5TGxCQ2BZsaUbSHr2dLcUetOZddeYIkXld++PODmkX8PWAg/hY5udoqUf9
 GzjlFiDGkyxpYSsJA/u7y+RVkUVh9jFP+9PLHqaW9Tv/zrd3T1Qh8nDWk7od+pQx9aycONrJzWB
 ar8M5Iuj+uft5kHl6Gqadytp7oDtw5MmAWxwPaLpn+fP/PIwLr8g8d1OcOdGWHPCETZLxcnXxgp
 RnNgCwzLnyZq7itrCUiZiyWCyywWv5hO11/OJLz/JRXBFH41QZc3Dl2bTWSuis5zEV6KWQj1ouA
 UG7urkj6Ey8rMJBatLZhFyzLYUGoosSMjywnhGXq4NKbUTxD6kTWVXgnT1vQToO7y65pCS5i1Z6
 VMA9j9xCLcATis9hYqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070229



On 7/3/2026 5:01 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 03, 2026 at 10:56:19AM +0200, Konrad Dybcio wrote:
>> On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>>>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>>>> independent High-Speed UTMI paths, depending on the SoC configuration.
>>>> Each path is distinct, with its own connector/controller connection
>>>> and role-dependent UTMI routing.
>>>
>>> You miss SoC specific compatibles in the patch. Binding describes ONLY
>>> SC7280 but you claim here it depends on SoC (not sure what is a
>>> "configuration" of a SoC).
>>
>> The hardware configuration - some (older) SoCs don't support muxing
>> to another port. The binding only says 7280 today, but after some
>> version of this series lands, we'll wire it up on basically
>> everything that came out in the past 10 years
> 
> Yes, but I'd also prefer to see exact words / platforms / references
> rather than vague "depending on the SoC configuration".
> 
The wording was intended to describe the EUD architecture implemented on
Qualcomm SoCs (as described in the EUD hardware documentation). Given that
SC7280 supports EUD only on primary port, I'll reword the commit text to
give exact platform references and add a compatible for a SoC with
dual-path EUD support(like SM8350) to serve as an example.

Thanks
Elson
