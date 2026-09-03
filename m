Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF62390615
	for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2026 07:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422091; cv=none; b=mciQcIYQzO2yyTzrxGfg8zVL47+DTNqZnRJGAKKWHHX1dT5gWueCjVh35ZYyH/piI2BdG7p31n+L9wut8ZyQCL8SUjzXIoaCS5cziqrZfqJsCtSw4p0SK7wbrXbM4QnnyZzpsoMLdVYa0OsJsvowQ7VatXKWdxCUg4VXHyFxWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422091; c=relaxed/simple;
	bh=iB18IptzooZUR/n3KqRc65pMlvfNH60ITGcEGbAT4So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuMT+9DUm+PRVvdvpEwWlzLltat/aceQjmIiFPvlaS0eGtfbeVqEItF5olsvFJxkp4hVgN0L0m1hNASkhcoWMUmfrRPjfgvx/y5+HyXUmA5jSKUpr1kJcU+2gQPfKMfuzidiHqVaCiQVZUlE+VKFr2w+Z/U3+mVK6vBgnoCUzYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAskscrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHBiA6bd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAskscrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHBiA6bd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lZMW4023530
	for <linux-usb@vger.kernel.org>; Thu, 3 Sep 2026 07:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=; b=RAskscrQsCQcVvY4
	dm9EQJRTocP2QJ1QuFuAVLvf35m2BJoNnRJJ4ntBNCxWxMMrfbJ2pLxeZnKO1pk3
	v8BIH8PoUh6QyAnHlusBCCSRxQhNoSoSkdtxcRSv+Q+uQf2ZmRRhqms15LYn19eO
	B8lH+jpaAnXSEjsy1EO2aSI1MJ1x0YdzMC/n70OFjiEj+Yi+PVNZilQU+PhA/9UZ
	EkKxXIfsqtVZTLTbrpMa+FgzgElM05Q7S17GBKMapUPm79fZ3uMhh6QQ+eT3B3Sr
	H9b3LHmj1nZT37fADALhLB2Gx6QgfNIDtGkZaIVIXYUtsYLdg3xlQW5Y9V0BlUfX
	0O3zlQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc31g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 07:54:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso45315985a.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 00:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422088; x=1789026888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=FHBiA6bdO/yfmdoqaZVmSyUNrKdpqcOxvcJlS0aXHphwB8emL2YEuSeZWKII9rCxdH
         eJcAbq54B86hk9AufV/tk6CdLXODuiQyFmIRZLEf8b2UA4jZp/+QixnMVl9DNtiRbubX
         RXmYRgusvs/4oqkhDJ8YYAGnF8nHzQwuUViocUNdAJXy6Kj02YT0jBm/xmduYVRTl5MT
         j3M7AGJuoLnwpBOqnHveK03xKlYgZOzqJAQf8TzY6u+Go1hnM+FsGnhAgM97P2UzXwb8
         tWv8xSLy5+gxySnEVM+7Mvh2MwkoEeUpS2LCyBSEa6q09kqe8M3+dJ5M5H05t+nrhPoq
         3sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422088; x=1789026888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=hxwEhS7/kZXSwT2Jjwinhl32EX1Rom6uGj7XqF1/t8CeTbQKFsG57lsVbzUtGHnx48
         ayTUQu6ckadFvKKlnfpTtAOAtcdc8JqPEXhzaHZtXnvjoVfDzJwTAG54OBx50aKOKRhp
         GA1fvITen1a1/2mmJ5aEGR3OHlXO2kkoFWm8PTqamDgiPT8ddZeiRxEd9LEBsFzMCdZ8
         8qPRMbosmTgCdhTEVTXZlWWoFG4F7ph8CyRJtXCeO6lOVPYR6FBXN8TcQWrj3PoOmxcW
         xFC2RD34mZYh081yqNIVRVeVwZrxcu0O5ydmIR1ytDpTquutV5CWjMxCXgqxp/hkDHke
         yXeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiuVvUL9mKvVI6l7gFqZAX/Hl2Jj/Mul7wCkd5kA5JQ1lfoLbUEup8C1JdLSq1ylbpWzdKJiDWccA=@vger.kernel.org
