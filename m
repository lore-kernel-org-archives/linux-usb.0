Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668CA3BED6A
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 23:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218660; cv=none; b=dn0+fePnsnoEf+jXGTSZ+qq8elT1CyysmwzUSFzKw/aLBeO9izg/E7RYS3uPiaFQFBj+gVocWZAGquBIjSgM/5cEMxp6lrb2RpwjrY6dBkiRr8CN2vWGE4KKnGb35oGPUTdLFNyOFI+Rk6hj/b1Bex1oGSHuJNPwu2v2wFr7Z+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218660; c=relaxed/simple;
	bh=wdCGHEerWJ5cmqLQGOw8nf8LkCX3g+goumJdNXlbraM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+neIgTFJP0yt/uBplX73pMmqDPmu/z2bmJ6bEosU3AkBoCr6xct/8SsQwj5THnPtAT6DyNZnAZBSU/SPUylNjBNWigG7RKGLOPCn7wM6TE3FIzsteKyGDBLRUq2lsh6C6sK1aaKXaVBA+JKhEW8FdyaMzKrk/lrhmw8Ochh5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZ4QErD/; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZ4QErD/"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c9b7c1e4so683336a12.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 16:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218658; x=1788823458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4jt4+G+FlNDDgolam7fVa9at5qKQS5ruNcIg62BbRI=;
        b=YZ4QErD/hEDz0RH8rzaOl7HKJUo4QDLiXELppnopyvKbXGD/pZ2DQPLd403vTZZpsy
         2S6sTI4Tm1BEviYgdDnCPOD6mkjaw+JN2VOVtb7CWlSkxc6tGz4Gmts7joKL28Ez4ock
         MCZx+b6sOW/MYQ/uQagfFMDAFRwKSatKDiq3QDjY07vmveTD2iAOihtvSXp/JUmoJpGi
         X4d7sNOhIWChpSLWx/7gwNx1/J+QOXwD1OnGlmIZnnMqbatOLZkqmdGzfXzBGITk5x2I
         zGWdrVg/Cecd6wM7TpV6P7HBoDhdmjGGyBeZ0QYdvzxJXc4IPyIJ7Lc7j0rrdWYMNWRb
         2QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218658; x=1788823458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4jt4+G+FlNDDgolam7fVa9at5qKQS5ruNcIg62BbRI=;
        b=OA1nXWo4OMnD0wySiuPEssI5surZlSHA4hpzfFdpTlseqCWXWGW7VaXt7A0IqjMY4+
         +snJplEBJdVppyMQL+3BDjnChPJ5gcT36HoIk6iYCvIOoQ32M1xl0GN8L52YHKAGHrRj
         hAus8ppCAx0ZGisKChWSD9arT9PI6MReCjFvE2ogjZ/csjd06viqt1bLtdqAikjTr5n6
         7aLCXSKaNLOELcjgozb9kj/Al7NBZsEJwaLZY/fvpG/dk5YpjXnKMZYugFG386eRIe+q
         sV02WdQSi1uoIYeCq10XSkz0fkTAvgHaMXQJ1SNyGpuPKt7T2OcI1KeSsqxTlBsOcCq5
         SiQw==
X-Forwarded-Encrypted: i=1; AKwUvBw16kaOO55H+19zUWY/o8nVuO24ite3c2EGnkVbUikxeZHAwMw9BsQCiMfmazmLNwk1CVcue76Hdvw=@vger.kernel.org
X-Gm-Message-State: AFuF++kqRiYFrhdoFKc3QKhDk+XbYEHkElkAgBypIfx1/XXZi2M0PJQP
	423Yng9DkIdCxrTvHQqG0ioC/7Lj/MDntnCmNy8tx46wIp3jDmMtXev02x6l1A==
X-Gm-Gg: AYBFou1RrwO3c1eGgsEObCcJ5x0BWGheSp4cYjQWDXDgfJrztZAhSW5a+JuFK9B+JHU
	dtb3+nSvybxZxsCPNY9e78w2XMXXFzRhr19dZ4+P9/puP9u0W6u50d/ORqtLoQI03RkfkgqEFcA
	VOq8F07kDHsHiV4JN/TxVSok69/CzGrDAlf6BY9bv3OiOuFgxYkozJk1xY5pkubvbYMg8hEHFXv
	rdxA8H32lTc/9aup86fylDWy208MMgRLdbqRhS854NOzG9TFgg71fBWLCJB30uxccFiol4OQBuu
	tSRfxW8poO0Jmhz3TQlrq1frNjNj166+DXXK6pZqGKiShjs2cJzRu9+Et1p0NLppZl+rfMTpNn4
	TVXY7lBM6zYGadWmalT8l1bK5u8z9r8sBtdqLpGOhtkFxSnD2efPyl39cSPpDgPe+OcuxGElDWz
	4SF79Thh19JWcK+NDIc+mZeYnj+X9c0Oz1OrSxNVSgLcz7FM1qY6yLLpDS+CWDQtBaU9O+Dls=
X-Received: by 2002:a17:90b:4b87:b0:396:463e:2eeb with SMTP id 98e67ed59e1d1-398ba6dc4f0mr14936225a91.0.1788218657679;
        Mon, 31 Aug 2026 16:24:17 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:24:17 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 04:53:06 +0530
Subject: [PATCH v3 2/6] dt-bindings: phy: ti,am335x-usb-phy: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-am33-usb-v3-2-5e15c617d2e9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=2527;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=wdCGHEerWJ5cmqLQGOw8nf8LkCX3g+goumJdNXlbraM=;
 b=433rLdFjhp/cZxJu80LNeYmwzyv7NpPrsHPWkvaXA3CSzd0fsbH2lnjG9g42jIzAEqebm3YrE
 HYUCmFZ7fZSDHQTZuxLzJhe8aEP7UYjeWCPN8u73ffdOnObKiiu7q5d
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB PHY text bindings to DT schema.
Add undocumented vcc-supply property to match existing DTS usage.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

