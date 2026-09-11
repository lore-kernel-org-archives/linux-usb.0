Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76FA45517B
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789112079; cv=none; b=HzSnl2WVhSz2XQlbJ7qWxC5Cs/lseuOY9VaXI6Y+1peAwehpn4AQxAfoIW1CsDuW+ZFzmuzTutEUK07Sicq4IUb/83nXrI3qSgav6fJG15EsjW/CvPLr1Agj5K6INe9JpxK0pJk4dHCfH1VU0e/39/8oy99NAX6IwUe3/TDrxWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789112079; c=relaxed/simple;
	bh=dNlCiFXswF1Fr7PLA3aiv3UeITCFkH2J/BpCPdFze04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozvz98HSbCWHQYaXVW/q62QILxZSOCFy1nrryRb5xJn94D0EfKOnJrLKondlufhmb7q1Xzy9vHZ+5rGpmemlS/LM6O1S9TyIE3XXgseUY2zgoe+nNu62yTcw3gQXF+wxxl8m4p2xQpFBfNogXujkugkMAU4KKTidf1b/ZUIZab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPbK9oO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sa8njN6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPbK9oO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sa8njN6n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kJGQ2175515
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vfNW1OxUfVz
	0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=; b=aPbK9oO1d0Km4gxFf1hGuf0UYo0
	0ct4QlfUk1t3Zk7zVYR67PehKlLuEWvoZwJYehxvtZygEuOd22Q8rgdrZ0Pvo82w
	aXgDywtCT2WLMUANu09ydHXYmyPVBJQHTi/++cHG2sbU1JwovrsKcJ6bl+Vv24gk
	k6w93oPMavVT7IZ1CS/u8QR+cE8bwdur94a4wxNeNWu0NV8ExV6V2zgMkfyqYOrO
	wORPmFbTWmno08UK4d+SqgVx5xR6732bbSACfJBpU6CC+WR0AAff+xR5/c0+sjdC
	3J0Ai1VLEUSImvztkW/CkoAs157nEx+0OH5YqmWcLjY+P/ah4J7S9U6iVtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uch9jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 07:34:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so857428a91.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 00:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789112071; x=1789716871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=Sa8njN6nA/UDi/lGSZ8likoPm8QF2FVdiSzF8M713w7NR6Z6vaIWYUq55nCpIgGiOk
         +beHy22NG9hWhTOPlTVdSxl9xt0hCQwMUqk84/hqyYnAAJgYqP6dMfs6i1RLDHuCJBp4
         azOyAsYdBjIs23TeTw2yWgUU6ac4vgGcWDWb2UxeK1f0UpkfSDwVDMx94fUy9++MohXQ
         iVMc67J8SKmIzMZAL8vMY77KPAta/sp70lax8cjtdv+eehelQPB/sF80hlZpiegAWw4K
         ex0t7Z7LhjRthLRuX1LrOs1nQwY4w9FeHx037oDjQMwkHDPpB3qAAQMLxuiuwWj5aQGi
         2b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112071; x=1789716871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfNW1OxUfVz0rEV2Xyz3S/A58KC8eNirMOoV11ylpYY=;
        b=ocWbOL3vNxA8g66ES+dpY1WXHVsOOuWvBUbp+/MuxiOUNITsF4Z8n6TGWr4PjASJ3i
         KAxVdjP/lg8oC94jOceJAlRvNV2FGfQt11tmobYA3MfIDvZ54SPxdhq+vwcrt1ZBVg7i
         sHoHf+OUuD5Uwa79oYSfJDMxtGJxMph29Jg9KnpIR2M61IOL2dG4fWQhEIvPEw4B1y3M
         6HWP9Jq/BXfMFF+Y2F0SxS23QIbm74UQao2j7LiX8rEgMj/Uqs5ZMNmDojZn8nrHEFkj
         WvEgfh+oZH7aPgzLmD+9kmay+G60eU++Xx7H/0jPu6WnpuMCp61wiQtpuITyfQ/qG/Nf
         S0TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH5/ySYwazoCbQ9nyemXHqwydswSusQzOn650X6BE2yW+kYJxsGxsUyuZYm7SleKAfLljaXIPWSIY=@vger.kernel.org
