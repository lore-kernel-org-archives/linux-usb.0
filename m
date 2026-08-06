Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B343B3F4
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018351; cv=none; b=CLQxhRtimZSzUXlZrseQFa8gX7BR+jYoIedIWK6Mept/7SUez5oG3VJxLIrLUHINPYcdRcub8gJe+e0G0nFAvmRritUDNI/K3YdlaMYkGAcNZiaeJsqONxzyDy9qJktAKbiR+cBY9JwfPxg7kTpEyG5XZWhv/m6R6YS/8Hq1M+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018351; c=relaxed/simple;
	bh=CO0j5QxSovDwEo+nBnRz/si5pFcvZIqV55gzDSyZDSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtdtWTf8frgFmaFE3A0kLgOOH5C+cOdA3vj6QLkQ6JdUd41hZP9FAKnU6wpi5IJ+C6594ACQSNSm2tKS6lbvl8pH7/Jrnv1KJZE9hFjp0EFgllelaHhSmN+4Mei/voMupqSWiPkTRMDfc0QI9L+q4JnLru35nH4eI8Xd3yvjP5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm288J7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3H3OxTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm288J7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3H3OxTD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769o1S3866118
	for <linux-usb@vger.kernel.org>; Thu, 6 Aug 2026 12:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mdapPG7MX35qhwIzJhhRhi4k
	JAxz+b53jaaEzU9Cz2U=; b=jm288J7tfduQQO6gE0n2KsaId51ANZg3o7dmE9PY
	sB7oIfjpVpJKDdoEcaQIv9CYIoUB5TCBURdZFhKrcXmno2vmu+ZAJGA675sVRIH6
	9Ne0BT3Hyrow1IGH3Hv3FVMWrFt+0KqDi6fpM6RtrocS/UvXe3u1/sxKIXt+GJrc
	ZtOUJTFRWejA4/3dCpK4xeXmWQI7V8zpS8ukus3NnqSnt3UVbyqPbeZ+VfKe/QlQ
	nCH6c0NnitQNaCwejPoa48SnrwBydUoeCnStQc6uW1FB/aLwPOLgDcuyEe+DaDu9
	ztbdv6QMKExSDi6UqLGdBss7UPeaTo8ycunLmf3o5XW5ew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9f5c598-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 12:12:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so4451073a12.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018348; x=1786623148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdapPG7MX35qhwIzJhhRhi4kJAxz+b53jaaEzU9Cz2U=;
        b=U3H3OxTDfRPbleWFCyabCjReMB7yNF5UozOcmwrwvg0mW3NsL3nMx7P4fckxSmRzn7
         z2gf7AERFrSt7cRKW4BrgPa+40oYYGtl8O77WybyEpnhxYEWUZ2SHzpQExAUxUcp9GZJ
         VxhBys3qLacCVXMYE6NcTmdzGWwUwGaUh1pMaCoLajU5arPnSLuIYTJJkyqNRTYjdODd
         YXQaMt4Z+Q9Sx2zupwktunY2GuRy5P7kknezBofRKjnr5iKrVD2wnrbfGtm+bCc0elh6
         XNMCWX4zaqhALq/M3e1RZpx1t86jz92ePCDBgbGguSiyKhWzuv1k52QJZV7kj35ONNSV
         ReKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018348; x=1786623148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdapPG7MX35qhwIzJhhRhi4kJAxz+b53jaaEzU9Cz2U=;
        b=SSvUhZcw7p4mRZiPioFwkfjmL91+ZHP3aPnH4bMQdqgX75CEtqHhy9PPg8+Shlhfc8
         u1VEr+QY1/OCFGTQGCrP92mSTwLhnOkV/Oqi98RyQu+gD6UPfrTGb8a1oI/X2F/IVLO+
         tg7HTgP/t53QYG7bY6lHWn97MvS9JfiyTdzwK+lWj6v6nLSJdjiU4v4ReI8g/ThWkxWJ
         MzDtP8n1iVGi6w/z9+yirA/YRWq5XHqOa5NJv4IflHKLDK/flg5SxeNO/dFV9pJMNXbD
         +FZ0JQVmk9iSfoX/e6pcXQG9/6C7IkkLL3qhk+4cP/pgn6jwRk4lEshhuXYNERhJbQ4W
         NX1A==
X-Forwarded-Encrypted: i=1; AHgh+Ro8UIGWcp4TFwutTe/geLEp6PZBFSWoh6dSoPiubSlouSyOAZiRGv6NFHXHsM+V2dEIl03QYXADFxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0jmkulZt9JekZA/GeSp4zs0vG+eTGzFc+zznKVmOQ+5zJvaq7
	lgot2tbm//j+jorbAU5C9EnN7Lg6RL7QrX0HwusJAy2gPiYdtlHNSXq1mPfYcBRkrj92PWOFh73
	s6W96wKMRO8iy/w+c3kovayb3LD27GYLS3P4oXTsImqgoK14sV5bYWHEpON5vxnE=
