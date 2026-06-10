Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2EE3C872A
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080920; cv=none; b=f9nDU4YbdyInW51Vwc3voOszFiBKeVNmkDr6GcjaI8RVNq17MXVxy4YjmNVRefrXTNSvBibP4w+w6K4Gqthvn2cekiVvRbp3F4RBRruBE1SWHylOag0FssKMwznD57Krl8KBk+UTdfAvQdRGpdjUGBcto2U11lO6cZcDmosZuJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080920; c=relaxed/simple;
	bh=K4CbRZICEvXlvZnsotKBa841gnqFgA+6O9aKcbgn718=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrVv7VWKlaTYq3/qY6hAQ9pGKxIejsARJHaQYsbVS0nTq3tqYQo8C+ihBaz5ySq6OeyZnNoKS4ye7JhcW+lIYiRcrpGNRqO2Xr+8mfgfw2RyD5zx0gM/IChkPQEED9dUUtwN+/APtetTMCsi07cRznSSy6S9JP6yLCnB7Ni05Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oU9OHa4q; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oU9OHa4q"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf22d29dabso43398765ad.2
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080919; x=1781685719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=oU9OHa4qwepub7JawaNuseJsLw8+JEKpBAUataCn6hqsatICp9JYzO1zwduBlLWBoF
         JLG4dIiQ1ER2t0IRzTq4VoAJJCDAtHujaHIzL7U+Jxi+8mYIbWyzwBOtPDy2Zaabv5HN
         3183s6JrqtLAsmqy/UQB826fjUCfbOz/DZi8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080919; x=1781685719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=rSsq4ZXGg8mJDgV2ej1/k5ROeHWEEXH8PaXtmqeZM/BmJomuh3xGM44wmfiEwt35Ib
         KpygdkCebasSBX6GB29lO9uriusCmgBJpcHLw7DHtIont2O+KPBB/CuWQXxRUwFZXaMg
         z6Sj43vCdP9cWCIopqEwzkYExViZp5fiDanOp1JZXK933ucTkQZft8NzbRGFrRypB21Z
         fVuKHbrIBEUPPI/bFa/sH1EBvRkLXO2YHA5/H7ayJgQzELPITTMwJRtmRuM39mlCJQwl
         9KyHlpp7i8VLp4vLcYJgJhstkBgZv3Pai0NT86cunizKSdIKVID4GlcVvm8J8w3z9Tf4
         8+pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nhVtGldnUf7D6PFAWimkeawP5My7Gg8TDBl+3Ru0XQeyaX3ei2yZHI1me+GyuxIxxldDo4laqfm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNS9XZDvO+ngp/8oQbiMTW0orqmx8aHD5P249cZWF1qGTrKE+5
	2u/KZt0scOZiOq4SDQC4GngIXYI9rbE9Lr7BADDyc7roajV1tYVKTLoiuIBEx/fIsA==
X-Gm-Gg: Acq92OFKTba58k7EhrzXtqq500rXvvn2ZxndUhBGtkdh/LwxGsDQ1sY7Igauy44UdGK
	L5P0ejFr8gqrOb9xIv6h0j8mNAx3+iP4T4hXgIcwnW4VPiU2hoFPcMSgniy9O/i/h/cCdZ0Ru3n
	JNoxFEHRCiyGdHDEPNbIx/VLjNgrq3xdSTA/gstplQJ55e5M0ulqia5BeCHwI+zBZMIg/2607LG
	oLw+6c2v+x1dnUcMxJMEOrOP5zQD7UD3oQhdTAxTE3nQGdKU+4fe+x+4uRMwKTSfmXiI9PJU+3L
	bkRrp0gbUzeXy25zL0o9xeJym7QK8lEZW95lATwmj3zjf/wu14biJwOy33xyMrXZ+r4nGqP/7Wa
	9OGwLv9TptRzfLqr7tAP12R4ENDHqhABp6bDx6cxQCLl3rpQAGads5qW1/zIMHihTECcG10pRGL
	+oo8LYAkQcqfESoDgjXwSeJ4+ZlHOLk+LFH5IrlPhbdC+Jl0j1QRuaFp0xYsJ3ZIUg2hgR+1NVY
	DiWfKcpt+zJGxSxHOfUbAUcU+l5
X-Received: by 2002:a17:903:3bc5:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c2a1bafec0mr80534305ad.3.1781080918758;
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 09/16] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Wed, 10 Jun 2026 16:40:43 +0800
Message-ID: <20260610084053.2059858-10-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
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
2.54.0.1099.g489fc7bff1-goog

