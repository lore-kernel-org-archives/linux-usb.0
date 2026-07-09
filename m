Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97640B362
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591112; cv=none; b=BIqViZv6Hl/8wvuGfjmwHB48LKV9CNW7gXz2izCdy8kFDdnjCuEnoiuThfQ7uAtHbXHl2F5naIJsN+vU5uXYiKhhIrU596I4iHcqvK6NHGLa2WhfBuMjMb75MPUc7r/wtrP4JWb85LRTEt9U58h1bRzwwCSXqDmMXebsbbQFxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591112; c=relaxed/simple;
	bh=CYi7LZ0Rf22w7yCUOrMnfczHXIbmf6KgtnE9iKQkT0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5Rrr96gvoeQ4lwr/e3D9xzSzqaIHJ/LXczbkGsjjOVjw9zOPy4UYOLHaahzoQdbpW2Qn7EdQHUn9w0ts+oW/verErg6IDkbOiBnV+aX8p5g05/v+JVYt8HNopChhSSDvyvRuV1bEjChO5C3dEzTUDJdv1nh0PQ7mkv/0eArOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fsW3VgWD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fsW3VgWD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381065a7a03so1161675a91.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591110; x=1784195910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=fsW3VgWDE0+Q4YYgPOcNfmmFDv3gs2E9gJGVc9HsGu0MtWoR8wENZwIBYY5r5Di2Bb
         S1ql8qnXcBDW8JkphmXIVekD5A1XV6HFH6/7LQ9aKh4Di2UHWnN+HC1VJqOIxAFf5Fzc
         3ZztrE+FEy2IcZgQyu1BsvVM1rjW9mfODKshg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591110; x=1784195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=dhHTJkl0yh37RUYjugigUc4mc9T4E9JNzpXXbdvmtSq9GqeouDcX5Cy71yeXSy0kfY
         VGJbJh09LWh/IctJr7C6BmrjGNbNlDKFFIZA84JCXSCTBGANyPE5NMztKeNdRu3XupcS
         0oFpkrJGimKI2rZEhJFuFZglNTIVmoWt73q85vhoun1iRzkiy1bYV6otXWwmuJLtz3S+
         /HqraaBpCpqzjnRwtgre8zV6FAeCEYboslk/emMSUgJlVjgveWaLnGNYle5tdUOMyHZ5
         I+OBlECGJrIH0BTdLq0XdIGVLvz5C9RLyfViHLbtRjnohz1Z3zVAjhWDQZod6zEubmia
         bazQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+1t8AfpoRwdUfubSi9ucuTwFlw4KnPt2VmYHTBQMqazgkCwL6gTah4Qg4RFJTe9CaG7AJaJFNWME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xgNw6bvDrQjG5EfvUPT5H6J/l2uQm7z3YQjn8Ohmls/sfndR
	ihjWXlBp2IdphpgQzr1Fs5mTzJtHWKPJ4j51Ha19Pxm//ZmvdxwSsbHMMoqXVfxFHNAKmgdkSb9
	0XLU=
X-Gm-Gg: AfdE7cl/79Rylx7VlJXA8rAv6aUFPwddfgK61yhXBcyfy3oU2yhhNeu5WlmPGSaonoO
	vWVtEbiOG17LoDfCLGWSt5TN1RqDo8l6HK7xrKjA67aBvi6qxZTEz0hzdn001SvmpYNLrwk2ssa
	8wGR4s+pdNNUyKz/iOunP3GvsDG+cGCBqMt5Ov0FrGpuglCc8txxKXp0eLTK9BMSLHkJBG0gPms
	Bia1+NSrbGYdXTzAOB+/jDi+/z0IKnSlfO8ALbunlJT9Ye5iXCMNEs+UPzEG9OE75oEhyO4649a
	ZLscukfzAo9VgZi2U+CyhBTjidqEert2TKLYKqiz3S7FPnMPgzV2mdjYAuaxb7gvw4lh6w6wFNs
	ZNziZtuxUCg4Jw8dvhOR3mF+BSW59pwU2uHmu5uOTCuc+XVzO7b8YGFnhYDyQZgiOC531+nscIS
	4izQ8kq8+rjTeA2f9Q73cimeN++lhaHd7158NTML3z/wLftE9wGsIrcidMvyDdaAgM2TiObQ==
X-Received: by 2002:a17:90b:3ccb:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3893d81f4f6mr6100304a91.0.1783591110117;
        Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:29 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Thu,  9 Jul 2026 17:57:15 +0800
Message-ID: <20260709095726.704448-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
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
2.55.0.795.g602f6c329a-goog

