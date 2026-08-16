Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54903D47C8;
	Sun, 16 Aug 2026 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786916354; cv=none; b=MmcenetdQJta2Bbo5DtatCXemLugXDCtGmv9nrr3JxI+mkyA9xy871xSKggikNeJsJD0yD8hqlj0g8qZCGOFmoHLitFLOfiof3gvhBP3HvZkdSSuO43vdlKCuDE3Mcl7raoQRHd/7Z5ErSdNwNb0ICZHVu4B+pWx5PS+gH+tKsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786916354; c=relaxed/simple;
	bh=VNyrFLfRxk7smbrIXcGk15w2vzONaz1kQ/UFayWAlok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3ZR6EtPbSIakYljBfmeL+nZ6tTXBvWuH/Cr9TqegbDhAhwY9UV3oqcIqW5VMp2eb8xTj+tYxChe6A7dR7CWXZpLczH/PUA22EDR/Lkr9ndaD/eSgxB5/udxqCIibJKEkNhhVtyxh5chpIi9YPPeG1mQM7GquiAKH427Oi51ArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Uz6Z/DGK; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Uz6Z/DGK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31B8911C1C0;
	Sun, 16 Aug 2026 23:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916346;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=txBnKCBqQRTdt+Nk6gIA5IiW+sEtrE2NAj8RLoyHUgY=;
	b=Uz6Z/DGKUNauOOSijlWWme5Ad5ptcspXiuVTJ04N7iwc0w8BKrowKzQ5wk8wmmTfMu+7Aq
	IxYvZJAHgUXfP7VVvMrsrTBg4a6mTVADfFG8njJWYKw7BM4Q2eo9d9vT4TfS8/Mgd4Ue6d
	48bcz3wv4b5mGetXrCBvRWm69vrV8vXB+hsokEmmzbDa/PpkVOuklzClWWSaogb4fgfBdM
	m81W/OdWsVrMl+zgN+oaNQ163XDy6vWc0yF/54RoyJUNgM7hayBuAeim0PzN3z+u9USIFS
	JFiNbt9mKZy4bawsHfW7Gsx63BwtIaEJNlzeTv5oJD3eQw1m/i/Sjzb8Hbq5/Q==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
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
Subject: [PATCH v2 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO PHY
Date: Sun, 16 Aug 2026 23:37:03 +0200
Message-ID: <20260816213849.1044073-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816213849.1044073-1-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
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

Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
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
V2: - Fix up Sob/Cdb lines
    - Fix up compatible string in example
    - Use additionalProperties: false
    - Expand description:
    - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
---
 .../bindings/phy/st,stm32-usb2phy.yaml        | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
new file mode 100644
index 0000000000000..ab6c943af9a25
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
@@ -0,0 +1,73 @@
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
+  connectivity. Both PHYs are the FEMTO-PHY, but their configuration
+  bits in the system control register are different for each variant.
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
+    const: 1
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+    #include <dt-bindings/reset/st,stm32mp25-rcc.h>
+
+    usb2_phy2: usb-phy {
+        compatible = "st,stm32mp25-usb2phy1";
+        #clock-cells = <1>;
+        #phy-cells = <0>;
+        clocks = <&rcc CK_KER_USB2PHY2>;
+        resets = <&rcc USB2PHY2_R>;
+        st,syscfg = <&syscfg 0x2800>;
+        vdd33-supply = <&vdd33usb>;
+    };
-- 
2.53.0

