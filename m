Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65AB40EB83
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784120325; cv=none; b=I5SazRCo+yepT7u9BDUZc3AqrvghBh826dc67n+PotvaS1pYSUy4kypSktzpDsYfDai9v0b1xFsw9Q82cXPRmLhm/OOoLzGqyfUsziKcPc9E1KRJjqwKyJpv0YYTTrKYRHV3Hy0rbgy6sVHoXDMBaVsYnbyeuwOMgAc0/s2keq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784120325; c=relaxed/simple;
	bh=iJ+GhOuTAuqPkm0iRF0A4iS23vfSr4FjgVWthrGBgIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwAui0FhQWCLXlgd9TpH+5je/kC/obKbjWb1Vu+FixDuF+eL0T2tKqnGVg17Zocs97r1FGAQ5s9aeZo+l5hXaPPPLVejN4fRyvMjGt/aYpmN4uML0RggByfTLch1HJlywnYNp58wkjCIVcMDhTU8SUDV805IRerjiJHtprIHSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ru0nybpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+Rup+d6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ru0nybpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+Rup+d6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdUW83697872
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 12:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MkDqf6gLiwvri0Nfl+pFZPlM5YAWBQzYzpIcydMooR4=; b=Ru0nybpcQ8bWe0Xa
	K/+agdXNJJFO9WwMVBK8p8p7GDDeJALmyTXF71BQITzIeBfpyuqOURa8Z9eYqBng
	E8BT8b9kV2MSzoM2EJ7/bi27dTMpRzAWMjGdH/Js5iAtAXXIlug4Eh0Z15jzqBC2
	O/FCnSWpHgo+g6l+jTtMzoGFYMLGQTXNgLzLGpjgWO3iqMM9EJW4tMsp5xYmCDaq
	wX7rfov2d/z5IAMnep7G/cy1TGmJoZajL8vwrwMyNudeV6gEateb5Se7ZZVM682B
	6/KCmIW7YWRrMPLhexKGIwA+OeNExYpftPTFgLnsJhk5g1XGxPjA/G8JJf9+1JnW
	5NQZLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjcfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 12:58:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so12677081cf.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784120322; x=1784725122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkDqf6gLiwvri0Nfl+pFZPlM5YAWBQzYzpIcydMooR4=;
        b=b+Rup+d6aLPDIfGYIRdurR6ff087lTP0VM0YavVrluMann+pNbcxjunFvRhUBBDCY3
         wnp8mnTLv/X672BDlfrPPj1YV8Xl2RJXek0w7Hh46cu1UtS1NcKtm3RoT5py6qBf5uSc
         5I/Cm6phuKfdaWYLFh4ad3mZtkrTR8AFkqtdEmheJ8zKklDVsVtnfMI173mrhoYh7znP
         n44/mXZm1gOzQUKIQ+FCl6wvdOlUO2VQj9eIldW96SPb9ESkvJLivkQ3ST/cbCjjvshV
         6ksHLIGHkbXzywdd99AoVJuCS283gCNclZk70vwkmQsCgpoPNtHjXdCnFqIMgk3g3K0C
         ctHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784120322; x=1784725122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkDqf6gLiwvri0Nfl+pFZPlM5YAWBQzYzpIcydMooR4=;
        b=S7gf3n0ygUkfKtWg3k1k+8bq3Ixvfd0J72cV27o6Ela1R9oUynchxWYqnr7I7YKwjE
         C9J0U7UMkvJ1YklS1O9uC5QDYO4WUphlE+zZM9X0VX78VHISCHCa+5NuHnM/JGo3YZZu
         8flrP7Mul1rFNpZYhZ64ahWveYbOyZjGco9y+lSnI7VyTq5UzgaLpNb8+hF3YPn4McsA
         LJvkBqHfq5ux9aY6PZ/vNRYSyDejpYlIvTG/QsmY9gJbsbrlpSDd1Qu3SYk5dg0+W1Yo
         LsCFtCbE0kivBuvM7wj9h05z8iDOjV4xKUSvOmOUpZM63g89dsqQMH9XZ9I3gkmtQZ34
         ummw==
X-Gm-Message-State: AOJu0YyfVPxqqX3N8Mo6dwKbIi3Rn5o6JcXHhYownJaRJSH43A10wKTe
	g6UOvcfDaQcvPkeaVgIVFrSe8xpIVtgrcSpK7cY5fJIJAf9BEJU5Z6nlgdxfLyQEy2ogYV8KDaA
	47C4X7VSMTWBb5jcqXSRXKSrvPeQXzIq579igR0UCHPCAgkof03szJ0/vxeB26HFX0cI+o30=
