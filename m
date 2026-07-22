Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF088345CBC
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727287; cv=none; b=Qcq0w8sg5veJJmNZOkDmbYcD0xC9JZBmd794vGwnICEf3Kdf/a/t3GYztcLxSm4aySfwByxyB3B72bboKAbUUEd1d7ysJ57/QXIW2Q68+ziPaPcxk2n2WvEmMXRpG1GZDXDBdu4HlBnPeiy6md/1VFBpky1Ii6W4T0nPhA3KTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727287; c=relaxed/simple;
	bh=N14BBnZYEzW7DFK9cV8i1zuO010YMCnevZrohK4TI+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gq/0VPalh7Adp42+kQBy5eVG4/TD+XbVM9C4RvprDgfyW0NKAECRtE9UH2/d1AZHQwUyq4bHqmy1oWN6j7CNgs6pRVnKwUENd2oaEqJrdtQ5IvzZjMdClEHPVdfSBiN9Mp1gMpgE9yKrcIc4V9Bl+l6F889zkML1TsxWv2diZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBVStTOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2bLecqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBVStTOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2bLecqw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWKSs646316
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 13:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SkaktrxMNR4XV9Ly2K4y2fFD
	nw/dOgJ04mgtABo2xXg=; b=DBVStTOqFmSjdd+L9FfYmxnYcurEORf50u5RTr1k
	dFIR1a3m2INT9Asd77s8Ebhqhr4HqnPO8uO0h4NqO+tbbByptF0gtVDu5+Ryz08f
	+krHS8drlKo6ObKJv6B0PWel05geVsLFHHTTYliXpkwsBFZ1uStifgvacz0cl5NJ
	cmg7yRtMeBXjj2QzgEcz2WB5XLtJe+J29r+svY3c9Wee1h3d/H0VxawDxpCv9Wvc
	NZMI04GbPs8W9iq+l3ZhIAmNTjnEhQaJ4X0uhmK92BlhHwdIUxAs4erOfhc5AznM
	9LGFytLWNe68eFuZuj4HYpabXusQEBj4Nh6BxKFq9hGoLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2291kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 13:34:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52827090cc5so11535011cf.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727284; x=1785332084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkaktrxMNR4XV9Ly2K4y2fFDnw/dOgJ04mgtABo2xXg=;
        b=a2bLecqw4GGe9JDIB9sNIWnPm6KTi2jJ/AAP6dWZxi3UQ7zgQnAYQtaaokhhICyDbp
         sV3TuwF6hSUE6Vw2HZkYLjUew1S/AqM6s4dg87nhd4+UA3+xNu8YpfWNx6UpbQwjTSS/
         0gNRrsdqHG5aIIZpSGXFcYjBTIjjLON9B/1O37DGxNBPza40eI+5fN7g/XMcQkZoStec
         TNHyvPMO2LpdQYk8/QgkmwP5jCL5Vup6YMfQh4NhG/xFKBl+DjlshIo8sygwDQ7nZ7bZ
         AJUDVcoAQmsZ0l07jen9MUBmk3BK6/nDMTb3isA5eHztU96phuCvRNmc7bcB9f2gy5QJ
         pXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727284; x=1785332084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkaktrxMNR4XV9Ly2K4y2fFDnw/dOgJ04mgtABo2xXg=;
        b=k208iBclp53r18q6uZzaQMrYp0L90N3H3OYbftZoayDbLZzLFyWlDWwhL3H/88xP7q
         ztCZmaYTw9Ds7vB36WY32tlKYsNLe8Cycf3Wcq4g8pTxB/mvsxzqYjRRFyCL56nnZ5RU
         RnHPabtoRd360LwQMsTPiq69oLoEBoHMZqhEuTtq1oIYbpSmT3SmWbyGXg3dBeLecHiD
         YrL+fVx6mFmQgEBBogyRfV6JZbEoe2Du7LvWAgNf4u8jKbmC7swdsS1bZlC03WNAHIA4
         xX2Bwrk+dmxyBemU+2SQfknmLzBVFQPDAqd+K8oRnMz4kSGrPuxWyMrzNLCs+f9E4ohL
         nHZA==
X-Forwarded-Encrypted: i=1; AHgh+RpYJuuBEHxZ6+0xOzyIbRSHOs9VM2vQlzmB/HMhgmo0LewCAk7S+SXeqfD0DoaWehAgpnFoNf4bU6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRV6k/DpwHfggfBbCR8dwKm4tNt52QLGYrag1Yc+zqXPNjs0WO
	h9YOd3d9bvNUJCYlKx9AQN6e6yM81a+NC5yVDU9nhFhGEBTu1JlPyDBLvY3qvN3jrFBONKlxFe2
	Xhm1I1Hz5b9RwjAQqJT5R+KGdBrbZE8fuB0TAN5lf7dA0lpixnTgA6RzU58hHF/o=
X-Gm-Gg: AR+sD138cSAiqO/8BNtVunkokiDeS746xUBUYTsa9OP/BbW2L9FI3+ZSmtGQZHfl+5F
	JkW+g7Il1xJvIpkJqSsuVHmrgAM8pyPEkqBwKJEOC10rAx/y4XiActTjV53xLPh/W7dtrhND7R0
	wllSpG8WPSyC2pAuNeYOTz80HdNKN5o/th5UCBESC/TdSV4smidDeHEc7eZB6R6HLxnLbrLw9cS
	477dfYTqx469bDtlgE+mV/ikIM3siDaYCbpAkzkzRPz9Yb8WPG+bozZxB2QXtnnZ2YMxpakkfd6
	oErEx5HG43eJlXK2nFBOKQouiilGLVePAkkN8Phzdpopen+XYf270IYBqU5OUNdzUAsm/9y5Y7x
	21FvVQ+ObB5h9W2FAXlj1Djm5P/IRLRDYbZI/lDqz+s1kelO/hZ6m+YSK7brUcjEqfaVnwzF7s6
	jJ6FEvoZWf6TZ5Xw==
