Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE136B920
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610403; cv=none; b=WiJwCN3XVvCdSB2WMIi4zH/+eMJeHLUiiu6OFc1hg3f82mRmv5t/7tCTNsQfxAz22WGUccPoK33T9TDANo054byJYkR0NGcVl5nIvCExMuRpz641J0GzgzuILzNnXqzqdiY2XurFiYBhFajmGEoUWzq1jfNYbW34g1Vflu3TMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610403; c=relaxed/simple;
	bh=IbaK97wpeZghP44PmeIomwXTlMt1sIF6gVbIgg3nLrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HlgcDM164suoQwCDKmzRD/wXD3o65jFpN2+BBUhSgASswkIhGB2BRpCgKqpF54p+slxRFiTRPCQe0spIr2EdrrWWRJE0Ifj01W71nw5x8N/bOjByPW81UoGZEp5ZMinoIGBFk7PqEyyf5o3K4FdqocNlvjRcuM/R/KH5cJkDHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZmpW+Xk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bz0QI90F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZmpW+Xk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bz0QI90F"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2ersG427444
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h/IiMbaR3Fn
	kAg5FPCWXHa7ZhrbRaCtFdGqxe9wMZ5I=; b=DZmpW+XkCvEE+pK185SyMXublK4
	fWN2zr9GBX28BazieTzfVrwxiLpnoL2aLroQ01L8xaiJQ5njOGteugSRcABWv+g+
	LzbYbsxxQqQH5xNvL7SsvXUBnU506EtQqt65Bs6I8akhxHRxBnb0mpYG4DITS7qi
	dlJOtI0IeaGfwSWC0ZmG/wKyPa4D9/l4OX5BbR8cObmwf4cuWeGV58ao1OmwXTLY
	hWJsfbE8icopFr7Q/PDGwEQ4OXUm1MTZBo1JlG/xI1EU2zRX0xTFFlAewJ3ZIuuu
	d6RslTwDIPBCEB9lSDFBu2KU7uL5lpXCQmrCPSjImNqImQ8aUqtPZk/9rRA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cas8dgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:33:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso410969a12.1
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 22:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610401; x=1792215201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/IiMbaR3FnkAg5FPCWXHa7ZhrbRaCtFdGqxe9wMZ5I=;
        b=Bz0QI90Fv8SwL+NTqICmvTfZbfqKEG4t6InJK15wsbvGB6yGq8TpKVkq2c1XfjculQ
         T5IKjZLmp/CQugMPYn5V7VzroqaqJUkJgImBp542zKd79Rd+yfKy5lues+gqelTQCzJI
         IgJvH9FG34WLjU440fU3jQIbJ7QlRxeIUfwq67xJd5ehqPuEnVVoo0nvnrPuwdDCFFw4
         M4KXWZyh5TISvdBkGXo2BWXOvGBiUaHgTBVL9MySmaMulTOkJ2eAGzu1A0D8/HjrbCRQ
         01//kLZJ37fmSbsLF8fRv4AZnI+Mnkmb+wnR4Uf60hlaRiJhBotaO2cgdzcYyNQ8E3Fy
         8TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610401; x=1792215201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/IiMbaR3FnkAg5FPCWXHa7ZhrbRaCtFdGqxe9wMZ5I=;
        b=vDKdhulJ1T9tXB/FFJtUUjb3Ui8Cc9Jozvi4FdzsVWLnsVjviZGcCI0Z83tgjFmS9q
         SrT7R88kbwWjwHBv3ZhSiqi7ln68VPlGUVa2p4PgqCWfyixrg0dR3P0+Ok5ja5Z3M7Iy
         GuhGj2OGyVVTZYVCz22UNyu3U9RbbsWSuiCpdtqI7UFsnijlChB4w6Yvo+gQvg7gzZ9Z
         F76RnGSAnn6x5jjK/RB6fKBQk+3yJZEUMRFSjdPvhlCYrfDkTXBV3EtIYvkEswQGkzJ5
         JUyVsUEai71yb//jinh9B1l1jJScOJp3fGZY5fw9wjRiL9KRJmwW/cJXWDa9geg1FOyQ
         LBrw==
