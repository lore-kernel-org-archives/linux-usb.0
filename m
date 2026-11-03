Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699675;
	b=d2nJTADIQzs9UjF87kEBVf4O1nD2jklPacCBx9xLBUhrT4xMkuJOg9W5uk2R1zakQx3j
	 YJVPDXkVpIscSwqXHj4R9mSK9box/Ujc+PuDWiXY6ULMUMOfBqscT6oEBCPjl+UdIoNLi
	 0YOloxNO37SKIj8i0rBZBDBybgHIKuXdkkrgO8oN78Xwo+wMr90UBnXTHJMA9WZs4gnB1
	 aVwRou3TzMJ5XQuy1vaSOgIcIfIPsf2LLuorhb7ZpTEHNzKBo2fK3wE6JXjC8bOnQebxk
	 1pd1n6kVoxclU26zRd1WtVpkrJ6uESLk/JVT3bweI3eETu+fvRBmN78WzZx/dk1CTeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqCaLUUNz59+zgsekGyFjzKAv3q6ta6bJK4x/zj55AM=;
	b=vdyIeiyIaAyNIsppFl9CJJrQfFvUbqvz7DIBtjYMZua5egIRepu1f2gcC8dbXi013g5F
	 FOr6LRXX3zYC0oEpfC/sBK+KOHgX8aS/RVjArrIkYbw35kB6wmQB3HwN4gWG5Ynt7ZtKd
	 eR5pIZvcOzaF9Jqc9qWdN6f0Lz8txBdPV+EzjP7Yr3EkV8+uMrXQW3O3kWpo0EeO6qj5P
	 8dlP2+4DHK94vSNo9XTrvWkaGyHU1ZMUz5t9Bg69M3ZXWlJ3AVn7+0yj0f1bW3D/XtPnb
	 1X0z0YoKaUhbCmDgSMIcsffPT+lRAH6VeVyn6hDDXFY+hZgrsRH7Lj2MXQCtO8CuHoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZZpmcJ9W;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684E60A261F
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 09:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9684E60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZZpmcJ9W
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so3104357a91.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 01:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793699674; x=1794304474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqCaLUUNz59+zgsekGyFjzKAv3q6ta6bJK4x/zj55AM=;
        b=ZZpmcJ9WUyeh7inRPfiWzraTq7IqCh3IocJ+GRbi7LEYfvoUUvI2ktnGKvii/Re2c3
         94xsGrKWPlzXDsCEKEwyd/3Yyl4KHHQr+dq+Ma4P/f2y/nAkUHm1DZFHjoD54QiETbaY
         XdQOPyVIRpi0H9XdhGsBMxXLnxot8Z14kAXLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699674; x=1794304474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqCaLUUNz59+zgsekGyFjzKAv3q6ta6bJK4x/zj55AM=;
        b=uAkhZGZKk5e0qbL/IKIbKqL9E416FW5Iq2sZW9kAz+n7HFgoOVrqPtyWrljtYyctys
         26Vi5XN5Axe5eYeV/cCNm7adxm1UmxkM27jOc9L2LFYYzljqf8Dw/LdEqS7stQiNYLcR
         5336qh6J1yTE4MwX2uGrsBTigSyYFKMh5pjkwKy8vd+gYRYOsLFsXJijFk08iX7eab/m
         sZZRstgO7td/hfjHMyj/mwkuvECw1WFjok5pBihB/PCJBPBMrdkxfx7hvvn6ZHLetRRL
         ydLBV6jbL0FYAEVVl8zOJHpjul3tt33IFYAWlnyZzKFvl3bMLIvTlGtNtO8MsxDh4F+l
         ShZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxX4n5rqrMVK5S3GCAkXpXM/uOahzJBC0YpHl6cIGYmW0qrWYiRQwkEPTYg+yepwmHMsX7ci6+7HKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dUER5fBGsvGkyp3QxHhW0jTjc/yUlb1+KCPXyr3KAwECz4VP1
	8H1S1ygJl9R0kHmcCvDobt70ulh/haUhnPqfDTFSCpm4kdZg+PGWGE7Df4WYGEjUbg==
