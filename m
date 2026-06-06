Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB7230C63A
	for <linux-usb@vger.kernel.org>; Sat,  6 Jun 2026 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744890; cv=none; b=nzzWPOOCVYQjYEBv3Y+ntE8yyT4UF6TG9n6xxW9dOdQBiuDOKo5lKi3tTqxl8nAkX08QMEOM6UmPrg9XViuhwh/owbrxC6bK0xgP/jJeAWcd4unuL4pXlKN5jlCt3l4dUktf32j7vPoBWyaVgSlN//4nr+ydDK2eTh13QMVmk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744890; c=relaxed/simple;
	bh=IO55ycN77ykj02j3o0MZ9btGWE/k+GO9wk67q5RYNTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXA1TNcT70seyOpleeCQymlIyaFnK5IqZOMd4uDZg0+KE+asAJNWtkKYgB2hZn2wu1owccRi7nHHGIGArAWNfPrwUXcH/pozMMFdMdhZrDfQC0jfDq7queK+1euQJFqfK11eKd8efBK8q1uUu/EdPCTyKMOwSph+eIq97kNnfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGDdeadf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJKAcUk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGDdeadf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJKAcUk+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGplx1302359
	for <linux-usb@vger.kernel.org>; Sat, 6 Jun 2026 11:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lQwX1eeP9EXpHD1YE+j4Cxtk
	sRuCZmaeuF5xe4VQvg4=; b=pGDdeadf8tZKguvtsL8M4G44PZ0dZjOIy7ao3kua
	+RnVqHDoN4IjClHLSzbb7tcW9YPVRH49CTnKqKk3pWGQWz/0snlqR6U7iFivX8RT
	l3cw+p+XXZjY18/9cnYCtv8BXkuNWok1IOe8UHj452NL9V1KcGJMGPrgFgQVuRxU
	IVI9k8IUlrEx8OzkAUYNidaBWdb1yKtX16gIKZbaXzMWmgQOqNRgPJsgOP2azE4n
	h2G8vuYXibEQ+DCme706p31LYTYngC4Vd7d/qDh5ilBI+BgBFG958LHueBw+D4Ii
	NPKTwQLw1Cp9LQY6/dw0fzgEa0HMTUdyihKl26ng1W6Mwg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx68tpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 11:21:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso4139988137.1
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780744887; x=1781349687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQwX1eeP9EXpHD1YE+j4CxtksRuCZmaeuF5xe4VQvg4=;
        b=iJKAcUk+Gs9eJu9pQK7C9BvlDl1c5aOiUedFo14HAQPMF9xFYcLgjvJWLeLxXMldy1
         KChRbiJu1EU2a8BfzDALJs5av8fAFC3X+jJMNJCDfYwExpuv9JqwdRo/zx1uN2pS8g+4
         yct++w0P9tdQGdy46H9RVthDxOU2ps9JdgCN8XinVyuaQpu9Ni6FQGev2uAfKXVNo1ak
         Tb8xQrFrkVEZkF9kl48YG4LGgi4cwVuo+Vx4KkHIZze8kDTX8IvmkvhoSZV3nBQH3I7v
         21QkOZlqSk4vSEWpEuqngMy+QN0abaVO9V8tFCc7dkeAuKak/n8+UPSptumdojDO9g6S
         UFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744887; x=1781349687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQwX1eeP9EXpHD1YE+j4CxtksRuCZmaeuF5xe4VQvg4=;
        b=EjdUK/X5oAfH17aDWjev91oCRLyJmwiLQaGghNoenQ6ELLXXkQJE/myDIoAr0weXQK
         g7Z/ki3aPUpYlPEZ9Nyt6nJqKzBNM3R0v+JC1SNoLH+N9HpnTl/ivErp7CYblbEWTN63
         1vcyy4AMKVZsO1HtPoEB7RrxAWWHwsdgd3Z8o6xmaCvAYmJdrBmKe1dGCmuK6nIV9nn1
         YpMNefS2+9c61wJbb/THbQ1NadMxS/+O2eCMDG9JQ+Jmt0OY1SP8ju48Eqk+kqqpC/6M
         KV/pfbrVf4HeYqHnGcd7VyE6Du/iPesT5R+yUsSz7s1BlbA9scBgFlms8WYANxzDQkvo
         O+2g==
X-Forwarded-Encrypted: i=1; AFNElJ+VCWNZwvpNXwr0SotIWWvErB6VkGIKXDuQbGPN8I9zR36iJUaM4spVa9AEH04BSglotkKzebnhZDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeGH+qBQu9hGcVF/5uQqjO8BOZJjxWoKIWplOJ9WcuNBJDFHw
	JVNwPFaZUrpUuPWbmVLi7sBUXlzXRw03bmlj00LUGed+YKs9ajcYXLj2B/DLccNbjuHNK0vagHc
	qV9fNy7yFkrkmG0Abrgl7QXRmB2+fOnW0h7gb66QeJjT+ChxtbDnaH/C7lm7Fbp8=
