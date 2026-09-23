Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367975678DE
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191051; cv=none; b=gyN3O3S+JHPv0mJNCt8Kadm6ta3LOcYXwQ8YKJHZf+YL7d3kbeM+G21DWn3yE1tPqQDBK5guoUaZdNWd9qjEJva1wGEHj2cjCO64Enjqy7j5dHDKRAd6VJuj6fu+ST04OZ/Sowy7LKnQa9wY0mzIlFTj7uH3HCTojuUJA2NvxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191051; c=relaxed/simple;
	bh=sVxADz0C25ROnrCrpEmG+TyV4MYDoUxBaj3hbFnOil4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1ba5YTCH55chHn+Br/uYAh6r58EK2F1lL77lhWGZdLdYHNYTzGB78dkntTBXMMx8MV648bAnrFaQpT6j4Q8hjzlpf+lXEvtcAWO68KR6EN6JC9nHtnOHfFMZLdbmZOG4sBix+/9RQAMf5uLIlffDr3nNVl64D78KvKtSBWd/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7DY+/41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BG38Zq/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7DY+/41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BG38Zq/q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGU1tC596394
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=huy1ZlkvjQUDRocv5BEJkQD+
	Ncn+4k51x/M19LB9SHU=; b=f7DY+/41EHQaYOhjcEMxAiuMDn6Pit45LdQZ8j18
	31CgKQRovpk0yhs6FeVNOsdroWcRfi9p3BE/GMQ3nSFztSO5g5zXwdIj52+mzdN9
	eSCsK0MHBdtbLZ7Obzd6MLoujCDQrwv4/JOJBmI6ydLG+k+jsb4waP5D/FV/lB2h
	/RcPJyKZSzSW2dEzaN0OB2Qcgk3dFCm3KwhDQT9N2PPKxj1rW8Lk+lE/0k4m3W5P
	KDv06xl4P0uq59U5aUGI5f3pEWMulkGkaOV+uMDll23OMoTBLoRM/RRVC+cQKg+R
	qtXh2ddg2Z1m1kDmOY3SmaOSO+cWJEsgX2es5L9Wbkij4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxsm3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 19:17:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so1912813eec.1
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191048; x=1790795848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huy1ZlkvjQUDRocv5BEJkQD+Ncn+4k51x/M19LB9SHU=;
        b=BG38Zq/q/HbrnT5KwrLyV97ru2yQMUEOjNH1DPsEROzt4jq9MSG5orfzn5PVfnAUA8
         0meuA18or61V4wKnq4REXIyv61SwHKA2URoUJY5rbS/V8qksa95FoaIlQZrq6awZBTBV
         6kN9AzzYmd3fqVY1XqLySF5IBACR16DEfg9nScvk+vOaPsL0nE3zWYOGrXlykr+udLFA
         ckScN19iCpxBxNmlUbV9MAmQ8mkqob4BkVKEZtIShKvVXU2iv5pUlDN/xl3u4b9KoxUC
         lK0e1AFIcBZ3DaiLbxL6yJ0K4eQDaatvcON8c5n+5lwPCETIrQcaZ9hmUga9uQZEIZOp
         xhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191048; x=1790795848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huy1ZlkvjQUDRocv5BEJkQD+Ncn+4k51x/M19LB9SHU=;
        b=l2i2r9OwHpXwkk/EJgKCgWsOtUwuAhL7rkt/XJYVd6IEyl+n0JcSOJoGh81cU26JW5
         I8XDYrXHTNDXI0UdLvTWezOKz5rjccxyOt0LTZ1UWmzOleXo89lFUGLyPolz3FX9O6KT
         ucGm8VIy+CzqtlGnL/kLrM1RhRj8Mx8pdcokzV0BfScPt+8mWcCWvfhMQE+TkD80AqD0
         /E0wcdylSKeBTxm7UCMEaewd1I9UfKY/revHqOum2Ri8UIES61drGpRe15std0r0sS/i
         E4Ru4XUntIjZTnuB70/S5br59gKmp0HnalR1L+SkMX3LsJYWp4V+w0bW1Kv8U6sZyAPO
         unzA==
