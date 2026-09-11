Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC153A9DB1
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111588; cv=none; b=Yc/zIEL2Vtu9PBmxr7g2Ox3i++7i/7j+nEc3gt4tq1dRGHz2JbYeV2Pvj2jBWEy2o8GvpmM/RP/Y2dGFm+ON2dST7tOoKjB2OPTCKUT8f7y5qLWroluV6v2haFykEkBJVZa5uyi2HwJ323aF1cCjeYsjmwOSm5d2xfqSh9O6ZNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111588; c=relaxed/simple;
	bh=rZo4kyY0Y76IEd7jHHFyN/7oZ08oGYKJsxlI6R/hxGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDCQfcmiE+jUvfN1vFA7PkIsfpLpGjIwui66dYpyu3rYVTMq5JP5BkNXxRPMuVRP+0+KbPBnlgS15AjCnPt0YK7SBw8xCZp3vMeGrmxFVuJ7e4QsQUp4/uIII3jKTL/9ioOfKsptCrXT+zSgsJrJyfjlttFPubbowQBOytrLoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aE3pFWmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlRJw3zC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aE3pFWmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlRJw3zC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kGSx2879295
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9Kgo58xxN35B1PorN+OPrTr
	ld2F+horzEBlznhVNT8=; b=aE3pFWmd/suJkMvhi7LibpjTf9EAzPP+1o38X2A4
	caNxZ6+X+oSPomgRDPW1gmOze3n/o5Hzh9km5aSB2yOa9jH84mUyEamHrV5w810+
	znEbM+7mZJzzKXp6GS2Qq47IB62192fUYnBetkvXDIA6YnIp6IYMJKf6dJ+MuW3t
	cCkMHBOrO9JMj2UbKf5MQ16hV4INMwuXAc4wJRuHLfvnVaBExQVBCq8t7HmBOLKB
	pNTmO3oGIvMBAkJXqAYi3HbbOqivVkz4xeDW0IrGSEqiqNPcPqPRufX36QoS/Wzk
	EIswpg0AOYZUltbFkerekLoY+qRyfJqvsjqUE0MfK6l/OA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx40pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:26:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-855f662439aso968952b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789111584; x=1789716384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9Kgo58xxN35B1PorN+OPrTrld2F+horzEBlznhVNT8=;
        b=dlRJw3zCY0lJJYHu9hLtpj2uz98uoKQ05vW9jGy93Lz6p1DpM/Zb3E1faMPG1xtNQ/
         gkSfMmFojYAqjWVFcOlQxu8XpT6BVqM3ufgoNBNL7reFn925XKL+ComHGURkIcXKqXDN
         Zg7gj8wELG4KfMN3S4VAv128pq6Uytdx1lGjbVtA7P280yyb+C5FF54oAHRFcrSUPvhS
         jpJSf0bCvPy50rcIu/mlqSMXE6WXqCObBGakchwZdSQ3VWmVSVyqZc4Vmk68newNSYr9
         MygkyYTKSoOw5WkDVyN0l2c7l+Q9ge4vQ++IwM0nx+qiHi4e9Xfv/hPk2OJCY8cxyNzG
         lT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111584; x=1789716384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9Kgo58xxN35B1PorN+OPrTrld2F+horzEBlznhVNT8=;
        b=a2LKYl4VKDhJ/y389gNExMDXHw2lbMLc97BV9vzTpfCant0N+m8TqEsvVivL36tVj8
         HX0WhYcu+A/akQdwf5uUyMsUGv+HN/h5YFgCHTvhBz9yPW4EnlKV4xuSaaKNo8dtJi0T
         UYp4LP8l3LFoAp5WrKCkv2ajAd1aveHD8vuRgtQ69xUZNcWwJLU+Nuy0r0DjYcpDzjQ8
         tlRuO+KrOhVFhBiecQpM6frQARRVyrL/nGLBji3WUqQgmyBIvbPWeFmB7y3iE4NUEJKE
         BlQvy+z2Gd0ihh6FoWoq0PpVWuRJFTMhi+COkFrn41cPTxBpmK05MKMAD/zjL1GJ9xIj
         rO1w==