X-Gm-Gg: AR+sD12aeEWtkvlSla2CLAdmyHMUeD1KebcElZN47jK+QzkUmheYgRhbzK/KhyHqLfw
	MWRG8kRVZluWJaltTnFO71rt3JW1ikS5CqaNW4BBHyzv0kOPHzf2/VpjZh4+0KzU9/w4CJQ02B0
	H3StRGL201719ljbZsZbuIIMR/SI6FKCqPzjBv0BHjjkm5qgsP7LWQzGyUL66pcHQViGgPKx7MK
	XTj+C0zuiPLg60mHozT7wOtztG+SwWGwnSpGw5Hbvpo0eewHm33AoMxA3bxEnatvj5j+Czhqboz
	vQhIbEVDFgckQPslsFQIJQ5kqb3tlAW5oNyrbkLaXY70jsHBFj4RpgAY15AB1/AEtRKbklqK409
	Nd1GVbOw6AUryF9wHYRe8eWpZwyQ=
X-Received: by 2002:a05:6a20:430b:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cb85dcaf9emr17702743637.5.1786018348196;
        Thu, 06 Aug 2026 05:12:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cb85dcaf9emr17702669637.5.1786018347772;
        Thu, 06 Aug 2026 05:12:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fd2b3sm29733045eec.7.2026.08.06.05.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:12:27 -0700 (PDT)
Date: Thu, 6 Aug 2026 17:42:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi
 compatible
Message-ID: <20260806121219.oydkvnfpbfjkktsj@hu-mojha-hyd.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
 <anReh4gzTjkD4u7c@vaman>
 <notmuch-sha1-a1b83c8fdeaa6e5292b72468415a18abf11af9bd>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <notmuch-sha1-a1b83c8fdeaa6e5292b72468415a18abf11af9bd>
X-Proofpoint-GUID: FrpOeaI3qvIYRlXAl264icT94k-5uIIO
X-Proofpoint-ORIG-GUID: FrpOeaI3qvIYRlXAl264icT94k-5uIIO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX+R67/N/peXTi
 PwuHB8NdCBCy8Ak0zUiAUABXs8aetK1NbHzIlWGKdUQAHjDN4nekQKun1sCrWTSUxtXOlYvERWQ
 FzZCOYWKz64UXQEYyBwjTsgP+XspHfc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX5DqBC4gp7Ri/
 PYsTe4fAAakuWu76ueEoA3dMhQ3WhZLtzkoN2rswMdfPvMj7k0+rj35m98zeflt6/nhwlgEk+6H
 skjsVGkfXMCKo+ejedfpw2rCIYc1dS4DUeLVImvyy3Rh9hIqyrOL/1wl1b3gA/NX43OPYQmmsvf
 sya+uoezSb5xXeJ6NCD4xJbSSyCeis8gfBEoTkhATrVMRF+IKFR0ti7guVTHwl2Ee2v6gdpFofK
 X3BZlp7TdsFEF3No6FfocJxH/8rcavBmQEhyhuQ0QwYG7PL4ZWhBWz43ITnYzbQGG56uB6pgici
 YAETMOEDvM+PtEG/WFTT+rTyrCWtIT5mAdqf/4qyLpoieEPVnsa3PcX9UGwU346N9gdpaVBAwCA
 EUN/DYTCXN+iJ/VmjAgQW9ZraDn9SbNVYADukVRTdw3TUWslfo43bRTmjdFwBc92fwyUNGJ3Ggm
 uooq7lCAfBYJKTrpnqw==
X-Authority-Analysis: v=2.4 cv=d4bFDxjE c=1 sm=1 tr=0 ts=6a747a2c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dfNa0yi7GIg5s3L2rkMA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060096

On Thu, Aug 06, 2026 at 05:10:01PM +0530, Mukesh Ojha wrote:
> On Thu, Aug 06, 2026 at 03:44:31PM +0530, Vinod Koul wrote:
> > On 03-08-26, 14:44, Mukesh Ojha wrote:
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > 
> > > Document the Synopsys DWC3 USB controller found on the Hawi platform.
> > 
> > This one fails on phy/next :-(
> >
>

3/4 is not applying because it is based on linux-next and some patches
missing on phy/next.

This series applies cleanly on linux-next., what should be best to do
here., shall I send it phy/next ?

-- 
-Mukesh Ojha
