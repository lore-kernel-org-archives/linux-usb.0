Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2636A342
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763838; cv=none; b=LOwBP8PuvWqXXmDL+iT7ZDnqSOQmHGgqpQDVV7MP5g0WLp9zYQtYz5Af17WmDTG7EsXRGG4Sj2s+JKrQSZ3ndjYZw/gZRMyFobcvH0HM17dSatAC2aJCzPaZ5yAvM5MhzkJIOtFNnrkkUk76XcmLOAT4FoaQ0bJhs1c/mJAhgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763838; c=relaxed/simple;
	bh=/tVXMe1X40jBRWP2+3mc6TsHLn4raV1bdUbMpmk1/+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tP8iAnU3LJjWvTZhGBn8Fv72JdBuKkE9kpRLKvoH1+vS6HnHcaK95UPrbJMSPWyGe03zElhllScQ9WipxP21qjKACYJMTWwi2+UqjyZhUz3pnnxOXpa5gquLVcHje7GztVoxU7QiPltpO9Lsoi7RDvQ7bU3LmdMuvrC2aDh/108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B6RdE/hW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts3K9ZG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6RdE/hW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ts3K9ZG7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGvBSv343800
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=; b=B6RdE/hWm9VQq8Wh
	ntaZ+Hlx3py/ZpDkiE6W2YcEyOrA4IKhtfTPTJU9NAlBpHjGb+j2Dsj6RoKR0ItF
	wc3wR/7ED3dBZE/GiCKgX18XrvAfrcQ2uJVLIHG6Nugk8nbc12B2bXfoQGbhJ5dQ
	60UHz5idSiROq1hEEMgAbYN+C3NJCQzMvX8YfjuULLpftVm5MtxmAEYLStYWNQL9
	lz50OmUKmU1mKtXxnrS/g2H9UWIRguGnGRky4jUKO1WNXt2k3iGiVN1P8K1zCBm6
	0jWWXaRJL2y6wQGLedtRFhb7I32fSd7IcOzAud0mrD/ZBmfx1xBieatavmy/RHWF
	sLlpug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9utht7a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 17:03:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so12066655ad.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787763818; x=1788368618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=;
        b=Ts3K9ZG7OKgf3KkTZ9C5kRaSy6V1VTkkaIRukaufKramDwkirDIXZANYcV73uMX6P0
         KwvdNZv04Y6ja45h9//um/neIk7EZtsKXc5Vr6UjMUG6LCiVhd7AopfoNwnMVwnWgofZ
         9QHD9CC44gYF9JnSWc1n7niTOmsrtVI7E9XXMCJ37jSONEIcaEYj26y9vzPMEbTNYLKy
         OKLX93I9JmGzLFydD467CDQL/gkMydnmqdjdS34WbgNlG8fTzqf0ZD5WA+ycna+D51s0
         K6aIBoUF1JxUv27UGBNSsM24Wfpfb68arRwlS67DEJdgKztPhIyiXHS63ZhTOKrVdSLo
         r9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763818; x=1788368618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrqpIZV2QBG7L0QYtbs8RatDKP6IxZ/Xed/zIM03jdA=;
        b=cHHygS/mcVr/Gbj1+gNqORBW/036tJ4G4g4fprQyywnUy5/+qdNW++ry2xnEwUMtpa
         /tE80YJz9bpblCoHgruGmTVYtl12+QOH1P81vU9HwIIL++MLu5IRHiAyk++vQYZ6DTIE
         kjuS4QLlydC+ckdEp0pM0k7epnttTQD98MUpDsPFtHkO1lxvk95+n9EChxBUECEJb+7j
         YSu7ZEbIVhD4GmL8KcoLm/xnYqhl9vkLNfDo8zBriC+Lw/XrSr+DFjpbKdzRZxBr863G
         kaNbZlxImDy+h77qcaio6uNNg4CaqneG1TsqtRoxVJ5liqAn1cw3b/gAzFPfG7NDnjOy
         1otg==
X-Forwarded-Encrypted: i=1; AHgh+RoZmwj3XC8Ty9ttud4dId992XugUf/AbkwgcDtyJ1a7GZp1ZdJE3h6endVj55n/sIuunbdSohO3PeY=@vger.kernel.org
X-Gm-Message-State: AFuF++kkljGzE2XGjDTOdY9BRWsOohpyTBfzGh3/gSQTMxC4G9UiCfZt
	L+kAphRNy+kly8Xomh/eQLQzCY1/W9sZetexP68M1OTLF7/k4R7DHS5I2u5alzhAh+VJGJa7EsN
	JdBKuWbcHV5CGNSAFMnXqdaRM0DDe6yCufUe5ggzF44wTKPhRux7eFnvBA4+dC3A=
