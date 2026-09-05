Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF9F4B1B38
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622180; cv=none; b=X5sG0c87IhA/5oxszWyu0QyxuejLMLHsAFK3vetPiIbGfS5hkgPphLIFEkXk3GbRRK0y0Uwq4bHJ6Ax69FB6w9GwQiP2E7Hb6MiBrbmk3f3fPG48ubA2BWrCzvizaKzLVyN1l2XNuGwT6E3dCRjN3QfQIWcTbFim38r18FxRozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622180; c=relaxed/simple;
	bh=GPrSCfl0Yj1JdV2FeMmFmQLmwm1cIxqJOqZ+rh98oHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4PltCxjFnbnJioV3gUGmvbWymdASyKNDFiTmRDcN3eA7TagnqkNpfTzrR0QQpBllR+ipiIQHk6GzhtyaqE55I93CS6pkPKq/bUN/GYCgw8zisLg5bigf/h5thiv8iQZN2BVYggcI4GBRA4TZsC77apstZCOrN2u9Vn+vQnGsYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fNMvRxmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ENXkawxI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fNMvRxmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ENXkawxI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685EjGWp3170164
	for <linux-usb@vger.kernel.org>; Sat, 5 Sep 2026 15:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYLz/v7Lr6tusPpXAKBs3opd3cEExdBka0TAqYd+6kA=; b=fNMvRxmL4WYPp1Nf
	jZAxHjZiO3kYlBn84wGxual14h3D/qeIJwKqLCBSspQaK2KQPW5qWvDMDuJJrlXN
	KmerJVA2bbybOAeSd5hz489emuX2Gx8755pRXBXaDNpV9/7DWGNT7V4FdMsV+9ND
	D7bkFQ7pB+2lRoK9Q2qig6+aWKT2s2bUvqljB4krBNNd2UlIMTmghNPYfjtIw/2w
	hlaXOo+Ov7bLUsNeURfNHbdZmn6f4C9y97dIPTWh+x4FB5Cpqj3ak2IDhPykDJX+
	TaejDrcUOJfdFD7jYTqKwRBaHQv/vqSvsAwg+QHF3NIqkidUqrEqGY0U6/soipeV
	MRDfIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany1ewx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 15:29:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so3548362a91.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788622177; x=1789226977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYLz/v7Lr6tusPpXAKBs3opd3cEExdBka0TAqYd+6kA=;
        b=ENXkawxIn69Mk9D24+KLMeoY+PF61lr1eDTUbqObsq58N7tzvdp/octiK7XRC7Jq8J
         mXhYeg2S/QZbd6C5NuFRbzbEQ234kGsXfLPvt2aiv4Jj0VWxjinwHyDdDllEgKs87Sln
         qBUMbNsaIoARrXrQ/oRzuUbuXXYjJELs1Aa232WzsNdyo8kJ99jzyFCeEUsVmXla+pzK
         56AdllEXnQf/W4MKItWyr9N/goltxUCISYIHR9VAyWSL50HoHx6uyAmrdFbKkT3PPb8N
         a7T9GEHwolBM9Tmf+OPHGo9aLWMSQTEGyPOR8SzAWfXGmy3woKS46x7V+zP0DH865VjV
         b1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622177; x=1789226977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYLz/v7Lr6tusPpXAKBs3opd3cEExdBka0TAqYd+6kA=;
        b=GWXRdBwJScRKSoeg/KijD/9YPpdZ6P05ecCUdI/EKYtFvNCwbpbTSojIOAZ3j1PPXs
         juCVsYRaxG1kbvGYDZS12YTkapFVB/DoUgXrCgTmoYGPYe8UFpe5YaIJeFUlSzlUyItO
         xHlgI+csVuGWH6hN5433afLQfU/cWLB63y83ddOqgBqMlKO5DiDkZkI6KJaAOB6t/+yX
         kGoE5r/G/4Zj6+vTle3jo+8AGcmRVo8LL30tvV2ry5T0AaH6C6t9fii8UmUb5qmrC0av
         qkUr+6Nnf/ik97fpb4R3dpAuXdjlxVF4BUNoI70bHlnOkyCYvgChIy6b663mSGEPPYCV
         v9sQ==