X-Received: by 2002:a05:622a:4cd:b0:51c:8556:55f0 with SMTP id d75a77b69052e-527a9326861mr41663731cf.34.1784727283550;
        Wed, 22 Jul 2026 06:34:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:51c:8556:55f0 with SMTP id d75a77b69052e-527a9326861mr41663141cf.34.1784727282889;
        Wed, 22 Jul 2026 06:34:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9badae1sm482006e87.28.2026.07.22.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:34:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:34:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
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
Message-ID: <3iubu5nrdd2zwdks2qisqmlyzj66wanwpwvxpls6xgrqjrpakq@b2xb36qgexkc>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alFTxg0HLyke0gCK@vbox>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c6f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=kytnFc8dcNkQ8RD8sAUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: S6rIIlErY3pIHC2k8ZHIe4g9GgZ4yfhA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX6tgPRlzr5K9O
 FqWSnYVg0E8pgGu3geXeblkzQEJLo8J3Qbk495PnCFqSZAjmDkQvKML+VT834P7e5ptILhIWHiT
 tHtYzhRsNVswR9ueK3au2ImtvAUegQA=
X-Proofpoint-ORIG-GUID: S6rIIlErY3pIHC2k8ZHIe4g9GgZ4yfhA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX/MChYbP3jTiV
 uI7EkzuQzVXW6wCkW8aU3f1PMEVHfSe2IG872XKPlBpa6g3oEoWNMkQ0jByhK++p6pxz4amFEPu
 HkX5ayG2nrBic0/rD8KJScGxBBZwnk5AJgU4ztfykQEwo6FV3aYzXF2PBHO5Q30VsZkjdk1Ya9c
 davAF7FNJnQaqS4PngJhL3BqTU98lgxY45Dl7evfQWRctGX9BP86DMyJ+msuZc4ycB+byrf0LG0
 tl0EiG0Fw7/e0E7N3SOxCwSg4XkwLHM1OBV0+twdN85M/2fJ9FdAYibOhev3ildhOjq+X2AKBKn
 qX9yQWyo7ATjucO/GDfYcmWCo8clmAPJ0sbTu5IgCCkTFU8NQq4a7/r9STtyGWYH6qmIZ4z8Bfa
 +sXScaHqmCmQ7t68HzRB/X44HyL306bw/vsvmz3+sKp6/ICw8TirZqARyF8qDIqiNAs/kYsPAUZ
 HlTarHTWjioiImCRzsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132

On Fri, Jul 10, 2026 at 09:02:29PM +0000, Thinh Nguyen wrote:
> On Fri, Jul 10, 2026, Krzysztof Kozlowski wrote:
> > On 10/07/2026 09:16, Krzysztof Kozlowski wrote:
> > > On Fri, Jul 10, 2026 at 01:52:45AM +0000, Thinh Nguyen wrote:
> > >> On Thu, Jul 09, 2026, Dmitry Baryshkov wrote:
> > >>> On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> > >>>> Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> > >>>> or not. This is used to modify dp/dm interrupts during host mode suspend.
> > >>>>
> > >>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
> > >>>>  1 file changed, 7 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> index 8201656b41ed..0c6a839be82f 100644
> > >>>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> @@ -152,6 +152,13 @@ properties:
> > >>>>        HS/FS/LS modes are supported.
> > >>>>      type: boolean
> > >>>>  
> > >>>> +  qcom,has-eusb2-phy:
> > >>>> +    description:
> > >>>> +      If present, it indicates that the controller is working with eUSB2
> > >>>> +      phy. This property is used to modify dp/dm interrupt configurations
> > >>>> +      while entering suspend.
> > >>>> +    type: boolean
> > >>>
> > >>> I still have exactly the same concern. This information is already
> > >>> present in the DT.
> > >>>
> > >>
> > >> Could you clarify what you mean by "this information is already present
> > >> in the DT"? Are you suggesting we use the dwc3 node's compatible string
> > >> to infer the phy type?
> > >>
> > >> The dwc3 glue compatible describes the controller, not the phy. They are
> > >> separate IP blocks. A board variant could reuse the same dwc3 compatible
> > >> with a different phy attached, making that inference silently wrong.
> > >>
> > >> The phy type is described somewhere else in the DT (in the phy node
> > >> itself), referenced via the phy's phandle on the dwc3 core child node.
> > >> We could walk that phandle and check whether the phy node's compatible
> > >> contains "eusb2". However, that relies on a naming convention that isn't
> > >> enforced anywhere. All current eusb2 phy compatibles happen to follow it
> > >> (qcom,sm8550-snps-eusb2-phy, qcom,sm8750-m31-eusb2-phy,
> > >> samsung,exynos2200-eusb2-phy, etc.), but a future phy driver could break
> > > 
> > > You have a fixed/finite list of phys which needs something special, so
> > > that information as Dmitry said is in DT already.
> 
> Are you referring to a fixed list of eusb2 phy compatibles, or a fixed
> list of dwc3 node compatibles?
> 
> Either way, the list is not fixed. New eusb2 SoC variants are added
> regularly, and there are already 12 eusb2 phy compatible strings in the
> DT bindings but only 3 in the PHY driver of_match tables, they don't
> land at the same time. As for what information is already in DT, I've
> addressed this above and in my earlier response.

As we expect more eUSB2 PHYs rather than non-eUSB2, you can add a fixed,
closed list of non-eUSB2 PHYs.


-- 
With best wishes
Dmitry
