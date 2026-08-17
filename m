Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809EA2701D9
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 21:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003260; cv=none; b=NErpuBewx9Y8owzuc7aKxMy5aCanIV2M7TIMpJsioic7DDgLwUY5Ou+5KEUgrYai8SrvVyCbpKQ6PB2z12p/hnMcnjcVnvODAb3oOwqFtt/4zdTv6SvMHSa0KR1i8QD6RtHKbWeE8uXrNSnKjH3a+mrTUfmHXZuDKUe9rpMlkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003260; c=relaxed/simple;
	bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SE3HCEs7uCfFdsTd8dNpxfGIOa2xualwZVDlFneL+BKzuyv/TsmlI1pW1Xu+O1q1OJf8bXpJVSQdlh1Cp7siFiuZZGxtlQcx1z7ItM9xjaPSDRUpij5y+g/6o1J3VQ+eDPRiEDudfKIK6D3wcPDE1gea/0WymaV4GRSOA7jbBcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8oNtf3H; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8oNtf3H"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-392af6bda98so459976a91.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 14:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003259; x=1787608059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=W8oNtf3HxAr5/459feLBN3L0OjoxB0x9QD31SdmVurBjCbsuJXbT5GHWcpEv39xtKH
         woUSU35uCzlKrmWek+Y9xy6hmlYTD0PE+PnYHiCkZvQB5Us5UEbRJKQfr67v1BL4FrDQ
         KVI/K5SaZNY52KiZJPqpj8GE6fwvwpE1gOd06yanGpItDJNrWM4HLf+mJPy7Sn7EnJZO
         JbB4NraqEaHjRQ0HDY5E8vwoQqlTKCf+w89lJRu4najIY9rUouElbrLNTjt45+TvqEPR
         mXdMf0D7kUtqfwXL06XPhx6IsnNJYv4PeELefdPDf/TC5/ayDPdeRN+guyBPVLSRBPdU
         5o7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003259; x=1787608059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AbV7RIHYMEgMD35kCL1q43FBlvr9xDn3Pi9g2Kfmf8I=;
        b=deUfeAYkjkpr58MRcgY3RRqNiV2a69cFqmOl3BCazy9Mu5vhvhGEqn/xJQwAuFojJR
         B8T8J9ohPMksAKZJWcD9z8QgGkP2JgZ1gejJDjMtwEg8NlwyAl2ib1w3nrmBZujfUpal
         mjJdR2FdkpLAewDYW+7814Cy9aEuhMETA1KphDeYcARibzV8OwsThrS2iVJc3npBztDO
         5eyod3h38zPe/9zfaovPYq9X1+lZbi8Y63Hwigp8JotoDlJ6bndAatdaNqpC94ukLwin
         L/GOD1pF8LLVpIzP6dljYUWHbKOTvj/WIuWtrRM964C457PcFYX/riAU6sWeTEM90iNL
         O6tQ==
X-Forwarded-Encrypted: i=1; AHgh+RogVSdP/FIcDak+Rn42XPyqclwND267OgEnWiUINFwNvdLzZU7kQ4BSuUREIPSBiFKbmkj0H3VYO/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx56rmQHTnkprj1MHIXkmfA4EUDrBCW8gMUkdO6WgXJK1Z63ixi
	xqIGcN6z4MQQSXlDxHz8OyXJYdPCZCiHHAxbeEMMqB8n0m97b3ELtBMgySCNtA==
X-Gm-Gg: AR+sD10agAQn2ApPMhTjpxEB8L91b0Ff4Ry9/fE+U9YiRjkqBa0xEHb9N/w9yC2JXva
	Pnwc4WOCVxuZl0vq4KZS+x20m9Ucyuimhaj5touhjCZkjLTZUtvgjSY1pnpZbpoEmqD/B62ai79
	nOpQJQLputE/Dauu/AX/fdQuqQtewpatmLQQFe3FSIWL0aMHErNSdPTz+kcIj4sc9DlIF3lGxBx
	udx6lz25G/9wjRWYxVM1xB165lxwbL9oQjzkcHZcKJtXTmERJ85hyyDI8smqx42PDfFIJse+X+z
	IEBO7x9sEbA3mu0UqHyWsM14HACrWIQ25x/MumQtEf6oWPfYj2eV0IFfXC1JcHhiHgbumxroPzH
	O9uCrajAkNJnwoYR2p9n1QDjE6V4TMCOIa2iutahH7YASTO4rY9ys79tWuBc0uJbg/XZdCN9/O4
	/JVhz13DAqqdY4FvIgnFvxyrwMef4Fh3ZXU9988vqUOP3Ral2HBuTsMDMt2rSGrVSQWIKFZcVlX
	Q==
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d3b0827041mr219544715ad.1.1787003258858;
        Mon, 17 Aug 2026 14:47:38 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:5053:3384:1c8f:aa2d:e07e:6d3d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c388e3csm10153024eec.21.2026.08.17.14.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:47:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 03:16:32 +0530
Subject: [PATCH 2/7] dt-bindings: phy: ti,am335x-usb-phy: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v1-2-69ac5f92df45@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787003201; l=2477;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=x82f2rFO1TTjFpVekp+USEIM8EAiJutd+tABMnyaNHw=;
 b=xQkPjwuZse8OJWLFHr5jkhzUEk1s0slcPTBDT1bUKVvPkldm8oswiucbLVPFXWOV3PZZEUBPk
 OnGAKmqQ+gIBh2C+PSzghXuJkChgNxDAZePiB4N03yFOUP1Unchuq+e
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB PHY text bindings to DT schema.
Add undocumented vcc-supply property to match existing DTS usage.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/phy/ti,am335x-usb-phy.yaml | 49 ++++++++++++++++++++++
 .../devicetree/bindings/usb/am33xx-usb.txt         |  9 ----
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml b/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
new file mode 100644
index 000000000000..b28cd42ece5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/ti,am335x-usb-phy.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/ti,am335x-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM335x USB PHY
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am335x-usb-phy
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: phy
+
+  ti,ctrl_mod:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the reset module node.
+
+  "#phy-cells":
+    const: 0
+
+  vcc-supply:
+    description: Phandle to the regulator that provides power to the PHY.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - ti,ctrl_mod
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    usb-phy@47401300 {
+        compatible = "ti,am335x-usb-phy";
+        reg = <0x47401300 0x100>;
+        reg-names = "phy";
+        ti,ctrl_mod = <&ctrl_mod>;
+        #phy-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 8431de346129..8832843c7d7c 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -17,15 +17,6 @@ Reset module
 - reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
   the USB wake up control register.
 
-USB PHY
-~~~~~~~
-compatible: ti,am335x-usb-phy
-reg: offset and length of the "USB PHY" register space
-ti,ctrl_mod: reference to the "reset module" node
-reg-names: phy
-The PHY should have a "phy" alias numbered properly in the alias
-node.
-
 USB
 ~~~
 - compatible: ti,musb-am33xx

-- 
2.55.0

