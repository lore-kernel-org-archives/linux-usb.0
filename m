Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BED735A3BF
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927235; cv=none; b=Cdm7NcFxjCTuiZXz+/MG2IXqfJu5FpyXgnHy0t23a6rQlw0cwBb11ANi0Xe+7T4+2W7QcaKsxRY+2gFbLZd52d6AaEs/0xqmHm12TqEcP4ItmhGqs1l7vePP5Wk3/Sfd1ZFxB/dRkop+lGN9/cz8ZBeg4iDhriGrCUXUQowGIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927235; c=relaxed/simple;
	bh=0Z1Bn2feo6g2YqQo4iprKdFnf3O2bNtJay3tzNauvVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUbXPn1oA9+CqcR6b2uHPWUAFgdhKKi6gD0t2eeAPfuOb7qS0oQk7Rq5C50jvBKo0Uyqxmgibx+nxF25NOrBc/rq91lgAV8qvnWCesHM99Ouk4tenOd3OQhnPFvd9ydsWN90AW35QZ+hSFIQTKs5K9oEokktM/ClTdr9SLle88s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X79RIm6O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nt+A7m8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X79RIm6O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nt+A7m8Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nf2s731614
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNv+b9LdqbQvBVnVS9SYjw6b
	sRFXfGraMJ1uo1KKPgk=; b=X79RIm6OaM9QA7ktLcGA/Y6uOmSuBpi7vviBhrZz
	cYo+PxwwdXGPZ7izbUwd0wnOjqYHDez7wG8sVaqOSpfhEcdyksLuMGAxzSDAxXyR
	rknCi9jj8P4xEjgQ5MzjaCCFWv7k0po3Y74NLQnHL6xsOq/nuGJk0MN0cZG/Gg52
	QAvLtoXDp95jcZv+P8fKry1LlRtlu6jlbb+KM3P9Dl5PPKZUptytPIJKjXsqx4a3
	57fcPbc3QPbFWlyIQ8ZDmB2ugUz+KLVOXcMOGrCmXelAug0b0WwnV3VODxYGnaZc
	5IGlgCHc9O3iOrF/CYcqgET2Gfa9tA1ioRC3XnXJIaMqNg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39c0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:20:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso7311742a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 00:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927232; x=1784532032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNv+b9LdqbQvBVnVS9SYjw6bsRFXfGraMJ1uo1KKPgk=;
        b=Nt+A7m8Y7O/uWNMbNH7FJCaPccYXUphJjFy7xJYIVv/Iy/iJYiA64uREtEF4goVgvW
         0qi8BsK/gzXNCknq4uyq63ngHFdNDCv/Y0ijhWdazxoIe1yE7Vl4znIl+bAEyrjfaMcb
         aQ2pr4Yyw3yiDTOw8KMfd5qMnLpBjE1KwwVwUMi7AEC+Jm5poT+SBLDfj7mZNPhf8J+f
         Bm+2L6Og4nXPvSr169qL0cWRfChidjLpqI6xnWgIyhls5lcfIWCMpYu4vwX1OU0ZwwTR
         P0VqJdPhAWTIqRpNe83GkrvuAanQYiY8L8BAaWatguM7LpUT2iOuRVNapwlQcRAyFHV0
         NDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927232; x=1784532032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNv+b9LdqbQvBVnVS9SYjw6bsRFXfGraMJ1uo1KKPgk=;
        b=Bd1PnBs/Q/tYQmngc2bnk1fMduGonkNDRMAW5YWf9q7M5tH5HzhzDToD0IOOdAQg2K
         mgpnXxr5hoCLD20JIGtCUY1uOg6blHtU9eVy4/eoZE699LkoT2wlU/x/f5ahF/6hnL5S
         URVnTzOELDYBXwQKMcPSH1X5QYk1XM45v4GofuuF4zyRQRtk99fl9MPsWj7kOmhQ/blH
         ONp72AlS5KhQAuACmBvJbaKdhs9jSZwJSpxuhlohPq66dnpcqxSC9ZZXV3bRWGoRTfyR
         TdDyeCLBmtBxtzgIGDiH0n8E1uOEf6bhZbH2LVdUco8sBJRRXxYTssAvh+Zti8jZPzx1
         9mmw==
