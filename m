Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953659;
	b=bjq7d8SwkGaR/SxEslAWGmXg/FvmzcydKHWYnd4S2BABPedr9pN1jU6RxHI8kEy6VkY9
	 htKkLCLYljm3fQQxP10pPOMsLRCEtZggcd8Gd515eVVq+U/Ti97vNkGiQTglLCLbmE+ZA
	 kusbDWY+6kSKweHGG5G0VpiZ+ZGvqi/KE8BU8NPOU63B6DvZLed501U04ibwrtUc0nOX7
	 cGVNWoIiCfLjgYK5Dcq2nrrI5SnaPj6xAdLOQ6XbI7HHZB0Vvj+VS0op/YiC17nJef0lA
	 iMu9TA2/UV0TX+I8/v4RGfxs1PDJ4jXhqbZEXFqVgVyhnyzwKP+gJLFMJuF/XKb7CdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+iPJJtX6fNcECKsITdpcGnaCSiS9lo75HMfwgu0RABE=;
	b=Asz1DFTzsz3ZEKaTC88TDaIBY8tJdPyX5cbhfinaNwS9DddauYObsXhFqF6KewK7OGe3
	 M+7WpwDhZgwkQR9Qi715oUswBL0QaTS/FarD8waTC884YWqs7CyhqSevbdkROin1Kfa5z
	 TogAgj0oF/DUrTFF9XN4HH8bo3geFEtXmJlcK7KYtJG8FvbL9VT2UwE0hvfBGevGOe8GR
	 oFMpvbbl/CTfu3SYhZEl2yBWCG+Zw2QhCdCwB1u7fKujq+HM0xKAbcajIFTnnLvPYQEVu
	 i9M2fOPgiwpA4/Y1E2m+8+70fSlDxraqXR+n26UyTR3v3fEh4ICvnkGcuuplDl9gotA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbFvdF2O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6iwS2yP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AED606D81D
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AED606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WbFvdF2O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j6iwS2yP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RJoC1679502
	for <linux-usb@vger.kernel.org>; Fri, 6 Nov 2026 08:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+iPJJtX6fNc
	ECKsITdpcGnaCSiS9lo75HMfwgu0RABE=; b=WbFvdF2OrV4s4IBYVZvxRp2CRPp
	44UUtyT1kI2qNNKRp4gqzMR2ovG46Ooj4zjs7jQjt346JhZRt9pYZ8P0S3VPymNG
	sCZIy/zhhL86N3kvTK3fxKlMKuc6Mmew0WzY7hOvzJq1YkmqQ8Dl8EPYYnTTnnq7
	lPQ0i3+TM14tb6oJvG34DS8ettscvIvbKvXMP1qS5eFRQMaZLHHBRwTAuZgB6hJg
	hEqRM0BMD4iaR0n49e9K5S9EPdKTVeJxCCJ+Cs/+UGd7apwG2AQh54MfsOqLVgSk
	I/IzqaeK1iv81Mq6Ppc5ZA8oId9rv/NBa52D5gL3FSrzLctAMExgzfiSWWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc9urr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 08:27:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so330985a91.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 00:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953656; x=1794558456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iPJJtX6fNcECKsITdpcGnaCSiS9lo75HMfwgu0RABE=;
        b=j6iwS2yPkNgyMaApR1c1VAaIIug9DyBN0rkfVGnzzdBlI1c7wA7zFexngXQnL/F71o
         qFl3wLHZKIYfaT1tPrPZF/ELwk/u3O1t9EUjGMY8mRslNGr4Vztl5oFMbvIqe+QCOzDV
         jurjM2C+Kgfj2vAoLY07gsJU3Inv3s6U9jxRuFpRFiDR+v7N8I4r2QrWW4H8Z9KWGw1n
         3geXdobb/pGS/vNPWG9uQ7qV74Sf3qfL9lzf1Ndj/edXI/OetZdSPVRWkufr4gsxNLSf
         M1gDGZXMp12CjU1Xrp3GcnUubWRT96uouFo6943WMLDOw9EGvGYW97iwez1AboX+umF7
         r03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953656; x=1794558456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iPJJtX6fNcECKsITdpcGnaCSiS9lo75HMfwgu0RABE=;
        b=V5iLg5FgeqN3bDXtWp7Gah+VlPOzw1Z1ILAGZ9mnDEKBLueHA8khQH40wPvv1hpjJo
         Q5qer0uELkEDISmOT+OZZFaxdaPOyJ6W/pY2D2gzkJAOfvT1L5qHtos9jxj+D9vdNvZ/
         AgDPp+2AsIzYZ9fTOXy/rz6IT8Em1KNh85XAB6hGGxW/YrzN7J8JY0zyZ9/2Fnen/yjP
         YMKOFfqvtU3Xoved1m5+/SrZHIp8GEfWWnPC+yGw7j/dMYNa3GL8eWlt55RUSFW3myO0
         cmuE3O9TKJk52PTCX7uF2KkYNKKaKZt5pROiW4qHld1+bVbDjIYB0vCLUTvfJHlDLiix
         2gGw==