X-Forwarded-Encrypted: i=1; AKwUvBy7byFtyKjTnFTBSVOACK7qcqHF9vdff5gkYlTf5KYujHwGEB5pmoGVX2NLBza4lSdi8M+ciN2TQkY=@vger.kernel.org
X-Gm-Message-State: AFuF++nG1tvNu05FNSGjS6yHr/Qc+SopSsyMrdh7TxB08W2uTFwL+N9V
	RhdrVd09MVt4i7H3hTFaHzx+V9EXbKEawe4abR5j5VmbyxDnT6nBFb3NM8BhMP2BjfZd7uFKEX3
	qLIwfGAGVHAEmgyNVSMGKX1f9z4YBBQjO0cRxCTGtdM10RwajC6eZr6ojxkNzdis=
X-Gm-Gg: AYBFou2giyc17l37bdNGlIih10WlHPpVPJ8LGFdIh7HI120NZX5i9lw1wUdYO4qZGDm
	5GVH/x+Rn413FAToMJGCrrlhL3LvzUvIHpshoJwxfCSRfwd/SVZ0JR4zwDTnBMJJPIY9bNG3FjJ
	CRlAe5xwaAlfJynQwBSg3/PLwiy5dRixCyW19GuqQBzWIkLFObeBAmsIO8l5Qjj50WFSWRGVAsl
	QFN2yW67ZBuE/cctURToFZ2dQOxR5voj1jGgFfz4pJonMhfRuxTMlD6Yp4HW8gn0DhYwQMF8NQE
	UyA2eFJ0hJhcjGUvPqDBD/kf0nwZAXRdb4TT6I0BBod/ATeCHEsw87U/bP51e9TGqGzSwxpKMvg
	cQZ0Vjr+uwIGqi/0VwsQo793JMk8a2iKItBc6
X-Received: by 2002:a05:693c:638c:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-34004991ae1mr85196eec.10.1790191048233;
        Wed, 23 Sep 2026 12:17:28 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-34004991ae1mr85175eec.10.1790191047522;
        Wed, 23 Sep 2026 12:17:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258204sm6486941eec.11.2026.09.23.12.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:17:27 -0700 (PDT)
Date: Thu, 24 Sep 2026 00:47:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Message-ID: <20260923191720.7phpf34zgr6jfzgj@hu-mojha-hyd.qualcomm.com>
References: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
X-Proofpoint-ORIG-GUID: FezRUI7AGNPbSN3HaQukva1SwqGt5ebh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfXzUPgHZ3T8pX1
 wGDcH3hNA20dbsdVaeaRuzlWv8iHjo5FlfzxueaaZZQJl78oLC2FNlWeE5S8mhgvC9qrVhQOnfa
 YhAStMOMz2OVRQTA1GAABYYqDIX/ZWuG1Oo63Br41hV/+W7es4T4Gmb5+sysW7cBgYu8ruTG397
 ivL754qO8oGri4SOrTOpFL1jUOxEe++mkXqtFdY/SZKMLTMk9+H9W9iH8BQk5/EGyXAJI8UZXid
 PrPRFP5PkWcEJZ+WHNlna1mTnlRqTJCR51JlmDU9aFNEbKWr5vMa2Upv08O2XvhoeW8d+AmZbXz
 wi0pA+jExMw1/qJftB4NW+yXI3yO2F9ENpd9fBLJAiXSoBPJh0EJ0Hr8BmZa+nmOteitwfC4NLz
 Qu3u6ZYw0tqR7MsbprQpiKzBJT4O688JUmeVxqu/cx4uq1epdMP7cVpw73EBgF4cHGIXLiWj4P1
 AmimPVNXt2dI+8vZkbw==
X-Proofpoint-GUID: FezRUI7AGNPbSN3HaQukva1SwqGt5ebh
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab425c9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IV0E7ZXFCpU55wPcHFgA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfX+20RlZFr+sc0
 pwExvWoK2fcCZw0DUgJQLXPZKx5LadtBctTmC5QXsajjyZROTLDO3us6+G+u49fVUtsf0eEEX6Q
 1zkJS5FBDD0JwVsCTKysRTAI7e4dxrM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230076

On Tue, Aug 11, 2026 at 09:38:35PM +0530, Mukesh Ojha wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document the Synopsys DWC3 USB controller found on the Hawi platform.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Greg,

Is it possible to pick this up when you have a chance? I have a dependency
on this.

https://lore.kernel.org/lkml/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

-- 
-Mukesh Ojha
