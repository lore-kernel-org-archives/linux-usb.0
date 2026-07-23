Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1143BDCB
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803174; cv=none; b=C/uaDoGitSlTMCkIX5YUZLSxStmHeFFTqm0Q5eh0LjwHEPfdUCyrKBMF/oye/XbzmXV796UFaCzYkBZKwf2Pg6hcMpBfL37+raMwJXZsIxnjlc73M0sAlxmJQyQLONbicSxnSM77vPw16nQO85jcjEnevuJFbCW5/LQ7y6B6au0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803174; c=relaxed/simple;
	bh=N3OAJXy/DJfnjpR6c+bQ2PAdkb6tUhmZWSabZ7Y5klE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVhRjLw8KrOGlCOsFjEGRiKrqn8ToR+SkT2sC3vtmBpqROMAvpjwwOpmj2lG5b7KLFeWapgFCVRjuLnHypZz68nnX0aHGZAwkdqxXpl5l0yq3Bu2RgZgbOMbSpks0D6japEcxgJ6PlOqqM4gjh9op8BC1zgFOLvAgNflrMYPmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj6fyLMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGT8cWsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj6fyLMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGT8cWsm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qUqO3260945
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=; b=Zj6fyLMV4Oj9ZjWa
	kO7B35dVsQ29fr/KD6bQkwsBBNFarsEh65TrDBlJ1Y+XRxAQE4aGFzP2tqzcspJz
	0dsTu1aJ82/UAnmPKUH2zvXMWSNeNnmM5wUbZ/53T1g3TyJg1i0xdPje4ufPZUXI
	fxt+CcOXSvfI3smxVUwqAdXaGqhL3hn+kqJJED2+/a99oMW/aNydMjj2Ab5sLdwE
	QfFqMNsDczk3ramMTBhkGaPjLFpudFlioABaTs3LZQQ8UjqKNaDfjBeh3tpvH5cK
	Nq87rrCl8Joqunq//bqLnKA3UpbLNsIpQ1npjGFVVVGpJsnADaLuWuggGnlKon/r
	LSvvbA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1q7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 10:39:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e375d9736so364269b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 03:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803170; x=1785407970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=;
        b=eGT8cWsmbSHVdUcvsSkjTIbNsBEiVZmL2HkFN6UbqADguS9a5ODk9XKFJoqdulH9FT
         3VVNkA5BqzOMJQqbyxnzw1/fN79DMH+uJS2wPjg8o9rQB9T0655WBgrvHtQ3WKt1NARB
         dcvvzkqciJGuC2QW08RYN1eWOQMjc8UHaQtn7kQc5TcPoYUNnbq2+iVle/Ly8cclGW+f
         wCA8Aze7rj6SXsJm5LR791W6IrccmFc/NLR3efcimmU3D43Zz+RhdcMsi6+yKQz/XF91
         HKeR7ZtLknVX5OTmmLTLGAnM51fD9QxuTo0qzjLBWVrpF3I2MldlxJMv3pInJtMTjWLq
         rzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803170; x=1785407970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+7dF2lLb7dqWsPeNHtr0YlPoxYnTk1l+rcmlZpTPpk=;
        b=D7jk9S9Zcnvc8cPtN5Yu4dUgQlmWD0q2jQn6XgY1kUQ7WzYRd9t0m0cFWoEUp99mbB
         vjJUBNVD8FNTjXdquPHIqsZkkShMw1Ahq9eDzTLWytsBP8Wv1399Sf0APRCe5Hx0hAEX
         TmYKcZwHvzPsHQ/nfxg9azs6DAhHnL00KDgVgv9mEe5CXXvb2Jy2Li/mJbPHrq6ExGVU
         UwVtuA6PMsCACyjd3is+8WZ8J7/AIIAekZGskpzEerNI1qTx3+9WUfBlhPE7TF1Sa28P
         NRHt3f6CEpj4c2VOrgkdMQZrcwPs6Yd59WbYENK6/MdR4W8p2xmPSo56yvMDfQYoysYr
         jIsA==
X-Forwarded-Encrypted: i=1; AHgh+RpM7U/0AO4GIRAlE3e1UR9u0gW3EUZU5BvHxI2wVghySqfO8rgoxp9ebrgnAf/84ImKr+weqoQ34sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5yB39KgoMV31eh3gVYLC0AgchF4GBmZp94MPPOO9iZn4DKM4
	unkEZYXB9x2Xwol6eTbR6wQZxT0XOygFHanWpovSY6ikBXPhiIzy/ctcyHjY+UIEwlJVBad3+mf
	oY+bTGnJ4PNCRN2AKsrrFTg9Z77Snah4lC1tgHZtQXfnfEetlCGJ/6KryhJRDf5g=
