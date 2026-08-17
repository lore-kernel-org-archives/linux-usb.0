Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9FE3ABD90
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003355; cv=none; b=PZGb23aoAFkBmdhwzalWFlh1PewaQ02AtaT6hxbAVKnkMgumVtJj6Knm5dIqyqYhl4To04b1vzqPhuKCbsH/oQHNdUI9Sj91gNW5rLc1J+AfCVGvqRPQoXvQhvZXsvBGAbmbdQBGF+PIFo/6eXM71C8j4hX+H8A7BcSPGcMC5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003355; c=relaxed/simple;
	bh=ExC1AV2gtMJSKMPZKdYscruJxgrxKcI9UQBd1QnnFaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eALju5mUUiKBRGgbfMpnGhFqTBQhbpdnJ0g+uKE7rwcQKEGBNV+we7/KPaGzWWVya5B74Qyu+IExctjcKA2BDmNLfV4pYG+q20r2RLu+OHw1/04/tawofv63ztN35sAOABnlDsqvuvhKtM+P/mZwBxbxEIv7EHYRPz36IwODJmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqhBw97c; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqhBw97c"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so6300335ad.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003353; x=1787608153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+G9INpV1JzdGArVnG3ONEDuNklD+1EBL8YVEgjDjB8I=;
        b=ZqhBw97cBwycrHPt4BGp/tFCNLSk1t54QK8Bs/dYMyoePBoOx4NfLl95+Mojm5hVIJ
         6sGcKBDRIpIh3uAj338xiucz9cXINAGscHEyjN/zRRT/V8CPd4cD+958MXdhzI5BR1xH
         G3ZM3qzJcRUlJ6bGmHkzuWzLekH/7VUWsHoVnWuwx88h2cZy+W9zql8nhjv/BoAwg0X0
         CzSv8IHSiJQVSMiTXM3ICbyZ4q5sNum5A8bjERtjyDF3XMwXDr3Wo3Cjh1bgY0mNcPB/
         tKGBzWrL0HzOBqHWZF5N9qSqhjUi0cU3YWHixGXDTgpWZ4mbXGUVb9/BYMBbt0FIPTV+
         uwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003353; x=1787608153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+G9INpV1JzdGArVnG3ONEDuNklD+1EBL8YVEgjDjB8I=;
        b=KzTiTeyEGN9zdtCDE2OT2EqBCyGFhzTfXZi4SaJO2SAu8NhTPZQYrgXVw8Yb3kzm8N
         UF04c6zqwrn2vAuVr6UOBTDCjDrgQtU4nTyBAs147djx9qM43IYfZu/OzHswtMuMSmW3
         67RxUe5LZYsBoErjQOTE7UYdTcIrvlvL6zGVYahx3W8BlNqF4qJQAI+WZ5BpRIbRtqzI
         9MRVBhve8yDMKdo4tWV4vBXduNmEAgmUeWXSUpSUvndRwMDk7ZPM2+CLZEDJkm4lO9id
         NczZByYgSPRSzTw09DRt/VAJo0bNbQL3vpRKZXbTuKsTFbMkauutRWjAqAubxWTrzpxC
         VsCw==
X-Forwarded-Encrypted: i=1; AHgh+RqqYmX8CPJwxDbUdclGaWNsvqMXckqmiYadPjL1mviOTEyUIvspI9H+N7I7HYSbRfEJAb1KFitQ/nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlgGbStqKfu9h0+2EjE4fNet+XheUeg3B+cyqol5MwRpgFyFE+
	DEW6SwDvnXSna3072nJJ6NraEDAb4SwVqLjO5fCeWQq87hyKieNqRYWVlo/P0g==
X-Gm-Gg: AR+sD10phRR8r+V2dBC/Lnne88NBBXaakyKZNDP+R/4OaYhCX59Nx9Ozz1nWubi8oci
	/b2o2K+n1yL82Mqbpx98QCYKZp8bNmC5OPl2lqAWfPMUfKdC8Isn08015XIvb6Ku2H3D8/Z7vCy
	OrPQstaaovEBZC/Ej0UyItecscCIaQ3ZQDVWA0vEmcSl1AvxcHnvcZrIfc6rqOHqB86D7cavQSo
	u2ebYjGQhe6a3MHwSyB2W8gElhWU7nKN7sgjnGSHcvQlfWirjLvEgSd/++NJ3CicbWQtRBm3SXX
	1pks1eF1coa+j338jBCovI8YZzEFdMs5bdNxXkc+tXGMzr+4iexla8yQFbAbq24HjjN8reQyrYT
	4x/Kpg3rBrLAnhn6k/gN2qvry+qAFVfdLxUukVuVvex+eiWwukuJnKdCs5fDp4VEP5TIk7AZv/G
	RyxXtJFuL52JshRcTVQAdZ1hS/og/VM9F1dJ6O5zwidpg31YOZzIQh4HixNmcUrKshlJL2cut15
	Q==
X-Received: by 2002:a17:903:3c63:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d3b0c57980mr238021985ad.2.1787003353382;
        Mon, 17 Aug 2026 14:49:13 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:49:12 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:37 +0530
