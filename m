Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A48C39BFF1
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021623; cv=none; b=p9XXKcjfk0jt75Kq9TFFjtWO2NKEBcxKeSxwa9kzXq+1uFQ48Z46LAXwAcVFKe4vImejJeim84HOhpWDbaBKBaWeNovOXnuT45tPU4d2YrK0E9fXci5yIk/z/VVyZYD85PK3qIBOCk/LjdmzO7p687GFV15kJFD0q5KBQIt8JzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021623; c=relaxed/simple;
	bh=VMNpgjn2vngkCQ2fsUTVUd85vdIjXbEJ1pGkDNawlvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTmwdxiEzwzqZtJOdfgQ0+CP56l0GjQ67HhjskaHbuTYBvKrgcsjQ+VhyhFJOyvk2XARc8UQ5Pxjuxf9Jnefvdgt/puffnTv++UCkeVFJzJ1V0UkT0fkzleyPMlnR9ioMH67uARLupQ0C3Wjbp7qAuM4JrnMJ/9a+TYwCch60jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aythbRuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOWOwLq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aythbRuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOWOwLq6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENPgfj1682834
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVSX185AgSrbI09fOTWvij79
	MrTIRjbwy7Bb3zRoM0M=; b=aythbRuDEL9m8f+kyN/1bOuBhBunx6ptFyZh24so
	rRCqeRzuKYYbiLbOs6kD72uXjQwEW3Dqd8DxtEhsF9/XIHWGDqmEN6cm5TznYK2g
	sARAAaLbJKes6c8FwRfRsDtIuTiXypv+LGPMtcI+pVyt3WJIjua3auH2ULzxC/34
	INJiqzMF2kIwQqDCsc94H5C5ndTcm56ptcdxs2lJEs8DioRFpRvva4nThqIKojEp
	j5ay9f4VU6s7nvhnTm55iXzMJq9fJNjfUsmcImMLpMVP0jWQulTTFJW8JwAs9va5
	wFNVnKRjQd2f0zx+ByYY7iEH3VyZsZ3njjPSO0xESp+INg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb01r6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc0b31ecaso206021085a.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021617; x=1792626417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=UOWOwLq6U/2zcQRVr9rt2W7Rg4XxmA8uUY4rIg/1hakFLV2DqqxPIA58e7YgOKvz5y
         itxY63uH7ftVrUt4PTT51WbVOUPKVhjEAdLMZnxSrtBECMAEN7fLrvvSkZG2ZLYcIz5H
         qCOocm8bxcle1xUJWx+pG294f8zGXLiwbw2laSCNMQlScUiGO3IDcLrZk4KrgPUKDB3q
         slltBjuLb5yx+T1Gc9eqZ1FKpPuaAA5TChHzYnG7yenfZ1IlOWjDN88Q685Wdygq6Bn3
         LhxRr7EPn5ZF+ROA5d960UlRPupc3lt2A6jJUmKt2f0+3QjqFprrfDpCIiLP3xHWW32h
         HmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021617; x=1792626417;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=yFse/2IgqL/CSmIF9834I7uzjUX2XJNhv7JwrGThytKqXGvDxDQ3c/USC0k+bRySKq
         EDlvvMYPsYKAETySo8l9tFPDWvCkvtkNOvZopPfnGhB8EXeTE0AB+4/XBf5enzkY1+Yu
         HrWA/ICLO+ooH7lgICsOQAldF8FT5zdmONdEaHoIKpVuXeG6w8+3d6d6rhycYUmEgf0c
         HkSYV8WgFkBC9vmTpVryBzmDjtILsozr4TPJQoR09pafGe8SDcUdv95ggVwJ8Mhm4w43
         GRUoRoJ9dnGCntAVqvpuW6rOmKOVLEFqav4XNWRgSax8tY4/ypbFmVqzi2RWz0rwy83s
         n/LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE8xKFOVMxO2TTvSaia3w4Rwkc7LcE6EXl6XYGeDgG5X8PmkE4jDHZ1kDa0xRqv42FXNUG0Fono7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk9vJTbLZHcm5Uy+RUpq03qlS9IBhHuFGjnGeHTNViZYGJA6P9
	TzWcLE0EOqh5Wk3OPNGuhPng05L3flz8XaMFBrp+mzzq4HWxUIJkOqwpraVx49zusLG3CiQgrXU
	raYOOVQ/74eq77MltXp77Vepd1eUC/Trqv44b8r0P1zomyjHOuC0t12xU1McW8wg=
