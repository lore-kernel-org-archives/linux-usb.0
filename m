Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0148EC97
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405613; cv=none; b=kKBjucziBtOEkeZEJKm/uHi9nEoxsYMXLZNF7I9mpgtJ5Vj+JCWRsahh6/Yk6fttR2IarMK16nSzUaszaLkfm27hcOms8dRKpPSkX2g55g04S5X7q3e+HygCHBMpWRpQxHjdQ3h39i4wrIdPqBQtsBKvJ3UQElabrBTagDrn5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405613; c=relaxed/simple;
	bh=Ote98vI9qz/LW3HtMpRzLbduL+1SdafZvtDXqvEYh+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVecp06cFZgzhWwniFWccax8tR0445iixursVCcpjenhdzsybKU8Dj26SVZpn0g3Hpdcq6/gF5xZNjP9jXOZrPruCHCk+OUHe6Ky4xyXwG/d/+1/O53SKhmMSdOs4LK+/egjH4dBdlQ6H4OBdYfgdPGMOlhk5v2Dc8lKnRgbW5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKezsfgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeWlVLdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKezsfgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeWlVLdW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P0F41168172
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F+LKQoTb35jRYglAbCLwIauW
	hdIYSRn5yyAB/X8aCJY=; b=JKezsfgiQ5BQB5yy1PZjfVo1qSvJ2na8uOD56GU3
	oUKsYcD1OyIsHJzKfxUIp42qr9SbNOxLO9XP+aD+Oqxw7gcrQZ2iKx76mvtwXFw2
	R307TZffIWrVnTpmhEF+unb0PUDaQDDQK7aoO07g18TRglNeZbZyDobikTKA5yo9
	L+NZMjdXXr4QWetyYnDhU3TtFYEKM7XlOjbR6mqMjpNMp7a/x+YLxefY1BIartYw
	CwrWDBpVZq+mr6ZdOVQ2GjK/rlJ/5QJ9dx2exS1ygiwsI3CXyph6ERYXaVDSc6LE
	rNFpX7VBjsmzR6f+Hj9gO/ZH5KSLc6dJ0xg32xDXnUFwCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8kg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:26:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso694651285a.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 03:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405610; x=1793010410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+LKQoTb35jRYglAbCLwIauWhdIYSRn5yyAB/X8aCJY=;
        b=IeWlVLdWvpaYwCPMdzwyPXlP6HbcdWf8p7r9kGaqK1VLHKY/LixrmOHBtVutuWucTt
         FUNActAD4qWZzegJt8vCVIYxifK+r4Q+QJWkcdocKm428tqh9EUqe0g9lqosdrzmh5td
         WA8hF45MRMr1FwObFXDGpSeRIust2gtb0MR0jJ9f807nhHrfqEQGtlsAYBRgTKA+QIEO
         IGY4PK12Evl1hQWra0UoW8w+TXC86PUVJeSsjjirf4ojBPK1+50ARV6yNCe4IFu7ecc4
         qKHmf8vvSeerw9dj4mahw5QG2Q+6igd9ewl+wjm6qJ3+ssl+/JR1SsF08D/rMKz2AGOt
         uMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405610; x=1793010410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+LKQoTb35jRYglAbCLwIauWhdIYSRn5yyAB/X8aCJY=;
        b=G86Ea2i3P80WZvM9Rzp9rtdvBvyyRQXSrLS9M4MAeWAYvbeBRAhIsGlOhQc6Cw2X1h
         h0lBLlCnjLSBKMKXMY+aZ3AT7Bws4V+3YfzP1P5l8dE01Mx6AGLWgBMdMhb5mgNouaWC
         DGEV2hMgJHZ/35h+iDNVARGLLW6SY0z62JlrkuDIicjlnCjTl3Hq8V+axjnhhn1IomKE
         iuE3EOZbSg9iW14Ke19h/NCBZg/ioCoLPblZZtLmGBV/IXEqF3AEE0XvdcZWXv6wXA7C
         oND4Gh7RtdK2L3ZnSx43tNqK83jmyieMgNhyf1yIvEj5+eCwm64ZJVJnHj85S8iejcYQ
         19bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCiothmBw33C/KxCZmlQLMpGtuEFpvEhUPTiQl+cJyiVPkj6WAiHlvYZuFX8xoYg91XGfw0iVshM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE1S8PlgvsbbjTOtO2HwRD9056lYMBqYoqmYyasCFxBQQD3BtL
	fr42kwRaWWrDMnxtrSPT8v0kFQpfSwRj2A9cRhKvjo0vQ2bnhXl/O7/RQDCtlgWegWIhJpSZYPq
	obohUS371KGyUHe1RFdezGqNj/bjgdPTddfFOb8M+fCbdbalSUYKAYqiaIwMiiYo=