X-Gm-Gg: Acq92OHGYJ+7Z08qEGJDtdIz4sutwnK5dpxBVCRErm0Ts8IDb3M04GlroQC3o0pEMa1
	5BKHXTUDXnD8JllHNlIYqHH/oDa/gmy4DlK1XnldkWUWtGtwpqWLSzGYcvP2tIQ25tlRUNRvGup
	bVrrPxCUx9opRWmCPQJJwgPD5S5p+d5MjEXKL61LDzvulX53XwnCN2FAV5WXMeItstnQgZz7i4Q
	jVecwfWqEQkfoaXfs8+ZCCkXjeJ14XPESRv62FPHKDUzYQ6YEkHvLQy0Op0taleNbtAQIlb0DNS
	9/dORxalRtwHgJj73dDG6QdpNRoDb+qOfTIVBDmwuHUZOu2YVKdbuuHFElQsmVEI2PLh6PXk1+6
	KqLYv/g5xTiZ5Gd3Lfj0tx37aeeQlIX1Rx/LBx3ZX+faFQhd54/iy0QsrbNOGvMrHvRtqa5O8qm
	7ZQBf3ASO+dhy8DVPoKi8DW8HDmgDDMFvIdcsAx2txAiJUmg==
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr4574371137.4.1780744887153;
        Sat, 06 Jun 2026 04:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr4574362137.4.1780744886783;
        Sat, 06 Jun 2026 04:21:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac1esm2400684e87.54.2026.06.06.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:21:24 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:21:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Oliver White <oliverjwhite07@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document
 snps,reinit-phy-on-resume
Message-ID: <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com>
 <20260605190638.GA4188454-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605190638.GA4188454-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2402b7 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=Zo7aC9OJPaZIPdUTQJkA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMSBTYWx0ZWRfX/TBPes1rZujE
 gNMFWeVCjX59SPVRrmyu6soZulJCyFIaPtovcF9eqv+8gUwBRP3QrIe4rnet66si7t+FXpu2wYH
 liTRjrrtBdIOokSHnFcrg9waKAsV8TceErqZtUNFpQRpmRHsspANYjQFS8gz0qkwV+iHLlbciCY
 IFH59+3d3q5BEDSOQ2mT4AqjcNOXijyLr8e1voLfpeYo3N26zUN1xLDhWUEKK3IPO3TJX8kltAT
 TxeQP0p9XAnFM9Yc3nGZT8qY8v98/NCYSehNwnCI2X9K9W01urSQbEvfNQgER/Z+6zK2sTgjOu6
 mkQcGaV69SJvoVHlcRoKVUOPRvk8TAoiJI31ETsotOVcDYpkA33PpHV+c+YuiKsA58xTEeUd6sq
 40lyCy8ochQ4yeTH6WYZWDo+Xa9cB/mODX8DDwsGLJ7Mgjo4lJBkZARUlkmS4Kggi6evAZEETyX
 fCsxuF+t4U2v7+/5dUQ==
X-Proofpoint-GUID: tWI-27SOsltVB0kh-N8OvdVEd6DPpFID
X-Proofpoint-ORIG-GUID: tWI-27SOsltVB0kh-N8OvdVEd6DPpFID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060111

On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
> On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
> > Add the documentation for the 'snps,reinit-phy-on-resume' boolean
> > property. When set, the DWC3 core will perform a full phy_exit() +
> > phy_init() cycle on each USB2 PHY during the host-mode fast resume
> > path. This is needed on platforms where the USB2 PHY power domain
> > is gated during deep sleep even when device_may_wakeup is true.
> > 
> > Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> > ---
> >  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > index 6c0b8b653824..d12f6ae81ab8 100644
> > --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > @@ -212,6 +212,16 @@ properties:
> >        When set, run the SOF/ITP counter based on ref_clk.
> >      type: boolean
> >  
> > +  snps,reinit-phy-on-resume:
> > +    description:
> > +      When set, the DWC3 will re-initialize the USB2 PHYs during the
> > +      host-mode fast resume path (device_may_wakeup). Some platforms
> > +      cut PHY power during deep sleep even when USB wake is enabled,
> > +      and the standard PHY runtime PM resume is insufficient to restore
> > +      the PHY register state. This quirk forces a full phy_exit() +
> > +      phy_init() cycle on each USB2 PHY.
> > +    type: boolean
> 
> This should be implied from a platform specific compatible string.

Platform as in the "root node compatible"?

-- 
With best wishes
Dmitry
