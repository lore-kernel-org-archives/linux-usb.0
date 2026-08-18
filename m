Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11020136.outbound.protection.outlook.com [52.101.85.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09145EEA8;
	Tue, 18 Aug 2026 05:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032658; cv=fail; b=P+M+ZhPirNd62mi02D+CSIXnIA87SZDyVw4SIuiBjW36IBCBi60jlZ+4MkJ2WdNFMp9JX0bNgANYMJY6vbai4coqzK6xHek4oJ3yQEqBdaP4A8+gt1goe5M0WqJWQQY424b6o8oYXH5afHjUmdsPPTEx6gu2pGezOvnRaLobEkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032658; c=relaxed/simple;
	bh=+mUq5Z1xEwbMgx2TcA7/LePqRuS948iAH36BE4PLEnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J13OQ2Gdwtpq2yx/DKpCPT4VYVDxv/YvhP6B2LoMEw5ZfImCaj326/mWJvU6dXd/wT4DmuvaGRHk1+1vkJ+nUq+GyAAwRXmh6V0mDFfNmrDya631McCG7iD9TbgKCZwkO+nNpoG8YCd1vS0PiAEHpkS+eWjoz0u1S8gvFa1miCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=aqx410EQ; arc=fail smtp.client-ip=52.101.85.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="aqx410EQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQUfSO2CdhBdtbLbyKEjznvtO220anty6qvuNzGUEO4VPcxIVi4g7Werog8fd2j3Ev17Er2AAiArExFAwRaa4Nhawwy1WFE7N8lpXMIhyrnm4UU7pettpn+jsBZv+KUvD5bM1EQb0Aby1fI9vi60F/1tSqchhRbaNzl9pOrATFBTopIkbnrre6bLBgazV+y/rRZKcI4DXTW/WycbaLpgk8f+kNshgSvCsA0+Lmer4tREp9Pe27JvE7xSvb8X4eUVZHSDbI1kDuYxLwy1rt1B+u4ftGBOhAKr4d8UhQV2Utl1Pqg8RIENRbGdf3R+FbqYNMnAz9jm7g5D10KWetM8nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3Vu27eqJB0QWdOjkD1S53lPM6polYCfClbo3KxGl50=;
 b=sEnWVoD9uAfAdUPZKuu/BBEGr0APC+j6UPQrAcIXhsmVcCMYWnU75QEUrpy6XzVAObMLDObyhfCoq/pdw+X9m5wsHRaYbUOZhY5Bdd7E+1hd+RtAJA+lp0uGixwUXk7DaiHjkGeLpLV5pN5XOhqn9ZkU3S6YItX2SZ7Ec8jAJBt7yc8sI9CbyygNIcaatijsdqCr/nsYLcGlscPFHvyWs5zlKG1Y2EUABiyEfGV9OtLErBRQy5H31ZMLmiLLR1M3hWGU6FNNgq7RwONW/CFC0kUYIdVweh7zSTlD+7CD0dQImyT22YkBsZFxXCvLe4b/KhFbALGEqkh9TwCVejs8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3Vu27eqJB0QWdOjkD1S53lPM6polYCfClbo3KxGl50=;
 b=aqx410EQlyvOCddlftk/ybCQ2fHmytXXpFiFGJdiFDRzDSkVVv7zf1dqU+jryjXZceU7RCxSsZeOVDlCu+VLUY+5Z13UH2pQqFvqK6OIBOhPH/AMsmbvzN68YUFzg1piPamLMVtb0bYF8ngO0W+UFxL9Psvi2VZz1ttObS8Btjd+BJZM/uftSRIhAacgwbJIKvvDeU+87mP4vAMg02yMOuLTlbXy1LPYj6ydWxMv+01FDEGYAPiYLGQiUGLfNC/WyrcYZSrtEDjcZ1mwtGejzeV6fJTNW6XswFfZZEi1jFPF1iQMu49z893xTh7u5t+8bRYFCMZUMaXR+NIAXhveeg==
Received: from BN9PR03CA0636.namprd03.prod.outlook.com (2603:10b6:408:13b::11)
 by CH0PR18MB4289.namprd18.prod.outlook.com (2603:10b6:610:b9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 05:57:32 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::69) by BN9PR03CA0636.outlook.office365.com
 (2603:10b6:408:13b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 05:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 05:57:31 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 2F61B4186B5D;
	Mon, 17 Aug 2026 22:57:31 -0700 (PDT)
From: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Date: Mon, 17 Aug 2026 22:57:13 -0700
Subject: [PATCH v2 1/2] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-axiado-ax3000-usb-device-controller-v2-1-0ef033dd0a68@axiado.com>
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
In-Reply-To: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
To: Krutik Shah <krutikshah@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3508;
 i=rbnaveenkumar@axiado.com; h=from:subject:message-id;
 bh=+mUq5Z1xEwbMgx2TcA7/LePqRuS948iAH36BE4PLEnE=;
 b=owEB7QES/pANAwAKAbh/+EWc+O2/AcsmYgBqg/RKRVNV+d+eRam9GF+tJIl5O0/OlNpgRlnxm
 tK1pjD9X62JAbMEAAEKAB0WIQRgwxMPfi/g+F4zFkC4f/hFnPjtvwUCaoP0SgAKCRC4f/hFnPjt
 v/OYC/9UQ7OrXDTet7haCFPGR35M2CFUA5qALqQ1IQQ3Mq2HGQhIfMaDXBOW3fCvWFNWq79l12p
 BRrU+RDmreeSX+nTjbH/xOaUZ1azljTmRGg0DCrhiu12PPjh6eN5ssBEhWXxi8oJeUFxW5sZ9wT
 QvovJFygChiYx0iW5d5OCk9nJ0tW4NTVgOKgQC1ufHOgAT5GP+lmNBmE/NqXJgJ/2xEv5+f8VrI
 2XYO07kZzqux0OQx3F7T94vn7MbtRvz94E3xzGtYJtS9WmhN4W6IesN2nzcUcgZQY2IDIc82XUt
 BQhcGLGkYta2j74NJkQqLbGahzWFDGF0YKV2YNnZYKa0TVLAFnrPgm6oOYUkChDxNEnVG/WTMR1
 M3BU6HJEdqpm9lP2S/p6Ei6qoqGcHaSyOa5/Kn3t258RdZza/qoC+4z1BsPlviTUAP39AG9Wh1X
 2JXUEst08NmDcJ6HwFfOuNzja1FElnLSXNSv4PbWPSKnCxtZ2gnMYNLSJ0EB6ZCjsDF64=
X-Developer-Key: i=rbnaveenkumar@axiado.com; a=openpgp;
 fpr=60C3130F7E2FE0F85E331640B87FF8459CF8EDBF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CH0PR18MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: 484fc2c9-1d1f-4e33-cae5-08defced97f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|22082099003|18002099003|13003099007|10067099003|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	A66BmuEDaclLGHWeQ9EGRvff9AYGfZhInaLS+KOKn5gG1pEubEOY9VdrOX4Q7kk19Kl9v2yutdt1C0uy6IwaJQMdfgHw+SisERZGrDLFoEYYKsLysZ6nMgls465pvud8XcoJHE5+u1lKN+UT7oKSbRbfGLfj3KJb+wgcPYrz/qFVF7gQUz5W1xjElYM1HskH7+0gRsQXkEUJwKf2wmT2SxNQvrDl28jCsjYDxRi/D0PgiymdGUySQ9c0GrO8NQtCEFVIzamRB+upe8MNSlyPnGjTezTsPHiT16Rl6XfZ5Z1ZDN5aHdeyu1z/SzQL4dfU8cRTuwymv6d2B7+MCaBxUm+v5fZWVSFxI2f/5jTRga/k0oCT5RmrhS7hc85D4VSUbhwnmEs3Ams4hu+ZJBGxJbGtT/p69YciKSrc341uQXxWk8KxllrfMeciJLiNvLBumzBkRj3/8laPqpF/PbXiCt5l2DNGJQB6eEJNQ6SLvtRFIVPAs6DQtidxpyE95ZkphaWGKz952ncpUr4MHB4vn0BaVV6XZoASPEByF5JVH0xzRV10RdoZp0vDy6btLX3OOP5A0Mbzy2N2jQQWRi1FjQve134dBTeoShr12oWBOjgqvPvXjjWfepfFc53YYqqjvFHd+5sjatLRZpdXSKbhZA==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZIyILnks5ODsl17IPoEfMLsqCExww4cCfCq1/wm2Xxfl7VoKDz5cJVEbi1Y99B8DTtwn9wo9vM8M0W/87MmIjlCWGKE5G1xw0IDg9C2+vlOsmPWBoV1NUtqEsDtFvaliwBxVZ/3NyhRgTQxT8ktliVfFl4vaFCJ85OFYxF1TuU1oofBhGkSSsLph77Q5k4QhJvit6hKaGQ9fyGAZE2f+yhM1SgQ+8R2C3v7cd7kPbXf9rto50ONq5iJkJrPHlmDIjZeCnPk0/gHeRwp6vynXM9pg20vZ2qgoYVkTVi5e3/AgKYJsUWUSZXY5tdoLFQxxfi2FiiAgC53T30xhfrk5GlZ+mRyfE6gOhC217MicgLZ77CW/x4AL/1mpGvbZREG8e0PLFAopQOw38JZsbVKW1lMzipfP3KnxWEZSohob7AQziQszAeqqkfMY0tp6ofeH
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 05:57:31.8310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 484fc2c9-1d1f-4e33-cae5-08defced97f3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4289

Add a Devicetree binding for the USB device controller integrated into
the Axiado AX3000 and AX3005 SoCs.

The controller is based on the Corigine USB 3.1 device IP core and supports
High-Speed and SuperSpeed operation. The standard maximum-speed property
can be used to limit the controller to High-Speed operation.

Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
---
 .../devicetree/bindings/usb/axiado,ax3000-udc.yaml | 72 ++++++++++++++++++++++
 MAINTAINERS                                        |  8 +++
 2 files changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
new file mode 100644
index 000000000000..a9892658b059
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/axiado,ax3000-udc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000/AX3005 USB Device Controller
+
+maintainers:
+  - Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
+  - Krutik Shah <krutikshah@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+description:
+  Axiado USB Device Controller (UDC) is used on the AX3000 and AX3005
+  SoCs. This controller is based on a Corigine USB IP core and provides
+  SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, selected by the
+  maximum-speed property. It supports control, bulk, interrupt, and
+  isochronous transfer types across multiple configurable endpoints. The
+  node describes the memory-mapped register region, interrupt line, and
+  other required properties for the UDC hardware.
+
+properties:
+  compatible:
+    oneOf:
+      - const: axiado,ax3000-udc
+      - items:
+          - const: axiado,ax3005-udc
+          - const: axiado,ax3000-udc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  maximum-speed:
+    enum: [super-speed, high-speed]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@81200000 {
+            compatible = "axiado,ax3000-udc";
+            reg = <0x0 0x81200000 0x0 0x00100000>;
+            interrupt-parent = <&gic500>;
+            interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+            maximum-speed = "high-speed";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f7..36af69fb965b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4468,6 +4468,14 @@ F:	Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
 F:	drivers/spi/spi-axiado.c
 F:	drivers/spi/spi-axiado.h
 
+AXIADO USB UDC DRIVER
+M:	Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
+M:	Krutik Shah <krutikshah@axiado.com>
+M:	Prasad Bolisetty <pbolisetty@axiado.com>
+L:	linux-usb@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1

