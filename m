Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77372EACF2
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167012; cv=none; b=FbqdnZuRMWQU0oAT9MzaqvaHrEohktIDXL5uNpIIMz7bvQ6Hyr0NxbAWGX+PmTZZaJi6cB6Jj6iDOv9LfIb+tSfZl3+6j9YfPNUbiJBZu83cGDNRH64avwo4KNMQo2JG51gfra9z0xIMsNuwI1gSb6ixSbmM/NkBnGeaxZ8gAQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167012; c=relaxed/simple;
	bh=cCYOKZeBS/lMwQ4fkmgbGwz6LHn0Xx/xObKqYLjoD1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsrLX0gt5SAMKS/rVOX+NRncGXFNXi5RSDy4vzwYqQ+hEqQxESetuG9uRT7RZ8hbY1YGZA9Y81H6dwEX6YO7TH/MAWBSrSNqpQsiv/hr7rwGwEtGhHnfSVXEmHueP4aiRyLatL4jZWCB1tUl2RobpCTyn7McGvR4O9N8RuoxQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVzWV3b7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8HyEZUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVzWV3b7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8HyEZUi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xeTf2824427
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcP6LHGWxJXPulKdHOrCQk5ulFe7xWTVCyIQ7SbYJ0Y=; b=QVzWV3b7f0/LbpT7
	Ryhm2IAWsxJmMrtvlqOOkNuWF8eqSTntTIxhMlpmZiHLcngNU8A1dSXZOdhlRli9
	9P8UrTElSmH323Wa6UyEGgwFVvLHebOAvMvG8n535LPjm9tPkwi76DHQ1NGZulr8
	BCvIIkx6Ey/f9Ayq96/sIe++FYjQ/W1K28LaH4VWq7xydTH+N7CZrCJ+7epQQQol
	C4ttKqMiNgTDcO9vi5r3WBkMs0RaEy1BBlP+7+NHq3+8fo8a6m+ffrKVPZixUKpl
	R/UIrqXE8dGMCRpXxiKm7y/uWsq4Dcc6J9Rxv/L80s85aEwEldn1P750nVcNAQ5/
	qqCySw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2dkw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:03:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so4462267a91.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167008; x=1788771808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcP6LHGWxJXPulKdHOrCQk5ulFe7xWTVCyIQ7SbYJ0Y=;
        b=b8HyEZUiE2Lq9LyuM6q8GaL1hzGES+JodXu+/rx4uPOURQU7vwkrEILtb//+PlbCJm
         TJQu5n0oi1lHpaU3gU4DsRUv9rf0RDFI0Wjx4hD1+ms+GYG5V6xnjNMF4PmNi0guFfqq
         e4KuNJ7E+kYzySpZTwADTJr7jQHzv7P124KBACWT+tO/fNMPPr8o5lK/1J6g60dkRb0t
         hQXdSeT60bLojaNk5hw5VLlBQocq5KxnSXNPq39zgP7abNwc4HkuelR16MUl1gQM+Igt
         tnsXdIpBaIi7TwZH8s1Bu+uu7WIh6vggyravDeKXIBZjba2PnVSlLRWenRtnYMavRfIP
         0hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167008; x=1788771808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcP6LHGWxJXPulKdHOrCQk5ulFe7xWTVCyIQ7SbYJ0Y=;
        b=OIfg0G1ECcbfPPHHhtZJ/cmeT7fuBicWCy/DOHEkXKHELwXfvreJCsW3EwUhqfaHA1
         6pg13zid18AWoaZGu51ubqUT64cAY1HXbIphkzkTTaOMt9FuWBbaCkVHm4ZGmGEomSlw
         vpt5OSiK3jDrMzHaXBnSVuoesQj2w+Kka3SwCz7gT6yc04MM5TwJ7i4lR++N1h2tFj3E
         cfYmsMAYL0K1dBIlGfMQVOdK39hnRNUYlRIaZYGLTC9ULbiS8g8hjnBVVqAUmY8RHCPV
         wn0WqTjDQO/agiDfcznOmbk8XQT9mQXLLSFEDi139xeIlJc2smkid7ddg/E6i0VYYIBc
         sxbA==
X-Forwarded-Encrypted: i=1; AKwUvBxdco6R/Y+kTkW8ub2lP33pYKRXaC58+nKRdbBglfXU/vd+U8HjNWkKnQgeC1wAnSa7/ROjqgJMRr0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9UP9MXKUqFZGbDDX6E52fEtvKREx7+WGdFZLAoBGRqOHpcGPs
	fQo01ZOorxjGjkMnsyF4KitQeQ2tyGTt6n9yWPb6fQX23sH27vFYVFpDTjux1EhyQiKIBkBEYi7
	Hi6F/9nL7kG9smlatEHHmK1J8zNwOW/YzragUJ4htNub33pr/qiYIKAlrE+7h5mo=
