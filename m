Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C3746E00F
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821444; cv=none; b=Dmq1nGsh08oUcDBUMqdzwOSNRlbrTSLu4CriqI3gJXaYjHGKjdHL0i0iUtdGKZGX4rGb0+utXMaD2Lk2LIpnsg19AzA8MH6R32Hvdb7qQttdy8NWQyvxWETEqeWsL0kZueXDRjqJf6cI55pCc2VqHcImxqYOTHTVY/iBCuiD2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821444; c=relaxed/simple;
	bh=SjXOgsWZt36xtI037Agf67Nz/GYoL0JZ4+eWdHP3ucs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lbmB3Dy9/3OX3nkDwdx0DwoYX3TEzuqsguyTuCtL+EcT9MrNiBVbx0exBIF9dFuWHW18wyUxQLFyfuqjyPS+wP9rPlpLkt5zmnmZlPRK0Cjbq5QooZxGCMcIk21E3F1Z1hUgL+tu5zQP2dxZODWUTHLf442ZBQlvOdxZ7gCmonk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dfm+BKr3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dfm+BKr3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384caf7b168so117864a91.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 08:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784821435; x=1785426235; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CrFSm+DdK14Fnc3SXG/vOdR9yhbSk9Li45ghwvsAXGo=;
        b=Dfm+BKr3H8Ko57yn+46+RRSF4nyG/TYa67YOpy7uipiY7ga5gGsdHAUEKBgGJxGjcW
         uT9M3cvaY1SpA+NVdfHl+mA/AnxdlfKCcr3OEpw130dUunsSC4yt81OqZ3Dx/pcNl2Wb
         eHvvcU5T372rmqCOn+1QOBGu37PRgrnGYVpj1CITvf+nGamYFf61IT5mKRxRg5Zg4FtW
         El5ycJ9iKSGmFhxsktf4iQ8oXWI+CaJFgGv4ykez8TSxjX5AoUBgJQSh2854PHpBdz9k
         Fvg7LF+lQs9A23XnsjY5iDoQlDhrJ6+YvqJ0kow9AMcc4E+/lQuKRtXqgq6An0qSgZlS
         RDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821435; x=1785426235;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CrFSm+DdK14Fnc3SXG/vOdR9yhbSk9Li45ghwvsAXGo=;
        b=Sk1D6PdjusjSg7c4+snVGVqHiAKDIo+7hpC4SfS4hKYfB+Z9M+cRLyeAwdB7F6bYIG
         XllSXZXR5Im0geJ9OeGbQsU+f4z4PSUCy828ikwZC5SaEXAQQrqPV+KOCrpcD0jlKr4P
         gS+eZpsYw4SodKRTOLQHyyf3Wn6KRFLQFF7mDOD6ZBJpOLleBAsAMprVtRQOYN/G6hyw
         JXfmsUVkzNE6VReUtO7YyiAZkoFYcv/MdckGRL5LyFL2wRvTonCkSovlsIAmCkBcZ9Yz
         7CDkms8l60tjlzwqT9kzK6pP5G3muWWZsL6V2Wift5qhbwcSDhLKdASyVQLp7bnoGXtv
         LiOA==
X-Gm-Message-State: AOJu0YzeKCy7RxV5HvzeuNJB9V6erpVwkMu5p3AKCYx7c+l67OBxiwI9
	yh8zcgkPpkDir0eh/nGxKYu3UciiI8OIbJ47Hq0D+Hh1i5JBOkGgQ4Li
X-Gm-Gg: AR+sD130naRCIRQoWqEUpJtdBmhwJBFCnQRS1mqxb/OALDNOdw7Z5P6y37kBC3BLV+B
	bbjZzsdlSMsjA2YfASLmBdkqJKkc+Au5/s90QTPcefUVh2qro3s9Pei4DM93YuJf4D4QTSI/0aA
	kNAuqwpJ1lMsZXBcxincofZnOYqshQcBItBXctB/xeI2sJm1wltZOZ3eq9CgMzQVhU5xyOLXcWF
	8vwWl5ot0MENiS8+G2srS61/Mt/bfKWvf8w9LXfBeXEI4WwLnycN6nriOTdhM/Kg6tcMdD0GOCU
	wz8zmJ5QhvIdk4tU4+LASLb8toA/ojf1OQjZO/kgXVRlKyS+F7jntwGSb2jVRCBq6lYd1wmCWTt
	+yjEE3rzoWGM0pArsxWLjUsyBXpXNVQ46heig2r9Qwwdk+Rsbv8lM6EfGDOhhjuk87k2Xi01bWP
	Oo788cLicFDXmLW2g=
