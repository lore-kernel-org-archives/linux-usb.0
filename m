Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0008E36B933
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790746062; cv=none; b=OWxenEoaRXSZ7oe8TyHQ0BuO0wb2siLqff7JEeDdXrpsODv0Kn/DOnwl1fXF8q8gYH240BFr0XcLQrrHRZRL7wpUy2joKGtw5VLU2hybQrlHJANc4M4XZd2YRwmhqifPXeOhgZd4zV8MeBfCEaaL0bqMDFJSPCMgC3xuPi+WRvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790746062; c=relaxed/simple;
	bh=xfDGpQNGJre9u7xiddz0LBjMkLCm7TSvQ548tiK6mr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVo2MGqsBHOqMvZ5rHv8phkohfTiX4rcIE35EfgGTdeZ+dqpe+r9GL5DISIKPTXMqrWdQ0Dy+Qhjf1KHZeanadzl8cgptBJ1UavJnTqOJFKu7PmqFBOkuvbB1081xHojRefiVTid2AaNq+HGL2noJHkQD8gdWU2dtZ6JHVwOwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lv9kgHdE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4ZurM41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lv9kgHdE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4ZurM41"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3VZsk1887267
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9peh67OgvZH3C1vmA/mVc2eb
	alFa6I/ZD9JE1WMeqWA=; b=lv9kgHdELLTnFWB/RCoXHZ+ckoLtE4Gvnd89SOKl
	DOHMU804gJu5pbnNHSd5hUkrpT71dbEJMosIBHuiH+8pOjLSPDLTbpUzRwo5f4Eg
	+Kz0cpYOX8xHiANU4q+qeHk6el/q88mGigLokisJS8DJV0s1KJ2jx7pPrVPag+NR
	Gc4pBaSl6A9mdQEcBolGD13eFJKL5RQZGqLx6kCxQnsTcCT+kEYEdN5EYJUP3KOr
	4HwvjpL0NxAsW85tNIuzWzgjcs+AqRdAyoyNU7JDyFwyIO9YkzX9ucDRBCTML+4I
	WD5ZMhIQ36OrQIqwpEF22wMy7+oNIr2u26RdcFvgYGK+rw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn0dgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 05:27:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so9798687eec.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790746059; x=1791350859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=J4ZurM41sqcTUKtEzRdRTsWdnZqMCnKaJLV/oYxND/oC975NMKpz2tZX+dNsUtMB4b
         XY2bwrj1MkwPW1KQPsI3R3qrDiTLcgligChgjZZyeD8yJjdVE1vXeVYI9c/KrRN42Lsu
         nCXgjBRztAhdQFZcvTqCyEAvh5+bcsefcb4FHO7fowb5KX+glSIF7XqlddtwCe6D9nhJ
         S15sgVFOwH9JX8RDj3IrJjOfztdbO5Dcd/WmOVfCPYf93Cb736kT1NLmJD71u+mUihgm
         8nJ/FLViJfwtYvDxbk+ssVjgT/+LsHg90Tnp7KWaBO8mNtQF0l9rzDNOL7D6+7Cg3gCZ
         VDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790746059; x=1791350859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9peh67OgvZH3C1vmA/mVc2ebalFa6I/ZD9JE1WMeqWA=;
        b=Sm3KKBHty73ID1jofGvUb0fRbvWDHZYtxXEKIwSL9BIVTmgSdABC2jRtsX3BDVupDh
         Ln3vZz080s8ep3BR8gWNpk3R+Q2gXm61sqNhRab0/b3QuxGmJdtbfR5oDYU1cE4Y1NUo
         l+hR7NErIxgsDlbrGPZtmUVGkCs+9o0cBQ6NDizz6Qg6qLd7AJhxY55qpGQo+Qae6KYo
         D1gzdMDKC2/WBaJILiOxFWWrFQcGm5zrwHVxo45OdVBBZFNLSMjimSjWOJJG3ElLQw7G
         6Uo13WiYJaKXQqY0k3CypBHs/Ydw6muzxn39PH/kfTlwxJ0gcZSZm2+y+GoniHvvcCmb
         tEFw==
X-Forwarded-Encrypted: i=1; AKwUvBwIv4y0w4xEZVGeK0jRqN/voq7SQWXaWc8pUodt1aRdRSmkrRyf37gwG6LHtpYQHwSsM1IAZzQBH7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmffuCfm5Wd/kHUfrg6Q9ssVkNiHn/kIT2+4OEqEqDck0ALpha
	ztYmc+VyjSA51AnQND8ZRxIMboxTGqMBxJkq96zQ53vZnZcAd57qwVRZbzNTBMnzHBjmk37g28+
	SJ69qSoqVatTdPI5btBg3XCV6MPaenSRjHa/kUVLXTMusil9B1MW38/a3MBHbGb4=
