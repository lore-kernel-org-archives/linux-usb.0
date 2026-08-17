Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5253AAF46
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 21:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003337; cv=none; b=ilR+zNXkmit76t1kfSCPIxmesIX5ZzXfJc4z+OcLEW+Dh+gQWkbeNa0wryVQRaBMJc6kOdPXwhPxeaDOTwL+sj4NMywH924lshnhFlPu+u6KEA0rleoOyJg6Oe4Q3/lM3YnPc+l0t8ge5/F9n238GRr9I0iFG+LE2g6pxj4tsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003337; c=relaxed/simple;
	bh=8ygvMeF+3O8uhIhB8UB6BKygoL2sxNxbOwADUXdeJls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfdQLHjz7RUG8wxyXOf8czlHt1wckcZ3WaQlJb+RY7QFEsR3hyyOaqbESL7CbjxMaD2IotOw46TFcFaR+PJhWhFO4V1R5dzvoR8SoCVjDrL4bPebihl34NPyY8coIosNZuWVbpfHXNjIMPvqWfJq21h7Bkf/Pt4ZGX08ZhGapVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0agsOKN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0agsOKN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so6300185ad.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 14:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003335; x=1787608135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJUqBqwNww+cNPdm/k+W3Mklc25xZdk2EgNixbpYm1s=;
        b=m0agsOKN2z8D7w26VlDiCqsP8cXrQSEBGA6RCd5Ii+W9h93ylpvefR8jRXsE7YXm8O
         UJ0pXFtZY4ib2f+mlh0sXxT9f+elT+mWVRDEwRJBuv3rrvjCsavLvj9U/mFgiEUbKooe
         asetBEZlm/PImkRrqXIOL6j74Q+TzDRoplv4N2cTtjTR+I75EP9PjWlo5FvZ5IFTlz/8
         o9lZY/Kz5S1ZVnzacVfJcf84N4EV7lJGkAz43Btzd5EHiL4EZvFhUWHlh9CmvK3CJEXN
         au0lGSGI+ylp2GfIajN44W7/2J+dultEerJIKAUnu4PMoei9mGZJZva8tyoGu8QgTRCD
         8kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003335; x=1787608135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJUqBqwNww+cNPdm/k+W3Mklc25xZdk2EgNixbpYm1s=;
        b=bfmXNLGFdTykjoIjMqK8IqtZWtYS9EKo+DT2VGnYkfd632//d+WhgVYmMEkCdgsUIM
         eHoGmzscEcvZH8la5+IeuWE5orMDx03NKXprCqGTJlRxh7o6E9a+iXcJ5RZpI0S3/k2s
         bP+I2xKjy9qF4ptVlQJriGnrVAhu65pkgYb1frtLg/s+WOoDUwHv1QsAk8WphieMBslE
         201vPJwYUXipdLTtH7dHsihKI1rAdY3sV0l/nzRUsuZsM9uX/4ylRwsTMgGteuUo8/D/
         rA4GagYVwKfi+VBBbn29/kH92zRiKoKdHDnQA8XtFHVVTPid5svNIHt7xD3BEjGUuB/w
         RoHg==
X-Forwarded-Encrypted: i=1; AHgh+RrvOE4SH+uOPn8SvwUPgzmLewZg3V6ubL0iQfWgqIOg2y11vPTrWA3TwLMhhg0DomZ7jaspysY4qBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxwBJ96NsUJZ5zoMhH6G8RVM+BnBCXTvRmV90SJfMwpZRTPqN+
	xExQVm8o7M9tdGALGIsc8VWirh+M+pt7rBFjHrvdXTuv25eQYv2IyHGD2YOItA==
X-Gm-Gg: AR+sD132PIXvbkguJ+9Os77gQQYVQk+NqHq2PWwhJ9rwm2eIIPkqDke0x6zfauVjRqt
	8q1l2P8ZL/N289tmPNWgkDfDP8It0upEr9Zo3TEW2sei8RV2zr9pS9g7HuYn6lw8MwMjfMaxKl6
	uoSnhHOZikpRONe67S5ujwb0OfkX2X6KEyHjOdK2fluhfkoWcS6TTygkREcBLuh1AsC1XAa4HPp
	nLoLaEUSuNFI9cMOo4a/+eVNdxeLe9pM1qx4Yd3//pR7BXkOR14f6T6LAUvzl+yN4wx5zjG6Ony
	Aq7ADkLymsXHFP2l2IYxLpBE0oCq5h1zCeheBDUlUvT6XxUyBxJCxwPzxHJ7vo1HD8puWCjtc64
	MXrL1hy97uAi1JizlntM1ehiZuUfgUFdUDKmjiKs7OYbLzgCkRFaTkAAqylOGhDB9Zh3wHV3Lh5
	Ie5fQnRqJ4vGayyw8O/aazDyj2/8VmKhoP8V/kVVYMOoF+0a6Y7RDaSzPYHbE74Bvxk+Zsp/sgG
	g==
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d3b0827041mr219590225ad.1.1787003334823;
        Mon, 17 Aug 2026 14:48:54 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:48:54 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:36 +0530
