Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896850;
	b=nr7UZSr5PgqcRJX4tpYjC1/ND2S+sgk9CICSBC8DsSTLpTio58s76Gg1YuPvfyCacMsg
	 M/LY3X/2bjxrTLyEVSh8fKi+2+8Sl/lDR/XNi6pgBXTu/hMWkBrkaDLlJToTIQw9gX7bc
	 WOLnencV3+ZNVGXyv7vqPZqwwMm/mmariddtqLJfj4eYp4z22GnTQqWnNQ8OCW7HKeXcm
	 NZ4M7eqrqHPtmmzj51jwWyKv+/5XX3xZBc6Brz6vmm5IuFVJcLCr23Ny1z/eulUfAjZYS
	 /B+JLT1YNmP6iFYQicFR1s4Gbucn2T9yfe9rgYkGRNm5fcizKrltKv0uZszqZIZKBSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
	b=pcWaMefYsOuffQSG4kNqrRIejJKaiqOpy7+/j3WD1fA1ibW/3Tw/JS8xPWA+9I6XqOyR
	 BWIEZmOAnGKj2S2Y74ampPSc7GaMsp8DGvfUDATId4YCQkPSi5JVei0bBkySoCyJBPv8X
	 6zPRzeHCdnDund4tPHoscPOkwiOlOuQ23hrXYE+icA7ZUQFiNg+QJtdWiw1MCwRHhxMKH
	 FqcZCKPjFOg0zAYHgmrutDhkQ7n+ye85iO4+EwqnFYSpuU8fYFohApN+ab5Vcte9/QRn/
	 4zrzbwKkft4LVRmqfgiTXnIDPKEc/RbJAEGF7MgQstpAA/h6KH5AfaaU7ug3xdzDLdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4261F606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 06:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4261F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6Lh0M3980679
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 06:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kGocrnhODpwc4HBS0K3dbxJ+
	9nBTUl+OfB38M/5zCpk=; b=RttC8X1Wi3rineAEJsXoClK0awK/HZwO3Pd5wbU6
	n+izFuGy/jM1k6iQY6Uv1tUrkcMVmWrjMiX9MLU9MpTSRs68W6MQQmxp5R/+Sp21
	JbKHf6Hx6mqxR0cqsETQyCXNMDiJloBu852Qzg3+wwqsYXexwgqpuvKPvdbAvtR/
	BUT/ws0+ytVtLSaLadBc6ZvDbfITxfX+YxF1xJUro/SEA7dEzhQONrngHzPw+ybu
	yXutTCmkRwsqNbRM6RJj8zbN0uEd/jn6dendsqozFulF7L0h1QrPUvmHzdwzUfa2
	qB7huaRDz4zIZxEy/k+iGZpagm7xGmxCiQOAaXvOXOqsdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd00nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 06:27:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so5790020eec.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 22:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794896847; x=1795501647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=MF4Eey6XMU4u0oG/w5RB3nqp9nUvCnHLRCIUhvDmN/XTqzjCHzc9GJZ3HTcLj3e+bt
         QC5abb2z5NMsdpqWCcCCTB4wP1isgaFl6cA1s7wRe20dfQiJWhLOarkpDOLvPoPo8wld
         TYyvApY08gHz7+WtyHoIPM2IO30kQcXelGwCM5ssgBAntR8rIsbk3IPMwX5jL3WQMHkA
         Tuk+mJjYT1h7xRSnHqZEdJzFaSvporelXF2IGAybK1tRN1PrcZVDqvc/aMxCTO4No9MO
         UI0jcrH6yDLM/5NytdNivJ8hIbBjXhjuwUA4+xVIy/JA1fpCF+aUgtdYTyEZJ5Gxvj9G
         RjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896847; x=1795501647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=qPeLYp2qEjiDcqHoIGROgH827/t7HRh3jrWaA1swDLgrvwNE5YNJ29tHmaV6bnyVV8
         t9NJ9EE0pzUQHHkliKnDYwZe0eijepVU/uY4NnNAIU0TjIXvac5RurOhpY3fiuAz8bWf
         cs8eDDodVfM6vNxxEdVdq7puFWpQwdlIcrAwKGLGCRY17IJNfTh5sFOvUhpYSnOqKPc9
         bR8vmlty2+AKKDzq4nh7auRPYvxdi/n60OldR/wHff7bB7XeM9c+MkMXyORMXbLbyeZi
         IKxmgtDQqcS1+KjrfXUjrssIjBZdiOOMzRXg3HH297gBMrVSAONP4pyMp3LMXZy4gpG3
         EN2w==
