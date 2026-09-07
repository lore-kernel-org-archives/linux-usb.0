Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE9E370D49
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 04:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754388; cv=none; b=eGnYtuC0V8ErVqkmvzOMCpjICBhbDP4B60ylVJ7hQ5puyVaddZYic1x4thl25sNMwyKKdIS0OSMddDBCsS/4ppFS90cUkURmLkE0lQ2V9QBd3FrlEL0wNGEjMBhzJr9E3gXR9tNcu+Od8IHVCl4YjGDDvW9MsTPd3/DdwTcRIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754388; c=relaxed/simple;
	bh=L3M4rtvc3A0eRf+0aPCA5opGsYbyXqlehT5TgFW1/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brJahFV4go1+PTHLtmBJYB4czwKLCKuG4uf+f5Q7694Vzjpk3GqgC0fClClkAXeWvRXB+gkkFzMp52z8TM0Zg/IgBPwBlg9Hwmllc/0sLLetkZ/MO9DxI5Jaa1TP1mpS/5I4tbDst6/Pp9r1gEqPl4jFIAWgpnIikr6Tb5DVlLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsHJKGl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UE1a7jEh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsHJKGl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UE1a7jEh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l5rv2390350
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 04:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=22U0nA4uBRDIsUT6kuK31Aj8
	XdWWpRxfWwREwxpHug4=; b=bsHJKGl3/JhFmZ9rswmII6z2tPN3F3HbElcCh39R
	Pbpq2XoO0eueR6GYh2s6ytMPl+SXmnhZcS2mejyjr8AHDTiE3DRKOdrYcs8RFecB
	whilhutlPHlhxlkcLroSeY7vpb7dJBI3oPEdLf51jSkBhtBrN0rNeOmqrvs+PVAV
	GvG4RHUJcyMmkTLHTbHIG4T2OuLLM6BQQwU10Sb6A+vBrLtN6R3bbUdF+4JlPIyn
	4haSS6/bIaqz7cVQvJA0tomu/xRCWxSM7PyAJIQuUw4hQ8PTyz7jXlrGF1JgQCUV
	/MGMAM+l4b103HSX/c6Nf1ELS1y1NtgQERI3+gtZ0LZUdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuemysb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 04:13:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5201370a91.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 21:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788754385; x=1789359185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=22U0nA4uBRDIsUT6kuK31Aj8XdWWpRxfWwREwxpHug4=;
        b=UE1a7jEhMBHXYVhqm8m1wVenQZgquLRFYuOlyKNU9QTyQMX+CvofnJTrkr2iPSv9M1
         lenlACwhEL1XQjqITjxPeQhcRymgnvic8iqCSzLOUFARpT/i9By1lxpXfYHBYwzk3+U9
         fcHg9j9aDlpc+xjojcHPZta8drW5lMeztphLMUA1xAz5mUK5x0vm6CyqxQ6jrFcWdWaB
         GVKOINXn4/A1p0E95a5nXewJpyQ+xg/99rzZyHywzGZ37xwEdC9uZJLthMjeaFzITfgf
         z3x5x7PE9GVgX/43iOJgOJ5TkbmhYelX6ENe+0PhTPPloot1QGGIpR9ZfR6DgkCPtA4I
         2fTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788754385; x=1789359185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22U0nA4uBRDIsUT6kuK31Aj8XdWWpRxfWwREwxpHug4=;
        b=ZWH2q5wNZbW5rdRotoqEMFWUwSWBA5AN1nT7NdMdVkgnKf/rmsP2F2pSoqRbns38gg
         be8ZuusLBpWpAFPENOvowgRXhNaMoAjjDvVU0Y9bJZEb/0WDd1578D/E7+GwRRt8Y/+I
         Agqw+gLPPwJMwIOUzoqbWmomyyerH5sOlpDHZ3b1DtsVC6at0RlmR4CDaMPTEBEMkk16
         /YBvJWjN368POEPHapU4vG6p3pF7ptll4EKEfm3rOxodh8jZLCX7jnjR9iYBG9xw83M9
         HAEtzx4gy2pNTooSrk4GlNGMV2E7s9h4B3i4j1h/me/SITfOBVvjzut8E21Ej8T17YAm
         TzCA==
