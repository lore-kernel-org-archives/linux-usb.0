Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB639E9BD;
	Sat, 22 Aug 2026 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384950; cv=none; b=VZUmuupQWDuX1x1y+fjhWTJkkstzpvjtvNvlLjSsuWoKiUJOKUa+GuTTgwiqdaR+RLIlmsd7+DMGCbKv3lAmsIs9WDflZBl5va5lbQunzfWpEqQLhOr/27A+1h9O79nCMWZOCdO/6kHkHl/gZK792zJarqplxbMsDZ59TvoOZpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384950; c=relaxed/simple;
	bh=NhyI+ua5na85qzIlL8aZClAkOX3dGxe9l2jtX/tNPsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AE/cyggVMJOCi/OYvNrvnKasiZJwoBwzJsLgTD0Cy9ZXiPIFmOQe5PVg26U+YvdNqb0bwqeZgPsw2XBYZVvm4tsiHkZE7tcSauNub1Vo5WwW19rtG/dYFiSl8rDfftLeYnydHJiWp+WsINR451XQnXIoghfgoBdwfk3tp5nlZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NqIOF85+; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NqIOF85+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00ECF11C81E;
	Sat, 22 Aug 2026 09:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787384943; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CNOxNJatK64fS21OXHPDSi5Cq6dsZkkBqZ+h5rU+KSY=;
	b=NqIOF85+bUxXGrW7cbgMce1mZsWRA2ZoN3Lybb4lZF/EZS3A3m6OBwsnL/8c5nvewHx3mC
	nSQHlC9Nh6ons2CMccS+yjL1LvwreQIj5+yK/uhVL1DtiKsLFMWBvBvj7VNbDvI5JAiyBr
	H8EWircVL41tymdb81t44BbP2+l5ATYqV8fgY5p3ou6YO32nNeHT1dm7gWyxLlBhH5wId3
	Hf8YmHTICOBOxWV0E2m9wyBu44pMEq/O2eCBfDQicmPmlxBmpFuCPvl/6AC0TZLqp2c8RX
	9Fk55vUxs8Dse67VhKFk0sKT/NwWiPhgeJOh0iKluK9oLB/JhnOdFEiBP3A/aQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: fabrice.gasnier@foss.st.com,
	Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
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
Subject: [PATCH v3 7/9] dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
Date: Sat, 22 Aug 2026 09:46:40 +0200
Message-ID: <20260822074816.548662-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260822074816.548662-1-marex@nabladev.com>
References: <20260822074816.548662-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
PHYs would get populated by the OS.

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
V2: New patch
V3: Fix the bindings
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml   | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..4db4198c5dd7a 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -22,11 +22,12 @@ properties:
               - st,stm32mp151-pwr-mcu
               - st,stm32mp157-syscfg
               - st,stm32mp21-syscfg
-              - st,stm32mp23-syscfg
-              - st,stm32mp25-syscfg
           - const: syscon
       - items:
-          - const: st,stm32-tamp
+          - enum:
+              - st,stm32-tamp
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
           - const: syscon
           - const: simple-mfd
 
@@ -39,6 +40,17 @@ properties:
   "#clock-cells":
     const: 0
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/st,stm32-usb2phy.yaml
+
 required:
   - compatible
   - reg
@@ -57,10 +69,14 @@ allOf:
   - if:
       properties:
         compatible:
-          const: st,stm32mp25-syscfg
+          enum:
+            - st,stm32mp23-syscfg
+            - st,stm32mp25-syscfg
     then:
       required:
         - "#clock-cells"
+        - "#address-cells"
+        - "#size-cells"
 
 additionalProperties: false
 
-- 
2.53.0

