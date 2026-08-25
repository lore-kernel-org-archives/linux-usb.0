Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C456442FCE;
	Tue, 25 Aug 2026 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661454; cv=none; b=I3RCjwyZSXIcO/rwasfSiYYWelWPvWjJJ8U8/+XW4iVsF0hmFKJXZHEY/w9Buc6i+4mtTT8VZ/OaWNeXp1lkZFhgoKa+OYuKa7daSYqhyW/18sqfWLbVTT3KRiwop+Scd9DUiW63dYqy6WEdP9GlPUUh6twW3Kn7n9EMXGKxKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661454; c=relaxed/simple;
	bh=Fvem3S/s8weQhv29yD3FxDRPYmYvuo32XVi3h1fP+i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HeOij0Lp6n3QAlzLAHxTsHYv4mcwmD+uLWFJhgZVTp5F4lmVYOfP9KJPBw3DzYCfVAkxRJlOeng3hUk8jU3gogLp9QpZ0j3L58te3ldjnyRS+0DIhiET5sZUsrk+3FLyTbBb493XXWKO/8cTgSRMQ7OqqaHLxgGP0cCCol1icIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGJEMGcL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGJEMGcL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED453C2BCFA;
	Tue, 25 Aug 2026 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=Fvem3S/s8weQhv29yD3FxDRPYmYvuo32XVi3h1fP+i8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LGJEMGcLvFnb2sWI3ScamBYhxIKBZIeO8RQMXXDvVla0rlMMg6ndPGJchGdulAvV/
	 29tF0wbL3+VGHSSP/znHy8UTiQL6DOA6IHzWd+RtXyp+MJxFjU1oSOnLXd/ftfQpG6
	 X7gRglMz14dEn73A53UwyxfLvYM2twbpXxsxB+qIQeKJuZ1/xpQzxb/bTCaLLEftRj
	 5BpX67shz6oEKijv2kxVuCPOTcF5bqpamd1CReCGo2M0BsXv2hxxm8RmL7xaAjGj2z
	 liorQJOE0Ud62smvPDM5U0OrxBCoXh/33OxSebAp7FF5E0MDyRWZF9cyHhQ0wGvcpZ
	 LDT4XsZ+ASJMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71D0C61DBE;
	Tue, 25 Aug 2026 12:37:32 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:18 +0400
Subject: [PATCH v3 01/12] dt-bindings: phy: qcom,ipq5332-uniphy-pcie:
 Change to PCIe/USB3 combo PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-1-39be0955a6aa@outlook.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=7815;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=+Cf/fEtBtS5hTFBthO9VA7YZ1YWg8gWCwEnzEp4khVM=;
 b=QGGfI18EJcCkeq6dGsPRHELd+S+u0Bap8yJuo3Usxev29C+KAZjyFt6yCCH42rU4HfmnLTrZQ
 Zm1NGidRlWKBLCvqHcJEfXreuM8iKzPctnwCtAd33ndnJnw2hNhznnz
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

This PHY is a PCIE/USB3 multi-purpose PHY. Initial support was added for
PCIe only, so rename the binding and add support for USB3 PHY mode.

The PCIe and USB physical pads are muxed and selection is done via a
control register in TCSR. Add a new property to the binding to enable
switching the default PCIe mux selection to USB3 mode.

In addition, USB3 mode requires a 5V supply, so add a vdd-supply
property for it.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 .../bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml | 109 ----------------
 .../phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml     | 141 +++++++++++++++++++++
 include/dt-bindings/phy/phy-qcom-qmp.h             |   4 +
 3 files changed, 145 insertions(+), 109 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml
