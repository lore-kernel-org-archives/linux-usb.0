Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463385;
	b=ojfWoV1kW/0tnBg1vYamZCZwtpxjUAQzoXpq+DsqSwdcKYYb7utPjKOdRItYhmVZLY5D
	 6jFZju1n9QgR+51AhkCCo++VUZ/HUzJiBsvP6P/KtERZdZoXHVqpZouSJ/wyvQVCvF8/c
	 SK9CkEsKi/JS2kMN8fuzJRdVhTPzvjCy+kHhOIPhcXQM29B7vNXBK0BSXAg5ZPlas98/m
	 JSVVLKCJwLn6QwpT1jQewdmziKOvFiMQxRPhy57Xw79NHakZY+D5IL2bQ3iYtfYT6qJdy
	 VEJjuiHb/GoCh2dRzl1dThi0o4WcH4a5Ynr9shi6N0G31dd99LNSUDT/lU3zKnv9WoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MnUPbac33oB7DwYYreQY0TnDm5ON3zVHeIQCQdeP63g=;
	b=OOjb/KE8BX/WYN6TmG6hZmCvjpL+GzrhD8NomgY2lG8GQ3quIToSxejEfTwlYpv8Jfu9
	 GAIisyjXXv1iv/5D/gVzPytn1JodIbC6IZ5opYcV8koSvjstUl8ISpnOyxhsd3I47ykYM
	 GkvpjpKRSqemshUn6PReEeH+YmkUz7rT/XLgolseuFOKwNWuBz981zGYyyhTEdsKVfihD
	 vwj48xL1vZkECwQfKpW1cevCLy1d0uSFUbWm9Q2ZEvbJifW0+6xeo9YWh0pPqwlsjTn9H
	 jXMJu+n8ya+W9LHaga8+VlsGua7cYft9teZAcHQdIHjsppHeirEeTjfdokOlRl2w1Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3ILnN4p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DnG19iGG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13691606A31F
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13691606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h3ILnN4p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DnG19iGG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNFSE647029
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MnUPbac33oB7DwYYreQY0TnD
	m5ON3zVHeIQCQdeP63g=; b=h3ILnN4p6pAUHLHtn6/uY3BEiVSbEfJ6mZxqdHsD
	apTOFnWsAWp4L+ABphodZgPm6kmbuzfDqEe1TPaHoujKW6Vbao/loP8ejAuAiqLU
	7ihGqsPf2zTWsGU0fqUSqw6pitGjx+yVq00OgsAOMg4a9WTe0ffppb23Ez8tQvQe
	U1Zs5VYyqhTBbuSfyEQ/NEFqs0crGvkACsIfPISMj7Mmz1R45479O9RytJ0tA91d
	lu9I5FrUXk4p+WZbjxHW9MSpeHNgzrYTqQ6aWPKanUx2aclEDIvIuvJcPzg+oCL9
	wY0l6eN9tmmMF4FE6KCeRvyksxPXgxj4M7yN24DvJhq7vw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg351-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 19:49:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so775598185a.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463383; x=1796068183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MnUPbac33oB7DwYYreQY0TnDm5ON3zVHeIQCQdeP63g=;
        b=DnG19iGGexn7py1k6oUcKtYtcXOjtCBg1tXtSug2KkVczJvTgdt52nFkFtTcEIeOaF
         aolhe1fupj6kscsXQwqMv+xRn/WFLDcxvOxrGzknSokW7jjYfLnF0YwMijZYo/xl/GtH
         cPFLkXxHlsKl/xGcUVernGYhMbYC0HFOvLfyZMwPAsuspH/14tPrcN3X7wwK7hTSTEEx
         vbpeOEH9/onIZrm2qDWdK+ZMiRhiYnyEnebO39p/BwtWZVKfZBYzIykMe1h5mDfI0KsG
         4bxojCDOLF8DkxbldKLbCmgb7VJ1KvbqxVx3F1ZGX4or6bTvFfjP0wpDUMPL7CXZoGyQ
         0O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463383; x=1796068183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnUPbac33oB7DwYYreQY0TnDm5ON3zVHeIQCQdeP63g=;
        b=o9RLGVIFgpKGPbeunU3Od1nG+7T6DPapipTrniT3782uLWzejfA7WIwIiZ9m8Z3JDN
         68q4GzkDzaB2EOJyHITrkXyVrvy5pIA3i7c6Zqct43Jx/4DIkfv6p0kz17wCqLSn3b/C
         fneTJBZehHA6x66WF4SG7MFVPLVUG72xol6EhdG45bGhL9lYNuprWfiXc2wd6OOkcJmH
         IYVmeiCgBiMAzkB8+kgVrZoYgkI5BOaEecxxKSeo3rdGM5kgQYiE4mv4x3LtafqaFP4o
         OCF3xmcKNdR31MjQS3NNdZ2zu+AKmD47me/HDauk8GbJTVcumItz7+3dx/AfKfVq+igR
         +S0w==
