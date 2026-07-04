Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0852745E
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 00:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123625; cv=none; b=hg4MNAqRhG5EFAp9DI3CuQKm01+3/VhxPYvipeO5AiRcpc9hzeNJ+QDr0QmLghSkfL1TJrXPvL5IFPHb51tIO3pUC1mSyN74WpQ+6adsLXEk2U6+Y+KCxD7ZglwXMIX7ih2XzXZVz2a87FLWZujGomubNcrIqUomXdKWCaLbPHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123625; c=relaxed/simple;
	bh=BEogSRGJNPbF8wmvoZiqLfnguBw9plhyfs+jR+zpRe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv8eqNcoWXFy9/PJr6RF34n7i/ytpsjRLRfiMFwU+d/2WuPQx45JzrkHrW+StBoC2Ja+lHy38VoHcg+EckaFFsuxehaz2os4vk5DqhTBB1Y9Zoa4Kw/SuYqKtx5bUnkqJKP2oZfttBJ+rpbabXHW3SA3mVv9Ua/E4KOYHRs+p6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+43f+T/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQHxQrAz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+43f+T/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQHxQrAz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPm3l838171
	for <linux-usb@vger.kernel.org>; Sat, 4 Jul 2026 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f3Ta+pCtFjN52t4dGBtiweKL
	a21WuFYkkIm+cxb/tHA=; b=S+43f+T/KMK7tDli6vInt18Owr8e9xtn2v1C9kC6
	wS8wVfGLuR+S84IUdklzv/ZF8r3Q7YbWPjm+DaaSbK0JGJg680rSioI4T9wMZIGp
	o95SRBOIMkkhx0Fsw2sr3CvFcIy6cGo4cmrc0bPdK/K5BdncNlv6+S6CE71W0ubX
	p6VI3feGE/jReb62GTUM1idSigOMBbLgr+u0/WMfslbX6e2I6Zc5xSnhvjYqMKsW
	9H4PyYsXuSmau703ySxYmXVeqcxkZipaqHPuvFes+IuN4TSNTu47xGz7khMUbDgp
	7Y/cDUVJQsyHvzBJGPuflD4rkXSqqfxAgzw37A1bmnN19g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu53m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 00:07:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so71081885a.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 17:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123622; x=1783728422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3Ta+pCtFjN52t4dGBtiweKLa21WuFYkkIm+cxb/tHA=;
        b=KQHxQrAz1uv9AhaO0HVVrgo2S7L+0tN/y0dJDGEjfMhisANoln0T4Qj92LMYoSoaow
         O1Ar26ip9lhhaRITNbokuHW9fvvuYztWfD8gNnEvU80vF8PAkxqEuFYhCFZ6AEElIjcp
         ESoMYSfZ/l3F1fCOZbrSMjPQK+sR3G9kZ90NVGnhZFLNrCqj6Wki7JYpR52vdTDnCGg6
         keVKmb/ImoLYHt0iOKdgBaD0DlKL+zQcCrMS/BK59zvGWkGQsxG7bxhg+Dq3t9ThSJYM
         RG3G2Vsp3N3VVFjPMXA0khv5JX/YIrmkoj/sbeWCCYjbfFlVeP5XZRgk9/1jsQ5henH3
         wE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123622; x=1783728422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3Ta+pCtFjN52t4dGBtiweKLa21WuFYkkIm+cxb/tHA=;
        b=NtZcQlGQWWfHC0ZuVFGTMqNL5IHutOoTLysZSz09wgqRqD+eJwlhJx2khhC2vKZ0mL
         pQ5X2YZOJM968cOMNFXzsp90cHRM7diEI92JYjiBiXuLytzzSZzrrKSKKuj+mq0Hl/L9
         n7IyvkyR3El0pPPGD5ncVceihLh4zthjtLIZqMI1YJMdhT7HOvVe3j4tLxRLgukrfBUu
         D28ijI/lgRYsfQ2pW6QUSMI0EOVl6qLsy88199+etQUJ537KwGf5EMaQcKRNwLVTPHTz
         lZtU1dX1QttZKJBHhE9pw8JxlZmAWEbwWc/YBoG1R9/67uxsgKh4OM9cFDCsCwbPOjf5
         w8Xg==
X-Forwarded-Encrypted: i=1; AFNElJ/F113nVDOiBZSWSPNw6iYACPyHpUtnEprj6dp9WuBFvr2RXF7CyzRNZdM7Ab5tJanWQrayeeEbO08=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPBmdVlFA4RRLn0cW4boaeQAeonk8k5Podu+hDgFDXNCC8eIW
	lzzkKDgysXMu2SU1x64lbfb1MnGTL3awN/6r0qI+y+7aOc7vIy6uzDnlaQa3VwJTngbKsbLJl33
	y8Xp+Fys2toa/SxI4ff+49nvjauhgT5EjkYocK9LtBRzM8bZfJZHniheqYJ+0o9Q=
