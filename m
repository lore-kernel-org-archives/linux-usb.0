Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C693FDC18
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654732; cv=none; b=D9D96ZzN0PXW8cCrxT3SosfJhSxEk9maLqL8FT3ZnIBrV2IlnxA6FXb38gdOneCkj8DDc2zf4HQlRz7rHIIgqs2oHIAzu5Huehdq28kuW4REs4FnbQ2T/p9T3d0wLxVFXW/1QZVh/OrmErI8GRMwvryd38FoJGD313QhrsM+a3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654732; c=relaxed/simple;
	bh=v/cYHq+9Zr5BfvMheez0gf6QH9HVfcNYYiNmew+7OIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmUm0AJG8yDuz3ECgO/A08L+lvq+ZIBKnGti5tb8F5iykNT72QhwGqCafUF0JNacvNziOXgcW+YJLcllluWQr6xPNb6gFNh7jLQB201eyML9aIT6CC454ebockdbMLMkbzosWz0S0Vextc+lF8iiqij2a14dISayfgPwJjKF82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEG8+De5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgU3hVx8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEG8+De5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgU3hVx8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88RNJ1163447
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDiW/DqE3vEJli/4XfjwxmqQdC7yhM2Bt99ipBkeWlU=; b=iEG8+De5ylLE/WfM
	p0Tzq/yZle5i4bQE41gpSg8uTIpH3aKyVsvku+i4wHAgxsIJykui41Sn/Y5gr34s
	AT4Kn+KjY7WV5vmmaaSUtmuCB8VabCx0uvlg8JcbzbvtjljgxhTa6uUcfXUfKFUx
	YgUrGfUdcoARQ17RuINy54oKGR3XAZeUMMOdlgrMgaktNVMG+cRLUYDnd+gVJ8bT
	IZw/f37loFGDS0I5hx0CfHUwHTMaIS/5QyMcxKPApoKqRUs9tdbOAqSt5Up/vRuF
	IhtgqxKsZxBYMByXQEFb7K/4N0Bl3oeUCXMaYC6CYJPAzpx5BgfVfwHl20h6OHUl
	3uJ3Wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jjaph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:45:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so103395985a.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787654728; x=1788259528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDiW/DqE3vEJli/4XfjwxmqQdC7yhM2Bt99ipBkeWlU=;
        b=RgU3hVx8PCDMQlocjIb81ztemRPHoCyrEUaDW/Y92IEzs0uwS6XyY5DBwPjmu4qiDQ
         aQIk+Sbwu3qNTT77peTo5b8mRbIKtpBmJ9nePu0Zq2Lhc0zfu8e+1RH3ttIr6wj6psIC
         +qDFkLFolBggvUAKCNHZZIN8TIGxhsFg0gNbfkVLuCvEhLnAVyvGgOl8AHowz0hYrTm2
         IZ5vTLPH4HfqiprZfEiKCPsXRml0xHxtx3+A549eGgODuO+3n+L6+qCiXl9qGMTZKXJl
         /Y2i2RbTnzFkXCcUUgkzMsdMTDoU0x2HBnYloAhKHsTrb/PAVuRzqB58TP18BwJPpf72
         lHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787654728; x=1788259528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDiW/DqE3vEJli/4XfjwxmqQdC7yhM2Bt99ipBkeWlU=;
        b=nmH90bAd8PhywsFySOQ0z2dHCHAu/s0ptLqW/hBH2edv6rJDySuRhdVFoWt6ChAuMn
         91SEROrzWNNHvIbZCVg02bzeHBdbERKmyjHwlVdW+7Vr6/16wZGmXHmBKIi1s1/Ytlql
         0gkkBej7gFG3kUqg4ZbtfqEpeteRZm4kXWhiTnZdS2ufCNAdhxf1uuxGCSVFLymLeVos
         LJNNEdkCko8eGSlWfgiKpiWFTK/euzKm/tXs5L48tUlW0QaoCtSB914NGEZYTDswmayX
         2tGQQtJzEB1A8TZD10k7hbXV9hUk+7b0D0YSg4tp9p9BVNLxsBG/eaQTyJbS3uTuuzM+
         +NfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGVs3hqZHk7cRv/aBvbN6o4Vkx4iS6g1z7P9dP8rzC7F+ffF4MxzkoS9+MvlIbayVHnNThHUgP7Rk=@vger.kernel.org
X-Gm-Message-State: AFuF++lp6gmMpinbEyRJ+WLegucEQ55WdFIb5mbQEfoIPBrvzp2x/OOF
	L3lYxSLY3dSNbj3oeelbqZ2pUz6qoStauYCPo/vOH84EdH8MwkfYXNUFyylHI27IfrrZd47tPZN
	GzEQGrLcfCB+xWkOASZm99H94ipsE2hyZ5myy6rzjxcGbjDLUFKyoFoEM0ZrvXr0=
