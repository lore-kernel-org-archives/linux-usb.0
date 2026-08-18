Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260EF36729A
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063378; cv=none; b=T56hoIMBr0n8yFpz0D2gfvAYg6Xf3siiMnpvd6466yY0sc99dPu6B4k1/yKKHG4W4UnDlamjTw+ClGmBQLW5j2qwz6NhMR5LIfVh/Jlpm/RKWhGRpJAmVbUs2tBhN7B9x8IorzBr1IE8aQQ609wP3XcFV/MMk8VQZaLhgnLpkUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063378; c=relaxed/simple;
	bh=GN8OC0qmWePc65/nVwGP+m4XJ9TN93CBwZAGUXRbCQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFW/hP4262ViCw0m+buPfD9+Y9QHMywzDfXs5YtYMeGnxVobjr5mVMhl45ALuHkj6F7jFKhIkjH6gw2LfNowMw42TnLpsCYIqOA1wBqAMHiPCaYLvX77QKfIRWKfgCLo7udbCseXnCvYbTf0/ovqRU6+nWOX1gsY+xRwOCsRkvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5PqPSVL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5PqPSVL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccae46de39so7292285ad.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063375; x=1787668175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwa35nuSoG/2eGYsft3L6cCp2RsoUxnaTuzWFFhRxOA=;
        b=k5PqPSVLyyYH1xsLakWQzA4rWS4P8582oVCP/+2auRdnIjLAJxPiz5pffEM+sY+Mof
         l9cTf6RUPK5qHHfLPIofWG64HJo8IuNy6Ex5R1trMgBUi+mgG/eDe+0Yhcv1JqRz2JuT
         pGKbHvW7CP6RQwK76uHIzWI8IY2oQpYAZcBNaE38MGID+88+vaSx0nUq7YV0Xtx3g42X
         T7U3ARwcSdvzCXoI/solBUuubKhp3KXqLLp5fdZxoAoG0MmkzzssvlDQs+1ONTEiQWMQ
         43l8aaW4q4lQUKfiVJNXOP5w9CIDarxDyaMWdrj8PRVi69plaLHk1Pf2dizsam043u7x
         Ol/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063375; x=1787668175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwa35nuSoG/2eGYsft3L6cCp2RsoUxnaTuzWFFhRxOA=;
        b=Y8LEqcNTKQ11BW6fV8YE2dbJEoyu55s/V1o3sjVyC7ecFbQaUDjDLliw8d4ZZYwPLj
         A9l9reFTrXL9LPaNeCB9v6CSFd45clPmv7e/SwxXj8bKI5bJQZfViilrMSdGuoDwR8TR
         YKhEII57at6SjcGNJOdDqzP6hQuuoJweGymf4hcuZBc9395uZYMZxwYxeN9x6pG+62yc
         jUpM6pETtUoKbtwegAstcR+n/41UqPvXRo5KOgJONQbTngKUz+deSrJk6fkwDiYnWaKD
         iIdFvk/ZUEg/E7hNk0Xl8dzS1zE6iF1VGc903VS/yIYqRfKb+dxayhgD65jOvff9pTXp
         eufg==
X-Forwarded-Encrypted: i=1; AHgh+Rqg3RtZXePwsQSPgpov/pWxTgyhqY2cuK3mTLD6n3S5qt088WHDUUGfjTQH+OfAOwRZHOcLLQN0WHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz377MaiZDIsv8KtTgchFUl9HxDfwocNqbU46qImlPXE0ihMt2u
	6wcUyHbU34xbbUIlwUt8trIYSY7iL8/tc3xAymTS+Vfm9p16NTqa/D/P
X-Gm-Gg: AR+sD11YzpeJnm46hRgIJfoVGfRlmjtqhwWApM/ieWbHSEf0kRvDxYrSw1K7sbRXbs/
	eeq8NSNLbGgUAufXAmk1ahp7edgGsIaNwr6pBt1irqF88CpMeDguanWw3YFGJsGQRYMS+OLpP+5
	nwOFp46mysP0eAFSLGLJfYAyP6uglS3Tb3+/8jqJJrqamwONcWv2RhNI8E4o+T42gYCJdH+aFOe
	Q5qR6Ia3dhbH3BugWj3MKHa2KUOtwkxBJgwQB7MBkiEF0FFSVm22K4AHMVP3/fpzN2tBExvFtSV
	3cy73tblb4DUnlctiM0GuWlIQk6OTswukpNCjhwPiZ8vN/LHKy4Zv0I6K5AvTlaI13MKr9Xs6qq
	KLLGr4sAt25WFFOisyJEGDdWdHZWXEOXpjYY6k/QCB0/qSPQH61HaMtC107rBctzCrVc4u+r/ck
	aMPnEFiEU77TAjId6o6apUpaCFA19we3O8Rg6aDujqaUOjEypsIR/i8ukjxDP5Q3Z74GeUmJt4
