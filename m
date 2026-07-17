Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8052701B8
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784251239; cv=none; b=PVL5kEq1Qhu9Jj/OdoIQi3EWrLjz/QPqzOS56aCfd4U+p+DQNqCR3jzpyhUO3MO8dO8yDIhGSitZJefaO7NSw+vSBpuF1pS/9mVr9exvQ8JleEKiZPKHwjceX8L4R799NyxNvPoCrMYz6RbaNxWKCIyoQEfP/dGDOJWRryUrq4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784251239; c=relaxed/simple;
	bh=5NsXPGUb/KuXAEjnuHIpy4827pn3xwkzIN447h8hljU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwGSxWSOJFSEKtRjDA5LVdIT1Zx+jVpyZtXAfqFNHb6Stv/fkCCbjffDi4YYjPVopQkat6G3L5ien+MkErI1pqdnhQcM1qGSzXcr7Ek550xMqHE7UPxx+eLN1kz2rEqWKENLSwfTIN2AfRt9YjVNYpxWAlMR4Zvz18r5rq3vhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcrR0Dlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hk2NFfEd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcrR0Dlk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hk2NFfEd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIgNi048005
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 01:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kra+P+CAUuXywk27UaplER0R
	y530LjDrBoa5YojfCqE=; b=AcrR0DlkTJV2Cx1v7CnQMoN/cAy7h2mGUa8BTQyG
	0O5NxfqTfMEiLw9lllfa1uz9zr6lVd1vOop5QJYH6q9fIbTobAsBaSZNbIuOw0KD
	c8/lgNNHacDtEn/jJF6+8urRbppHJjkjs/xnYnGIxj4S5IhqlrNIZCvxYPeRSabQ
	mufmCBOnf9rnOuTCIFAkPVEFz1YA9qYNpYBRR+JaM7uE8hYMhsnN8ScdcGIQt9TE
	87fPSjIH/MMu6GcVCyC+RCtIpGTUWgT+5480aULzb5dvezX6IlKUlqpOvNAMgQus
	KT6zohqo60Fgh80XZkRdKpzwJa2GuqH17nPBlNXZ6X9sbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1utnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 01:20:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so3895386a91.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 18:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784251235; x=1784856035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kra+P+CAUuXywk27UaplER0Ry530LjDrBoa5YojfCqE=;
        b=Hk2NFfEdTh1pVfG5jr9gw0hj5SvWIGy30PHY9YfUWbJ25C+48tPB51Sx5HASvLYAx8
         zx8YfShsWRE4ad9LFesX65Dwl3I8w/zfK5vn9cyUGzM5rYq0qe643og9e6jGuAG6wjWW
         14uVZRJK1ceeYP6MQqug9uBtPgdvUNeIyo4+roGdVRYBCKcciM+RQCBq2U7/+SBTq887
         nxKQNXXrScakA5qMhJiMumT5Ww+RNy7mE7jJ7IqflAS3sUeMW8N5yriYITw5EVNeGTZg
         nDbkBHbyw4Kw7rgQUpZ12v7rpccragyQm1mFIWsaJbpBXJnd09OwVctHE7QqkCy45MD7
         7ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784251235; x=1784856035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kra+P+CAUuXywk27UaplER0Ry530LjDrBoa5YojfCqE=;
        b=KjO7272epvUZDl5TiSK5XJUF/PJ88ZiR4VxZkzV6Pc10ZRHDejE5IlqeMtNgHImBgy
         yZEpHfXy5I5uAdrx9qMsW0J/5EK7+ULtqeWKzPEqQn+pNB3rIa8OdEfNnFS1gODmatJW
         lDo2RPNK6lNHCo8rLDHxfGVlj78T/p60S1+Dq/Qg0HKcisf3sFPXln/G/asHaUeisEXi
         2mwnIGCA2mpQ1pGCiSkMA6rmbjWDJEXZzk1wNN111TuvlCXihmixKb9z/NR9FpW/N1/U
         CcBtCPMVHLu/u03Og9qW6xS+b89B8QpZcilVbxgA9e+tfMzlGjzvZ/azPNLMndlocA/v
         qu0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqnYg2yAclRKumq9A1NC+5TE1HF5plEsods8Zol75333+SUUGXnZnS8hO6DoxUuB7xBaWEKxypO1LY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEAY4fDL9n7gXu3+aiC2kTuG/+23sYC+tW7MAhv8pr7Nj0wp4l
	X9aP7NC3etumikHwM4uBQklgX4Gxu5Y0467nqZETNLw6B9FnWC67XnhVt2cFaOCdvy9yravjLSI
	C+roKEuHm07/575hbLQB3v6/EF/WB+nLn4MfvUfq5dDssL12QrrX4oHsQYGOlryc=
