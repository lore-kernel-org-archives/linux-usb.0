Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F93D9046
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 11:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388292; cv=none; b=WLMXe24Lv1AJ7ZrUaA7YJWfTmekQYvvdMerTbTWyw6yfns0tJoEb9Bbaw+G7n1Wdj79sYEtbNBzbHyNjbzw3T8wLKS3zRsOlgpqPIeseCxTGdYVsLOUQKFjt2r3WMsjbUZb8s2P2ay4gskd3NM6H4yIKM1sA0dJU1uhN+1Ogzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388292; c=relaxed/simple;
	bh=9hdZBNNto4XcSJBeJJ3ffJwjIQj5iArOXWtVnbRntZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGBYgjJEhlFxGpnYKRKo1BNtBIuCfg+y+Kor6HVhUI4N7gdcNJZ1seMD/FpGk8NTr/7Gk5sRb+nCgYWbfOHx8QO8epGHuaAwm/XHmu6WQOMeOViQu4ywkxYousySVCJiM7/7u+0tSyPABwFa1wC2uAE3J3cCS8XswLeGX9DyXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJe6ZZpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkxZGqM0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJe6ZZpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkxZGqM0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juLr3077795
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 11:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=; b=OJe6ZZpxWL2d/8e0
	G6CXLM65/zRgC/c2MbXwUuMK3hvOnNm49dYzhaE23hKVV7ONq4Qj4XXroP0pr7lg
	rtuxMRoxmtAh6zI30V+M9AKonxcSSEoQ3r98Sug115O6KYl/oxKzEckTtPNxQT1W
	I7Nx7M0Eye47Vicle4NjGbVjTInPeEJyVts0cdgaiRmgnpctYbC7oTViqdl2WX0d
	KlxFrNrXI7aoPqfo3V9N8ZPbemQSFN7DTjBuMs3AOIEBj2FRvckF8gIIUPcl6Zl+
	cfGbsgIVxgpox5TJS9n29SijrouOq8hejZCEGaYJ8gJVlbToiDYvYz/sJ6A/MqJa
	++KkCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yyns032-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 11:51:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915737aaf0bso18676985a.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782388289; x=1782993089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=;
        b=NkxZGqM0tRp6Vht8qYNuEH0LwOreH7rTj3WoKq9WNSoYOU/JEqjxNmRKJ7pJUwJXEh
         ugtven9o2o8MOpqJdUsnCFfH7/gC3bkVT0+YoCmd85J8+As6dtQuNt68m7yZpnKyCC0W
         qpGfdwiuQbuE9HThIom++iOFh8TwolmOeqJPn+PF0B7eq+yeUPx24NwNZW4uK0aTCUje
         LKAaw9wYjy6vqauDbB4g/nDjw/o6JH9oUdP2TvT6iwBagCoGLt0LDKpECr1d5gs4ZdRm
         mSULZjUiabcoe81b8sVkvSsYKfE/hv4IepwDn3UB4lAfspC8MGhU8Qxs8qBQapRXHK6R
         3JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388289; x=1782993089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sd7H9S7CirR3Vc3A8w6/dAsNp5ch3wbXoeVztDkNaSo=;
        b=Wfj9HGpNBijNWyp6HRSRNDBXHUdaut6NjRc3gmG5s0cWDzGRFodlnOhxqt7PZ51fuh
         urun+jNNm/hTuU1AbpmsWQ9uTaCZYwjnUvb4YCamN0+9AVFqHXPtR0EBM0+Tbw/qIG1g
         2H/E/Dsdht+Yk2aPeo8DaLz/lsj/IaVSu0CT/sHhHNt/SqPnUPNU2GIpLiy3KddcQX8l
         suVS2MCQzCIOr4+Sir+cueYkyqU3aipI50CIsQnr+MrqUIOt0eT0QDI2b7wmlYZx4tQF
         E1CMsV9ypo7lA25YXjnvv5Q9f2Xh6TMIyLg2GWkHiGgyuRhQOFE1BlHAsOHJCmKbniIJ
         zWRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EIsGJb+F874kBX9nTCyLz0YA2rWWygETVYHVBQ6rhYkXBc4BgocsBVZrvROJT/heOtZbr1UkhKe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZT+31NIQjdQU8gUIwkxS+Bo24ETtQ6IFwmVUnu2y0bJfwqQic
	RGSlTKjHcwOTyF08s4RLoH5TXkFm+6sb1YWbf2Jmyu0zRrEcHczvdsm3ZbIakmCX3FV1ymuMjmt
	PGxOxuGqeq1dKoOVY4sR/puemFOkwcX5DIOs0RNPj6tHlbKU5o0Jbkl0ezodUU6I=
