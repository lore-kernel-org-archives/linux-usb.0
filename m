Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682282;
	b=B1LJqhEsRZcOuDPAY6J4xr+dccloKkWNWeXrZk/8kZX3D0tlw/CTXLbOL4qx4Y+IrJON
	 nIZ+Moz3doYCL0tHklWCm+1z/DgQGkCFIcX5RAUalsw4LkTKdhoTE1xTYrDRlVMWT/Zt6
	 VjYg6W9WOwUbyCsFE+08QVDoiNKd447/KcTe0enUWU67NkROQsl0hIgYT/41aA4cnwY5q
	 8kYipjlGBUGRBoytICDuSDNVH6xoyq6Hv+/CJ9uCqrkO3n4aWaAYh1utWc3+jhf2XEmCx
	 rEWbj8ZMYB2zR2SElpCUZq+qXOqiFPhhDktUowWeWRqY2YnjEARwosisiu38TNua1Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
	b=mmzQ2yF+0SfE34lLr2+hSTaYDRypsA7LZXg3vu2xyaSHIvvtdzi7GVCwBJmvqTz3uHgq
	 ARZHtumrNAnM2SBHTMcLAAsDMjzsApcEz8aKDPEo9lii2DFi/+SMpQLZzdTdXr3ATsffM
	 V/l7maSQJoiJI0QXudTRrYoStBrM7LkHVf409WB32nbZgZZH5+3+sXkByFq5eihu5tY5q
	 jEgAmcvB8iQrpJSPk937wWPLTk2O4L22JUgMtZWDo4uUoo1NL8gKI6fIlegKyVfxfaPot
	 qTPUHKeivUSJIx9t9qU662/DWdAgq0/0trl+8t2upYOO0XudHU/mJiI7PrbVhvcqk5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fK/KNW3J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOq5g7uc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B653B606A329
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B653B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fK/KNW3J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TOq5g7uc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B8JX3548451
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQPx9qKiYiOC+Qu5wRqDaiDP
	oYwCF37v4r4ojrWgYNg=; b=fK/KNW3JrLr3ekiZDOsKo3oXpjL6zpTkYQlblXef
	xJ/JmLp4vUmHcpOqd8zl52ccM/FCqDidbdI5/oPNjfSE+6k9idpYFby+sMvGm5j+
	1aDqoksZvM0QxOeC78NTMVnGoLkML6qrqiOfJxVmmQMl4Xi8TlLT6p5waAQFBei5
	2wK/2cnDYrjZwJKb+38gy2vWI6uL28hROIDoSx4SK761qa/e1bq1IVypUo1zq/CZ
	3NFH0VswAQfCvOq5nyXdn3/r29GPKGdyf2jnnaM2aIg4fpmLJmyMslL+2HeHIPrB
	qIMoI3mMLrHya1BvJhdwf0NX3C6wXzIyEAzsxgKZnyci7Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau2bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 08:38:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so2802322eec.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 00:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795682280; x=1796287080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
        b=TOq5g7ucgxhjxObt30jm2lqKyLr0CppaxoGxkuOwP7djCcnh6vTbrP/kk5hQNGjbC3
         xQmQERjAt3eBptW7yBbsNXk3bfjP2G2MAwTINYTcSSC6ceoCAHbX5rayf/nu2g0pmvyU
         mD8aAA6eUmnjEbjfZ16NVDp6mhmUfrFUM+Dgewh0ml2IXLB/6MQw98zSBDuKGB+UBfEe
         ODDO8ASfC5/2J1uurHjfGQENyvPrk0KJ+mQKYpbX6QmbsmgC+cIUWZicOadBov14rTFM
         ibX69BGZJU+Jt6EDopHjNjEKkDtdDMIOwl5cT0VCxftGLwP7NpwBkeZVz1w+fnrgRV+P
         hDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682280; x=1796287080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQPx9qKiYiOC+Qu5wRqDaiDPoYwCF37v4r4ojrWgYNg=;
        b=nxpkJJz6Sy/iMvslCQt+GNP5njV8Si5XKML2UUbjnG4Py8Ze1orOCLE09SmRQToeAa
         SAitxLDDxdhm2WAnz4xJaAReEQyY6cLfkSX3hzznUnY8fI5HfFt/gym1YBHzzseP6hiI
         kMZK7CK4j16GyMlB92V/uoAwDJSEh2Cy0mjgekqiJu0YpP/CJKP0q2nYE593Ye8qO662
         BClufPKFj+/hN4U29KFju+4pzr0zCDKdXD2FxtdCeVNI92yNa82okZBB8tmFU5KPD1lK
         DEDDYG4ohoAhGjfMyQ8u3Nu/TBqWmVcAEErL1UBLl7j4vhX1Uj4dhRfoxjGYDrIed8/T
         JZEQ==
