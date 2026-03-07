Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938BB38946C
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772874997; cv=none; b=d1q3NQsdViUUBIvic+kdeBlFDGqlTUthgL1QC1NHjBplxbw9fuFLIX1MBf6NANLWZgroyYHu2ffWRL8c8/X4tD2fRI0XnpcdSU0uxPMuZBwGS8poLdjSaWLk+Az6unBBXsi9taCcipKcbPtQarObR3cz5OcH1TCcGlJ6Dkl7J3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772874997; c=relaxed/simple;
	bh=dloQM5j6GGXl6pXKT9QuqBOKOBUfSZKFqBxV9h0h6lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAatzbq+8LW9V/PuusV9cfD6nEcd5+dtEQlAfiVrKx/LbCfkTTnAONJ5ksBqBrgd4kD/WVB/RMSb+2ZxOlrafaNOlZuDB26ilcVwJSpWKXEkeC31DXaaj8cd6/rTYOE9cic/x8bGXrVxhTvRAhWwjCGGoMuqtNcIQqU0nP2Pw3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bphnJWki; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bphnJWki"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae4d48dc2fso29610135ad.3
        for <linux-usb@vger.kernel.org>; Sat, 07 Mar 2026 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772874995; x=1773479795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW3VZiLdDmix0hxhYvm5DhZwcyWfk2K5eWWffGvWYiM=;
        b=bphnJWkij258Koozowl+Gl5dieGHmXci+R44bFLd6RvAX/kmlpIMVCsv9V1pxpBAXB
         suUt0TOjb3LXLMRXNMMMPrMyqAuhO2a249SRCmaf3r/frFOqCdbARKCYfH0ezIAuCO85
         FJrnKlN5ePGHJu2gyKncnYwRpc/6TBFXRN1paZb1mLq5+3WKieAqJjyewSabecLnyXek
         3UMaRxdO9b7aaNLlrUZWuai45qsPwpp3FwaovJpdXE7CNZBSL1PnarA8PEXgzc+IBFCy
         ElRFyt5c7ZrnroLZo8zYP8ItOviZ9LhVHVQFgmermdZl+TPAmJme5g6g49glH0A7RHpx
         kmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772874995; x=1773479795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bW3VZiLdDmix0hxhYvm5DhZwcyWfk2K5eWWffGvWYiM=;
        b=hP0KahcEerMdSbBX+BQSqk11nAOOnniUdFGQaMq3cXWhvHncAenW/v+GgkY0amppVc
         immgWfO0B0Gr0pCsgQ/teNBDTbWzsatwfZNkFuS55srzqrpTKRBBXrDrrMPJM+qcfh+T
         tmx8q7ZXIVvbiAPgEY5hGXSWmVcUaAfqlCBOirygrx87CqqHvss3obtQK70a0gJ/LEtw
         feBwWPgmJL4VSEKucRov5Q1VpMDxPV+3PPZ5lSE3loYskY0J6D8aVCVfTQiRM/yd747e
         SUrNsNfmO0uidRydY2LlCPEN90yf3ReP01pTaLqR8vbzgc9umEAXrFRRI89yTxikFKMs
         FcUw==
X-Gm-Message-State: AOJu0YwKRo3GCRkjCZsYyljgLxyagaAvhRwOsvx1q1MBXydgeXohoFgk
	EokDlijzyrVcax36wFQz/7IPks8qziRB0LaHnsTPb+2VsVBHVUDmi7Ia
X-Gm-Gg: ATEYQzwunXanLLahJZcQUhSK3YTiH+gQYJ37ijloYKQff80oq7wFcQQp6powNEHIOi3
	VXsae+EoPaLZRK7i400sCbMBdVRPveXiKOz1BaOG4+bAonWZ7/bfVmn2+f4KfNXqwHY4/SfZ4iv
	vplFG0gTJq4Vp7gH8gT6QjpBcsMfakjEIpCVbVkk6hNBRs6kd+rsnewIywjJissqmVAs28xdpv9
	l8qgQv1dUuvS4WSHxS5HD7e3ry+FIVigKzgXY/1ReCSgNK5sseDEso4zlXsy8XuvCScQeCIJUtG
	m3CckSJmcD95KGub5YBA6gUOOsc9G8dOBdqwo1aT3bxFTaHrh6eFJhZ8W2tfaHW+IszigVNW/gX
	09ywKAeDghvfLoFX/u0skPIAFBf7W37Lw9hIy3Nfzm4PrnWyUOsKSyCSrD3ouZhPfP2boJR9UDT
	hbmUluAbjpM1qIAdiDXlQ73F87ystkF4GKzQyoMiBQ4N6TbhxzSLVbkg==
X-Received: by 2002:a17:903:120f:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae824f4d5fmr50056685ad.34.1772874994942;
        Sat, 07 Mar 2026 01:16:34 -0800 (PST)
Received: from Black-Pearl.localdomain ([27.7.215.222])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ae83f74e4fsm45569385ad.58.2026.03.07.01.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:16:34 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 07 Mar 2026 09:16:19 +0000
Subject: [PATCH v3 2/5] dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI
 binding support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-atmel-usb-v3-2-3dc48fe772be@gmail.com>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
In-Reply-To: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
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
 .../devicetree/bindings/usb/generic-ohci.yaml      | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 961cbf85eeb5..a8a94b9c1fee 100644
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
@@ -144,6 +155,28 @@ required:
 
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
+
+    else:
+      properties:
+        atmel,vbus-gpio: false
+        atmel,oc-gpio: false
+
   - if:
       not:
         properties:

-- 
2.53.0