X-Gm-Gg: AfdE7clBPctQ6Dz493y4B1Q6hknV9B+mdyCY0IkQ2UexWAuLGa2w5kGdQv6p1kC36dn
	VUp8cGFFwMCPeukI88UnWQGcauHeqeh39XUCk2ZvPvswRuOsQz2LZCrjZp66q43zl7MJbu+PHMz
	xgR7OFjC+ssjHB78cIti8HApr6oQQyrhfV6O3Zla9M0xBdtPzMOOLXjSnFJPLA7IqudcKDSMTQ3
	R+AMNUalCS+aaTFk2Po729cB/vmvF7Gq/aYno9neGE8SuXRx8bMfxhC11XN/VbyLqvFuMN6xmkq
	hNkOzet/GfgJb0jHVL0al5/P/YEHmcNXEtyqvVRVba2YM6+H6ux6dolAzO3s4sHyQ9Mouz7uqje
	T1X/21ixULLPmqTXvQpeuzZRpg8tJETyLX5M=
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr181340285a.5.1782388288625;
        Thu, 25 Jun 2026 04:51:28 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:8ee:e440:fae2 with SMTP id af79cd13be357-9293ddac485mr181337385a.5.1782388288048;
        Thu, 25 Jun 2026 04:51:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbba88b3sm169575966b.12.2026.06.25.04.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:51:27 -0700 (PDT)
Message-ID: <e628c11f-9e11-4082-937e-0c6e8455f244@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:51:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] usb: misc: qcom_eud: add sysfs attribute for port
 selection
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501170635.2641748-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfX9/Ls1HrcoFfA
 Zw1E6QMvl4zczurScANvE+6J7wyIAgeA6ZL5CTow8QhLzAC/2LhzKnte3KwdWhjoW/9ENhNJ1io
 oFP1RWRmi9dxyi9ZJEIPDF0TDvjBgdNFi0jKWUewZAX/KXLznKF1ImPJBiKlPwoIgqe69MXUSWT
 VfO5w+5NXpSkkbdMWFdFdpYif+bYZKZlhIDNAjnnM7pvUKTIkspZxBHhuu01pJ5qAcjvQ0bIb8u
 YZFrpkuZJNlYxjAPAnzIkT/g6SL7nagYwOumtlTWyCUszUVlQ/19JOQMdyCvrw/R0XpFmG4ANco
 DdPUTDfeZ2WYpH4+q/v58nTOFZ143RdaiG+VwYHJBd6G2fbh1Jr5hO8REZ3Cw2BX5q0g+0zKJvb
 lnPokwAhEXOEtq0rYjTcK3jcKqqtsLuUlvuYAW/FDV3l632YvOhdq6pTUgCAnFrSLxg1vhDWlPu
 N6gmvu5ABTBT7N1Jmbw==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3d1641 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Mi7szx8wPLqchxB2UhAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lzEaY5B7Lg9sGTVGIUvfIkPDmVKkeLSc
X-Proofpoint-GUID: lzEaY5B7Lg9sGTVGIUvfIkPDmVKkeLSc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwMSBTYWx0ZWRfXzczNEZxStLDW
 CqODbF55HHadXS2csmv2r46tphb+r5EuaeD8W8NnGe3PYSRRZP6oV+eERKu+hQj1oRyECkhVMdv
 HFLXJxwvQJCURiaqN+2fPbm9oQRKop4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250101

On 5/1/26 7:06 PM, Elson Serrao wrote:
> EUD can be mapped to either the primary USB port or the secondary USB port
> depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
> attribute to allow userspace to select which port EUD should operate on
> and update the ABI documentation. This is needed for systems with dual
> USB ports where EUD needs to be accessible on either port depending on the
> system configuration and use case.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
