Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303B644C646
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464529; cv=none; b=SlNO5AnFKhCczjLOSQXRIqBBoQpvduPbTBEUvL06L+JlzkT1Fq6SkYxasLvdoN7Hukg2Cc95iQBpn9QKgrhjtcsBgZiCpu5luHxbH3FXpV1zNoQSXHzb7O4ISv3vPrvrc1IIhod9Ht3LjGgKgp5teayBrzgvv6qgE7OBp+i3BIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464529; c=relaxed/simple;
	bh=RnlKHC3Y12tzhxhZpFIexPbn3jm+YoZHMtfUArPpH+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUDnIvqZTG12lK4PTTFor5dZxNyaTz/HaMug0sHsJI0vNnUanWy48j6lqS4n/cc8dpOFbMoyKVebV8OBu1JYBKo91VpkQ2bPP71QymGhufwHlex9hPUcbTkopGqAThL8EucXqf7heVhszjXjntZ1r+iq4truqZDFOYkhTKMOGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jizpBCyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0SoJ0Am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jizpBCyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0SoJ0Am"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWxYd767062
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U8ZF8ImGy/s6CyUpwt3lFd9rgtxlS3WjAEM
	fiSiyhXQ=; b=jizpBCyzjJgvuHAsUTFmbyqDclRL1vKuO6fTlVCrEFwYD4VmVjT
	Enf43LiFaBEGMV/3kz5B6ZQ6xzISaXrd6NCosW6j6s9XjqxT1/ihOsbERZ32EM8d
	etT5hVamqCmqzPZyTNVHv/uQBVWEnEL4jzvsZGvRqIKseNuzFOji6BtPmB40O5vv
	ek5yujTxGHSJHgTygQE3r3pHbH8QI23r8P+X+in4M1cGNRIF5HBZ0GM2ts4yqgmM
	Yt52HQ0VoTe+aRBkzfzPFF/lLDKf4mh4URYw0cb9A+3YdMJF8Bl2uPMzUbKfD9YB
	C2Jnj317o6QQxhG/8Y8xr2dYsXOzJPFzplA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q11e8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 16:08:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f7002f9afso26641b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786464526; x=1787069326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8ZF8ImGy/s6CyUpwt3lFd9rgtxlS3WjAEMfiSiyhXQ=;
        b=I0SoJ0Am6LYTEGCn4pOwHx+j5xu75yLlPrljFueS0E9AOFUcaCfldsSrZOMzCloE4K
         Qs3C9YBA7pWxKybGIwfHcjvnoDHs9iZxzuVuyynV9rBOC6tqIzsiWHLx8hdhckdNfzjV
         DFitSbMR9dGRHBKAJrKOF27y1je0lWAg4XbSV76x8JAZ161x7wc35D6oaI6D2Kaqz2YT
         eF32bSBzHAHK9ChGQq1aiSV5dpMjLFh4UAfQaVvzSdo+b2ZOhJDv0IWkG/A3YBRprMOz
         huX6pmMVW/vG8+nll9mvEEq1CzTjKaJ7aKAT1inSvhKEZM59alCVtKOzQHm6X4I4UjrQ
         g8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464526; x=1787069326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U8ZF8ImGy/s6CyUpwt3lFd9rgtxlS3WjAEMfiSiyhXQ=;
        b=bF/eFEo4WFOHq0Xq1knmIksXPdp5byFQDib2e/iHJpEre60OcoGl7swmoRBx7wkmka
         mz8l0DDDCq/4pEdX7WN+81IV878F1/OHo8epXWBzoSrW0ustMtME/FuJUrwFwWLlLodb
         TeyhG+QCcqGWyCK7rhBq3s/pDE/+RLvVom6bTJgOT2kgcavNptR33CRFO3N1rSHDeUTK
         5MyNhXKqlCPF9aIp3G2adSneR2PYwY1YSzD2/tpne5mMPmsOJbYgBAEtX4tvvyWSkCzH
         Euo5rErimHpG3C/u39mjJldeRx8iAdfeM6RIJIZzf0rLhOCihWRmbgYsyUR960ygEFzw
         fOvg==
X-Forwarded-Encrypted: i=1; AHgh+RpWAdpSrWqZUpLB5spZOfTbgM2AxF0crTOzH/7oj0kLy34a+A+8yoEL+TdnWbDGBqY1beBZOWWCBOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrd/vZbMaKTjHH8fW5AQii81QPMFgtk150mQ1LqFAujtEN+u+F
	WClArQgHjcVjPFZw/b72SvOlRHgqTlECu7wU7AI7OLk5b1HXm8esG90+/yzsdhXHi2cawDWUFso
	OMBNLJ7GKNatXsvuyXCAnvCZXbPDTpXKnw0s8n7jLGa45spzJbDgfeNSuBD2wqYE=