X-Received: by 2002:a17:90b:3891:b0:381:cef1:11b2 with SMTP id 98e67ed59e1d1-38ec66586c3mr2768166a91.7.1784821434937;
        Thu, 23 Jul 2026 08:43:54 -0700 (PDT)
Received: from [172.28.140.252] ([2409:40c2:5011:6ee7:9d84:3e0a:3875:8cd6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13002f39sm17560943c88.1.2026.07.23.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:43:54 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 23 Jul 2026 21:13:29 +0530
Subject: [PATCH v2] dt-bindings: usb: ti,da830-ohci: Convert to DT schema
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ti-da830-ohci-v2-1-41e54afc4703@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Nyw6CMBBFf4XM2jGdAUFc+R+GRW0LjBFqWiQaw
 r/LY+fyJOeeO0F0QVyESzJBcKNE8f0CfEjAtLpvHIpdGFhxrnJmHAStPqcKfWsEWTOXpVXZyTE
 sm1dwtXy23q3aOb7vD2eGNbIarcTBh+92ONLq7e2Cir/2SEiY1myJSLPK+Np0Wp5H4zuo5nn+A
 RAzhT+8AAAA
X-Change-ID: 20260622-ti-da830-ohci-2a2299d045e2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Axel Haslam <ahaslam@baylibre.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784821427; l=3201;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=SjXOgsWZt36xtI037Agf67Nz/GYoL0JZ4+eWdHP3ucs=;
 b=rT/ljDJF2XW+8FOly2isZNkv04p2A9s3YKx8ZlKXx1jUZRWKydNgllzsgj85gX8b7o7+HQ4h/
 Td8WmxF/NhABDsCJ4okI5SUE70+uvsXG3+O35i6lFEVyqf0/v0o5aIw
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments da830-ohci bindings from legacy text to DT
schema. Name of binding is changed to match primary compatible property.
Add required property clocks and optional property oc-gpios which were
missing from legacy binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:
- Added clocks as required property which was missing in legacy binding.
- Added oc-gpios property which is checked by driver.
- Link to v1: https://patch.msgid.link/20260717-ti-da830-ohci-v1-1-3f2d111a2042@gmail.com
---
 .../devicetree/bindings/usb/ohci-da8xx.txt         | 23 ---------
 .../devicetree/bindings/usb/ti,da830-ohci.yaml     | 58 ++++++++++++++++++++++
 2 files changed, 58 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt b/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
deleted file mode 100644
index 24a826d5015e..000000000000
--- a/Documentation/devicetree/bindings/usb/ohci-da8xx.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-DA8XX USB OHCI controller
-
-Required properties:
-
- - compatible: Should be "ti,da830-ohci"
- - reg:        Should contain one register range i.e. start and length
- - interrupts: Description of the interrupt line
- - phys:       Phandle for the PHY device
- - phy-names:  Should be "usb-phy"
-
-Optional properties:
- - vbus-supply: phandle of regulator that controls vbus power / over-current
-
-Example:
-
-ohci: usb@225000 {
-        compatible = "ti,da830-ohci";
-        reg = <0x225000 0x1000>;
-        interrupts = <59>;
-        phys = <&usb_phy 1>;
-        phy-names = "usb-phy";
-        vbus-supply = <&reg_usb_ohci>;
-};
diff --git a/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
new file mode 100644
index 000000000000..f7b9db6347fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,da830-ohci.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,da830-ohci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DA8XX USB OHCI controller
+
+maintainers:
+  - Axel Haslam <ahaslam@baylibre.com>
+
+properties:
+  compatible:
+    const: ti,da830-ohci
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  phy-names:
+    const: usb-phy
+
+  vbus-supply:
+    description:
+      phandle of regulator that controls vbus power / over-current
+
+  oc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - phys
+  - phy-names
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    usb@225000 {
+        compatible = "ti,da830-ohci";
+        reg = <0x225000 0x1000>;
+        interrupts = <59>;
+        phys = <&usb_phy 1>;
+        phy-names = "usb-phy";
+        clocks = <&psc1 2>;
+        vbus-supply = <&reg_usb_ohci>;
+    };

---
base-commit: ef0c9f75a19532d7675384708fc8621e10850104
change-id: 20260622-ti-da830-ohci-2a2299d045e2

Best regards,
-- 
Bhargav

