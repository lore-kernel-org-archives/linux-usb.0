Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771960;
	b=lJVJp40+SrdHgqOByFQXM0qm9oYP7+yV0Zsf0DGy4xiE8oxZDzexwXU83fEgYBqhd9+P
	 0m1lgEgAXIqM3RVljhfh6alGam8I6oKIfoM01bkJBXCrHZUCk0p3rguZU9V1UlKgLKkaj
	 cPw+8jVpW4FMyFbAMWZygrlGLnI0+13YKTENCXS41dLiILvsDllJd/urHAYCR0/8JH6M8
	 qENNpCiYzE3KqLdZ92joT94YrcFEzU0Qzvd8wE5TbyQ1UFn1BZ7c/c+fXgJC7OZ7mqGAC
	 3uI0oYex/iBflcrENDWEMCHiRui4rfNYReoPx9oVG+kvj1WgrSF/28beOcV4gvtS0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OZksdnYUntMKoOc3+kCZsctzFxbRm2vRh+kisTEkV1A=;
	b=kdckM+VY4FD8wouT2duiHV/kuch/7LWdE8jQz5NR7MPMIR55LVwiGJKKuGufLGHX3MPj
	 d9VtVexHZ9yJBoo018CyhLOjdh6YgPozaeEWwIKooZ2ExAHPGcxFbqXvPlf+8Q4NkAO7N
	 fIA0unNBGLoit4kc+ExLQ9xLavBb9hjRnMNZefpZkW8D7CB9wenakmjCHqVA455Wzj8qr
	 NtBbh0HRItCC3TRNHbfCCPnY/6tqJeBgzvQXsodTwq/GS5KJWZoouGfpjUtUkVFzkzoxN
	 Pdtmk9JI8Lxc8vjK/Yah1a7HxO+2L7MSK7K38WiroJp7AigSVbC74VNZ5mMNDjvPTeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6676LxH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNZni+5z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B3606A32F
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 05:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930B3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X6676LxH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNZni+5z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R0eG3458455
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 05:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZksdnYUntMKoOc3+kCZsctzFxbRm2vRh+kisTEkV1A=; b=X6676LxHNUPnH7Ze
	YRE11PdlQG0HceA2cot0usD1GxI+oqk0a7KUdpQeg9qWTGRYEg1UT3GTdAf1bikv
	/tGYveazgWzL3nE7R/mZZZJM9V48FhfLFdOu2tZB4HioKtPTSUGrSFZOJhHSksFy
	FwLlAg08HGLrlRXGMq2ZYm2wVoR4U+hZaTrSmPNhLf5UN1Ano3wyUwJvJIgzYTvt
	aHZUkS3w0vXGvdo5HUXl1LXhrJCwVYD1fYecuyJpR4rvhwiWMK1fOgigfaTtt6eg
	4eTCd4ddhq/fPenxXpM+Iwt2YOMZq8bYPgvP5V+KFfWy6bqqxw4dEAumdkuWPoKo
	RjFlTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2buh1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 05:59:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd67466211bso276801a12.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 21:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771958; x=1794376758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZksdnYUntMKoOc3+kCZsctzFxbRm2vRh+kisTEkV1A=;
        b=dNZni+5zTUQPj0X64/Nexb7m6Lkoo6psosNw6XBTc7wBWCtJxbGVD2GRNjkqyaKK8D
         QUCKEz9ek3idM3zXZmrM680pFgmtpzC4jyeD8zS2mGPm14jfAvtmlGhged/XxmPjgmyc
         dO4LNJ4knJkHg2vwkpGXza8XhgOFpX6mpNdILPJFFVx2xCigktSVA2MY6Du7wXXgeMHZ
         W2sytdf4Yn/2Q9ZT2Z5eN2eQlCKHZj8NybAtIlBhfrfMt08GE3gP3dZuuKFd+F+2HYPz
         pPkZF8FDXD6M609ob4DObcYdS0FLb14CJFWFwG3JGtGqoBruicgSfnJlWKYzFhTBNm1k
         FWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771958; x=1794376758;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZksdnYUntMKoOc3+kCZsctzFxbRm2vRh+kisTEkV1A=;
        b=BiMNaugxZJpbyUKf6KeeAhi7Cb1Y5YHmmMQ/M1WkwVjxlR7/GrBmBTdNxSiF7P+KcA
         qXUJMf0RvlV0jF0cWxTltbiwOG9G29Edx0zRRc45HuMfTNTFrhixbDOhIi2FASgZoYJz
         40kZfhg2PGcqyluV+UadQRy/fK7mYcsLc8VHJHMxkGa3zJPhhRCoEe0pvPBKEL3bIkUH
         tgHefsm0IleJXaj4mOhdkovg766uvth3tXKwikvgD8tCr1hEgySxcS0pRvkLtzxvU+EC
         mw2lBSuqPxSLRo5mri5EZybdCmM7JHlbsKeuodOxsHyTahtz88ACO0LHAwjU3ZDGsSDh
         Nkyw==