X-Gm-Gg: AYBFou0/CQbyV028kHf9FPLitzfL7RoLo+tX5pFCbD3UoF09gpEahJ3pN0qswfTmO7z
	PPPdZ15IxQnN9Glyvl2eCY/gnFJzPe/1ycgmRJHhpWj2iHFhIoUlUM2PYxXBFTjiveQyGSU0pL3
	X9n4nSfCcTHh/OQV+BevYUZhF5rXSHYsB7DQJ1LZiQMAT+8GjjpefVwJisjpYkKJII3/K1wc6Hy
	1bTtH5zvj1k2DYunlBixq5qytlIgXdm2J2c80tfD2y4GLqHHHe2wct0tF0h/vK2fkZk9KuHdNSX
	6KdDJ1fIiwVMM26Oo1ego6dX5qb8ZrYz0q6iQ7OqOqppM06qQFST1y8UjZ3oUOK7uNxpGxa6LTU
	X7mkql7t3TI2AARPvE6fJ10tNC6cooo2Oi2phggONdIAX2nZgmJmtFHeW9gQo3I1hoA==
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr25276755a91.17.1788167008027;
        Mon, 31 Aug 2026 02:03:28 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr25276413a91.17.1788167007386;
        Mon, 31 Aug 2026 02:03:27 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm24522102c88.2.2026.08.31.02.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:03:25 -0700 (PDT)
Message-ID: <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260831-messy-ebony-warthog-cfd727@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a954361 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qatax8_Rp1FOiZlDYp0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 5Ls0q-XEq6EHyDl4DbikI6clAi-T_MRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NyBTYWx0ZWRfX4eCuH3TWRTOs
 cHFNiPqvy3TNcnn5Y9uydVwLd/b1I3euiATgNjDRJflQElP9bT/8QrwwlBbrKktYtHxQ7a5G2Lj
 99YKnbkshgSePFtWEIpO1kCS8IVvO8QwQIUWAj5Ww6oUw+nW9tTA+xwTtjMb/yz1ywTZqkgNiKZ
 G/cTvyNMYGYwvFyICh+VnhsBRaFqzxXOkzVXKDDd/7ZVVH5rILdY2kpxOAA8OnI5S9LDdlYr3Yq
 uKXGa9fIHDMBtePJF9C2oNOev9Y+ANwr8aN18ECdXOu/o8eNZ5O3Rre7qbz4eN7egyx0oL2wsE5
 314/fxQzz978CJPTprBsvT0jlxBjvtjVuJvkrME9xiTRpxm2w6dYMYHZTLXRAQVc12ynQE4teIF
 9cJ0P/90JtBQi6fd/sodB3B+SPY1a8bcVUmSQRWWAhsM78lZ2UoaWFNKwcZrTCFySWrX+fBMUS0
 wt6IvIPIrevPAFxhu7w==
X-Proofpoint-ORIG-GUID: 5Ls0q-XEq6EHyDl4DbikI6clAi-T_MRo
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NyBTYWx0ZWRfXz6RW+IhsjaA9
 iJuAR5GnLN8jyx5sYPJyDJ1h5BFpSG0F/PoX0HamqUfGMEjgIHDk5A7BS8nucLdDvBKKzdW8Wuo
 YLCDa+4W/xLYp5KJWg1RYLEevsaUqaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310077



On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>> Currently for Glymur non-multiport USB controllers, number of interrupts
>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>> present.
>>
>> Mark glymur non-multiport controllers to support a maximum of 6 interrupts
>> including the hs_phy_irq and ss_phy_irq.
> 
> Why?
> 
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Modified commit text indicating the issue in max interrupt-names for
>>    Glymur non-mp controllers.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/
>> ---
>>   Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> index ea60f7220afe..3bef18f9557e 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> @@ -524,7 +524,6 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> -              - qcom,glymur-dwc3
>>                 - qcom,milos-dwc3
>>                 - qcom,x1e80100-dwc3
>>       then:
>> @@ -547,6 +546,7 @@ allOf:
>>             contains:
>>               enum:
>>                 - qcom,eliza-dwc3
>> +              - qcom,glymur-dwc3
>>                 - qcom,ipq4019-dwc3
>>                 - qcom,ipq8064-dwc3
>>                 - qcom,kaanapali-dwc3
> 
> This changes the ABI without an explanation.
> 
As per the harware specification, the controllers do have both 
hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that 
info. Will update the commit message accordingly.

Regards,
Krishna,
