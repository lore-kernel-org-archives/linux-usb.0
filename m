Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112FF3F1AAD
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218681; cv=none; b=IkAF+CQqTQAFfutIvSuLTjqRkPnXooNM1HZyMQrXX3xCr5uP82Pb7CKGr+1QFffbeSUc1T7yGoU9h+bjNBYC3Myae6NiB7IizfOlS2zXLKLLV8YTwS2jfmNAsPSBPPk5s4xCIrv2g0FwYTMbqwiJ1cYOcHIMGDvZIS5uNxP3L8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218681; c=relaxed/simple;
	bh=eP2GsusgnC1pbU80sJIT0eWrfLWddFQwIfPwMIT9cmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBSbzudayAeyFRO/2DmOIGxKW59Rb8QRRIBRzttPd5YTKusGpCnzYwTaJ/tLa6x5SmTlsjyELHXTvnLwUCU3DeZbdjYAipuvNlluP2+0gcxEeZ2u9Hq2+/XJK1bqjA7UMppCv3q+7MDjI7zPDwHcSFhGBxNxESc3ZLw4bpy2tyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhUKuE/g; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhUKuE/g"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-384c94c9423so494997a91.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218678; x=1788823478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBzDYqJz1rhOo2qIbSAQbkR5tnylL7yY6lbPSQMXgwo=;
        b=YhUKuE/gFBfS6CA6vhx+EjfqKRXC9cil+jcaxcCW0DSUxfxTE39bkZwjiHkmTX75Dn
         m88GCFkVxt4q7/eHD8OJ30/mqJfOh/ykDbF4n17ZTM0VEPuW1acOdDS1aKqod8C0sKHr
         QtvyjWpC0MhdYIPzbn+zsuahKqa6TXtkIk18zo2GkUm4KhLVwHEbErCk4kXv96nTJA5T
         DECpdDzRpFT4+w3/DHLuLEk4epvBKdylLRrdrK+jjjLyZNoTdpcu8Rh0acWW+ynEgjMg
         +6QFqESrVLiSF7I4WDgJRmkIxAl3ALrjOZRBvUZKFC9x61hRdtiPwSOqrXcmOyT6iqvg
         JBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218678; x=1788823478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBzDYqJz1rhOo2qIbSAQbkR5tnylL7yY6lbPSQMXgwo=;
        b=k07uj7HsPkglDeJ8V+cuB2FYJ6/wI8hFfiFOA55G+IFvOoFAvV7/ryaLFYf8RQi+xw
         2oKbDGQv2XO8Fw2ef7sdOpf/Nni1h3HREBlnVnJ/YZ4f12aUN/Xm5Ciwl9ZdNT7ZRd7r
         YKX18kAJDlyGfME7iQqQPyDczngpVFnLq6APWjDI9pwusfA22yD62h3kGJNTy/ZKrl31
         XKFfHHGd8rCCO9l8ywaJ9ERxLwdIxpRYPiQxCBoHzlryOZrcCM23Cryo4URm8ReH7doG
         1xl50QkZI1jJF60Jk7rODOZ5n9HrCYas5OiKIQzx8IlDWiRyjHuo3FeBXoQycGRqyCV6
         ZGMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPRvMT3cHjqazUONBM9PtXyPw3JzFJIox0uLOnuZV1AHUsbEgKD+TzOvHPAdmrOTaMTRSthzORXHc=@vger.kernel.org
X-Gm-Message-State: AFuF++ly5cfFRhV5q2OANIOiTNmqjaK4I6GGqB/G9pFtj3KHczxz+ptR
	PR78jzuJmNlYhx73tMOa1YYIOGYAw0wN2z1RiRcZXvqiG+zOv8vX9XrxjW7WoA==
X-Gm-Gg: AYBFou3xY7L7dIYAV9g4Ah+AUlt85aKuPjJFauHm6NY5TbrZjajDWqny4lF1Xe4D/bT
	DDraKdYi+5W8kZptLgYB/hXgDJ6NE8EnywkrwoCtxHSzMAlzXhWqFOGLCunWWKsGM7bUqO+H2Xn
	6euvy4+uGX3UocjaMcDC+o6YCVUFc8N27/2nb3bt3QiHsTb/ZvP+DznHKuHTkEm6S2YWR7WEml9
	U6reshv8IlzOYQ/0i7AmL8nuusKcDXssFtodZMV2O52Z+O2lwE2ju7U1BjNUSk37WTkPGRUOuvz
	zdZZWchH4laoAoA8EelYHdHLzSCP3EMjCmzV6nVkdoig5Z8X7xBTcmaczbhKifbov1cc03v2+sK
	JnWUvGK+Qmqr4na5o4h7q8S8NG9rpuP9qo/O7hoEJ+9f8Oo5uAYtbVrFSSSu6S2yMBvWUHlCqtW
	Ptcf1VN36iKOKBPBueIHTRXwcrYfWNsBxj8cmH21b2r+ezQZAz58EJyaX1fyCyyb9CsN2zy+8=