Subject: [PATCH 7/7] dt-bindings: usb: ti,da830-musb: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v1-7-69ac5f92df45@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=5185;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=ExC1AV2gtMJSKMPZKdYscruJxgrxKcI9UQBd1QnnFaU=;
 b=dvxbJeNDLdyKd/EJ2RV/+vW65rTnYEZRoC6Gt3kFS8z0n5v2jRb/XcN7QbSIiuPH76dQg8Jye
 zcSsXDJ9eLQAckmZ3hoo9GrU6sXfETKNCd2APr5gbEs1CQ6N3X8Csys
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI DA8xx/OMAP-L1x MUSB text bindings to DT schema. Since
DA8xx MUSB node acts as a parent bus for the CPPI41 DMA controller add
required #address-cells, #size-cells, and ranges properties.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/da8xx-usb.txt          |  69 -------------
 .../devicetree/bindings/usb/ti,da830-musb.yaml     | 111 +++++++++++++++++++++
 2 files changed, 111 insertions(+), 69 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
deleted file mode 100644
index 00320d92d3bb..000000000000
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-TI DA8xx MUSB
-~~~~~~~~~~~~~
-For DA8xx/OMAP-L1x/AM17xx/AM18xx platforms.
-
-Required properties:
-~~~~~~~~~~~~~~~~~~~~
- - compatible : Should be set to "ti,da830-musb".
-
- - reg: Offset and length of the USB controller register set.
-
- - interrupts: The USB interrupt number.
-
- - interrupt-names: Should be set to "mc".
-
- - dr_mode: The USB operation mode. Should be one of "host", "peripheral" or "otg".
-
- - phys: Phandle for the PHY device
-
- - phy-names: Should be "usb-phy"
-
- - dmas: specifies the dma channels
-
- - dma-names: specifies the names of the channels. Use "rxN" for receive
-   and "txN" for transmit endpoints. N specifies the endpoint number.
-
-Optional properties:
-~~~~~~~~~~~~~~~~~~~~
- - vbus-supply: Phandle to a regulator providing the USB bus power.
-
-Example:
-	usb_phy: usb-phy {
-		compatible = "ti,da830-usb-phy";
-		#phy-cells = <0>;
-	};
-	usb0: usb@200000 {
-		compatible = "ti,da830-musb";
-		reg = <0x00200000 0x1000>;
-		ranges;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		interrupts = <58>;
-		interrupt-names = "mc";
-
-		dr_mode = "host";
-		vbus-supply = <&usb_vbus>;
-		phys = <&usb_phy 0>;
-		phy-names = "usb-phy";
-
-		dmas = <&cppi41dma 0 0 &cppi41dma 1 0
-			&cppi41dma 2 0 &cppi41dma 3 0
-			&cppi41dma 0 1 &cppi41dma 1 1
-			&cppi41dma 2 1 &cppi41dma 3 1>;
-		dma-names =
-			"rx1", "rx2", "rx3", "rx4",
-			"tx1", "tx2", "tx3", "tx4";
-
-
-		cppi41dma: dma-controller@201000 {
-			compatible = "ti,da830-cppi41";
-			reg =  <0x201000 0x1000
-				0x202000 0x1000
-				0x204000 0x4000>;
-			reg-names = "controller", "scheduler", "queuemgr";
-			interrupts = <58>;
-			#dma-cells = <2>;
-			dma-channels = <4>;
-		};
-
-	};
diff --git a/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml b/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml
new file mode 100644
index 000000000000..c54bdfb4d1ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,da830-musb.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,da830-musb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI DA8xx MUSB
+
+maintainers:
+  - Sergei Shtylyov <sshtylyov@ru.mvista.com>
+
+allOf:
+  - $ref: /schemas/usb/usb-drd.yaml#
+
+properties:
+  compatible:
+    const: ti,da830-musb
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mc
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb-phy
+
+  dmas:
+    minItems: 1
+    maxItems: 8
+
+  dma-names:
+    minItems: 1
+    maxItems: 8
+
+  vbus-supply:
+    description: Phandle to a regulator providing the USB bus power.
+
+  clocks:
+    maxItems: 1
+
+  clock-ranges: true
+
+  ranges: true
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^dma-controller@[0-9a-f]+$":
+    $ref: /schemas/dma/ti/ti,cppi41.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - phys
+  - phy-names
+  - ranges
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@200000 {
+        compatible = "ti,da830-musb";
+        reg = <0x00200000 0x1000>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        interrupts = <58>;
+        interrupt-names = "mc";
+
+        dr_mode = "host";
+        vbus-supply = <&usb_vbus>;
+        phys = <&usb_phy 0>;
+        phy-names = "usb-phy";
+
+        clocks = <&psc1 1>;
+        clock-ranges;
+
+        dmas = <&cppi41dma 0 0>, <&cppi41dma 1 0>,
+               <&cppi41dma 2 0>, <&cppi41dma 3 0>,
+               <&cppi41dma 0 1>, <&cppi41dma 1 1>,
+               <&cppi41dma 2 1>, <&cppi41dma 3 1>;
+        dma-names = "rx1", "rx2", "rx3", "rx4",
+                    "tx1", "tx2", "tx3", "tx4";
+
+        dma-controller@201000 {
+            compatible = "ti,da830-cppi41";
+            reg = <0x201000 0x1000>,
+                  <0x202000 0x1000>,
+                  <0x204000 0x4000>;
+            reg-names = "controller", "scheduler", "queuemgr";
+            interrupts = <58>;
+            #dma-cells = <2>;
+            dma-channels = <4>;
+        };
+    };

-- 
2.55.0