X-Forwarded-Encrypted: i=1; AL+hErEODzUu4Mkxrb7ViCpb0fh522Xs+JGPnyn3rThy36nWCQ9SzYLJTMcgZhxz6mRBDQ3zrgTIqieKRnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TgrqsjwA7KNLpPFzYnZB9Ts6P9zLqm3D9zQn1MhmYPTnVOalP
	R2zkrM6D+wFksOMtDUtWu+ApbACa/gD8kIGAXHapPHNredLqWrPgI5UMCzyZc+t7nTUhD3A7G4V
	ZP9dAYgYF8xmVjS4R9H+1/gnyYM9U9Xr1usN9f2FnCELxKAi92h3sJjS2mm3C8L4=
X-Gm-Gg: AYBFou3wiCafDRM1KsID1MO/OXm4GFRuZA6nu+MVcAT+ul675njlDEZBmcFAm4bJnC8
	rVkTav4n6glT7qHL2Fj9vR56lEdkHnlLZxrvdqcNq7/9eLvICR45l10s1MLo8g0mt/zhSc8hpkR
	uwWPTY6kCuyE01qB3xne+Cq3Y70r1XjAsXjwRn3ySQ4QIRzTbbTPeoASqcu/tkhfAVuFL98UrvK
	PaI28nT/G/OY/F7bzBCf02LBRYwN3HCtVPJvFOWdzTA1UORS68/a/A01Y/+Yxye72pJTnFEOQYz
	HEbyX/cD43uX4SekmUC3+9EJ9+dpLmc1LMHQFCYubtgCeBSORFwQziDQvXglVV8LSrTb0+vl76y
	MXA18CzQ0HFb1nCfCUiRR7pnbxX4BMVIOhmdXnVKCZHugEB4A4FNNyGk8NZO2zZdOkdLWn8W6JM
	2HzQ==
X-Received: by 2002:a17:90a:e703:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b0db6d7122mr1639754a91.46.1793953656294;
        Fri, 06 Nov 2026 00:27:36 -0800 (PST)
X-Received: by 2002:a17:90a:e703:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b0db6d7122mr1639726a91.46.1793953655847;
        Fri, 06 Nov 2026 00:27:35 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a72sm2433951a91.3.2026.11.06.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:35 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Esteban Urrutia <esteuwu@proton.me>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        prashanth.k@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: qcom: qmp-combo: Select LFPS detect only when SS link is confirmed present
