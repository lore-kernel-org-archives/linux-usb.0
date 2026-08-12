Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A7519CC0F;
	Wed, 12 Aug 2026 01:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786496563; cv=none; b=CNFVzOSZv1XuWC/5XkZzR4KEmHgjslSGzypzx5CGKGJEADJbD7az3v1eOVWriTS1AOb9jkrtJhGYSw/PAJVVMO45N06TjoUsbWWNuxANJQPtVlxJa/boMxuLSECkmdHW6JIWiz/shCJqElL/4P4IP71NDzI/3Wy2oHubpUUfXS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786496563; c=relaxed/simple;
	bh=pfUsyoLoHAX8g8NNT9OCZLozcs6hQaR9JvPwdpfxa98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vbc2blTQtGUGlHi+jBTVaQolCz+s+vfwtsJOcPCb0/j/g/vJ3CZn4c7loPQcrWeScTbqaoyK/kcIFWOo1mNKUGpCP9mZzT/LmlbyVImI+5WGNcoobCe6eUt2gbSzI53e7kCs4qt2mqlr2c9KqL9EieUwYfjneiJGJTusLSdyjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=H1EsvCaa; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="H1EsvCaa"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B341D11A0F7;
	Wed, 12 Aug 2026 03:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786496554;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=abWDjsJ7MsHebe5ntsIcqA1aci2Halsj83iswXsJtc4=;
	b=H1EsvCaaoRHgFznR+XCmsmsslT45Kre7HxxJyi6Y8Oq/4ZSuY4dgAKmCk0hoXaXQUJLS8X
	YYoB0bsgP1F8zuELGXr4LjXk9Rx40DYwGAN+GgLT0J4DmWFECTiOsuMIyTiM2mq5shYrm0
	zLNuzMRJ4ZlH8BD9LTm3G7JGPXyqrkMArBh/d6O1G9r4MxzFOmEon0As/sdOh41Xm0DzXg
	TELgugOCTWQQxpx2mLdCPCihv2CkePJ0lci/wEFy/CeMKJBMhvRBAdzdL+9Pq0n37W2LtG
	KXYTL/s4+NwLqyLj806PXfW1YvuaABIMDgaex8n/Bf9CzYvy1c1Fk/r3YVVMMQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
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
Subject: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
Date: Wed, 12 Aug 2026 02:55:41 +0200
Message-ID: <20260812010157.1772849-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812010157.1772849-1-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Pankaj Dev <pankaj.dev@st.com>

Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
Two such PHYs in total are present in STM32MP25 SoC, they both are
slightly different, therefore they use different compatible string
to discern them.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
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
 .../bindings/phy/st,stm32-usb2phy.yaml        | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
new file mode 100644
index 0000000000000..ca9fc3b87383c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/st,stm32-usb2phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 MPU High-Speed USB PHY
+
+description:
+  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
+  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
+  connectivity.
+
+maintainers:
+  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
+  - Marek Vasut <marex@nabladev.com>
+  - Pankaj Dev <pankaj.dev@st.com>
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp25-usb2phy1
+      - st,stm32mp25-usb2phy2
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  vdd33-supply:
+    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
+
+  st,syscfg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandle to system configuration controller.
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: USB2PHY control offset within syscfg
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#clock-cells"
+  - "#phy-cells"
+  - clocks
+  - resets
+  - st,syscfg
+  - vdd33-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    usb2_phy2: usb-phy {
+        compatible = "st,stm32mp25-usb2phy";
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+        clocks = <&rcc CK_KER_USB2PHY2>;
+        resets = <&rcc USB2PHY2_R>;
+        st,syscfg = <&syscfg 0x2800>;
+        vdd33-supply = <&vdd33usb>;
+    };
-- 
2.53.0

