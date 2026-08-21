Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41008490BE1
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313191; cv=none; b=Lrh4nll1DyhSdtImQYWu29LzpK/C77u+eIob+ifnKqiA6cRhCKoVPK5pYVjQ2Mve+BGLmdQwBpGX1GIeSiTCRLRtiFnFwIv1HHBtvnOA3+y72WpFsdBnuz+BuyKbA/RBFU0aiRBceW9s/8C4WGna/PwCQTnMBxP1Gz9MzTtFPD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313191; c=relaxed/simple;
	bh=hS2sMFpEtT2i6rgxbrgizb2uT0qrjJ0FAx9982mu4X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vn6mAWJhwLHVWG+WVdq9czsKAEQe1lAsdOSR9xO4UqFVeGOnLY9Cpkwgpb95pLXYjKPMiOtnzqaaZCNqNs7ssxFbxL7WA4AOiVXeP9v9xF4Frr546pjlJOjR49F9oxTWKeWntpgckZRZxgXzIPmQrgjoN8rbfD1zfoobC2agHsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lrwSXMXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Txy0grRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lrwSXMXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Txy0grRy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LBqBWT1805133
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 11:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fiHsyA/uvaGf+tBz3ZkBrolH
	K313csHTuCFdKGCVS8A=; b=lrwSXMXGX7sAS2tyIXY8x4HEawITmyl5h2m7A6Hu
	7ryP0GOgNlCn0s7S+bgn+rYWoqZEpzUOBc0ZLdxS6oqvqIHN3C6eXVxQPYRs6YgU
	102MSnZuJ1YiJd3hvkPCfXLB+sWlYkN2YMC7qdhciHd9Cdpe0ehHzG1V5x06BXLQ
	IvlWuF2bqyhN49kT/4g1DhuguBGjuXEW+hLoD198z2lSbkuynisgzkfpU7Lwo4t4
	KQloQuJ8VnnUB4ImyWHysqh1D19c+WfKN1LWAgICnbxSJAdx0sBr0IbxzkxfVsBG
	MDzWMjg/GNVeYmm2wtv1YZFQ52p28/Qi/DvqfQ1LVih2Qg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbw9hkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 11:53:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7b3b6aa2so11143231cf.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787313184; x=1787917984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fiHsyA/uvaGf+tBz3ZkBrolHK313csHTuCFdKGCVS8A=;
        b=Txy0grRy59X2kt2S2qxiMkM5N24kvY0Te7Je4wRl6FSiyyIgK825aVV0UFYZHnvZJV
         bgt1zR/Hd13PSM/iWCAyvTBjkpPqlsczQ+bLYaUEerkRYw04s+2OTdSQmE9TsNs0hZAJ
         5zVnOa/4pBc8pXUYLzhh1mW+uWkZ/rgmNyZEbtjRo9/cNbP7tO1smGWeRMUS47fb0d4S
         1Es/HC8QWBeZ0Z0wjtqQ0YiLJFzPE6xiqPrOIQ73lEm74GEbgXfugeDy5kgiINB35jB9
         iweD58RFWHDyZWoJB4eb4fs3gOzD6A6TF5CCKamebH9N/MH3djI3Cyge+ayr1Gk1mExE
         XvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313184; x=1787917984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiHsyA/uvaGf+tBz3ZkBrolHK313csHTuCFdKGCVS8A=;
        b=sfwLpoHFw3t28M6YLiD+Do1C1+DqaCwTqnWEhVuuiEyswiM1tbUaTsv6lynyfjXqhB
         K/9o7FgUrSzNCJ5FE3UxdkscM28HpDel/lYqIsRRMZU1IleTN30T+wcjjp/CGRHBCiDV
         SQNUylC/U8+oEYG3Tkio1cpA4BLPXqnYlzsOZ4cuww1yfifQavlK0oIrWfkm6UJ3cogx
         x1CFGwyYabNLmttAy6n+6cDV9eYerj9VlLPAfgx/C+97gVZNnMPIAGIg3usJz3amC2nD
         CKrMQ/hKqr+HaHhVpzVopUewKfWKqRB7TKy57UkAa9e20Ww+VcIo3fk/HBCs5+JzHYx0
         78wQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnuzF6dgzL3vawkMisMfoi7O40+uOnRJGjXqx0y2jVojCulHGFeFcUTept2NgW+286Ob/L9qNB5Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVilVZFZpgi4tsfnVufC8mZGF+iHWFpLtZlI0rAjIZWiVU8x5
	M09V9QnRdvwNxHXhS87cWfirfGwZqdfl+8u+souEKeFKth5XESFRl3hjrw6JkMd9zg+DU3WlnPf
	GA3I2AfQ/CYIxBBSN7CzFCFG0PPRolopj7G3w7aNdAqgs1n50qWVOlnsVKVor3Pc=
