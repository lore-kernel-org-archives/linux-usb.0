Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1A62F84F
	for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 21:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236824; cv=none; b=bP4zzmOICqkCIx5zBU+E+x9siynRBbKULTP8JRg0rwf7Qs5RtHCI/BdVMxGNqIHiwPrJhYdgfppPyJeJq/xPQ7YALdHj27CGTbmQj7IlvrcyjM/Gj75oizvSfde2ZKv3PbIhbZmWDHVo3w/z41rReNSmszWtTsGn86khjvg2sm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236824; c=relaxed/simple;
	bh=RYGzYHmoPYPQK6Hy7hBwQW7eu8rfoCMiS7Di340bX7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pXWny6DJezAyVZ8d70jM70UWPSh+EO4BJvnHE6cSKZHNAdGTOnHMwOPGWTDwGjOUiZxbDl6r0yb8w7HbwzmAFNSupPhYxJXngKpjdXfCaMAooIuGdciilJS/yTjZqdQuIMpXtCgFO94W57c6C7DKT+dhtWaZyb2xieiFJambbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2lGR6w6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2lGR6w6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so1034470a91.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2026 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236823; x=1784841623; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QvFKRW2nnvB9OoV58oa050FX4fPgYHjASvEu2QYklDg=;
        b=P2lGR6w6qrTeqFIaqtSZ+6L5cMuXYeknyh0WzSl99ydnANSiGenx/EAaIbST/14fF/
         HoG8X9uUKLRZzLR9YVaZNbJf+w2BnzrTSHIeAbaQGg0OzH+Nz3q4Qtk0TC6vLEbJMG2E
         yld1VQRrH5nZb+etinXBxhrzJSQFpbIJ1HdfHJQzqSuDgfCHmOppePgtI2K0Kc4b6RWI
         m/zv0OPTyUQSKG0flx9DXkph6u6NqpxQ6jq11q0J8BISrrlU1YPrOfmIj+ASLwrU7ptN
         n6EsrRvm4AoOspXMEYDUOe0oOCh+XmCeSmH/sr1LlTR1T5cmYWupKtT3FEVpAZFZWzQw
         WZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236823; x=1784841623;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QvFKRW2nnvB9OoV58oa050FX4fPgYHjASvEu2QYklDg=;
        b=JkNqu8U4XrbXgoA2oqYSWddexI9AJsFO5iTUq+w77ISmVpoUfG9qMIOy7OJ7vsDbQT
         TRCJ3qLuniLE9zTQUbiFh9lcFg0a9dsGN9k6g/8BT3FASqWKNrPKd2e02l3LblXQ/pUO
         odhaN/r0tc9nQYkZiyA/51jRnxvtu8q9DIdO9aztRjmRXsYO5+/2nCMApujgrUdhFSbZ
         cex2XIkxoQ10OCKvUZDEYaMnAMt3C5oLTVvuKSWvbmrqvFRFLzWcqN6u74QeMtn9sSf8
         XH2e2Voi8wSL7kgcxOfV0/wRa+ajyH5SHAccfPB+j13NtpuHFpMltP4EWiNdeKFP8dRo
         5Vhw==
X-Gm-Message-State: AOJu0Yz0kj62rXbPf47zkaQEzE49ivBo9Pp4n6ksa3hbeQlxXQ1rJ3wZ
	kf7iNVcsKevNu2ycKmOEY0r0/SZnR7T0fTa4pFC4mlhua2uia6xKwEtE
