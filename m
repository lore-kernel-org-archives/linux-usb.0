Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FA3DE423
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562152; cv=none; b=XVSU9RtG/BBhamXtpCptAThmVEwrSF75qgrAmIaQ71YiNpuSYp0S5dRImACpVUSTRa8w33n7tk6ZdK52F/fnA2qu2R4Milwqv1l1xGFi69Y7CfLr6g5FGT3GJUQk2pt5XdB7DgYtgoRCAvniQleCJxaCXDXm8MxSTED2To1uZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562152; c=relaxed/simple;
	bh=zkcfOpvOOEGZmwcMkmOXgL76Nm/r+udiGKSvmwxFSf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5KHQ6R1fnUAYbTJkDSw7g1xgrfvIBGKzKGuIBCX98ZpLxs00Dj5eksBUXFpmKfSWPfMGY5AyO8h5ThQggn72bLlMDMrwR2rkqEL5VhaAoZ5/0xp7d4vyIvvsx7m+ja+RjNuzzmyea372SA1D6fN1pwUAj98/V+sIlXKYeUWvBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqwoLX+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QselUN1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqwoLX+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QselUN1J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6SbTU1982460
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=; b=dqwoLX+C7QT6RQov
	mKpBteKiQe0EkzvFVHoeQnevASa/EmEvyRoOBRNqOj3Fv2jDEh1uJAo9EQ1T4ZsP
	L3amMgPRsnizTaEFhQZDavC2EB1aSxYZuxRdJd97Z0skdLY72Kye0K/IhnCTYTrb
	WpZj805O1jsJ95/fMGcqlMcjCPywIxBEceHEltTKCPIOas286kUrq8KodtQpYw73
	ztOw87E3qI/6zlfmvYfyJ2L+7U6j0oeq2B8INivmM3nyE169hw5i1nO1QeZTvB8U
	24+8bCADETR070qYkyG1047KL/Vx9rjdATRkMauWbMLU2ZZTfmqv2NTFWnJHh4u4
	EI5rpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8n4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 09:02:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so7523901cf.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562150; x=1788166950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=;
        b=QselUN1JbrVBVEN/ZmcHeStbU/uQWWQD6vQN2P8aVjqRchCcWlLQQ41FmFF/e1UsrM
         hmMlLynznt/CeW1ImU2B+3Py4raH2d9JuqeF/S7jDJV5+EqvBEravrj/bnM5ni/YBjsI
         jHlY3DjKFM2d3wpeP1Fm8UCdAbK3C89r7BRmpiMYitkUtajOebfPSlkb3068BoS/wJhX
         bNh+jx6XxIybNikWQtkd7yxvRsRfG43eTpAwBraScmbTmOLh1eZcMzKPv761njd12fwG
         BrM1FoDIKC5BXCYjYbgfwQfONlsSYJ3DD5bfpmwslixafGBCclb+p3WEr3XWGOTlrs9l
         p9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562150; x=1788166950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=;
        b=DpTUKZDhQIY5FOqjyTC212Gh5K60Tckok6K62v9GrsFkjECE3jGVCVC4CI+8F/BXwp
         SxDhX6JJP5SmDzWdTPX/rfG78Bci5pkZkgEOMfUGfxojZdDxbIkYe+pKprQZQ/DSM/Sz
         MVW2o2Ps4bjbp3rwKAo24Qc+/1FMtH5Mi4xw3m5vRYvC1mSzziU5qgEeOhGjvqPfZKZ4
         eGY4msO34mZMMNr+PSbXB6LxSjaICFm59WSoTYKcmCo2n4FJde6xnGdsrHgInXGa6xqr
         it3d2s+FP6D8YB123wfzsI5G9hn59FwhK9UxBYcOihuM81DVRn4jDNq9PUd7qg5DPDNq
         Oceg==