X-Gm-Gg: AR+sD123s4xrF5JXyw80uxIY1oZcCi+4sAoY3iKsSxTE2oZXpDcO2mFb7m2QbwQFzo2
	kdEXlAZaFV9JyJI2E4ExhB/TgvQuIOkS9EXZT8+drgE5EFoWft0lbmcY58LU3oRaWKv4RHZpIrM
	wKtVTXq4rWmIHc19IZmxFcdvhsGhPzvP1VGLmfxNbxj4qFMNZumZIpSdr+vsW80R3hdNQcffcYz
	4f9fyJutymRbC7ITHATn9Pfdi8KjXAfuWrRsF+X1pxvxP5pjTeCsiFPlz77RoTW+2XySb+d2ppB
	7ZC2LKTc8jr6vKC2qSsykZSfkkbavyUgMWT8H7+NLTTyEhxva1ZRFsihd0vklCSaC/Sktj/pYop
	2Q9VLAWCULudtTGk1pqw=
X-Received: by 2002:a05:6a00:4488:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84fa8840968mr4600654b3a.24.1786464525748;
        Tue, 11 Aug 2026 09:08:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4488:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84fa8840968mr4600568b3a.24.1786464525095;
        Tue, 11 Aug 2026 09:08:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1cf65acsm29513b3a.6.2026.08.11.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:08:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Google-Original-From: Mukesh Ojha <mojha@qti.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Date: Tue, 11 Aug 2026 21:38:35 +0530
Message-ID: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VsI5kfA0WMQGbarAtgIQzirQ-wzFEnp1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfXwvr5TtstS1mx
 KJ1Kftqb9xZB8ecM3NJEJJE04cTzcyyiCl9Vda1BH+OCDdDCuJM0ocvN9rHlxu+R1XINebofpcq
 PT0zkNRn0bfySrhWUoYQXjIjea1safpLaqWljh+o1Bw60su+F4liVE/HlufDwnSaiEMvN6duDpb
 Bew+PIR9ixMFvpmCWG5kF/v1fIZ6L7ss/xNVIz+cprQOiH3C+R5PlsoPiNBUUV2Q2WIeswLbByD
 i+AMUyg0JHs7BGbbdMP+AfaYy+hEUOcrh5hFdyBbnfCp3qsNsQ5/c52HHVN2HKfguayoeAqwkK9
 xmom/FM/2QmRsZrfWQVB+YyFm7OUTfE+zFzH7zLvDb+8gae0K0YvI8oB7iGY0JtKi0TYfFVwHeC
 ScjfTI9ZX3M4+Jmb+Z/VlX4gH3vVY/VcFREcxIr2R0ra0gZJ4XLSQ2VmGKzcv1We4fInvoX2ben
 v0XwtwS/wiPpNkaez7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzNSBTYWx0ZWRfX67AgRGs//Ss+
 35pcgyY7GqATRek8I7qqoM2du4itrRPpBdZL4srft/PoltJ3yaN+fc8mI1N4/paRxEzEGeZpoDN
 H1Hsg7sPUj51C6/yITJhep9Il7x1oqw=
X-Proofpoint-ORIG-GUID: VsI5kfA0WMQGbarAtgIQzirQ-wzFEnp1
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b490e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZlQQ9P4YZZ_H6Q_6FEoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110135

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document the Synopsys DWC3 USB controller found on the Hawi platform.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v5:
- Rebased it on linux-next.
- It was mistakenly sent with Hawi Phy series.
- Other patches in the series got merged.

Changes in v4: https://lore.kernel.org/lkml/20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com/
 - Rebased on top of next-20260731
 - Resolved conflict related to recent merged common phy headers
    from pcie.
 - Link to v3: https://lore.kernel.org/lkml/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/

Changes in v3:
- Fix missing version tag in individual patch subjects
- Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com

Changes in v2:
- Clarify in the QMP PHY binding commit message why Hawi needs a
  dedicated compatible string vs previous targets
- Remove stray blank line in hawi_usb3_rx_tbl
- Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..de50d7a3c999 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,eliza-dwc3
           - qcom,glymur-dwc3
           - qcom,glymur-dwc3-mp
+          - qcom,hawi-dwc3
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5210-dwc3
@@ -206,6 +207,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-dwc3
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
@@ -547,6 +549,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-dwc3
+              - qcom,hawi-dwc3
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
-- 
2.53.0

