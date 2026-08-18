Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42737FF70
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063459; cv=none; b=DQLoTqmpVOLSY6hffn42Syv5vJMz2hORUTMoeGx9syHuvRyORG8yvrciGbZCG4Fu0q3E14BeiZ4hI50W1S33I/k/sa5s7MEH5peq0ljKQFiPMS4FTbKFMnUdPt1GaoYQMPSsRZfAq4zGN9E5NHLIX8pYVD+GKy+AzHfLM8w/CnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063459; c=relaxed/simple;
	bh=vrwv1Mg7Vr8WAjda7g0Qmipd7F0KReKrluJL/Sq2pp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pg2NwfZUW8WvMcqE9BA/Kw6PhbBDpxc64fwTRrglxuNxpiDMCOm6jEkBCAUs6wnLiYvvgnVBqFdiuI2eNUqK7Wdx2ORO0yMhhK0EfaLgLw7FTCXiUW+IQJTNWXhY6QesiACHO+KEUbc0WsP6thago7HLA6k4Lntj6wRmVoDN7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUStCsR5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUStCsR5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so7289685ad.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787063457; x=1787668257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBKpudphPlbxUGeo34jNMtpBUnC6d5V3mo4+9YrfHwY=;
        b=SUStCsR5MZtG/IU3+vp5ybg39AT87gfKHkiLotxAJHdZhKCm9+pxhuPEQA756UXIUc
         8Vx/ZfNA8kVYIvMFo/VTQj/O9L2LzpEpH9PLK01gU5JqkN9hi5RQSUyrhNlSWwEJPd/l
         CDBWFtboLpjHLzhHDOj2JXQjRW2rH01J6P6v+Vn2cT3bP0Xk0YNZ2kYw+i0ckW/zHcfC
         qkH4I5FlD0mIWSJs4Aog4/bBdJzqR5jlEhD9PGXGreXa3Pgdy0vLWiK7psJXabnE4qKC
         a53/MXyUCjJa08quqHTSzOIHE6tFkE63tv73zeTr8xG9Kw/5cQa8qXxhPg3J2Ok5iXz6
         9eCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063457; x=1787668257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBKpudphPlbxUGeo34jNMtpBUnC6d5V3mo4+9YrfHwY=;
        b=kOzOfVo8pm5dHA6H0AUdKaJthmiGGkHq2cJVfsMGCWg6C+G1syti/qULUhCZmbKDkE
         efBI+1SokUJOs+cf2t8EfgFWTEwz4r/3tDYX4IMn/WXCVg4ZqENCIDYs1DiKkR8lplaN
         pYB3p9OlH7Yadx3P+6xY4VmNyAOVVNH1ewK6RUWxhwpThnB0OHWK+TNh+F2Qzd6JLw7G
         pm4KblEWwq5cDiTtGO3CusohC4wDeSyxLRsp6ZreN7hWOpf+OnWJQaspJ9a8zloA2aA9
         EjbMdUUhgRGAlWPN5dx3W8FdpIeFP5C7HzekU/qH72jjNRvL0gUcU5Juwmd0W1ZLcdok
         694w==
X-Forwarded-Encrypted: i=1; AHgh+RrgGpSYn5hxm4q7EO+c8alCVfranKrXBOHANwmbsosw9+KjyntPZ+EWWrg8yYsbAVRYuWNgrf62SiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Lm9a95mwfEBodtFxLwovmU8mizjCsX6VLR6fUNpT6Iirnh5V
	zA8mjer0qmDKt9e37jzUXVkGW7D/bFz7M+PtRQX4TjWv6spu7VDT12Dt
