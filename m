Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DAC3CBE7A
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268360; cv=none; b=V77N2/aPUQRvBTIYXmjFfIiifrCSNl6CJW/G8vKIU0KU9iuiHvRxemHMntjjd0fuDL4jDW+qmPQJLkUl4N4+bHpdOqiuYLgyX+cdhlPe0ls13jHSraX00lNpRZbEes4dPjXw5k/jWVRfpPOAOZm62iuRibRgOCxMCN1UELH0ua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268360; c=relaxed/simple;
	bh=zon7jp5adl5Y2eAG6oMwJian/v+Jmhd9AHSeiXrsZ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nABPP5jO8v3TtaP8EmMVYFZUQfB5ZUeO0pFEaxcgTjlIAoLqEEPqcesM5jaamzSuw72lqduCDPIC8VZDqPkrXg3Kw+GagXVbe0PmcHqVuvu9eNW46hTVgYGrxOBSkyNeEtNrGZagQwoTfJP/EG30t232K8zD/VQZ4pC5pEfvH+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcohuhmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYoZYdyb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcohuhmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYoZYdyb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJvL1136749
	for <linux-usb@vger.kernel.org>; Tue, 1 Sep 2026 13:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=; b=DcohuhmEjpLNEsP5
	+fXbY99VV61e7fZNptdUJbAuWi/YmvyDnnevc7K5Xkr7CEj5X4aJqdB88d1+mhW3
	HdYuZLQ+sG6fViTl6TYW0Qfrfc+FKq7PgQUA+0v++4qsHAHE+V4s1cKtMsCGi0Nb
	KjpAcNsSwoyJkpVO3bfvwSpPn5RcXNvzUxlwViTtydQwn5VFks6sv7jzeMm+P6r1
	hDpzD36D8r55NIWpK+RLS84IFhwrqSFhpPmyA4BgGwBk8Px4awb5XSi4XEFCVwa0
	o2uPwGAO215NpiTe/jaEKCqcjT8LzlCp/JM6HHRaV1/SPH3GY5IE50ol/ZH6Tfik
	ScrVFA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj04m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 13:12:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738be9df36fso91000137.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268357; x=1788873157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=VYoZYdyb0k2spOIVkCHTUcTQFN8K8S6stmsVaD7fnOqVxqdClLN02vheExuMRhJDJe
         ovCKWmRj6OUo38BlTGaoObJpWRRv0MZOD9F8CWTtKfcdcZZ4Zs13IfCgAHlqQOICFwqy
         7eCsemlIkxvBi5HV34bfjD8EICDXQ3I9DW37syLCd0+mhz+aDTtKjrjB1Oz6YVALca02
         x6eLxNwSijlDYK77hlXzHg0ry/L6LVfx2mgOcAi3dKsFG7V47YiOr9LZcW2xUgNgEpmZ
         U6APwn2m81bI5Er5dKOBG2QZ/Uh+t51yjDSgL5suEe3e4xX86kFWMVmZYsz6VyRQjGUZ
         GnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268357; x=1788873157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4svtbf1ssYRglJJD6Szy4t0jDZQ1u+zIb5rrNp1VYo=;
        b=Yuh00eTwwNef5os3nqRIFgLBuZmkau0c8dmLzBJ1nZrgbswPKaDmddZFUwkVsXtDYd
         KCe1Kzv+efi9rknVgiLqSk7SgMV/Eg97oLmhfJqRShNg3cRDAIdyc3u1NvU9MSgsIpMv
         bcbSrDXcdcg4WCWdjaKpNg9sWpuPMS8R7tP3MkIOSoMqCtRwkBXNGkHJzejY9gQRact7
         S/t6GpTIhr9ijjxmccbQh4ehu5x4txXu/2Se0RZdHkMWyxT2YDSBIn3vZxnaVp1abAWh
         J0fPvatrm8Khk5VxnsQqxJjumHr2rjlIW1sFDsuTFaTAUJK0fZ2viHx5P6j0GWsSVqEu
         GX2w==