X-Gm-Message-State: APuU4Z//JSk4nuZK6ttGxPX2RM3WlsAHw4oMKwh8mzdN+fWYjKDjBH9h
	GxOZBKqapFWSyjiaDJ8VT8qmfU3QrOEInUUZmk0cn7Bvxsmek+YbvcR2D7LTt3xNCs9vZ4wE7P7
	WT8ZgnrwHlLrX1KsJ6CMkd6jg0bDRUEAowvbkiEBcSTVC4vadUsNGw42z8oErfeU=
X-Gm-Gg: AYBFou39C9J8M5Kawn36mUQKyopv83AXw+8ISwF8J3AqrG8ISLHrmui78NgDhNSEuWM
	t4XSKEcA+jPVtBk+GKUUx/SnXHhpjmvPN+G/jB+qz5lgfVUoPiVBC3W9EmEuU3QQjTB+qadoygA
	OiXtZygROQWx3/iwv+jO2j9IFoWtA/4mc78xn9VtCxpA/qQ7iC8ZLWw8TbV4njWTERW/88ykJ3H
	lRK0FSAD7qGf5VlxG5M1L+2AqK9dhsITfpyfZTYZ3UEfWtjsIRjpAtAKUKIbhgCx9CG0Cysl+MP
	pnKQOIkDrQCuhAwkD9Et+NjLNW4njuowLx/0auXqUCjm7w0ByuHC36CD/HxOHaNlqhEasWpQSRW
	oW0o+iduz5/gYv0QuhHgxnrj5AtSCD3VzQwXbtj8qGyb6xrswQQH4x4Wz30PLurAOZdpIaQTs1u
	9I
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr13336630a91.11.1793771957876;
        Tue, 03 Nov 2026 21:59:17 -0800 (PST)
X-Received: by 2002:a17:90b:380c:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae896f8315mr13336611a91.11.1793771957325;
        Tue, 03 Nov 2026 21:59:17 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c9928c4sm7841583a91.15.2026.11.03.21.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:59:16 -0800 (PST)
Message-ID: <379b0e2e-83df-46af-8c50-f80b1fcadc43@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:29:07 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Support broken suspend for
 SA8255P
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3a4bdffa9101fa81e4511d84c5a3ddd0b972efe2.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <augEPIcTyepgTxFW@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <augEPIcTyepgTxFW@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX8MPZsOwg5VYl
 lLiWh8mXPYsHQ/cxl5jMPPaHLd1ipNzmONlolBah+aP7VKpNtT9OLSDJTR0HhKvt4BcZUzxK3r0
 wFByhzpBaeIxacGypQiN5oLXYjXuUVs=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aeac9b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=-KlmKFheWHsHfVOlboAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: drCyihQ8T1TvrUfw9tLyeaGZGRrylKdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX4navy97A2XbJ
 HzLwrLNJkrqKOG4Ci7HCD6DtCu4Wl/OmhXZjBX5QTaDyhZ+GH6knfWguLdy9MRjZeasXK01F2A1
 1oMakKg1iVxTwGFnvdyezXKUrFPFKLZo+MQrjrhW4wWp9homVgIgqz6ZRwsa7rpotTOxgs/gbYo
 aq6uAYMGNXDRpadYcE4zb1+m6SrVlI9m+f35s0OAJW3LkuQ8ajHRZkeRc06Ofp3RWj590wzEity
 QCSiT7MwKcxwtjKB94MJb9y50YYq/3wAH5budhkM9Aup21BNRqczgmvDfXIOe1esWByO9uwmVdw
 p5TpTqyLkGIT6iB25/r9AmMoX4F7fg2HnHlHH6EktMjmX4Ph5sLr+TkiieCxYQUBCL33lkNnupF
 sjyDtaQn1+UFwj+wAK6fnGb6bJTwRnUa7kSdFF7Jd1WvAZ/tpNjzNCa1bxJ1sqqIKfornwR+C3t
 TLZ3+IU7Rr6wmIJIFiA==
