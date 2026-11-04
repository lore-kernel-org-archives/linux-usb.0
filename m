Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787272;
	b=4qUbf277FvT7HpGChpU6bA/1EMroF3DtYSwrRmdkqiXXIukjgeDsdazQdDZFXP64E5LV
	 /fp6YxaefLUtkdBmJDGdbOgijI/1s2mR3BXK71KZh0nUiQwxyAOlnTNnmH4njhnhp21J8
	 tDad/fVlBLaBEnwpwNg3UBQ9XoQDfF+TJJvAWZBpv0Jqv+8Qg3GuX2ZaIF57aHTZE9eEf
	 JmvDc8gWgPjgjnEBsbxTT4pcMbe5JteqpzK/nvdTnkEybaM3BYJlkxAG3GSKro5X5vG3C
	 7g6Xu9DEvl7lNkyBNT7rDLyjrrb7OWe88VPTSVSAWXuL8hIdsL1WVbMiGiuJV3fKF9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cLXfsIn3BSlZhfAJJMoo1nlhN7NIXn4+o63bTiKEI/M=;
	b=xQBi2rK7DKNn52jEWnZzuuDNQ+Ii+ro745Mr6p92q7t5nZe5JEKbU0u0LWRTP7HLzkde
	 vS2sb4m1rZ6DTYt7R78znLVCjWMW+onrJzcUV3z904GqIHncIuqPYjVAr6V0+5rG10/2O
	 RGBe4gk3QM5jGfskdwEuJ2d3GEaBjffQn38e96ieYPzgM7zrYD3T2tKjOniuXehRAwEBb
	 U2H81rDCshZ5f5fb4VhEPAii5wmMSQ6uXvBJlUDLv24ce5w1AUDTASitNEuutBw8Q/UiN
	 TmHMgxY/IHSlDDNulbV4IBK5e5wGt3f+P2BMUbr0KDQ+ebfpJglCyfcxGx4g0LUgovQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IsvlsPoR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCl6VpIn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE32606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 10:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE32606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IsvlsPoR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCl6VpIn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KISC918372
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 10:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cLXfsIn3BSlZhfAJJMoo1nlh
	N7NIXn4+o63bTiKEI/M=; b=IsvlsPoRocbMJwZcfPWbFNShd64iQbV7jCU8A/Ov
	04x7Cj9Neqg/0942R8pC4bOW2cmvcgoxUGuwNpkHDbrOSIzcxTZ/4Dq6dhsEQoWK
	EUG+hme79s2NfcRWRqR9ALW4/WAk1lJ7Ms/mO+NVitkpScF3fMc8GHdpzbjVMG57
	K0sP2QDdAcLfJvs01yimYCAVJqSzKVXAjpZGTk+9ANykhzoEhS5le9xSTeSVlOZh
	5fABrPIPXUsZPZnvNamb4vDMCupmysbtQiVtyHZje8IlPaYJQ6/5OTqDVC08jAGv
	roJA72IvJWDVLtCPAUpsDa9e+gZJWknvGR/p/uMyDZiQVQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg9jyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 10:14:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so665810eec.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 02:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793787270; x=1794392070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cLXfsIn3BSlZhfAJJMoo1nlhN7NIXn4+o63bTiKEI/M=;
        b=kCl6VpInU1c6N03/BiuPk0s4D15pUfbyyBtTV95Ss9/5/JWPCOOOFWoo1vS3lKMpsV
         E6ZDUAeXqSZs+oh0v1KYgpvMxYwzFyyXpPWd/q9UUZ3j80LuQ3Zx1yWO6HX1r/IThGG+
         j5woa5QQCQH9RgPCf48oEhPYCk3quwlNoLBxdQcB5qPyIpl5FJ+LTTNsfrhENUacc+pF
         WwD5G6vOtFKg15feTjMTXUwhojReVb+JlM2ZTdZesKiqrB7bmGrKv9nHpanc6nX295iP
         eahm0PMhrYpA5/NKL8Bc87WAYzC4AXrWTOEPgsQRofmKS4fvbyck+u3Q4nmxbVXnfsAr
         /BvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787270; x=1794392070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLXfsIn3BSlZhfAJJMoo1nlhN7NIXn4+o63bTiKEI/M=;
        b=WlkCS1W2acbVYZSOBhdLwyXcay3+Z5dTzAfnpzQjqDtn6N/RR7pDvCbFM8HsFN25rN
         sIQYPdpRgtt8EezNKAo6q/ZrHetqdh5lZKr98tky2vsUuRP+gWjsnTpgezD2HqmPMXOI
         X7ldOWY9r4vCzD5Dzok9XgqtzNQQ8h0pUcanO8tOwu/54POJtNpDvwzE7jjfFlEh5Val
         7LAUAYmpFFZwCNarONEcXoRgsh2BwsBu+9YYXzpDHKOdmTBCmymYN3kf1CRshAFxN8km
         9QOGHHOTFdcLs5Pqj4HL2ekORuDqC8yhAvluks/1aHDLwK5X5S3VD0WyxEdLuLBuq6jo
         Gppw==
