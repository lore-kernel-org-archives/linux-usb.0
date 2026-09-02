Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE33655E0
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 04:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325195; cv=none; b=i0R6uX/pdoOTrX2O3kAlogebDVX6T2n93Ii2Jkxuto9EQWnFBnwoNGU5ImNy8Q2w8CSmeAiLauxkZIA49tQ5FRyGVNq2v4FPG8J+18GausMYK9QL/kYXM7+XcoFK0lkZesx5na3jkGNIwL6wblvIreFOarF3tGGYJEFw4las/cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325195; c=relaxed/simple;
	bh=mL4UmJWXh0YmJ40NhOn8YczxVlIF2tdm50qSEcaXgfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQPNC/RotCC/TucDPhoEAo+NG83rbrrQKowu6tLuoQrEt91ajvoleWfSiUXRjvu1+o1YXtHLDLfHsl5VLvCHynSuOHRB4+Ri7yNU8teRN2D/5rMkcKbRtcuTm29SrFcLCHsfT1w5F588nQtHYs7oljUuoQzQBRC3UoexFUYvuDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6sa23My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI4mXQTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6sa23My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI4mXQTB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6822ZH7s173560
	for <linux-usb@vger.kernel.org>; Wed, 2 Sep 2026 04:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yScyxKkUm3X
	/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=; b=G6sa23MyqnoTp8bEBtj5fnUYjXX
	RVkShYrP8Qfpl8rt/xNYaho8TIO9aBqPEiXpipHddEfGexOYRLue9LplRku0XH8G
	Vf1+n/3zN99FsWUZKjU8OQdk/0/yCV7kCW/9OSn2qj6RReNj8I4pDHFHS5gXQRuy
	hAQGs7XW209GjZAiPpNMP275tSwTLFaz7Tngf2S74OiCvQsCsoWanMnxMAuBk1Jf
	heqpjDKYyzsBRQxKX4HBbFijy7uHS+IeKg/r5tkdrTiES9dmgyATpixF3ALrxwxW
	JxpHuCWlskRSrdS/k2p3lg7UL4eNIDiMPX2Jf9FKB4zbw2pZpVa7rAE1KQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb560dwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 04:59:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso987887a12.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325190; x=1788929990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yScyxKkUm3X/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=;
        b=RI4mXQTB6pqFBIU9VkOq7QTlkaW2Cr+iVSS4Sg7rgN7Anp5r/IdRXVrPd8Lifp08SQ
         NLDpXT/6PCehHAmfWDkWW8laSYgE0VQhogOmLdyTHUhhmWta658oCRK6Y+/93qVfYsff
         y8rAGKGEcQIhEiys50ZSNFp3DhvmS1/Hgn0NkAxY2jf+Zas5SBa6M4pUVwEA8CMynJ8l
         8iOHW1Wz6fMpc7UW5VHT5BnNZumKJXZ1qi5TItkjdldJYqhgWHIO3WYFETlVcaXWilPT
         6sTmEkmsawDrvX7svY+WXRYiALLlgjODoeGO52YcEVnLPSgIu6zDFkHcWHWMtBYfwoy1
         DjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325190; x=1788929990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yScyxKkUm3X/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=;
        b=nTdyIuwLscS8eCcsFq2JeeeStNWBKIkzQb1wIzZQyJUBoP1O9bLiVvEZe4R0+iEnmF
         M5N9+OvJrk/XXuBTs5S9pqS+8zHrZ11+UvLvgydKqJ2qehef7Tfp+AJNvZVMWHq2Ulvf
         WTH/+eZ/q+Bi+q8vSUPC4QyJPkfGY3tJniwIjpALIr3liHBwT7YcmDQ0yczYwcKls8pv
         DFySopCWQkztWbVc1zorHf9WoSqsCdAaKnMYeYuKvL9tC/c+AQhVXFTubfvp7MMYE1KF
         Ot0dOXagM2cDhU1nd6hXuBLC7g8Z27XDeqVWhRqY3JP/rG+jLooKcrRaz70NpRNj3WHe
         cmmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3OifeildDBA5xRmqXGq4tlpHiHLem6/s7kWZRJqPkR73ol8oGQAqh2Z/H+5fCNLhQxE9y7zMUkZY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTiUoHRaS41LZBBFJIX/LLJ2UcZx+feT7jbg0sOaNv3ZMeobe4
	QkzhRJLh4ElDuhFkycfasrlzB/+QexmX2z1V0PjlBqStzJgLTfJuAFkpju52mC9wknOVTDVV152
	NPsywQbbA4a3aNcRJsnAMpYc0/Xno5dPw9/Z7Ij5+pU7oUVDZk8TpP/rg1MPMPVw=
