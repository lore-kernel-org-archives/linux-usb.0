Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793594848;
	b=L/AV6R+XWylW7f9DgCcG2tTQGsYsljrYhN5h/LgFNaFuWtjfBSXrtp38wraiVDtPEZF6
	 j+Ve9aFWZPaDAzv2jn2hoOp1+rivXbpCEeCCx9GQqeqSU5fLErjIa0Sz9tMvNvbZ6+erp
	 m81pLhQMA55eFBnVlOvSdc9URZ6D8U6GRs/VZDMqxltzN5jxQKedvH6LFSvFvecxMiFi9
	 ez7uQUXfX0Mv0+/NDshfD8Flu00lFPPpARMBdkVvkLMJBA6T97zLImTDR8cm5jl7h5Plx
	 LYvo43sCwTzGgytHrCucI2DhF703VFeTMn0KnyFq1Fp7Un9yGuncz8IKgGXiXePaWCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=;
	b=TjgX4xxTvmEcCbNyZciGszjkwuybH3vngJZBxfG4uAMEHg85SOLkst7iX48lwfY2tPiY
	 R2Gs+r/YrV4LdrBNzyX14QSREXDb5yVAWWneeZ01VxRlfYnseAVODVgNohg3JGx7TUkOS
	 GLMTA2eb3c+b7ZgPJxkHuqKbJw6/5CfHXUjc3uyVKFtmQF4hgxLihaWKNWJcHTYwaS/K8
	 ogCv1p5hkCmd/EDR9Zea+W8pZSeJ6NZj2+j7GuUO/WDumQEAjAjCbNBpa3pEsQ0r/wxW1
	 f5pqD8HGZTqLpJohaw7nKGqWlgLm0jWO8D2b8gyqyS8lKmUsEEr/gPh0mmIjsIHsthQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE7Ckr0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsrvbExa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4032606A327
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 04:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4032606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JE7Ckr0G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hsrvbExa
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vMp71676249
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 04:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=; b=JE7Ckr0GI4Fb3RRv
	E5BGIb73LcqCdEzu5H2MDxXSTvoC08SDt29RuvCZyck3ppHYChmuA1f4Clqhb3n7
	cI1fcb2U2Idae8AWOTy9u8ypi0v/G/4IQqOqTiwSTaY6EAA9Fn/I9/Xts+jApgrt
	j0iZ4+mPpb74oqNU6qZ2RJ0zZYT/g5uSlzR6TWe/o/JArdvKc7v/E5Y6UgQNcflC
	Wnf6M14Tx086eUTIce5u0AV0HGB5GC01UPumd1vbzAgVxaDyyETCaCom4FKVVAoQ
	qLBfxLm5jY+Gu8DXDUKuQzZ+1f7LkM4l08V45qvxpnKUPopKPR4A2+u2swn7WLy/
	1Nwnzw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7w4uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 04:47:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so3705561eec.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 20:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594845; x=1794199645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=;
        b=hsrvbExaeatbnobei/bCtXit/xmi2PTBQlizk8enJt4jFLI+Taccn0ASldBGcbX4Xl
         fgQS7pFUAXum/sFwNlYqklA/CFrNl9rQsiRszTS8WhrTMqmnwi9WFSVSVL+2ceS9H7hT
         FWa4+62IjIyNg7dmdbnsaux1aYtSK376+u9qFKXt/SB3LHfh2/r0MnjjTh/p/R3u3JY9
         6Iz0JhGroDRGC6xgrPeXprLPs3evWMCe+X+0kEg6DIdxyPu42zgaWCL6qIS/4HpwDohl
         lYGAv9MQDMkmYn5NRGpfG6K4/0K1aDAwf7B1coo0JkEBqXanILc2248C5ix7/yaSHylB
         cCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594845; x=1794199645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTJ4X6Nrmp0ExjxQulbaqwTbc3MkC+lc4jxolNuHx1Y=;
        b=JpoI0oyw6c2T7jWLnW+AVCGQoCVfr6eaHEpDxJKPpJNh+JJDGTt6lrtwTXieTJmnVG
         wMPmo5adg52tVlAPuYMNEDgP9Xb0+enIakPFVv04GQcsQPXJEW4cG8kMKY2z8ifPARQt
         IPWNvQg1v8854Tiae4xxZIJChxrlvATV/msL6OBMceEvKDZ3AVHdbyYY6d48C6BD1DUP
         jqaCYPIGyl2y63MqZOoycjC1c4He3uEr1I0dSd/QgxxD6o47uhyPQOiBEccSd8kJuCed
         1sG61OleXeRJK+HrPO03TPdoe2GyHkUsr7iroe1Vp1f61VtpWF5H8YOfWXBcnyq4iIsm
         Z+yA==
X-Forwarded-Encrypted: i=1; AKwUvBy+0qUrrxwbc8tcN4VsMCg7baas2xv2vBL6H1gYoNvDmruunFHf66v3LJ+XcwIgQk0SIhVass1l65U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ypXmTYMbdtGjL6QVjVc0eTLy+AsPigr6AsQ5ph+nzngy/cbv7
	ZVJ7TPo/mcJOgJ+2/8z+OnPnG60jKMgYaZjFDjs2+rYx4ERt2jXcnUw/t9PD2zMvilQICfxqMEy
	BsIQAOrg3YKvuXXdqIGKYtTEAdLT6IVPF7BYzUGelLmqsUACitEGIvxFOzQnxQmOjJQwUrss=
