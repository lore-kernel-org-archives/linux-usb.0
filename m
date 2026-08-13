Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4DD48D89A
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 15:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635511; cv=none; b=vE0+D6XiLH5M/FwfCJDs/7Esg8Eb0UjoIujmQZCgtLPUi40Yt9oLCu1lLIZegTDrvggGFZaYPGblCSJuQf+a7btGgmUDM4ZS+/UTyf5QsrfQEqM0pxe3gxAemUbUwn3YTFY4BjXEAJrgQiGQbZMhIazZ9+uyU1NKDUSR2+Mw/ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635511; c=relaxed/simple;
	bh=YDKpocMpUCcnLMlTC1bm9pWso+XkL3DB+FwfnhNpVbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrHNAkRwl+AWBbyTXTP8hXC7NZ4X0mSYO4MLRRC3p9fIeAJD6sOO9VZydMtTP0nALo5R94jg/kFNCphNAJOxs8dDGjIXYAHD0GDL82UVjZyhKAzl25Rehg/6IEWw0Tsy2qMyLzK+xi0CqGsIABb+bZfUZiqdUGsRJJcPzojk99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCGyjBFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QG6/5iR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCGyjBFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QG6/5iR7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTdq13706337
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 15:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=81QTck7ToasER/Cqp4PaOmSG
	5GxMRtjJiad/1RRYt/g=; b=GCGyjBFwS65JI3QdNm+vcRFXkbQQmRDOdTx1mYWI
	VO8WrPsXsBvlhxFLgpKPtyEoZfSktm6hI6cDI9A6yJvr0wx0LSsxiGfr/cboFcyT
	wYOoK6pBuki8WfOdjmkZOFBaC47+I46hrn2QYU+cOQyP+Zi4psUfuLSNzCN4sZs5
	Iuie6SfX+KoNd/kx0nYm3M7S08JBJ+U9nmtzhFLs4PUGtctQi6Yh1nE7GvXeXMhe
	LBku8Gd6PtMvEhEwEpcmkSEGRBwO8+7cAj8EAL+dHy9pX5vWcsmwnCjR6BcVkrc9
	B8AoL7YehE0L/MYIO1qgYY8zCOZgdYOkNUuZXN3qrnxmcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5jexc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 15:38:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so397101cf.3
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786635502; x=1787240302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=81QTck7ToasER/Cqp4PaOmSG5GxMRtjJiad/1RRYt/g=;
        b=QG6/5iR7HbhjOBvDWiBFO1YIcgtSrHOFVkxRPFoD2y0imRxhAhoR9RP1Da7PWJirqF
         hQro0vT5GjbOft0Fu3tCZQwKN7wyctKjFq4406gnU9XaZ+WjsnbaRCbrXHT0d6hNO9qj
         oVf359ehcCJlgzVmR6cPItLxKfY5yb5BCrYDYg3imITZr+p1HwfFLs5QJ433m0v8b2VY
         goq8dsjCnNt5ROFtSZp+d+uTQKAHQGlY2QX7Y7zX7ZHTe9B3h1eDaWZxx1rgQTMNmPQ2
         UD2m/VwVUDcVlLiRs+qKF7e9D8BiC1CHgxuadDEiqonQqXhnNRXqJHUkmyxKNEK/Rpil
         CNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635502; x=1787240302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81QTck7ToasER/Cqp4PaOmSG5GxMRtjJiad/1RRYt/g=;
        b=H2DrUWR/4hufFzKvQqTwtdgkTpjyikefaBWK04hRHDPD6c3ImYqQYLPYHGOII7kGCI
         /UMqcOla983uW+aZlb0ZU/pRixaXgJVqDsPG2MFfJwRa5o+5LanbMuqUBU/VdmIRmm1W
         cU/1X7p/Fm9jDfQojPgT3BH5Q9RI8XoQRAqjn5Lh4dP6B6m+4lsUlkfhxM12LE/LjM4z
         mkoV6EjPHQR4o2TfeKRYode5ShMkWJ7LF8/paZNziI9ECFy/hAS0WoC1wYU0xpJ7mVh4
         b84Xh5fYdBYyLgKGKFm8rUCRH0hMRoIqCH4dVwwORGgH6HMwnq15CZa3Iu8yL3X2QqJ7
         1HvA==
