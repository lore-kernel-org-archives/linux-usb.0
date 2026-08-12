Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47650360EC9;
	Wed, 12 Aug 2026 01:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496585; cv=none; b=sYVT+uqhD2C6U2+RFvognPHo+41vDxvmtI0fY6DfDl0nSJNFkbvL492byoh8psUELYL6hDpPnLeUq3p1AdtI7g5CPdWJdjXLrFzJk9soOkKkOOV163/bIx3Cr6ErxPvbPFYvlaa3/nUrTvPlX/KSS9Bw1h0Qggk+r6cHf2zT+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496585; c=relaxed/simple;
	bh=fX/K+WGy56rEmgzy6z516EoVaXsCq69iDNcoXAw1aaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=biuYuH3Dr7c44pmZrub0RgZc7cN34Cu6AQbUkUAO35cHeKtJNSK+wcFFQWFM3lY7pQzhQ0e1p2uyLXqjgsONmFRmGDR9O/Ag8qZuASHiY+581anl9y2zao4pXD9mQmHiwwvTPkr+XhLQmcfJ9mM/69EFZ+1z1XtaqgwiqhVEjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=YX6gMBqw; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="YX6gMBqw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 207E311A0F7;
	Wed, 12 Aug 2026 03:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496576; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Js4g4d2kZhjNnU26OaWa6DERMam0dZGdTIc+RrtobBM=;
	b=YX6gMBqwNKdgaMaU0zkkQo4QCOs2RRJX2iDSI1uMV+C5tLYzB701mGgnDFWqJSG3KJUczB
	vRhNPc8fO2H2VSzgcTqZVkyYHmkzZSd8oT050KEZ/0s6adq9g3J4FHVwCo/ypeA7EaPwUB
	uOeXB+ttxoL+3Yc+gXS12wXYzwIbPL+Lc7DyGXzaHhnDba8zctdrkl9GXYaik2V31novVC
	vLU2lVRKsYmPaZ+FWAxwUX5IBpdJVdkXX8rV6+qnq6dWD15tU2CDp3Wc9lBaGrjbXJ6qmo
	6uFdHsDlt30U+03CmBOPUuI9cSVRMnZ1LWuP8j7hjSr1rDFobmOPZVtEtWt/xw==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Pankaj Dev <pankaj.dev@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/8] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
Date: Wed, 12 Aug 2026 02:55:45 +0200
Message-ID: <20260812010157.1772849-6-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812010157.1772849-1-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Document the glue
logic and DWC3 controller.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
new file mode 100644
index 0000000000000..e377efef43503
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/st,stm32mp25-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 MPU DWC3 USB SoC controller
+
+description:
+  The STM32 MPU DWC3 USB SoC controller block supports both
+  Host(SS/HS/FS/LS) and Device(SS/HS/FS) mode operation
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+  - Marek Vasut <marex@nabladev.com>
+
+properties:
+  compatible:
+    const: st,stm32mp25-dwc3
+
+  reg:
+    maxItems: 1
+
+  access-controllers:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus_early
+      - const: suspend
+
+  dr_mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [host, peripheral, otg]
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  resets:
+    minItems: 1
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to system configuration controller.
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: USB3DR control offset within syscfg
+
+  st,enable-port-power-control:
+    type: boolean
+    description: Enable Host-Mode Port Power Control (bit-3 of capability param HCCPARAMS)
+
+  st,ovrcur-active-low:
+    type: boolean
+    description: Over-Current signal polarity is active-low
+
+  st,vbusen-active-low:
+    type: boolean
+    description: VBUS-ENABLE signal polarity is active-low
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - phys
+  - phy-names
+  - resets
+  - st,syscfg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    usb3dr: usb@48300000 {
+        compatible = "st,stm32mp25-dwc3";
+        reg = <0x48300000 0x100000>;
+        clocks = <&rcc CK_KER_USB2PHY2>, <&rcc CK_BUS_USB3DR>, <&rcc CK_KER_USB2PHY2>;
+        clock-names = "ref", "bus_early", "suspend";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb2_phy>, <&usb3_phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&rcc USB3DR_R>;
+        st,ovrcur-active-low;
+        st,syscfg = <&syscfg 0x4800>;
+        st,vbusen-active-low;
+    };
-- 
2.53.0

