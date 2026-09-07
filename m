Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BDA277CAD
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 04:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753973; cv=none; b=IcWfxnVYhXUf41L8NHhUtPbIYdE/umh6oKukN/dImgCVHut7ljHW1p/kwMlkCc1wqcbaad9WPtVCPObAF1E54U0NbiqpAPvGHmmoSUHneehVzahO+6yPZt/SJN05uOy4BnYLTIP0VG+TtkAtDmzcWPqc7kZqes3pk1G/zbW0tII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753973; c=relaxed/simple;
	bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZmui9NWy94jTfcvmtxoYFtpv+kTqF4H9eVFckYe7DUqMRFsUlJoKXsdWH+vyJOiNQZbDKSCk5FrciTozk4Go/XS1e3/Qul0MbGyDEQC8E1KXVN5PezhXYTeuPq/ya9xvBZz4ABm/xV2wyg2KYyXepnqOHy+QOBnqitE6pM7vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKXU1pl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0tY+toU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKXU1pl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0tY+toU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873kqU54041582
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 04:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rH1aIPieBsj/Nd4+aNKiR1Bo
	k0SetKXp/h3famtzCNQ=; b=VKXU1pl3f3oJnygHRfy5/zI1H1lGWcQI9A3aaMlM
	AQ33hb1OanlXpvXv7XVTKJqdsV2M1Bhs02mjLb50dBcCCwBaMmgGF88iaPGzLOJ8
	g+qGBJTpR9ItqET0ROQKDv0/dRazKtThyxQ6og7q059OCROQIWSkM6PhxDeyejWO
	eFbCgLY17anTMw2TeMUSnOT7YsP/Yt7RcYCwYCjS19OAgj+z6PnI0Ge3QhaBrCbU
	sPex3n2e1uuBK/hitm/jMkrUDvwnTFaY+fzVkjzz/s0DpLAfTZTtQrPhQ6J39oXP
	oOlkF9iePmncw4EdpEnYxS9HGr+pRo394cA9UH7Ne5k36A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg8sd5cnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 04:06:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6fb956002so43348035ad.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 21:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753971; x=1789358771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
        b=f0tY+toU0lLtFDKTVQ2DzRhpzGP+p3cBOv2GsTIC1S/oROy2sX3PmUprovZk80qMCw
         3Hx8TqriaImFcPTENPEgQRD4neaABwHfr5VqeqIYoHIuUL1G5uns1SKxvWMo+TXOX05F
         jL0pKTidaRFYXPdXqcl2gOCg+Iny45qSSO8oFXogv47y+zpYaMOpNnJ296N+wmxdV9LP
         7K166U1FvjvRlM2iTJjTJiXhHL+5oFxbYLaeITHWHov/rwFODUQRMen3HNb8Cp3vMwdy
         rgXyvjZJQbiBwUUJAOpFgCd6fZlmGexVjeaTwryNKTbZTHvbVoSeLkpl6ecwQZl5j3Xg
         H4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753971; x=1789358771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rH1aIPieBsj/Nd4+aNKiR1Bok0SetKXp/h3famtzCNQ=;
        b=KygwiviT5SVqn2fQ8grkXEIBId+oNIw3mHfvJqAG+lWz4/NtKG7fLVTLabMV6PQlkm
         loj7DmPdwM/cvyN98b2T/Bh2HX9nhDLQkwMcITq12vEN2q05XyNg2hSuoePT8J191rdf
         4nGjC3e/t6uZpSDVi9vxjhpE9Lg/MJIpIYbo7XzMcyWRJXC9sG03Ncdy52Zk4PdZitI1
         3O3mUHV8aRKQBXiPBOzARbeirnxWS34NxO/mLoxKzM2fRQbSrWE6gii/yepcusA5b+b7
         hfHfepverTRF8ElkRZQeja9rSOsQjRgJ8ASZcb3q5gBOIK2y9dpEv5CYw4eNLM3ek5k5
         I2KA==
X-Forwarded-Encrypted: i=1; AKwUvBytR58ZDWqsZGh6LXklfqblTpvwAJg+mpsRUMDs8nyqJjYyrVO5xB2c4ROtFeThnfNu8EIt8pUDMUU=@vger.kernel.org
X-Gm-Message-State: AFuF++kzXNcXoyDihSqjFLUD9ErMmnUsP000wXS6SYeHi0aFvk+DoORq
	sB0qLo5n9RLUVUOf2KR8fAtAhXyaYko+R9dZ0zIQMuwBaS4xnw7eAXaABJUqjwUgGVAFsVcAJrP
	jgTzg2n3v+awrKFGi0KIRslH7mTkAbnjTkmDjUVuZM3uYA8lhSj5tqYMYmgJGuGQ=
