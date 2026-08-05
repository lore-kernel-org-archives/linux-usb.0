Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7483E16A4
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915783; cv=none; b=ftRdCbZcbeNIQZtx2evlmHNmwGZ7KRSI1RsINmJlUom5tGnDei+wBWZHflnCiwe+5zwOlC9b5xliTREyXgw0DZZ7Y2LGfAnu4C2ji+zFmnNmKNj1TfYnJ5jOtNyr2RRZ/aswG5ZJeuVrwPjuAJ8IyZvVG94oF/RcrtqokfwQDTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915783; c=relaxed/simple;
	bh=amTNGb+mD7w8vSU5rAtsxeWQhArbmrSWkamf543I0L0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGq/hegJ4M6iwWtZom0HCUCWedJ0i9k6fbDVsfPJCmTK/vLbVB4ya+saJUb7N4nYruTRCiyngyfiSQ5x/gUjZdtdZUONnnuCi7OZ7sN40mFBV7LM/IbY/OllW5dPd3eFmH52P/uDSMIQ+1guqVDYyi27IZmNmJR80/Ebeejbes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtxJB+4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfTmz4D4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtxJB+4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfTmz4D4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lEQJ1732108
	for <linux-usb@vger.kernel.org>; Wed, 5 Aug 2026 07:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7Oe/YyuErLOkXALaYpSA84y6Os1ajXDNg5/2GXwoes=; b=BtxJB+4TOr4qZNk+
	CLWE13GzdxT7uSh68CqbagmhJ/N2v8P1YLogcUZ7q9QPTVszOvpvb7nsdsdPCT1W
	+CIYxFyi5R/My+tIKqe0LqeeHnuUMROcMyPBgopSBUJ9WiKl1EH7P0UB1hQnbLMI
	MuSF9vDSUPhUuAfXprJY3wz3F4XuseABZ0tHeJCmSgOA9AzRfQxWNdS/otT+KCeM
	jtLCgsU5RLJVuP/a5TZxGVwcWKZ3t0Voq9tbEjciMr3yqEo8/9/QjbNKA5ShI+cO
	h4L9CMiL8UElKk8Fgc2ogM6/sYeOiAbk3hM3OKVrI8BWEWw0fX0N5BKGdK7Pho1E
	3BSeUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgmj1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 07:43:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1269919a91.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785915781; x=1786520581; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7Oe/YyuErLOkXALaYpSA84y6Os1ajXDNg5/2GXwoes=;
        b=NfTmz4D4rVgtaqpb6+a77XpczcC6L6REdZWliEYsjjBAjPsiDf3R1P1iNadKicSCIR
         kH9vmku/gF4xCyXTVmDC41JUaphFce/1UWHKClokqWs7Ub6440CkIOZrNm5HaX/9uqdV
         Zl5ldDCcanLxPi38yG9MabVS8AcNaHl8ARNlxPyb/NtyQg/d895sb2WziZ9XTPc8HgyV
         5KwsrzR/2qbwdGDdpccrlqKOHzM4cdrj3qQB5RmuhbBwWATgLA2WSCg4KVBlcjaZ5sHK
         vhOJifQfytpc9SGSnYzTE6WfKknGCfcysFoLG34EJHTfLsJAt0ou5ZOiWnrNIKt+9Tyr
         tFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785915781; x=1786520581;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7Oe/YyuErLOkXALaYpSA84y6Os1ajXDNg5/2GXwoes=;
        b=OCsQRyXmJ0gGykUabWipyEbvhI80lQpDilaN7VmKmnQmEbV1hJjXAM5WzkoGTF/U3T
         mBWUHAus+yxVWoZgVQN7KtKhmLHpq7AD8pNHZNGxMT8bvk63Q6sHKxPxNA25VKLgQfd3
         TMkxmQxglUooN/r34GEGcM1Fqyi17OXJfPAqWzyEb+VGy8kjc9TKQ1j0xgi+MdLcrSSt
         ALF/FQNNJq1rZfyW8lOFOZSWkT74RSC3+w7FbL1JOswEABMZX1N27BVKTzPlJqqfdEXH
         Vm9zNtX5I57S+2p5YgbRJfy0n3ccHyRx4VEfaIUiex2MUd9Iou8kB+w4fgkea8jaz8oM
         1csw==
X-Forwarded-Encrypted: i=1; AHgh+RolTpQwepk+X/ScfLieCzeeFdFz2PNo5reqRqvu32B6q9Eyx003ITJipv2L2e0okkgp2KVOAPI6L1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvywoC9K1FBYJ0otT9Fj9pvRR6IfBdXyZEL9x3Adgq4xHF6On
	2fTwcKezC2d19nT9HkNYtpL6Hf81EjPl1XX4sbwxZbjIt8KarCbjCDo/i9VhgDCifwMA+DoxHmj
	gHBo74aDQ52npTQv9gloSAOz7KZm8nFHK18XktgouDmNVnKZWRbe6MAv00OYPjsEHisCM8iQ=