X-Gm-Gg: AR+sD11Ls694wsCldSAqr3Xl223SDs59bSo/2MtH1/O/M/grkKRI2KD1hnl/R0KulF2
	6fWRHFzYW5Gy/A9rzgPw/WIYxLcfeYoFyRNEjKoMuRSyAR+ARLryk+S1mOeV1CveO6Qjl8PWRyG
	eV4FVnL8hxY6Z2sKW4JFyPqyxr45jq4IIO8ZLH7HusnIz2+RVNgig+db+9TnPZou8Jat7tO9Zsn
	i69ML+m0I7azHGHI9xpXQn4ZBUiFddL+cs1BKa6CGBjW5hyO42aeaMXzRX7R9gqg6b4Ao16WT9R
	FP9dIOZt9tpQ5hZpmXYKUDjpoxOc4NZEEcK+tjVKSe18yokPK8N/V8CiotxkB576eKtDLjBMByb
	fsyFF6i0Q//WN+iCmoFwHg9nq
X-Received: by 2002:ac8:7e8a:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52df56452famr246031561cf.1.1787654728398;
        Tue, 25 Aug 2026 03:45:28 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:51b:8543:cbbd with SMTP id d75a77b69052e-52df56452famr246031211cf.1.1787654727942;
        Tue, 25 Aug 2026 03:45:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm2189794666b.51.2026.08.25.03.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:45:27 -0700 (PDT)
Message-ID: <3c643da8-b817-49a6-ba86-ced9f9e99579@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
 <906db71e-8f2d-4ab8-856d-915ff9dfef77@oss.qualcomm.com>
 <9a556733-79db-4f69-a149-b678c23cab7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a556733-79db-4f69-a149-b678c23cab7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d7249 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=WoG-0apm311xA57AWd0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA5MCBTYWx0ZWRfX2cu+FRwTRnm7
 A4Rk18eqDWA4zhaZt2L0mXUuL+TFSG2jeQnPG289//DAVZvBIzlz44TbBd+w5e7xumDfDA9H4MV
 94mw5Jw+zHsCmVIWuXpiKp5iKnQ7EM9SBaSYjmSJTl5JLb9bTweAMug/dsjz5epM7IbmtZqUn0p
 gCRUNpO63o8Z4LHVOsuuWLBfxMATSqkksdkMncJlNxNukSfUVQaoMDQpAKFFiQiHQvdfjbWL0TN
 3jG2MR1UYjuglM3ZcaRLCVd/MAT5O91l5xqClZ1toJuWQwJgXhgyC/9oqCoP68q+TAOOQXqsCJK
 6yLA/6KY0K3zvB0AdMpTZW731ArpGqvbhWBkmxBMBZ7kXeyKsNHkyje7KXu0uQvqEpchWHIeIn/
 vbFUvGGAsQVqfTz3aNqH62kxx0z9JPSMlyjTTsxaETqH/6RUJwJhc8qMnvlCkRFzDNaly6DR2H8
 BO7iYU1cN7dUHK/bg+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA5MCBTYWx0ZWRfX3/jpCgwatPk5
 ZKonysVAl9yKNip6nWY6/oGcebAxXJ4ysIUcqCK3MTTNOnBJAwdDrrQirGj4CC5UKX0P+JfGxFi
 kPtMIXkkcIBfEQWglHguUWrAq0n/ZAM=
X-Proofpoint-GUID: AmyK1E1y-3JR8jWwUZxkU8owYSPTWm_r
X-Proofpoint-ORIG-GUID: AmyK1E1y-3JR8jWwUZxkU8owYSPTWm_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250090

On 8/25/26 5:28 AM, Elson Serrao wrote:
> 
> 
> On 8/24/2026 6:48 AM, Konrad Dybcio wrote:
>> On 8/11/26 11:36 PM, Elson Serrao wrote:
>>> The existing EUD description uses a legacy single-path representation
>>> that assumes uniform UTMI routing. This was sufficient for minimal
>>> configurations where the USB port operated only in device mode and role
>>> switching was not considered.
>>
>> [...]
>>
>>> +				ports {
>>> +					#address-cells = <1>;
>>> +					#size-cells = <0>;
>>> +
>>> +					port@0 {
>>> +						reg = <0>;
>>> +						eud_usb: endpoint {
>>> +							remote-endpoint = <&usb_1_dwc3_hs>;
>>
>> This change alone will trip "connection is not bi-directional" warnings,
>> as board DTs override that endpoint already
>>
> Patch 8 on its own would indeed trigger the "connection is not
> bi-directional" warnings. Patch 9 updates the corresponding
> board-level endpoint overrides and resolves those warnings.
>  
> Would you prefer that I squash patch 9 into patch 8 so that the
> graph remains valid within a single patch?

This is a pre-requisite - each patch must build and function on its
own, as during a git bisect we may land on it

> Alternatively, we could
> move the endpoint assignment into the board DTS. However, since the
> EUD-to-controller mapping is on-SoC rather than board-specific, keeping
> it in the SoC DTSI appears to be the more appropriate placement.

Yes, that's desirable, it's just that the changes must be made in lockstep

Konrad