X-Forwarded-Encrypted: i=1; AKwUvByxHcDCB9zrAXondxFcOGgUhPRgic5EopJxJJE/5Fpae8LKNd0tZoTbqGfzZkZs2JA/WUCo+wjViVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iyaGoci/aDS8BkL4jZkKGfPz8KoGlgl5ArsJn1Oz1eQpgHJ8e
	IamiKzmpcousT7IuvmdK6C4MXNxgtSYodmay22DnIfPJgcn36PzWg4pNcehBFg9UJsatADWSu2q
	Weg7W2FMHFE6NiwMehqOh4JqOQ/q1e/A4+wsRwKCD1UEp4VJsjdlf4Pg/F+8XCHI=
X-Gm-Gg: AYBFou0hVXxfsyuhiWY7ufSi3SxCmDk23p8QMXkX9CUQ1NCnCkp9NRIlg9hh9lls9OC
	Ek2oza0GdQouTH8sBeCV2ENeD77WWAT8iiRzdiOlLxDm4HCvYNeEhNZd1dBGdRKniIi1vihRkmN
	f33Zsi23uRLSSJdNhTMjviWVVaTdXBR0jEKnvzCOmZ5oBJLZAQwHampb1+U12SIOORPjFGt9/t+
	e7tpVcZVQ+UfDZr+zyVAZFxE34fLm/V2Ww81vqnooksT85DE5q7ZNhD6trt3KOCGyT1udKMCGcw
	3kbHbFDB8MsWaQN0NbJGy/3pzMVPShtlRx3jVV7LLxehglvOt3dPlwWxmlF4+1pH2yiqxyqwofT
	olwvfxe2BFostWMWc2LcYVleCQkA4NDgyCxSIJgoyLZQraeFqC9EvuRB1NfDE58fZzPYL+XR1bc
	LUcnrY+fTqHtgQYjMum7dF
X-Received: by 2002:a05:701b:4513:10b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b2490b7174mr1583334c88.24.1793787269927;
        Wed, 04 Nov 2026 02:14:29 -0800 (PST)
X-Received: by 2002:a05:701b:4513:10b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b2490b7174mr1583315c88.24.1793787269372;
        Wed, 04 Nov 2026 02:14:29 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm7246183c88.22.2026.11.04.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:14:29 -0800 (PST)
Date: Wed, 4 Nov 2026 02:14:27 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdnsp: drop runtime PM reference on gadget init
 failure
Message-ID: <ausFg7DO9rsG-5pm@hu-petche-lv.qualcomm.com>
References: <20261104021503.1468519-1-vulab@iscas.ac.cn>
 <aurm1tM212A8jOSk@hu-petche-lv.qualcomm.com>
 <d88f8e61-4549-4a10-8509-a59698b6dcd9@kernel.org>
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
In-Reply-To: <d88f8e61-4549-4a10-8509-a59698b6dcd9@kernel.org>
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb0586 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=ITaajOx5gr1NGpWnbVoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: VMpJwuhQxP-rayloHk0USiZoEtUvijPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MCBTYWx0ZWRfX7DdP+Z35VBw4
 bts5kwcoUUAsRkiSIXJ5HrReUTq8/p3wRjlxM3t4MTu5qtpVbhUL3SKZfIRhqgoEcXvT2KrWsH+
 2xud3yGCA3ydFKbt49hyjcExd7cdLNIBf6B0EFUkeJhOL2DtKGheXvXBapOcEDSsKyFPZkBBPjI
 3LEMeVkcC89KxYf0La1xINcCu+LIPPoDRclAmA7z9xyhQ1NnHXq6n5JQoVEhbay0lbWj13H+R/K
 +hJq9un9M/kPUI1XjFo/g3S+i96GL3bIYr3NaK27ZyrM02jMVE66cdzbQ2zkejCqWwhM5yc2g2x
 GrrmDaHlY8AIydk++pqFSEK/7+dEc8VN9anlVT7tcHAByOl1hgjejRugbab2QWaBfQidKm1pK2W
 dTol0Z4qcmWLvk7v47RuCxUm2lQo8e73PwUfvI3M5QXBeGHdjXMt7b1UXmwxAnjlsMhb8UjwLwB
 h78GdHp6TxiJGYgODhA==
X-Proofpoint-GUID: VMpJwuhQxP-rayloHk0USiZoEtUvijPl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MCBTYWx0ZWRfX9+k8nDmtZ4ne
 yIDAOJ9kGnB3QLaZcUGxSEl08uDYUbdSYlVqHZAcij2LKnWvfYXb/cL5KvPupiPevlTj63JsOUl
 ra1007Byw2rjDAtWbUc+qBjmNQxIHiQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040040

On 26-11-04 09:33:29, Krzysztof Kozlowski wrote:
> On 04/11/2026 09:03, Peter Chen wrote:
> > On 26-11-04 02:15:03, Wentao Liang wrote:
> >> __cdnsp_gadget_init() takes a runtime PM reference with
> >> pm_runtime_get_sync().  On success the reference is dropped by
> >> cdnsp_gadget_exit(), which the role core only calls once the role state
> >> has been set to active.  The failure paths return before that, so the
> >> reference is leaked.
> >>
> >> Drop the reference on the common error path.
> >>
> >> Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
> >> Cc: stable@vger.kernel.org
> >> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> >> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> > 
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> You sure? Sashiko reports introduced UAF. Mind that vulab@iscas.ac.cn is
> a bot with spams with tons of patches which looks exactly like previous
> hypocrite commit approach - some security vulnerability intentionally
> added in between of thousands of valid patches.
> 

Oh, my fault. Thanks for pointing it.

-- 

Thanks,
Peter Chen
