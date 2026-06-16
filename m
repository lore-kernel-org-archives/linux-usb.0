Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1013F317142
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 13:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615793; cv=none; b=jSEWHEwbQS5cRWAGtubPPINgdabQ5xEM3lc1agknPJaJMbVRDnae5qDp/SpDNlJndYL6X1rfDudSqQHszNBndHuxD9UVY7wHGBHbCeuBCHnsrW4Sm52pkIS7aS+08W67w70epiLPjsztWpFxEjeRFHEUgY9MKsFMYsYvCUBsJsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615793; c=relaxed/simple;
	bh=49PdK05MfJuPjs1aRlijj6dHIPLp72WX74A/rJI6gok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqXKAQ14REDhfMo087VyMzEcPgon3GBFmm3IgYfVabxm4Kj9IQrMuunWc27Xq1p3KGAOslPpuKgrYUAVdenoBba8Jc8nqzWxlEWHBClPoNFO2HqVasMvVLWtKZqJ+YhsqkgD9CuSlFmWcirJsKwl7OploL9B41+rquZv24D57vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=durfiHYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We8PQEIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="durfiHYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="We8PQEIH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACTfN3474696
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 13:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BowRZ2AS+201sr5j8jJBVB2tSw9pjrUlTsmfC3fjNtg=; b=durfiHYNrkEpvh73
	Q462eTqBlCeQulUOGCwf/kh43n4TaCYOJVAwewBOqK4XpXk0wFSmnHdLq/U7xfpm
	l1pf/A5sNVN/qRhrSzWhsvSKFzKxq6iPLkq9Jur3t4B19aTBxAqvocq9yhCuGeAo
	9YfmcYECHLXFhEpthCZAZTIwfzHO9z+EbycTSaBQG4mOUPk9qTHw/wmkihsWOPrv
	/dUpNBfw/V3N7LqUIwYdkzSLxEgJDyNCEAY5BHZbegbbljvyFvG1I1XSU3xmzW1E
	XVUhy1bSW/X/Sqgtp/wklban5G9bpA9ro4xhs/9aTXReBnbpxw9EIk6DNrD/nDQm
	S9SPCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52t6qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 13:16:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158ecbfbc2so34847485a.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615790; x=1782220590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BowRZ2AS+201sr5j8jJBVB2tSw9pjrUlTsmfC3fjNtg=;
        b=We8PQEIHJ+LC5VHPYko/TDV82PZTMyoP1ZDgT2v5DBaqvbtcwV00/RsGo2vtfE5j6l
         1gb6x6vwa7fK3HB77hpd0Dertlk1M1AdYk2ITjeXM7ChmxuCUQ6LQNABe+iZ2UaG1iaP
         lLwSs9A5IUb5soAb220nn8Yfym3zUxofnFuSOqZIaR1CyUg4i7MoqMd2+za8OBN67Pvj
         NKzg+IRnaZTmearzv99jT/5MU4HtlxIy2DFbJRgDCZigxR/yHLZeMclPc8BHMvbwfcrK
         05v/VuyLcaeg/kW7O62CgHtqBYP826Jqadtjf7Io3S3Ae7OrHONg8NzG0aWt1Q94xmTN
         YzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615790; x=1782220590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BowRZ2AS+201sr5j8jJBVB2tSw9pjrUlTsmfC3fjNtg=;
        b=FV2HCWEsiothy65mPuhwH7uHvU4eqc8BJICGzTLhV/NHTKBHSmEfAUiKANRzFX0gKK
         2O+Fg+OsLaf1D1JSQWBJT/ZIABvhq3EiD1dVtIW/rsjepANjISwNIRQOWILPEE5hwxJ0
         qqDzNpSmQ4f2Z3Mp5RBnCkf3WcFvRo3qUGSHVpjJVzmV6KAGWpsYEF8yHufCk/xv1LTm
         UTexFVOoRfzIsC4Ok84W52ZzeFnIZNipDFMyNyJ4bOXC04ME0KYYtx74YhTVJI7iogcU
         gVeiyPR6+McxURcE75AHNFaIMsDOTWpeiW1+Y0Lf9PAmX0qG5gNkiYyrAdksn6NVQ/qT
         glVQ==
