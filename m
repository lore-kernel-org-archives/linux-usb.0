Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5743302B
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616930; cv=none; b=mGvdh/RyRVMr/F7ELEO2+RuJPwKQ9cM4BwuqtBeiz9kJAsPbjTVHGzS6oBnV1nKEw3bD5EBSVqsP4i0MK/u+L+3mr5pp3PHANaDUem/3tXlWiNDHr0a5yZImL8kcJii6qVD98bO/SriYiaBi/kT+ZshtiD/DJvN2NLiA6uK6RnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616930; c=relaxed/simple;
	bh=Weo+Ui8E43MHQNrKTqB+K8VGg2TvPBPQ6D1g4YfmF4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3/nA6/+fkhasOOm/nUVoSoR+K41YL1gKjXhNyZBRZg+vp8dNRXoK5VcQLuEdie14GtuIK9TbtNqq2DNw+qhGlDFIi5p8oGalehTphVfRUPfvU5+JuMDrM09xSS3gqOm/+o+Y4QawBJGFWoy1rnaU1synwB9aCVZNR3e6ncEiJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y1JubqtR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y1JubqtR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22152785ad.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616928; x=1785221728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=Y1JubqtRZwAsb43vVoeSY5JJjyZlmldO9NC9MH8KBHAhdY+eCt+yF8EQwu8oYh76DT
         MBzdt6DuPei4vUVl2ymrABNtz181vEHdUNn4eP8cU5iDmbLVB79E9XIfWUWJ0jIS9bYR
         9i+IVVezSOdycmXwyGUG5mDeD+rH5aFyIXTEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616928; x=1785221728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=ZCOON8XngWA5HXittllGJdeLh1ukBMCYnr4qADPpikglu/evv4w+vzYS79D0AzQiRk
         Y5cqzYbsHlfe7LRekj9QYXLNIPyFG7p/Y7DtUbvWP1xER46O4/sgQrtAUFVpaGZ6UM9l
         /peKTu4jtnDABRJQQdHeHj3/yiDKVqPYIiU+IL89b76sGNdpVCKJtfyM/hjrQy1Ta87d
         HqHdOkREiKzY9u8YM6u2Y1Jar5JLNzb1mFPTFWy711efMcR7EqZl+PjmLc4jCKZrvcEI
         vnaqnpkoQN76IcecCEyvBAX/fID6ITuhde9aCNOd/kpzwfZmxwzntAOn0dJEypkyq+Ix
         N0Mg==
X-Forwarded-Encrypted: i=1; AHgh+RovpIbYM8LRQlqLO8TzjbfRVyV6NU6eMP1rli9dSi2WzGk5NfnSM94a3rj4jydZLbuR+zwji1LmuoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yrVmrvumLx+HrdUPpBi6EaPzEinx0lX8Gtx8qpDD2unvuQoF
	L2KYjDwf+GEk4y7avRU0Zn3OBgiBl5iJ5N9fWSpMRKuaWu6WNtbaHRHW8RcnV+kY1g==
X-Gm-Gg: AR+sD10JMNXnsDBzZqq1o9RR99dTXAg1jTW99X5w4M2fkZsJMhzg0jeoLkzFQHgQX7L
	46BD97KsZSe3lcQs3Z+G2BFe/fGKKdZKzzZu6Gbu9Qz5jTU6Oxk4RJnKDU+UQGiyaUl2RAviqhE
	bXo8loFoizwugDJc18arlDqN2eNqZYD+pZzOhvp8dNl9fYTtuEcxOqVTJK9wtB+cBDG80PeYSck
	dNhFP1rp1IIfDCu7CSGFW/ZOrVkW6snrPSlGR3otgoHN833REXSwlQPLnzmC7Kyc5uEhxCYF1KB
	Ks4/JXKYS2VgDpVYFYTsFi0jdaYSDl2BKjJS5+hY+QB9tKbeZJNh6Gso80PtWbQe2S3sVcLLENr
	YRl1BsOPoYF0G3FicR1yxpI3PSc31tJxBt38V/xI3qvYZo7BtI+EcH6Ael/SLMW3bsNZZRuOiPi
	XWloMQ4iSztLKqgiZlhPUDY5Hx1Fr/IiiPnaqhd3ypGmqqxEz/O5QrLsVEhFA=
X-Received: by 2002:a17:902:ef49:b0:2cc:ee78:3236 with SMTP id d9443c01a7336-2cf34997125mr195766485ad.33.1784616927898;
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
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
Subject: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Tue, 21 Jul 2026 14:54:06 +0800
Message-ID: <20260721065413.2306137-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