X-Gm-Gg: AR+sD13rOCZQPCzALCADF6cO+LLnrDaKZm+XhQ0rkadDvqeCcModPV8CJHPqPIZXlp6
	ZpC8kV7M+iegX6EZHkS4bJojpsXeckQL4kBDlNwKSBaS5XSpEuAAE/47QdMPMpSIPSKR60aiwXe
	xW70MqmapeEk+W9Rbqopr04eEKCfq0Mn0vp91MWUmH2cG9SNTwwohnTwcm9hC2t4r1TR4RGiKqz
	jMhK+j74zhtMR0Ksvpgc2Eoy58iiVBeCaW97CfelqFxSl8Hqs33NYaAYT4eeAPGBpfRHm8M5wof
	1dacwHkoKwSpb54h9sQmaEsWAOng3iWQuTIVVOwGm00zhWeX0eBAyLmLxhPVCFXI+RrKuGE5TmQ
	Ctp01Y0X1rLas45ZzsZPqCIxFLhuJCvt8KLRphY/CNNRNN+nAi3uRJVt97T9OKsOT/BXf
X-Received: by 2002:a17:90b:1fc8:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-3903c6295a6mr5707836a91.21.1785915780647;
        Wed, 05 Aug 2026 00:43:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc8:b0:38f:23d6:b4a9 with SMTP id 98e67ed59e1d1-3903c6295a6mr5707814a91.21.1785915780240;
        Wed, 05 Aug 2026 00:43:00 -0700 (PDT)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903d1ad274sm1272999a91.0.2026.08.05.00.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 00:42:58 -0700 (PDT)
Message-ID: <ac93dc2a-9149-4ddb-a7f9-56010cb9e15c@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 13:12:54 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding for
 non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com>
 <20260805-independent-dashing-urchin-0b9776@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260805-independent-dashing-urchin-0b9776@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1OSBTYWx0ZWRfXxv0mViY+tRNc
 tzKxleiKo24dOZckKlf0levCSTTSdStnm3kCQlSosWVMxOhirFED5PLCkM4LCJUojK6thTbATV5
 Qgz+zWFLwkXqFXMSvM0cbLjvCHCUkEyfasZOOcZmCFsOZjwmxgwB+v/6I73HcL0kybxmiu6G6TA
 CKear1i54eFUp6/dxzRG8dZ0ODA/e0CZj75VDnb6IQ26RLx7OQKDyOr5c5hCBkQ6gOT0n4OGurb
 kZGAl4gbCKqhExvcyU5Px0idg07UuAumGgsYaCe1e9Benss1aK6vwgGDdcROMonRzqmVvKiW9mO
 heX1l9XhRjmuBogLM1xSNEqpr9neRLYSFS2ZIL4ebEpPlKtsHtCBNBcfI0QLuzZRRximikKJqgt
 9d4u2S3oRlohOfefNPkaOBOa7MeVotErk34tyjIUlOSG2vB/+8opJkg379j16U70lad8sv3e1W+
 V2PfHm6hI/s8MDLVBYw==
X-Proofpoint-GUID: ElB4maeIkSL8HFTDEIXF7-AlcJuTp3hL
X-Proofpoint-ORIG-GUID: ElB4maeIkSL8HFTDEIXF7-AlcJuTp3hL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1OSBTYWx0ZWRfXx1bRXFdXoYGo
 YKyZ8wUCN+8q1C+46REzYhUCmPWSxC91kiS+RflvfUEM0QM4eJMQvCEFf4vzt5NjqDaFR5gFo63
 en17e+lda+MbNZRl3zPEcPTXyIhuVlo=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a72e985 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Soz1QWBkztWbeeSyrHYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050059



On 8/5/2026 1:05 PM, Krzysztof Kozlowski wrote:
> On Mon, Aug 03, 2026 at 09:43:04AM +0530, Krishna Kurapati wrote:
>> Glymur DRD capable controllers have HS Phy interrupt. Fix the binding to
>> indicate the same.
> 
> HS phy irq is listed in the existing if:then: block, so what do you
> exactly fix?
> 
Hi Krzysztof,

  In non-MP SS capable controllers, the HS Phy IRQ is missing from DT. 
Also the HS only controller has the dp/dm interrupts swapped up. So 
wanted to fix the binding to indicate that the 4 non-MP controllers do 
have dwc_usb3/ pwr_event/ dp/ dm/ hs irq all of them.

Regards,
Krishna,
