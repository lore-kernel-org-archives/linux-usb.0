Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96F3783AE
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785098202; cv=none; b=YjEdoFiJdI47lYWyLV/O/E+4nnnAU8eItlOkgVmA1G+8ht9Hskpc3tuyBy5KUBNDLyj55LHGtcWkb3Ip1ijSyEWZQ+PnGUpPJx39LuH7yOGxAaTnMmhe+O+zu54Ahr9PYzJElP+rbSQaZB+KoVppO8qD6dQn83eF3gB/6rzAyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785098202; c=relaxed/simple;
	bh=y7kjeseCo3jLvRjITiUtdMe7C+PcUuDHkjGiN0ErxF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAff3iqGPKJnLmay/KRE9nBSrhdybypCST9oUvHkY6ZTvt3mQA1WDeLbzurOT4/2WebxDD4Veb2soJhXTXUF0LOGrDQYeZGal4asEHLv75E0gJbXcTBiByUd7hdpFeAtLXFTnkYaxzCfl5g6d3kpvZGbgc+iHsh/FHPh6qj51uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyHhn1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqe5eNeS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyHhn1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqe5eNeS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJwiIM1438392
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 20:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dYqZc1K9+IkncN1pcxi2sBhw
	OHcVvXQdWRRUI8PWtzQ=; b=QyHhn1pDVumlhl3jbDzaK9pepn+PQ1ZJK0msTPq7
	jhogMnLLNiwiUHMmJdK225j1bjfH/5CgUXO+5w2a/Bd1FOCpd3+2gOyOLsJzlZfa
	EJvH7J6WCPzRHMBK66VBENbE97iZ2pzRxl8ScRTw+yUTp6TXiMk5w8NVQsMKMiLT
	P9/0ZJou9h50DrrQcB+f+5IkieHairxmd5bgZOwmU1/Guvd6QqYD4cvH+oHi0PCH
	xeAVjXMDCz9a8yC1drplSYklrGw1tcYw2bKIQixoWlI3TVtyY10xFtkYh6yu4FVW
	PakUJneNmMsfEPqzyaTtnQPktv82HrnlVHS0OztP4frJLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7um7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 20:36:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so26430711cf.2
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785098199; x=1785702999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYqZc1K9+IkncN1pcxi2sBhwOHcVvXQdWRRUI8PWtzQ=;
        b=Sqe5eNeS7//3Ya71yXBqJIVj/3B+01YpwKe/Iu32ib4f7khqmSykSrsIMShm/fSW7Y
         kya80v4smdRt5JQxCQvgJgVz/7Tad0ngTrt0/nvJtAYkDQbzQNiptXjqyfl5wnMf9RXM
         r0k7+ByKn61JAwF3LcpB4rtJKWRHsp7QFDJ199A9nh8iz3j63lVFWWlkHN1yUM0hvzko
         CgxgNKbKE61QjCoedWH1+QEyNCOKsxxMawamjhsb6a2L/NdSwI+jhTZg1W070YN8IaTR
         P45hmRQShVwJ9O4GyJ5nuFvXsHBHDnKVKZF5mtvIWsx1XjJ6UnS/bnKa5z47021Msb5D
         mf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098199; x=1785702999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYqZc1K9+IkncN1pcxi2sBhwOHcVvXQdWRRUI8PWtzQ=;
        b=H4UTWfXaHc7jpgaUCxmUqc2ZDqwtvdYdfgQnCC2rqaaY+mK5J2NtREkvLm+HOoOtsK
         o2Gk+s8z5nZr2PdlXnrUD5C4R+2fxvWndF/2LBIn4ImXfjguuY/9qAdhIZG7Bu8YceN7
         ubiFtEpXy0iwQyvl2uAop4VWK/JClx4izi6FpOk8hx0YO8buweQY+lUn1/ZsU3TA/ofl
         JmEpW0MckbEAO9GrbdRcHJwh2GCxX2j0ZBS1qgBss56MjORDjWurF+hE8knlHp6x0ORh
         PrPSk0RGbTH+k9inwfCndcPmXmJBlXP2/JW1fakY3iAZoTBO7eGAX8iuOufkUHXf/h6G
         i7ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCxEhPaIejjgwb6NL/e2b33mPRJBpSaYQgv/EQvZNWIMYLPfTwwZOmFluRkErgG08rtuyYsIDRnkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4+lh5f0HQVQKYZ4CDiOtCAixepPMYaew5IfmD0WDt/I3q6d4a
	DAF8xDaRKCWNQg200sRGMHTLis5jciqZp0xQ6B+dx+wleID+o4ONtsBPljejHKN9aOnS/zUMVFR
	GmxxVNSvuDIdeOFxWX2vhTtpPHIBtgZgINA8T+HaEanjmAscYz5V4HEp+XOfDEuI=