X-Gm-Gg: AfdE7cktj43T21vOUoWcXaP6dWqH1sEHul2xrw0hOzLPz2deuomkFERO/rVrHjRzCbi
	zLwnhN3rJBW1JzA/TPtKcjfSjz8f5kwOMvuELlmgS+lcT5ugDl8aDhwVfHZGTbfR+W+xf4FsJs5
	LIjJyHUc6zXULdjxMa6zJADUpW5QR3gH11AWGrMNE3kCoNJ2SvUZdah0qIzUrd5U6GAlnPXvjr/
	lol7bmlcZQMW00drAycpXdTA5U1WFZ8kUCxJrzeHRy7vsjssYll/N6gOlMkWYfPEHKap1DDwRzu
	IZ32pFfJqsw9GT8RJ6NO8LS5t1TUFA1ASrtZ0huOi+O9P7ixaI7xXWLvay7KpD0HkWnDcF7jDv4
	ourc0RqkP0hRcOkOMQbaDNmQs0zWrY6htDiDyQZEpWXbNRpOJD/93MT5O8UgrE9z+8AtvP0IBmi
	hYmMKG9Eh1R0rj7Zg=
X-Received: by 2002:a17:90b:2dc1:b0:37f:e7e7:ad1 with SMTP id 98e67ed59e1d1-38dc7c0eb95mr16822818a91.5.1784236822762;
        Thu, 16 Jul 2026 14:20:22 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5428:7379:8e6c:7b85:e813:4f3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm13940353eec.9.2026.07.16.14.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:20:22 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Fri, 17 Jul 2026 02:49:56 +0530
Subject: [PATCH] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE1S4ye4ilhUOxgLpEUk4u6K5
 bd47wLPTthDHV3g+BAvyxyQxBGYUc8Do9hgIEWFKohwE7S6TBUuoxEkTVRVVmU5E4RmddzL+f2
 a9rffu4nN9k7gvh9RKdWgcQAAAA==
X-Change-ID: 20260622-ti-da830-ohci-2a2299d045e2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Axel Haslam <ahaslam@baylibre.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784236812; l=2749;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=RYGzYHmoPYPQK6Hy7hBwQW7eu8rfoCMiS7Di340bX7o=;
 b=DkmXAL2mw3+v9PTybH3ZgqFY3vcAe0MI4NcegFrynVnP/dLX9wCxaMH6ulJupUhivv/pOrGSv
 85q6Wj3m3/+BQzuvwvpyi3y65XSD+BUiEFTrLETLPSNb297mcr6m4dR
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments da830-ohci bindings from legacy text to DT
schema. Name of binding is changed to match primary compatible property.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/ohci-da8xx.txt         | 23 ----------
 .../devicetree/bindings/usb/ti,da830-ohci.yaml     | 50 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
deleted file mode 100644
index 24a826d5015e..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-DA8XX USB OHCI controller
-
-Required properties:
-
- - compatible: Should be "ti,da830-ohci"
- - reg:        Should contain one register range i.e. start and length
- - interrupts: Description of the interrupt line
- - phys:       Phandle for the PHY device
- - phy-names:  Should be "usb-phy"
-
-Optional properties:
- - vbus-supply: phandle of regulator that controls vbus power / over-current
-
-Example:
-
-ohci: usb@225000 {
-        compatible = "ti,da830-ohci";
-        reg = <0x225000 0x1000>;
-        interrupts = <59>;
-        phys = <&usb_phy 1>;
-        phy-names = "usb-phy";
-        vbus-supply = <&reg_usb_ohci>;
-};
diff --git a/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
new file mode 100644
index 000000000000..ad23da646648
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DA8XX USB OHCI controller
+
+maintainers:
+  - Axel Haslam <ahaslam@baylibre.com>
+
+properties:
+  compatible:
+    const: ti,da830-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb-phy
+
+  vbus-supply:
+    description:
+      phandle of regulator that controls vbus power / over-current
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    usb@225000 {
+        compatible = "ti,da830-ohci";
+        reg = <0x225000 0x1000>;
+        interrupts = <59>;
+        phys = <&usb_phy 1>;
+        phy-names = "usb-phy";
+        vbus-supply = <&reg_usb_ohci>;
+    };

---
base-commit: ef0c9f75a19532d7675384708fc8621e10850104
change-id: 20260622-ti-da830-ohci-2a2299d045e2

Best regards,
--  
Bhargav