deleted file mode 100644
index 6e9df81441e9..000000000000
--- a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml
+++ /dev/null
@@ -1,109 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/phy/qcom,ipq5332-uniphy-pcie-phy.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm UNIPHY PCIe 28LP PHY
-
-maintainers:
-  - Nitheesh Sekar <quic_nsekar@quicinc.com>
-  - Varadarajan Narayanan <quic_varada@quicinc.com>
-
-description:
-  PCIe and USB combo PHY found in Qualcomm IPQ5018 & IPQ5332 SoCs
-
-properties:
-  compatible:
-    enum:
-      - qcom,ipq5018-uniphy-pcie-phy
-      - qcom,ipq5332-uniphy-pcie-phy
-
-  reg:
-    maxItems: 1
-
-  clocks:
-    minItems: 1
-    maxItems: 2
-
-  resets:
-    minItems: 2
-    maxItems: 3
-
-  "#phy-cells":
-    const: 0
-
-  "#clock-cells":
-    const: 0
-
-  num-lanes:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2]
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - resets
-  - "#phy-cells"
-  - "#clock-cells"
-  - num-lanes
-
-additionalProperties: false
-
-allOf:
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq5018-uniphy-pcie-phy
-    then:
-      properties:
-        clocks:
-          items:
-            - description: pcie pipe clock
-        resets:
-          items:
-            - description: phy reset
-            - description: cfg reset
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,ipq5332-uniphy-pcie-phy
-    then:
-      properties:
-        clocks:
-          items:
-            - description: pcie pipe clock
-            - description: pcie ahb clock
-        resets:
-          items:
-            - description: phy reset
-            - description: ahb reset
-            - description: cfg reset
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
-
-    pcie0_phy: phy@4b0000 {
-        compatible = "qcom,ipq5332-uniphy-pcie-phy";
-        reg = <0x004b0000 0x800>;
-
-        clocks = <&gcc GCC_PCIE3X1_0_PIPE_CLK>,
-                 <&gcc GCC_PCIE3X1_PHY_AHB_CLK>;
-
-        resets = <&gcc GCC_PCIE3X1_0_PHY_BCR>,
-                 <&gcc GCC_PCIE3X1_PHY_AHB_CLK_ARES>,
-                 <&gcc GCC_PCIE3X1_0_PHY_PHY_BCR>;
-
-        #clock-cells = <0>;
-
-        #phy-cells = <0>;
-
-        num-lanes = <1>;
-    };
diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
new file mode 100644
index 000000000000..0d9d0fb405b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,ipq5332-uniphy-pcie-usb3-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ5332 UNIPHY PCIe/USB3 28LP PHY controller
+
+maintainers:
+  - Nitheesh Sekar <quic_nsekar@quicinc.com>
+  - Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
+
+description:
+  The QMP PHY controller supports physical layer functionality for PCIe and USB
+  controllers on Qualcomm IPQ5018 & IPQ5332 chipsets.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-uniphy-pcie-phy
+      - qcom,ipq5332-uniphy-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    maxItems: 4
+
+  resets:
+    minItems: 1
+    maxItems: 4
+
+  reset-names:
+    maxItems: 4
+
+  num-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2]
+
+  vdd-supply:
+    description:
+      Phandle to 5V regulator supply to PHY digital circuit.
+
+  qcom,phy-usb-mux-sel:
+    description:
+      TCSR register address for mux selection control for PCIe / USB3 mode.
+      If the property is set, the driver will configure USB3 mux selection.
+      If not set, the setting defaults to PCIe mux selection (BIT(0) = 0).
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of TCSR syscon
+          - description: offset of PHY mux selection register
+
+  "#clock-cells":
+    enum: [0, 1]
+
+  "#phy-cells":
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+  - "#clock-cells"
+  - "#phy-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-uniphy-pcie-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: pcie pipe clock
+        resets:
+          items:
+            - description: pcie phy reset
+            - description: pcie cfg reset
+        "#clock-cells":
+          const: 0
+        "#phy-cells":
+          const: 0
+      required:
+        - num-lanes
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5332-uniphy-pcie-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: pcie pipe clock
+            - description: pcie ahb clock
+        resets:
+          items:
+            - description: pcie phy reset
+            - description: pcie ahb reset
+            - description: pcie cfg reset
+        "#clock-cells":
+          const: 0
+        "#phy-cells":
+          const: 0
+      required:
+        - num-lanes
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
+
+    pcie1_phy: phy@4b1000 {
+        compatible = "qcom,ipq5332-uniphy-pcie-phy";
+        reg = <0x004b1000 0x800>;
+
+        clocks = <&gcc GCC_PCIE3X2_PIPE_CLK>,
+                 <&gcc GCC_PCIE3X2_PHY_AHB_CLK>;
+
+        resets = <&gcc GCC_PCIE3X2_PHY_BCR>,
+                 <&gcc GCC_PCIE3X2_PHY_AHB_CLK_ARES>,
+                 <&gcc GCC_PCIE3X2PHY_PHY_BCR>;
+
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+
+        num-lanes = <2>;
+    };
diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
index 6b43ea9e0051..a19f7376b15e 100644
--- a/include/dt-bindings/phy/phy-qcom-qmp.h
+++ b/include/dt-bindings/phy/phy-qcom-qmp.h
@@ -21,4 +21,8 @@
 #define QMP_PCIE_PIPE_CLK		0
 #define QMP_PCIE_PHY_AUX_CLK		1
 
+/* QMP PHY MUX */
+#define QMP_PHY_MUX_PCIE		0
+#define QMP_PHY_MUX_USB3		1
+
 #endif /* _DT_BINDINGS_PHY_QMP */

-- 
2.53.0