X-Gm-Gg: AR+sD128TqcgFJxtEKpFWQaILFjdj99YoHWzg1unlq0+55jvXR05BklSJcaaKA/4FRu
	3zTETf+HIpuykEG94TA0WxKBc3XZs/yMGpvOgDFke7CG7kfJr9lQjX2AhY+X3MGDCJUFjHguuBQ
	aeS7ibbbH3rW3s1V3vL0m5+KCzkcNNTTBKx343oiEJYnuwArov7HT4hMpooX3nSq1S2TgoIQ/oc
	UocMQKEGL0yhpHLKBAuhY8qsTej/U2jjB/0V1GZYxiY/O2xX/cVObRm5g4TiaKhbIz80c9xU+3a
	pVVAU8CSZmtFczVwn0Z/uKtxRy75dJQVOw3RDtje0G1+h4UiMcB/hUtXUNl7PzzizlbIit945r9
	FzgmczWWmpM4ldmjLsqxhZpuIk2X46Fb7qGyD6hkgoBzeDgZNGEjNZ+gZaQN8vq/fJhWK5g==
X-Received: by 2002:a17:903:94c:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d707b61486mr154251805ad.13.1787763816880;
        Wed, 26 Aug 2026 10:03:36 -0700 (PDT)
X-Received: by 2002:a17:903:94c:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d707b61486mr154250195ad.13.1787763816258;
        Wed, 26 Aug 2026 10:03:36 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d70498ca3csm9938285ad.31.2026.08.26.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:03:35 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:32:54 +0530
Subject: [PATCH v6 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-eusb2-interrupt-v6-v6-4-ae2601cfa80c@oss.qualcomm.com>
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787763791; l=943;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=/tVXMe1X40jBRWP2+3mc6TsHLn4raV1bdUbMpmk1/+4=;
 b=8AUWnAkBRSOaoJzjamgva0txDu5cduEp6C4GlNUbwuGYz4bERAge9awi7ni4Px4gFenzCk3KV
 iLYfRKBeDS5ACGWk5G6PmSq1X/KUgugw/DIU+DoTlYfnxf/ZFDPgogk
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8f1c6b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GXgYrK0FegosRrsl_UwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: U7oat9c3rmrZutqucLsj4884yrJfWAF_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX09ERKV1jZ7iR
 6S+V/r+6m2l2L1LNSYFZ5asbYevXx1djFLsdxN4XbBwYowmZfIzySqgx7tW/jIpjZZe5xDkY5nc
 EtDmLzThu1xphT2EK6XjBiRcjcrBbrfcSnoKFsYq8IkuBRMQritRemN932CD5YcRvEjD0oTlisy
 Q4VRYPkYDgZCzvhSJz+Lbk8d2TKKCmeVy/x5m0ZQB73hZMam2r9rPY5dvEWB8Ckmim05mw/rwRi
 1tNDmSfKLloLMq65tHi0dRGnahufLPjNdeSlZ+k/8ep8YeuEKsX54GLYQZ4TuR3gdUXnsv60aSj
 ezfd/2qPTcWkzAeNX4KrlcNbWRq8zqKJ6F4E10bGJ7TrsqlGy/BmN1f9vK0rpjh4HJDS1sgB/Qb
 Tq+1Oc9XK2dkWBL9GjU/BQ1SIFOMSZApv3yVwQe6ekUifX5w19A9bIR/jmUjkfSFdWP3PaIfisH
 u2jqsH8xKbcNzyHKvVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MSBTYWx0ZWRfX1Rad1PoyYXGG
 CopRnVnAwFl7jeBJrpVyXCTbG9uZqmkqXce/GD2roUFFKgKBS3CHfxLKJbQ+Ub/LMki4q9oZSbu
 RgsIWc0dM+U1nRMyzY6Wgc+yJw6Ffc0=
X-Proofpoint-GUID: U7oat9c3rmrZutqucLsj4884yrJfWAF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260141

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 0bec8657149c..7e6b16b6952b 100644
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