X-Gm-Gg: AR+sD13E3QaldeRGmKTVfLt2laNWqZpzYABt2Yi33fOsvIC4oj0SR2FSUwJazCcPYeO
	OECwOWQfxrIVtxmSGwhM3Q0ClO3wfZn/eT3A5IXQMHEtnlTi4HkQSNMXCiX7hb++SMwwSKA1u+R
	SiGuD3g5/iqrS6VKjHl9nb6cBpVBKV56N2keUiEECu874OGrtA/sbmO5uZ+ldxfL8kk3+BTeZhB
	aaVgY+mGva3o4lpWyiCKwfOO+nUFQOBj0UZxn5wvaJTe8JHs0VZrTUErw2D4UA8yug70lkjcBgI
	jRJxHK7UV4JWXxcLCMqR/G0NrQl5xQcFtVqEctI6AUJdL4wK/5mE2QyXYrMSlAk2kk8KFD+Pql9
	HBlC2vdMOS5jt82I=
X-Received: by 2002:a05:622a:1454:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52df572bfa7mr38613941cf.12.1787313184231;
        Fri, 21 Aug 2026 04:53:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1454:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52df572bfa7mr38613471cf.12.1787313183707;
        Fri, 21 Aug 2026 04:53:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df739sm396902666b.49.2026.08.21.04.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:53:02 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:53:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: ucsi: ccg: Add support for
 cypd6129/cypd6229
Message-ID: <3gjsvsmuvmdgt5dmz32dkauyztnnr4i3m6k5gxvuigg43frf37@mzs43cpjrszu>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260820145036.2035641-3-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820145036.2035641-3-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5MCBTYWx0ZWRfX0JCRGbgDfS1f
 g3ZOk2URbbiNbNbGAVCDos9v3LCDIr3A/G36eLrGJ0nx37vPMPlvVZ028SjxSrPuF8l6iUoisKQ
 D080YeS3e+T/bSVuXIO3t4b761o8sBA=
X-Proofpoint-ORIG-GUID: 6E0Z8pqklxqYsvJzuO6ZItMRhw3cFq-m
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a883c21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wQmYZ3ktDRVsrDT-OGkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5MCBTYWx0ZWRfX9yazJKd/KlzJ
 AtYlIT1falJQBSWrUZecdSwLqMs80vqvRxlD06QQJcLU4egme+T4yAU4+8zxcLlPPZ4VqR7SWSS
 FN0Po9JCzO8j5ZLpJsuJmYSz4Ne/c4hGTa19OcctoLQfPwPP5bjtCtbL+sYzN+D3CPAQHJMQZvt
 rknWPLV75Y7r3gNrFmCunKSq8mnK7fy8SjTzTvrq794BKicBD0TtjK5Qy8rb0mGkdA6ByYW/hvC
 IXG7e37SoktqgoUcs5QVE7QC4QOphTSeKN6nEnmSrfRxVrMOdAwdYM5sRmrA7Erg21mJTlXnz1H
 yRs+sp089VNZnGMiIPgj8MVIOMJr341kS861lBFpfKS7oslpBumaRC6MzNmuYYC9ckIxhVvDZ8Y
 25kiQ1RaacW0aUEuwt5rVcZ/XHoO1WclK+ktzfS+1zmFxmtNLET87YFrIaYwosK/+QofQppx+Cc
 ycXg+9MbQGewgHyeMEg==
X-Proofpoint-GUID: 6E0Z8pqklxqYsvJzuO6ZItMRhw3cFq-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210090

On 26-08-20 20:17:37, Akash Kumar wrote:
> Add cypd6129 and cypd6229 compatible strings to the of_device_id
> match table so the driver binds to boards describing these Cypress
> PD controllers in their device tree. No other driver changes are
> needed since the chip is accessed through the same generic UCSI/HPI
> I2C register protocol as the existing cypd4226 support.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

This looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