X-Gm-Gg: AR+sD10+ijYvkmpuUvFNmLdBmkc7dtrqcHG6FDMl+5Aoc1jmkzfCa2VtCB3u2WIG2gv
	vVT7kL1n0WgrbmATDNdr/2EvGwPr/pKNfzvy6emMjplhKt4x5q2T2xFFPOE8SdA0Epv7I/H2jOS
	+aPP3YnrFSFMoy1HQP77pzBr1UnctXiLszvBYmcuYXrpCFQZOV0eKgJm87R8jONxNV0pqq4GsOT
	zzxJcTQ9g6nFT+TmfdJwGubIWa/xfSSYiFxU+vZrNusDDf9/VKy6fZRkTprzw7IoecSauhhQAD8
	CE+wtXtp8wdQqNjJqb8IzxFl/MlpQR0GecyNbBcS74Tm6mNg7GLBx8K5wbpF8PjJnRnUDx2F95X
	aGIsweD3EQxH16shT4+sUM0ereexdGIQOiWPvdhC5r2SCxv5IyZ/ULGlS4j4ffpIa0wUKo1UnYt
	i36aP0nycKcYllfA==
X-Received: by 2002:a05:622a:1a8d:b0:521:987f:bf34 with SMTP id d75a77b69052e-529a8715146mr65796211cf.61.1785098199140;
        Sun, 26 Jul 2026 13:36:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8d:b0:521:987f:bf34 with SMTP id d75a77b69052e-529a8715146mr65796051cf.61.1785098198753;
        Sun, 26 Jul 2026 13:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1ee2afsm1064790e87.64.2026.07.26.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:36:36 -0700 (PDT)
Date: Sun, 26 Jul 2026 23:36:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Message-ID: <izw3biesoubceggbg2jg5tvptzqvqcrwmixqyqi32ftznns3p5@74nso23e3bui>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dnmtp7aCqAIomb5NKMTVXj3unoskcyB-
X-Proofpoint-GUID: dnmtp7aCqAIomb5NKMTVXj3unoskcyB-
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a666fd7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5r94vnxKtQZQamoODnYA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX09nVZ+bZmWtQ
 mr6SGKldq5n6J9k9mDulYDkOpSWostXRLl+X572N8mag3K/0pIkAMsC4Hf7G7XyEQfG4TAcwJpX
 BsYxIalXddpYfvVH7zDigd1GryWRuTcY/dUn95Ol/dLluKS7z1PCHeFP6trF73uaG2X4xRTrY3s
 CR7KMq7gu69RufaTiJRt+LbzQklz/als9lS5T2/y23GgbaeBRF0dr2OIt+kExYYlVYSyAv3yWhl
 oAdyTiuwAJqJyBaQ10SBCtXc/XSfsMqsDvuRFfQk7Pz50TX/T/PabMIWdgenTfj5/kvyoIX92El
 oNdUeIN3XCp/woHiK5uDz7nT4saVSCT0wVTPXbU9uRaVx98h6DrdaK1vC3dB0X27zEt5NfMmEh0
 PwZZ4yGlRcWLR6yA4Q3g0OXOC0J20u8cBfHvTkq3p9j9X9hcBThYBqWtADkpd/dTWGsBBg+MEBd
 ZfTGEiRIs4wWP6GrOoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX5C3TKBVXM60K
 CH/aDaMlm5JWz2FO2Lj25edcAD6SZ6P2R3K/vOMu2qupUk0hzzoQSiI1Czi/hVtASHdu8jtTR6R
 mR2PKdeoNFg8KTDRe2Q4DQhuZcF9vMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260209

On Thu, Jul 23, 2026 at 04:09:04PM +0530, Krishna Kurapati wrote:
> Add definition for EUSB2 phy type.

Why?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
