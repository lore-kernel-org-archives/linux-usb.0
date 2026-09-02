Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8709D49E5FC
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358228; cv=none; b=PeUV14XGvu1pngCWumZLUxsvRaIvrfJ/1trLvarTs30UbATv2cea8pcBMcmsMDj9yG8A/Bnp+hM0jKcepBrvPE4qlsmSElKLbW1hy9EUiGyqYXCLMxp3gAU3VbuX5NcoJJB2FKG62zKKaw86is2baMGjQHdA8cKqIsJJHWKtey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358228; c=relaxed/simple;
	bh=YVhNWY3YTzseoUDSc4+pecJIfHnebROkelxV3G3LVzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tbm32GWJ2+rjEsToWQuMfOZUrvGLDvQulQQSC5rhlFURVAdiDh4WmLr6eEcP7Qt/EJpVqlFYbShPyFnozZnLMB9CsA5qMXcpNSTJ6F0T3ZCeuknSn83mDyghybu76jBMl8eGU6Db6y18yTEMZlEIY4PdeKIzPSp9ADBODRwrdz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBR/FAQn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvuew6xh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBR/FAQn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvuew6xh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR8QQ1647731
	for <linux-usb@vger.kernel.org>; Wed, 2 Sep 2026 14:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JQgfxxt0kxPrE2nrPSq4HoamEoqyDdParOq5552+rI=; b=oBR/FAQnD+5LItQT
	LjbCa2qPYxknSU6ohWgZBqYjF9UcxUlGY1ofyZI05XiF6eTiUnIWITR8sUKinthj
	4Sv2JJm1Q2mqegXocxjUOir8dETJaiWYajwoA5rHHZBxxVWtcXZsES/4kT3sdzUz
	2J5s4Dc4edyhm7eKo9/6uxH1jTQwNpDzfUt2ho14xgPz71EuVyjOXBpQaEyARMmY
	ckuzw2aFHZxwihnOgz3dxKHrUlLNLRLwSza67CFgpFZLLKfcSy3IJGcCQJqM50Qv
	D+oLNYrb6V62bhZK5IfJL2CSTJZU7aSmB7IB+DgjMj3Wm3UUyWnpvkC7e5Qi/lde
	9Rin9A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv88mkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 14:10:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-784f9401a7dso40157137.2
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788358225; x=1788963025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JQgfxxt0kxPrE2nrPSq4HoamEoqyDdParOq5552+rI=;
        b=cvuew6xhMX4xnKrmd6zUnTZ8A2++kjJpSnyX2v6Wsw4nRzvREuCNhcEVLrKUp01V7m
         iql/iD9ewQLyvbSeYmy+a3lDZ0sHrnx4kAyi90Firk/Q/yWY1QcuH0XSbi8VSBpHPDnY
         DptqGcFXNUANG0WHqS/svUArnytPTSRYeidIgnzXCJSnIlmsV5vFEQZDNdfpey0cGy7k
         oPG2ojI4BP1He2gjnJCtnYW2AXkM9ySF2lFnT+UmAY7kB+nXc0GPAbDK0iwmor9ffmCS
         7uYVC80ipkeby7ZpmoXTblZoqu81CFcVwiwc5uudkvflLJSyttwJv1ZYoff73Cs30nWU
         RUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358225; x=1788963025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JQgfxxt0kxPrE2nrPSq4HoamEoqyDdParOq5552+rI=;
        b=hX6zovsGNgadwrGxlEKAI/f1FOniLasnyBlZ4VFsDME2Q4eme2RDkCafK36GGdpui0
         5j9sWlTQuVrB/hZ6NC3kFFaUybR3r0ntUbD6bjsqKnxeBsdaBAQpOLjWZcUXA8bv6UJD
         ao2AuVLkwiuFUu4q3DHi5dR/oGuZxCgNvQMH+GXogEQ32R6p68C1GnJxmDPys4qVLQ8h
         jHEEbYFmN8cU3O3krMJd1A/HmeMRIwpW25x0+/4Iy7Hdl/90SyYZ2DQ8Cei1GyZ5lxYM
         Fo8Eunu0R6y+pCU0r+Cwk+maUz/cuu8sFNoDx+eUN+AJyJbCcioK/+BzshXHhOscL4cK
         Qz8g==