X-Received: by 2002:a17:903:4585:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d3b0cd96a6mr307749475ad.4.1787063374733;
        Tue, 18 Aug 2026 07:29:34 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:29:34 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:43 +0530
Subject: [PATCH v2 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-ti-am33-usb-v2-1-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=5446;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=GN8OC0qmWePc65/nVwGP+m4XJ9TN93CBwZAGUXRbCQA=;
 b=/ICcEratZ3o2rpqEdLfMo+aQDlLKJjcSt5vgcEdD+6hRQzXd+n584IbHXRbjb3nvO6Zd16Afc
 gyQClNz1JY3AIE+fwrKHNSLQmXV0KSnbXKrPyKXfsHd7uaHpIO+dQOx
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert TI CPPI 4.1 DMA controller text bindings to DT schema. Add
ti,am3359-cppi41 and ti,da830-cppi41 into single schema since they share
the same hardware IP block and driver. Add undocumented #dma-requests
and power-domains properties to match existing DTS usage.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 109 +++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  14 ---
 .../devicetree/bindings/usb/da8xx-usb.txt          |  12 ---
 3 files changed, 109 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
new file mode 100644
index 000000000000..a8c28e8ada07
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,cppi41.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,cppi41.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI CPPI41 DMA Controller
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - ti,am3359-cppi41
+      - ti,da830-cppi41
+
+  reg:
+    minItems: 3
+    maxItems: 4
+
+  reg-names:
+    minItems: 3
+    maxItems: 4
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: glue
+
+  "#dma-cells":
+    const: 2
+
+  dma-channels:
+    description: Number of DMA channels supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  dma-requests:
+    description: Number of DMA requests supported.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  power-domains:
+    maxItems: 1
+
+  "#dma-channels":
+    description: Deprecated, use dma-channels instead.
+    deprecated: true
+
+  "#dma-requests":
+    description: Deprecated, use dma-requests instead.
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+  - dma-channels
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am3359-cppi41
+    then:
+      properties:
+        reg:
+          minItems: 4
+        reg-names:
+          items:
+            - const: glue
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+        power-domains: false
+      required:
+        - interrupt-names
+        - interrupts
+        - dma-requests
+    else:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: controller
+            - const: scheduler
+            - const: queuemgr
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    dma-controller@7402000 {
+        compatible = "ti,am3359-cppi41";
+        reg = <0x47400000 0x1000>,
+              <0x47402000 0x1000>,
+              <0x47403000 0x1000>,
+              <0x47404000 0x4000>;
+        reg-names = "glue", "controller", "scheduler", "queuemgr";
+        interrupts = <17>;
+        interrupt-names = "glue";
+        #dma-cells = <2>;
+        dma-channels = <30>;
+        dma-requests = <256>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 654ffc62d013..8431de346129 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -51,20 +51,6 @@ USB
 The controller should have an "usb" alias numbered properly in the alias
 node.
 
-DMA
-~~~
-- compatible: ti,am3359-cppi41
-- reg: offset and length of the following register spaces: USBSS, USB
-  CPPI DMA Controller, USB CPPI DMA Scheduler, USB Queue Manager
-- reg-names: glue, controller, scheduler, queuemgr
-- #dma-cells: should be set to 2. The first number represents the
-  endpoint number (0 … 14 for endpoints 1 … 15 on instance 0 and 15 … 29
-  for endpoints 1 … 15 on instance 1). The second number is 0 for RX and
-  1 for TX transfers.
-- dma-channels: should be set to 30 representing the 15 endpoints for
-  each USB instance.
-- #dma-channels: deprecated
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/da8xx-usb.txt b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
index fb2027a7d80d..00320d92d3bb 100644
--- a/Documentation/devicetree/bindings/usb/da8xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/da8xx-usb.txt
@@ -27,18 +27,6 @@ Optional properties:
 ~~~~~~~~~~~~~~~~~~~~
  - vbus-supply: Phandle to a regulator providing the USB bus power.
 
-DMA
-~~~
-- compatible: ti,da830-cppi41
-- reg: offset and length of the following register spaces: CPPI DMA Controller,
-  CPPI DMA Scheduler, Queue Manager
-- reg-names: "controller", "scheduler", "queuemgr"
-- #dma-cells: should be set to 2. The first number represents the
-  channel number (0 … 3 for endpoints 1 … 4).
-  The second number is 0 for RX and 1 for TX transfers.
-- dma-channels: should be set to 4 representing the 4 endpoints.
-- #dma-channels: deprecated
-
 Example:
 	usb_phy: usb-phy {
 		compatible = "ti,da830-usb-phy";

-- 
2.55.0

