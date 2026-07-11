Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512C2DB789
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792991; cv=none; b=dZVlyspXcV+nVSWvv+TCtq+N8h03JWC/N1l8WVq1UubR4bADJ9ZKBlQiVM4lS+RH0HI8VGS0nT7tKF6xJV8hyJZoXT9ed/8YSRSqFUqL5tVjXwJXPX79ieBTeKRMAcGBJLrfBZNHhFCKuLsIezFgvPzuhjP4icPSYaf2IrEqTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792991; c=relaxed/simple;
	bh=PnJa/8aPWps3IziQFeNseLoRZq8hhlEt7fyfzASDAqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gc25I5rocr0tUcCRBrxgzMp6qNfk7w+I+lDe3V4PFIiyOXJY5/DMy99xcLYwCUSVJBAeOXSlYnVkOFlhn59/n5lIpS3r5NnJ8Ivy7N7bkD7oDUUGI2AiXazOezdXtUzUN1beIUrZpgktHgQdSXWcWMzRmFcCIfBkJcCRvBEFBlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhwd8Xgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LerPtl6j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhwd8Xgt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LerPtl6j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHnRuR207239
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z/6guOJLUSR0wBXlgjCmVq
	x6d332CBtCzhg7geAi8aE=; b=Jhwd8XgtITUxv0oUaeO9bAQtQ1lEpRnX053vLZ
	imDVqFUGrAuoGTK/qhMVTfkKcCsi3vu1mIJCkN0GQ81Vpye6TciwoWPlkQelhdq+
	JYbKdzNYXr4W9vHwgy8pzd2ERj4tHJ2KiXz3R4PrL6Myd6TwAQRjk+XWc68tLcne
	6CqDnxAxonYKa/P52xRM/NBa7+iQMvPMqgo4TtKT299mWDE9I/huhPRTv0Q2qfJj
	hIuu/8YHj+TNn/vBAjRti6nWWxIW0jtBdZ3+3g9x+W28K49BH7KUpTBeVynJp/ni
	/WY/pPy2vbEjpGHKhmA7R6A9wyT7+pSZgAXFmays0zuUrliA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekchagf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 18:03:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38096521198so3523835a91.3
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783792988; x=1784397788; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z/6guOJLUSR0wBXlgjCmVqx6d332CBtCzhg7geAi8aE=;
        b=LerPtl6jMVn1tx9F/4Xy8kIdnHbv3+ELA/jaXh8LJEvFsFE3mPHc2U1PpWgnrLKVtm
         +kcoi6lpLSZuIIEi5WevO+0kSs/1CVgQZ8RTIHtpXW5PhsDYoeoGU6CbCX6ZCwEXwcvg
         wnSX5lILVnLILT9sQDroRcHUJ9UZtfMRlG+wo6u10E3GX0aQqcoq0rtRwVPvUw07u9S1
         KN3b4rJo0K9twby0mtsHYQxDtRay5ed4VR4Vp6qzExbmDZbdMAALvgy3hDfrv0qqqh9o
         Sc7O2AfAUdY5XBrBxDXiSLsPvCD5t6WpvFnrhEijpFbPmF4gIQB431/pt/V2EsZoSgaH
         g3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783792988; x=1784397788;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z/6guOJLUSR0wBXlgjCmVqx6d332CBtCzhg7geAi8aE=;
        b=TtWlxGUWh5UfKjKLPhiqAf0i7YFOZ1gVU7iutJT0aDudZ8Gd4R5sLrJUeDXEghqGgn
         AZvCd6sL2EqeYMcKVdrUbkHWR1zisMX4aqPv9WSKrdkIBXKNfXVpLA/TR49qQNIbtEfR
         D39Ay2PWXxPbVCdLTbG6vc3YA727jZ8zFxGEphDjKelBCWXaksSTWWFeiamp7YeDitUM
         HcH4NmpSxWp0GmBoFduL6B35Pg8zXubqx6UjAzwjxOrX8fPUu3gnowCItuznLkmowBid
         /B/8P7rn8J/Uz4pGQjFJtHx4P2QF+yOSFons+xunyc3idKUgZ9rZ6sSWvNByuRrCOaYe
         K2NA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3uz68EyH8KdGvVmVxhFvEEqt20hQKg0rbLJMbuHH8Zzqtx3GBBMh7pXI3UETwk5FmLFvOWhLjS5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKVeUEX9m2VOjkkWvajCqWDkzBuuxAPtXLVaYazeXuNrrR7Um
	VOcd08vB5mSWlnaPu435y3Kt9+eOmDmsx30/4vMnpfeFKvFVthZv88+okYvlHYVCu66KBPHCw6T
	HDQkiczz8IfX6NU9wMwSW3ylm76cxT5rhakIgzHT4+2NkRLVL+iKzibO5Fv2rAkM=