X-Gm-Gg: AfdE7cmNWO91Egz5y/AG3S6cL8Qu6uB8MtVTYNeCB6DbSrNNgwWAlLyx32z2NdQkPQr
	itXzBB38r6KhIrJO/dWASy3xOAHBm39iuwRtOWFE/xWQfkJqFJbzj447yOQ4C7a85l6xR3IwMWc
	jDZOKBi1XGpR2x7ecbzlcTr1yrhXFF5wUaowWcZvJsFpqVnu3hMIpf2sPCkFWEZtrMCGTmLRiVg
	0jKf882LwL0EXfMMQI18c0jUlv+GRez+EIIMBy9U4dm4PwtF461pt6VQIWDZAdyXaQzs1xBaXcH
	AfYHFxxmnKQ5BJEM9EsgrETdZ1zUIgNxAZbcN8rcEHgnG3kOM2cWUmIa3L7BU75Bo1kxiglYzOM
	UgynedLLGCWUe4UxPQe37MgPHN849mFfY4A++jbV96YL3vfx42w==
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr339814a91.33.1784251235008;
        Thu, 16 Jul 2026 18:20:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:38d:f1a4:1116 with SMTP id 98e67ed59e1d1-38e4b537bedmr339776a91.33.1784251234452;
        Thu, 16 Jul 2026 18:20:34 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm853004eec.7.2026.07.16.18.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 18:20:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 18:20:32 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
References: <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
 <allvBYQN_0QkI835@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <allvBYQN_0QkI835@vbox>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAxMCBTYWx0ZWRfX93iwLZGPKWdH
 AULq0rd+nRD3gr03HLf86m2K7DEgUOxdBjxaTqtIAyglijZeRsvTi4EBxBwcLq0BLPWOo8tceWB
 z82UIEHBjKOcuRZHNI6BOO6u6UmeOtUnyTO1VJbZvWEZwElswcSg3s8p1l80KQGAOH3e33xTS5o
 1f48DJK7Arw8nGyi9Hcn/prBsTHUNuQqDV0X6CjdMqzrGtcsSSa3asY5kzUjR2s65TgH2u9Fawc
 4ABdYm8QLIxCy073m4NgKGXRUciaA7rFuvNjaKEGd09WaaS48jhtW5nQesUM4bC1bBTnk0DhnWP
 lDTsTmDar76eyK7LOufil1UtqOS4nAnViR+e2n+Z4NOzTaEogsVcBT/zE3XwQfSGVyqgKLcoHOv
 Vx67yTC4Cc4zW7gx51ZGU/z4Ow+dDR8ws7nGt1ICPqSuphtEQ0zM9gMQfwO8Y/39CGvHg6Z+lor
 7tMScadlpJ+lXu3bIaw==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a598364 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gzHRHKxzVZXRfne5p3sA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: sgi_RlRv8qW21U0FeRm-LR3Lm0nbtVno
X-Proofpoint-ORIG-GUID: sgi_RlRv8qW21U0FeRm-LR3Lm0nbtVno
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAxMCBTYWx0ZWRfX0cafwXrdSkA1
 V4SCIaoZdXqMBt4uwBJ8MXYRRYHwdmyS7m2h2gdjXq+oa5Z5nVWi8z4AIipKMxi5jo6V28clGY5
 WR8uqqpFKW6EQ6lT0RifD5DMqIHRAMc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170010

On 26-07-17 00:06:37, Thinh Nguyen wrote:
> > 
> > I have seen fewer platforms use "phy_type" at dts for arm64, dwc3
> > core uses it only for special cases and the code was added for
> > ten years ago. For the default situation, we may not need to
> > change DWC3_GUSB2PHYCFG_EUSB2OPMODE value for UTMI+, Thinh, is it
> > correct?
> > 
> 
> The GUSB2PHYCFG.eUSB2OPMODE is only relevant for host mode and mainly
> for electrical compliance. Usually by default, the CoreConsultant
> setting should have this set correctly. So not explicitly setting it
> should be functionally fine (IIRC).
> 
> That said, this is separate from the GUSB2PHYCFG.PHYIF, which the core
> uses dwc->hsphy_mode to indicate whether the UTMI interface is 8-bit or
> 16-bit.
> 

Why only rockchip uses this "phy_type" property, why other SoC vendors
no this requirement for UTMI width setting? 

-- 

Thanks,
Peter Chen