X-Gm-Message-State: AFuF++kOpGktZZG8824afR89lQi5M9Uha6cv5uN8+uPxbnAGdEv9jsaI
	oCmYREEsUc5Uo89ynPx513DpAHZ7WL4RLVf4/S2L9s+ec4sZJZCwMO+9o7lfVns9e1KNZRXETuu
	GVKu7HZZpsSERjzG8/p/PQfeiWKLjqwNVEkTeDKoPOVgqZYIBfdWAcw04Zw5U8CE=
X-Gm-Gg: AYBFou0iFVEyA0a2XFKZTqdYJAfP0UmDTWYCFN+/RTcr/nF3Ou9UxHqvy/YxqxO+Nlv
	hDgWnv/s6fmJnqfc7T7vwha2P9p04xq3pN4kRWq1UnMy6ZFS9acuP7Sx0HwzWOcPVMcZk3OWupo
	AiQYWqwJ1byBef8sqj4ELYd5O/IbcMrXYZX9VVoLTvJ3v5WriRZBcj+ILByyDBRt60E7D8Ka103
	wbv5GjghtDmoNgzH34K4MA33411V/mStMfL7Pt7pbD2xPDV1A6HoSxPJkbr/+nMoyi5d/WA/hR6
	1ktT1cLHWBmfUz/PJlhdjjEv/o19S8Nt7sLMUjGcLrPXf/yXDbyDZQF+kvbSin16GnX7e2KECHT
	L4cp6ahio7UwHmlcrGzex6Q==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723271385a.6.1788422083255;
        Thu, 03 Sep 2026 00:54:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723257285a.6.1788422080144;
        Thu, 03 Sep 2026 00:54:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm60942866b.17.2026.09.03.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:54:39 -0700 (PDT)
Message-ID: <fe6dfaf1-521b-4818-890c-1bb1c413ee44@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] Enable USB3 for Qualcomm IPQ5018
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HF_JYeKKceEN7XABIuFw2d3Js7HWdwd6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX72xHP5zT9ZGy
 +xOiB82t9iFEkESn7RsH8rA+qm/xiIb2PIgRihb4fOfs1DXG7rG2RDJX+MZOeYlvS4HrXCJ4y4O
 w/1A3jk4IzsEs8ZP3t/kTIgvNP//G2UfMzgbN28QeoUgQbYRk966h130AylMFP31FAsKkt/ARVv
 1j+aSY8gFuKxcKINssZpagmAPpgqfs4oP6N8z5YlFiPAWJx0Ymm1M8MXsRaAosD097H7RdJJ4Hq
 8MezeD2OsxcXbFl228II8LDZkWbSf6HG1tdUdjy60Z9/xRNS9haUTjRxd+097H6Y1PlxWlWZP9Q
 Gb7xa3dMF4mztm03L8KKXZ3fx2M+s3Iv5cONwvV1LiLK+AGsZFzCNIVNjtW348xvbA2xsJkV6uE
 ukenbX3vqVWcyngrUWq9k0KrIRnjqKmDX+p1TFFYLXBh3kZa2sxOgDbzoEEnVEg5Iry83hWRGNq
 /7LpeN06x0AS/ODrNPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX+NpthC/pgllx
 FoMTdN15wcpJZNGpOt8hby7H73j+GOW1femRGnbRC3nSuWF3Hr+JKjF37aqvsMrhLTQzCwHdvNz
 vpLonl+H8OKvUaSVlP6z1yQUmTEmhNI=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9927c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cwIZyh-EchK-Zb-g6cYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HF_JYeKKceEN7XABIuFw2d3Js7HWdwd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030069

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> Either one of the interface can use it via the mux selection present in
> the TCSR register. Current patch series adds the support for UNIPHY with
> DWC3 USB.

I tried to get to the bottom of it:

0x5d_000 -> usb3+pcie (muxable?)
0x7e_000 -> usb3+pcie (not muxable?) / for PCIe1
0x86_000 -> pciex2 / for PCIe0

_however_ there are only 2 PCIe hosts and 1 USB host.. 

Unfortunately the router SoC docs are very limited for me.. maybe
+Kathiravan can help.. 

Konrad
