Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6AB431E6D
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511462; cv=none; b=LNFli+wbRa0Eq+NnNZajNsd1TbuEBeDGXYpAd7jZ3A19ypiBDry28n6fh6IRlQP7w+SQoVlii6WVILVroPkxw2d9kRDMZhU0zrm7XbAHoK3zwEa54pObc/IZVU3tYJgPP8v/5E+G44il3v8QPik+c/O3qNSfR4b/uQJHAReoJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511462; c=relaxed/simple;
	bh=evX7eHGckJlWiDjaLlRDSEr7EUj3T3hqiY287BkHQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNTZmbLLMtGGnFZxOhtSXSlgtP84GXfGnrqwB6eJ6LPmcFLI4wuKhaX0ufgyhowrkjDgNU3RgqVlvS3sndlRdTtlwpklEF3zqkLdyQIJAZhVCpCHkG3npJJVFqqQnCLtC8UuiyPq2UszEyjzFOoX78EafHotPlxCzCFAXRt5gnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ka2DzsTP; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ka2DzsTP"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso621267a12.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511457; x=1789116257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=Ka2DzsTPOYkfLQgnSpArl8sTLhy9gXY5HzNB17WAEfxOiZ4+A6zd/jKUPvA26Nf98w
         O3zAOQpJiKyxYBVZVQ1craECrAkhoqcmwEwoatmiB7yXgTTHaJYSUi+wPNJk5iNwzKms
         v0qAQYbSzjTQn5XO0zaU7os1tx1mdF2L6MXo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511457; x=1789116257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=JV9sljbo+6uJkCIUf+Ko8h75WF2Rw+/VM9yhsuT6bzsU+L8J2g7GZodKFZFURZkH7r
         y92y+if3H3YgfsqsUpiCP2FEBRuKSEf9SG5vfPgOtG36N+FeYmG2Z4IHgkGM03z9TGIL
         JyDdR0EBZr5n5IABGHDl25FZRdAbEH8QJ+yzZXbS1wO5SvjNAufchu885fKndxSb9/TS
         ZLzH+JBEBjgUN40eyhoW3HLxb10CZCyMYmvG7iil8GD4CaAhcGo/b+aTstZmVVwEeqOp
         svIHNTcKUchaLezTP2yRe1OErbuN+2dcYh9ibhi77n0smACceYxXb2R6wz7CCqHgrtGl
         eS7Q==
X-Forwarded-Encrypted: i=1; AKwUvByWJbN82A70FOj7xscrZFhBZG7RCS8tesPvka20f7B++scQ97PxzCSWtaXFrAwU5pePksLDsVK0E70=@vger.kernel.org
X-Gm-Message-State: AFuF++kPvMfFZWyIiWizDPVifyx82dUWi0SR4nJVXgwMi+DqdevXpGct
	IKh3+0RDk6uZDWWhuEzj/GlcNmx6UVJypLUm17W8vQXuneIScZ4893IXwa7jz85ErA==
X-Gm-Gg: AYBFou0uau+UtjchK0aivPRFH1o3SGygFyN1pNEc2TXR6rLoNWm+2qiknTpZjfzdWpf
	skaIF+eNuGn6O6LvO2cyLBiXmSQS7U79JIkloaKDtGW7+byYJ6exYEIeHoJ/3EsTCQsNZOEvJv6
	rDBYCyp5ptwPuZhUzKIJX21zDuPcZX+BuqEMh6pldYqTlz7MXs6MNBXocgUwM+RpcZJttGGbVFp
	L0FermGjfzdDpYTchiyYnD/TUvQrn9uK/ziSkfToOk81lHKi6wHChDWGvkeJO3IL0dNy/dkdoND
	Z0niuXq7l+wzgXSa0hd0JuUck03rmyWTBh65gtXBlC24ICB10hnRYGW29f1cwYWaeOHOw6OwoU3
	EsZohJVgsq0LsBd2RVW9NMJqFqF7xDUVPTLKeK/01EAE9F3/tzjFSDZtgk44W+wpQv5RRbsv14J
	9tjmNaHnzZdhFq9yBZaYUwcUSgmSmq9lumvLsHKQrXr7H0FKUoWNF2ijkOdGdRUQuqYcsaUVZQ0
	6f7M78+0lW7BbwAkFfQmOs/xRA9n95TnMKCVfB44J1E
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr7039451a91.18.1788511457565;
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  4 Sep 2026 16:41:50 +0800
Message-ID: <20260904084158.1341550-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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
2.55.0.979.g7e5102b832-goog