X-Gm-Gg: AYBFou0SzPwIM/qjvHXqC4Prg4CDKhdvJobwHHX13rUQlwYRAexjdnpujmHtBeBW5vj
	lWZvBb28COV7j/xv+nxtolr58XoCCkZU2WObQ1ELrb1EsYwzMAsRMg+Tu6awRBxJLclwVvU/54N
	j4pQqS7NZyiKYppU8kz3rH4xaGY8vJ+1hq75Lw/D1cvNGqX2WAW0ScBk/8lrQkOxtbrHv3mq1rk
	ubSnwzOtCVowhFHkje45U/4xp5N8Ysw6R46pZT6dfFV1XTZfk1EjtUUj2JCDxmGS1mYxjerG1d9
	4vzp7DhuupozIN1uVtmr+r3Ycp+eLxswN0K5PIEUBCNobOQ4u6tfLsZWLJKFOdK23Vhniar+jog
	t1y0IM9Eo6DqeBMsAUk/Kr00lUxzczSiujlsKSj/v612sRw2e6W8JL2BoV9lPeBhqki3WMmT5l+
	uPCOsfktRpvjh3loVnUZN47ZRQM9JXvvivmfHa
X-Received: by 2002:a05:693c:69c2:b0:36a:37:1404 with SMTP id 5a478bee46e88-36a4241b6f4mr1817087eec.13.1793594845507;
        Sun, 01 Nov 2026 20:47:25 -0800 (PST)
X-Received: by 2002:a05:693c:69c2:b0:36a:37:1404 with SMTP id 5a478bee46e88-36a4241b6f4mr1817053eec.13.1793594844776;
        Sun, 01 Nov 2026 20:47:24 -0800 (PST)
Received: from [10.218.48.51] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm33949189eec.21.2026.11.01.20.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 20:47:24 -0800 (PST)
Message-ID: <b31b9ad4-b17c-4dab-9bdc-fc19b1028fd0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:17:18 +0530
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
Subject: Re: [PATCH v4 2/7] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <e39a38d334b5276d8a47b917b1f0fcd0a32bcfe9.1793212717.git.faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CdBRG_UzMOTh5TM5uITEn4WBetRXo3Rp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxOCBTYWx0ZWRfXw4jpd66fjCFN
 dMU/Y0YZL+VzD9FH9ZYsSVSZHnMzYaVobZu0bw7EqNPu4wLAtY1oDUkpQ4RmoY73hAKZdlzO+sy
 8IHIAKjTME0GxwNKtay1eE1ff4m0Y0M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxOCBTYWx0ZWRfX+X4w1aVza+TO
 uN2IigKU0fOuO3xBhMOk4WJGsrgFeEaS9Ymys+DPC8NW0luAEoDVyagrwg2dJacXgefja/suWjb
 9gWA6cMtkIAzdsjomSvzrUmQduaytzppfm8lEMMzqa9T6pZFCkiIWMP8ITaAsqfdZhvNzzE9V+e
 XrlXjLfdibM9Y6lCoBQ1rzL0Unt94M05dcWaFS2cq6Ra3zSYeXfhlP+DjKDmS95MmMDKzY44u4a
 nqvNw1m4NAZMmsfrPM8yN2cuFFWnEJ9wRUBFgaHxPUnoa3RKKyOKiw/f7GAFvaza0JKo6P2LHBh
 URq53xs55ds0CQwq9T9xCOKpPnYv2qlb6RU6fWQzcFJyIHSiPAoAYgmAaHVHUCnR8D0l3IVzDIl
 V9fZW67Sm9wOVDYrvHryNvaULvmDYBFNit77/GV8BvaKTkcX9XnK5EAgvLb/ptEAHEsl6SvBZVH
 5Baea/tutPRtC1CrzFg==
X-Proofpoint-GUID: CdBRG_UzMOTh5TM5uITEn4WBetRXo3Rp
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae815de cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=gKCUJ3B0P62vvhmKdnEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020018



On 10/29/2026 12:29 AM, Faisal Hassan wrote:
> The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
> handle both system PM and runtime PM paths but cannot
> differentiate between them, preventing distinct power
> management strategies.
> 
> Refactor suspend/resume functions to accept pm_message_t
> instead of boolean wakeup flags. Use PMSG_IS_AUTO()
> to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
> system PM (PMSG_SUSPEND/RESUME) paths.
> 
> Preserve existing wakeup behavior: always enable wakeup
> for runtime suspend, check device_may_wakeup() for system
> suspend.
> 
> Follow dwc3/core.c pattern to enable future per-path
> strategies like differentiated power states.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d4fda4dd81f6..508b1ee7cd0f 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -346,14 +346,24 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   	qcom->wakeup_irqs_armed = true;
>   }
>   
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>   {
>   	u32 val;
>   	int i, ret;
> +	bool wakeup;
>   
>   	if (qcom->is_suspended)
>   		return 0;
>   
> +	/*
> +	 * For runtime suspend, always enable wakeup.
> +	 * For system suspend, check device wakeup capability.
> +	 */
> +	if (PMSG_IS_AUTO(msg))
> +		wakeup = true;
> +	else
> +		wakeup = device_may_wakeup(qcom->dev);
> +
>   	for (i = 0; i < qcom->num_ports; i++) {
>   		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
>   		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
> @@ -380,7 +390,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>   	return 0;
>   }
>   
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   {
>   	int ret;
>   	int i;
> @@ -766,14 +776,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>   {
>   	struct dwc3 *dwc = dev_get_drvdata(dev);
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
>   	ret = dwc3_pm_suspend(&qcom->dwc);
>   	if (ret)
>   		return ret;
>   
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
>   	if (ret)
>   		return ret;
>   
> @@ -786,10 +795,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>   {
>   	struct dwc3 *dwc = dev_get_drvdata(dev);
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
>   	if (ret)
>   		return ret;
>   
> @@ -826,7 +834,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
>   }
>   
>   static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -835,7 +843,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>   	int ret;
>   
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
>   	if (ret)
>   		return ret;
>   

