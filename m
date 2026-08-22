Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233039B97E;
	Sat, 22 Aug 2026 07:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384940; cv=none; b=lMsFLWzVqofdQm8ctHf4Ocj3CgpxB8HRnipDYdDptuRvyOSJ7GqyEjFpT8sLWzXu52SM+SGj+lVM/56kU0kK8yT2t/HPeQ1YPMSXDxSzh8oici0i6pUI8yGVFIPE9sFAUaT2RAVwalTs0xeBJ9djQNdO6W1DLZOjJLHpIKh5ngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384940; c=relaxed/simple;
	bh=sN0iw09XNa32HD6vUppix+w2BkLRdmQM6OSi7enZVHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrRN1oB/DbTol4NvEsBeRAj3ca4JfOjKcM3azwp7qARwW8qd5PA+1ojkgRO49keFwyy1LgBri05KpFllR39hdlExpJ5Ms2N0BWeT/CUybJh+ACLUoCviJOwo9yI78DesePbyTTo/KoQwPfBo9bge6pYr5x8h3xF8uWNlZxn7kLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=PSccTpou; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="PSccTpou"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4235F11C81B;
	Sat, 22 Aug 2026 09:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787384932;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XviFG8sDQ7+lvUoVjqxltW2yCT0wFNF6qXQo7VooJMo=;
	b=PSccTpouFtFJFKkzAnp60JcxIUWQFk0oWnf0QdHeV5AKzoK6YndUJy1g0TlNCNxkXOC6Pc
	WbjV4mgWlc3MpenrSMPCKfRxoG3rWrRutSb974IdHtMDugySgvo8IZwXtfVE8Z92MIFwHS
	CgPQGxMfClzuJ12fV1vBvKPixQ4Pnwy7Exk4rHhI1icl/6o7eziN47DOfzUOYOsVhyIq4n
	FjpeHbl3hdLP2YcPTWd+Ev318wSzohJjPJ90ZuE6u4/4RuRrFwjitDNLvFzWTMBAmDj6wc
	EKN7FPwAUX+Q6GbqC8v3vArfevm2czWIxM4/u3OPjaxf3lHyUDZ0M8XUC8drQA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Pankaj Dev <pankaj.dev@st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
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
Subject: [PATCH v3 5/9] dt-bindings: usb: dwc3: Document ST STM32MP2 DWC3 xHCI USB controller
Date: Sat, 22 Aug 2026 09:46:38 +0200
Message-ID: <20260822074816.548662-6-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260822074816.548662-1-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The ST STM32MP2 SoC contains single instance of DWC3 USB controller with
glue logic wrapper around it controlled by syscon. Document the glue
logic and DWC3 controller.

Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Co-developed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
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
V2: Fix up Sob/Cdb lines
V3: - Document maximum-speed
    - Switch resets to maxItems: 1
    - Drop label from example
    - Use generic over-current-active-low
    - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
---
 .../bindings/usb/st,stm32mp25-dwc3.yaml       | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
new file mode 100644
index 0000000000000..96bd557327252
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/st,stm32mp25-dwc3.yaml
@@ -0,0 +1,97 @@
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
+allOf:
+  - $ref: snps,dwc3-common.yaml#
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
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  over-current-active-low:
+    type: boolean
+    description: Over-Current signal polarity is active-low
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
+    usb@48300000 {
+        compatible = "st,stm32mp25-dwc3";
+        reg = <0x48300000 0x100000>;
+        clocks = <&rcc CK_KER_USB2PHY2>, <&rcc CK_BUS_USB3DR>, <&rcc CK_KER_USB2PHY2>;
+        clock-names = "ref", "bus_early", "suspend";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb2_phy>, <&usb3_phy>;
+        phy-names = "usb2-phy", "usb3-phy";
+        resets = <&rcc USB3DR_R>;
+        over-current-active-low;
+        st,syscfg = <&syscfg 0x4800>;
+        st,vbusen-active-low;
+    };
-- 
2.53.0

