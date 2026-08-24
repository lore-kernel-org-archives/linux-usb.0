Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1E3EE1FD
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561964; cv=none; b=JicOXPrhlBDDvmezfji58JKdsUq4o+AekUMRmjw7SSIrRz5BtgakV2D/MqQVkmXttZ5ktFlB9FuhnmY562+2epEFCkfv81sj8M3HQsTWPqf/hskD6jhIO+J4la659hIbUYUT56P8EfV+AT/L8TaUNmLglLNzdDH2abGNKngqp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561964; c=relaxed/simple;
	bh=9Yeg4pEJAq2y1vfd7BWO5GQQThMFfvnhf4s5AWl9EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWQzcXc7i7z6AV4B6TAF3GvelupRTrQkHrDDw0lBZi1d1vwPhdu3FMn+HnC3WhaUyofzEgQsYM1FZNzmpRwapDbfFI9neaK8l4FJpZuprJ9+9uYkvOiJtwk8NFO4TGURZJudH/XgkYaDSoNRrwA/oiePeaG8ALpdy110qhfVCB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdlAzuQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8sblAiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdlAzuQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8sblAiT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7Bfmo1815859
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=; b=YdlAzuQVQpyMLmwr
	8zZx/r5jylDIESIHG7/yJft+Xi2E9KLzrKi1FRjZKAGGrY7ZvBshpymEhLnOw9Xq
	+MtQX6w1fgZuk5AqDO1bENgCyHpdT4EyNKlepIjE6wcB64k1ldB584NXWG3PIQkI
	JBlJ/NDxW7X1OX2LfFKYSUCDdIsaTAoo0KUqZlcsNvVKILb/sPecYkdZvSjw+7Nk
	4kLyODpIvZ1EyQiJ3XRwjK8IWtQW3NvW8G8N3IzZh/5jN8XCCt82sZSnAznOwo1C
	MPb59y0sIZUJ/OHH5IpC6JTxQ+zh1J1BYRBHPZOCioUl8R9ebcWzIugl2n+KI+eR
	jDP0+g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgde1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:59:21 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c957141f3so9118241.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 01:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561961; x=1788166761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=g8sblAiT4Sp8eQVN+U3iqDGjT3dX54FLIvFZr6a+M4iZAIgu1+gaDqrT4be0oObqWJ
         zqWDs10dz81i1CApfDQ2SbakXWrprkNF3gyMC3D496X1+e4YuMnOpQT5E+2DmWC1d4uN
         GBLfUWk05fwhhX+pp2JIpKWO7Ezjoc0RXSU38SQ0bLnEc5dnuot3PHTFWPG1gPMlU8aO
         KFKCTAMQRjcpPBn2sNSt4IeP+Ql2MuGDi3F/iSFid6JIKsVA4OuCNbbL2T/SU9lzkC4/
         I32QinwAUczrWweby4ngnscgSUAHHpRh15KWQNJq5mtjjSOB/LcJfAPE44p0ikkjaaYm
         xKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561961; x=1788166761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=M/NLWtNDH0UUesuGQ9ki4QGGcJpP3bHbj/8hGX+1v0QqxybFBgl2m0T8IMxiyoQqn1
         ayyhp7lV/8Pb02IlXvrVwWlI01+5AGJYQbTFoa+lnr4bnKRUuslisI2NWwE8ekayy4TM
         cdqzPeQloLw8pinI7vOZhcyEbBnmRcRTbU4cGGYoThmbdQeIFK/qxRBaZULycmkYY/Pl
         M7YGJp6GiWzB0EM1l25UAI3TAcn6ph21aR/qOv0t3IuGkY2PpUdkCPTYHW+4840fLDDQ
         LyeTQXT8kJ2pHx4VOGYJoqpN5XY8Fad5S9FZDQOTc323/hAaX/nphr7Udjw/F2B6qT/j
         ItJw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Z65zOx0fBWIDa+NDpVe9lWd7wJRASQeB/mi7iFekj3aMFA6L2YMip8reowgm037TMJ1DeQx1xr0=@vger.kernel.org
X-Gm-Message-State: AFuF++nwdwnfW79LVr43KJRAYA06Y++oAbGvwXnX8oK2iWvDR6Y9GhpF
	Ag4C+DY7D2z/0kucIabtTikKWPWQe6driclcjqk5ldal4NQTCejNSJBZbE+0CX7avWBqS9g3R/0
	7SA9/EOYinr5wnQrA8M8luT3iN1OPmhPRyw7OrzXJhw+lBEEWHQQQ4yK8mymQbes=
X-Gm-Gg: AR+sD11wDaRIEgC3uqYHAGLvT8ucYZC7TsRATemtKMSb9OmOVCFUEMHUgGnN1PeG1wx
	IpfESa+6X8SN+ws7Sjrt37/a5h7sXZu7jK8WLjeMZPwGtenBjKzM7VykKzK6GnjhrYSc7pWcriM
	PGXlA6ThfFB3EMXUlblzlsO79HsMxeDK+qyzLYfu7i+iCL+WnUh0xN5gz18WItm4TDUZEPr+LZY
	Leq9J7ngjaiXhANsmKSrco7hdojg6XnFk4DRKcpX6O53flExPOseCuDYYwu5r3zVo80nU14G4lm
	OO/Elv2LuDoIhiWjoE1rlKguu251cQ/zM3RRM24fvudIrWo6LXrXWf3GI8sl96SUi7YYvXa2+Oc
	u+5s96onV7pAWJoSDQmOppNrq
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3657468137.0.1787561960814;
        Mon, 24 Aug 2026 01:59:20 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3657442137.0.1787561960402;
        Mon, 24 Aug 2026 01:59:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm8088185a12.4.2026.08.24.01.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:59:19 -0700 (PDT)
Message-ID: <2febee95-3c24-4244-8a21-1b769e90b003@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] arm64: dts: qcom: ipq5332: Flatten usb
 controller node
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
 <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX94KH0ICGEhs5
 7oGqYT0FQEPpuAvIKnzMkevArExFXJVKagoOt6Pla9DtvFiXgi71rnMEcMUBvQRtmyK0GCX0jp6
 6GXZSVFr7Ye2y072cediwgtfnDoy7Bq2NjoBC2B1ws8tB5G0hMW8Ls518yBT4fi4/VWsq5f6Itm
 GFzqSLUN3bTrw7h0gFR77edB9pDtSrj8rCJgEob525fNMvQhRZlT4DhWzHgr5H5l2X1+WLtIWSx
 js5nqgF/EYLnflFwJ30SM+tGd+4h9yj6tLgB4XanWZ9xW5BVjxb84a8p8Pu/ZFIZDw4fp1CEhPw
 K9sWGQ1xs+Qd55vsc+xgGftKW1NB6E4WTVPvYDd7Al6DrrHa1pPSUB+Ff5xM77WuGG4I3pIcQyy
 wQ7nMVwBAldd5ywc8uMaiW2b/zyILxwUbElwELMrQKpiazYHW466m+BrS0aM8W/6SBEp99D0X0w
 LirCVitWupMSa2sNCeQ==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c07e9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXwFZBfVpkoTwf
 HkSS2Pqq4axJVjXJdMZyUVXwUlIVHHxSAdbMy8foNK7dHByIUYs6TUaCBRwphfOWcYCDtfmfs/l
 73N+uIjX1maFwdKvicLXuuStSMATGMc=
X-Proofpoint-GUID: cuXjn-B3kuBM_kpX58BdkBkErF0lnLUP
X-Proofpoint-ORIG-GUID: cuXjn-B3kuBM_kpX58BdkBkErF0lnLUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