X-Gm-Gg: AYBFou3erS2CYWzJdWvoW65k+NadG2eLPFw3K0T76qMipkuZtMAjs9Pk1jWiL5HfMkD
	c6bked4ACzX6oMHc348+J8+Y2ZDdC3PwjMDEYk/7JqCjcX5JUksHeypg6JfZekhblei/Z4Ln8hC
	I1oUphswvK6mOPVz811TSzAyTJDHeMQZSycslMvYGDSooWl0j+1qn/sr5LRs41U6MAxh5i/1Fgh
	ZebbiDSOWRUeCfZG2W4wOKLcTUu+uHAnmN6loNoAcvRaKWmr7/JlHVHB8kofDxN0UKMo3obWlre
	QCkVBIoe8zUB8aaEnq/yXRJEBfQK9kD0n8jbZlKYPPygGcGzhp+KKCmgGt7ZygViYD3syDVZ+QL
	6YJx3SQknBfnE2QBBvZobnhol4oyXEBAknIUt0k5JjJ+L9mrUTO1D4YYLzI8yJM8u5BYHHg2fjr
	XBuLmAgHpZhSlQJfzUysnk0VrNCLGdwf2o+/J+0vaFb5I1KzZ7GeuOQSLkcAjqA3vGVuO/fZE8F
	Bk+t8qg0idJy/h40nYTPKXlFFEvOmiuTqjE2NN22kCGSOYom7brekbR/l8paJiDFowHB5YFqo5k
	aYf99tE4mRB7TLgV0D10mA28dAWGVCLClqW+ysSSz4ohV6FPueAuxJCAl/GjGXt7X0xgnLSOfBl
	blzjl7MUM05SS6rV4Ev6ildHEohlC3cV0ug==
X-Received: by 2002:a17:90b:4cd0:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3ae895a5680mr10487974a91.3.1793699673751;
        Tue, 03 Nov 2026 01:54:33 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm3576828a91.12.2026.11.03.01.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: ti,usb8041: Fold in TI USB8020B
Date: Tue,  3 Nov 2026 17:53:29 +0800
Message-ID: <20261103095425.3097720-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TI USB8020B is another USB 3.0 hub that currently has a separate yet
similar, albeit more limited binding.

Fold the TI USB8020B compatibles into the TI USB8041 binding, thus
allowing the TI USB8020B to correctly allow downstream ports through
the common USB hub binding.

The requirement of "peer-hub" is relaxed, as done in commit e44297dd2b75
("dt-bindings: usb: ti,usb8041: Support nested USB hubs"). The hub chip
might only have its HighSpeed data lines connected, and thus would not
have a SuperSpeed peer hub.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Cc: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/usb/ti,usb8020b.yaml  | 69 -------------------
 .../devicetree/bindings/usb/ti,usb8041.yaml   |  5 +-
 2 files changed, 4 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,usb8020b.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml b/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
deleted file mode 100644
index 61217da8b2f3..000000000000
--- a/Documentation/devicetree/bindings/usb/ti,usb8020b.yaml
+++ /dev/null
@@ -1,69 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/usb/ti,usb8020b.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: TI USB8020B USB 3.0 hub controller
-
-maintainers:
-  - Macpaul Lin <macpaul.lin@mediatek.com>
-
-allOf:
-  - $ref: usb-device.yaml#
-
-properties:
-  compatible:
-    enum:
-      - usb451,8025
-      - usb451,8027
-
-  reg: true
-
-  reset-gpios:
-    items:
-      - description: GPIO specifier for GRST# pin.
-
-  vdd-supply:
-    description:
-      VDD power supply to the hub
-
-  peer-hub:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      phandle to the peer hub on the controller.
-
-required:
-  - compatible
-  - reg
-  - peer-hub
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-
-    usb {
-        dr_mode = "host";
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        /* 2.0 hub on port 1 */
-        hub_2_0: hub@1 {
-            compatible = "usb451,8027";
-            reg = <1>;
-            peer-hub = <&hub_3_0>;
-            reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
-            vdd-supply = <&usb_hub_fixed_3v3>;
-        };
-
-        /* 3.0 hub on port 2 */
-        hub_3_0: hub@2 {
-            compatible = "usb451,8025";
-            reg = <2>;
-            peer-hub = <&hub_2_0>;
-            reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
-            vdd-supply = <&usb_hub_fixed_3v3>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 07e13fae640b..74021d13a43a 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -4,10 +4,11 @@
 $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TI USB8041 and USB8044 USB 3.0 hub controllers
+title: TI USB80xx USB 3.0 hub controllers
 
 maintainers:
   - Alexander Stein <alexander.stein@ew.tq-group.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
 
 allOf:
   - $ref: usb-device.yaml#
@@ -16,6 +17,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - usb451,8025
+      - usb451,8027
       - usb451,8140
       - usb451,8142
       - usb451,8440
-- 
2.56.0.385.gac671c819a-goog