X-Forwarded-Encrypted: i=1; AKwUvBw36RbHbQUAHUNj8Y7lhHttXmceg+PJp1zwYmUBxQH8oLpldNiUNEAOuffSWOXcxYfVejtj/KDEqQI=@vger.kernel.org
X-Gm-Message-State: AFuF++munxUXOFUiTRM47txbhuuRrLyzghBqhKrKm1lV4xXu1rnkWIqr
	DhEPJ0VA5NOi3lrPx4hQhGoNmlmH6/nuzSZPIdVodJUebs6U/Mi9nQwdcKFwpbAvihhlXGMJg/V
	TaSIv8XWsmGoRvY+B0mToAd6H19adN5H+0nDHvXh2L3mWHKzPXmKBA/rTlWbHzBw=
X-Gm-Gg: AYBFou0VzMLpXM9F5pnrm+bcrbDoFMIPARTlYjFqOxqzoV2PTt50tDAOHJ9LlecT+u+
	VXydnXNyGhn4n1cGTi+0fLedD/MJXioiQNUpqMV3QP61RhF1zT80RCeNJmCh3b/o28fi+LIT2rB
	HVdJYXek3PWsecE5ISTKGw79aA9Jhm2fg3Bz58MY/cHif2o8t+ArA6Vsn15HQPNZ/eJVV1RS9j+
	2sO+SaR6PCuorwqS1sWvN2K3v0XbUv1raNE6GKszN7KoVHLEpfdPtPqmvmqyzJtgZzP2eGeybW1
	qiMgDqflGTl04VZ8Q/W8h+EausLGbMyV4VpTSIfenRxF5ltJxs7D6eQmMEL8A+PQ6kSCGsvMT9r
	cswnWDloYlK52njCSfYMJOaVh3SRvIV6XZbJVGWgtIH8=
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr5704271637.24.1789111584008;
        Fri, 11 Sep 2026 00:26:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3daed84ecc8mr5704218637.24.1789111583593;
        Fri, 11 Sep 2026 00:26:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm4632504eec.16.2026.09.11.00.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:26:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:26:17 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and
 PD controller
Message-ID: <aqOtGbCUP8CsYknV@QCOM-aGQu4IUr3Y>
References: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
 <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwMSBTYWx0ZWRfX6UQIn9+fSZ93
 kC3UdxrWTAsgfCR2Sm2knqdyTFjOdUQc3TMWXaCek+H0w2lPNJjGqUk0GY90LxsziYSKNAQD+/v
 GClvvO7Mw+UK2Fq3SC5n8vo/KWXL4jwgrkikuI9iPhS5vpywPXlC+dpTRsrRr7bP2rrdKOkMpey
 dOg20VNXKzXbYwaYyqz6+Ml3wac0IWKDntHyfMYd0uH1pT/v2NfVfgu/nHKs8vw7GoldZHPwcVd
 eYWvIuBLzqWswr5hFKzOA6oIkYXO74fYetcs+VeTLjCxuRAYpcCreA30ugdHIWi00yT6DYzt7su
 N9eRGRqVB8OGr7Q8OZPqObD3usLRyUHT72dl+Ojzli/u9Jw38pkd24UPqMqcL1w1D3spQR6IBqI
 J2G6nD6heGRScM01P36/OxoWGZ4Ehx3kYc/G4LuBE/w6YXGvbSWuCP2fx5mKBXpU2xzbCtZwgRR
 7qVqOegY7GucELl3YFw==
X-Proofpoint-ORIG-GUID: ihjT9z96pajEaoBliEtTSieUBD0kYWFh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwMSBTYWx0ZWRfX4VH2Xk4RrPIa
 UtIPXHKfiKWnMJo10i9Lk0kPV91TMaewmu75q/Hn/sVErBigvfZeZutlx27w5jmvol1vEyyHFlw
 NZ/j2eriWUwBT5Vln11DO5eCUeHq1uk=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa3ad20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F_sypk6m7XziQz7B7UwA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ihjT9z96pajEaoBliEtTSieUBD0kYWFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110101

On Thu, Sep 10, 2026 at 05:17:50PM +0800, Shawn Guo wrote:
> The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
> controller. It runs the Type-C state machine and the Power Delivery
> policy engine on an integrated microcontroller, and exposes only a
> status and command interface over I2C, so it is not a TCPC.
> 
> Describe the two ports as addressed connector child nodes, so that a
> board which wires up only one of them can describe just that one.
> 
> Assisted-by: LLM
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20260902045938.184221-2-shengchao.guo@oss.qualcomm.com

The link line shouldn't be there. Will resend.

Shawn

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