X-Proofpoint-GUID: drCyihQ8T1TvrUfw9tLyeaGZGRrylKdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 09:02 am, Peter Chen wrote:
> On 26-10-29 00:29:35, Faisal Hassan wrote:
>> During APPS Suspend, the clock controller unit disables all clocks
>> to the CPU and subsystems, causing the controller to enter the
>> Power-On Reset (POR) state. This results in the loss of
>> Qscratch programming.
>>
>> Upon APPS Resume, the USB controller does not have the proper
>> PIPE_UTMI_CLK_SEL or VBUS_VALID. Hence, if only the High-Speed
>> PHY is used for a controller capable of SuperSpeed operations,
>> the controller will assume it should use the USB3 PHY and not
>> the HS PHY as configured before APPS Suspend. This behavior
>> disrupts the normal operation of the USB controller. Similarly,
>> if the controller was operating in device mode prior to
>> APPS suspend, and VBUS_VALID signal is not set after APPS resume,
>> this will cause the PHYs to transition into the suspend state.
>> This behavior disrupts the normal operation of the USB controller.
>>
>> Address the issues by ensuring that the PIPE_UTMI_CLK_SEL and
>> VBUS_VALID are handled properly after the system resumes from
>> APPS Suspend. This is crucial for maintaining the correct
>> operational state of the USB controller and preventing
>> unintended suspensions of the PHYs.
>>
>> Also, as the controller is starting from POR state, make
>> sure the controller Reset is performed.
>>
>> Because the controller is reset on every system resume, the
>> Qscratch restore is done whether or not wakeup was enabled, and
>> dwc3 core is told via needs_full_reinit to fully re-initialize the
>> core on system resume even in host mode with wakeup enabled. Wakeup
>> on this platform comes from the PHY interrupts routed through PDC,
>> not from the controller staying powered. VBUS_VALID is only forced
>> outside host mode, matching what probe does.
>>
>> The XHCI controller is reset by the same event, so also set the
>> xhci_reset_on_resume dwc3 property. dwc3 passes it on to the xhci-plat
>> device as xhci-reset-on-resume-quirk, which makes xhci-plat set
>> XHCI_RESET_ON_RESUME.
>>
>> Also make the .prepare callback return 0 on these platforms. A
>> runtime-suspended device in device mode would otherwise be left in
>> place across system sleep (direct_complete), skipping the system
>> resume callback and with it the reset and Qscratch restore.
> 
> Faisal, there are several issues in this patch, would you try to split them?
> - XHCI_RESET_ON_RESUME quirk support for dwc3
> - PIPE_UTMI_CLK_SEL restore after system resume, there is a similar submission recently [1]
> - VBUS override restore after system resume
> - The improvement for system resume dues to HW POR or lost of power.
> 
> [1]: https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
> 
Yes. For v5 I will split it into:

1. Controller recovery from power loss across system suspend (reset on 
system resume, full re-init, the flag and its match data).
2. XHCI_RESET_ON_RESUME support for dwc3.
3. VBUS override restore after system resume.

The PIPE_UTMI_CLK_SEL restore is covered by the submission you pointed 
to [1]. I will drop it from my series and rebase on top of [1]. The 
reset in my resume path will be placed before the UTMI clock selection, 
so [1] still takes effect after the reset.

>>
>>   struct dwc3_qcom {
>>   	struct device		*dev;
>>   	void __iomem		*qscratch_base;
>> @@ -86,6 +90,13 @@ struct dwc3_qcom {
>>   	struct icc_path		*icc_path_apps;
>>   
>>   	enum usb_role		current_role;
>> +
>> +	bool			broken_suspend;
>> +	bool			ignore_pipe_clk;
>> +};
>> +
>> +static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
>> +	.broken_suspend		= true,
>>   };
> 
> Why you consider it is "broken", or is it a normal resume recovery due to lost of status
> for controller and PHY? Why other SoCs don't need it?
> 

It is a normal recovery, and "broken" is the wrong name. On this 
automotive platform the GDSC must be powered down and the APPS enters 
VDDmin during system suspend, so the controller loses its state, 
including the Qscratch programming. This is the same case that 
needs_full_reinit was added for, and dwc3-imx sets it unconditionally 
and restores its glue registers on resume for the same reason ("Upon 
power loss any previous configuration is lost, restore it"). I will 
rename the flag to describe the power loss (power_lost_in_suspend) and 
reword the subject and commit message.

>>   static int dwc3_qcom_prepare(struct device *dev)
>>   {
>>   	struct dwc3 *dwc = dev_get_drvdata(dev);
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	/*
>> +	 * The controller loses power across system suspend, so the system
>> +	 * resume callback must always run to reset and reprogram it. Don't
>> +	 * let the PM core leave a runtime-suspended device as-is.
>> +	 */
>> +	if (qcom->broken_suspend)
>> +		return 0;
> 
> Why we need this? I see dwc3 core do dwc3_core_init_for_resume at device mode
> during the resume.
> 

That only helps if the system resume callback runs. dwc3_pm_prepare() 
returns 1 when the controller is in device mode and already runtime 
suspended, so the PM core takes the direct_complete path and skips the 
system resume callbacks. Neither the core re-init nor the glue's reset 
and Qscratch restore would run after the power loss, and the runtime 
resume path does not do the glue part. Returning 0 from .prepare makes 
system resume run.

I am going to confirm this on hardware and will put the result in the v5 
commit message.

>>   
>>   	return dwc3_pm_prepare(dwc);
>>   }
> 