X-Gm-Gg: AYBFou25X9N06oVeIU5BZn02k/DXv4TnirseMQgnlCBs7J5752q+ACRx5yr3ED/BFLP
	FSsDa8cn0As0dsZsjUbJ32To4ZIlCZQPQ2/nle0lxRvZAyA/KaaKDcOYY99yhxJaSGfABN9CzEY
	vp7o3uQ/G0SNWIq5tv7w53Ju71xjM7HpQBEZmeY/QIg9fmGZ5CZHcEJbhmVzxsI9E7cxjF6Tc/0
	IFQAUwXEDH4vdViH0VCbxW1EW4IxIO0hWW49tMUyFznV6G+JN3HuXCiEFBl67UUHF3qTC0AtYLJ
	B3diQIZQyB0OyYYXnHRuol1NoBZevIJm1+cTtODuSHoPa1WShsHRMDTdH8pHyInL6BFN4E6cU6X
	uSfad28AA4aQp/gulIbinJsHRQSPHi2TYbbWOXoMA6WWklQ0ZRYSRWiMCk+HYvBAK/gHZPpI9CK
	XV8b46ySVSo2axigQTOs0MNbIzSYhXgA==
X-Received: by 2002:a05:6a21:b84:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3da39eacdedmr31468914637.2.1788753971166;
        Sun, 06 Sep 2026 21:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:b84:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3da39eacdedmr31468840637.2.1788753970728;
        Sun, 06 Sep 2026 21:06:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm20112549c88.6.2026.09.06.21.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:06:10 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:36:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] usb: dwc3: qcom: Add support for selecting UTMI
 as reference clock
Message-ID: <ap44Ki0U+B2ctqeG@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-2-13e4e0f63123@outlook.com>
X-Proofpoint-GUID: AvaxCvwfCwPMilIIWG3YBlOTUjdC1XV5
X-Proofpoint-ORIG-GUID: AvaxCvwfCwPMilIIWG3YBlOTUjdC1XV5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX5dXf+TQRKtd8
 TzWisyfzIbQjNIVrOQwbX/YqpGAC/p9VhgWBJN1SI4HUDuxGqGKKXBtw6IY6Xk8rCTltwgcVwMg
 euugkkS2yElDxP9zLy7GsvomYDvt2Cw=
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a9e3833 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=JVfIVJ-FkFmCULzTX5EA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX4i0w85IOCswb
 yMqxwRN9GJ+L74zIhzFefbS9wDUPjH+tcbNiDh4K+mGKkcfHanWQC7L9w4etwDiCU7Wj/SGodvc
 CwvBJdA7e6haooknunFQs/Cd9ZX20cZENOWA3Ocw+zQY5hApbdQf+DEjLZE/6t48hrWOzFPMqrT
 DUtE/G7rOwSqmKW33TO15hYUzMd/yoWy3QyKVNrT9qV9UOHXxvGlM045WLy4ABb7l4JQn9pBDMT
 7G2GR5EX75ZD1E/IVgTsk2sIcUqTMStM1QjmyHAT73OpdUo7bnZl0sfJizIun61x9QpT2fYXLmA
 EsPSbpXxJ4WtvdyXp33cJ01p80rGyAnyovhQFP9KGila22PMuX7j1+XCQj5wCxvrN00zzMPBhxv
 aUpcSarAmWBJnB88CSQQT0xQh+5yOchbTgRhUR2J9it4HpJsfF87rUc4iGWQxVIWZ5uE4CcS8Be
 tXLtRwtJTSw/pNYkfxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070039

On Sun, Sep 06, 2026 at 08:46:41AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
> flattened snps-dwc3 model, it is no longer possible to pass the
> reference clock to the dwc3 core driver.
>
> The clock rate is used by the dwc3 core to compute the reference clock
> period and frame length adjustment. This is needed when the reference
> clock rate used computes values that deviate from the hardware defaults.
> Above mentioned SoCs require values different from the defaults and, as
> such, the core initializes with the wrong values which leads to
> non-functional USB operation.
>
> In Qualcomm chipsets, if available, the UTMI clock is used as the
> reference clock. Therefore, acquire the reference clock by name
> ('mock_utmi') and pass its clock rate to the core using the probe_data
> structure.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