X-Forwarded-Encrypted: i=1; AL+hErEeJ8Y96gnovEkqskCIXCWiZn4Q0HZTCqw2EC84/dO+BMuJ7roCdMzEixfKJAhj3iP2/sUoxE+OA+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FqeiPb/MMdSASxcHtTM1n8f2Bgx+rPXw8CqhRhqOUqPf4+2l0
	G8VX5bAFSr5XXqBm2hQlJn80OGi9vvNoDNkcLnFjCXdgLYvBNcdN9oiiXG8Y6NkbR2SM/my4BkE
	hrJ9knrSkciCsNUWECvdSPpHwLmsywBN6Aqx/tYDmL5WmMmREtzrayOjABveoZDo=
X-Gm-Gg: AYBFou3YcogsDfLmZ+1RBZvkABvZn5fgwnglbyt/BIm75ZtybMp7pVCmQHi9GWwlu1C
	bX25kThQB7b4iuMoyWHw8JCeDCVZFYasr0ghT9wYUMleKE1/Tc2p7D/xpmpSaYOQ5kUzmifPZou
	EnJK58NQN995zVxJ5i4FG6FVif7fHhvjlemOujnJZwvuAAVa7OJrHrnxC4Y5I/V/6jxXiLWayQV
	nOzsPHyjbrDsy+r3asjXyOfYLU86hvcuRlg2WSMG/yeNunZs7j+w/POQXVNIRItJ9oCEjl2Fuo2
	3mCyrQ6SNrmnyy3czKmYtoBVx4vEUwlrfE18+g3as8GksDZFRg6SSYhhbVXlA1YsuxpZOflEbpr
	DbbpT11xmSC6CPM+5HLWKQ9cOzd8BYPCDCUYQYrHgqYdFGneGujVp/SFEDLElFEB+R0MGPEbbG6
	sJkM/ZEq5klevXh2+9jj2RG/cQpr6SBSEbErvIY30MJH9oHIRh3+lTCxS2V9gEGDHOHQF8OP8cL
	79YNTU=
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663832eec.40.1794896846974;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663806eec.40.1794896846413;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381cf17c443sm713717eec.15.2026.11.16.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:27:25 -0800 (PST)
Date: Tue, 17 Nov 2026 11:57:19 +0530
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
Message-ID: <avvzxzjzzHP3o+4k@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260930-striped-copper-cat-7c4fff@quoll>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-striped-copper-cat-7c4fff@quoll>
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afbf3d0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xdh-gZmfb6x7HAvpyVYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX1HXbuH1W41kF
 WVzxSQN0vaxIZvYrXDj+uSvGVtYhyfydJoFwTBoXPuuUDnLf2Wniusbfr/WSXrRaUJneTFgNQbs
 zz3+A5R9bkG2Sz3A4/tM+ZD/yMrjslI=
X-Proofpoint-GUID: IejTkJWEpB8DzPdiSrHCPpGAgaFxQrKb
X-Proofpoint-ORIG-GUID: IejTkJWEpB8DzPdiSrHCPpGAgaFxQrKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX9Rf/zGHsd24M
 AJ9Sy3lbENVMymwpYS1mzOuBOorOeKLIs7/dq4Pfz2jMUxgMaTI/8rhov0YM9bZSptfUnJQbQcC
 EGO/Irg4tYcVNGZqZ7gbPTQ6sWfdHZOGXP1mVUF0j4mDcQUR1P5GdXbazP/JSW2AfuY7pNa6uRI
 AlsUsNM23HWi099eCsWH8UFfrLJexeqtvjGffxx2rnwRZZT4ScoFtrFXpQQqfdWs/0lrMmiPCTe
 WwQeF5L2/5nYlbVsfrkq0jkLn11tht+gKKnv40mDautkPtA1j4xTBQU5byOIenQt8RW+sgcKmnM
 k0uhQukI16B8z3ulj7ozAd4zJTqXH+4nnmJ3dwgGDPyRLQ6LnVemNa3IigqvDsbw4TOA79IDiMA
 yrkLIX8YyLaYMGZ53fkfwgtmCz7/QRsaC0ARy0TqHr/rokQ15ajkmyUcGLsVgCcSeULm0o1GlHq
 Itfw9eelSrCMxXwcjXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

On Wed, Sep 30, 2026 at 11:17:37AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>

Greg,

Can this be picked up for merge?

Thanks
Varada
