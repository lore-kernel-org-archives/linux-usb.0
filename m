Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBCD72621;
	Tue, 28 Jul 2026 01:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201432; cv=none; b=LcbX6C1RAiQu7m3I6HnyASXD7P4gTIUOTQWOk/7MmQFj02ChbczvHuu4K5hCBI69SCLLrDy4Yw7f3hmIQC/f8bX9xN/Hm2jIHoKWLHzwsYsWwGKa/dUutjQIUFmHrWRMHL3TEQe+nFZGGjnjpjXPrH+dzmslTqOTKwUN0JRUPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201432; c=relaxed/simple;
	bh=v/mUmOU+HY69AjTuNDV03iMyJqr5mZ3bTeOUS6/4vzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WNtmrN4+M2Hi0mW5dltg3Of3QK/n5zqB9FwF1oL8r63RHotgZdowondQMA6ZVNw1STnZnlos3pe6NuQz2HanyapKdHo/F84go7j8imRgvdOVqC5pK/6wnBsKtnxKv140Pc/vxoVTAOZs1uP8zkiQM/FSQjArhWzRQ0MTrF9JVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FziW/z8w; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l9Op8jxa; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FziW/z8w";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l9Op8jxa"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4h8Hcf31L1zMlJ8;
	Tue, 28 Jul 2026 03:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dtik4JvPxTZDeHivd+wa3zDBGw7+is8/aXM+fbU4iXY=;
	b=FziW/z8wJ2rpWxW/e2fC6+UEpfdOpRXWLXLQvv3pNalE8kcBRiHovbyzmM+gegpiycXgmg
	a3dUjcGDlCQ30RJGcPcir/j+ekbUfwjMXGDd+8WEcIYp2PDfUQIfemLKkf/oGczZbVJ2bn
	iyUTWN8VKt7x/DXp6Z5YcQQ09iS8DcmkTMSVX4UY4kjVgW9dCHme/b4EYbZ4An6NZdmZbg
	2JqydyKWewmapKHcDo2neuMuC8ObmRHbRa7AZ/uVd2i5Q9xTZYDl2UOTWfW4gBr3d4kCcm
	Uj/QJIp2mTH2O3XkFfKoW5XF2Nf1vNtZBJKI5IAQPNbrYxQtKEMWGx4o7KGNog==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=l9Op8jxa;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785201424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dtik4JvPxTZDeHivd+wa3zDBGw7+is8/aXM+fbU4iXY=;
	b=l9Op8jxaqvYzoVyIa4wTHyJHr/TunyRgtOjdzepjrOQ/ZmTbFq7DfS66askuMWW0bllLPb
	mky2nI5euHqEMaLtTsNxk8jzs9iv9vrt8N/VKWvdVgB3BBJLrnyF1Nv0K1HbX+fdR1gKmj
	KwWIeiHUKiu4ZBC/e3i5phVA9YmNTx9SV4sdvSyR+2hMbN8ataxXTlfqZBBcOJAkQCkqNy
	xn+fpKVYkiNm0MClvU2RfI0OfnnXvUO8T9iDHd+AvIA6I5bzPHb4aanJYJ+TyOOXIMTfNI
	IufcxrXz64mZbLC7d78MstQqRLEhzmDqj4BbBPr030yGSAE3dmIbxnvTRZF9qw==
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
Subject: [PATCH v1 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car Gen5 DWC3 xHCI USB controller
Date: Tue, 28 Jul 2026 03:14:58 +0200
Message-ID: <20260728011656.465040-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3fzedjwk5mpn3dr5anqkii4jyofpmynr
X-MBO-RS-ID: 1c87bb2ee30355f9efd
X-Rspamd-Queue-Id: 4h8Hcf31L1zMlJ8

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
 .../bindings/usb/renesas,rcar-gen5-usb.yaml   | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.yaml

diff --git a/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.yaml b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.yaml
new file mode 100644
index 0000000000000..a334648e2dfc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/renesas,rcar-gen5-usb.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/renesas,rcar-gen5-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen5 DWC3 xHCI USB controller
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r8a78000-usb
+      - const: renesas,rcar-gen5-usb
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '^usb@':
+    $ref: snps,dwc3.yaml#
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - reg
+  - clocks
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@c9c54000 {
+            compatible = "renesas,r8a78000-usb", "renesas,rcar-gen5-usb";
+            reg = <0 0xc9c54000 0 0x2000>;
+            clocks = <&scmi_clk 336>;
+            power-domains = <&scmi_devpd 16>;
+            resets = <&scmi_reset 336>;
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges = <0x0 0xc8800000 0x0 0xc8800000 0x0 0x100000>;
+
+            usb@c8800000 {
+                compatible = "synopsys,dwc3";
+                reg = <0x0 0xc8800000 0x0 0x100000>;
+                interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>;
+                maximum-speed = "super-speed-plus";
+                phys = <&mp_phy 2>;
+                phy-names = "usb3-phy";
+            };
+        };
+    };
-- 
2.53.0

