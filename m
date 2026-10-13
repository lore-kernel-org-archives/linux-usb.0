Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA03B14B7
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880767; cv=none; b=FWqwsfm8wJH8yXaWZLApxYIQiiPqJ9hVlZjHAE/wrBzGuwJPyHxtu3WZ53iDaJNP0YF0nxtoZpXhD3gxlg1qIDkJnmKTSdONl0XYxlmlT/ywVP3/fl2i/iBfjha6d+0rnXGQduE4EYv/GmZ8FG+mxFCQbYXMf3RKOfDDPUbeKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880767; c=relaxed/simple;
	bh=S8u+ZnaFpsDK+OrhjGJtztlHxeebOrcfzgdGhegteo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i5eTxQEQXGKriO5UxG8ESog+TNvgXHClLc5trqkZVGIU4nw8fHTR+dCHOhcj6JOHEQNAldGTyyLQRfD/iFCODp7cxjD2lu+t/bGpMoUVgYwvpAlZ0gyqQnKIT0z/LEQINHLdjFzLLig2YZncCXTT/FnSbwKQYcaOqAQFrsd/woU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5IG0UQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9LbLkHo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5IG0UQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9LbLkHo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D45sJD173328
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=; b=o5IG0UQhQ/fgtba4
	sMA8Cvk537oFr+AHkiMvzp51CJEqJdQMaTN/MiFnYysiBXLPV4Auu4zBFYFzqVGw
	5mC/wzeRHe3qi+Tkns/EIG4egoDFRgwwmGHV0KLcmTvTK71PCPprLcRko3P5ocML
	8+h/PKCLvRX7UtKZR3XWNurGYes9o5OJ9bhzIhmBPF4EL7QJ7WGG0mAfa/iqMKR/
	cC9AmDfgDHPd7MtzEHvtdAIK5z8AGQu0EMEZI8xj6ceY73D9u+wrugxiBz0pyMUf
	JxAVOKh/66/d5infTkL6NCDIzmofneK9jytwUgYY5/pTztiV69nBo6j6kMAx6RzM
	6fmD1Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqs17k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 08:39:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-169846a19aaso53033c88.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 01:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880764; x=1792485564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=g9LbLkHo9nbeNTYyUkiV1vbUTh5CHifRJmCu+j2ysGLo2VgEKWU1SHrNc6eLOhjoQx
         ElEDXGPJpyOReJ55HHnSPzEGT/nAx2oVs2W+dYZC9+4BlPmsEXGMjabqufXFGppCIeRi
         PsvJStovHGSB2WtI/aoPyw3j3JCthaPvY1/HPR29lYvKw9tm5SpuKqElEyFIjfoKwulK
         WmwEpTWbPIreuuWMS/ozbASryGBe/GNUZbaNzfyM45R+t+jEyHRhm/G4Caj4guETTnWC
         +2b1V6vztSXhHVKIoIgeT3BHLvzCcQ1SVtQaoxHj6n/tmPeHIO+Sj0WIJv72fjZhqmQA
         k1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880764; x=1792485564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+ncZHSuyduxlJ78FU1tzgAiXmr0kp8iJkZCM/xCfcw=;
        b=cXKNtTxWZkQdITaFEM0Q6IzTVRuQPtuzWxpGcK417IXtzJ0zktUWCokTICQZPWoCvN
         R/Wgp6Mj0rLJEKrOr/wqe9UqB0/jAU0cNGJuKvEBD3y6/bvhd7EpVLXPPsaCFhGi8/d9
         4k5hNQHA6DyRsUtYnNU/PkittAL6ido2y1/g9Lpl0jEIKMulteLfqlzSjXATK8H+3LOD
         KcIq2asm96d7UmHd7qFTPWVY6nvvilr8gaXTtg6dSyjP3A6FJuxxLj3CQWUIPRPBnTUt
         giP93Weol3oDh5sqhvEyB1bNfPuHrv4+WSx6xsmtmGLV9dWXBanFfvoJfV2ZPiBMfuc2
         0TfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSOP5iwCi4a68udz3GhgReDu1AvKJhIUodbOXxBwLz9TkuOG6Q4D/cq3b1sobZhoVZ1S/QDxCB6Ik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRDifeRGJ+ff3vqaB43uM3iom+AQmH7uS4S+NFUL2Hf/Vf+i+Z
	wp9nD7wQjYNJNVKBYRdeovxLNsJeBdMvDkijV2wigACAjtuWiiQA034DaGMMtyKdA14WArRDxvb
	uPeefXy5SsToeYKyME6KxaRmprQkQYE1OwMH9HXaaLrgjG/95uNDzgVlQusHFPf0=