X-Gm-Gg: AR+sD10SEhZqT5x1tqBkpXZr14Y5+VxMNKhw861wCEH691mnjYL6vJ4Z+QZL2FADqYp
	Qmw6X0HeqjtK//OIqnl+6Q3X8iwGDn5p3lUgwkq8krl30YypNK8A8r8kuGNpV16VAGfXW8ViPZX
	HMjL2zKe7jzmStqs7cnilPTA4JTRM39IthUjlgLeYIjekFc8zM5xTwPtfn6ZutPDFSFwVidOUqy
	Oxe8N1KGovrkH44Vy5q8l5JZazE8VoS/KDGLyYptmJ9//hAJPiOctwliDAz/OiCfMmsPgh9QD/M
	JsgLCkkvX/KsyTx3y2Ak6KSS6uLIA9RxEmWfPf3q1ETffVSDp3/PEdJSKpnCIWw4uCAaKM9qOPS
	2UavbfHPQ4SW5P5QwkYk9kqnqaPhszMVrNnarIXATbtEgQRKbO1gEEGxJwBZpSzt4r8BGFQ==
X-Received: by 2002:a05:6a00:e0f:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84e2b7f6c4cmr3099744b3a.11.1784803170572;
        Thu, 23 Jul 2026 03:39:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:e0f:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84e2b7f6c4cmr3099721b3a.11.1784803170118;
        Thu, 23 Jul 2026 03:39:30 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:29 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:09:06 +0530
Subject: [PATCH v5 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-eusb2-int-handling-v5-v5-3-f32ea6c1a318@oss.qualcomm.com>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=1048;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=N3OAJXy/DJfnjpR6c+bQ2PAdkb6tUhmZWSabZ7Y5klE=;
 b=IrTCqLlDsSng9czw0n3+5OOJ9rdmt9xIxdfQaiZt8bHlQYnXCGKX580gHG0QeUW2qyZBbxbJu
 /wbs1oEGWSNBQRK2lt9kYaK4oLr9Q0zxCxPMsucCeht7FKKTr2dU0HQ
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61ef63 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XHtVRzMgxm0A3APenEAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: LONraP3DyhJD2qPeP6y5y5D0SSSV2Pt2
X-Proofpoint-GUID: LONraP3DyhJD2qPeP6y5y5D0SSSV2Pt2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX5Z8eqKbL58ML
 d/Wakv8G+QsFVr8RXtmBJAQVq1+nZ8cNj4BKg9FvaZTCUOI1rrTiRtP3Xw4s+oNAHiCZsKLHyFP
 nshFV+I1DFUqWngjcmhU29aTwkijVgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX39wuwd59HP4d
 Xl+aahY64g/otOgnVG2fPYUMtDTpX2Tot43/MR/EI9cMyPo+dByiaSRX8F8wWG3cJq3+csQAFAb
 xo1QIuyNXKoxWfTNCr1ughHZ9jrehds+6IIQEmAI/mxJS69WgFF3+RkETwQGUcbLsFLRBbtEd0R
 oNT3IIWDiArlMVVz/+pdQUN3m7aoxRCJy8Rmd8FlA+5HpWrBAGNPjXE35hYqolzmxDpu+nHNtms
 sSMgLZtUYVcbogbyUmPrYNITFAJzFW4MsqFF8FnnSARjTYooWx05wc9MMNrxETbeUxX7xVoKffy
 0iX+52uBcyIqD/09itDYFx1vYC8zYdVrTYuSOV4Zb1FYHl/OZC8fllMU1/ZH7Hh8ete/nsmg7Dv
 MjLOufSeCPDeQMOz+vDRq2eMnuoMH/T9wCODCFJao8z1iEno8JevCq6rkJikZr4OO3g9uWUQsNv
 iKt7TxWZyM3JrMuopzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index f90bf7e95463..e139b17bcda5 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <dt-bindings/phy/phy.h>
+
 #define EXYNOS_USB_PHY_HS_PHY_CTRL_RST	(0x0)
 #define USB_PHY_RST_MASK		GENMASK(1, 0)
 #define UTMI_PORT_RST_MASK		GENMASK(5, 4)
@@ -597,6 +599,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1