Subject: [PATCH 6/7] dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v1-6-69ac5f92df45@gmail.com>
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=8171;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=8ygvMeF+3O8uhIhB8UB6BKygoL2sxNxbOwADUXdeJls=;
 b=8PbDMJasSBTfz/MUotDUBjmZkSTB3fcCMWl6BkQWZ/QIt55DHgc67B4wLsSwS+KgWr9MLtlIc
 /h56jj0wVrFAbcLLbKfLxyBiI1Y2M2KN8Qyof3Xs2KvU4oulfNikORh
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM33xx USB Wrapper text binding to DT schema.
Changes during conversion:
- Drop the USB control module from child nodes, as it physically resides
  within the System Control Module address space, not the USB wrapper.
- Allow standard phy@[0-9a-f]+$ child node names alongside the legacy
  usb-phy@[0-9a-f]+$.
- Mark the legacy ti,hwmods property as deprecated.
- Document required #address-cells, #size-cells, and ranges property
  missing from text binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         | 143 ---------------------
 .../devicetree/bindings/usb/ti,am33xx-usb.yaml     | 104 +++++++++++++++
 2 files changed, 104 insertions(+), 143 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
deleted file mode 100644
index 94312ad8ec8c..000000000000
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ /dev/null
@@ -1,143 +0,0 @@
-  AM33xx MUSB
-~~~~~~~~~~~~~~~
-- compatible: ti,am33xx-usb
-- reg: offset and length of the usbss register sets
-- ti,hwmods : must be "usb_otg_hs"
-
-The glue layer contains multiple child nodes. It is required to have
-at least a control module node, USB node and a PHY node. The second USB
-node and its PHY node are optional. The DMA node is also optional.
-
-Example:
-~~~~~~~~
-The following example contains all the nodes as used on am335x-evm:
-
-aliases {
-	usb0 = &usb0;
-	usb1 = &usb1;
-	phy0 = &usb0_phy;
-	phy1 = &usb1_phy;
-};
-
-usb: usb@47400000 {
-	compatible = "ti,am33xx-usb";
-	reg = <0x47400000 0x1000>;
-	ranges;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ti,hwmods = "usb_otg_hs";
-
-	ctrl_mod: control@44e10000 {
-		compatible = "ti,am335x-usb-ctrl-module";
-		reg = <0x44e10620 0x10
-			0x44e10648 0x4>;
-		reg-names = "phy_ctrl", "wakeup";
-	};
-
-	usb0_phy: usb-phy@47401300 {
-		compatible = "ti,am335x-usb-phy";
-		reg = <0x47401300 0x100>;
-		reg-names = "phy";
-		ti,ctrl_mod = <&ctrl_mod>;
-		#phy-cells = <0>;
-	};
-
-	usb0: usb@47401000 {
-		compatible = "ti,musb-am33xx";
-		reg = <0x47401400 0x400
-			0x47401000 0x200>;
-		reg-names = "mc", "control";
-
-		interrupts = <18>;
-		interrupt-names = "mc";
-		dr_mode = "otg"
-		mentor,multipoint = <1>;
-		mentor,num-eps = <16>;
-		mentor,ram-bits = <12>;
-		mentor,power = <500>;
-		phys = <&usb0_phy>;
-
-		dmas = <&cppi41dma  0 0 &cppi41dma  1 0
-			&cppi41dma  2 0 &cppi41dma  3 0
-			&cppi41dma  4 0 &cppi41dma  5 0
-			&cppi41dma  6 0 &cppi41dma  7 0
-			&cppi41dma  8 0 &cppi41dma  9 0
-			&cppi41dma 10 0 &cppi41dma 11 0
-			&cppi41dma 12 0 &cppi41dma 13 0
-			&cppi41dma 14 0 &cppi41dma  0 1
-			&cppi41dma  1 1 &cppi41dma  2 1
-			&cppi41dma  3 1 &cppi41dma  4 1
-			&cppi41dma  5 1 &cppi41dma  6 1
-			&cppi41dma  7 1 &cppi41dma  8 1
-			&cppi41dma  9 1 &cppi41dma 10 1
-			&cppi41dma 11 1 &cppi41dma 12 1
-			&cppi41dma 13 1 &cppi41dma 14 1>;
-		dma-names =
-			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
-			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
-			"rx14", "rx15",
-			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
-			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
-			"tx14", "tx15";
-	};
-
-	usb1_phy: usb-phy@47401b00 {
-		compatible = "ti,am335x-usb-phy";
-		reg = <0x47401b00 0x100>;
-		reg-names = "phy";
-		ti,ctrl_mod = <&ctrl_mod>;
-		#phy-cells = <0>;
-	};
-
-	usb1: usb@47401800 {
-		compatible = "ti,musb-am33xx";
-		reg = <0x47401c00 0x400
-			0x47401800 0x200>;
-		reg-names = "mc", "control";
-		interrupts = <19>;
-		interrupt-names = "mc";
-		dr_mode = "host"
-		mentor,multipoint = <1>;
-		mentor,num-eps = <16>;
-		mentor,ram-bits = <12>;
-		mentor,power = <500>;
-		phys = <&usb1_phy>;
-
-		dmas = <&cppi41dma 15 0 &cppi41dma 16 0
-			&cppi41dma 17 0 &cppi41dma 18 0
-			&cppi41dma 19 0 &cppi41dma 20 0
-			&cppi41dma 21 0 &cppi41dma 22 0
-			&cppi41dma 23 0 &cppi41dma 24 0
-			&cppi41dma 25 0 &cppi41dma 26 0
-			&cppi41dma 27 0 &cppi41dma 28 0
-			&cppi41dma 29 0 &cppi41dma 15 1
-			&cppi41dma 16 1 &cppi41dma 17 1
-			&cppi41dma 18 1 &cppi41dma 19 1
-			&cppi41dma 20 1 &cppi41dma 21 1
-			&cppi41dma 22 1 &cppi41dma 23 1
-			&cppi41dma 24 1 &cppi41dma 25 1
-			&cppi41dma 26 1 &cppi41dma 27 1
-			&cppi41dma 28 1 &cppi41dma 29 1>;
-		dma-names =
-			"rx1", "rx2", "rx3", "rx4", "rx5", "rx6", "rx7",
-			"rx8", "rx9", "rx10", "rx11", "rx12", "rx13",
-			"rx14", "rx15",
-			"tx1", "tx2", "tx3", "tx4", "tx5", "tx6", "tx7",
-			"tx8", "tx9", "tx10", "tx11", "tx12", "tx13",
-			"tx14", "tx15";
-	};
-
-	cppi41dma: dma-controller@7402000 {
-		compatible = "ti,am3359-cppi41";
-		reg =  <0x47400000 0x1000
-			0x47402000 0x1000
-			0x47403000 0x1000
-			0x47404000 0x4000>;
-		reg-names = "glue", "controller", "scheduler", "queuemgr";
-		interrupts = <17>;
-		interrupt-names = "glue";
-		#dma-cells = <2>;
-		dma-channels = <30>;
-		dma-requests = <256>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
new file mode 100644
index 000000000000..889190431c9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,am33xx-usb.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,am33xx-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx USB Wrapper
+
+description:
+  The glue layer contains multiple child nodes. It is required to have at least
+  a USB node and a PHY node. The second USB node and its PHY node are optional.
+  The DMA node is also optional.
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am33xx-usb
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ti,hwmods:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Name of the hwmod associated with the USB module.
+    const: usb_otg_hs
+    deprecated: true
+
+patternProperties:
+  "^(usb-)?phy@[0-9a-f]+$":
+    $ref: /schemas/phy/ti,am335x-usb-phy.yaml#
+
+  "^usb@[0-9a-f]+$":
+    $ref: /schemas/usb/ti,musb-am33xx.yaml#
+
+  "^dma-controller@[0-9a-f]+$":
+    $ref: /schemas/dma/ti/ti,cppi41.yaml#
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+  - ti,hwmods
+
+additionalProperties: false
+
+examples:
+  - |
+    usb@47400000 {
+        compatible = "ti,am33xx-usb";
+        reg = <0x47400000 0x1000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ti,hwmods = "usb_otg_hs";
+
+        usb-phy@47401300 {
+            compatible = "ti,am335x-usb-phy";
+            reg = <0x47401300 0x100>;
+            reg-names = "phy";
+            ti,ctrl_mod = <&ctrl_mod>;
+            #phy-cells = <0>;
+        };
+
+        usb@47401000 {
+            compatible = "ti,musb-am33xx";
+            reg = <0x47401400 0x400>,
+                  <0x47401000 0x200>;
+            reg-names = "mc", "control";
+            interrupts = <18>;
+            interrupt-names = "mc";
+            dr_mode = "otg";
+            mentor,multipoint = <1>;
+            mentor,num-eps = <16>;
+            mentor,ram-bits = <12>;
+            mentor,power = <500>;
+            phys = <&usb0_phy>;
+        };
+
+        dma-controller@7402000 {
+            compatible = "ti,am3359-cppi41";
+            reg = <0x47400000 0x1000>,
+                  <0x47402000 0x1000>,
+                  <0x47403000 0x1000>,
+                  <0x47404000 0x4000>;
+            reg-names = "glue", "controller", "scheduler", "queuemgr";
+            interrupts = <17>;
+            interrupt-names = "glue";
+            #dma-cells = <2>;
+            dma-channels = <30>;
+            dma-requests = <256>;
+        };
+    };

-- 
2.55.0