X-Forwarded-Encrypted: i=1; AL+hErFoGwXijoopndXJw1CxTRbZECapNC39nzlaLQwWFV43fgcKrXUPWFUrpkLjF4j9ywCN3+S51FzJTHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zBbIoXtwmm11jBapyduD/Hxxb0cwmlYxz/ROTShhgHkIRTgEA
	xpF6grZaA33j2MjGtG855buNSoLR2axHuUDfYchQtgWGir52BFRmjBKQ0YM02VaMLS5fe9zsZ9s
	MKjvpnOM8vKqIFvEuPj6s2aDzmEz3wWIYi9aA+zmv9sJ2K7QtLhe4u3EKaYdTWVE=
X-Gm-Gg: AZFdTZfAbVD8skVS2RNw1Q5XdFVK+lbrjwvFRevaP9lwuXu8RrU4kWxbGGnlw9iyqNM
	Firpw8uFPzZp3nJyFVDl0+GrQ16Nxt/N1WYKWMdc3dSiekFuwuuriwDnlGcfGEdiJk/3BVkJT2s
	5cBwSIApS8vXn9gbdCnwuyEOxib0AmgDyznz7samxtMNUomfxNRjN/SjZXVMIo+mlwg2YBblpjc
	VifBXixYVgSc0t8Hka+c6pfPgWPX4DjPS5/ec8IAZaMa9K2hxLcNbdD0kZCA0phMVMcUsdW087k
	GK35jEwRLRImMHVpAxHn/isrWRBMSun+QvcOs2CHSUFkn9dW6PfCs1xLMN8x2SNBA2I+PmpADS/
	McAUf0FpzLIpoCNsxMbe+E9638IIB1kU17a2dfDJKS7Q1ahK4L2Z3hRwG92097NHU
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949ba9cafe0mr2231789485a.33.1795463383096;
        Mon, 23 Nov 2026 11:49:43 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:93e:bcbf:4ad with SMTP id af79cd13be357-949ba9cafe0mr2231784885a.33.1795463382425;
        Mon, 23 Nov 2026 11:49:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm421919075e9.10.2026.11.23.11.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:49:41 -0800 (PST)
Date: Mon, 23 Nov 2026 21:49:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
Message-ID: <suwsp24d2g4wz253ucaekuvnbvxjwrkojn3rrngb5ajfurojfi@fvvkxzr7fxsm>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b0498d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aIm13q2IE7s_2A6kjp8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8BZu+GjC3Zr5
 lTo5AabDbwLs7PCj7J1ZHpfWFiLzssEUk0nhtSiTk42tw45qTQs2AIZpOiUMhpxT+aiCXCgCWhZ
 AfkYQZg9+bfcm6vPMGb0Mh916eTBTKgtkI3eo1hE4YIu4rM/Cz1QwG4Nj6yhaWercNgCTrSKyHB
 IgBafY7X2/ICkmxUl5Sca3bcbdyG8ci9NbOriYlCCV1xJoJJmC0C7kVEQI+fQGUP0vBTcOoH2cl
 viP7wLvR6p9HiUKpAhryxdlnQGSGqe+DeZdtWzK/OhDLTkRC1Nen3yvAs5C4Jgvj+r5GNjN/AVW
 eTucBqa0nq01/HaYpyljxYUWDWGslVNLOSeMYl6ep+5kSfjkWIo/connZ4siVNpnrkOBcYzZtcy
 sw2Z0wnn/kde1+akdwZwP8/dCIa7QUo9pa28lwzgu18bXPyxQe0bvGCBpWfAKWR04K4Hzfirh6N
 1UJsyyzvIY3gr1dR1BA==
X-Proofpoint-GUID: 4AUrXOz_aFTcuY8ldgxkn6twMSrAPXcQ
X-Proofpoint-ORIG-GUID: 4AUrXOz_aFTcuY8ldgxkn6twMSrAPXcQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4tQQeEPwOo+J
 HFBKk3BXH9UibJ36Sgw2DYsU4n+Y500LqI1sPYkfk/XAh/EFa81VEol9WnBSpD45VMFDk9S8Ore
 pFE+6RIv3d871jjwIHe0BV4Rz5n82Wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-23 17:42:59, Igor Opaniuk wrote:
> Describe the EUD:
> 
> - its CSRs at 0x1610000 and the mode manager register at 0x1612000;
> - TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
>   syscon;
> - its interrupt (eud_int[1], GIC SPI 189).
> 
> Hook its port to a second endpoint of the dwc3 high-speed port so the
> driver finds the role switch, while the board keeps the first endpoint
> for its connector.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