Date: Fri,  6 Nov 2026 13:57:15 +0530
Message-ID: <20261106082716.128968-3-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
References: <20261106082716.128968-1-tapas.rana@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -EQU_IpbKBemMI34H7cDX4sey7-jwTFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX6baYNHwYj+sp
 ukG23QJ9Cc3qVBWTbreyBiQA9cwdAlykLkqrNdZidYLODNpm6OHJF5OxDvtlG6R2SC3Cp+jTIKx
 OGdrTsW9JPix82hqjqRz10hBkiKOhE6gHcMI/87qaSCcqnrOGpHeScORSHIM3AQ6y8jiT9hW4L3
 H747JxMxKquT6KKdBRB55TrVeV0WBqQtvYhHatlgjDzRRfqrMwkRZJ0dqAL4TYAOQM/lmoEhLZ/
 X6Fo+dAU4vM9REOtl01xobsq5eYCBp5eGvDoT5kyQnEeiVFntyNHUcpxK3aD9PLEln/t4ARWUda
 o8yFaB6WbEz6TX9AzEXQCdcpi4xINjx57PfPXvny1YaBtB6A+kBdnPkViLbkSI3neNigaupzof0
 iesdw6hNKaYpLuyBVzr4IWzoAodLSd5ThBQnWRLNN4c5CZjJFr8pJsvlbevfLIyej90Wk0Zzm8b
 +QiDh8udKSs9309eYyQ==
X-Proofpoint-GUID: -EQU_IpbKBemMI34H7cDX4sey7-jwTFD
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed8f78 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0xIZqrDvkaguXChZBM0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX5/GFFlbsJWyN
 JNgGZboXk4XN+5G+0eR6IURHj/dak3l1ROIG928IGLLHc6QfIt25io/AjN8ySPul1SNJLhQV8yJ
 MWJTQgPv0b7+FLqnPgm+IsZywNk/DYA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

qmp_combo_enable_autonomous_mode() selects the autonomous-mode wake
interrupt mask by comparing qmp->phy_mode against
PHY_MODE_USB_HOST_SS/PHY_MODE_USB_DEVICE_SS. However, this driver's
set_mode() only ever stores PHY_MODE_USB_HOST or PHY_MODE_USB_DEVICE,
since dwc3 core and dwc3-qcom never pass the _SS variants. As a
result, the comparison is always false and the PHY always falls back
to the ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL mask instead of also
enabling ALFPS_DTCT_EN, regardless of whether a SuperSpeed device is
attached.

Store the qcom_usb_ss_state submode (added in the previous patch)
alongside phy_mode in qmp_combo_usb_set_mode(), and switch
qmp_combo_enable_autonomous_mode() on it instead of on phy_mode, so
LFPS detection is selected only when a SuperSpeed link is confirmed
present.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 27 ++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index aa9dc9716574..813a0955c591 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -27,6 +27,7 @@
 #include <drm/bridge/aux-bridge.h>
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
+#include <linux/phy/phy-qcom-qmp-usb-ss.h>
 
 #include "phy-qcom-qmp-common.h"
 
@@ -2630,6 +2631,7 @@ struct qmp_combo {
 
 	struct phy *usb_phy;
 	enum phy_mode phy_mode;
+	enum qcom_usb_ss_state  ss_state;
 	unsigned int usb_init_count;
 
 	struct phy *dp_phy;
@@ -4518,6 +4520,16 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 
 	qmp->phy_mode = mode;
 
+	switch (submode) {
+	case QCOM_USB_SS_PRESENT:
+	case QCOM_USB_SS_ABSENT:
+		qmp->ss_state = submode;
+		break;
+	default:
+		qmp->ss_state = QCOM_USB_SS_UNKNOWN;
+		break;
+	}
+
 	return 0;
 }
 
@@ -4672,11 +4684,20 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	void __iomem *pcs_aon = qmp->pcs_aon;
 	u32 intr_mask;
 
-	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->phy_mode == PHY_MODE_USB_DEVICE_SS)
+	/*
+	 * Use LFPS detection only when a SuperSpeed device is known to be
+	 * present. For absent or unknown state, use receiver detection.
+	 */
+	switch (qmp->ss_state) {
+	case QCOM_USB_SS_PRESENT:
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
-	else
+		break;
+	case QCOM_USB_SS_ABSENT:
+	case QCOM_USB_SS_UNKNOWN:
+	default:
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
+		break;
+	}
 
 	/* Clear any pending interrupts status */
 	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
-- 
2.43.0