X-Forwarded-Encrypted: i=1; AKwUvBwutxFFgox++0HYYnM19AxW7qwwQlTVKvNS8iRaD9f5Of7fV71dBVF6xNbt3LQadvDeswFzBUFlQdE=@vger.kernel.org
X-Gm-Message-State: AFuF++mBCDNFjML0a/SVYVnS930knIwF5BVAQVH2q3AaGfUSXASpycxO
	YfTxvhOO0Xy4PATW2r0Bd3P7LHK+XHawNwdKWq3JHRfPokNuNqS165NihbE1KXY7B32JclEXa9t
	gwRUCJPQ3wk1Y3PjB0liAYAOAhXYMqL2h8/bBfIGFpoLJyXlpxkwJaBO5Qt8f8LQ=
X-Gm-Gg: AYBFou0B0n4mQIg3slUpAYVZEwapr6y9pY4NCf6feIplzU5UKCRmBEBsnF3+kxE9eMq
	Y4QOUK3HeRGaqq7dQi9iCnhmoVVkW8RJdtwTYN2VXJrbOtOTXrlXQP9ACJSV8rQAhFrZCjm+NZq
	A5VVs8Y854ZIKY9RzIz02Wv3oG0T8dhoXMXBlOOVezci1paDg3/HBaSxpUv73ZClPOmcuOjwtKu
	kCDvjAAyR0XBRcdPTHxJzHxfpoHUqjF1jCBsHo2W8JYxTNTLV6rQEtoV6F8cdSc+Oaf+r6pSjOX
	XNGmRA4Bg39X7BLzLVFhOF5YOe3v20W/8oBwtrm0mx0D+EObvZG5fG58Hx5HTKdVnsANPyNdEGx
	SoIppx+fWZjJQwDG5ArgTQKb1CZtkaB6+6vcHOZiKZRIyPHLSiNFodXPeY5WsHmzY6LCShQ==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr17826469a91.3.1788622176865;
        Sat, 05 Sep 2026 08:29:36 -0700 (PDT)
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr17826389a91.3.1788622176272;
        Sat, 05 Sep 2026 08:29:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm23592635eec.16.2026.09.05.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:29:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 20:59:08 +0530
Subject: [PATCH v7 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-eusb2-interrupt-v7-v7-4-820cf5377a70@oss.qualcomm.com>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788622149; l=998;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=GPrSCfl0Yj1JdV2FeMmFmQLmwm1cIxqJOqZ+rh98oHs=;
 b=FPapLMim7Tuu2xVBDLSJ5NPTIkisSUpeapsgsPQC/tESB4TSoiya7Y9g0hnCJsq9IuL0xtZYA
 Gvtg1j8YxjhBuh2cdiwuWDugjf0l9VfapK0TJsXSae0+tSNc/4d5gmc
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9c3561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=GXgYrK0FegosRrsl_UwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: H454KlFezhxDctx-Pseu59DfV14Pcgqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfXwNwXiiFCXEdJ
 Z9gk0oeZFqnUPIlqj8cSQB0AjMA2NLSYftbk54j+Lmg95SYzIYZR8KWemEwCDeTEikDsyOg60y+
 SefL1TdQAPqmoNrfmItxQyFztQ83OG6Gi/bEVbeNRh1r3dtokR8tkpnP/NI0VHGjZLGi5xcaHaw
 a3UZ+0dSSSJx9gH0dFuiDcbqdhbm94BB6w4W4q0KVa5Zd3BwhwRF/tftzXyMIcCzoGv8metvFpK
 U/NgcvOw9XRYM+KzTKF6e/InkNx3z+7lT3S7uevGUWELIHIMk3ObVoFR+6CfLxbJUsiNJmPSLym
 eGCRaLPEO8YsG6FbGHnPkEw6h4mMHYu3kGY+b7cq7Wn2FTNyB5UyOZxbQKSIGmOJNAz23Fs35DC
 tBlxGMBrVEQ8QG01vgblAdryzbgLBaaGz9z647rBOoc/wIOZA9D2KDt905zEgH1Q2slMla13Owd
 31JBNtWhn48CTxmJCrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDE3MCBTYWx0ZWRfX/gqOE/S0vIRj
 qOBtbLEoheTfhIQQc8fZMO0NGEcKH0UniMPYBspvIzRZ7LmUg9qDyZwWyL+ztBeIUtyU+wa9fmw
 9dMoEoYnGu/COTnmnU6WjQomFBJsDbY=
X-Proofpoint-GUID: H454KlFezhxDctx-Pseu59DfV14Pcgqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050170

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..72fa71003fd9 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -277,6 +277,8 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
 				     "failed to create phy\n");
 
+	phy_set_type(phy->phy, PHY_TYPE_EUSB2);
+
 	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
 					    m31_eusb_phy_vregs, &phy->vregs);
 	if (ret)

-- 
2.34.1