X-Gm-Gg: AR+sD12j+q77t3onF4JB2M5zwIIGf4to6V/oAJYSQ2UBkneA0yUagRIyQ+hBvDabhqs
	potuTLs0ExE7gjAQDSQBD3W5QVTevLWdKKxtPuKqlohs9jbfvcVXEOAusEM+PvSKTH26bWOPvxl
	OSxMz4BbOCX3KLxPwF1W6dO0TQT5opbz9xwnySIpwx6OABu2NNuEgWxH3B9MFxTwgfY3lZKlMSP
	ZNf/4vmwPftXSdfmM6sar1uDWI2JI48YjSwwGs5rQfwdph3v4PK7qGHkwnYdhJRpZDCQqhqYKLs
	2lI+aUCn9XUuBR+x14t2EQYUag4M065s/4T1AgstlC6HwnIISSojIVLm8u/wGnX9Cv3H3dWzciw
	Pn7gUGqphDiAKY5syWZ7eMMC2IdjlBAIm9Q47qKVMftv+2YaxT55ruALbm7U8
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr3457119637.1.1788325190361;
        Tue, 01 Sep 2026 21:59:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr3457086637.1.1788325189953;
        Tue, 01 Sep 2026 21:59:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm2782639c88.8.2026.09.01.21.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:59:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Wed,  2 Sep 2026 12:59:37 +0800
Message-ID: <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfXzvAhHd3wzSB7
 uRNq5Ev2OWsIUd8WN3x1oqLArQ7OirukZjMtf+A9M/m/kJPr+Oo+2cY3tmiPG+jOZOIv4DxgyoJ
 Qv8rjJYaaXRF54NEQlhBMn8B4gwcHXNYUu/LUGbFrcXleA7Ltr+nxY4RolfwWZcFFEqrtHjeKmg
 5oml/afitbTOS2rrr486v1Rtvk4/qemEhetp/vVXcV4YnS2IRywO9pGb57uHI3KZGjFqsoIE0th
 ioRtDaD8aNkl8qGiC0QF6nhkvh7qWh8E1Luc6peMZTTpTLF3LLVmX1/H2mC762KNoU2MNuBXdTt
 Mk8urDVczTUIrnQl874qY+uRMi93OTmVm6eRZhUuWulcz7TbFqXyHZ/5e3tEPMtkKSyFbkrwku5
 kKICVW1aHDiNdP6o5R6v0qc0kSyOX9ln/m86ojLh1rTg8T9vuGsKJSUcVhAu+eIDI8f4fGXqamo
 OHBj+cDhix8lcnRiWiQ==
X-Proofpoint-GUID: 9_8VctP3I-ZnwjbScnR-NbEk9nykp-Os
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97ad47 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 9_8VctP3I-ZnwjbScnR-NbEk9nykp-Os
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX8UI5+f1N6Hit
 +JWiDUK+RsKJRB2M8PvKfQr0K53OcDmARDh5xdEVLfWHGiADtleZ8JPOyrdGJhsBbBkse1wZJkn
 AVUInJcaByVbozuQ2bgXnzjAizAjlrE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020042

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
new file mode 100644
index 000000000000..09f2e964d3ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb15201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi FUSB15201 dual-port Type-C and Power Delivery controller
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
+  controller. It runs the Type-C state machine and the Power Delivery policy
+  engine on an integrated microcontroller, so the host is not involved in
+  Power Delivery messaging. Over I2C it reports the attach state, CC
+  orientation, data and power roles, faults and the VBUS voltage of each of
+  its two ports, and accepts commands to initiate data and power role swaps.
+
+  The two ports are described as connector child nodes, addressed 0 for port A
+  and 1 for port B. A board that wires up only one of the two ports describes
+  only the corresponding connector.
+
+properties:
+  compatible:
+    const: onnn,fusb15201
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line shared by both ports, driven by the I2C_INT pin. The pin
+      is active low and stays asserted until every pending interrupt has been
+      cleared, so it has to be described as level triggered.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      reg:
+        maximum: 1
+        description:
+          0 for port A, 1 for port B.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required: [connector@0]
+  - required: [connector@1]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@50 {
+            compatible = "onnn,fusb15201";
+            reg = <0x50>;
+            interrupts-extended = <&pmic_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C0";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C1";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