X-Gm-Gg: AfdE7cnH7Fi80/CBta/G+DE8LtWk90YhV13cLOX4v5eaTjAzWDkjcbnYg/0bv8kWhaZ
	helndmIOGAjFue3mYV120E6/uf3KAN7PRI+NRTUSCIQsjL/q3bADOGmjI/M1F2qwDMr7+INo0/s
	JsYPA7AIJuIxVp9vLH1dLRogtHoFcY0NZ7lWrAkoXhxp/CyVdNXq4tci68GMfcc9aeSmmZPW/SS
	VEdS6oiFcrU0zAbGUlphJSMwiMBY5VL0QXcyhQY54yi8m4I2w0QrSg+J+mob7yyQH4VnYFsSqnk
	xssomEOwUKeae9Ov3utjYdNksW+IZ/HUIYp1J8qpAKm8L09XDGLF/tr5m8oT5rErGD2AHZYwmNB
	WnAabXFQMAgR2hBJj78m1RcSGMIq6PYdeHjvbhOsHBW0+fXoQweppDA5mp5+mUd9nCI5U9IM1sP
	wW5RLP
X-Received: by 2002:a17:90b:2e08:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38dc7769958mr3609818a91.20.1783792988463;
        Sat, 11 Jul 2026 11:03:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e08:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38dc7769958mr3609786a91.20.1783792988036;
        Sat, 11 Jul 2026 11:03:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm26407486eec.6.2026.07.11.11.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:03:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 23:33:01 +0530
Subject: [PATCH v4] dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-usb-shikra-v4-v4-1-9d59b9d9aff7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFSFUmoC/yXMQQ5AMBBA0avIrE3SUiSuIhbFYEiQDiJp3F2xf
 Iv/PQg5JoEy8uDoZOF1CTBxBO1ol4GQu2BIVJKrQms8pEEZeXYWT4MmtalVSndFlkNoNkc9X9+
 vqn/L0UzU7u8E7vsBG93vV3EAAAA=
X-Change-ID: 20260711-usb-shikra-v4-43a3a001d756
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783792984; l=2191;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=PnJa/8aPWps3IziQFeNseLoRZq8hhlEt7fyfzASDAqo=;
 b=ONpfRxQhrhydyR1lYo6ZWILKLgioeNJ3yeih6kTernj5CS59U4NDkgG3d0wgEC6dm7bA2RbMY
 I2OlQh4pFrGAUIyF8Zlb+DQcC/c5iOTBtrBOIrKpyMH/QMIxRp35HtN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX6aP0o1DIu/9Q
 BvVCKtJwe3nVuSglMDnOk6Y2AbJnfCL2/AIdjtYAiz7faqUPbV969aIw0H/4kAqqvdaN9an6hS1
 TJzC6IrxPgK9pV0E1y4FI6tGO25bO0oZ1qqmsKhIvNvWpHkSISBHcnw1wR2VhWhwOvAzh0So4ZL
 JVBUGYb1CJm4Rs6TE2DRBLD7Ave6cMj+wCi0TvYR+UOjkSV65ivbF4J3GB6YGCKJ1BWJOx5V1+b
 UzsAVQhSy2wDsDYIwIRH86Io1YDHbwnyvjGayALz2g4ePup+McccIyVg+Adgf4Eg1LsNu1BImuz
 LdDkMTrHmrbAcAusVKvOvUGX8qSb3zOxfRD1dFzr+FNtsTte3TFrWiUHoJfFoe3k1/PVxZa3afY
 69oz4HxW/ZXyglct91mSHRgATOCjNWLHaHFt8ILSWdWm2R0/r3KMCfphYNpL0zvbT7ajKdw4H0Y
 qSg4QhxozkbvPkjDk6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX4RZBqrrPT5fn
 sxGacKrj2wm0BkhIFwop0+lOJkO3QJpiBYx7zoulP9uYudTHGqayX3WCBcs7hmbKCKflzEe9EnT
 8BFD19jC41Qeu+spCaHz8YSqD7gmELI=
X-Proofpoint-GUID: 75KrEsTeIPG7rFInNliIUgae9oPcqVDE
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a52855d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VKXdlmgkaoilbm1G0MEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 75KrEsTeIPG7rFInNliIUgae9oPcqVDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183

Introduce the compatible definition for Shikra QCOM SNPS DWC3. Shikra SoC
has two usb controllers and the secondary controller is high-speed only
capable.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Link to v3:
https://patchwork.kernel.org/project/linux-arm-msm/patch/20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
- Moved shikra to list having 5 clocks since xo is not mandatory here.

Link to v2:
https://lore.kernel.org/all/20260504145710.257211-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Moved to using dp/dm interrupts instead of qusb2phy interrupt.

Link to v1:
https://lore.kernel.org/all/20260430-shikra-usb-v1-1-c9c108536fdc@oss.qualcomm.com/

Changes in v2:
- Updated commit text.
- Separated this patch out from phy patches.
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 932d7aea43c5..8298d1515c7d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,sdx55-dwc3
           - qcom,sdx65-dwc3
           - qcom,sdx75-dwc3
+          - qcom,shikra-dwc3
           - qcom,sm4250-dwc3
           - qcom,sm6115-dwc3
           - qcom,sm6125-dwc3
@@ -220,6 +221,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm8750-dwc3
     then:
@@ -559,6 +561,7 @@ allOf:
               - qcom,sdx55-dwc3
               - qcom,sdx65-dwc3
               - qcom,sdx75-dwc3
+              - qcom,shikra-dwc3
               - qcom,sm6350-dwc3
               - qcom,sm6375-dwc3
               - qcom,sm8150-dwc3

---
base-commit: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
change-id: 20260711-usb-shikra-v4-43a3a001d756

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