X-Gm-Gg: AfdE7ckKIJEZTg4dOsfKy23Q5rN/zAspFHoq5GxbWbMnNi3o8s7ZtB2HqAn3ndluOO9
	o5Q/9F8Yl2iry50n1PeCjn6BQlylNax1wHK9eNAopMHEZXKMEkOJ/0k0LoXAdoZ2qbUqFifxAR7
	inFp4tOYzqE2SWXNiw8PdKGMUT+PHhe+IfT4vIZpYDodJCySXbdjs39jJ1ZTDWqTmnI5OH1INc2
	XaRml6IWK5doduxs66Ozwdk7PnXkdBChvvQFNgSjLYNxac+kPRESWchDW0cM4bTSXieZ9zJHRkx
	hFF7WT2s1s8cynAo3Om/YDFXn05jUAb8TFqXv107y3CflPPrwOdhESDLrof7sBcO+lhR9xoAfbo
	Zi1C9oHHBhBGw1pqjAoZKrhaTu1S/c6QwLuA=
X-Received: by 2002:a05:622a:58e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51cbf360791mr126694661cf.9.1784120321734;
        Wed, 15 Jul 2026 05:58:41 -0700 (PDT)
X-Received: by 2002:a05:622a:58e:b0:51a:8c9b:64a5 with SMTP id d75a77b69052e-51cbf360791mr126694141cf.9.1784120321062;
        Wed, 15 Jul 2026 05:58:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871264c5sm22347066b.2.2026.07.15.05.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:58:40 -0700 (PDT)
Message-ID: <42b1c982-410f-44f9-84ec-40d042bef1cb@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 14:58:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] DWC3 link tunneling state reporting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sven Peter <sven@kernel.org>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a578402 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=NmLephZMgBtApVba378A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: iaTKGn5DhkuYtt_uii1Fx25FhVvjaECG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyOSBTYWx0ZWRfX1XQQ2YV/qqwk
 ZWHYKU5QMPrEMxpetZxRo4U7cvt0N9qbj+kgCKIE0q9ABrC5R5iDRQfn3ZXrZxEE35gmjmegr3C
 5fEI3JbazY/7WdMdCyasdAdYmDd6iGO4yta7l6t3GDg3WHKpIatME3oUTx+XqHS67Tk2bi0+5ta
 USAUUkMYCnsR2IDcuvL9HVBhTKgUCINEP+s53z4UwyknkyT9j6VKyKF4HccteoTAHNH4/9vv9qk
 qayxsfErXQqZBDtp3Bbx5rSNA1694RQci8z68qUGqN/mZ7fPTt0E/iiD5HU0kZYh4INIsT40N5J
 KEwI5y7AMhLjldoc07YqXkAgvHCfrbJWZG3BVdCiy9lmPzu12I08a4OHiT0s6lnlZo8USOD9dxh
 A2UTjuAZm7twAHjeCGF9G+Fn00WGmUt6hNvU4ZItg8WFDPkplfDGcU7gTEoVjTNl50raBasfHUq
 S21FEU2XmKxhuCLN22w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyOSBTYWx0ZWRfX7hMWRV1IMyzi
 6i4IXMdv1Yqbm8o8VYm0Zd+DPAVs2dKKfuAbEpGaYdG27lri2PaIVaBu/rVXux426bC/6ExUqiA
 HWR4Pvyh/IcwVPbjyU8TrqzacWrE5BY=
X-Proofpoint-GUID: iaTKGn5DhkuYtt_uii1Fx25FhVvjaECG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150129

On 7/15/26 2:29 PM, 'Konrad Dybcio' via USB4 - Upstream wrote:
> Currently, retrieving the tunneled/native state of a running port is
> only possible on Intel XHCI hosts. This series extends that to CIO-
> capable DWC31 controllers (see [1]).
> 
> Note that this patchset only results in the correct udev->tunnel_mode
> value being assigned. Creating the device links (which requires this
> information) between the USB4 router and the USB3 controller does not
> currently take place on DT-based platforms, but that will be amended
> in a follow-up patchset.
> 
> Tested on a Qualcomm X1E80100 CRD board, with a (currently) out-of-tree
> set of drivers.
> 
> [1] I'm not entirely sure about the DWC version range (particularly
>     wrt DWC32 and newer), so I limited it to a reasonable subset. I'll
>     happily amend that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add handling for XHCI v1.2's USB3 tunneling and PORTSC.TM for
>   platforms that advertise it (!!! UNTESTED !!!, I have no access to
>   HW that exposes this)
> - Prefer the aforementioned cap over custom implementations
> - Bail out of the DWC3-specific check if `usb4-host-interface` device
>   property is absent - hence this now depends on:
>   https://github.com/devicetree-org/dt-schema/pull/196
> 
> - Link to v1: https://patch.msgid.link/20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com

+Cc Sven sorry, I forgot to include you..

Konrad