X-Forwarded-Encrypted: i=1; AKwUvByRzcyCAObuaIi3w5/rKhixG227ulJeIfjNdGDnImk9CWnVFUjecZBoebr2fIUmkqEiqgloZK6jQN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJinEeu9OfORcNsUJ1XbOWwngi1neClW3A/Bz11qQVTZTH7VhXM
	1iqQuu2iuBTgIQ2igq2jBrJcMtCKlM87jihDnMhGDlnWaQlNrABlAXmU/6AdE1mYVlYttEa+X+e
	ZE1NgTkZa59a5/S9SJBc99eB0GPFLRFjIMlFzFaNqoecw3jFrqwtDMXzRI3TiwXQ=
X-Gm-Gg: AYBFou1uRP6BeqickZC2AcCMgxbIhbIs6RSKY/8tYb2Bjrtstc2A+tKdj5bOtMr8dUk
	yBPjd4x9O86UzNRkgupg3fvHtLzbqHOQ7arfgoW0i1enDDpp88MCcU8XKsDAHiRkcKBOy2iukJ+
	YKO8gVYSTAZvkQkS587SDvJYP0fjtc6smAWKKLz0W//sSXRhwc2+1FAKeZCuAjx1E/7xHp6sYth
	vO565dvv7q/J8aedgQeabLsHjeTw8pzKSkvxraTxzcl8YTN7t3CSX3CpQH35rZcedOZfhG5LIT0
	GaFrdh4X0MRew9BkXiFMmH+IhBdSzEqsixypI2AqA2qakgJ+his3OMZPKltlc+8HzhKXV3LYbr5
	JYvXLpRQNsYJa0QDCQgS+CwEvT3CO2lk=
X-Received: by 2002:a05:6a20:9183:b0:3de:8ee8:8323 with SMTP id adf61e73a8af0-3e16bde40b3mr3867531637.29.1791610400638;
        Fri, 09 Oct 2026 22:33:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:9183:b0:3de:8ee8:8323 with SMTP id adf61e73a8af0-3e16bde40b3mr3867511637.29.1791610400156;
        Fri, 09 Oct 2026 22:33:20 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:19 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Sat, 10 Oct 2026 11:02:42 +0530
Message-Id: <20261010053246.2991984-4-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfXwmCA0fhhLybZ
 mxDym1pdO3I5xN3br4qLq+kRt7io7QUPgE+8/IRAdWXIKqMIMmVOwLUneMVVorL3rxMnXkCtOMz
 Cx7hb364A+6OQ8Lx+QPGRyHFl9pFl0Q=
X-Proofpoint-ORIG-GUID: DxBih_gVL-ORmvSf6_w6Dzw3NJU3d9dT
X-Proofpoint-GUID: DxBih_gVL-ORmvSf6_w6Dzw3NJU3d9dT
X-Authority-Analysis: v=2.4 cv=eMWGH3p1 c=1 sm=1 tr=0 ts=6ac9ce21 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX5VsERWibBIl+
 KjeELoDOjL+gnv7PavCA/68GD62YePpx0li6dWt1Ol7NKTXHKE0c6reJ5T4AEBP7htSM6eW1cLP
 2yK0qC8F2QUiDZRxAFIj+0alQnCrmdwut9KcfDqdITDipjvuK2y1Hm8vXK4RoCDSOdg27EvUy9p
 ymIBKhOLsiWCef8twu25Xji/Yx0Ix4bPFvwk80S4Ptlxh5PdTUc277b4ztLZFinulOHc4XtqZyE
 5B3YyTABRCNvERQzYGoyNHzlB6FuHi5Z/3OJ5vZEDOWs45mXA/CB0BRHHjyrkzqs0M9O+ezA9Y7
 JoFY+N1yFDJ1B2P3/3t3WFF58CU8ntX63t4CpT0gULSl1Wwkfd80vjyVIXjC46iXUQN/L4oQRK8
 o6dhy9qeXHPrXgDAz4S4DXoB9hJHSjk7pIud6eOXHwfYqp2cpEnfiHkrPgtY2JaXX+P/M0ExbGh
 9r2BrinNA81MTOjY22A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100021

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms, while excluding the clocks property since
clocks are managed through the power domains.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..87f426fdbd70
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 5
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: dwc_usb3
+      - const: pwr_event
+      - const: hs_phy_irq
+      - const: dp_hs_phy_irq
+      - const: dm_hs_phy_irq
+      - const: ss_phy_irq
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    maxItems: 2
+
+  dma-coherent: true
+
+  # Firmware-managed platforms do not use direct clock/interconnect control
+  clocks: false
+  clock-names: false
+  interconnects: false
+  interconnect-names: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