X-Forwarded-Encrypted: i=1; AKwUvByITx6PrejXTLXoj7QvMND1nAPEt/XNR0LsdzyAcszLoM9Wdes+jdBilX5UZq16Buu1dLc28Ma8kms=@vger.kernel.org
X-Gm-Message-State: AFuF++mtjPjFWju71KtDWszUoIzYOC0ptU4zkco8jl5J35f4z/0s7y0G
	now2CFQRTVExdBSWOASbmburwuHZDja9ogj1NF4ZbMd7ikvpZo5mXtrPJx+/R9GcYZ8k0+MwZDF
	fMkNCAILH7atfK6FJXUNSvNjeIGMigxN0J0KjhKZqbgpZoZebUJhsy4q7EdbuwcE=
X-Gm-Gg: AYBFou3tI/rhJ3IRxqCDy/Z3v67KtDG+mLMq12CsdoJ0J78pYI8qPeaQHAfXHUXENOq
	7lyTL5d8S7+CK0lB8REin1/EPBQlb7vRcMdxqL38eHiohpzmp8dNQjXYgRWeXNsk5O6CiWIdmmj
	AzXp75mRjBWjIDNXKJmKY85/SUK5gDCNgGlVE30v2b+PZHG3dO2xQAnm6VEDgtbY5Z6ehVaMnqg
	n86qrp8JJLWfboRWkvKDlC4KvndpI1z0YCrIZ0EQ1mjp/wPCDqQqH9vGMJbDoDBUhzD12LQ6dWf
	WBKh71tsjlY3Yej+t184OpylgOzAEaPBaezCracd9Bjw6WGomB5PGx2D9CujFg3EwQ9oORyORdm
	EgX9DGdZDdGb7Of6zshCMWA==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr650068137.1.1788358224603;
        Wed, 02 Sep 2026 07:10:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr650051137.1.1788358223963;
        Wed, 02 Sep 2026 07:10:23 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b2627fsm601771e87.37.2026.09.02.07.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:10:22 -0700 (PDT)
Message-ID: <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 17RWoSDlGjLoSNH_1Ly65v_9rm01JFf_
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a982e51 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=l1HXmQewNA_p1I5IbwwA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyNSBTYWx0ZWRfX1XENl/1Knkm4
 ElU/Is5jyba8AwPuCPl1jim/5zdYhxv0ErMZoCP1v2h0R5sx8prGyD5pHadq6Or6EEMaOFG0SDN
 piB/XNdyX0YG3LMgmzpjwgIpczo6VBtO0kqtW+GMQpcTWRO8aUTEY+z6kjirrvKpsDV5KKHQWAS
 suw7JFzgKd+9LhrAyVGA9bqveebVqhCREDx5egbI8ITJMzCd3fa6Uy0hO+kIE8prg0JcL8wvtV+
 NJduS3INxxns8JEj01BeZwSPobpwBL5s3ipS/7xgGlZ8kTBJmcsPsLfsEpEg6q8V4vfyM0BHzIT
 t1oe5ODdznTqVVep+h4QR4hpfHTnXM2+IXFA78RlGCO+KaQdY64ZQN6gnNySgLruzpLt3ucHtCb
 MX1t5ji6HoU4fJss5rfvX4Dcmz24G/Ko2kwU9YFOmM8Od2iDPbXE7BZApd8VK586dA4gpmnwXwu
 zcoJMDHMj2jPEo0ReRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyNSBTYWx0ZWRfX21f0r4ctcroP
 EufYj7rxh8JaffoOzr6PACtSpj1clZTSbUk874tndp2GMGi2+Lu2RLj32c6J/8IRCALfeGbSRwP
 EGgv4ntIDpnxsu1f4lNJHnqDmtqtVTQ=
X-Proofpoint-ORIG-GUID: 17RWoSDlGjLoSNH_1Ly65v_9rm01JFf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020125

On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>
>>
>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>> present.

[...]

>>>>                 - qcom,eliza-dwc3
>>>> +              - qcom,glymur-dwc3
>>>>                 - qcom,ipq4019-dwc3
>>>>                 - qcom,ipq8064-dwc3
>>>>                 - qcom,kaanapali-dwc3
>>>
>>> This changes the ABI without an explanation.
>>>
>> As per the harware specification, the controllers do have both 
>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that 
>> info. Will update the commit message accordingly.
>>
> 
> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
> incomplete? Lack of context here is not helping.
> 
> If they have these IRQs but it does not matter, then it is not a good
> reason to change ABI and you should just add the clock as optional to
> the end. Was this binding already released? I think yes.

IIUC the intent of the patch is to allow specifying the currently
missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
Bundling the DT change would have made that easier.

Konrad