X-Gm-Gg: AYBFou0SHyrqFJm3CnluhSunhmopjGkS5cD3LxkQj8YgHMWH137iifoY3ICzcS4m/Qc
	nLHew29wItrxg3x0HStl6NSFgiPwfX0dbE/4m9y9wglzBqQAlcOBdcgrXh/8NYxQkA4OA+IBuH6
	KuNlih5CAsl8pL3GYQ238w+hR0tSqfnad/U/xhhhNEd/slHuUY5SHZGElY1+JQSyVUSz/RaaxLw
	oFz15C6EXupwIpymC7857zQHx1IWK++G0s6GAuZMKWe2kUfuisqHgvMISlJh97bEFRIM0zj1Ado
	lNqco47kcQEakG6exMAdmNLDYFsQOdBDBmA5p+/hxOpAS+YBJ9BMCLhK5PXpALqFa4MpauFRTLt
	xowE4ReDuNHoLh9gZavwOkEeTBdHukwKOaX8cVOoyKsHwCP3qwmwoZUa2e6pjmrHM
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112688c88.23.1791880764440;
        Tue, 13 Oct 2026 01:39:24 -0700 (PDT)
X-Received: by 2002:a05:7022:b055:10b0:148:4d6c:201e with SMTP id a92af1059eb24-16a5faa6965mr17112648c88.23.1791880763693;
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm55939416c88.18.2026.10.13.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:39:23 -0700 (PDT)
Message-ID: <6851ca2b-775e-44d7-b437-d04fd4ea4f21@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:09:16 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <aszg7Us_ACMMiM9N@debian>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aszg7Us_ACMMiM9N@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xlNKfYdNfFmMLkyzsvxC6IYXwd7oJgyp
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6acdee3d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SsOP-9FfJHXtHJDkYNsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXyOa0kazS/XgI
 LHUki/Km8t3mDylxYOfCOrrkhR4LWCFGsUTXuSRGp3cDK3E/M4I1t69A+4qiD/PhEDxI7YsVVst
 zzgPx8ljFRZAzsYKDIsIXpORA8aS3YY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfXxRfePAZpbSxy
 p5dKASle0zERcNu1ciKTXPoRwPwPTcnX9UkE/5dNJFeVTCyhsScoOIh76HMgWyp9ynhKm/Fc96L
 N9h/AzXIJaK4x2zgr1LlO90HoMGt+RtLK4lwMZPHZVUnRxPhSgJ7HtJu+jgR6q6BG+aH7JOzo+O
 lJOEKOwpotVQ95vIwwXn38YFnxWOMiRMcL9eSSx6xUxcXEZDtxEz9bMsKBR+mqefoMcAk1XSgMY
 n0jIgm1CISEHuM8krHtI6SMdBvQUR9iGKenV7SPPQ3KPXVLhi7eNGQ3MJxhvPAcxTSmIaU1363J
 ONzjTirZ2+NWhnoXQwyFWXo8OxpmRt2nMOq8LC+7aVeEWatTemYaVYG0YKtJin3wjO4/m9vh+NJ
 A5gx1FkA8T6dz1UvrL2YW7e2iB5wCLjTNw68kpPMob/HKlIYXbqhDpLIUU8rP7QxC7qevUlApr9
 FEWrh8LniExB6HQ4RWw==
X-Proofpoint-ORIG-GUID: xlNKfYdNfFmMLkyzsvxC6IYXwd7oJgyp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130034



On 10/12/2026 7:01 PM, Manivannan Sadhasivam wrote:
> On Sat, Sep 05, 2026 at 08:59:04PM +0530, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Add support for a new phy "type" attribute to be set by eusb2 phy drivers
>> and be read by consumers (in this case usb controller) and act accordingly
>>
>> Changes pushed on top of usb-testing branch. And v7 is only compile tested.
>>
> 
> I believe the merge strategy is to merge all the patches through PHY tree. If
> anyone feel otherwise, please yell at me.
> 
There is one existing comment from Vinod on v8-2/5:
https://lore.kernel.org/all/3a3cf540-816f-41a3-b31d-2902e7f4cf01@oss.qualcomm.com/

Once it is addressed, will send v9 on top of phy next.

Regards,
Krishna,