X-Gm-Message-State: AFuF++k3Zxwi3bXDVdmiwDa4PRI9fo/xq1Nys7Wt6OUlnVYDlxixhiWi
	aj6C6mFcPE59tXBq5BHrPmQGNdBn225QQzt7Qvnc2vWSw0QVQurJGLzayvWCiIG3F+quqRnPmAg
	X2NyChRLyLEtiGltNHyXm+C8/xr0w6bxk3VwMePx0vnVEsoEPoLhPP81onu+aR3w=
X-Gm-Gg: AYBFou1jjBdDRrA+qgEf4Ad9T2ud2tWAn76m712G4joNiPHoupWd8entEMKhaP0ctqW
	zWjye/x8VDei9l+DFxWeKU1GIviwZKfiylI37WwHgSvdlkXCAnGb+Rlty/2Guobc8exj16VS4ey
	pF/o3QR1Zszp6Ul6Yphddq/3URi5JSyw6yZhGewgmPemoQ1uPxpycOtfC8CzMbTNc8Wcou6U5uL
	xVf7lWV56a5GeCMb2TiTSgnIcWaUxXPOJuWGIrIIMKhG5QAgcnxQIlkLXVCw8S83R1bQEBBEbBO
	vtKqifvQacQBXVnjgdzZuIzPBnK1UMiJEwhLF2MMfpL+CX0JG25DAmAeutSwX0S63UHWtD2rGZ7
	ORI0cAsBYsBK10kwh5V93wtaZPGG9o0RkKEYzA4fhmxi2aNKDMcA1nxs+v6Rk
X-Received: by 2002:a17:90b:5605:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39d9bbc9177mr4679374a91.4.1789112070400;
        Fri, 11 Sep 2026 00:34:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5605:b0:398:b17b:3bd2 with SMTP id 98e67ed59e1d1-39d9bbc9177mr4679322a91.4.1789112069869;
        Fri, 11 Sep 2026 00:34:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm6163058c88.14.2026.09.11.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:34:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 RESEND 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Fri, 11 Sep 2026 15:34:13 +0800
Message-ID: <20260911073414.16711-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3af07 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfXwJLySJ1Gyv16
 9NsSz7PsssuzJOUXoppb5cDIA4JQS7OxBhZmfOzuEZgJB3asI3nZFRWSOZ0bu9323cYZVsVqoWN
 wqMGcMWaa1h3Skg8MlZEg+Mj67IUW8x5jMrMo1WpBU0N0fQDge6O8kiahGuWcX3x8ivd3grMiEQ
 LdGfzCrcNFrYNx/VlRj3lmkShkqV6mIZroUwaRXXcPZCv7/4sahDzcOl/+5PNi/TaYdm/VRx9fq
 jnaP5fvbkK/D9+M3g+/FJ9QWrDcyQywxcKhc7OplK/Ce8X9jemAM/XV5UBFUlhegAW4M1k+meTF
 prgZANJdhbt1ELc5LHWNq0FAevb9fbc/HaWg+qswx8zcxCRJU3huzQKGca9LxO3m6UlNPXO2vnu
 CLI8runQbX83KkvGwsE1E/olH4BT1YtVlKwY6qhT8DaITob/YYWeHC9q/8hYsbiOLLeJbxtJZTV
 0ejWJU9HEsNnCaFB9Ww==
X-Proofpoint-GUID: M3WfovDtDScPjmXdJQITsZts6XyHwY-k
X-Proofpoint-ORIG-GUID: M3WfovDtDScPjmXdJQITsZts6XyHwY-k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwNCBTYWx0ZWRfX4Zkk1p4I8UU4
 6UPqblgc3EeLnmJA1CVdITqLXh4VkDfYPq/iO/6GJVPA8adqeLoSdn1L6KT1DaF0Orx0twzgQ5H
 SbGwBwX/bhqdAKHmNcAaxTRacxRzUFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110104

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

