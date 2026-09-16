Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98F466B08
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545589; cv=none; b=nyi6W1CLfgq0cnqwLA3DrYFBkkRLMfcPrV9JRcGUWZsW+xIeE0Ao2xZqA0DhmHQnnQhrrJt2V7c8WIhTYESuouN3Ev9WAzM1BROHRcNaMyl7HvBX7XEvB6+4i4pzgT6Ot/hYPnn7sLZqgyNK63Q/tcncuFpqEP+Jh8V8/xLCDQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545589; c=relaxed/simple;
	bh=n5OM2/VFYsx7oj5lWPwm1kxpni3dSJJQk03UQEkKIio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTGJlXGE4dBoMS3lnQg3RhrzpEkv+YogvTctrxmJlFDHN/dBKlfEwUwUKHjxK8qnNiehFSQEbj88SO5A6L1KudOhR0U22jHpFXeKFxm0pgBiEeaaNkihSP2G0H1c+bYLQUQmtA0JKvMCDIc3oDrScXaCOBrNkJXPOhsf9++4RU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ohYqnxUt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ohYqnxUt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba92so528184a91.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545556; x=1790150356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=ohYqnxUtCPXeFU+yDLfm/g1jv2GU38BjR70gPaXT6fZBcN1akUi9BoI/csovFlpLeS
         X8cZbpOkdAT7PpAIHjYLJsNJXHKv2pVqHHFVhp77Ze8Mz8Pjou+T1OuotuigsqHGgzKo
         GTUvC3aWZ47Z7rkhK+0MjnFLYucVqepA4e0UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545556; x=1790150356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=wP+VEBKagQfyDrxf70MqL9NgTEA6qZ/XeFTLXR9PbUuYYtdzAh9RIvVKwddz07UDcB
         t+Bh5809dFGXTJY0ZMrCvdBmsVqh+IG+0IOeZtlcKSlcPwyd5eA5nROo/F5b2u3A+xUN
         I4cXJlqares3yXgEqYBKr45+NOmfYnd+VMv3EkzZKZRovFcLzEu4bXR1hA+MUdtKViyj
         cdkxuBXsRljgsGpwXBMDvMqYk1IQIrLJ5AfB842DpU0Y1hW55wOILsqZG+FX7hctF76/
         OZ5T5e+J7aPSVGraTUvaT4/0H7gyz9ERULWbB/gL6FTk0WWzau2zmkevaH1yrx2lo2na
         xdLA==
X-Forwarded-Encrypted: i=1; AKwUvBxP0Yz3X0Umn59+xoelAb1b7mzdvnMEVXo98/BX5+8o7aAyFOfuZw+zxcWPTIdBjuO5804PhnqUtYI=@vger.kernel.org
X-Gm-Message-State: AFuF++l75JhhQf/QlJW3CE8REwXvci4g140ERFZY3Q9MpXSQ4FVuXsN5
	EWh2neyNoL+qMxxPYVdrjQ4bVpD1fFylL5QsuNTfX58FYUP92/gj1HvrgzmmuumAWA==
X-Gm-Gg: AYBFou0nn2Lq72yNvjuTYIncw+T0pgJwUDyrZ6LtZglIBF6Wti7G++WfIxaDIpEOlLd
	gVQ43pJMx/SckZRUs8WUGEJwuTCYlA5e9w5vsvqZCzaxrJuVhQQPlWwWwW0ZVGGFH9kTmVlmnKM
	KXchL0iQ5uLNFFm3N18ybgrdG7Ld7QNak7fV82D6CoDTXluM/i4ZcHzHr6TA7gUv5RIdhLgcdQ/
	GWzDqlSC7wr0sXB4HPO1YclRRDLadEQbBHJ73G5Ke2g6gm16F86tK8prhA1ahQ7uA802ID4mWUI
	FwKbY4/W0mFJwniApoXk6sY/xLMtJth71PqrxWlkePwvB6YTFofAJHJ52vDhr5jCSTOx7pwLfeV
	Z32WSZyExXWD9ffvZIc+TG/2dwNfY2MMQta0gpYQBrLRPUpB9sgY3lLpDPipfLMITF2iaYlLQlE
	Ltd4LrZf8NmHusx+PRhWj8B9m05lOmDsorP9dUBzC27ED3aaELNG3JbcNvQkDRTW1l0rzet4/S+
	SbJCw3rLNR6L3VmnLMskehGoMO8MCPCG9zeg1QVQlr9/K5fiZduFPaJfA==
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4372580a91.10.1789545556050;
        Wed, 16 Sep 2026 00:59:16 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 10/15] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 16 Sep 2026 15:57:36 +0800
Message-ID: <20260916075745.3549953-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.1032.g73a4cd73de-goog