X-Forwarded-Encrypted: i=1; AHgh+RrQeLb9ZSNc7uFoZbnqylX+3Xi2LSVjBGoneAdX3mVILLtydMnMOAxxKKPjJrcpl/99+0ChUycqACI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxidgLNyp6M7uRaoQGjQzSJ74KVxyacEHM0hMftwHL4/HJ00nku
	7Dnt9QzWfxwnStywJZ6jdxz7p7qLloGDRYzKPl98Cw+Q5iUr+3w3460hiY0BwzJl7rJi8FT4tJy
	ZUC5/U/AmEXqRVq9/+3oy90Q3UU+IUX+zd2+CnZd79Z7NwBVzhFXSKRsVhnAOYJM=
X-Gm-Gg: AfdE7clwSmL2KfA6UD7WH6PU+B0y/XPOnAL9rCS33PLCYeYMBwuooRU3IFFFW8CR2MR
	rMzZDl36KoY7TOcefFTeDLz0JZmIiT4kt9zifcD6roJu3qbvo0r6qM59X/B5OnR9Gn7RwlBVgxb
	j3w/UUGhYcUgKeXG3uG5KMtUb+gYRUoi7oygLU3wjiJYkcv5ReX5OFnaJKbQvbLJuC0X1Dvg8D3
	1k9d04AlFBVd2gu0SIG7sfar7o/b4XgJOUyEbaWdmW+CdS3BD49k4SsoL0Yk5XIzKJec9ypCfef
	IMNvQ/yyCbDk0QNb5Ku8TDalRi8JlhugSp/Yt5IPpFbvMMa97jrVeNTHJMW0g2RhUm0ag6+qZMB
	iuYe4svFFaxaHgGyYwb2sfRktry/lfNhiQLRjciqyYhnRiJE9TAwxeyhpkhXs
X-Received: by 2002:a05:6a21:9216:b0:3c1:c6e:9373 with SMTP id adf61e73a8af0-3c11029de1dmr8239213637.29.1783927232130;
        Mon, 13 Jul 2026 00:20:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:9216:b0:3c1:c6e:9373 with SMTP id adf61e73a8af0-3c11029de1dmr8239195637.29.1783927231737;
        Mon, 13 Jul 2026 00:20:31 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9081d5c3sm18677102c88.9.2026.07.13.00.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:20:31 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:20:29 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfXxeG0v1tcEuj2
 JnYsfdBYdpUoHUL8XOrFbnPxUlM73tGl53YBeyrBtD/fR0gW9ae1ZyD+9NNjxFbmA7wEUxaXxA1
 6acFZmmLQ7Q7mukvSWt067OUbRpT1GSZEHEWZtBnm89nmII17nYqoMF10Qztxf9V06sulXL+kvI
 jIKo3yBW/m/s7QOueSdF203p+wKIRp7acINFYZBpT0euRY6ggCM4ZFroi7slM8yLEwxGHHKnO/S
 QzBO/qpBmKl9n7LM4pxvopdVXghtA29tWFbu4jn/G5qkouVFuQcqFXU41IcdRsEkcSgd9BRRswu
 R8GRBMcNigbsxf29XuIAt3SkXVKnHzDP6pvE9Z25aOFxDO+iIscYqpTRkHZQMVGOf7b1KR8hmoE
 EM7pzkbpKeTi5OxygNmFZ9QqYK06fB5Kkij9q3jMZ1BGx2zW6ToFnwIXZJUWzBDO526TnG/+w6P
 a7mvtIdsCy0lvM3TzrA==
X-Proofpoint-ORIG-GUID: 5mSVDUkI_XNUMTLVt--4756-YDPzbPaJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NCBTYWx0ZWRfX9izMYMuxKtQM
 vdk+3slzzI6yGLvV6R6OEWNJvTTjRPGst5p/1rWFlhNj4vo/vj9BCqJ8yzjjJmJnylvjA4c8+na
 iBaPxp1r91cT/sNqSMZcs5EyApx8b0w=
X-Proofpoint-GUID: 5mSVDUkI_XNUMTLVt--4756-YDPzbPaJ
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a5491c0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=Us82urZKVve1r2lckrIA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130074

On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
> >> And Dmitry already said this at v3.
> > 
> > And I've already responded to his comment in v3:
> > https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/
> 
> It does not change the fact that type of phy is implied by compatible,
> thus you do not get a new property.
> 
> 

For USB2 PHY, it has property "phy_type" already, it could extend support
list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
or re-use dwc3->hsphy_mode depends on where it needs to use.

diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
index 1ab134f45d67..5cbf17d493ad 100644
--- a/drivers/usb/phy/of.c
+++ b/drivers/usb/phy/of.c
@@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
 	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
 	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
 	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
+	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
 };


-- 

Thanks,
Peter Chen
