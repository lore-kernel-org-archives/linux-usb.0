Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3549839C634
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771938932; cv=none; b=HYY5zveBpH6oQ3XiAsNH8HCWIa2NQbD4tAiRX5RVy8wkzFNDPRM5NI9jXN3t26oYW0fR1Cc0hs6BV86Y2N9u5ag9++6al4n0GH5MJ8rnK1uV3q+0y5QH4ipxLeFY5jTDoL/WgIaiwgYyOye4MeDJa613YSuw9LD/LrlPKrxP6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771938932; c=relaxed/simple;
	bh=QmF4nRlOe4+5G1AVaitX4auwcr1Rx/GkEUkcIKW7RMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rriKzI3O7IQqaevqHE5OhAU+Tc/+YhHscadnq+jA8MJyjjFzSWlstDFCMhgNMejX0ew5yFGLb8snyPB0t7NRe3NI2IBYhnbHJSzEPRp5l2u0qZlY8xoxkDhboSVqfcHWyM2W6w2/QTVpqVbuUDLGdRFfTRnJ4CuMmrU+6QxXIM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV2XOS2o; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV2XOS2o"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8249fc726e9so2863995b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 05:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771938930; x=1772543730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EF5DZh0w95AiZ3fg7AA2Xw4QIn2ePCxy3IrusVoZ7g=;
        b=jV2XOS2oooyeoaB0m/Ye20digP3eaGxtmn+x3aq/AC8QO2Wo9oEh+p0IX0dRYVMq1U
         TkYUl5Sx88IauemX03y7nxWyyOL71AMlwUMUxey9MXwv0ZIFZjUL6h7NLZz6IfMeVYyK
         /b4+kdnrl3ZQmU/ZjgS5LVoSKnYGwX2EKmQFDK0qN9rgCuK6PUWVYH/UapemoZ46WOzJ
         5CiUc8daBvlfjE0nqI9tHklvT4jyUsTZ5XFQG+iIeepA/jGwHBOiO9x7nlXlzvEGrKdv
         RD/KJ4SVwUaP7aJS/cTzYi9hTTP6SH1OR8ULbAi6F6w2O6HRtPGLk9pCBte5Z2nGo8zd
         Cf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771938930; x=1772543730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EF5DZh0w95AiZ3fg7AA2Xw4QIn2ePCxy3IrusVoZ7g=;
        b=SYF4U58Ku8niQ32d935ytNbCyhusDU4q3XezOEbONJT9R0vjeKOMyTU9QjTEevbBnN
         5v6HgGIQD7pCplb7kdrijtZ+TGtge7f3/KN3Yv4NaaBzaSNgyVF4Xl1HvsMBS4sb4enr
         JuFnWyYk18xQR6mpea9I0wEStL/wvNsOKVlYcrwxuvF4ppDwkpqcm+tDhHSxkbVOOTC8
         cj4GiajbdXmd3AQnVOG3m52KTlF7qWrQ/ZsWTAJfo+LT73cXaUWwAp+XfIPGdFavFzv3
         PdoG1/ATSSYx7DHSUOJmEu6vSTc9ANxMCahlRROWm/dXxXN7o9aWjYB9bjt/MDfuFV8V
         4GZw==
X-Gm-Message-State: AOJu0Yz5qCKdmZtpJl1St+UiohWxCRp69ZbB+UTrqsK1ydlBbktwAI/F
	eFbc7/W4fDnY7htVQ19IZWQ6h+ZzrN6i/6bFd1+RextuXQbKASIctkf9
X-Gm-Gg: AZuq6aLxm0uHrxXVy6guuV1mcwJt8loKH567pcjY0vUIlZ6LliSuLcfFsORDtNk/nR1
	IYM5R/lP0/zFDCSIyRpkePNTtxChwmZgg9NyKLx5voLwlsxR+9qsuN8WkA7Ys2+AE8ZDHQWDI/D
	67POwTaF3g5V3DyCRf1tVSKh8rmdURA032lPoc2KQlKxJiooCwIk4kgCMtKBfJinn1jdn/GABxe
	EICGV11R7ewqhXObv0e9By01ADk1LxhhgatvbTp3sDHr6UPhSFcjNl9gBZWbxPfilPIXzejW72m
	A+YXpgsexJzWKVdv2JqCs5pXYWiTbgltJqEGLQ8ZrN8Z/w3hPyYyZvluKUoAzMpe6XKzrJn/LOT
	U/xUbjeFya6glQfGRNO2oWfHBF70SK4OWkKWwDDozj/NA98Uhug5Sujelfl+mTNaFrh1q5iooIn
	Z3ycgXoyxqvrbcs+pFGsQFDRSIKGsLLUaYOG4qDDKAHA==
X-Received: by 2002:a05:6a20:431b:b0:395:151c:4eda with SMTP id adf61e73a8af0-39545f553acmr12721981637.45.1771938930467;
        Tue, 24 Feb 2026 05:15:30 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.171.51])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c70b7253a70sm10794013a12.24.2026.02.24.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:15:30 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Tue, 24 Feb 2026 13:12:58 +0000
Subject: [PATCH v2 1/4] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-atmel-usb-v2-1-6d6a615c9c47@gmail.com>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
In-Reply-To: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Add binding support for the Atmel AT91RM9200 OHCI USB host controller
to the generic OHCI schema.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 .../devicetree/bindings/usb/generic-ohci.yaml      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..ab8a49142386 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -55,6 +55,7 @@ properties:
           - ti,ohci-omap3
       - items:
           - enum:
+              - atmel,at91rm9200-ohci
               - cavium,octeon-6335-ohci
               - nintendo,hollywood-usb-ohci
               - nxp,ohci-nxp
@@ -137,6 +138,16 @@ properties:
       The associated ISP1301 device. Necessary for the UDC controller for
       connecting to the USB physical layer.
 
+  atmel,vbus-gpio:
+    description: GPIO used to control or sense the USB VBUS power.
+    minItems: 1
+    maxItems: 3
+
+  atmel,oc-gpio:
+    description: GPIO used to signal USB overcurrent condition.
+    minItems: 1
+    maxItems: 3
+
 required:
   - compatible
   - reg
@@ -144,6 +155,22 @@ required:
 
 allOf:
   - $ref: usb-hcd.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: atmel,at91rm9200-ohci
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ohci_clk
+            - const: hclk
+            - const: uhpck
+
+      required:
+        - clocks
+        - clock-names
   - if:
       not:
         properties:

-- 
2.53.0