X-Forwarded-Encrypted: i=1; AL+hErFd0Txgm+7i4BLudDsBFnZ1fp8ziL9d72UutMeuDCuTDY7fRx6ZnOX0r6rO7411ySxG/00G9YDqjig=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QP5EtH7GtrTZyqO/mm7HV6jk0+JAH5VgmHM22vo+MkZW5X8CY
	SzAMbax5lC0OGbtveQr4YQju/EuP6pTbBwc244ikSYvyqBtRAB8kuQ7dDYyk9IHb6+rod+SMHCq
	xMyH1Adewryjw7+yPj637GsF7RnOpNXFIV45waiXosd0e+ydlUPXIp4CPnlSBlN0=
X-Gm-Gg: AZFdTZcpp1E1+0wiLJnhG33pF7U82hed1MtImpUb2Pob0QBrctar3Fs+mGNy+ytS6qy
	7GIzBuojnS2Ika5IMveTBAXEzjWEA+pjnxg36YSi3bnRTwZKJS2uMB3WC4Nmw8ZUy7liD+5BOET
	YfAFhy57Qv4KsfXwkSvEKxwa08TfrshXgrFH2QEMychZ8ALgEspVI8RfWUsD4vXjD/cX0OvshYd
	PktQczQgYlC5590e3isysofzmB4Ukuy2wWuAygsZUB/cxkgM6CkOJfeEAUviIT3yyegNe25i4Qk
	wD8kdfuzrQ+IWxs4f+ql2VxeLylPX1uIUglW19T613JUmp0LmUAPT2m181hGEn54W1E7y5Pc4Hr
	EsxR0zf593xohBOAp0J3SxwL3rx4/MMlTmmjdYtG69nCsWwz2WFw6DoJsNp+79AwFn7opEhRJH3
	vMh2U8jpZXS7p/R9mHfw5j+g==
X-Received: by 2002:a05:693c:61cc:b0:386:98bf:c6c1 with SMTP id 5a478bee46e88-38698bfddfemr18801002eec.26.1795682280060;
        Thu, 26 Nov 2026 00:38:00 -0800 (PST)
X-Received: by 2002:a05:693c:61cc:b0:386:98bf:c6c1 with SMTP id 5a478bee46e88-38698bfddfemr18800971eec.26.1795682279493;
        Thu, 26 Nov 2026 00:37:59 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm27849473eec.9.2026.11.26.00.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:37:59 -0800 (PST)
Date: Thu, 26 Nov 2026 00:37:57 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <awfv5SLoUnYlJUWi@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX79On/Ms+gkWS
 BZMdJIh+4CpjROM4MG5+94H3Ox+bS0qFfH17V8ZuvzepeuhjKTgX7nCWm3kwb8D0biZjxr43DP7
 4MUlZm/h/tDTnRwGKUPR4eVFGi3xO+g=
X-Proofpoint-ORIG-GUID: JjZHfIvbYr8pQXM76VV6UIWa2s4FxU4V
X-Proofpoint-GUID: JjZHfIvbYr8pQXM76VV6UIWa2s4FxU4V
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07efe8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kPxKJPT4JOKwAKEPVQYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMyBTYWx0ZWRfX8BepRZ1BcLDB
 d7aO8xUxsQOTofyWpxh80wvBQhFQrGr+0x0UD8rByquPTt2A8d+XhG8mcdnH/4p0UFAcpwIs2Gx
 9+42vJzrLu/Zc7I20V7N4e99t+Ou2xW12W1t3Y1CrcIFCDRWHx3EH8DdOZqE8kAosi+qF6YaYI3
 I4FIlBCgndMdc0K2PgDu9h1OKSOOWg6ADjiuN2wk8rbjKiNTbjTBtR9f4KMi1i2TxJrS5OrX8av
 BT6nSrs1v4rK748v6n4Kwcs1haFUHOW1ZOXPLJyMER2RBZym5a+PiFCUJZDLghYRZU2WqCg+AYM
 6QRs7rFKRhAdsnhJp9YwVPmKRTArD94xF7gg8Nb9FXbcmU7pj5Hs0k7wNXcr93Oso8GwAjmDadr
 /ATZw1Jd7t+/WCgJG6anibWgTebgO4jbBTD4LVSFIcZ+JZJI8HDN6q4ZO9jBLkejkq0RtOKNvlp
 DJyhw6H6ZnkzRa22N7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260033

On 26-11-23 16:17:18, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early

Have you run out this sequence at hardware? I find the dwc3 core suspend
(dwc3_pm_suspend) has not guarded for is_suspended, it should run into
some problems, eg visiting register with clocks off, etc. It is predate
issue, not related to your patch.

> on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
>  
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>  }
>  
>  /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