X-Gm-Gg: AfdE7cm8jno/GLDQmaQYAKFwHaFR6CWh1b0vLKLyN65WwyIL30N5g/RfRqnIKr742wc
	/WKw2hnyHlTr2mlNIVYYM7V/CSHTjQxeh6VCbsU8lKDPxVsOk3ehfmHvd25C54P86K5F4fwcX4m
	D+3pF33E8VyWP0I90rkbSM/go6STNNHYihErZKNroD/DXX5xyo1s72i1jkh7P7M+gByC0YMJQRi
	fyU7BqKEN2V/m+1m/DMY910UlDJd0TpwJYyJBzjUU6psYDwTBXo7mljSkEOuHv3mKvhuEs+v9Cp
	s/8DPdcndZ/1QO2VsHRkobudN9G8+2+L15TAko6lLHVg9FfafyI6qTzVVj/8hmr7ua5mYplf5eu
	IUd2Bn3+7vOtW2JENkDO6fWejfHXEJFjyw3dfKvYfc/eBi6Z65Rfme6nf/be8L2I2hF3xtvT6Pa
	kPFgXWDguX/ptQqCEZ/tlB2Cb5
X-Received: by 2002:a05:620a:29d2:b0:915:9de3:2260 with SMTP id af79cd13be357-92e9a3cca28mr230201585a.24.1783123621737;
        Fri, 03 Jul 2026 17:07:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:915:9de3:2260 with SMTP id af79cd13be357-92e9a3cca28mr230197085a.24.1783123621256;
        Fri, 03 Jul 2026 17:07:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8d0esm863792e87.84.2026.07.03.17.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:06:58 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:06:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
Message-ID: <2r72aodgl3ff3gts6nwdmvujluehmuhlpxnvvyzshgwcvpmjiu@77iff5kuyo7k>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX3+CHReefMeQq
 xO9tDcf3T39YZpROU3yNpHvuKoNE1DlDMB1zgEKo8nw8j9t+BmmmNtPliLMBnxPKHHkM9mZdvSJ
 LS0tx6xldc2flSAzE4ueTIKDFqz8RmJc/OzSOk766ZvC2wFViId4jg5e9oD8mRuhrRkiFCew4SR
 lkeL196irOqIVh+rAszW0FtzF4pp55iQhpGj5uKt75Obg4+rmt/p3LC/sMYbMQs/Ohz7nBbmqoX
 XQl4Q8cdsGlKPdekNp2pPrIPF9KwmbFNbnlx12xZ31/bnASBltqJFHdIW2TfgW/8PZK4gFLZ7K/
 KrwV0AWECRFNfK1rpALhJauLh2bf8BZOIYXj6kH7tuCaHq/pFhhLqVRy3SXU8iH22lDaYLJm/bm
 owtAP1RtRdhaXr3mTyWr3esu8oC74HSeM/wDEDm1GN1Fp5WhPdNUTVyGtOXXKL6dXJT4g5qAKmx
 K3y+da/aZy9+q8iwkwA==
X-Proofpoint-GUID: zMVBURpbKHNj_Il7g7dNNDNupDI9nLWR
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a484ea6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=whWooV66aUwbJ3_LvogA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: zMVBURpbKHNj_Il7g7dNNDNupDI9nLWR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX4CiCvg1hZGOu
 c4DYzf5xUuKpZCXW2ha5Qbocj4XpsTDiYLzLx6DMibJd679DeZW4JUjX46aX0XF39OaU/6sN2hY
 hDpr+nTK7HJ+2/5kJy8HYuwLFvN6TFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243

On Mon, Jun 29, 2026 at 07:48:42AM -0700, Elson Serrao wrote:
> 
> 
> On 5/1/2026 10:06 AM, Elson Serrao wrote:
> > Note: This v4 revision introduces a design change compared to v3.
> > Based on discussion and feedback, the binding adopts a child-node-based
> > model while preserving the legacy top-level 'ports' property. The
> > child-node approach is required because EUD needs a separate OF graph
> > per UTMI path to accurately describe per-path role switching.
> > 
> > Link to the discussion leading to this decision:
> > https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> > 
> 
> 
> Hi Dmitry,
> 
> Just following up on this series.
> 
> Could you please take a look at the updated design and share
> your feedback? Does it align with what we discussed earlier:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 
> Please let me know if any further changes are needed.

Excuse me for the delayed response.

Yes, it's better now. I've asked a quesion regarding using eud-path node
vs having more ports.


-- 
With best wishes
Dmitry