X-Gm-Gg: AYBFou3y7JW+Ga7mEYoEWIU9ErGBKYg/DhapMcvpoo8hFsvSA3XHhaV6fjXfXHZsKeP
	qR/0KE0HAZN3H+69+vhaqv3xfuUEPZk6dE02awy4Cfe6oyuD5RHrmErYjQjyOX7040lmpVQv6o5
	a7RmhsPOB6Ds9U2s4CGwcLvd+ZzVqim6gESL98upkMLEciaTzqYoaU6FIylmzmipSbokeVHjPiI
	ZoGvssKQ6zW5Z0LwJOJXE+junxsHuqHptjeQW5vYO0/BPRCjsBJAP2p+cmvNaFc8Sr4Fg28QaF4
	HCtuNyX0+KID1d652KvKEWy1zRbmUpKmWPqCETocCaoW2t/Cl4eruEE1JjcsSfYy7wLw1yXw4ij
	+fdUB49S5AQuGxVpfuq+TBA7G/6UcxzR072paimEe55HNWpXiXJBJ9aFGvr05zYROD+uLXNzHgZ
	9owHm3e79nCF6D9HEJ1puTpE3nOIaZ
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601477eec.21.1790746059408;
        Tue, 29 Sep 2026 22:27:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41da:10b0:33c:e61:e1e5 with SMTP id 5a478bee46e88-34cdc3c058emr601456eec.21.1790746058891;
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613f093sm1008341eec.29.2026.09.29.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:27:38 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:57:31 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <arydw47qwT7jHVsV@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-gentle-lemming-of-ampleness-4b4c77@quoll>
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abc9dcc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=9ksu8lDKoU8JCIevmIgA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 8MVGGeI6_GU3oJQDUvUR0arJ_sRYj9LM
X-Proofpoint-GUID: 8MVGGeI6_GU3oJQDUvUR0arJ_sRYj9LM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfXygImmfO1Q30w
 uAhEBoMw5FodcJzUlz9mCp7qsUxmbQBJrZOA3jS9zZEcCrkjlNCfWCpQNnlZCtBBpyJMgsZRvr3
 wXffAZPq9Qv4r5ytwMLB30IhFJnd50zVv+8e+BFk033XCYvwXFrXYxj8i0qyA11CVDOlvihYX4I
 eVYqz8JJ3xV9BoRII7+2OTw36qXaJrTpCrq+ABdFdROsXZB0fRSkZyj3+qFPopa+G00jV5vi14U
 OWIUb5Y9PcTVoFM+MRE67RK3s6vqc1r/t6PrKe1HvV135mN/xhyoEi6lrMOdhM1z6yfnFRmv6zA
 cb/rEje7vRk1udYXaSsNAw4G6El3BuM/RnLeOHvJH3z/1xf8/nQhRFN1n7LIga/TfoMVEevGIZi
 f3CR1NOUpiSaLEcXeuXuHJ3NtV+7CotnxtwXHYwW/2sFSDnJs//O1oSGmXOAsI/gCBuRcyetAXd
 eJDOC/+xpBWi2aMOyrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMSBTYWx0ZWRfX7r/ZZjj6EoN9
 2K8STglhtCpPf7lIXMW7rLGeiak+3xrLnvzJvcuo+VolfEFo048EPPq9RCIVnaY8ac2kMB4k/JX
 KCe76AtuNgdX2B/bPTQUMNxut4nTrhs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300021

On Mon, Sep 28, 2026 at 01:00:46PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> > Add bindings and dwc3-qcom glue driver changes for adding support to the
> > two USB controllers present in IPQ9650.
> > ---
> > Changes in v2:
> > - Rebase to top of tree
> > - Drop 'usb: dwc3: qcom: Allow the glue layer to pass ref_clk to the core'.
> >   This will be taken care of the by https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/
> > - Add ipq9650 to existing clock constraints instead of new constraints
> > - Link to v1: https://lore.kernel.org/r/20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > index 9f91c8711e02..a8fbf72c6375 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > @@ -36,6 +36,7 @@ properties:
> >            - qcom,ipq8064-dwc3
> >            - qcom,ipq8074-dwc3
> >            - qcom,ipq9574-dwc3
> > +          - qcom,ipq9650-dwc3
> >            - qcom,kaanapali-dwc3
> >            - qcom,maili-dwc3
> >            - qcom,milos-dwc3
> > @@ -210,6 +211,7 @@ allOf:
> >                - qcom,ipq5210-dwc3
> >                - qcom,ipq5424-dwc3
> >                - qcom,ipq9574-dwc3
> > +              - qcom,ipq9650-dwc3
>
> You had 6 clocks before, now only 5. Not explained in the changelog.

Sorry about not being explicit in the change log. The additional clock was
supposed to be passed to the dwc3 core layer for it to get the reference
clock rate. Have dropped that in favour of using [1].

Since '[PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk to
the core' (please see [2]) was dropped, don't need the additional clock.

Hence the change from 6 clocks to 5.

1 - https://lore.kernel.org/linux-arm-msm/20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com/

2 - https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

Thanks
Varada
