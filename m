Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599B3E3152
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105715; cv=none; b=D0q8BG5OkKVtVY+sRKTUntEBlt0pcELFBLlVBzQqx+kHsY94kpgp7OHhAO3ZKhsL3b+sMHUHYdA/HODa4v/i/27AiEnJke5nfqL8Qof7+j2/cDn2l+0QjR4mSLs3D8+uUSBw08spsHB/t2Q35xLXD+vYLHwnIvCHzXLkcxiA/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105715; c=relaxed/simple;
	bh=lenyNo7yJLPeybyXOoMP7XgBlraWqZU0r6gw2MR7+1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axRPoxuRJCIpIe6+cHBCFXg38gzon+kK+yVR8r/kJfOe3235DjoxYKojxpA/5RH4++RbryLlkRB5l04AIGKinNRMTKp62t1WP0nI9Rar/Ctxr4rnXSdeZ+2BAfxn9YnPw8zN4B9ep6qHbkwUmq8Ww7y5yUjJLnPk06ZV8PIdy6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ixva/yuz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ixva/yuz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9aea40d799so866492a12.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105710; x=1784710510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=;
        b=Ixva/yuz5D8tKB4fohb6jSQatDmVli4ujpK/mqdAvHBKPKha/QuP7t2Ivn0Wv3lDqt
         1wWxnoZDTc+IcD0OucWOXv8l3eeB9EuUh/okhTMAhiPp2FOkgnm1tZ8T7MoDfq2o0p5k
         HZ/ipY7/MwQBwkMDoPjcitYhDKLK3i3z9YzTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105710; x=1784710510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=;
        b=HAvOT4lvkEC+R/WgJUZG3z1+bvbn1T40Hrwcn3cr+wAnvc2RYlfJPbMvyTlRc1n3tc
         bqcv4aolP0Bvv0RH008ERbLTAuKMkA20rs/CNjSjVe5FFL5EYhoWCyiC0GCCp21ovT9Q
         yOn0u9sgjhVLV4nxgmZrAZR+zPpUPyz7RI0iiGZCg3O2kvl/Rc2RSR5lpXwyh8MP8blM
         9v33DrKuaxhhzKUOYVsSEyHAMzAuDaKnqc9OFkn/Kz4pnjtsFU6OcyxK8i39yWLROdWh
         1hnrdmfB6BuDA0G2DHYJECtfjZdXfUTw3NKqSVFrICdq+oYJ4kyLRVLeWchL5n3gPlFc
         r2cw==
X-Forwarded-Encrypted: i=1; AHgh+RpoRBctq7R52pWFBnleD0cgtfFovAJ4qhu4PakxfJHTqTrZvaKNZlJyxBhGlWzWXcPhDvfyce4fe6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfnWaSE8IKFuGCJ2UkZUErejxwkQimQ+cekJNE6ex5ETZyAyV+
	P/JPPbiJqbxbK19LtpG/AuXVk7rnsM6I8zwmGBfqd8zA4nWADoOeUkixtTVBsrLvuQ==
X-Gm-Gg: AfdE7cnt3t/p+PXoWehV4mvt8Q4KGwzP7qtYmkuxDeBgFJpuTfsg1uMC/eP65IOeEDp
	lYp/VDrjXki8WesVmpA3mnF4/Tb+d7i8k4JOQ1Lyl+cvHt/5H9N5Tg2dGc9BC/PMJUFNmrJ8LhT
	61bv6I67nYgG2TPGzDXxmuOcGUhjZBg3EQaPGbqZOcKw4HKq1EqFwhJTBCcmostULdhabu7VQ+N
	a5SXPCs48IDa+dqZPePNelIl+tCTj+RafiOqYqlZd8TtrlI67X33qQo2sS7l2fnoHPtCtDRDzwx
	ddyf7LJohcCUuf9DPKvCD9Cs/1qRSSXmMBeam51UUuVDlGt25F74qajfChxwbJw0HnRhweS+OeN
	zlk++zpyhYtpImgAYtINb4+hSP44zUQCb+Wdur+A+O4GWmW/NcHBPRUhFV5N7FIYox33iNyUszK
	02UOnzeTKBiv/1z/+SIV3GZizW99XM+OBd0d8OFmmFxSOCGZQiubnndoo2qjiXQzP0YQcK2g==
X-Received: by 2002:a05:6a00:1d90:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84889703f26mr14531622b3a.20.1784105710178;
        Wed, 15 Jul 2026 01:55:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:09 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 15 Jul 2026 16:53:41 +0800
Message-ID: <20260715085348.3457359-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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
2.55.0.795.g602f6c329a-goog