X-Forwarded-Encrypted: i=1; AKwUvBySaM2FLK4Z0fAXY0cNEo9bj6oItSFSaH4/3pcJ101tUvqmYiDc+dd5rHQ3t5MKWRermoGmNTp49nE=@vger.kernel.org
X-Gm-Message-State: AFuF++kIr4AbMouDrmm55M330JdKB+mXDBiLrlwnGCp9m3U7TVN1J8qQ
	yWQUHjS5CKC5kUuO9dultRNC/TiJEH0VI15cNpD+wrUB/z3twTJK+KYznAjXNgLCBRTxkfCsTzd
	O/dmHStzXB0hywsB+8ib3NhYuPWNXUEPDzxnQMe35nxHLeDuY+N3lCHjBhYO0ZS4=
X-Gm-Gg: AYBFou2eTg4/Utr0AwgA+cc3jA8Wq+AkeoB2oBw8HMDT/Yd5HN9oyh3LdC9LuFjevsF
	NzcLPF9cx44Ufd9OcF1P/qMZBvXyxNCvaZYIDng2c1k3REDIPgLONRyW5XKoQDH63V0a5CkyR1/
	sQxEK4+NMQQ2pjx47YT1wjxXMcrQl5VusaudpDokDVycrzDHtvS+3+ubs73zUZA4HNFNSiC897q
	U2TKvLl93Zw7aPUBMZ05c/OTUb56PU3VeAxVve+RyNSml/WGRPSEzmjFHRD6bHvFBubnjL5SKQ0
	QGbD5ZpDhSrivYEfUrQ2LV4P1e5LRG7ZELVmvJLNN0F7/IG/j70ty7G4ujokX7/otDBBh6zw+l7
	k3kgN1AXW7OEOhmcORTN6VR8FAPSTKgMQlpUZ0AeOEwvWOevF1ZvRNdObzcTdZErGju4oEe9Ue4
	Dczo8qR2/lTy/i58Cqx8BNpzy8IkRHqg==
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32327157a91.20.1788754385555;
        Sun, 06 Sep 2026 21:13:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr32327108a91.20.1788754385032;
        Sun, 06 Sep 2026 21:13:05 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm15766714c88.8.2026.09.06.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:13:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:42:58 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for IPQ9650 USB controller
Message-ID: <ap45yiuO2cgnRQFh@hu-varada-blr.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0MSBTYWx0ZWRfX3VMW/ymN4bSs
 IhOzE6KG7yqZwuVNruiLyZS+ptQkeWLpY37Hvas20LADQrN5SmXgYJsbeE4AsZmyosey/3kuTBs
 +tnSrEdzdjqDArSi9OGel09rFuzSjW/vY23U7LSyUXTwQC78J44jAPFTuaZwwlBx6s29fCMmHtn
 /jUpTLxoeZvlQGgevioj6X3jDXm8x0dslWmkr+g5KKzy0k/HbwmaoVi0OCfvL0kDyHJsW8Sdy3v
 1TGMQ/NjeuzrtsqaRMk9Gqm9NU6xDkbVOKI3UsH7Anjc+yjTrnSRhx5Eef1I5jkoy/OFX89s06R
 IFeBkUWGB0shWVD7nkon3MVDtqpOiVWj9yUK7nbIVKLfMLK0Nt+oCSXj1PKKcVVR41W8EX1OPzP
 CSHNQvp7bBQA6RG4Btps7XUV+SYHsBl+ne2Veij8hOFGxeqJyfq2dcrl6i8QR9rp3z3L3lc4fCm
 ZxQa4LVXn+tSai19+dg==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e39d2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BlFRT9tzNkAzCq5auagA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: vFOfjVD8df4JPmcNN0M0J6iyVuNLxmuQ
X-Proofpoint-ORIG-GUID: vFOfjVD8df4JPmcNN0M0J6iyVuNLxmuQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0MSBTYWx0ZWRfX894JjC7e/5ib
 kPux+MDTsRhVmbB7UgKzLQtLYqWNhg9scCay8kdLfoDA9X4bAg+rb8Wc8dBzwFIXRXV9GQXYRmM
 hKkKD1U8qPawLl6o37VG0Xrg2iwtB8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070041

On Tue, Aug 25, 2026 at 10:38:31AM +0530, Varadarajan Narayanan wrote:
> Add bindings and dwc3-qcom glue driver changes for adding support to the
> two USB controllers present in IPQ9650.
>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
> Varadarajan Narayanan (2):
>       dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650 compatible
>       usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core

Abandoning this and will use [1].

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com/