X-Received: by 2002:a17:90b:58c8:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-398bab4a682mr15575622a91.2.1788218678209;
        Mon, 31 Aug 2026 16:24:38 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:24:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:07 +0530
Subject: [PATCH v3 3/6] dt-bindings: usb: ti,musb-am33xx: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-3-5e15c617d2e9@gmail.com>
References: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
In-Reply-To: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
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
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=5224;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=eP2GsusgnC1pbU80sJIT0eWrfLWddFQwIfPwMIT9cmQ=;
 b=QKEENH/pj3ZaAy5ezfELNDe8pUzU+tFPVnNjJtdxDFCz4/6NtxPSN1SnnaeXP7MXy6zDXGJdZ
 kLUrMckFkwTBgWUvFyjKaYnWZ7kD0k3h5Eiy2kJtstOdTebdX2jbHpl
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM33xx MUSB text bindings to DT schema.
Changes during conversion:
- Allow an optional vbus interrupt used in am335x-bone-common.
- Add the interface-type and phy-names properties natively used by the
  dm816x hardware.
- Allow 0 or 1 for mentor,multipoint. While the text binding mandated 1,
  the Mentor USB IP natively supports both single and multipoint
  configurations as used in existing DTS.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  25 -----
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    | 113 +++++++++++++++++++++
 2 files changed, 113 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8832843c7d7c..5973f88bcc65 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,31 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB
-~~~
-- compatible: ti,musb-am33xx
-- reg: offset and length of "USB Controller Registers", and offset and
-  length of "USB Core" register space.
-- reg-names: control for the ""USB Controller Registers" and "mc" for
-  "USB Core" register space
-- interrupts: USB interrupt number
-- interrupt-names: mc
-- dr_mode: Should be one of "host", "peripheral" or "otg".
-- mentor,multipoint: Should be "1" indicating the musb controller supports
-  multipoint. This is a MUSB configuration-specific setting.
-- mentor,num-eps: Specifies the number of endpoints. This is also a
-  MUSB configuration-specific setting. Should be set to "16"
-- mentor,ram-bits: Specifies the ram address size. Should be set to "12"
-- mentor,power: Should be "500". This signifies the controller can supply up to
-  500mA when operating in host mode.
-- phys: reference to the USB phy
-- dmas: specifies the dma channels
-- dma-names: specifies the names of the channels. Use "rxN" for receive
-  and "txN" for transmit endpoints. N specifies the endpoint number.
-
-The controller should have an "usb" alias numbered properly in the alias
-node.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
new file mode 100644
index 000000000000..cc01edc75d11
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,musb-am33xx.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,musb-am33xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM33xx/DM816 MUSB
+
+maintainers:
+  - Ravi B <ravibabu@ti.com>
+  - Ajay Kumar Gupta <ajay.gupta@ti.com>
+
+allOf:
+  - $ref: /schemas/usb/usb-drd.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,musb-am33xx
+      - ti,musb-dm816
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: mc
+      - const: control
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: mc
+      - const: vbus
+
+  mentor,multipoint:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Indicates the musb controller supports multipoint.
+    enum: [0, 1]
+
+  mentor,num-eps:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Specifies the number of endpoints.
+    const: 16
+
+  mentor,ram-bits:
+    description: Specifies the ram address size.
+    const: 12
+
+  mentor,power:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Controller supply capacity (in mA) when operating in host mode.
+    const: 500
+
+  phys:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 30
+
+  dma-names:
+    minItems: 1
+    maxItems: 30
+    items:
+      pattern: "^(rx|tx)([1-9]|1[0-5])$"
+
+  phy-names:
+    const: usb2-phy
+
+  interface-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Describes the type of interface between the controller and the PHY.
+    enum: [ 0, 1 ]
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - dr_mode
+  - mentor,multipoint
+  - mentor,num-eps
+  - mentor,ram-bits
+  - mentor,power
+  - phys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    usb@47401000 {
+        compatible = "ti,musb-am33xx";
+        reg = <0x47401400 0x400>,
+              <0x47401000 0x200>;
+        reg-names = "mc", "control";
+        interrupts = <18>;
+        interrupt-names = "mc";
+        dr_mode = "otg";
+        mentor,multipoint = <1>;
+        mentor,num-eps = <16>;
+        mentor,ram-bits = <12>;
+        mentor,power = <500>;
+        phys = <&usb0_phy>;
+        dmas = <&cppi41dma 0 0 &cppi41dma 1 0>;
+        dma-names = "rx1", "tx1";
+    };
+

-- 
2.55.0