X-Forwarded-Encrypted: i=1; AHgh+RrwGk8VIyM2hALALcezAES0V8U28aSM+/DgVjIAVkbjyPw/D7kMbh8bb9ybfNjoe20OJ82G4EmqGF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMm8hl6nuaFzXFl8HGStnrvXSmUSt61qpo2QKqB7VLomwan2Zh
	uFpcVBnaco7lz3i82NuTSFlSqbylpWCi/skuOlMlpT/vnewxDKVe2XyBF9mhXISjQz2AGx+Zl9s
	1zTTvo3WKebKWdziwVuWr8UjaC8+tgj0Ouf2HiWP/VgBRvOTIkzWty8llkVRFVh0=
X-Gm-Gg: AR+sD12AHyVanPYLD7X9ENCFivaTMo04S8c0dTPccuC5oChsu98VJLb+LLZjYd1VSim
	GjuCkbYMxrP7oXaMZuM2PMG3yjEqt/QQ43GzrZ/YoTGj1DJvmN9uVuMeLiEqwmiw4yxsfLtheu+
	mt86QJg47i9IGgSBRmGGShf6xd90RO5SQ6KIjOA+k9kXTAWFl/JJofGmPxG197Q8VeSlEkHkw2m
	1LygrUz4mmZuLcaRKPAMq6dM1yy7ohny8oEjJg2qnEL0O7R23UTC3e6jvcADPU0ct4eChhA6bHT
	n+2oz3GGB7Uj4Z+q8nux539ucZXFCGUO8tcEBWrlPH+40rXmMTbDOTURi4iYkLLWMGOHPiOuZpU
	bZsstwJSQg4f4opIYbUf7yLJkCBzm889qxTxteYpzGrFhQ6ZxYFaff85uoRXJ7GV560246QIdAN
	IHujKPc95ivLPf
X-Received: by 2002:a05:622a:1a9b:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d73e3c8a6mr63097081cf.40.1786635502219;
        Thu, 13 Aug 2026 08:38:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9b:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d73e3c8a6mr63095941cf.40.1786635501601;
        Thu, 13 Aug 2026 08:38:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cdb8afsm281261fa.22.2026.08.13.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:38:20 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:38:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 09/14] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
Message-ID: <x6vh4vejt4ercdvfhbfgq7ca2nd5fhvgkp33gkztedthugfeon@o3eco25qtbap>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-9-8f355d7ff0ef@outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfXwyzaUaeiCiBM
 8/k26Usdiy/wdsi8AxTRAFkezdlyFZ8kXs99M+XBY/3ymcIN7LNSadhDk6dZg8HPfDuNoxm4WIq
 Krd8wyaupCxSm2cCvy/BNecbwrSRLvI=
X-Proofpoint-GUID: qekNQCdqbg8eKM5gqTaxS00dTQ6MAqlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfXwE1MkPL3MdMh
 c0QeT5/w/NFRCvXwywn3zxOfNxfn3e0A/WakJzJAYoZAvXUJ+jUr1vJDtHl6zXdb3EhSQQz7x1Z
 NK+uPgZYRNObICnaci7LTut1ZnlOSLAK0cYP15NnHeg3BrzPHDvBYSfrevi9o7/sLiipjBcEdEy
 OYKKIlYWad/lElCrUbsWcT1z5gaRkPICyo5hut3MLezgs9VZnupJi+tXBLjim1Uf8lklm6+SpxN
 8ILYw5+xbJB8FkJT+Yi3sYRUOVM5OiPd8dU11QI6bswuLZPQxdkQWlXBTfAjTuEOa1/qgKtlOn0
 usmAEvv+N1xcrIVMerE1k/Q9Z/Dt20mZA3qZDFEZkds3rZ6RygOxCH113Br8nKaqcD7dJcIEl91
 sHaGsbgyXqhiHf8U0sOg31v8GQ04Ka4fvNyv0UCwwvE1lPY0DvougkVaEcH59bMzRXqgYY3U+02
 iEsRpJhz0ABtBkDdDgg==
X-Proofpoint-ORIG-GUID: qekNQCdqbg8eKM5gqTaxS00dTQ6MAqlk
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7de4ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=okkz_DIgOYwYE9KhFHQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130112

On Wed, Aug 12, 2026 at 01:34:44PM +0400, George Moussalem wrote:
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> These clocks are required for USB3 mode only and are not needed for USB2
> mode.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
