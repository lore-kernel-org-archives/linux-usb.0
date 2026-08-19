Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C9389E07;
	Wed, 19 Aug 2026 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787115682; cv=none; b=oJ4uQcuCGq95YykrlJLRrIPpuBveRYNDOcDcpPTK5Y8D8QVAiuP0eJ5ZLZwrEYACaQB50B2KKMOOTL+XWW/bkEFbHOE+Ajk3BVA0gypYi/Qaps4tPO46sYXize5myeyEK/AJhA8D5tt0CAKROaHh95jJTl35IjbYKYUJ0AUiXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787115682; c=relaxed/simple;
	bh=6KMH5OhfrX7SFeNzd26K+AdF6JOU3HeAkmaXUMdqljw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hb0M7dlT9b6nLrg+l2kAU//h6jC+iq3CfOOikgxfgMHaFg6MCCNuZfBk/n1tCe6jfSSLyIHOZhTW9B72NbQu4RHg3PdrMmDUeXCLeOn5KFPsvFy3UHOUj1yBdsxuTkTwt9KGC9/dXymxtQMRHZPf5n/nM5XaE1z8I7cHjWUCVIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TfAEYsty; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m3XtIsnq; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TfAEYsty";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m3XtIsnq"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hPvY91rKCzMlH3;
	Wed, 19 Aug 2026 07:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787115677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kRDfDVCadi2L3uSfBeeR1zj3BzLKfkzJTUwD2VmS9XY=;
	b=TfAEYstyI1Yu6hCDop7bLADOkg2uVUrzr3pkuuJ6EiHmoK9kHWOW/gAAv/uflyjZjYe0eX
	JbXrvTcaU3tKQL3KETi1IevJf4xiFEsMs9095tZ/f+fNhLF+BwTM0BoqmO6EPFXAixtdj8
	EFVVo3sVUxvoNODEd4La6odGx+SKlNCUuxoFzd5oB5eQ/wGfsgqsHTe9G4BLwjejdZPWEv
	HauxyTF9KfgXM46iCqOX7ErOoCMIKN0lffanUay0IsADFEontgoza3QEv+XY3hqtcbB358
	0+o/hqkCfP1NUzpOrj+bd76SOSUwct890b+HWu8ab/63YDAqjqR3jQLBvl1hBw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787115675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kRDfDVCadi2L3uSfBeeR1zj3BzLKfkzJTUwD2VmS9XY=;
	b=m3XtIsnqt63Pky0hhU/zxAgSZp8aKDVYl02/UDKqvL3DUUTSYm7c/jnA24mQDIGxFWaUAg
	hdZdqD8x25tAHqXMLT65kK/erXDU9VUw95fupfgn0w/4/QoCcdLruO7zUTVikswCpURqrK
	ck5InbRIT3Tl3xrRUzDo/C9TD/BxpLDDxToADB5HFBLdiWqKEl/kzT5+yFLo5bPYpfAgDu
	2kZdn7q94tTWUuhp5OM9hnqqitjPLw1GLB5O9oY+Zpa/CGsclfw0Po6L/QF1dNbu2NEj8W
	WlxhvLrbsRxjypBDxbq05QK5/qneuxt5xttbtmFMeDBp7DQOyQWI2NQIMkouwA==
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Wed, 19 Aug 2026 07:00:51 +0200
Message-ID: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: pdmorfqfqgighkoep6ca5adomi6z518s
X-MBO-RS-ID: 8c46f315e8c66b61092

The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
controller with glue logic wrapper around them. Document the glue
logic and DWC3 controller.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
V2: Rework to use flat bindings for generic plat driver
V3: - Support one or two PHYs to correctly describe the hardware
    - Make maximum-speed optional
V4: - Use ref: snps,dwc3-common.yaml and drop generic dr_mode/maximum-speed/phys/phy-names
    - Switch to unevaluatedProperties: false
---
 .../bindings/usb/renesas,rcar-gen5-dwc3.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
new file mode 100644
index 0000000000000..a8a2f2d18cefc
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-dwc3.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen5 DWC3 xHCI USB controller
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a78000-dwc3
+      - const: renesas,rcar-gen5-dwc3
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: dwc3
+      - const: glue
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - interrupts
+  - phys
+  - phy-names
+  - power-domains
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@c8800000 {
+        compatible = "renesas,r8a78000-dwc3", "renesas,rcar-gen5-dwc3";
+        reg = <0xc8800000 0x100000>, <0xc9c54000 0x2000>;
+        reg-names = "dwc3", "glue";
+        clocks = <&scmi_clk 336>;
+        interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+        phys = <&usb30_phy>, <&mp_phy 2>;
+        phy-names = "usb2-phy", "usb3-phy";
+        power-domains = <&scmi_devpd 16>;
+        resets = <&scmi_reset 336>;
+    };
-- 
2.53.0