X-Gm-Gg: AYBFou3f9r7SOD9B2PwsRqpe2pCZ+Ma70s6MJM5Df2Q+trNdq6vBMyp6KtvcCZ3daCW
	cipKIOAztP+TMCN9J128GlONkBF8B7sVZlo+bIGqmf2un3RQKfuh4f79Xb0dZd/L1PJ3F5s1h2w
	6SlALuy5Be3BOlqGALoxIsDG52mbeag7nkdpLLC5eh3ZPSDBEq9x9OjcFjoRcOU+IAu2g2+kRwZ
	D32C/X4o+hPi74pynyuj8Nd7mlacrVLcZ8CXv88K5xbsalzHWDE+OqrM3Xj9M3vDs7Ummu+vVLy
	HOqRqaI5RNBHIBCimncYeL2tl4optmhRYI8mjzjs/CNF8cfxlAg42JtWowMB5NVv3Xx6Rw5ELrb
	tQTtFPpSanfH6bGWi
X-Received: by 2002:a05:620a:260a:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93f29db9df9mr1156269585a.62.1792405610308;
        Mon, 19 Oct 2026 03:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:93e:5eaf:dd87 with SMTP id af79cd13be357-93f29db9df9mr1156266785a.62.1792405609758;
        Mon, 19 Oct 2026 03:26:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm281985745e9.5.2026.10.19.03.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:26:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:26:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
Message-ID: <dcdpigc2i3lfwisawli3dggr4otxquy7uwmkzn4tmuy7jns7rw@ljcdemrrdzsr>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-2-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX/nqWzJpSolfE
 Ja2rWAVLuo5r5eInN2Asnv2S1wHQ3EwqyhivFl5gPsC1S5egvd8UG4L7mN0/P6i4AeMMWHDmz5n
 gLxQbZpwqPHb/d4zbRb0TvBc7PJ11/Y=
X-Proofpoint-ORIG-GUID: qC_DfgEsMhp5r4Hd2TGBUmiqsNk1deZB
X-Proofpoint-GUID: qC_DfgEsMhp5r4Hd2TGBUmiqsNk1deZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX5EbTYg/6R0lt
 AqRRnJ8JCoV3fdan/mr+yv2RuGtruITGfefopJqu0J1XEnolgS54ceVweMIIjYhlafs224eALzk
 UQ8o2lq8wsvRxfTng+IB9YQuUJ01YyA+5haO7XY6rWl0pjoKtU9oh0l14BCJaYSiZIRo638u24V
 xrMJhffCOpj1KQ4M/06P2qRMWY1p9xKeSu5ofBpx5IqbD+C9rLEk74Pn79hquvPuW+9OcEymP4d
 rpovBxmBWXsW5kr2ibD4SbumaCPm6oz0NVs6ugXZwZCtHciBtyQaSDJsWYBNvtqZeU+4ot3CIba
 P1sld3dNhQGR+SUrRWSeW3F2EfQE1WSqflUDWenCtjRgazBk2wvRBwJJMcJvXEP7O/Aah6+1idw
 TBUXuymvJJ6kXvZjR7+8GUv2qApknppRp8Pr1w5u1DyITNFO+eZAAYo7s3dLy6RceN0k2sXUNMB
 JNurNK2b7VnN3esXu3g==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5f06b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YwX7B-rWpBLcgDuOc-wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-18 19:15:44, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
> 
>   echo on > /sys/bus/usb/devices/1-1/power/control
> 
> PORTSC.PR never clears (PORTSC = 0xe11) and the hub driver fails with
> "port_wait_reset: err = -16".
> 
> Set snps,resume-hs-terminations on all Glymur USB controllers. This
> makes dwc3 core set GUCTL1[10] and fixes the issue, tested on Glymur CRD.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