X-Forwarded-Encrypted: i=1; AHgh+RpvGdpRb3KEdgIAkPspUC+nmu1wlJRrQEoLYrQ3guRyOMSaCURS2QrORgbHxI4oAo2Q/UiFKLB9cAY=@vger.kernel.org
X-Gm-Message-State: AFuF++nGvdXTQHyH6NFjJMWWx7Xx6m+b/ntBBuwmXGnlRpQgmjsn5hUJ
	s13ATQUeHwhODsMzMCn15FInjiZ5OGHeepsHRfG/06m9CbJ42Yrzvfje3yaWPaXyFQM9aiRJVa4
	fBfXPvaokKST/fnbW8SHwxM2JefGx7fN2zBDENeBoBZbhs5uUhHbt7NiSm06uMp8=
X-Gm-Gg: AR+sD13zF3hfcsJMfD9bYMj0+hgmILhcITw/zdSfnjACk6NJZdiXdK6T1t5jzsuSysd
	wUo6NlQ5ciczQ6tyMdHeYfOSVjHUiy2fQQ1ivxgnFs2u5i2aeNaLWhW5fBeFn6bFHB8eHpg1Cnq
	mJsxB/XQn9xwVo5IMuL5U8FGRozkjZKKU9UjUZnpNot0GSv33QHKuBiVke0iV1L7t/IfFE82sbD
	0D1vCjRb1jkXsq+omxfjS4/rAk8kL8wOXg2RBB9b+NZ6r2LTqfM2erX7zuu8unLt8RxC/zsUvjR
	fuQo5Q5J54QDrwUhq3cnBhHKhXVZLL1LDgKD/+mnEB+9fnTHaRWzmj5xaILsLkGxW3fIIhQE1iJ
	RFrp2hzhKszoTBCCJPbPipw==
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248245137.2.1788268356868;
        Tue, 01 Sep 2026 06:12:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4248202137.2.1788268354886;
        Tue, 01 Sep 2026 06:12:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b1752csm32498e87.81.2026.09.01.06.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:12:33 -0700 (PDT)
Message-ID: <8651e227-5038-4684-ba87-df74b89bb903@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] phy: qualcomm: qcom-uniphy-pcie-28lp: Convert to
 PCIe/USB3 combo PHY driver
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-3-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX3EJE46783A9w
 RrT8slpfS2rY+Z+88xMdXb/hF5UVfzeCRJ12NzYozH1zlhV3LlUq58uVZcdMMUQ9cAPmZAozTG1
 NO93DiR/uG81/rvQhGKOouCPWOqjwmY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX6YCalnJ4hYmj
 A3uA/UtoU4Hr83vZ8iZ5wBkH4yVAHt5iOvD6GY7acD1hpQdlEjRagRJ1GBMXI5H1PQFLPNyd+EH
 gDxjtz402lKXbbrdkA2mIVd3Szy4GRYHsDy0e6NFILVsO61ik01uTcxPjcrqm47WOyQZduRNHql
 wiDjpCg0PMcjUuctgMrwNwGLCrjVXnzx9Nzwze6JnA6LXXqVyTYeXGtvhvBxJ9fqN3MuX2atcYY
 UO1XnfxYiVXN9qSzCXI6lItrTqJCf18tASp3lUn62toJBQ2YAir9g+N/M1+ytAxK1sy7ulSXFPN
 jWJH/8OGhSBGwk8Tc8isMF0rLMOiGOAAnWjrIHb0XePxqbur/CEPhF21ap6Aiq3cXXTPydALV0n
 GPyVj0/YVs5GiFZlSzIGc0Udk5grT3QTUU0+HIVBv+paCmcDnM9MaLlqJAUI5DoNcCZwbeIGjdR
 4qTMyED3wUOw5aAWitw==
X-Proofpoint-GUID: GPmOPxChl-ZLruT0Z-u7R8EhPt5QRZ89
X-Proofpoint-ORIG-GUID: GPmOPxChl-ZLruT0Z-u7R8EhPt5QRZ89
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96cf46 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=1f8iOkyuOCog2pG1YhQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> This PHY found in IPQ5332 and IPQ5018 SoCs is actually a multi-purpose
> PCIe/USB3 combo PHY. The driver was initially created for PCIe PHY
> support only. As such, rename the driver and generalize function and
> struct names to reflect that it is a PCIe and USB3 combo PHY driver so
> that USB3 support can be added in subsequent patches.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