X-Gm-Message-State: AOJu0Yw1o3xqK802/nnkmZeEU9Jop6raf7WZ51cQQP20qu8mWa6XePVh
	xcGBzY7RRI1OrC4LOpxrOSJ8M2Xk+tTzs4t4uYU2UzFZ/HWtgr3Zfv7S2/72vNL9bPaAYpZQumi
	9kaYRjGV9QaDQNzKJppbHAwZJ/BKqxVNSnjNcyvxTvkdUjPhoDuReRylmuTBV52Y=
X-Gm-Gg: Acq92OH4I/6ray5Vl50eD0MmDYtqNeSoEuAGITm0Pl2AJECN0NezUWmI6xPRb3Rj0OY
	nl2xu+sKyT8syGRv4wAnYlM/EsT63bNvNHxk/is9BpgIkibk8/JACPpJp81wBaoN0n+8L67+72i
	kIIieyePlll9UaTJ0MzNqQI8yDSuX951RL1htCNILrtAxzRwhf4dWRJLArEk6E+WnvorXN9BxyA
	8GYbUe6k5DvKLuRTu06Z9pkNc1GHkllg0NJRcEa12OVSln29brm2zofFzFtAnHc99Vkpgvz8IuH
	M4guswzdqsb3SHrHxDdx2WmEOxcrX/jIGYbs86S3s3PwLxi6ihv0oLv/0YlS3fglbBnk3c/r67S
	4pqzmO9gOLmISaRBY8oTv3DFwGJ3njd5hU2c2s9N5chZjiA==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1677790485a.0.1781615790279;
        Tue, 16 Jun 2026 06:16:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1677788385a.0.1781615789754;
        Tue, 16 Jun 2026 06:16:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a730esm3517152e87.41.2026.06.16.06.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:16:28 -0700 (PDT)
Message-ID: <ea6a5d86-601f-4755-adc6-edaae29cfece@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: unregister debugfs entries on teardown
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfX6VzdYPq8OKam
 fjLnTm539WmOUgfpd+sZRd+p5/5aJ7RBZJuC1viFVVPNRDr5WBgMq7LhBX74qwTvwChlUQlxfbe
 R9T3p4QJ87Pim39BTMk45VWs1ETLVgQ=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a314cae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=N3f1q4s7xJVnOBk5yegA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfXwMmjS5k+p3yx
 oWoJN67h7mpVWgfJJveV9ncHz3ylM579DcaiBhkfwufKTrK+aoasRuiwhlPEV2qag97Ae7hVYZU
 nxQUVKBi3M69LjNucfiPjN0BYEbmF850tOjZPHLs1SEP4Gbm76VQWhECfXksfjvu7g2BKz7bnJ2
 +KDsPRvZyifVF1O9vGnm33rVyl9IeGsR0ziFA0kQwznCFCXs7MpB/1799IQilpJpUfOue1rBWnf
 52cXhygsRFzrKbn6byJ85KoH3nHCl+51g+gl/RNx9cBlM1tZcaXlVoEYCZkWfI71IDogFhssK5P
 s8Yev01F203aiDPh0b+3PFWNk6D78q0TMNSIvbz7qVEErYGnFyR3ChwWSBsjqkZDBda/m+8q9OD
 i5CGywkKV5Nmo9YQwmlpCsZVYSh74ZynnoONZILjakaX7t7xa9hTJ3pWMjjhUV9mpSEhF+m3R/N
 /Q/9pL6is9JXS96r+9g==
X-Proofpoint-ORIG-GUID: L3GgAXYvMRWbcWdI5DnXjYFdIz6z1a45
X-Proofpoint-GUID: L3GgAXYvMRWbcWdI5DnXjYFdIz6z1a45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160135

On 6/12/26 12:22 AM, Bjorn Andersson wrote:
> ucsi_register() creates per-instance debugfs entries, but
> ucsi_unregister() keeps them around until ucsi_destroy().
> 
> Drivers like ucsi_glink that unregister/register the same UCSI
> instance across remoteproc restart then try to create an already
> existing debugfs directory and log:
> 
>   debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
> 
> Unregister debugfs entries as part of ucsi_unregister(), and
> clear ucsi->debugfs after freeing it so repeated unregister
> paths remain safe.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Fixes: df0383ffad64 ("usb: typec: ucsi: Add debugfs for ucsi commands")
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E80100 CRD 
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