X-Gm-Gg: AR+sD11jWSYxWEJ7fmjUe2jfkQz0el2siP9eoXcokqkkIexZPd1pcAU/0Lci9XIeYgv
	DPaTswIsYZeYAaNK8PzvmiSe1pMtLd8Q5lmeR+TVTx7/4Ujsjy7TtrGnN2QCE5f3jfFZBjmnpwQ
	+djPILzCaDLc227YzYZZ/N1Lu8wxmzYOJAk+e0Q9zM41KFVq8QhBVAstWNJrW3PxlibOgRZYa8l
	I4RljWNdHu7YB6uTNzFB5qQihcS8judshnfUse0eh7LnLn0Uk4nYsuH21/8d9jIBw32ngmO/bzC
	FU3lZAXP+VCkwqsCF6Rm3z0tX596uv9KOtLoaLilATDIQVjf3BKrFy0sYkt/NpVil2kBMyUG5Nu
	mrF0Nc/J5gTppWkyTDd/Kh5nT0aBpWEZxag+3iu2pZYbNncxYikhy8ufZjf/6skkYEZENGIVAC5
	XG8fffj73pdccPU/c/T0So9VQOK26soFHzXft1OHgAVnZDiXOZIZqSqVH1WgPODKX+llAr3xVy
X-Received: by 2002:a17:903:2ce:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d3b0827041mr272611865ad.1.1787063457148;
        Tue, 18 Aug 2026 07:30:57 -0700 (PDT)
Received: from [10.90.163.252] ([2409:40c2:501a:6e15:dc3f:c23f:e55e:d03d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327b43d488dsm9043527eec.29.2026.08.18.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 07:30:56 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 19:58:47 +0530
Subject: [PATCH v2 5/7] dt-bindings: usb: ti,am335x-usb-ctrl-module:
 Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-ti-am33-usb-v2-5-66fd44d66824@gmail.com>
References: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
In-Reply-To: <20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787063337; l=2481;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=vrwv1Mg7Vr8WAjda7g0Qmipd7F0KReKrluJL/Sq2pp0=;
 b=yxhLJGFqbGsVwm0ht8G4qU0zird4onY64PgatPQWRbpABK2HEy5W9yPMQc2wg+jW+glahsjrf
 i6AKL5cUraVArDBbn4vXC78BHk97LBnzXIkzXQT4D97CQ1x4MfekQDx
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the TI AM335x USB Control Module text bindings to DT schema. No
functional changes.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/usb/am33xx-usb.txt         |  9 -----
 .../bindings/usb/ti,am335x-usb-ctrl-module.yaml    | 38 ++++++++++++++++++++++
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/am33xx-usb.txt b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
index 5973f88bcc65..94312ad8ec8c 100644
--- a/Documentation/devicetree/bindings/usb/am33xx-usb.txt
+++ b/Documentation/devicetree/bindings/usb/am33xx-usb.txt
@@ -8,15 +8,6 @@ The glue layer contains multiple child nodes. It is required to have
 at least a control module node, USB node and a PHY node. The second USB
 node and its PHY node are optional. The DMA node is also optional.
 
-Reset module
-~~~~~~~~~~~~
-- compatible: ti,am335x-usb-ctrl-module
-- reg: offset and length of the "USB control registers" in the "Control
-  Module" block. A second offset and length for the USB wake up control
-  in the same memory block.
-- reg-names: "phy_ctrl" for the "USB control registers" and "wakeup" for
-  the USB wake up control register.
-
 Example:
 ~~~~~~~~
 The following example contains all the nodes as used on am335x-evm:
diff --git a/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
new file mode 100644
index 000000000000..f8ac0af745c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,am335x-usb-ctrl-module.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,am335x-usb-ctrl-module.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI AM335x USB Control Module
+
+maintainers:
+  - Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+
+properties:
+  compatible:
+    const: ti,am335x-usb-ctrl-module
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: phy_ctrl
+      - const: wakeup
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    control@44e10000 {
+        compatible = "ti,am335x-usb-ctrl-module";
+        reg = <0x44e10620 0x10>,
+              <0x44e10648 0x4>;
+        reg-names = "phy_ctrl", "wakeup";
+    };

-- 
2.55.0