X-Gm-Gg: AYBFou2Q1jentfPyNnbr+3JnZ0+Hpw1mcelxmcRw2joOqfHsAUt8oL2LFPl1ND7bzzS
	GZ+aafNBJyiQ+33y5uDg3YmIVHIc8fryQK6oqKlPA+biuiND9wMOlFJONOeRZA45SczaqjmZz7o
	F3c0YF+N82IWAeo3jPfCdSUM3B6aGIyNg3FR4/uCK38MpYaUPl+Xwqz45kti5YJyLX3Jy8P1PRL
	FFqPdLbU0YBZKyONraEwdDhi7jNJIFlacpuQQqPaQWpyuDjk5QxwnB4a+rOo+5sZI2xgwoEHG1Z
	vcX47MZ9KJGtAByKb1xREz8YwxPaTWPeshiLQcyaoLZs5X7Uvl0WRKwZjCuKXdfyZs/K1c7a84B
	0qnb5yieps2FtAlriamzk41tAMw5RIlSxSuPVseD11noj+eGUtUTuTOVYeLBPpyiRh2nnYyR0oJ
	x9FpcZoHDGJZEr
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144273685a.5.1792021617530;
        Wed, 14 Oct 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144271485a.5.1792021616901;
        Wed, 14 Oct 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d973f7sm934666e87.70.2026.10.14.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <woavboapzszyqhm5qrlca3iqrlq33j3ehy4u4mxsib7emre7yx@4mvuaqk72nj3>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad01472 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=M1rqeeilqGQJneHCTBQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX5G7odpRN1qWt
 rId2zDsQaBWrwC5UFYqsX1FVeiZNvFvLoyPQOXpVVsWgkifF13uyraiXKPHtr26PIH1CyRKoqNL
 dBChJRDTIsKZk4jQxgy2967+kGBowRs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX5QoreaODV/hA
 ZAKkYpM5NZm0OQMjHZ4y7HZ5uK6LCwoKzXWdGpZz2VguTmhAETN5E4WX/tdrepZITvxZp/R9712
 k5CHglnVdKMUH6TQ1sM6hxmJTfeJSi6fUS93ZXZoEisw5VkY3dwrww4Ls0VdAH5jst1Y4TIGy2A
 1NEXGF8+A1wmkyhQYgbORwighi43mzLVNY6r4Z1Aa0gS1M5lHQAEgFk3u/JAY4ekxKcznP8oEnV
 xnlLxG+/vhZrZPntJG33I0fXxT986P3FVEcx7/q8qOTRU1KZXDl9PxhfvH92zeQiexdrH9rrW5J
 ezftsLedtEtEdofwuR89OJHRNwGZGEyLurT/r30ue3fuVS4O2lg4+LctBayAsrW50jPFIdu/DVo
 bG8ny8DHQSbAf6JX5yyBsm4mXi7+d1JJRuYFWHgCVzF9v3JEoyauw1qT/2ecRna3jUUsrIYMWbb
 XB2Hmul+xaQ/7793F3Q==
X-Proofpoint-ORIG-GUID: bcCV7I2SXfu9Zgke_V-c3qQxYz-G1iw1
X-Proofpoint-GUID: bcCV7I2SXfu9Zgke_V-c3qQxYz-G1iw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