X-Forwarded-Encrypted: i=1; AHgh+RqDxmmuctb/iCFNa3DA9IXHbB3k0uIAM1i43cd5xORUw8L/Di7JNW2PiQeEhq33YFouhDnr7AQd52c=@vger.kernel.org
X-Gm-Message-State: AFuF++n0asM5VR136VHQ2wdt4eDC1KVzPA/z0oBTL6gnbbJOOr73P6YG
	6dfjBHQRFZJMmHcoj9ssD03tMqpnrmn0bpPSPbSvTV9jV3ftMTAT92pwnBxQ9ZtMpDiNH0/3xSY
	Lan8eAicjfd+DHDx4DKQFGHBi4OMDc9234EZqqUCQlSE0HNsJwIop6sOYBE3GkKk=
X-Gm-Gg: AR+sD12E8e1wAy9by5BP6wvJb6P91tlJnnaPbqrLeZDLjk94fdnsZOpy2+s09pAPWA1
	5vWGIRf17JflannNqVYDjUYgjhfQ6vnXkwxS6R6IZvk7WqYLc9QrjHLw++AqJ+poakYoRmdb6i/
	WNWaLY14ssNxWLbOx01gTfqn6uSmRvMtz+LJBLgab30YNKwiCXMWsyByRajcZjb3tsbMmcCJYkB
	1pbdUI/IT3OrkBE6LILSC9+04Ws5deha3c+ciC5QQHKbAdUQKCv+MZR1yKzC+XxfsmOckDM4/F/
	fugJxgrKSKqjAjX56MocVNO8Yan+d99LYtVjBhYsUgeLxLSdFVzda2H1LQKHnaaBB3T0ZvHhq8c
	Sso4Azb2ol/JC77fhpsVzWDMf
X-Received: by 2002:a05:6214:4687:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90c811d6d75mr176597646d6.5.1787562149818;
        Mon, 24 Aug 2026 02:02:29 -0700 (PDT)
X-Received: by 2002:a05:6214:4687:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90c811d6d75mr176597326d6.5.1787562149363;
        Mon, 24 Aug 2026 02:02:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1191775466b.42.2026.08.24.02.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:02:28 -0700 (PDT)
Message-ID: <2e9f6fe9-31ab-4107-a623-b15470fe68de@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX4fqJhVHQmHAt
 gBy2rcQIgZvJSqGXHxmYARvkP43S9uWowX5nWr2m32DlW7AB4zrWWwbqwN5+b8pW0TgmVJvs60x
 Tt5Qbv9OrJfJfz8HV2//A3GFso73Ktg=
X-Proofpoint-GUID: PNfOjF-Bbcx1fdrGXyyCfLL6BGokdIkc
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c08a6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=TbTMhDWFNTfgXYAo_YsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXyHoy6dtzNtyn
 GR2OC0AlYYBcxLr0nQS3JGYn/mDJWFW4mwtQQ2/eu8bjPzQFQmK0dK0C564DGV0KZlgCKmrKQ5G
 R3AUsvm3PG8mSR8hZkaxlNfx7GAQ4LVlQkt2zepr8YP8tQHPtP02iFcOQ7wcMGQ4CbNdFhENxEz
 IwEueSHbTFLg5+bw3M39NTXKrQ213AN+Kx8eVzvcGhBhulX9TKyO+vakS0PEYbW4s88jE1D0Eoe
 EbKp9gfKNdflvhw6+1NsJ4358vOduvODy93t/hh18cWFDg8WMEswm9sCLV74zrKDuclSWjj+0Tl
 3pzzQ0n07e88B/G2tljXVDsKTrjVIG1PC+mI0Mvegbz+/QXdqb7gSHqNO1bZIcKsa2amAUaUbSU
 M8jlSRGEeEDtdx3B2684ZOQKMXaMmSYRUv5FweaFXj0W/NmdCoYo8SdcrBSnIg+gGga0j1Lp5SB
 /LFmuXyKxNIf1CbjQ/A==
X-Proofpoint-ORIG-GUID: PNfOjF-Bbcx1fdrGXyyCfLL6BGokdIkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Is the GCC_USB0_PIPE_CLK not necessary too?

Konrad
