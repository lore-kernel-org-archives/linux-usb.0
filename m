Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021082.outbound.protection.outlook.com [40.107.208.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF051351C20;
	Tue, 18 Aug 2026 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032673; cv=fail; b=VlseZv8q+KyeI1AmqSHvnHtov8jiEhjCJKeOdQubFaSbouCfWJ46+KQUcY1meQvh9OkKj4rgP3dqFTf7hpwqu6XGKUobxOfTDorm9v0P7WrFAMsNHCvE/JF626YeU6d3ixuT3AuN+J+g2V4/hPVXYLdZTnc1LTKhVZq4lGGtnVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032673; c=relaxed/simple;
	bh=AArkO8zqersfM3+LqNbtB5SREeF7ptm92unPbtm9dWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DH0YZvXqzFvzrvx6b6+uX70qzRXJb1+SEjcZz03TzkQ0TeaGK8SeLsGxZIa1q0fv4swceBKwh1OvAZhaUgvRhK/5Pb0vQCzyoaqESMadtnFKa1FttOy1KNmGzYR3TIaBx8O00n9Jxyw8qDsBMd2KT496s3N+Zxb1uzzYgl3S5UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=KRKcxlLr; arc=fail smtp.client-ip=40.107.208.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="KRKcxlLr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F29kcpU4HcjnNiOuM5Jo5RmSp7HF0N9oKHOD2RtKwUIQni3Yx0OYWPaJ0/nQY4rl52WIS8Q/kAIS+x256SNHmxpNQQzsaB2SfRtQwJP2Q36VC/Si/DVBZ6DsfLtcZKGSsQRyPobdxLuKUGg6U1PnpgMh6SGWrTCrqz5s3NGCqygZr8/ZIZZV4nF1Ew4Y5AFw5/9QFPTh3xbUrc7kfXatCYnuAUwt8TvV90kHZNbqR3fYVeYAxzspRLgBT9oszM3NoeiFzgJbR2tSpop+8OvFcgJsANNUfCF979U6V1ItKevy1566v/iWLdMnHFbUlJ1hOs1iFYCKth9Am/+O2rQ8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3i8EUCYhiOnpYm0CpCMpSxM9BNNuFgpCp7zCH9eLsA=;
 b=NKUOVp01FUMci/URT9nUVQZp2mcEq6d4ydFUUlgWLM6R3buvOedNUjVAbob3UzC2AYANUNG0RiX9e4Sh0GZt4UE11+HG31e0iuSxQn/QJ2riQ8p/8X+04H7vCnKYr8UOkGlAyu26HyCEYsz3vi4r6IDPhBTFCaV3G4Y+dJNepxk3JEwv4YYSyOqjZbF6Pa/R4Ddz8aGHJcx6MVKYEOgMdjMlLQ16mNIuqEoeZf9Q+lePthh6TIkptxGSZcQg6EPwq31hnIE6qT2/cJ/3+HhdXTMc3LGWwPLN813sbhssXaLQKSA3esXfV5I9CGWPURs402JEm/U5YnXnc2EBd+sOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3i8EUCYhiOnpYm0CpCMpSxM9BNNuFgpCp7zCH9eLsA=;
 b=KRKcxlLrsBEGaTJwp1pgPs3zEul7qE2gFHeSzO1vo4h7IBDey7b9BWXrVbnRajUFC8mhda81hFTZqUnPjiorRX+5uy2vHcMhrSfSR6YVuN35kf14aumHC4OWo1Juvxnb6PrCUmJn0XxzgxlqnuN13wqNIGIdjnelGmIDRnZ/QKKhtmHhQJQCc/5P0yRSg/IsEMpD0/XEKqLvl4D/pD5jfycKLD/zVLObw3DXA0qnF0C6Fv+QlK5Pr5mtbxjgYA3lRZOAfZotxAIe28Oftl1uwT1CzkFrBhUESdS8C7KiUjpZkoNpgR4+NCidf1O0rPKkDlNWHcVdvvXkyxZuN8IUlQ==
Received: from BL1PR13CA0062.namprd13.prod.outlook.com (2603:10b6:208:2b8::7)
 by SN7PR18MB5264.namprd18.prod.outlook.com (2603:10b6:806:2e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 05:57:33 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:208:2b8:cafe::94) by BL1PR13CA0062.outlook.office365.com
 (2603:10b6:208:2b8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 05:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.0
 via Frontend Transport; Tue, 18 Aug 2026 05:57:31 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 3A9AA40BFE04;
	Mon, 17 Aug 2026 22:57:31 -0700 (PDT)
From: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Date: Mon, 17 Aug 2026 22:57:14 -0700
Subject: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX3005 UDC
 driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=142322;
 i=rbnaveenkumar@axiado.com; h=from:subject:message-id;
 bh=AArkO8zqersfM3+LqNbtB5SREeF7ptm92unPbtm9dWE=;
 b=owEB7QES/pANAwAKAbh/+EWc+O2/AcsmYgBqg/RLalLMypPrcprHuMlfY2aBgqcIT1b9v+v05
 6/RlBJp9eCJAbMEAAEKAB0WIQRgwxMPfi/g+F4zFkC4f/hFnPjtvwUCaoP0SwAKCRC4f/hFnPjt
 vzy2C/0bPmPwYI9haeLOteQYGdEbsqpD6zaLirguXNQj11SC7zTTa7DZHHkg+6HznSz5FXE4qjf
 ddCtTHsE04khNNyTHFOfT7IO6PzbKIxUN3PRKr8PC97/xIrlvN8rZaNFYWFGxiFMVUO8PTYtGLe
 n5GaDbdrWwSOVDUUyDaJbw4obzQ57G8RWjTnkaeSWt0ah/gnMy7aVMgsuWtM+Dsgn5RQQZxNvmk
 MMbIS4tPR/nWWa94ClMbYfvGNcruPCIGnQXsMgG6oggDnDG6EvWPA0Bs1FXZ3PGv7Gig1Vr24Kh
 6qSnnQ8UwRAHkeanJeGmORmXmDI/UWoa0LOWAj0kE7zUO2uqBkA2inLlm2Gemjj+VDr5mA0679u
 mAoQOOLTj90iSSLnSKc0P5NP7hgU8kRISaZyfeopuwYFTNITnv5y9SEma6zcaRa4PYCxApJWgMQ
 qY6e2PohCIbwcdAb1SgH5LgUsrDvt6gMxuh5X4h/XUHm8wmtUHRn0eNls/rCtiBnu/tkc=
X-Developer-Key: i=rbnaveenkumar@axiado.com; a=openpgp;
 fpr=60C3130F7E2FE0F85E331640B87FF8459CF8EDBF
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|SN7PR18MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 6199367c-83f0-4c42-9e76-08defced9803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|7416014|10067099003|56012099006|6133799003|3023799007|21046099003|18002099003|22082099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	SHQD4O1fUvTuvm8rnt7unsd2EzKEZWDNynSg46vphZRS7GzAgIAFlFxIB44fY7e++H7uZZMRtKOBrG0mUk2gqT4klUkC7LBntJKwfiEkO5tK3zEzfFVRSIJlfFkHUIy7pAOqtvlu9Yd9i+tsJlCLQ/OPtAIjJU7FNWAS90lee2XaYOqM/C4mj4catEpHLJblIf0AwCBtgBaRskRnQMSUMRcTLcaxRQ7hp9iL9oLTVqLFPT5Rgf1X1mWuJ2OrmjHOdR+LsADFyplpUQ9iWZN1e05od/QVVva4jkwX9XjtCTBFbXgL+9KfGnrT1iPnfre+IvLrQ489L+fJ5te8Xa1znin4z8VMzxNNplnpFr5a6l4eYZn2VX4tMOecZEPgIJAQ4H/NWe4Im0J2fjsQ0NCy9DemxnH6QHm5ZzKWqJ7rRbrtlZjF/eyrznQwPdJNcd8xdd7J58+AePl9dMsZvwQoleix+AqZja6B+sdw7gVIA9GHwStwKLemKWEVp2OnOMRU+CMDYIXlFNRPOGUXv4eKyI0Cw892ZLiWxC+8FkaMNlISWWt9Tc0v/6dfXhksmkE44+tsBJC9jVJHBhjrjpWXuFgsm+RsdRc9B+Fj3djfUOeoYasZQRLxZwP/eYh9DAYf3ahVwEcJBiR31zZ9pVVBvbBkeGYC+D60oQy+m2KKxecFp1gTWYM9zCXurmf/KlHKDCokNwuNDTIQkALDFcpeBg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(7416014)(10067099003)(56012099006)(6133799003)(3023799007)(21046099003)(18002099003)(22082099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TgtHlxtdqFIqFh+S/dv5cHbk6fZZausP3QkkF4IYz6G/wwTfmaGyCq/eUftnTr+CwtHUSCfK/DM051JTgvCUSKrKRcnyg+VHm2pxUZSVWrFiKrTuk41F43WDOx4YRBKKHMNHYUp4OY+3MXSff/wHs4YOzIY2g3Ss3Ho2HKVRxLcnPbv/jRLvxyKPqX6OqXnys3OJ1WdbH1Q/yHF1fAU72M7yy5EJUN+VsbNGhz3DL9ASee5x5qw3o5sngdH0NTW81MBqBM+/XVAiX2i4mVp10oW5C4osbjRQXJAuLhIuhA4QBDdXPeXpB9hUJV7SP4wGSZqyY/vbP0LCTJIPh61DoaEGFb3R1ZrW6/AtqxGcI5+aYKVnYeN+6gg67fpIjoNpu4iBXnTBbWGETCENMHH9GfAq+ks97G4wfRWtc1ayeREafQfXZVJybxL4QRfGWEZa
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 05:57:31.9348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6199367c-83f0-4c42-9e76-08defced9803
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB5264

Add a driver for the USB device controller integrated into the Axiado
AX3000 and AX3005 SoCs.

The controller is based on the Corigine USB 3.1 device IP core and uses an
xHCI-like programming model with a command ring, an event ring, and
per-endpoint transfer rings composed of Transfer Request Blocks (TRBs).

The driver implements the USB gadget and endpoint operations, including
endpoint enable and disable, request queue and dequeue, halt and wedge
handling, and standard endpoint 0 control requests.

It supports High-Speed and SuperSpeed operation, control, bulk,
interrupt, and isochronous transfers, and scatter-gather requests.

Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
---
 MAINTAINERS                      |    2 +
 drivers/usb/gadget/udc/Kconfig   |   14 +
 drivers/usb/gadget/udc/Makefile  |    1 +
 drivers/usb/gadget/udc/crg_udc.c | 4491 ++++++++++++++++++++++++++++++++++++++
 drivers/usb/gadget/udc/crg_udc.h |  355 +++
 5 files changed, 4863 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36af69fb965b..a488d8802586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4475,6 +4475,8 @@ M:	Prasad Bolisetty <pbolisetty@axiado.com>
 L:	linux-usb@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/usb/axiado,ax3000-udc.yaml
+F:	drivers/usb/gadget/udc/crg_udc.c
+F:	drivers/usb/gadget/udc/crg_udc.h
 
 AYANEO PLATFORM EC DRIVER
 M:	Antheas Kapenekakis <lkml@antheas.dev>
diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 26460340fbc9..791bd4b3c4e5 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -417,6 +417,20 @@ config USB_ASPEED_UDC
 	  dynamically linked module called "aspeed_udc" and force all
 	  gadget drivers to also be dynamically linked.
 
+config USB_CRG_UDC
+	tristate "Axiado USB device controller driver"
+	depends on ARCH_AXIADO || COMPILE_TEST
+	depends on USB_GADGET
+	help
+	  Enables support for the USB device controller integrated into
+	  Axiado AX3000 and AX3005 SoCs.
+
+	  The controller supports USB 2.0 High-Speed and USB 3.1
+	  SuperSpeed operation, including control, bulk, interrupt,
+	  and isochronous transfers.
+
+	  Say Y or M if you want to enable this driver.
+
 source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
 
 source "drivers/usb/gadget/udc/cdns2/Kconfig"
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 1b9b1a4f9c57..1cb15b21195b 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_USB_ASPEED_UDC)	+= aspeed_udc.o
 obj-$(CONFIG_USB_BDC_UDC)	+= bdc/
 obj-$(CONFIG_USB_MAX3420_UDC)	+= max3420_udc.o
 obj-$(CONFIG_USB_CDNS2_UDC)	+= cdns2/
+obj-$(CONFIG_USB_CRG_UDC)	+= crg_udc.o
diff --git a/drivers/usb/gadget/udc/crg_udc.c b/drivers/usb/gadget/udc/crg_udc.c
new file mode 100644
index 000000000000..bb3ed394d984
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg_udc.c
@@ -0,0 +1,4491 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2019 Corigine Inc.
+// Copyright (c) 2021-2026 Axiado Corporation.
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/sched.h>
+#include <linux/scatterlist.h>
+#include <linux/types.h>
+#include <linux/usb/ch9.h>
+#include <linux/usb/gadget.h>
+
+#include "crg_udc.h"
+
+static DEFINE_IDA(crg_udc_ida);
+
+#define CRG_MAX_PACKET_SIZE 1024
+
+#define CRG_ERST_SIZE 1
+#define CRG_EVENT_RING_SIZE 256
+#define CRG_NUM_EP_CX 32
+
+/*
+ * Cap on events drained per udc_lock acquisition in process_event_ring().
+ * Command polling and crg_udc_reset()'s hardware-reset poll both run from
+ * crg_udc_handle_event() with udc_lock held, so without a cap a busy event
+ * ring could keep the lock, and local IRQs, held for as long as events
+ * keep arriving.
+ */
+#define CRG_EVENT_RING_BATCH 32
+
+#define TRB_MAX_BUFFER_SIZE 65536
+#define CRGUDC_CONTROL_EP_TD_RING_SIZE 16
+#define CRGUDC_BULK_EP_TD_RING_SIZE 1024
+#define CRGUDC_ISOC_EP_TD_RING_SIZE 32
+#define CRGUDC_INT_EP_TD_RING_SIZE 8
+
+#define U1_TIMEOUT_VAL 0x70
+#define U2_TIMEOUT_VAL 0x70
+
+enum ep_state {
+	EP_STATE_DISABLED = 0,
+	EP_STATE_RUNNING = 1,
+	EP_STATE_HALTED = 2,
+	EP_STATE_STOPPED = 3
+};
+
+/* control-transfer setup state machine */
+enum setup_status {
+	WAIT_FOR_SETUP = 0,
+	SETUP_PKT_PROCESS_IN_PROGRESS,
+	DATA_STAGE_XFER,
+	DATA_STAGE_RECV,
+	STATUS_STAGE_XFER,
+	STATUS_STAGE_RECV,
+};
+
+/* interrupt-on-completion moderation rate (in TRBs) per endpoint type */
+enum {
+	BULK_EP_INTERRUPT_RATE = 5,
+	ISOC_EP_INTERRUPT_RATE = 1,
+};
+
+struct buffer_info {
+	void *cpu_addr;
+	dma_addr_t dma_addr;
+	u32 len;
+};
+
+struct sel_value_s {
+	u16 u2_pel_value;
+	u16 u2_sel_value;
+	u8 u1_pel_value;
+	u8 u1_sel_value;
+};
+
+struct crg_udc_request {
+	struct usb_request usb_req;
+	struct list_head queue;
+	bool mapped;
+	/*
+	 * Direction used for the DMA mapping call that produced the mapping
+	 * tracked above. ep0 is bidirectional and its
+	 * descriptor address is always 0, so usb_endpoint_dir_in() on the
+	 * endpoint cannot tell an unmap apart from a control IN or OUT
+	 * transfer; the direction actually used to map is recorded here
+	 * instead and reused as-is at unmap time.
+	 */
+	enum dma_data_direction map_dir;
+	struct scatterlist *sg;
+	unsigned int sg_index;
+	u32 sg_offset;
+	u64 buff_len_left;
+	u32 trbs_needed;
+	struct transfer_trb_s *first_trb;
+	struct transfer_trb_s *last_trb;
+	bool all_trbs_queued;
+	bool short_pkt;
+};
+
+struct crg_udc_ep {
+	struct usb_ep usb_ep;
+
+	struct buffer_info tran_ring_info;
+	struct transfer_trb_s *first_trb;
+	struct transfer_trb_s *last_trb;
+
+	struct transfer_trb_s *enq_pt;
+	struct transfer_trb_s *deq_pt;
+	u8 pcs;
+
+	char name[10];
+	u8 dci;
+	struct list_head queue;
+	const struct usb_endpoint_descriptor *desc;
+	const struct usb_ss_ep_comp_descriptor *comp_desc;
+	bool tran_ring_full;
+	struct crg_gadget_dev *crg_udc;
+
+	enum ep_state ep_state;
+
+	bool wedge;
+};
+
+#define CRG_RING_NUM 1
+
+struct crg_udc_event {
+	struct buffer_info erst;
+	struct erst_s *p_erst;
+	struct buffer_info event_ring;
+	struct event_trb_s *evt_dq_pt;
+	u8 ccs;
+	struct event_trb_s *evt_seg0_last_trb;
+};
+
+enum crg_ep0_state {
+	EP0_STATE_IDLE = 0,
+	EP0_STATE_ABORTING,
+	EP0_STATE_ERROR,
+};
+
+struct crg_setup_packet {
+	struct usb_ctrlrequest usbctrlreq;
+	u16 setup_tag;
+};
+
+#define CTRL_REQ_QUEUE_DEPTH 5
+
+struct crg_gadget_dev {
+	void __iomem *mmio_virt_base;
+	void __iomem *phy_virt_base;
+	struct crg_uccr __iomem *uccr;
+	struct crg_uicr __iomem *uicr[CRG_RING_NUM];
+
+	/* udc_lock device lock */
+	spinlock_t udc_lock;
+
+	struct device *dev;
+	struct clk *clk;
+	struct phy *phy;
+	struct reset_control *rst;
+
+	struct usb_gadget gadget;
+	struct usb_gadget_driver *gadget_driver;
+
+	int irq;
+	int udc_id;
+	char name[16];
+
+	struct usb_endpoint_descriptor ep0_desc;
+
+	struct crg_udc_ep udc_ep[CRG_NUM_EP_CX];
+	struct buffer_info ep_cx;
+	struct ep_cx_s *p_epcx;
+
+	struct crg_udc_event udc_event[CRG_RING_NUM];
+
+	struct crg_udc_request *status_req;
+	u16 *statusbuf;
+	struct sel_value_s sel_value;
+	void (*setup_fn_call_back)(struct crg_gadget_dev *a);
+
+	enum setup_status setup_status;
+	struct crg_setup_packet ctrl_req_queue[CTRL_REQ_QUEUE_DEPTH];
+	bool setup_pending;
+	/* EP0 rejects new requests while the previous control transfer is
+	 * being aborted and its completion callbacks are being given back.
+	 */
+	enum crg_ep0_state ep0_state;
+	u8 ctrl_req_enq_idx;
+
+	u8 device_state;
+	u8 resume_state;
+	u16 dev_addr;
+	u8 setup_tag;
+	u8 set_tm;
+
+	u32 num_enabled_eps;
+
+	bool connected;
+
+	unsigned u2_rwe : 1;
+	unsigned feature_u1_enable : 1;
+	unsigned feature_u2_enable : 1;
+
+	bool portsc_on_reconnecting;
+	bool u12_forbidden;
+	bool u12_initiate_forbidden;
+	bool reinit_ep0_on_bus_reset;
+};
+
+static enum ep_state get_ep_state(struct crg_gadget_dev *crg_udc, int dci)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+
+	/*
+	 * DCI 0 is ep0; DCI 1 is unused in the Corigine ep-context layout
+	 * (ep contexts start from DCI 2 for ep1in/ep1out). This is why the
+	 * ep-context array is indexed as p_epcx[dci - 2] elsewhere.
+	 */
+	if (dci < 0 || dci >= CRG_NUM_EP_CX || dci == 1)
+		return EP_STATE_DISABLED;
+
+	udc_ep_ptr = &crg_udc->udc_ep[dci];
+
+	return udc_ep_ptr->ep_state;
+}
+
+/*
+ * command related ops
+ */
+static int crg_issue_command(struct crg_gadget_dev *crg_udc,
+			     enum crg_cmd_type type, u32 param0, u32 param1)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status;
+	bool check_complete = false;
+	u32 tmp;
+
+	tmp = readl(&uccr->control);
+	if (tmp & CRG_U3DC_CTRL_RUN)
+		check_complete = true;
+
+	if (check_complete) {
+		tmp = readl(&uccr->cmd_control);
+		if (tmp & CRG_U3DC_CMD_CTRL_ACTIVE) {
+			dev_err(crg_udc->dev, "prev command is not complete\n");
+			return -EBUSY;
+		}
+	}
+	/* Ensure that everything is written before issuing new command */
+	dma_wmb();
+
+	writel(param0, &uccr->cmd_param0);
+	writel(param1, &uccr->cmd_param1);
+
+	tmp = CRG_U3DC_CMD_CTRL_ACTIVE | FIELD_PREP(CRG_U3DC_CMD_CTRL_TYPE_MASK, type);
+	writel(tmp, &uccr->cmd_control);
+
+	if (check_complete) {
+		int poll_ret;
+
+		poll_ret = readl_poll_timeout_atomic(&uccr->cmd_control, tmp,
+						     !(tmp & CRG_U3DC_CMD_CTRL_ACTIVE),
+						     1, 1000);
+		if (poll_ret) {
+			dev_dbg(crg_udc->dev, "command timed out\n");
+			return -ETIMEDOUT;
+		}
+
+		status = FIELD_GET(CRG_U3DC_CMD_CTRL_STATUS_MASK, tmp);
+		if (status != 0) {
+			dev_dbg(crg_udc->dev, "command failed\n");
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static void setup_link_trb(struct transfer_trb_s *link_trb, bool toggle,
+			   dma_addr_t next_trb)
+{
+	u32 dw = 0;
+
+	link_trb->dw0 = cpu_to_le32(lower_32_bits(next_trb));
+	link_trb->dw1 = cpu_to_le32(upper_32_bits(next_trb));
+	link_trb->dw2 = cpu_to_le32(0);
+
+	FIELD_MODIFY(TRB_TYPE_MASK, &dw, TRB_TYPE_LINK);
+	if (toggle)
+		FIELD_MODIFY(TRB_LINK_TOGGLE_CYCLE_MASK, &dw, 1);
+	else
+		FIELD_MODIFY(TRB_LINK_TOGGLE_CYCLE_MASK, &dw, 0);
+
+	link_trb->dw3 = cpu_to_le32(dw);
+
+	/* Ensure that link trb is updated */
+	dma_wmb();
+}
+
+static dma_addr_t tran_trb_virt_to_dma(struct crg_udc_ep *udc_ep,
+				       struct transfer_trb_s *trb)
+{
+	unsigned long offset;
+	int trb_idx;
+	dma_addr_t dma_addr = 0;
+
+	trb_idx = trb - udc_ep->first_trb;
+	if (unlikely(trb_idx < 0))
+		return 0;
+
+	offset = trb_idx * sizeof(*trb);
+	if (unlikely(offset >= udc_ep->tran_ring_info.len))
+		return 0;
+	dma_addr = udc_ep->tran_ring_info.dma_addr + offset;
+	return dma_addr;
+}
+
+static struct transfer_trb_s *tran_trb_dma_to_virt(struct crg_udc_ep *udc_ep,
+						   dma_addr_t address)
+{
+	unsigned long offset;
+	struct transfer_trb_s *trb_virt;
+
+	if (lower_32_bits(address) & 0xf)
+		return NULL;
+
+	offset = address - udc_ep->tran_ring_info.dma_addr;
+	if (unlikely(offset >= udc_ep->tran_ring_info.len))
+		return NULL;
+	offset = offset / sizeof(struct transfer_trb_s);
+	trb_virt = udc_ep->first_trb + offset;
+	return trb_virt;
+}
+
+static dma_addr_t event_trb_virt_to_dma(struct crg_udc_event *udc_event,
+					struct event_trb_s *event)
+{
+	dma_addr_t dma_addr = 0;
+	unsigned long seg_offset;
+
+	if (!udc_event || !event)
+		return 0;
+
+	if ((void *)event < udc_event->event_ring.cpu_addr ||
+	    (void *)event >= udc_event->event_ring.cpu_addr +
+			     udc_event->event_ring.len)
+		return 0;
+
+	seg_offset = (void *)event - udc_event->event_ring.cpu_addr;
+	dma_addr = udc_event->event_ring.dma_addr + seg_offset;
+
+	return dma_addr;
+}
+
+/*
+ * Undo whatever crg_udc_ep_queue() mapped for this request: the merged
+ * SG list, the single buffer, or neither if the request carried a
+ * pre-mapped DMA address.
+ */
+static void crg_udc_unmap_request(struct crg_udc_ep *udc_ep,
+				  struct crg_udc_request *udc_req)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	struct usb_request *req = &udc_req->usb_req;
+	bool is_in = udc_req->map_dir == DMA_TO_DEVICE;
+
+	if (req->num_mapped_sgs || req->dma_mapped)
+		usb_gadget_unmap_request_by_dev(crg_udc->dev, req, is_in);
+
+	if (udc_req->mapped) {
+		req->dma = DMA_MAPPING_ERROR;
+		udc_req->mapped = false;
+	}
+
+	udc_req->sg = NULL;
+	udc_req->sg_index = 0;
+	udc_req->sg_offset = 0;
+}
+
+static int crg_udc_sg_init(struct crg_udc_request *udc_req)
+{
+	struct scatterlist *sg;
+	unsigned int i;
+
+	for_each_sg(udc_req->usb_req.sg, sg, udc_req->usb_req.num_sgs, i) {
+		if (sg_dma_len(sg)) {
+			udc_req->sg = sg;
+			udc_req->sg_index = i;
+			udc_req->sg_offset = 0;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static bool crg_udc_sg_current(struct crg_udc_request *udc_req,
+			       dma_addr_t *dma, u32 *len)
+{
+	struct scatterlist *sg = udc_req->sg;
+
+	while (sg && udc_req->sg_index < udc_req->usb_req.num_sgs &&
+	       !sg_dma_len(sg)) {
+		sg = sg_next(sg);
+		udc_req->sg_index++;
+		udc_req->sg_offset = 0;
+	}
+
+	if (!sg || udc_req->sg_index >= udc_req->usb_req.num_sgs)
+		return false;
+
+	if (udc_req->sg_offset >= sg_dma_len(sg))
+		return false;
+
+	*dma = sg_dma_address(sg) + udc_req->sg_offset;
+	*len = sg_dma_len(sg) - udc_req->sg_offset;
+	return true;
+}
+
+static bool crg_udc_sg_advance(struct crg_udc_request *udc_req, u32 bytes)
+{
+	struct scatterlist *sg = udc_req->sg;
+	unsigned int i = udc_req->sg_index;
+
+	while (bytes) {
+		u32 len;
+
+		if (!sg || i >= udc_req->usb_req.num_sgs)
+			return false;
+
+		len = sg_dma_len(sg);
+		if (!len || udc_req->sg_offset == len) {
+			sg = sg_next(sg);
+			i++;
+			udc_req->sg_offset = 0;
+			continue;
+		}
+
+		len -= udc_req->sg_offset;
+		if (bytes < len) {
+			udc_req->sg_offset += bytes;
+			bytes = 0;
+			break;
+		}
+
+		bytes -= len;
+		sg = sg_next(sg);
+		i++;
+		udc_req->sg_offset = 0;
+	}
+
+	udc_req->sg = sg;
+	udc_req->sg_index = i;
+	return true;
+}
+
+/*
+ * Complete a request and give it back to the gadget layer via the
+ * standard usb_gadget_giveback_request() helper.
+ *
+ * Must be called with udc_lock held and interrupts disabled.
+ *
+ * The request's ->complete() callback must not sleep. req_done() drops
+ * udc_lock before the giveback and re-acquires it before returning.
+ * Callers therefore cannot assume state protected by udc_lock is
+ * unchanged across this call.
+ */
+static void req_done(struct crg_udc_ep *udc_ep, struct crg_udc_request *udc_req,
+		     int status, unsigned long *flags)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+
+	if (likely(udc_req->usb_req.status == -EINPROGRESS))
+		udc_req->usb_req.status = status;
+
+	list_del_init(&udc_req->queue);
+
+	crg_udc_unmap_request(udc_ep, udc_req);
+
+	if (udc_req->usb_req.complete) {
+		spin_unlock(&crg_udc->udc_lock);
+		usb_gadget_giveback_request(&udc_ep->usb_ep, &udc_req->usb_req);
+		spin_lock(&crg_udc->udc_lock);
+	}
+}
+
+static void crg_udc_ep_nuke(struct crg_udc_ep *udc_ep, int status,
+			    unsigned long *flags)
+{
+	struct crg_udc_request *req = NULL;
+
+	while (!list_empty(&udc_ep->queue)) {
+		req = list_entry(udc_ep->queue.next, struct crg_udc_request,
+				 queue);
+
+		req_done(udc_ep, req, status, flags);
+	}
+}
+
+static void clear_req_container(struct crg_udc_request *udc_req_ptr)
+{
+	udc_req_ptr->buff_len_left = 0;
+	udc_req_ptr->trbs_needed = 0;
+	udc_req_ptr->all_trbs_queued = 0;
+	udc_req_ptr->first_trb = NULL;
+	udc_req_ptr->last_trb = NULL;
+	udc_req_ptr->short_pkt = false;
+	udc_req_ptr->sg = NULL;
+	udc_req_ptr->sg_index = 0;
+	udc_req_ptr->sg_offset = 0;
+}
+
+static bool is_pointer_less_than(struct transfer_trb_s *a,
+				 struct transfer_trb_s *b,
+				 struct crg_udc_ep *udc_ep)
+{
+	if (!a || !b || !udc_ep->first_trb || !udc_ep->last_trb)
+		return false;
+	if (b > a && (udc_ep->enq_pt >= b || udc_ep->enq_pt < a))
+		return true;
+	if (b < a && (udc_ep->enq_pt >= b && udc_ep->enq_pt < a))
+		return true;
+	return false;
+}
+
+/* num_trbs here is the size of the ring. */
+static u32 room_on_ring(struct crg_gadget_dev *crg_udc, u32 num_trbs,
+			struct transfer_trb_s *p_ring,
+			struct transfer_trb_s *enq_pt,
+			struct transfer_trb_s *dq_pt)
+{
+	u32 i = 0;
+
+	if (enq_pt == dq_pt) {
+		/* ring is empty */
+		return num_trbs - 1;
+	}
+
+	while (enq_pt != dq_pt) {
+		i++;
+
+		enq_pt++;
+
+		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(enq_pt->dw3)) ==
+		    TRB_TYPE_LINK)
+			enq_pt = p_ring;
+
+		if (i > num_trbs)
+			break;
+	}
+
+	return i - 1;
+}
+
+static int crg_udc_epcx_setup(struct crg_udc_ep *udc_ep)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	const struct usb_endpoint_descriptor *desc = udc_ep->desc;
+	const struct usb_ss_ep_comp_descriptor *comp_desc = udc_ep->comp_desc;
+	u8 dci = udc_ep->dci;
+	struct ep_cx_s *epcx = &crg_udc->p_epcx[dci - 2];
+	enum crg_ep_type ep_type;
+	u16 maxburst = 0;
+	u8 maxstreams = 0;
+	u16 maxsize;
+	u32 dw;
+
+	/* corigine gadget dir should be opposite to host dir */
+	if (usb_endpoint_dir_out(desc))
+		ep_type = usb_endpoint_type(desc) + EP_TYPE_INVALID2;
+	else
+		ep_type = usb_endpoint_type(desc);
+
+	maxsize = usb_endpoint_maxp(desc) & 0x07ff;
+
+	if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+		if (!comp_desc)
+			return -EINVAL;
+		maxburst = comp_desc->bMaxBurst;
+
+		if (usb_endpoint_xfer_bulk(udc_ep->desc))
+			maxstreams = comp_desc->bmAttributes & 0x1f;
+
+	} else if ((crg_udc->gadget.speed == USB_SPEED_HIGH ||
+		    crg_udc->gadget.speed == USB_SPEED_FULL) &&
+		   (usb_endpoint_xfer_int(udc_ep->desc) ||
+		    usb_endpoint_xfer_isoc(udc_ep->desc))) {
+		if (crg_udc->gadget.speed == USB_SPEED_HIGH)
+			maxburst = (usb_endpoint_maxp(desc) >> 11) & 0x3;
+		if (maxburst == 0x3) {
+			dev_err(crg_udc->dev, "invalid maxburst\n");
+			maxburst = 0x2;
+		}
+	}
+
+	/* fill ep_dw0 */
+	dw = 0;
+	FIELD_MODIFY(EP_CX_LOGICAL_EP_NUM_MASK, &dw, udc_ep->dci / 2);
+	FIELD_MODIFY(EP_CX_INTERVAL_MASK, &dw, desc->bInterval);
+	if (maxstreams) {
+		dev_err(crg_udc->dev, "maxstream=%d is not expected\n",
+			maxstreams);
+	}
+	epcx->dw0 = cpu_to_le32(dw);
+
+	/* fill ep_dw1 */
+	dw = 0;
+	FIELD_MODIFY(EP_CX_EP_TYPE_MASK, &dw, ep_type);
+	FIELD_MODIFY(EP_CX_MAX_PACKET_SIZE_MASK, &dw, maxsize);
+	FIELD_MODIFY(EP_CX_MAX_BURST_SIZE_MASK, &dw, maxburst);
+	epcx->dw1 = cpu_to_le32(dw);
+
+	/* fill ep_dw2 */
+	dw = lower_32_bits(udc_ep->tran_ring_info.dma_addr) &
+	     EP_CX_TR_DQPT_LO_MASK;
+	FIELD_MODIFY(EP_CX_DEQ_CYC_STATE_MASK, &dw, udc_ep->pcs);
+	epcx->dw2 = cpu_to_le32(dw);
+
+	/* fill ep_dw3 */
+	dw = upper_32_bits(udc_ep->tran_ring_info.dma_addr);
+	epcx->dw3 = cpu_to_le32(dw);
+	/* Ensure that epcx is updated */
+	dma_wmb();
+	return 0;
+}
+
+static int crg_udc_epcx_update_dqptr(struct crg_udc_ep *udc_ep)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep->crg_udc;
+	u8 dci = udc_ep->dci;
+	struct ep_cx_s *epcx = &crg_udc->p_epcx[dci - 2];
+	u32 dw;
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+
+	if (dci == 0) {
+		dev_err(crg_udc->dev, "cannot update dqptr for ep0\n");
+		return -EINVAL;
+	}
+
+	dqptaddr = tran_trb_virt_to_dma(udc_ep, udc_ep->deq_pt);
+
+	if (dma_mapping_error(crg_udc->dev, dqptaddr))
+		return -EINVAL;
+
+	/* fill ep_dw2 */
+	dw = lower_32_bits(dqptaddr) & EP_CX_TR_DQPT_LO_MASK;
+	FIELD_MODIFY(EP_CX_DEQ_CYC_STATE_MASK, &dw, udc_ep->pcs);
+	epcx->dw2 = cpu_to_le32(dw);
+
+	/* fill ep_dw3 */
+	dw = upper_32_bits(dqptaddr);
+	epcx->dw3 = cpu_to_le32(dw);
+
+	cmd_param0 = BIT(udc_ep->dci);
+	/* Ensure that dqptr is updated */
+	dma_wmb();
+
+	return crg_issue_command(crg_udc, CRG_CMD_SET_TR_DQPTR, cmd_param0, 0);
+}
+
+static void setup_status_trb(struct crg_gadget_dev *crg_udc,
+			     struct transfer_trb_s *p_trb,
+			     struct usb_request *usb_req, u8 pcs, u8 set_addr,
+			     u8 stall)
+{
+	u32 tmp, dir = 0;
+
+	/* There are some cases where setup_status_trb() is called with
+	 * usb_req set to NULL.
+	 */
+	p_trb->dw0 = cpu_to_le32(0);
+	p_trb->dw1 = cpu_to_le32(0);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_INTR_TARGET_MASK, &tmp, 0);
+	p_trb->dw2 = cpu_to_le32(tmp);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_CYCLE_BIT_MASK, &tmp, pcs);
+	FIELD_MODIFY(TRB_INTR_ON_COMPLETION_MASK, &tmp, 1);
+	FIELD_MODIFY(TRB_TYPE_MASK, &tmp, TRB_TYPE_XFER_STATUS_STAGE);
+
+	dir = (crg_udc->setup_status == STATUS_STAGE_XFER) ? 0 : 1;
+	FIELD_MODIFY(DATA_STAGE_TRB_DIR_MASK, &tmp, dir);
+
+	FIELD_MODIFY(TRB_SETUP_TAG_MASK, &tmp, crg_udc->setup_tag);
+	FIELD_MODIFY(STATUS_STAGE_TRB_STALL_MASK, &tmp, stall);
+	FIELD_MODIFY(STATUS_STAGE_TRB_SET_ADDR_MASK, &tmp, set_addr);
+
+	p_trb->dw3 = cpu_to_le32(tmp);
+	/* Ensure that status trb is updated */
+	dma_wmb();
+}
+
+static void knock_doorbell(struct crg_gadget_dev *crg_udc, int dci)
+{
+	u32 tmp;
+	struct crg_uccr __iomem *uccr;
+
+	uccr = crg_udc->uccr;
+	/* Ensure everything is written before notifying the HW */
+	dma_wmb();
+
+	tmp = FIELD_PREP(CRG_U3DC_DB_TARGET_MASK, dci);
+	writel(tmp, &uccr->doorbell);
+}
+
+static u32 crg_trb_chunk_len(dma_addr_t dma, u64 remaining)
+{
+	u32 boundary = TRB_MAX_BUFFER_SIZE -
+		       (lower_32_bits(dma) & (TRB_MAX_BUFFER_SIZE - 1));
+
+	return min_t(u64, remaining, boundary);
+}
+
+static void setup_datastage_trb(struct transfer_trb_s *p_trb,
+				dma_addr_t dma,
+				u8 pcs, u32 transfer_length,
+				u32 td_size, u8 ioc, u8 azp, u8 dir, u8 setup_tag)
+{
+	u32 tmp;
+
+	p_trb->dw0 = cpu_to_le32(lower_32_bits(dma));
+	p_trb->dw1 = cpu_to_le32(upper_32_bits(dma));
+
+	/* TRB_Transfer_Length
+	 * For USB_DIR_OUT, this field is the number of data bytes expected
+	 * from xhc. For USB_DIR_IN, this field is the number of data bytes
+	 * the device will send.
+	 */
+	tmp = 0;
+	FIELD_MODIFY(TRB_TRANSFER_LEN_MASK, &tmp, transfer_length);
+	FIELD_MODIFY(TRB_TD_SIZE_MASK, &tmp, td_size);
+	FIELD_MODIFY(TRB_INTR_TARGET_MASK, &tmp, 0);
+	p_trb->dw2 = cpu_to_le32(tmp);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_CYCLE_BIT_MASK, &tmp, pcs);
+	FIELD_MODIFY(TRB_INTR_ON_SHORT_PKT_MASK, &tmp, 1);
+	FIELD_MODIFY(TRB_INTR_ON_COMPLETION_MASK, &tmp, ioc);
+	FIELD_MODIFY(TRB_TYPE_MASK, &tmp, TRB_TYPE_XFER_DATA_STAGE);
+	FIELD_MODIFY(TRB_APPEND_ZLP_MASK, &tmp, azp);
+	FIELD_MODIFY(DATA_STAGE_TRB_DIR_MASK, &tmp, dir);
+	FIELD_MODIFY(TRB_SETUP_TAG_MASK, &tmp, setup_tag);
+
+	p_trb->dw3 = cpu_to_le32(tmp);
+	/* Ensure that datastage trb is updated */
+	dma_wmb();
+}
+
+static void setup_trb(struct transfer_trb_s *p_trb, u32 xfer_len,
+		      dma_addr_t xfer_buf_addr, u8 td_size, u8 pcs,
+		      u8 trb_type, u8 short_pkt, u8 chain_bit,
+		      u8 intr_on_compl, bool b_setup_stage, u8 usb_dir,
+		      bool b_isoc, u16 frame_id, u8 sia, u8 azp)
+{
+	u32 tmp;
+
+	p_trb->dw0 = cpu_to_le32(lower_32_bits(xfer_buf_addr));
+	p_trb->dw1 = cpu_to_le32(upper_32_bits(xfer_buf_addr));
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_TRANSFER_LEN_MASK, &tmp, xfer_len);
+	FIELD_MODIFY(TRB_TD_SIZE_MASK, &tmp, td_size);
+	FIELD_MODIFY(TRB_INTR_TARGET_MASK, &tmp, 0);
+
+	p_trb->dw2 = cpu_to_le32(tmp);
+
+	tmp = 0;
+	FIELD_MODIFY(TRB_CYCLE_BIT_MASK, &tmp, pcs);
+	FIELD_MODIFY(TRB_INTR_ON_SHORT_PKT_MASK, &tmp, short_pkt);
+	FIELD_MODIFY(TRB_CHAIN_BIT_MASK, &tmp, chain_bit);
+	FIELD_MODIFY(TRB_INTR_ON_COMPLETION_MASK, &tmp, intr_on_compl);
+	FIELD_MODIFY(TRB_APPEND_ZLP_MASK, &tmp, azp);
+	FIELD_MODIFY(TRB_TYPE_MASK, &tmp, trb_type);
+
+	if (b_setup_stage)
+		FIELD_MODIFY(DATA_STAGE_TRB_DIR_MASK, &tmp, usb_dir);
+
+	if (b_isoc) {
+		FIELD_MODIFY(ISOC_TRB_FRAME_ID_MASK, &tmp, frame_id);
+		FIELD_MODIFY(ISOC_TRB_SIA_MASK, &tmp, sia);
+	}
+
+	p_trb->dw3 = cpu_to_le32(tmp);
+	/* Ensure that trb is updated */
+	dma_wmb();
+}
+
+static int crg_udc_queue_trbs(struct crg_udc_ep *udc_ep_ptr,
+			      struct crg_udc_request *udc_req_ptr,
+			      bool b_isoc, u32 xfer_ring_size,
+			      u32 num_trbs_needed, u64 buffer_length)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct transfer_trb_s *p_xfer_ring = udc_ep_ptr->first_trb;
+	struct transfer_trb_s *enq_pt = udc_ep_ptr->enq_pt;
+	struct usb_request *usb_req = &udc_req_ptr->usb_req;
+	u32 num_trbs_ava, count, i;
+	u32 td_trbs;
+	u32 td_size;
+	u32 j = 1;
+	u32 intr_rate = b_isoc ? ISOC_EP_INTERRUPT_RATE :
+		BULK_EP_INTERRUPT_RATE;
+	bool full_td = true;
+	bool need_zlp = false;
+	bool is_sg = usb_req->num_mapped_sgs;
+
+	if (!b_isoc && usb_req->zero && usb_req->length &&
+	    !(usb_req->length % udc_ep_ptr->usb_ep.maxpacket))
+		need_zlp = true;
+
+	if (!num_trbs_needed)
+		return -EINVAL;
+
+	/* TD_SIZE is five bits and encodes the number of TRBs remaining
+	 * in this TD minus one. A request may contain multiple TDs.
+	 */
+	td_trbs = min_t(u32, num_trbs_needed, 32);
+
+	num_trbs_ava = room_on_ring(crg_udc, xfer_ring_size, p_xfer_ring,
+				    udc_ep_ptr->enq_pt, udc_ep_ptr->deq_pt);
+	if (num_trbs_ava < td_trbs) {
+		if (b_isoc)
+			return -EBUSY;
+		count = num_trbs_ava;
+		full_td = false;
+		udc_ep_ptr->tran_ring_full = true;
+		need_zlp = false;
+	} else {
+		count = td_trbs;
+	}
+
+	if (!count)
+		return -ENOSPC;
+
+	td_size = count - 1;
+
+	if (is_sg && !udc_req_ptr->sg && crg_udc_sg_init(udc_req_ptr))
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		dma_addr_t trb_buf_addr;
+		u32 trb_len, sg_len = 0;
+		u8 chain_bit = 1;
+		u8 ioc = 0;
+		u8 short_pkt = usb_endpoint_dir_out(udc_ep_ptr->desc);
+
+		if (is_sg) {
+			if (!crg_udc_sg_current(udc_req_ptr, &trb_buf_addr,
+						&sg_len))
+				return -EINVAL;
+			if (!sg_len || dma_mapping_error(crg_udc->dev, trb_buf_addr))
+				return -EINVAL;
+			trb_len = min_t(u64, buffer_length,
+					min_t(u32, sg_len,
+					      crg_trb_chunk_len(trb_buf_addr,
+								buffer_length)));
+		} else {
+			if (buffer_length)
+				trb_buf_addr = usb_req->dma +
+					(usb_req->length - buffer_length);
+			else
+				trb_buf_addr = 0;
+			trb_len = crg_trb_chunk_len(trb_buf_addr, buffer_length);
+		}
+
+		if (!trb_len && buffer_length)
+			return -EINVAL;
+
+		buffer_length -= trb_len;
+		if (i == count - 1) {
+			chain_bit = 0;
+			ioc = 1;
+			if (!buffer_length)
+				udc_req_ptr->all_trbs_queued = true;
+		}
+
+		if (!full_td && j == intr_rate) {
+			ioc = 1;
+			j = 0;
+		}
+
+		if (b_isoc) {
+			setup_trb(enq_pt, trb_len, trb_buf_addr, td_size,
+				  udc_ep_ptr->pcs, TRB_TYPE_XFER_DATA_ISOCH,
+				  short_pkt, chain_bit, ioc, false, 0, true, 0, 1, 0);
+		} else {
+			u8 azp = ioc && !chain_bit && need_zlp;
+
+			setup_trb(enq_pt, trb_len, trb_buf_addr, td_size,
+				  udc_ep_ptr->pcs, TRB_TYPE_XFER_NORMAL, short_pkt,
+				  chain_bit, ioc, false, 0, false, 0, 0, azp);
+		}
+
+		if (is_sg && !crg_udc_sg_advance(udc_req_ptr, trb_len))
+			return -EINVAL;
+
+		td_size--;
+		enq_pt++;
+		j++;
+
+		if (enq_pt == udc_ep_ptr->last_trb) {
+			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
+					   TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->pcs ^= 1;
+			dma_wmb();
+			enq_pt = udc_ep_ptr->first_trb;
+		}
+	}
+
+	if (!udc_req_ptr->trbs_needed)
+		udc_req_ptr->first_trb = udc_ep_ptr->enq_pt;
+
+	udc_ep_ptr->enq_pt = enq_pt;
+	udc_req_ptr->buff_len_left = buffer_length;
+	if (buffer_length)
+		udc_req_ptr->trbs_needed = num_trbs_needed - count;
+	else
+		udc_req_ptr->trbs_needed = 0;
+
+	if (!udc_req_ptr->buff_len_left) {
+		if (udc_ep_ptr->enq_pt == udc_req_ptr->first_trb)
+			udc_req_ptr->last_trb = udc_ep_ptr->last_trb - 1;
+		else
+			udc_req_ptr->last_trb = udc_ep_ptr->enq_pt - 1;
+	}
+
+	return 0;
+}
+
+static int crg_udc_queue_ctrl(struct crg_udc_ep *udc_ep_ptr,
+			      struct crg_udc_request *udc_req_ptr,
+			      u32 num_of_trbs_needed)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	enum ep_state ep_state;
+	struct transfer_trb_s *enq_pt = udc_ep_ptr->enq_pt;
+	struct transfer_trb_s *dq_pt = udc_ep_ptr->deq_pt;
+	struct usb_request *usb_req = &udc_req_ptr->usb_req;
+	struct transfer_trb_s *p_trb;
+	u32 transfer_length;
+	u8 ioc;
+	u8 azp;
+	u8 dir = 0;
+	u8 setup_tag = crg_udc->setup_tag;
+
+	/* A new SETUP aborts the previous EP0 transaction. The completion
+	 * callback of the aborted request is allowed to run, but it must not
+	 * requeue the old request before the new SETUP has been handed to the
+	 * gadget driver.
+	 */
+	if (crg_udc->ep0_state == EP0_STATE_ABORTING)
+		return -ECONNRESET;
+
+	ep_state = get_ep_state(crg_udc, 0);
+	/* Need to queue the request even ep is paused or halted */
+	if (ep_state != EP_STATE_RUNNING) {
+		dev_dbg(crg_udc->dev, "EP State = 0x%x\n", ep_state);
+		return -EINVAL;
+	}
+	if (list_empty(&udc_ep_ptr->queue)) {
+		/* For control endpoint, we can handle one setup request at a
+		 * time. so if there are TD pending in the transfer ring.
+		 * wait for the sequence number error event. Then put the new
+		 * request to transfer ring
+		 */
+		if (enq_pt == dq_pt) {
+			u32 i;
+			bool need_zlp = false;
+			dma_addr_t trb_dma = usb_req->dma;
+			u64 remaining = usb_req->length;
+			/* Transfer ring is empty
+			 * setup data stage TRBs
+			 */
+			udc_req_ptr->first_trb = udc_ep_ptr->enq_pt;
+			if (crg_udc->setup_status == DATA_STAGE_XFER)
+				dir = 0;
+			else if (crg_udc->setup_status == DATA_STAGE_RECV)
+				dir = 1;
+			else
+				dev_dbg(crg_udc->dev,
+					"unexpected setup_status!%d\n",
+					crg_udc->setup_status);
+			if (udc_req_ptr->usb_req.zero == 1 &&
+			    udc_req_ptr->usb_req.length != 0 &&
+			    ((udc_req_ptr->usb_req.length %
+			      udc_ep_ptr->usb_ep.maxpacket) == 0))
+				need_zlp = true; /* zero length packet */
+			if (num_of_trbs_needed > 32)
+				return -EMSGSIZE;
+
+			if (num_of_trbs_needed >
+			    room_on_ring(crg_udc, CRGUDC_CONTROL_EP_TD_RING_SIZE,
+					 udc_ep_ptr->first_trb, enq_pt, dq_pt))
+				return -ENOSPC;
+
+			for (i = 0; i < num_of_trbs_needed; i++) {
+				p_trb = enq_pt;
+				transfer_length = crg_trb_chunk_len(trb_dma, remaining);
+				ioc = (i == num_of_trbs_needed - 1);
+				azp = ioc && need_zlp;
+				setup_datastage_trb(p_trb, trb_dma,
+						    udc_ep_ptr->pcs, transfer_length,
+						    num_of_trbs_needed - i - 1,
+						    ioc, azp, dir, setup_tag);
+				udc_req_ptr->all_trbs_queued = 1;
+				trb_dma += transfer_length;
+				remaining -= transfer_length;
+				enq_pt++;
+				if (FIELD_GET(TRB_TYPE_MASK,
+					      le32_to_cpu(enq_pt->dw3)) ==
+				    TRB_TYPE_LINK) {
+					if (FIELD_GET(TRB_LINK_TOGGLE_CYCLE_MASK,
+						      le32_to_cpu(enq_pt->dw3))) {
+						le32p_replace_bits(&enq_pt->dw3,
+								   udc_ep_ptr->pcs,
+								   TRB_CYCLE_BIT_MASK);
+						udc_ep_ptr->pcs ^= 0x1;
+					}
+					/* Ensure that trb cycle bit is updated
+					 */
+					dma_wmb();
+					enq_pt = udc_ep_ptr->first_trb;
+				}
+			}
+			udc_ep_ptr->enq_pt = enq_pt;
+			knock_doorbell(crg_udc, 0);
+			if (udc_ep_ptr->enq_pt == udc_ep_ptr->first_trb)
+				udc_req_ptr->last_trb =
+					udc_ep_ptr->last_trb - 1;
+			else
+				udc_req_ptr->last_trb = udc_ep_ptr->enq_pt - 1;
+		} else {
+			/*
+			 * The software queue is empty but the transfer ring
+			 * still holds pending TDs from a previous control
+			 * transfer (the host issued a new setup before the
+			 * old one drained). We process one setup at a time,
+			 * so we intentionally do not queue TRBs here.
+			 * Returning success leaves this request on the
+			 * endpoint queue; the stale TDs and this request are
+			 * flushed and completed (with -EINVAL) by the
+			 * sequence-number-error / setup-tag-mismatch event in
+			 * crg_handle_xfer_event().
+			 */
+			dev_err(crg_udc->dev,
+				"ep0 ring not idle on new setup\n");
+		}
+	} else {
+		dev_err(crg_udc->dev, "udc_ep_ptr->queue not empty\n");
+		/* New setup packet came
+		 * Drop this request.
+		 */
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void build_ep0_status(struct crg_udc_ep *udc_ep_ptr, bool default_value,
+			     u32 status, struct crg_udc_request *udc_req_ptr,
+			     u8 set_addr, u8 stall)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct transfer_trb_s *enq_pt = udc_ep_ptr->enq_pt;
+
+	if (default_value) {
+		udc_req_ptr = crg_udc->status_req;
+		udc_req_ptr->usb_req.length = 0;
+		udc_req_ptr->usb_req.status = status;
+		udc_req_ptr->usb_req.actual = 0;
+		udc_req_ptr->usb_req.complete = NULL;
+	} else {
+		udc_req_ptr->usb_req.status = status;
+		udc_req_ptr->usb_req.actual = 0;
+	}
+
+	setup_status_trb(crg_udc, enq_pt, &udc_req_ptr->usb_req,
+			 udc_ep_ptr->pcs, set_addr, stall);
+
+	enq_pt++;
+
+	/* check if we are at end of trb segment.  If so, update
+	 * pcs and enq for next segment
+	 */
+	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(enq_pt->dw3)) == TRB_TYPE_LINK) {
+		if (FIELD_GET(TRB_LINK_TOGGLE_CYCLE_MASK,
+			      le32_to_cpu(enq_pt->dw3))) {
+			le32p_replace_bits(&enq_pt->dw3, udc_ep_ptr->pcs,
+					   TRB_CYCLE_BIT_MASK);
+			udc_ep_ptr->pcs ^= 0x1;
+		}
+		enq_pt = udc_ep_ptr->first_trb;
+	}
+	udc_ep_ptr->enq_pt = enq_pt;
+
+	knock_doorbell(crg_udc, 0);
+
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+}
+
+static void crg_handle_setup_pkt(struct crg_gadget_dev *crg_udc,
+				 struct usb_ctrlrequest *setup_pkt,
+				 u8 setup_tag, unsigned long *flags);
+
+static void ep0_req_complete(struct crg_udc_ep *udc_ep_ptr,
+			     unsigned long *flags)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+
+	switch (crg_udc->setup_status) {
+	case DATA_STAGE_XFER:
+		crg_udc->setup_status = STATUS_STAGE_RECV;
+		build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL, 0, 0);
+		break;
+	case DATA_STAGE_RECV:
+		crg_udc->setup_status = STATUS_STAGE_XFER;
+		build_ep0_status(udc_ep_ptr, true, -EINPROGRESS, NULL, 0, 0);
+		break;
+	default:
+		if (crg_udc->setup_fn_call_back)
+			crg_udc->setup_fn_call_back(crg_udc);
+
+		crg_udc->setup_status = WAIT_FOR_SETUP;
+		break;
+	}
+}
+
+static void update_dequeue_pt(struct event_trb_s *event,
+			      struct crg_udc_ep *udc_ep)
+{
+	u32 deq_pt_lo = le32_to_cpu(event->dw0);
+	u32 deq_pt_hi = le32_to_cpu(event->dw1);
+	u64 dq_pt_addr = (u64)deq_pt_lo | ((u64)deq_pt_hi << 32);
+	struct transfer_trb_s *deq_pt;
+
+	deq_pt = tran_trb_dma_to_virt(udc_ep, dq_pt_addr);
+	if (!deq_pt)
+		return;
+	deq_pt++;
+	if (deq_pt == udc_ep->last_trb)
+		deq_pt = udc_ep->first_trb;
+
+	if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(deq_pt->dw3)) == TRB_TYPE_LINK)
+		deq_pt = udc_ep->first_trb;
+
+	udc_ep->deq_pt = deq_pt;
+}
+
+static void advance_dequeue_pt(struct crg_udc_ep *udc_ep)
+{
+	struct crg_udc_request *udc_req;
+
+	if (!list_empty(&udc_ep->queue)) {
+		udc_req = list_entry(udc_ep->queue.next, struct crg_udc_request,
+				     queue);
+
+		if (udc_req->first_trb)
+			udc_ep->deq_pt = udc_req->first_trb;
+		else
+			udc_ep->deq_pt = udc_ep->enq_pt;
+	} else {
+		udc_ep->deq_pt = udc_ep->enq_pt;
+	}
+}
+
+static bool is_request_dequeued(struct crg_gadget_dev *crg_udc,
+				struct crg_udc_ep *udc_ep,
+				struct event_trb_s *event)
+{
+	struct crg_udc_request *udc_req;
+	u32 trb_pt_lo = le32_to_cpu(event->dw0);
+	u32 trb_pt_hi = le32_to_cpu(event->dw1);
+	u64 trb_addr = (u64)trb_pt_lo | ((u64)trb_pt_hi << 32);
+	struct transfer_trb_s *trb_pt;
+	bool status = true;
+
+	if (udc_ep->dci == 0  || list_empty(&udc_ep->queue))
+		return false;
+
+	trb_pt = tran_trb_dma_to_virt(udc_ep, trb_addr);
+	if (!trb_pt)
+		return false;
+	list_for_each_entry(udc_req, &udc_ep->queue, queue) {
+		if (trb_pt == udc_req->last_trb ||
+		    trb_pt == udc_req->first_trb) {
+			status = false;
+			break;
+		}
+
+		if (is_pointer_less_than(trb_pt, udc_req->last_trb, udc_ep) &&
+		    is_pointer_less_than(udc_req->first_trb, trb_pt, udc_ep)) {
+			status = false;
+			break;
+		}
+	}
+
+	return status;
+}
+
+static unsigned int count_trbs_linear(dma_addr_t addr, u64 len)
+{
+	unsigned int num_trbs = 0;
+
+	while (len) {
+		u32 chunk = crg_trb_chunk_len(addr, len);
+
+		if (!chunk)
+			return 0;
+		num_trbs++;
+		addr += chunk;
+		len -= chunk;
+	}
+
+	return num_trbs;
+}
+
+static unsigned int count_trbs_sg(struct crg_udc_request *udc_req)
+{
+	struct scatterlist *sg;
+	u64 remaining = udc_req->usb_req.length;
+	unsigned int i;
+	unsigned int num_trbs = 0;
+
+	for_each_sg(udc_req->usb_req.sg, sg, udc_req->usb_req.num_sgs, i) {
+		dma_addr_t addr;
+		u64 len;
+
+		if (!sg_dma_len(sg))
+			continue;
+		if (!remaining)
+			break;
+
+		len = min_t(u64, sg_dma_len(sg), remaining);
+		addr = sg_dma_address(sg);
+		while (len) {
+			u32 chunk = crg_trb_chunk_len(addr, len);
+
+			if (!chunk)
+				return 0;
+			num_trbs++;
+			addr += chunk;
+			len -= chunk;
+			remaining -= chunk;
+		}
+	}
+
+	return remaining ? 0 : num_trbs;
+}
+
+static int crg_udc_build_td(struct crg_udc_ep *udc_ep_ptr,
+			    struct crg_udc_request *udc_req_ptr)
+{
+	int status = 0;
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	u32 num_trbs_needed;
+	u64 buffer_length;
+
+	if (udc_req_ptr->trbs_needed) {
+		/* If this is called to complete pending TRB transfers
+		 * of previous Request
+		 */
+		buffer_length = udc_req_ptr->buff_len_left;
+		num_trbs_needed = udc_req_ptr->trbs_needed;
+	} else {
+		buffer_length = udc_req_ptr->usb_req.length;
+		if (udc_req_ptr->usb_req.num_mapped_sgs)
+			num_trbs_needed = count_trbs_sg(udc_req_ptr);
+		else
+			num_trbs_needed = count_trbs_linear(udc_req_ptr->usb_req.dma,
+							    buffer_length);
+		if (!num_trbs_needed && buffer_length)
+			return -EINVAL;
+		if (!num_trbs_needed)
+			num_trbs_needed = 1;
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc))
+		status = crg_udc_queue_ctrl(udc_ep_ptr, udc_req_ptr,
+					    num_trbs_needed);
+	else if (usb_endpoint_xfer_isoc(udc_ep_ptr->desc))
+		status = crg_udc_queue_trbs(udc_ep_ptr, udc_req_ptr, true,
+					    CRGUDC_ISOC_EP_TD_RING_SIZE, num_trbs_needed,
+					    buffer_length);
+	else if (usb_endpoint_xfer_bulk(udc_ep_ptr->desc))
+		status = crg_udc_queue_trbs(udc_ep_ptr, udc_req_ptr, false,
+					    CRGUDC_BULK_EP_TD_RING_SIZE, num_trbs_needed,
+					    buffer_length);
+	else
+		/* interrupt endpoint */
+		status = crg_udc_queue_trbs(udc_ep_ptr, udc_req_ptr, false,
+					    CRGUDC_INT_EP_TD_RING_SIZE, num_trbs_needed,
+					    buffer_length);
+
+	if (!status && !usb_endpoint_xfer_control(udc_ep_ptr->desc))
+		knock_doorbell(crg_udc, udc_ep_ptr->dci);
+
+	return status;
+}
+
+/* This function will go through the list of the USB requests for the
+ * given endpoint and schedule any unscheduled trb's to the xfer ring
+ */
+static int queue_pending_trbs(struct crg_udc_ep *udc_ep_ptr)
+{
+	struct crg_udc_request *udc_req_ptr;
+	int ret;
+
+	list_for_each_entry(udc_req_ptr, &udc_ep_ptr->queue, queue) {
+		if (udc_req_ptr->all_trbs_queued)
+			continue;
+
+		ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+		if (ret) {
+			dev_err(udc_ep_ptr->crg_udc->dev,
+				"failed to build pending transfer: %d\n", ret);
+			return ret;
+		}
+		if (udc_ep_ptr->tran_ring_full)
+			break;
+	}
+
+	return 0;
+}
+
+static void squeeze_xfer_ring(struct crg_udc_ep *udc_ep_ptr,
+			      struct crg_udc_request *udc_req_ptr)
+{
+	struct transfer_trb_s *trb = udc_req_ptr->first_trb;
+	struct crg_udc_request *next_req;
+
+	if (!trb)
+		return;
+
+	while (trb != udc_ep_ptr->enq_pt) {
+		memset(trb, 0, sizeof(*trb));
+		trb++;
+		if (trb == udc_ep_ptr->last_trb)
+			trb = udc_ep_ptr->first_trb;
+	}
+
+	udc_ep_ptr->enq_pt = udc_req_ptr->first_trb;
+	udc_ep_ptr->tran_ring_full = false;
+
+	if (list_is_last(&udc_req_ptr->queue, &udc_ep_ptr->queue))
+		return;
+
+	next_req = udc_req_ptr;
+	list_for_each_entry_continue(next_req, &udc_ep_ptr->queue, queue) {
+		int ret;
+
+		next_req->usb_req.status = -EINPROGRESS;
+		next_req->usb_req.actual = 0;
+		clear_req_container(next_req);
+		ret = crg_udc_build_td(udc_ep_ptr, next_req);
+		if (ret) {
+			dev_err(udc_ep_ptr->crg_udc->dev,
+				"failed to rebuild queued request: %d\n", ret);
+			udc_ep_ptr->tran_ring_full = true;
+			break;
+		}
+		if (udc_ep_ptr->tran_ring_full)
+			break;
+	}
+}
+
+static int set_ep0_halt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	enum ep_state ep_state;
+
+	ep_state = get_ep_state(crg_udc, udc_ep_ptr->dci);
+	if (ep_state == EP_STATE_HALTED || ep_state == EP_STATE_DISABLED)
+		return 0;
+
+	build_ep0_status(udc_ep_ptr, true, -EINVAL, NULL, 0, 1);
+
+	udc_ep_ptr->ep_state = EP_STATE_HALTED;
+
+	return 0;
+}
+
+static int set_ep_halt(struct crg_gadget_dev *crg_udc, int dci,
+		       unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[dci];
+	u32 param0;
+	u32 tmp;
+
+	if (dci == 0)
+		return 0;
+
+	if (udc_ep_ptr->ep_state == EP_STATE_DISABLED ||
+	    udc_ep_ptr->ep_state == EP_STATE_HALTED)
+		return 0;
+
+	param0 = BIT(dci);
+	if (crg_issue_command(crg_udc, CRG_CMD_SET_HALT, param0, 0))
+		return -EIO;
+	if (readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+				      !(tmp & param0), 10, 10000))
+		return -ETIMEDOUT;
+	/* clean up the request queue */
+	crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET, flags);
+
+	udc_ep_ptr->deq_pt = udc_ep_ptr->enq_pt;
+	udc_ep_ptr->tran_ring_full = false;
+	udc_ep_ptr->ep_state = EP_STATE_HALTED;
+
+	return 0;
+}
+
+static int ep_halt(struct crg_udc_ep *udc_ep_ptr, int halt, int ignore_wedge,
+		   unsigned long *flags)
+{
+	struct crg_gadget_dev *crg_udc = udc_ep_ptr->crg_udc;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	enum ep_state ep_state;
+	bool reset_seq_only = false;
+	int do_halt;
+	u32 param0;
+	u32 tmp;
+	struct crg_udc_request *udc_req_ptr;
+
+	if (!udc_ep_ptr->desc) {
+		dev_err(crg_udc->dev, "NULL desc\n");
+		return -EINVAL;
+	}
+
+	if (usb_endpoint_xfer_isoc(udc_ep_ptr->desc)) {
+		dev_err(crg_udc->dev, "Isoc ep, halt not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (udc_ep_ptr->dci == 0)
+		return 0;
+
+	ep_state = get_ep_state(crg_udc, udc_ep_ptr->dci);
+
+	if (ep_state == EP_STATE_DISABLED)
+		return 0;
+
+	if (ep_state == EP_STATE_HALTED) {
+		if (halt != 0)
+			return 0;
+
+		/* want unhalt an halted ep */
+		if (udc_ep_ptr->wedge && !ignore_wedge) {
+			do_halt = -1;
+			reset_seq_only = true;
+		} else {
+			do_halt = 0;
+		}
+
+	} else {
+		/* ep state == running or stopped */
+		if (halt != 0) {
+			/* want halt a running ep */
+			do_halt = 1;
+		} else {
+			/* reset a running ep */
+			do_halt = 0;
+			reset_seq_only = true;
+		}
+	}
+
+	param0 = BIT(udc_ep_ptr->dci);
+	if (do_halt == 1) {
+		/* setting ep to halt */
+		if (crg_issue_command(crg_udc, CRG_CMD_SET_HALT, param0, 0))
+			return -EIO;
+		if (readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					      !(tmp & param0), 10, 10000))
+			dev_warn(crg_udc->dev, "ep %d halt wait timed out\n",
+				 udc_ep_ptr->dci);
+
+		if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+			/* clean up the request queue */
+			crg_udc_ep_nuke(udc_ep_ptr, -ECONNRESET, flags);
+
+			udc_ep_ptr->deq_pt = udc_ep_ptr->enq_pt;
+			udc_ep_ptr->tran_ring_full = false;
+		}
+		/* clean up the request queue */
+		udc_ep_ptr->ep_state = EP_STATE_HALTED;
+	} else if (do_halt == 0) {
+		/* clearing ep halt state */
+		/* reset sequence number */
+		if (crg_issue_command(crg_udc, CRG_CMD_RESET_SEQNUM, param0, 0))
+			return -EIO;
+
+		if (!reset_seq_only) {
+			/* Clear halt for a halted EP. */
+			/* NOTE: we must CLEAR_HALT first,
+			 * then SET_TR_DQPTR
+			 */
+			if (crg_issue_command(crg_udc, CRG_CMD_CLEAR_HALT, param0, 0))
+				return -EIO;
+			if (crg_udc_epcx_update_dqptr(udc_ep_ptr))
+				return -EIO;
+		}
+
+		udc_ep_ptr->wedge = 0;
+		udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+		/* set endpoint to running state */
+		/* clear pause for the endpoint */
+		if (!list_empty(&udc_ep_ptr->queue)) {
+			tmp = udc_ep_ptr->dci;
+			tmp = FIELD_PREP(CRG_U3DC_DB_TARGET_MASK, tmp);
+
+			list_for_each_entry(udc_req_ptr, &udc_ep_ptr->queue,
+					    queue) {
+				struct transfer_trb_s *tmp_ptr =
+					udc_ep_ptr->deq_pt + 1;
+
+				if (FIELD_GET(TRB_TYPE_MASK,
+					      le32_to_cpu(tmp_ptr->dw3)) ==
+				    TRB_TYPE_LINK) {
+					udc_ep_ptr->pcs ^= 0x1;
+					if (crg_udc_epcx_update_dqptr(udc_ep_ptr))
+						return -EIO;
+					udc_ep_ptr->pcs ^= 0x1;
+				}
+			}
+			knock_doorbell(crg_udc, udc_ep_ptr->dci);
+		}
+	} else {
+		/* wedged EP deny CLEAR HALT */
+		dev_dbg(crg_udc->dev, "wedged EP deny CLEAR HALT dci = %d\n",
+			udc_ep_ptr->dci);
+		/* reset sequence number */
+		if (reset_seq_only &&
+		    crg_issue_command(crg_udc, CRG_CMD_RESET_SEQNUM, param0, 0))
+			return -EIO;
+	}
+
+	return 0;
+}
+
+/* endpoint operations */
+
+static int crg_udc_ep_disable(struct usb_ep *ep)
+{
+	struct crg_udc_ep *udc_ep;
+	struct crg_gadget_dev *crg_udc;
+	struct ep_cx_s *p_ep_cx;
+	enum ep_state ep_state;
+	struct crg_uccr __iomem *uccr;
+	unsigned long flags = 0;
+	u32 tmp;
+
+	if (!ep)
+		return -EINVAL;
+
+	udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep->crg_udc;
+
+	if (udc_ep->dci == 0)
+		return 0;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	uccr = crg_udc->uccr;
+	p_ep_cx = &crg_udc->p_epcx[udc_ep->dci - 2];
+
+	ep_state = get_ep_state(crg_udc, udc_ep->dci);
+	if (ep_state == EP_STATE_DISABLED) {
+		/* get here if ep is already disabled */
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+
+	/* Maybe we need to halt ep before ep disable */
+
+	/*
+	 * ep_enable is a write-1-to-disable register: endpoints are enabled
+	 * via the CONFIG_EP command, but writing a set bit here disables the
+	 * corresponding endpoint. The hardware clears the bit once the
+	 * endpoint is disabled (crg_udc_reinit() relies on this to disable
+	 * every endpoint by writing back the set bits and polling for zero).
+	 */
+	writel(BIT(udc_ep->dci), &uccr->ep_enable);
+
+	if (readl_poll_timeout_atomic(&uccr->ep_enable, tmp,
+				      !(tmp & BIT(udc_ep->dci)), 10, 10000)) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -ETIMEDOUT;
+	}
+	/* clean up the request queue */
+	crg_udc_ep_nuke(udc_ep, -ESHUTDOWN, &flags);
+
+	/* decrement ep counters */
+	crg_udc->num_enabled_eps--;
+
+	udc_ep->desc = NULL;
+	udc_ep->comp_desc = NULL;
+	/* clean up the endpoint context */
+	memset(p_ep_cx, 0, sizeof(struct ep_cx_s));
+
+	/* If device state was changed to default by port
+	 * reset, should not overwrite it again
+	 */
+	if (crg_udc->num_enabled_eps == 0 &&
+	    crg_udc->device_state == USB_STATE_CONFIGURED) {
+		crg_udc->device_state = USB_STATE_ADDRESS;
+	}
+
+	udc_ep->ep_state = EP_STATE_DISABLED;
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+static inline u32 index2dci(u16 index)
+{
+	if (index == 0)
+		return 0;
+
+	return (index & USB_ENDPOINT_NUMBER_MASK) * 2 +
+		((index & USB_DIR_IN) ? 0 : 1);
+}
+
+static int crg_udc_validate_ep_desc(struct crg_udc_ep *udc_ep,
+				    const struct usb_endpoint_descriptor *desc)
+{
+	const struct usb_ss_ep_comp_descriptor *comp = udc_ep->comp_desc;
+	u16 maxpacket = usb_endpoint_maxp(desc);
+
+	if (usb_endpoint_xfer_control(desc) ||
+	    !maxpacket || maxpacket > CRG_MAX_PACKET_SIZE)
+		return -EINVAL;
+
+	if (index2dci(desc->bEndpointAddress) != udc_ep->dci)
+		return -EINVAL;
+
+	if (usb_endpoint_xfer_bulk(desc) && comp &&
+	    usb_ss_max_streams(comp))
+		return -EOPNOTSUPP;
+
+	if (usb_endpoint_xfer_isoc(desc) && desc->bInterval == 0)
+		return -EINVAL;
+
+	if (udc_ep->crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+		if (!comp || comp->bMaxBurst > 15)
+			return -EINVAL;
+		if (usb_endpoint_xfer_isoc(desc) &&
+		    ((comp->bmAttributes & 0x3) > 2))
+			return -EINVAL;
+	} else if (udc_ep->crg_udc->gadget.speed == USB_SPEED_HIGH) {
+		if (desc->bInterval > 16 &&
+		    (usb_endpoint_xfer_int(desc) || usb_endpoint_xfer_isoc(desc)))
+			return -EINVAL;
+		if (usb_endpoint_xfer_isoc(desc) &&
+		    usb_endpoint_maxp_mult(desc) > 3)
+			return -EINVAL;
+	} else if (udc_ep->crg_udc->gadget.speed == USB_SPEED_FULL) {
+		if (maxpacket > 64 && !usb_endpoint_xfer_isoc(desc))
+			return -EINVAL;
+		if (usb_endpoint_xfer_isoc(desc) && maxpacket > 1023)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int crg_udc_ep_enable(struct usb_ep *ep,
+			     const struct usb_endpoint_descriptor *desc)
+{
+	struct crg_udc_ep *udc_ep;
+	struct crg_gadget_dev *crg_udc;
+	u32 param0;
+	int status;
+	unsigned long flags = 0;
+
+	if (!ep || !desc || desc->bDescriptorType != USB_DT_ENDPOINT)
+		return -EINVAL;
+	udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	/* ep0 is always running */
+	if (udc_ep->dci == 0)
+		return 0;
+	crg_udc = udc_ep->crg_udc;
+	if (!crg_udc->gadget_driver)
+		return -ESHUTDOWN;
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	/* crg ep context start from ep1 */
+	if (get_ep_state(crg_udc, udc_ep->dci) != EP_STATE_DISABLED) {
+		int ret;
+
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		ret = crg_udc_ep_disable(ep);
+		if (ret)
+			return ret;
+		spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	}
+	udc_ep->desc = desc;
+	udc_ep->comp_desc = ep->comp_desc;
+	status = crg_udc_validate_ep_desc(udc_ep, desc);
+	if (status) {
+		udc_ep->desc = NULL;
+		udc_ep->comp_desc = NULL;
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return status;
+	}
+	/* setup endpoint context for regular endpoint
+	 * the endpoint context for control endpoint has been
+	 * set up in probe function
+	 */
+	if (udc_ep->dci) {
+		/* setup transfer ring */
+		if (!udc_ep->tran_ring_info.cpu_addr) {
+			dma_addr_t dma;
+			u32 ring_size = 0;
+			void *vaddr;
+			size_t len;
+
+			if (usb_endpoint_xfer_bulk(desc))
+				ring_size = CRGUDC_BULK_EP_TD_RING_SIZE;
+			else if (usb_endpoint_xfer_isoc(desc))
+				ring_size = CRGUDC_ISOC_EP_TD_RING_SIZE;
+			else if (usb_endpoint_xfer_int(desc))
+				ring_size = CRGUDC_INT_EP_TD_RING_SIZE;
+			if (!ring_size) {
+				spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+				return -EINVAL;
+			}
+			len = ring_size * sizeof(struct transfer_trb_s);
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			vaddr = dma_alloc_coherent(crg_udc->dev, len, &dma,
+						   GFP_KERNEL);
+			if (!vaddr)
+				return -ENOMEM;
+			spin_lock_irqsave(&crg_udc->udc_lock, flags);
+			if (udc_ep->desc != desc ||
+			    udc_ep->ep_state != EP_STATE_DISABLED) {
+				spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+				dma_free_coherent(crg_udc->dev, len, vaddr, dma);
+				return -EAGAIN;
+			}
+			udc_ep->tran_ring_info.cpu_addr = vaddr;
+			udc_ep->tran_ring_info.dma_addr = dma;
+			udc_ep->tran_ring_info.len = len;
+			udc_ep->first_trb = vaddr;
+			udc_ep->last_trb = udc_ep->first_trb + ring_size - 1;
+		}
+		memset(udc_ep->first_trb, 0, udc_ep->tran_ring_info.len);
+		/* Ensure that transfer ring is updated */
+		dma_wmb();
+		setup_link_trb(udc_ep->last_trb, true,
+			       udc_ep->tran_ring_info.dma_addr);
+		udc_ep->enq_pt = udc_ep->first_trb;
+		udc_ep->deq_pt = udc_ep->first_trb;
+		udc_ep->pcs = 1;
+		udc_ep->tran_ring_full = false;
+		crg_udc->num_enabled_eps++;
+		status = crg_udc_epcx_setup(udc_ep);
+		if (status)
+			goto err_ep_enable;
+	}
+	param0 = BIT(udc_ep->dci);
+	status = crg_issue_command(crg_udc, CRG_CMD_CONFIG_EP, param0, 0);
+	if (status)
+		goto err_ep_enable;
+	if (crg_udc->device_state == USB_STATE_ADDRESS)
+		crg_udc->device_state = USB_STATE_CONFIGURED;
+	udc_ep->wedge = false;
+	udc_ep->usb_ep.enabled = 1;
+	udc_ep->ep_state = EP_STATE_RUNNING;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return 0;
+
+err_ep_enable:
+	if (udc_ep->dci && crg_udc->num_enabled_eps)
+		crg_udc->num_enabled_eps--;
+	udc_ep->desc = NULL;
+	udc_ep->comp_desc = NULL;
+	udc_ep->ep_state = EP_STATE_DISABLED;
+	if (udc_ep->tran_ring_info.cpu_addr) {
+		dma_free_coherent(crg_udc->dev, udc_ep->tran_ring_info.len,
+				  udc_ep->tran_ring_info.cpu_addr,
+				  udc_ep->tran_ring_info.dma_addr);
+		udc_ep->tran_ring_info.cpu_addr = NULL;
+		udc_ep->tran_ring_info.dma_addr = DMA_MAPPING_ERROR;
+		udc_ep->tran_ring_info.len = 0;
+		udc_ep->first_trb = NULL;
+		udc_ep->last_trb = NULL;
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return status;
+}
+
+static struct usb_request *crg_udc_alloc_request(struct usb_ep *_ep,
+						 gfp_t gfp_flags)
+{
+	struct crg_udc_request *udc_req_ptr;
+
+	udc_req_ptr = kzalloc_obj(*udc_req_ptr, gfp_flags);
+
+	if (!udc_req_ptr)
+		return NULL;
+
+	udc_req_ptr->usb_req.dma = DMA_MAPPING_ERROR;
+	INIT_LIST_HEAD(&udc_req_ptr->queue);
+
+	return &udc_req_ptr->usb_req;
+}
+
+static void crg_udc_free_request(struct usb_ep *_ep, struct usb_request *_req)
+{
+	struct crg_udc_request *udc_req_ptr;
+
+	if (!_ep || !_req)
+		return;
+
+	udc_req_ptr = container_of(_req, struct crg_udc_request, usb_req);
+	if (udc_req_ptr->mapped ||
+	    udc_req_ptr->usb_req.num_mapped_sgs)
+		crg_udc_unmap_request(container_of(_ep, struct crg_udc_ep, usb_ep),
+				      udc_req_ptr);
+	kfree(udc_req_ptr);
+}
+
+static int crg_udc_ep_queue(struct usb_ep *_ep, struct usb_request *_req,
+			    gfp_t gfp_flags)
+{
+	struct crg_udc_request *udc_req_ptr;
+	struct crg_udc_ep *udc_ep_ptr;
+	struct crg_gadget_dev *crg_udc;
+	enum dma_data_direction dma_data_dir;
+	unsigned long flags;
+	int status;
+	bool is_sg;
+
+	if (!_ep || !_req)
+		return -EINVAL;
+
+	udc_req_ptr = container_of(_req, struct crg_udc_request, usb_req);
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+	is_sg = _req->num_sgs != 0 && _req->length != 0;
+
+	if (is_sg && !_req->sg)
+		return -EINVAL;
+	if (_req->stream_id)
+		return -EOPNOTSUPP;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	/*
+	 * A completion callback for an aborted EP0 transfer may requeue the
+	 * same request. Reject EP0 requests while the previous control
+	 * transfer is being aborted or EP0 is in an error state. EP0 becomes
+	 * available again only after the new SETUP has been accepted and
+	 * the EP0 transfer ring has been successfully reinitialized.
+	 */
+	if (udc_ep_ptr->dci == 0 &&
+	    crg_udc->ep0_state != EP0_STATE_IDLE) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -ECONNRESET;
+	}
+	if (!udc_ep_ptr->first_trb || !_req->complete ||
+	    (!is_sg && !_req->buf) || !list_empty(&udc_req_ptr->queue)) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+	if (!udc_ep_ptr->desc) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && is_sg) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EOPNOTSUPP;
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc) && !_req->length) {
+		crg_udc->setup_status = STATUS_STAGE_XFER;
+		build_ep0_status(&crg_udc->udc_ep[0], false, -EINPROGRESS,
+				 udc_req_ptr, 0, 0);
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return 0;
+	}
+
+	if (usb_endpoint_xfer_control(udc_ep_ptr->desc)) {
+		if (crg_udc->setup_status == DATA_STAGE_XFER ||
+		    crg_udc->setup_status == STATUS_STAGE_XFER) {
+			dma_data_dir = DMA_TO_DEVICE;
+		} else if (crg_udc->setup_status == DATA_STAGE_RECV ||
+			 crg_udc->setup_status == STATUS_STAGE_RECV) {
+			dma_data_dir = DMA_FROM_DEVICE;
+		} else {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return -EINVAL;
+		}
+	} else {
+		dma_data_dir = usb_endpoint_dir_in(udc_ep_ptr->desc) ?
+			DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	clear_req_container(udc_req_ptr);
+	udc_req_ptr->mapped = false;
+
+	if (_req->length) {
+		udc_req_ptr->map_dir = dma_data_dir;
+		status = usb_gadget_map_request_by_dev(crg_udc->dev,
+						       _req,
+						       dma_data_dir == DMA_TO_DEVICE);
+		if (status)
+			goto err_unmap;
+
+		if (is_sg) {
+			if (!_req->num_mapped_sgs || crg_udc_sg_init(udc_req_ptr)) {
+				status = -EIO;
+				goto err_unmap;
+			}
+		} else if (_req->dma_mapped) {
+			udc_req_ptr->mapped = true;
+		}
+	}
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!udc_ep_ptr->desc || !udc_req_ptr->usb_req.complete ||
+	    !list_empty(&udc_req_ptr->queue)) {
+		status = -ESHUTDOWN;
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+		return status;
+	}
+
+	_req->status = -EINPROGRESS;
+	_req->actual = 0;
+
+	if (udc_ep_ptr->tran_ring_full)
+		status = 0;
+	else
+		status = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+
+	if (!status)
+		list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	if (status)
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+	return status;
+
+err_unmap:
+	crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+	return status;
+}
+
+static u32 crg_udc_actual_before(struct crg_udc_ep *udc_ep,
+				 struct crg_udc_request *udc_req,
+				 struct transfer_trb_s *pause)
+{
+	struct transfer_trb_s *trb = udc_req->first_trb;
+	u32 actual = 0;
+	u32 guard = 0;
+
+	if (!trb || !pause)
+		return 0;
+
+	while (trb != pause && trb != udc_ep->enq_pt && guard++ < 4096) {
+		u32 len;
+
+		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(trb->dw3)) ==
+		    TRB_TYPE_LINK) {
+			trb = udc_ep->first_trb;
+			continue;
+		}
+		len = FIELD_GET(TRB_TRANSFER_LEN_MASK, le32_to_cpu(trb->dw2));
+		actual += len;
+		trb++;
+		if (trb == udc_ep->last_trb)
+			trb = udc_ep->first_trb;
+	}
+
+	return min(actual, udc_req->usb_req.length);
+}
+
+static int crg_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+	struct crg_gadget_dev *crg_udc;
+	struct crg_uccr __iomem *uccr;
+	struct crg_udc_request *udc_req = NULL;
+	struct crg_udc_request *iter;
+	struct ep_cx_s *p_ep_cx;
+	struct transfer_trb_s *pause_pt;
+	enum ep_state old_ep_state;
+	u32 tmp, deq_pt_lo, deq_pt_hi;
+	dma_addr_t dq_pt_addr;
+	u8 dci;
+	bool found = false;
+	unsigned long flags;
+
+	if (!_ep || !_req)
+		return -EINVAL;
+
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+	uccr = crg_udc->uccr;
+	dci = udc_ep_ptr->dci;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	old_ep_state = udc_ep_ptr->ep_state;
+
+	list_for_each_entry(iter, &udc_ep_ptr->queue, queue) {
+		if (&iter->usb_req == _req) {
+			udc_req = iter;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+
+	if (!udc_req->first_trb) {
+		req_done(udc_ep_ptr, udc_req, -ECONNRESET, &flags);
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return 0;
+	}
+
+	if (dci == 0) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+
+	if (old_ep_state == EP_STATE_RUNNING) {
+		int ret = crg_issue_command(crg_udc, CRG_CMD_STOP_EP, BIT(dci), 0);
+
+		if (ret) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return ret;
+		}
+		if (readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					      !(tmp & BIT(dci)), 10, 10000)) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return -ETIMEDOUT;
+		}
+		udc_ep_ptr->ep_state = EP_STATE_STOPPED;
+	}
+
+	p_ep_cx = &crg_udc->p_epcx[dci - 2];
+	deq_pt_lo = le32_to_cpu(p_ep_cx->dw2) & EP_CX_TR_DQPT_LO_MASK;
+	deq_pt_hi = le32_to_cpu(p_ep_cx->dw3);
+	dq_pt_addr = (dma_addr_t)deq_pt_lo |
+		((dma_addr_t)deq_pt_hi << 32);
+	pause_pt = tran_trb_dma_to_virt(udc_ep_ptr, dq_pt_addr);
+	if (!pause_pt) {
+		if (old_ep_state == EP_STATE_RUNNING)
+			udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EIO;
+	}
+
+	if (is_pointer_less_than(pause_pt, udc_req->first_trb, udc_ep_ptr)) {
+		squeeze_xfer_ring(udc_ep_ptr, udc_req);
+		req_done(udc_ep_ptr, udc_req, -ECONNRESET, &flags);
+	} else if (udc_req->last_trb &&
+		   is_pointer_less_than(udc_req->last_trb, pause_pt, udc_ep_ptr)) {
+		req_done(udc_ep_ptr, udc_req, -ECONNRESET, &flags);
+	} else {
+		udc_req->usb_req.actual =
+			crg_udc_actual_before(udc_ep_ptr, udc_req, pause_pt);
+		req_done(udc_ep_ptr, udc_req, -ECONNRESET, &flags);
+		udc_ep_ptr->deq_pt = pause_pt;
+		if (crg_udc_epcx_update_dqptr(udc_ep_ptr)) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+			return -EIO;
+		}
+	}
+
+	if (old_ep_state == EP_STATE_RUNNING) {
+		udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+		knock_doorbell(crg_udc, dci);
+	}
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return 0;
+}
+
+static int crg_udc_ep_set_halt(struct usb_ep *_ep, int value)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+	int status;
+	unsigned long flags = 0;
+	struct crg_gadget_dev *crg_udc;
+
+	if (!_ep)
+		return -EINVAL;
+
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (value && !udc_ep_ptr->desc) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EINVAL;
+	}
+	if (value && usb_endpoint_dir_in(udc_ep_ptr->desc) &&
+	    !list_empty(&udc_ep_ptr->queue)) {
+		dev_err(crg_udc->dev, "set_halt: list not empty\n");
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EAGAIN;
+	}
+
+	status = ep_halt(udc_ep_ptr, value, 1, &flags);
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return status;
+}
+
+static int crg_udc_ep_set_wedge(struct usb_ep *_ep)
+{
+	struct crg_udc_ep *udc_ep_ptr;
+	int status;
+	unsigned long flags = 0;
+	struct crg_gadget_dev *crg_udc;
+
+	if (!_ep)
+		return -EINVAL;
+
+	udc_ep_ptr = container_of(_ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep_ptr->crg_udc;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	udc_ep_ptr->wedge = 1;
+
+	status = ep_halt(udc_ep_ptr, 1, 1, &flags);
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return status;
+}
+
+static const struct usb_ep_ops crg_udc_ep_ops = {
+	.enable = crg_udc_ep_enable,
+	.disable = crg_udc_ep_disable,
+	.alloc_request = crg_udc_alloc_request,
+	.free_request = crg_udc_free_request,
+	.queue = crg_udc_ep_queue,
+	.dequeue = crg_udc_ep_dequeue,
+	.set_halt = crg_udc_ep_set_halt,
+	.set_wedge = crg_udc_ep_set_wedge,
+};
+
+static void crg_ep_struct_setup(struct crg_gadget_dev *crg_udc, u32 dci,
+				const char *name)
+{
+	struct crg_udc_ep *ep = &crg_udc->udc_ep[dci];
+
+	ep->dci = dci;
+
+	if (ep->dci > 1) {
+		strscpy_pad(ep->name, name, sizeof(ep->name));
+		ep->usb_ep.name = ep->name;
+
+		ep->usb_ep.caps.type_iso = 1;
+		ep->usb_ep.caps.type_bulk = 1;
+		ep->usb_ep.caps.type_int = 1;
+		if (ep->dci % 2)
+			ep->usb_ep.caps.dir_out = 1;
+		else
+			ep->usb_ep.caps.dir_in = 1;
+		usb_ep_set_maxpacket_limit(&ep->usb_ep, CRG_MAX_PACKET_SIZE);
+	} else {
+		strscpy(ep->name, "ep0", sizeof(ep->name));
+		ep->usb_ep.name = ep->name;
+		ep->usb_ep.maxpacket = 512;
+		ep->usb_ep.caps.type_control = 1;
+		ep->usb_ep.caps.dir_in = 1;
+		ep->usb_ep.caps.dir_out = 1;
+	}
+
+	ep->usb_ep.ops = &crg_udc_ep_ops;
+	ep->crg_udc = crg_udc;
+
+	INIT_LIST_HEAD(&ep->queue);
+	if (ep->dci > 1)
+		list_add_tail(&ep->usb_ep.ep_list, &crg_udc->gadget.ep_list);
+}
+
+static void enable_setup_event(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	val = readl(&uccr->config1);
+	val |= CRG_U3DC_CFG1_SETUP_EVENT_EN;
+	writel(val, &uccr->config1);
+}
+
+static int is_event_ring_x_empty(struct crg_gadget_dev *crg_udc, int index)
+{
+	struct event_trb_s *event;
+	struct crg_udc_event *udc_event;
+
+	udc_event = &crg_udc->udc_event[index];
+	if (udc_event->evt_dq_pt) {
+		event = (struct event_trb_s *)udc_event->evt_dq_pt;
+
+		if (FIELD_GET(EVE_TRB_CYCLE_BIT_MASK, le32_to_cpu(event->dw3)) !=
+		    udc_event->ccs)
+			return 1;
+	}
+
+	return 0;
+}
+
+static int is_event_rings_empty(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		if (!is_event_ring_x_empty(crg_udc, i)) {
+			dev_err(crg_udc->dev, "event ring not empty\n");
+			return 0;
+		}
+	}
+	return 1;
+}
+
+static int enable_setup(struct crg_gadget_dev *crg_udc)
+{
+	enable_setup_event(crg_udc);
+	crg_udc->device_state = USB_STATE_DEFAULT;
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->setup_pending = false;
+	crg_udc->ctrl_req_enq_idx = 0;
+
+	return 0;
+}
+
+static int prepare_for_setup(struct crg_gadget_dev *crg_udc,
+			     unsigned long *flags)
+{
+	struct crg_udc_ep *udc_ep0_ptr;
+
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+	u32 cmd_param1;
+
+	if (!is_event_rings_empty(crg_udc) ||
+	    crg_udc->portsc_on_reconnecting == 1)
+		return -EBUSY;
+
+	udc_ep0_ptr = &crg_udc->udc_ep[0];
+	/* If we reinit ep0 on bus reset, we just make ep0 dequeue pointer
+	 * align with enqueue pointer, all remaining xfer trbs became dumb once
+	 * which will not produce xfer event anymore.
+	 *
+	 * If we considering the opposite solution, we should wait all ep0 xfer
+	 * trbs be completed(with some err complete code)
+	 */
+	if (crg_udc->reinit_ep0_on_bus_reset) {
+		/* Complete any reqs on EP0 queue */
+		crg_udc_ep_nuke(udc_ep0_ptr, -ESHUTDOWN, flags);
+
+		crg_udc->ctrl_req_enq_idx = 0;
+		memset(crg_udc->ctrl_req_queue, 0,
+		       sizeof(struct crg_setup_packet) * CTRL_REQ_QUEUE_DEPTH);
+
+		/* context related ops */
+		dqptaddr =
+			tran_trb_virt_to_dma(udc_ep0_ptr, udc_ep0_ptr->enq_pt);
+		cmd_param0 =
+			(lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
+			FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0_ptr->pcs);
+		cmd_param1 = upper_32_bits(dqptaddr);
+		if (crg_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0,
+				      cmd_param1))
+			return -EIO;
+
+		/* TRY this solution */
+		udc_ep0_ptr->deq_pt = udc_ep0_ptr->enq_pt;
+		udc_ep0_ptr->tran_ring_full = false;
+	} else {
+		if (!list_empty(&udc_ep0_ptr->queue)) {
+			dev_err(crg_udc->dev,
+				"remaining ep0 xfer trbs on reset\n");
+			return -EBUSY;
+		}
+	}
+
+	enable_setup(crg_udc);
+
+	return 0;
+}
+
+static int update_ep0_maxpacketsize(struct crg_gadget_dev *crg_udc)
+{
+	u16 maxpacketsize = 0;
+	struct crg_udc_ep *udc_ep0 = &crg_udc->udc_ep[0];
+	u32 param0;
+
+	if (crg_udc->gadget.speed >= USB_SPEED_SUPER)
+		maxpacketsize = 512;
+	else
+		maxpacketsize = 64;
+
+	param0 = FIELD_PREP(CRG_CMD1_0_MPS_MASK, maxpacketsize);
+	if (crg_issue_command(crg_udc, CRG_CMD_UPDATE_EP0_CFG, param0, 0))
+		return -EIO;
+
+	crg_udc->ep0_desc.wMaxPacketSize = cpu_to_le16(maxpacketsize);
+	udc_ep0->usb_ep.maxpacket = maxpacketsize;
+
+	return 0;
+}
+
+static int init_event_ring(struct crg_gadget_dev *crg_udc, int index)
+{
+	struct crg_uicr __iomem *uicr = crg_udc->uicr[index];
+	struct crg_udc_event *udc_event = &crg_udc->udc_event[index];
+
+	int ret;
+	u32 buff_length;
+	dma_addr_t mapping;
+	bool erst_allocated = false;
+
+	buff_length = CRG_ERST_SIZE * sizeof(struct erst_s);
+	if (!udc_event->erst.cpu_addr) {
+		udc_event->erst.cpu_addr = dma_alloc_coherent(crg_udc->dev,
+							      buff_length,
+							      &mapping,
+							      GFP_KERNEL);
+
+		if (!udc_event->erst.cpu_addr) {
+			ret = -ENOMEM;
+			return ret;
+		}
+		erst_allocated = true;
+	} else {
+		mapping = udc_event->erst.dma_addr;
+	}
+
+	udc_event->erst.len = buff_length;
+	udc_event->erst.dma_addr = mapping;
+	udc_event->p_erst = udc_event->erst.cpu_addr;
+
+	buff_length = CRG_EVENT_RING_SIZE * sizeof(struct event_trb_s);
+	if (!udc_event->event_ring.cpu_addr) {
+		udc_event->event_ring.cpu_addr = dma_alloc_coherent(crg_udc->dev,
+								    buff_length,
+								    &mapping,
+								    GFP_KERNEL);
+
+		if (!udc_event->event_ring.cpu_addr) {
+			ret = -ENOMEM;
+			goto err_free_erst;
+		}
+	} else {
+		mapping = udc_event->event_ring.dma_addr;
+	}
+
+	udc_event->event_ring.len = buff_length;
+	udc_event->event_ring.dma_addr = mapping;
+	udc_event->evt_dq_pt = udc_event->event_ring.cpu_addr;
+
+	udc_event->evt_seg0_last_trb =
+		(struct event_trb_s *)(udc_event->event_ring.cpu_addr) +
+		(CRG_EVENT_RING_SIZE - 1);
+
+	udc_event->ccs = 1;
+
+	udc_event->p_erst->seg_addr_lo =
+		cpu_to_le32(lower_32_bits(udc_event->event_ring.dma_addr));
+	udc_event->p_erst->seg_addr_hi =
+		cpu_to_le32(upper_32_bits(udc_event->event_ring.dma_addr));
+	udc_event->p_erst->seg_size = cpu_to_le32(CRG_EVENT_RING_SIZE);
+	udc_event->p_erst->rsvd = cpu_to_le32(0);
+	/* Ensure that event ring is updated */
+	dma_wmb();
+	/* clear the event ring, to avoid hw unexpected ops
+	 * because of dirty data
+	 */
+	memset(udc_event->event_ring.cpu_addr, 0, buff_length);
+
+	/* Ensure that event ring is clear before programming
+	 * ERSTBA/ERSTSZ/ERDP
+	 */
+	dma_wmb();
+
+	writel(CRG_ERST_SIZE, &uicr->erstsz);
+	writel(lower_32_bits(udc_event->erst.dma_addr), &uicr->erstbalo);
+	writel(upper_32_bits(udc_event->erst.dma_addr), &uicr->erstbahi);
+	writel(lower_32_bits(udc_event->event_ring.dma_addr) |
+		       CRG_U3DC_ERDPLO_EHB,
+	       &uicr->erdplo);
+	writel(upper_32_bits(udc_event->event_ring.dma_addr), &uicr->erdphi);
+
+	writel((CRG_U3DC_IMAN_INT_EN | CRG_U3DC_IMAN_INT_PEND), &uicr->iman);
+	/* Interrupt moderation: 4000 * 250ns = 1ms */
+	writel(4000, &uicr->imod);
+	return 0;
+
+err_free_erst:
+	/* Only free what this call allocated; a pre-existing erst is owned
+	 * by an earlier successful init and released by crg_udc_free_resources().
+	 */
+	if (erst_allocated) {
+		dma_free_coherent(crg_udc->dev, udc_event->erst.len,
+				  udc_event->erst.cpu_addr,
+				  udc_event->erst.dma_addr);
+		udc_event->erst.cpu_addr = NULL;
+	}
+	return ret;
+}
+
+static int init_device_context(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	int ret;
+	u32 buff_length;
+	dma_addr_t mapping;
+
+	/* ep0 is not included in ep contexts in crg udc */
+	buff_length = (CRG_NUM_EP_CX - 2) * sizeof(struct ep_cx_s);
+
+	if (!crg_udc->ep_cx.cpu_addr) {
+		crg_udc->ep_cx.cpu_addr = dma_alloc_coherent(crg_udc->dev,
+							     buff_length,
+							     &mapping,
+							     GFP_KERNEL);
+		if (!crg_udc->ep_cx.cpu_addr) {
+			ret = -ENOMEM;
+			return ret;
+		}
+	} else {
+		mapping = crg_udc->ep_cx.dma_addr;
+	}
+
+	crg_udc->p_epcx = crg_udc->ep_cx.cpu_addr;
+	crg_udc->ep_cx.len = buff_length;
+	crg_udc->ep_cx.dma_addr = mapping;
+	memset(crg_udc->p_epcx, 0, buff_length);
+	/*
+	 * Ensure the endpoint contexts are initialized before making their
+	 * DMA address visible to the controller.
+	 */
+	dma_wmb();
+	/* hw ops DCBAPLO DCBAPHI */
+	writel(lower_32_bits(crg_udc->ep_cx.dma_addr), &uccr->dcbaplo);
+	writel(upper_32_bits(crg_udc->ep_cx.dma_addr), &uccr->dcbaphi);
+
+	return 0;
+}
+
+static int reset_data_struct(struct crg_gadget_dev *crg_udc)
+{
+	u32 tmp;
+	int i;
+	int ret;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	crg_udc->ep0_state = EP0_STATE_IDLE;
+
+	val = readl(&uccr->control);
+	val &= (~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN));
+	writel(val, &uccr->control);
+
+	switch (crg_udc->gadget.max_speed) {
+	case USB_SPEED_FULL:
+		tmp = CRG_U3DC_CFG0_MAXSPEED_FS;
+		break;
+	case USB_SPEED_HIGH:
+		tmp = CRG_U3DC_CFG0_MAXSPEED_HS;
+		break;
+	case USB_SPEED_SUPER:
+		tmp = CRG_U3DC_CFG0_MAXSPEED_SS;
+		break;
+	case USB_SPEED_SUPER_PLUS:
+		tmp = CRG_U3DC_CFG0_MAXSPEED_SSP;
+		break;
+	case USB_SPEED_UNKNOWN:
+	default:
+		return -EINVAL;
+	}
+	writel(tmp, &uccr->config0);
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		ret = init_event_ring(crg_udc, i);
+		if (ret)
+			return ret;
+	}
+
+	ret = init_device_context(crg_udc);
+	if (ret)
+		return ret;
+
+	if (!crg_udc->status_req) {
+		struct usb_request *req;
+
+		req = crg_udc_alloc_request(&crg_udc->udc_ep[0].usb_ep,
+					    GFP_KERNEL);
+		if (!req)
+			return -ENOMEM;
+
+		crg_udc->status_req = container_of(req, struct crg_udc_request,
+						   usb_req);
+	}
+
+	/* other hw ops */
+	return 0;
+}
+
+static int init_ep0(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	u32 cmd_param0;
+	u32 cmd_param1;
+
+	/* setup transfer ring */
+	if (!udc_ep_ptr->tran_ring_info.cpu_addr) {
+		dma_addr_t dma;
+		u32 ring_size = CRGUDC_CONTROL_EP_TD_RING_SIZE;
+		void *vaddr;
+		size_t len;
+
+		len = ring_size * sizeof(struct transfer_trb_s);
+		vaddr = dma_alloc_coherent(crg_udc->dev, len, &dma, GFP_KERNEL);
+		if (!vaddr)
+			return -ENOMEM;
+
+		udc_ep_ptr->tran_ring_info.cpu_addr = vaddr;
+		udc_ep_ptr->tran_ring_info.dma_addr = dma;
+		udc_ep_ptr->tran_ring_info.len = len;
+		udc_ep_ptr->first_trb = vaddr;
+		udc_ep_ptr->last_trb = udc_ep_ptr->first_trb + ring_size - 1;
+	}
+
+	memset(udc_ep_ptr->first_trb, 0, udc_ep_ptr->tran_ring_info.len);
+	/* Ensure that transfer ring is updated */
+	dma_wmb();
+	udc_ep_ptr->enq_pt = udc_ep_ptr->first_trb;
+	udc_ep_ptr->deq_pt = udc_ep_ptr->first_trb;
+	udc_ep_ptr->pcs = 1;
+	udc_ep_ptr->tran_ring_full = false;
+
+	setup_link_trb(udc_ep_ptr->last_trb, true,
+		       udc_ep_ptr->tran_ring_info.dma_addr);
+
+	/* context related ops */
+	cmd_param0 = (lower_32_bits(udc_ep_ptr->tran_ring_info.dma_addr) &
+		      CRG_CMD0_0_DQPTRLO_MASK) |
+		     FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep_ptr->pcs);
+	cmd_param1 = upper_32_bits(udc_ep_ptr->tran_ring_info.dma_addr);
+
+	if (crg_issue_command(crg_udc, CRG_CMD_INIT_EP0, cmd_param0, cmd_param1))
+		return -EIO;
+
+	udc_ep_ptr->ep_state = EP_STATE_RUNNING;
+
+	return 0;
+}
+
+static int ep0_start(struct crg_gadget_dev *crg_udc)
+{
+	crg_udc->udc_ep[0].desc = &crg_udc->ep0_desc;
+
+	return 0;
+}
+
+static void crg_udc_clear_portpm(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 tmp;
+
+	tmp = readl(&uccr->u3portpmsc);
+
+	tmp &= (~CRG_U3DC_U3PORTPM_U1IEN);
+	FIELD_MODIFY(CRG_U3DC_U3PORTPM_U1TMOUT_MASK, &tmp, 0);
+	tmp &= (~CRG_U3DC_U3PORTPM_U2IEN);
+	FIELD_MODIFY(CRG_U3DC_U3PORTPM_U2TMOUT_MASK, &tmp, 0);
+
+	writel(tmp, &uccr->u3portpmsc);
+
+	crg_udc->feature_u1_enable = 0;
+	crg_udc->feature_u2_enable = 0;
+}
+
+/*
+ * Invoke the bound gadget driver's ->disconnect() callback, if any.
+ *
+ * The gadget disconnect callback may be called in interrupt context.
+ * Release only udc_lock while keeping local IRQs disabled.
+ */
+static void crg_udc_notify_disconnect(struct crg_gadget_dev *crg_udc,
+				      unsigned long *flags)
+{
+	if (!crg_udc->gadget_driver || !crg_udc->gadget_driver->disconnect)
+		return;
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	crg_udc->gadget_driver->disconnect(&crg_udc->gadget);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+}
+
+static int crg_udc_reinit(struct crg_gadget_dev *crg_udc, unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 i, tmp;
+	struct crg_udc_ep *udc_ep_ptr;
+
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	/* Base on Figure 9-1, default USB_STATE is attached */
+	crg_udc->device_state = USB_STATE_RECONNECTING;
+
+	/* halt all the endpoints */
+
+	/* disable all the endpoints */
+	tmp = readl(&uccr->ep_enable);
+	writel(tmp, &uccr->ep_enable);
+	if (readl_poll_timeout_atomic(&uccr->ep_enable, tmp, !tmp, 1, 50)) {
+		dev_dbg(crg_udc->dev,
+			"timeout waiting for all endpoints to disable\n");
+		return -ETIMEDOUT;
+	}
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		udc_ep_ptr = &crg_udc->udc_ep[i];
+		udc_ep_ptr->usb_ep.enabled = 0;
+		if (udc_ep_ptr->desc)
+			crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN, flags);
+		udc_ep_ptr->desc = NULL;
+		udc_ep_ptr->comp_desc = NULL;
+		udc_ep_ptr->tran_ring_full = false;
+		udc_ep_ptr->ep_state = EP_STATE_DISABLED;
+	}
+	crg_udc->num_enabled_eps = 0;
+
+	/* we don't handle ep0 here, we init_ep0 when event ring is empty */
+
+	if (crg_udc->dev_addr != 0) {
+		u32 param0;
+
+		param0 = FIELD_PREP(CRG_CMD2_0_DEV_ADDR_MASK, 0);
+		if (crg_issue_command(crg_udc, CRG_CMD_SET_ADDR, param0, 0))
+			return -EIO;
+		crg_udc->dev_addr = 0;
+	}
+
+	crg_udc_clear_portpm(crg_udc);
+
+	return 0;
+}
+
+static int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 i, tmp;
+	struct crg_udc_ep *udc_ep_ptr;
+	u32 val;
+
+	val = readl(&uccr->control);
+	val |= CRG_U3DC_CTRL_SWRST;
+	writel(val, &uccr->control);
+	/* Poll until SWRST clears; hardware reset takes up to 500 ms */
+	if (readl_poll_timeout_atomic(&uccr->control, tmp,
+				      !(tmp & CRG_U3DC_CTRL_SWRST), 1000,
+				      500000)) {
+		dev_err(crg_udc->dev, "reset error\n");
+		return -ETIMEDOUT;
+	}
+
+	crg_udc_clear_portpm(crg_udc);
+
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	/* Base on Figure 9-1, default USB_STATE is attached */
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc->dev_addr = 0;
+
+	/* Complete any reqs on EP1-EP15 queue */
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		udc_ep_ptr = &crg_udc->udc_ep[i];
+
+		if (udc_ep_ptr->desc)
+			crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN, flags);
+		udc_ep_ptr->tran_ring_full = false;
+		udc_ep_ptr->ep_state = EP_STATE_DISABLED;
+	}
+	crg_udc->num_enabled_eps = 0;
+
+	/* Complete any reqs on EP0 queue */
+	udc_ep_ptr = &crg_udc->udc_ep[0];
+	if (udc_ep_ptr->desc)
+		crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN, flags);
+
+	crg_udc->ctrl_req_enq_idx = 0;
+	crg_udc->setup_pending = false;
+	memset(crg_udc->ctrl_req_queue, 0,
+	       sizeof(struct crg_setup_packet) * CTRL_REQ_QUEUE_DEPTH);
+
+	return 0;
+}
+
+/* controller operations */
+
+#define gadget_to_udc(g) (container_of(g, struct crg_gadget_dev, gadget))
+/*
+ * crg_udc_vbus_connected - read VBUS presence from hardware
+ *
+ * Reads the VBUS-detect bit of the vendor register to determine whether
+ * a USB cable is physically connected.  Safe to call from IRQ context.
+ */
+static bool crg_udc_vbus_connected(struct crg_gadget_dev *crg_udc)
+{
+	return !!(readl(crg_udc->mmio_virt_base + CRG_UDC_VENDOR_REG) &
+		  CRG_UDC_VBUS_DETECT);
+}
+
+static int crg_gadget_pullup(struct usb_gadget *g, int is_on)
+{
+	struct crg_gadget_dev *crg_udc = gadget_to_udc(g);
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	if (is_on) {
+		/* Enable event reporting and interrupts, then assert RUN */
+		val = readl(&uccr->config1);
+		val |= (CRG_U3DC_CFG1_CSC_EVENT_EN |
+			CRG_U3DC_CFG1_PEC_EVENT_EN |
+			CRG_U3DC_CFG1_PPC_EVENT_EN |
+			CRG_U3DC_CFG1_PRC_EVENT_EN |
+			CRG_U3DC_CFG1_PLC_EVENT_EN |
+			CRG_U3DC_CFG1_CEC_EVENT_EN);
+		writel(val, &uccr->config1);
+
+		val = readl(&uccr->control);
+		val |= (CRG_U3DC_CTRL_SYSERR_EN | CRG_U3DC_CTRL_INT_EN |
+			CRG_U3DC_CTRL_RUN);
+		writel(val, &uccr->control);
+	} else {
+		val = readl(&uccr->control);
+		val &= ~CRG_U3DC_CTRL_RUN;
+		writel(val, &uccr->control);
+	}
+
+	return 0;
+}
+
+static void crg_vbus_detect(struct crg_gadget_dev *crg_udc, int enable)
+{
+	u32 val = readl(crg_udc->mmio_virt_base + CRG_UDC_VENDOR_REG);
+
+	if (enable)
+		val |= CRG_UDC_VBUS_DETECT;
+	else
+		val &= ~CRG_UDC_VBUS_DETECT;
+
+	writel(val, crg_udc->mmio_virt_base + CRG_UDC_VENDOR_REG);
+}
+
+static int crg_gadget_start(struct usb_gadget *g,
+			    struct usb_gadget_driver *driver)
+{
+	struct crg_gadget_dev *crg_udc;
+
+	crg_udc = gadget_to_udc(g);
+	crg_udc->gadget_driver = driver;
+
+	crg_vbus_detect(crg_udc, 1);
+	return 0;
+}
+
+static int crg_gadget_stop(struct usb_gadget *g)
+{
+	struct crg_gadget_dev *crg_udc;
+	unsigned long flags = 0;
+
+	crg_udc = gadget_to_udc(g);
+
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_vbus_detect(crg_udc, 0);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	/*
+	 * crg_udc_reset() completes any queued requests via
+	 * crg_udc_ep_nuke() -> req_done(). req_done() drops udc_lock
+	 * (IRQ-safe) around each ->complete() callback and re-acquires it
+	 * afterwards, so gadget completion callbacks are never invoked with
+	 * the spinlock held. flags is threaded through for that purpose.
+	 */
+	if (crg_udc_reset(crg_udc, &flags)) {
+		dev_err(crg_udc->dev, "controller reset failed during stop\n");
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EIO;
+	}
+	if (reset_data_struct(crg_udc)) {
+		dev_err(crg_udc->dev, "controller data reset failed during stop\n");
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EIO;
+	}
+
+	crg_udc->connected = 0;
+	crg_udc->gadget_driver = NULL;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+
+	if (init_ep0(crg_udc)) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return -EIO;
+	}
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+static const struct usb_gadget_ops crg_gadget_ops = {
+	.pullup = crg_gadget_pullup,
+	.udc_start = crg_gadget_start,
+	.udc_stop = crg_gadget_stop,
+};
+
+static void init_ep_info(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	/* udc_ep[0] is reserved */
+	crg_ep_struct_setup(crg_udc, 0, NULL);
+
+	for (i = 1; i < CRG_NUM_EP_CX / 2; i++) {
+		char name[14];
+
+		snprintf(name, sizeof(name), "ep%din", i);
+		crg_ep_struct_setup(crg_udc, i * 2, name);
+		snprintf(name, sizeof(name), "ep%dout", i);
+		crg_ep_struct_setup(crg_udc, i * 2 + 1, name);
+	}
+}
+
+static void get_status_cmpl(struct usb_ep *ep, struct usb_request *req)
+{
+	kfree(req->buf);
+	req->buf = NULL;
+}
+
+static void getstatusrequest(struct crg_gadget_dev *crg_udc, u8 request_type,
+			     u16 value, u16 index, u16 length)
+{
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	struct crg_udc_request *udc_req_ptr = crg_udc->status_req;
+	u16 status_val = 0;
+	u32 dci;
+	int ret;
+
+	if (!udc_req_ptr || !list_empty(&udc_req_ptr->queue) ||
+	    value || length != sizeof(u16)) {
+		set_ep0_halt(crg_udc);
+		return;
+	}
+
+	switch (request_type & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		if (index)
+			goto invalid;
+		if (crg_udc->gadget.speed == USB_SPEED_HIGH ||
+		    crg_udc->gadget.speed == USB_SPEED_FULL) {
+			if (crg_udc->u2_rwe)
+				status_val |= BIT(USB_DEVICE_REMOTE_WAKEUP);
+		} else if (crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+			if (crg_udc->feature_u1_enable)
+				status_val |= BIT(USB_DEV_STAT_U1_ENABLED);
+			if (crg_udc->feature_u2_enable)
+				status_val |= BIT(USB_DEV_STAT_U2_ENABLED);
+		}
+		status_val |= crg_udc->gadget.is_selfpowered ?
+			USB_DEVICE_SELF_POWERED : 0;
+		break;
+
+	case USB_RECIP_INTERFACE:
+		if (crg_udc->device_state != USB_STATE_CONFIGURED ||
+		    (index & 0xff00))
+			goto invalid;
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		if (index & ~(USB_ENDPOINT_NUMBER_MASK | USB_DIR_IN))
+			goto invalid;
+		dci = index2dci(index);
+		if (dci == 1 || dci >= CRG_NUM_EP_CX)
+			goto invalid;
+		if (crg_udc->device_state < USB_STATE_ADDRESS && dci != 0)
+			goto invalid;
+		if (crg_udc->device_state == USB_STATE_ADDRESS && dci != 0)
+			goto invalid;
+		if (crg_udc->device_state == USB_STATE_CONFIGURED &&
+		    get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+			goto invalid;
+		if (get_ep_state(crg_udc, dci) == EP_STATE_HALTED)
+			status_val = BIT(USB_ENDPOINT_HALT);
+		break;
+
+	default:
+		goto invalid;
+	}
+
+	kfree(udc_req_ptr->usb_req.buf);
+	udc_req_ptr->usb_req.buf = kzalloc_obj(status_val, GFP_ATOMIC);
+	if (!udc_req_ptr->usb_req.buf)
+		goto invalid;
+
+	*(__le16 *)udc_req_ptr->usb_req.buf = cpu_to_le16(status_val);
+	udc_req_ptr->usb_req.length = sizeof(status_val);
+	udc_req_ptr->usb_req.status = -EINPROGRESS;
+	udc_req_ptr->usb_req.actual = 0;
+	udc_req_ptr->usb_req.complete = get_status_cmpl;
+
+	udc_req_ptr->map_dir = DMA_TO_DEVICE;
+	ret = usb_gadget_map_request_by_dev(crg_udc->dev,
+					    &udc_req_ptr->usb_req, true);
+	if (ret) {
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		goto invalid;
+	}
+
+	crg_udc->setup_status = DATA_STAGE_XFER;
+
+	ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	if (ret) {
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		set_ep0_halt(crg_udc);
+		return;
+	}
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+	return;
+
+invalid:
+	set_ep0_halt(crg_udc);
+}
+
+static void set_address_cmpl(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->device_state == USB_STATE_DEFAULT &&
+	    crg_udc->dev_addr != 0) {
+		crg_udc->device_state = USB_STATE_ADDRESS;
+
+	} else if (crg_udc->device_state == USB_STATE_ADDRESS) {
+		if (crg_udc->dev_addr == 0)
+			crg_udc->device_state = USB_STATE_DEFAULT;
+	}
+}
+
+static void setaddressrequest(struct crg_gadget_dev *crg_udc, u16 value,
+			      u16 index, u16 length)
+{
+	int status = -EINPROGRESS;
+	u8 status_set_addr = 0;
+
+	if (value > 127 || index != 0 || length != 0) {
+		status = -EINVAL;
+		goto set_address_error;
+	}
+
+	if ((crg_udc->device_state == USB_STATE_DEFAULT && value != 0) ||
+	    crg_udc->device_state == USB_STATE_ADDRESS) {
+		u32 param0;
+
+		param0 = FIELD_PREP(CRG_CMD2_0_DEV_ADDR_MASK, value);
+		if (crg_issue_command(crg_udc, CRG_CMD_SET_ADDR, param0, 0)) {
+			status = -EIO;
+		} else {
+			crg_udc->dev_addr = value;
+			status_set_addr = 1;
+		}
+	} else {
+		status = -EINVAL;
+	}
+
+set_address_error:
+	dev_dbg(crg_udc->dev, "build_ep0_status for Address Device\n");
+
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+	crg_udc->setup_fn_call_back = &set_address_cmpl;
+	build_ep0_status(&crg_udc->udc_ep[0], true, status, NULL,
+			 status_set_addr, 0);
+}
+
+static void set_sel_cmpl(struct usb_ep *ep, struct usb_request *req)
+{
+	struct crg_udc_ep *udc_ep;
+	struct crg_gadget_dev *crg_udc;
+	struct sel_value_s *sel_value;
+
+	udc_ep = container_of(ep, struct crg_udc_ep, usb_ep);
+	crg_udc = udc_ep->crg_udc;
+
+	if (req->buf) {
+		sel_value = req->buf;
+		crg_udc->sel_value.u2_pel_value = le16_to_cpu(sel_value->u2_pel_value);
+		crg_udc->sel_value.u2_sel_value = le16_to_cpu(sel_value->u2_sel_value);
+		crg_udc->sel_value.u1_pel_value = sel_value->u1_pel_value;
+		crg_udc->sel_value.u1_sel_value = sel_value->u1_sel_value;
+
+		kfree(req->buf);
+		req->buf = NULL;
+	}
+}
+
+static void setselrequest(struct crg_gadget_dev *crg_udc, u16 value, u16 index,
+			  u16 length)
+{
+	struct crg_udc_request *udc_req_ptr = crg_udc->status_req;
+	struct crg_udc_ep *udc_ep_ptr = &crg_udc->udc_ep[0];
+	struct sel_value_s *sel;
+	int ret;
+
+	if (!udc_req_ptr || !list_empty(&udc_req_ptr->queue) ||
+	    crg_udc->device_state == USB_STATE_DEFAULT ||
+	    value || index || length != sizeof(struct sel_value_s)) {
+		set_ep0_halt(crg_udc);
+		return;
+	}
+
+	kfree(udc_req_ptr->usb_req.buf);
+	udc_req_ptr->usb_req.buf = kzalloc_obj(*sel, GFP_ATOMIC);
+	if (!udc_req_ptr->usb_req.buf) {
+		set_ep0_halt(crg_udc);
+		return;
+	}
+
+	sel = udc_req_ptr->usb_req.buf;
+	udc_req_ptr->usb_req.length = sizeof(*sel);
+	udc_req_ptr->usb_req.status = -EINPROGRESS;
+	udc_req_ptr->usb_req.actual = 0;
+	udc_req_ptr->usb_req.complete = set_sel_cmpl;
+	udc_req_ptr->map_dir = DMA_FROM_DEVICE;
+	ret = usb_gadget_map_request_by_dev(crg_udc->dev,
+					    &udc_req_ptr->usb_req, false);
+	if (ret) {
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		set_ep0_halt(crg_udc);
+		return;
+	}
+
+	crg_udc->setup_status = DATA_STAGE_RECV;
+
+	ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+	if (ret) {
+		crg_udc_unmap_request(udc_ep_ptr, udc_req_ptr);
+		kfree(udc_req_ptr->usb_req.buf);
+		udc_req_ptr->usb_req.buf = NULL;
+		set_ep0_halt(crg_udc);
+		return;
+	}
+	list_add_tail(&udc_req_ptr->queue, &udc_ep_ptr->queue);
+}
+
+static void set_test_mode_cmpl(struct crg_gadget_dev *crg_udc)
+{
+	if (crg_udc->set_tm != 0) {
+		u32 tmp;
+		struct crg_uccr __iomem *uccr = crg_udc->uccr;
+
+		tmp = readl(&uccr->u2portpmsc);
+		FIELD_MODIFY(CRG_U3DC_U2PORTPM_TM_MASK, &tmp, crg_udc->set_tm);
+		writel(tmp, &uccr->u2portpmsc);
+
+		crg_udc->set_tm = 0;
+	}
+}
+
+static bool setfeaturesrequest(struct crg_gadget_dev *crg_udc, u8 request_type,
+			       u8 b_request, u16 value, u16 index, u16 length,
+			       unsigned long *flags)
+{
+	int status = -EINPROGRESS;
+	u8 dci;
+	struct crg_udc_ep *udc_ep_ptr;
+	u32 tmp;
+	u32 set_feat = 0;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+
+	if (length != 0) {
+		status = -EINVAL;
+		goto set_feature_error;
+	}
+
+	if (crg_udc->device_state == USB_STATE_DEFAULT) {
+		status = -EINVAL;
+		goto set_feature_error;
+	}
+
+	set_feat = (b_request == USB_REQ_SET_FEATURE) ? 1 : 0;
+	if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+	    (USB_RECIP_ENDPOINT | USB_TYPE_STANDARD)) {
+		dev_dbg(crg_udc->dev, "Halt/Unhalt EP\n");
+		if (crg_udc->device_state == USB_STATE_ADDRESS) {
+			if (index != 0) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+		}
+
+		if (value != USB_ENDPOINT_HALT)
+			goto set_feature_error;
+
+		if (index & ~USB_ENDPOINT_DIR_MASK)
+			goto set_feature_error;
+
+		dci = index2dci(index);
+		if (dci == 1 || dci >= CRG_NUM_EP_CX)
+			goto set_feature_error;
+		if (dci != 0 && crg_udc->device_state == USB_STATE_CONFIGURED &&
+		    get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+			goto set_feature_error;
+		if (dci == 1) {
+			dev_dbg(crg_udc->dev, "setfeat INVALID dci = 0x%x !!\n",
+				dci);
+			goto set_feature_error;
+		}
+
+		udc_ep_ptr = &crg_udc->udc_ep[dci];
+		status = ep_halt(udc_ep_ptr,
+				 (b_request == USB_REQ_SET_FEATURE) ? 1 : 0, 0,
+				 flags);
+
+		if (status < 0)
+			goto set_feature_error;
+	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+		   (USB_RECIP_DEVICE | USB_TYPE_STANDARD)) {
+		switch (value) {
+		case USB_DEVICE_REMOTE_WAKEUP:
+			/* REMOTE_WAKEUP selector is not used by USB3.0 */
+			if (crg_udc->device_state < USB_STATE_DEFAULT ||
+			    crg_udc->gadget.speed >= USB_SPEED_SUPER) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			crg_udc->u2_rwe = set_feat;
+
+			break;
+		case USB_DEVICE_U1_ENABLE:
+		case USB_DEVICE_U2_ENABLE: {
+			u32 timeout_val;
+
+			if (crg_udc->device_state != USB_STATE_CONFIGURED) {
+				dev_err(crg_udc->dev,
+					"u12 enable fail, usb state=%d\n",
+					crg_udc->device_state);
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			if (index != 0 || crg_udc->gadget.speed < USB_SPEED_SUPER) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			if (set_feat == 1 && crg_udc->u12_forbidden) {
+				status = -EINVAL;
+				goto set_feature_error;
+			}
+
+			tmp = readl(&uccr->u3portpmsc);
+			if (value == USB_DEVICE_U1_ENABLE) {
+				if (!crg_udc->u12_initiate_forbidden) {
+					tmp &= (~CRG_U3DC_U3PORTPM_U1IEN);
+					tmp |= FIELD_PREP(CRG_U3DC_U3PORTPM_U1IEN,
+							  set_feat);
+				}
+				if (!crg_udc->u12_forbidden)
+					timeout_val =
+						set_feat ? U1_TIMEOUT_VAL : 0;
+				else
+					timeout_val = 0;
+
+				FIELD_MODIFY(CRG_U3DC_U3PORTPM_U1TMOUT_MASK, &tmp, timeout_val);
+
+				crg_udc->feature_u1_enable = set_feat;
+			}
+
+			if (value == USB_DEVICE_U2_ENABLE) {
+				if (!crg_udc->u12_initiate_forbidden) {
+					tmp &= (~CRG_U3DC_U3PORTPM_U2IEN);
+					tmp |= FIELD_PREP(CRG_U3DC_U3PORTPM_U2IEN,
+							  set_feat);
+				}
+				if (!crg_udc->u12_forbidden)
+					timeout_val =
+						set_feat ? U2_TIMEOUT_VAL : 0;
+				else
+					timeout_val = 0;
+
+				FIELD_MODIFY(CRG_U3DC_U3PORTPM_U2TMOUT_MASK, &tmp, timeout_val);
+
+				crg_udc->feature_u2_enable = set_feat;
+			}
+			writel(tmp, &uccr->u3portpmsc);
+
+			break;
+		}
+		case USB_DEVICE_TEST_MODE: {
+			u32 u_pattern;
+
+			if (b_request != USB_REQ_SET_FEATURE ||
+			    crg_udc->gadget.speed != USB_SPEED_HIGH ||
+			    crg_udc->device_state < USB_STATE_DEFAULT ||
+			    (index & 0xff) ||
+			    (index >> 8) == 0 || (index >> 8) > 6)
+				goto set_feature_error;
+			u_pattern = index >> 8;
+			crg_udc->set_tm = u_pattern;
+			crg_udc->setup_fn_call_back = &set_test_mode_cmpl;
+
+			break;
+		}
+
+		default:
+			goto set_feature_error;
+		}
+
+	} else if ((request_type & (USB_RECIP_MASK | USB_TYPE_MASK)) ==
+		   (USB_RECIP_INTERFACE | USB_TYPE_STANDARD)) {
+		if (crg_udc->device_state != USB_STATE_CONFIGURED) {
+			dev_err(crg_udc->dev,
+				"interface u12 enable fail, usb state=%d\n",
+				crg_udc->device_state);
+			status = -EINVAL;
+			goto set_feature_error;
+		}
+
+		/* Suspend Option */
+		if (value == USB_INTRF_FUNC_SUSPEND) {
+			if (index & USB_INTR_FUNC_SUSPEND_OPT_MASK &
+			    USB_INTRF_FUNC_SUSPEND_LP) {
+				if (index & USB_INTRF_FUNC_SUSPEND_RW)
+					dev_dbg(crg_udc->dev,
+						"Interface En Remote Wakeup\n");
+				else
+					dev_dbg(crg_udc->dev,
+						"Interface Dis RemoteWakeup\n");
+
+				/* Do not need to return status stage here
+				 * Pass to composite gadget driver to process
+				 * the request
+				 */
+				return false;
+			}
+		}
+	}
+
+	crg_udc->setup_status = STATUS_STAGE_XFER;
+	build_ep0_status(&crg_udc->udc_ep[0], true, status, NULL, 0, 0);
+	return true;
+
+set_feature_error:
+	set_ep0_halt(crg_udc);
+	return true;
+}
+
+static bool setconfigurationrequest(struct crg_gadget_dev *crg_udc, u16 value)
+{
+	if (crg_udc->device_state <= USB_STATE_DEFAULT)
+		goto set_config_error;
+
+	/* return false means need further process by composite gadget driver */
+	return false;
+
+set_config_error:
+	set_ep0_halt(crg_udc);
+	return true;
+}
+
+static void crg_handle_setup_pkt(struct crg_gadget_dev *crg_udc,
+				 struct usb_ctrlrequest *setup_pkt,
+				 u8 setup_tag, unsigned long *flags)
+{
+	u16 w_value = le16_to_cpu(setup_pkt->wValue);
+	u16 w_index = le16_to_cpu(setup_pkt->wIndex);
+	u16 w_length = le16_to_cpu(setup_pkt->wLength);
+
+	/* EP0 come backs to running when new setup packet comes */
+	crg_udc->udc_ep[0].ep_state = EP_STATE_RUNNING;
+
+	crg_udc->setup_tag = setup_tag;
+	crg_udc->setup_status = SETUP_PKT_PROCESS_IN_PROGRESS;
+	crg_udc->setup_fn_call_back = NULL;
+
+	if ((setup_pkt->bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD) {
+		switch (setup_pkt->bRequest) {
+		case USB_REQ_GET_STATUS:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_IN | USB_RECIP_DEVICE | USB_TYPE_STANDARD) &&
+			    setup_pkt->bRequestType !=
+			    (USB_DIR_IN | USB_RECIP_INTERFACE | USB_TYPE_STANDARD) &&
+			    setup_pkt->bRequestType !=
+			    (USB_DIR_IN | USB_RECIP_ENDPOINT | USB_TYPE_STANDARD)) {
+				set_ep0_halt(crg_udc);
+				return;
+			}
+
+			getstatusrequest(crg_udc, setup_pkt->bRequestType,
+					 w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_ADDRESS:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE | USB_TYPE_STANDARD)) {
+				set_ep0_halt(crg_udc);
+				return;
+			}
+
+			setaddressrequest(crg_udc, w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_SEL:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE | USB_TYPE_STANDARD)) {
+				set_ep0_halt(crg_udc);
+				return;
+			}
+			crg_udc->setup_status = DATA_STAGE_RECV;
+			setselrequest(crg_udc, w_value, w_index, w_length);
+			return;
+		case USB_REQ_SET_ISOCH_DELAY:
+			dev_dbg(crg_udc->dev, "SET_ISOCH_DELAY is not supported\n");
+			set_ep0_halt(crg_udc);
+			return;
+
+		case USB_REQ_CLEAR_FEATURE:
+		case USB_REQ_SET_FEATURE:
+			/* Need composite gadget driver
+			 * to process the function remote wakeup request
+			 */
+			if (setfeaturesrequest(crg_udc, setup_pkt->bRequestType,
+					       setup_pkt->bRequest, w_value,
+					       w_index, w_length, flags)) {
+				/* Get here if request has been processed.*/
+				return;
+			}
+			break;
+		case USB_REQ_SET_CONFIGURATION:
+			if (setup_pkt->bRequestType !=
+			    (USB_DIR_OUT | USB_RECIP_DEVICE | USB_TYPE_STANDARD) ||
+			    w_length || w_value > 0xff) {
+				set_ep0_halt(crg_udc);
+				return;
+			}
+			/* In theory we need to clear RUN bit before
+			 * status stage of deconfig request sent.
+			 * But seeing problem if we do it before all the
+			 * endpoints belonging to the configuration
+			 * disabled.
+			 */
+			if (setconfigurationrequest(crg_udc, w_value)) {
+				/* Get here if request has been processed.
+				 * Or error happens
+				 */
+				return;
+			}
+
+			break;
+		default:
+			dev_dbg(crg_udc->dev,
+				"USB_REQ default bRequest=%d, bRequestType=%d\n",
+				setup_pkt->bRequest, setup_pkt->bRequestType);
+		}
+	}
+
+	if (w_length) {
+		/* data phase from gadget like GET_CONFIGURATION
+		 * call the setup routine of gadget driver.
+		 * remember the request direction.
+		 */
+		crg_udc->setup_status = (setup_pkt->bRequestType & USB_DIR_IN) ?
+						DATA_STAGE_XFER :
+						DATA_STAGE_RECV;
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	if (!crg_udc->gadget_driver ||
+	    crg_udc->gadget_driver->setup(&crg_udc->gadget, setup_pkt) < 0) {
+		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+		set_ep0_halt(crg_udc);
+		return;
+	}
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (setup_pkt->bRequest == USB_REQ_SET_CONFIGURATION &&
+	    (setup_pkt->bRequestType & (USB_TYPE_MASK | USB_RECIP_MASK)) ==
+	    (USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
+		if (w_value)
+			crg_udc->device_state = USB_STATE_CONFIGURED;
+		else if (crg_udc->device_state == USB_STATE_CONFIGURED)
+			crg_udc->device_state = USB_STATE_ADDRESS;
+	}
+}
+
+/*
+ * Abort the current EP0 control transfer when a new SETUP packet arrives.
+ *
+ * A SETUP packet is allowed to abort any in-progress control transfer. Do
+ * not defer the new SETUP until the old transfer completes: doing so leaves
+ * the old request on the EP0 software queue and subsequent gadget requests
+ * are rejected as "queue not empty".
+ *
+ * The controller's EP0 ring is reinitialized at the ring start, making all
+ * TRBs belonging to the aborted control transfer stale. The new SETUP is
+ * then handled immediately with a fresh setup tag.
+ */
+static int crg_udc_abort_ep0_for_setup(struct crg_gadget_dev *crg_udc,
+				       unsigned long *flags)
+{
+	struct crg_udc_ep *udc_ep0 = &crg_udc->udc_ep[0];
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	dma_addr_t dqptaddr;
+	u32 cmd_param0;
+	u32 cmd_param1;
+	u32 tmp;
+	int ret;
+
+	/*
+	 * A new SETUP is allowed to abort the current control transfer.
+	 * Keep EP0 in ABORTING for the complete stop/nuke/reinitialize
+	 * sequence. req_done() drops udc_lock while invoking the gadget
+	 * callback, so the callback may re-enter the UDC during the nuke.
+	 */
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->setup_pending = false;
+	crg_udc->ep0_state = EP0_STATE_ABORTING;
+
+	/*
+	 * Stop EP0 before touching the transfer ring. The controller may still
+	 * own the old TRBs even when no EP0 request is running from the gadget's
+	 * point of view. Do not clear the DMA-visible ring until the hardware
+	 * reports that EP0 is no longer running.
+	 */
+	ret = crg_issue_command(crg_udc, CRG_CMD_STOP_EP, BIT(0), 0);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"failed to stop EP0 for SETUP abort: %d\n", ret);
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	ret = readl_poll_timeout_atomic(&uccr->ep_running, tmp,
+					!(tmp & BIT(0)), 10, 10000);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"timeout stopping EP0 for SETUP abort\n");
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	udc_ep0->ep_state = EP_STATE_STOPPED;
+	/* Complete requests belonging to the aborted control transfer. */
+	crg_udc_ep_nuke(udc_ep0, -ECONNRESET, flags);
+
+	if (!udc_ep0->first_trb || !udc_ep0->tran_ring_info.cpu_addr) {
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return -ENODEV;
+	}
+
+	/*
+	 * The controller has stopped consuming EP0 TRBs. It is now safe to
+	 * discard the old transfer descriptors and restart the ring from its
+	 * beginning. No ring memory is freed here.
+	 */
+	memset(udc_ep0->first_trb, 0, udc_ep0->tran_ring_info.len);
+	udc_ep0->enq_pt = udc_ep0->first_trb;
+	udc_ep0->deq_pt = udc_ep0->first_trb;
+	udc_ep0->pcs = 1;
+	udc_ep0->tran_ring_full = false;
+	setup_link_trb(udc_ep0->last_trb, true,
+		       udc_ep0->tran_ring_info.dma_addr);
+
+	/* Make the new ring contents visible before handing the ring to HW. */
+	dma_wmb();
+
+	dqptaddr = tran_trb_virt_to_dma(udc_ep0, udc_ep0->first_trb);
+	if (dma_mapping_error(crg_udc->dev, dqptaddr)) {
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return -EIO;
+	}
+
+	cmd_param0 = (lower_32_bits(dqptaddr) & CRG_CMD0_0_DQPTRLO_MASK) |
+		FIELD_PREP(CRG_CMD0_0_DCS_MASK, udc_ep0->pcs);
+	cmd_param1 = upper_32_bits(dqptaddr);
+
+	ret = crg_issue_command(crg_udc, CRG_CMD_INIT_EP0,
+				cmd_param0, cmd_param1);
+	if (ret) {
+		dev_err(crg_udc->dev,
+			"failed to reinitialize EP0 for SETUP: %d\n", ret);
+		crg_udc->ep0_state = EP0_STATE_ERROR;
+		return ret;
+	}
+
+	udc_ep0->ep_state = EP_STATE_RUNNING;
+	crg_udc->ep0_state = EP0_STATE_IDLE;
+	return 0;
+}
+
+static int crg_handle_xfer_event(struct crg_gadget_dev *crg_udc,
+				 struct event_trb_s *event,
+				 unsigned long *flags)
+{
+	u32 dw3 = le32_to_cpu(event->dw3);
+	u8 dci = FIELD_GET(EVE_TRB_ENDPOINT_ID_MASK, dw3);
+	u16 comp_code = FIELD_GET(EVE_TRB_COMPL_CODE_MASK,
+				  le32_to_cpu(event->dw2));
+	struct crg_udc_ep *udc_ep_ptr;
+	struct crg_udc_request *udc_req_ptr;
+	struct transfer_trb_s *trb;
+	bool trbs_dequeued = false;
+	u32 residual;
+
+	if (dci >= CRG_NUM_EP_CX || dci == 1)
+		return -EINVAL;
+
+	udc_ep_ptr = &crg_udc->udc_ep[dci];
+	if (!udc_ep_ptr->first_trb ||
+	    get_ep_state(crg_udc, dci) == EP_STATE_DISABLED)
+		return -ENODEV;
+
+	if (comp_code != CMPL_CODE_STOPPED &&
+	    comp_code != CMPL_CODE_STOPPED_LENGTH_INVALID &&
+	    comp_code != CMPL_CODE_DISABLED &&
+	    comp_code != CMPL_CODE_DISABLED_LENGTH_INVALID &&
+	    comp_code != CMPL_CODE_HALTED &&
+	    comp_code != CMPL_CODE_HALTED_LENGTH_INVALID)
+		update_dequeue_pt(event, udc_ep_ptr);
+
+	if (is_request_dequeued(crg_udc, udc_ep_ptr, event)) {
+		trbs_dequeued = true;
+		goto queue_more_trbs;
+	}
+
+	switch (comp_code) {
+	case CMPL_CODE_SUCCESS:
+		trb = tran_trb_dma_to_virt(udc_ep_ptr,
+					   (dma_addr_t)le32_to_cpu(event->dw0) |
+					   ((dma_addr_t)le32_to_cpu(event->dw1) << 32));
+		if (!trb || list_empty(&udc_ep_ptr->queue))
+			break;
+
+		/*
+		 * A control transfer has separate data-stage and status-stage
+		 * TRBs.  The status request is an internal zero-length request
+		 * and its successful completion must not go through
+		 * crg_udc_build_td().  Doing that attempts to queue another
+		 * control TD while the status request is already on the EP0
+		 * software queue, leaving it stuck in -EINPROGRESS.  The next
+		 * SETUP then sees a non-empty queue and enumeration fails.
+		 */
+		if (FIELD_GET(TRB_TYPE_MASK, le32_to_cpu(trb->dw3)) ==
+		    TRB_TYPE_XFER_STATUS_STAGE) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request, queue);
+			if (dci == 0) {
+				udc_req_ptr->usb_req.actual = 0;
+				trbs_dequeued = true;
+				req_done(udc_ep_ptr, udc_req_ptr, 0, flags);
+				ep0_req_complete(udc_ep_ptr, flags);
+			} else {
+				dev_err(crg_udc->dev,
+					"status-stage TRB on endpoint %u\n", dci);
+			}
+			break;
+		}
+
+		if (!FIELD_GET(TRB_CHAIN_BIT_MASK, le32_to_cpu(trb->dw3))) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request, queue);
+			trbs_dequeued = true;
+
+			if (!udc_req_ptr->all_trbs_queued) {
+				int ret;
+
+				ret = crg_udc_build_td(udc_ep_ptr, udc_req_ptr);
+				if (ret) {
+					udc_req_ptr->usb_req.actual =
+						udc_req_ptr->usb_req.length -
+						udc_req_ptr->buff_len_left;
+					req_done(udc_ep_ptr, udc_req_ptr, -EIO, flags);
+				} else {
+					knock_doorbell(crg_udc, dci);
+				}
+			} else {
+				residual = FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
+						     le32_to_cpu(event->dw2));
+				if (residual > udc_req_ptr->usb_req.length)
+					residual = 0;
+				udc_req_ptr->usb_req.actual =
+					udc_req_ptr->usb_req.length - residual;
+				req_done(udc_ep_ptr, udc_req_ptr, 0, flags);
+
+				if (dci == 0 && udc_ep_ptr->desc &&
+				    usb_endpoint_xfer_control(udc_ep_ptr->desc))
+					ep0_req_complete(udc_ep_ptr, flags);
+			}
+		}
+		break;
+
+	case CMPL_CODE_SHORT_PKT:
+		if (list_empty(&udc_ep_ptr->queue))
+			break;
+
+		udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+					       struct crg_udc_request, queue);
+		residual = FIELD_GET(EVE_TRB_TRAN_LEN_MASK,
+				     le32_to_cpu(event->dw2));
+		if (residual > udc_req_ptr->usb_req.length)
+			residual = 0;
+		udc_req_ptr->usb_req.actual =
+			udc_req_ptr->usb_req.length - residual;
+
+		if (udc_req_ptr->usb_req.short_not_ok &&
+		    usb_endpoint_dir_out(udc_ep_ptr->desc))
+			req_done(udc_ep_ptr, udc_req_ptr, -EREMOTEIO, flags);
+		else
+			req_done(udc_ep_ptr, udc_req_ptr, 0, flags);
+
+		trbs_dequeued = true;
+		advance_dequeue_pt(udc_ep_ptr);
+		break;
+
+	case CMPL_CODE_PROTOCOL_STALL:
+	case CMPL_CODE_TRB_STALL:
+		if (!list_empty(&udc_ep_ptr->queue)) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request, queue);
+			req_done(udc_ep_ptr, udc_req_ptr, -EPIPE, flags);
+			trbs_dequeued = true;
+		}
+		if (dci == 0)
+			crg_udc->setup_status = WAIT_FOR_SETUP;
+		break;
+
+	case CMPL_CODE_SETUP_TAG_MISMATCH:
+		/*
+		 * EP0 SETUP changes are serialized by the SETUP event handler.
+		 * When a new SETUP arrives, crg_udc_abort_ep0_for_setup() stops
+		 * EP0, gives back the old request, resets the EP0 ring, and then
+		 * accepts the new SETUP. A SETUP_TAG_MISMATCH event generated
+		 * afterwards therefore belongs to the aborted control transfer.
+		 *
+		 * Do not complete the current EP0 request or change setup_status
+		 * here: doing so could operate on the new control transfer and
+		 * recreate the EP0 queue/state race this path is intended to avoid.
+		 */
+		if (dci == 0) {
+			dev_dbg(crg_udc->dev,
+				"ignoring stale EP0 SETUP_TAG_MISMATCH\n");
+			break;
+		}
+
+		/* This completion code is meaningful only for EP0. */
+		dev_warn(crg_udc->dev,
+			 "SETUP_TAG_MISMATCH on non-EP0 endpoint %u\n", dci);
+		break;
+
+	case CMPL_CODE_BABBLE_DETECTED_ERR:
+	case CMPL_CODE_DATA_BUFFER_ERR:
+	case CMPL_CODE_INVALID_STREAM_TYPE_ERR:
+	case CMPL_CODE_RING_UNDERRUN:
+	case CMPL_CODE_RING_OVERRUN:
+	case CMPL_CODE_EVENT_RING_FULL_ERR:
+	case CMPL_CODE_ISOCH_BUFFER_OVERRUN:
+	case CMPL_CODE_USB_TRANS_ERR:
+	case CMPL_CODE_TRB_ERR:
+		dev_err(crg_udc->dev,
+			"transfer error, completion code 0x%x\n", comp_code);
+		if (!list_empty(&udc_ep_ptr->queue)) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request, queue);
+			req_done(udc_ep_ptr, udc_req_ptr, -EIO, flags);
+			trbs_dequeued = true;
+		}
+		if (dci)
+			set_ep_halt(crg_udc, dci, flags);
+		break;
+
+	case CMPL_CODE_STOPPED:
+	case CMPL_CODE_STOPPED_LENGTH_INVALID:
+	case CMPL_CODE_HALTED:
+	case CMPL_CODE_HALTED_LENGTH_INVALID:
+	case CMPL_CODE_DISABLED:
+	case CMPL_CODE_DISABLED_LENGTH_INVALID:
+		break;
+
+	default:
+		dev_err(crg_udc->dev,
+			"unsupported transfer completion code 0x%x\n", comp_code);
+		if (!list_empty(&udc_ep_ptr->queue)) {
+			udc_req_ptr = list_first_entry(&udc_ep_ptr->queue,
+						       struct crg_udc_request, queue);
+			req_done(udc_ep_ptr, udc_req_ptr, -EIO, flags);
+			trbs_dequeued = true;
+		}
+		break;
+	}
+
+queue_more_trbs:
+	if (trbs_dequeued && udc_ep_ptr->tran_ring_full) {
+		udc_ep_ptr->tran_ring_full = false;
+		if (queue_pending_trbs(udc_ep_ptr))
+			udc_ep_ptr->tran_ring_full = true;
+	}
+
+	return 0;
+}
+
+static int crg_handle_port_status(struct crg_gadget_dev *crg_udc,
+				  unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	bool was_connected = crg_udc->connected;
+	u32 portsc_val;
+	u32 tmp;
+	u32 speed;
+
+	/* handle Port Reset */
+	portsc_val = readl(&uccr->portsc);
+	writel(portsc_val & CRG_U3DC_PORTSC_W1C_MASK, &uccr->portsc);
+
+	tmp = readl(&uccr->portsc);
+
+	if (portsc_val & CRG_U3DC_PORTSC_PRC) {
+		tmp = readl(&uccr->portsc);
+		if (tmp & CRG_U3DC_PORTSC_PRC) {
+			dev_dbg(crg_udc->dev, "PRC is still set\n");
+		} else if (tmp & CRG_U3DC_PORTSC_PR) {
+			/* first port status change event for port reset */
+			dev_dbg(crg_udc->dev,
+				"PRC is not set, but PR is set\n");
+		} else {
+			if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) != 0 ||
+			    (!(tmp & CRG_U3DC_PORTSC_PED))) {
+				dev_dbg(crg_udc->dev, "portsc=0x%x no PED\n",
+					tmp);
+				return 0;
+			}
+
+			switch (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp)) {
+			case CRG_U3DC_PORTSC_SPEED_SSP:
+				speed = USB_SPEED_SUPER_PLUS;
+				break;
+			case CRG_U3DC_PORTSC_SPEED_SS:
+				speed = USB_SPEED_SUPER;
+				break;
+			case CRG_U3DC_PORTSC_SPEED_HS:
+				speed = USB_SPEED_HIGH;
+				break;
+
+			case CRG_U3DC_PORTSC_SPEED_FS:
+				speed = USB_SPEED_FULL;
+				break;
+
+			case CRG_U3DC_PORTSC_SPEED_LS:
+				speed = USB_SPEED_LOW;
+				break;
+			default:
+				speed = USB_SPEED_UNKNOWN;
+				return 0;
+			}
+
+			if (crg_udc->device_state >= USB_STATE_DEFAULT)
+				crg_udc_reinit(crg_udc, flags);
+
+			crg_udc->gadget.speed = speed;
+
+			update_ep0_maxpacketsize(crg_udc);
+
+			crg_udc->connected = 1;
+
+			if (crg_udc->device_state < USB_STATE_RECONNECTING)
+				enable_setup(crg_udc);
+		}
+	}
+	/* handle Port Reset end */
+
+	/* handle Port Connection Change */
+	tmp = readl(&uccr->portsc);
+	if ((tmp & (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) ==
+	    (CRG_U3DC_PORTSC_CCS | CRG_U3DC_PORTSC_PP)) {
+		if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) != 0 ||
+		    (!(tmp & CRG_U3DC_PORTSC_PED)))
+			return 0;
+
+		switch (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp)) {
+		case CRG_U3DC_PORTSC_SPEED_SSP:
+			speed = USB_SPEED_SUPER_PLUS;
+			break;
+		case CRG_U3DC_PORTSC_SPEED_SS:
+			speed = USB_SPEED_SUPER;
+			break;
+		case CRG_U3DC_PORTSC_SPEED_HS:
+			speed = USB_SPEED_HIGH;
+			break;
+
+		case CRG_U3DC_PORTSC_SPEED_FS:
+			speed = USB_SPEED_FULL;
+			break;
+
+		case CRG_U3DC_PORTSC_SPEED_LS:
+			speed = USB_SPEED_LOW;
+			break;
+		default:
+			speed = USB_SPEED_UNKNOWN;
+			return 0;
+		}
+		crg_udc->gadget.speed = speed;
+
+		update_ep0_maxpacketsize(crg_udc);
+
+		crg_udc->connected = 1;
+
+		if (crg_udc->device_state < USB_STATE_RECONNECTING)
+			enable_setup(crg_udc);
+
+	} else if (!(tmp & CRG_U3DC_PORTSC_CCS)) {
+		bool cable_connected;
+		int ccs_drop_ignore = 0;
+
+		if ((FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) == 0x0) &&
+		    (FIELD_GET(CRG_U3DC_PORTSC_SPEED_MASK, tmp) <
+		     CRG_U3DC_PORTSC_SPEED_SS)) {
+			ccs_drop_ignore = 1;
+			dev_err(crg_udc->dev, "ccs glitch detect on HS/FS!\n");
+		}
+
+		if (!ccs_drop_ignore)
+			crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+
+		cable_connected = crg_udc_vbus_connected(crg_udc);
+		if (cable_connected && !ccs_drop_ignore) {
+			crg_udc->device_state = USB_STATE_POWERED;
+			crg_udc_reinit(crg_udc, flags);
+			crg_udc->connected = 0;
+		} else if (!cable_connected) {
+			dev_dbg(crg_udc->dev,
+				"cable disconnected, rst controller\n");
+			if (was_connected)
+				crg_udc_notify_disconnect(crg_udc, flags);
+			if (crg_udc_reset(crg_udc, flags))
+				dev_err(crg_udc->dev, "controller reset failed on disconnect\n");
+			reset_data_struct(crg_udc);
+			crg_udc->connected = 0;
+			init_ep0(crg_udc);
+
+			crg_udc->device_state = USB_STATE_ATTACHED;
+			return -ECONNRESET;
+		}
+	}
+	/* handle Port Connection Change end*/
+
+	if (portsc_val & CRG_U3DC_PORTSC_PLC) {
+		tmp = readl(&uccr->portsc);
+		if (FIELD_GET(CRG_U3DC_PORTSC_PLS_MASK, tmp) == 0xf) {
+			FIELD_MODIFY(CRG_U3DC_PORTSC_PLS_MASK, &tmp, 0x0);
+			writel(tmp, &uccr->portsc);
+		}
+	}
+
+	return 0;
+}
+
+static int crg_udc_handle_event(struct crg_gadget_dev *crg_udc,
+				struct event_trb_s *event, unsigned long *flags)
+{
+	int ret;
+
+	switch (FIELD_GET(EVE_TRB_TYPE_MASK, le32_to_cpu(event->dw3))) {
+	case TRB_TYPE_EVT_PORT_STATUS_CHANGE:
+		if (crg_udc->device_state == USB_STATE_RECONNECTING) {
+			crg_udc->portsc_on_reconnecting = 1;
+			break;
+		}
+		/* 1.Port Reset  2.Port Connection Change 3.Port Link Change */
+		ret = crg_handle_port_status(crg_udc, flags);
+		if (ret)
+			return ret;
+
+		break;
+	case TRB_TYPE_EVT_TRANSFER:
+		if (crg_udc->device_state < USB_STATE_RECONNECTING) {
+			dev_err(crg_udc->dev,
+				"Xfer compl event rcved when dev state=%d !\n",
+				crg_udc->device_state);
+			break;
+		}
+
+		ret = crg_handle_xfer_event(crg_udc, event, flags);
+		if (ret)
+			return ret;
+		break;
+	case TRB_TYPE_EVT_SETUP_PKT: {
+		struct usb_ctrlrequest setup;
+		u32 dw0 = le32_to_cpu(event->dw0);
+		u32 dw1 = le32_to_cpu(event->dw1);
+		u8 setup_tag;
+
+		BUILD_BUG_ON(sizeof(struct usb_ctrlrequest) != 8);
+		setup.bRequestType = dw0 & 0xff;
+		setup.bRequest = (dw0 >> 8) & 0xff;
+		setup.wValue = cpu_to_le16((dw0 >> 16) & 0xffff);
+		setup.wIndex = cpu_to_le16(dw1 & 0xffff);
+		setup.wLength = cpu_to_le16((dw1 >> 16) & 0xffff);
+
+		setup_tag =
+			FIELD_GET(EVE_TRB_SETUP_TAG_MASK, le32_to_cpu(event->dw3));
+		if (crg_udc->setup_status != WAIT_FOR_SETUP) {
+			/* A new SETUP aborts the previous control transfer. The old
+			 * EP0 request must be completed and its TRBs discarded before
+			 * the new setup is handed to the gadget driver.
+			 */
+			if (crg_udc_abort_ep0_for_setup(crg_udc, flags)) {
+				set_ep0_halt(crg_udc);
+				break;
+			}
+		}
+
+		crg_handle_setup_pkt(crg_udc, &setup, setup_tag, flags);
+
+		break;
+	}
+	default:
+		dev_dbg(crg_udc->dev, "unexpected TRB_TYPE = 0x%lx",
+			FIELD_GET(EVE_TRB_TYPE_MASK, le32_to_cpu(event->dw3)));
+		break;
+	}
+
+	return 0;
+}
+
+static int process_event_ring(struct crg_gadget_dev *crg_udc, int index,
+			      unsigned long *flags)
+{
+	struct event_trb_s *event;
+	struct crg_udc_event *udc_event;
+	struct crg_uicr __iomem *uicr = crg_udc->uicr[index];
+	u32 val;
+	dma_addr_t erdp;
+	int ret;
+	unsigned int processed = 0;
+
+	if (!uicr)
+		return -ENODEV;
+
+	val = readl(&uicr->iman);
+	val |= CRG_U3DC_IMAN_INT_PEND;
+	writel(val, &uicr->iman);
+
+	udc_event = &crg_udc->udc_event[index];
+	while (udc_event->evt_dq_pt) {
+		/* rmb */
+		dma_rmb();
+		event = (struct event_trb_s *)udc_event->evt_dq_pt;
+
+		if (FIELD_GET(EVE_TRB_CYCLE_BIT_MASK, le32_to_cpu(event->dw3)) !=
+		    udc_event->ccs)
+			break;
+
+		ret = crg_udc_handle_event(crg_udc, event, flags);
+		if (ret < 0) {
+			dev_err(crg_udc->dev,
+				"failed to process event: %d\n", ret);
+			return ret;
+		}
+		if (event == udc_event->evt_seg0_last_trb) {
+			udc_event->ccs = udc_event->ccs ? 0 : 1;
+			udc_event->evt_dq_pt = udc_event->event_ring.cpu_addr;
+		} else {
+			udc_event->evt_dq_pt++;
+		}
+
+		/*
+		 * udc_event state is only re-read from crg_udc, never cached
+		 * across this drop, so releasing and reacquiring the lock
+		 * here is safe and lets other udc_lock users, and this CPU's
+		 * other interrupts, make progress during a busy event ring.
+		 */
+		if (++processed % CRG_EVENT_RING_BATCH == 0) {
+			spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+			cond_resched();
+			spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+		}
+	}
+
+	/* update dequeue pointer */
+	erdp = event_trb_virt_to_dma(udc_event, udc_event->evt_dq_pt);
+	if (dma_mapping_error(crg_udc->dev, erdp))
+		return -EINVAL;
+	writel(upper_32_bits(erdp), &uicr->erdphi);
+	writel(lower_32_bits(erdp) | CRG_U3DC_ERDPLO_EHB, &uicr->erdplo);
+
+	return 0;
+}
+
+static int crg_gadget_handle_interrupt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 tmp_status;
+	unsigned long flags = 0;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	tmp_status = readl(&uccr->status);
+
+	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
+		dev_err(crg_udc->dev, "controller system error\n");
+		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
+		ret = crg_udc_reset(crg_udc, &flags);
+		if (!ret)
+			ret = reset_data_struct(crg_udc);
+		if (!ret)
+			ret = init_ep0(crg_udc);
+		if (ret)
+			dev_err(crg_udc->dev,
+				"failed to recover from controller error: %d\n", ret);
+		crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+		crg_udc->connected = 0;
+	}
+
+	if (tmp_status & CRG_U3DC_STATUS_EINT) {
+		int i;
+
+		writel(CRG_U3DC_STATUS_EINT, &uccr->status);
+
+		/* process event rings */
+		for (i = 0; i < CRG_RING_NUM; i++) {
+			ret = process_event_ring(crg_udc, i, &flags);
+			if (ret) {
+				dev_err(crg_udc->dev,
+					"process event ring error: %d\n", ret);
+			}
+		}
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->portsc_on_reconnecting == 1 &&
+	    is_event_rings_empty(crg_udc)) {
+		crg_udc->portsc_on_reconnecting = 0;
+		crg_handle_port_status(crg_udc, &flags);
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->connected == 1) {
+		prepare_for_setup(crg_udc, &flags);
+	}
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+/*
+ * Primary handler only checks whether the shared interrupt belongs to the
+ * controller. All controller work, including reset polling, runs in the
+ * threaded handler and therefore never busy-waits in hard IRQ context.
+ */
+static irqreturn_t crg_udc_common_irq(int irq, void *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status = readl(&uccr->status);
+
+	if (!(status & (CRG_U3DC_STATUS_EINT | CRG_U3DC_STATUS_SYS_ERR)))
+		return IRQ_NONE;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t crg_udc_irq_thread(int irq, void *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev;
+
+	crg_gadget_handle_interrupt(crg_udc);
+
+	return IRQ_HANDLED;
+}
+
+static int crg_gadget_irq_init(struct platform_device *pdev,
+			       struct crg_gadget_dev *crg_udc)
+{
+	int irq;
+	int ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	crg_udc->irq = irq;
+
+	/*
+	 * IRQF_ONESHOT keeps this (level-triggered) line masked until
+	 * crg_udc_irq_thread() has cleared the status bits, which is the
+	 * correct pairing for IRQF_SHARED with a threaded handler.
+	 */
+	ret = devm_request_threaded_irq(&pdev->dev, irq, crg_udc_common_irq,
+					crg_udc_irq_thread,
+					IRQF_SHARED | IRQF_ONESHOT,
+					"crg_udc", crg_udc);
+	if (ret)
+		dev_err(crg_udc->dev, "request of irq%d failed\n", irq);
+
+	return ret;
+}
+
+/* quirk bits carried in the of_device_id match data */
+#define CRG_QUIRK_DIS_U1U2_ENTRY BIT(0)
+#define CRG_QUIRK_DIS_U1U2_INITIATION BIT(1)
+#define CRG_QUIRK_REINIT_EP0_ON_RESET BIT(2)
+
+#define CRG_UDC_QUIRKS_DEFAULT (CRG_QUIRK_DIS_U1U2_ENTRY | \
+				CRG_QUIRK_DIS_U1U2_INITIATION | \
+				CRG_QUIRK_REINIT_EP0_ON_RESET)
+
+struct crg_udc_priv {
+	u32 quirks;
+};
+
+static const struct crg_udc_priv crg_udc_data = {
+	.quirks = CRG_UDC_QUIRKS_DEFAULT,
+};
+
+static const struct of_device_id of_crg_udc_match[] = {
+	{ .compatible = "axiado,ax3000-udc", .data = &crg_udc_data },
+	{ .compatible = "axiado,ax3005-udc", .data = &crg_udc_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_crg_udc_match);
+
+static void crg_udc_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static void crg_udc_reset_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static void crg_udc_phy_exit(void *data)
+{
+	struct phy *phy = data;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+}
+
+static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
+{
+	struct device *dev = crg_udc->dev;
+	int ret;
+
+	crg_udc->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(crg_udc->clk))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
+				     "failed to get clock\n");
+
+	ret = clk_prepare_enable(crg_udc->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	ret = devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk);
+	if (ret)
+		return ret;
+
+	crg_udc->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(crg_udc->rst))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->rst),
+				     "failed to get reset\n");
+
+	ret = reset_control_deassert(crg_udc->rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to deassert reset\n");
+
+	ret = devm_add_action_or_reset(dev, crg_udc_reset_assert, crg_udc->rst);
+	if (ret)
+		return ret;
+
+	crg_udc->phy = devm_phy_optional_get(dev, NULL);
+	if (IS_ERR(crg_udc->phy))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->phy),
+				     "failed to get phy\n");
+
+	ret = phy_init(crg_udc->phy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init phy\n");
+
+	ret = phy_power_on(crg_udc->phy);
+	if (ret) {
+		phy_exit(crg_udc->phy);
+		return dev_err_probe(dev, ret, "failed to power on phy\n");
+	}
+
+	return devm_add_action_or_reset(dev, crg_udc_phy_exit, crg_udc->phy);
+}
+
+static void crg_udc_free_resources(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	if (crg_udc->uccr) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN);
+		writel(val, &crg_udc->uccr->control);
+	}
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		struct crg_udc_event *udc_event = &crg_udc->udc_event[i];
+
+		if (udc_event->event_ring.cpu_addr) {
+			dma_free_coherent(crg_udc->dev,
+					  udc_event->event_ring.len,
+					  udc_event->event_ring.cpu_addr,
+					  udc_event->event_ring.dma_addr);
+			udc_event->event_ring.cpu_addr = NULL;
+			udc_event->event_ring.dma_addr = DMA_MAPPING_ERROR;
+			udc_event->event_ring.len = 0;
+			udc_event->evt_dq_pt = NULL;
+		}
+		if (udc_event->erst.cpu_addr) {
+			dma_free_coherent(crg_udc->dev, udc_event->erst.len,
+					  udc_event->erst.cpu_addr,
+					  udc_event->erst.dma_addr);
+			udc_event->erst.cpu_addr = NULL;
+			udc_event->erst.dma_addr = DMA_MAPPING_ERROR;
+			udc_event->erst.len = 0;
+			udc_event->p_erst = NULL;
+		}
+	}
+
+	if (crg_udc->ep_cx.cpu_addr) {
+		dma_free_coherent(crg_udc->dev, crg_udc->ep_cx.len,
+				  crg_udc->ep_cx.cpu_addr,
+				  crg_udc->ep_cx.dma_addr);
+		crg_udc->ep_cx.cpu_addr = NULL;
+		crg_udc->ep_cx.dma_addr = DMA_MAPPING_ERROR;
+		crg_udc->ep_cx.len = 0;
+		crg_udc->p_epcx = NULL;
+	}
+
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *udc_ep = &crg_udc->udc_ep[i];
+
+		if (udc_ep->tran_ring_info.cpu_addr) {
+			dma_free_coherent(crg_udc->dev,
+					  udc_ep->tran_ring_info.len,
+					  udc_ep->tran_ring_info.cpu_addr,
+					  udc_ep->tran_ring_info.dma_addr);
+			udc_ep->tran_ring_info.cpu_addr = NULL;
+			udc_ep->tran_ring_info.dma_addr = DMA_MAPPING_ERROR;
+			udc_ep->tran_ring_info.len = 0;
+			udc_ep->first_trb = NULL;
+			udc_ep->last_trb = NULL;
+			udc_ep->enq_pt = NULL;
+			udc_ep->deq_pt = NULL;
+		}
+	}
+
+	if (crg_udc->status_req) {
+		crg_udc_free_request(&crg_udc->udc_ep[0].usb_ep,
+				     &crg_udc->status_req->usb_req);
+		crg_udc->status_req = NULL;
+	}
+}
+
+static int crg_udc_probe(struct platform_device *pdev)
+{
+	unsigned long flags = 0;
+	int ret;
+	int i;
+	struct crg_gadget_dev *crg_udc;
+	const struct crg_udc_priv *priv;
+
+	priv = device_get_match_data(&pdev->dev);
+	if (!priv)
+		return -ENODEV;
+
+	crg_udc = devm_kzalloc(&pdev->dev, sizeof(*crg_udc), GFP_KERNEL);
+	if (!crg_udc)
+		return -ENOMEM;
+
+	crg_udc->udc_id = ida_alloc(&crg_udc_ida, GFP_KERNEL);
+	if (crg_udc->udc_id < 0)
+		return crg_udc->udc_id;
+	crg_udc->dev = &pdev->dev;
+	crg_udc->irq = -1;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(&pdev->dev, "no usable DMA mask\n");
+			goto err_free_resources;
+		}
+	}
+
+	ret = crg_udc_init_hw(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->ep0_desc.bLength = USB_DT_ENDPOINT_SIZE;
+	crg_udc->ep0_desc.bDescriptorType = USB_DT_ENDPOINT;
+	crg_udc->ep0_desc.bEndpointAddress = 0;
+	crg_udc->ep0_desc.bmAttributes = USB_ENDPOINT_XFER_CONTROL;
+	crg_udc->ep0_desc.wMaxPacketSize = cpu_to_le16(64);
+
+	crg_udc->u12_forbidden = priv->quirks & CRG_QUIRK_DIS_U1U2_ENTRY;
+	crg_udc->u12_initiate_forbidden =
+		priv->quirks & CRG_QUIRK_DIS_U1U2_INITIATION;
+	crg_udc->reinit_ep0_on_bus_reset =
+		priv->quirks & CRG_QUIRK_REINIT_EP0_ON_RESET;
+
+	snprintf(crg_udc->name, sizeof(crg_udc->name), "gadget-%d",
+		 crg_udc->udc_id);
+
+	spin_lock_init(&crg_udc->udc_lock);
+	platform_set_drvdata(pdev, crg_udc);
+
+	dev_set_name(&crg_udc->gadget.dev, crg_udc->name);
+	crg_udc->gadget.ops = &crg_gadget_ops;
+	crg_udc->gadget.ep0 = &crg_udc->udc_ep[0].usb_ep;
+	crg_udc->gadget.dev.parent = &pdev->dev;
+	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
+	/*
+	 * The controller supports up to SuperSpeed. Honour the standard
+	 * "maximum-speed" property to cap it; default to the hardware
+	 * maximum when the property is absent.
+	 */
+	crg_udc->gadget.max_speed = usb_get_maximum_speed(&pdev->dev);
+	if (crg_udc->gadget.max_speed == USB_SPEED_UNKNOWN)
+		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
+	crg_udc->gadget.speed = crg_udc->gadget.max_speed;
+	crg_udc->gadget.name = crg_udc->name;
+	crg_udc->gadget.sg_supported = true;
+	crg_udc->connected = 0;
+	crg_udc->dev_addr = 0;
+
+	crg_udc->mmio_virt_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(crg_udc->mmio_virt_base)) {
+		ret = dev_err_probe(&pdev->dev,
+				    PTR_ERR(crg_udc->mmio_virt_base),
+				    "failed to map registers\n");
+		goto err_ida_free;
+	}
+
+	/* set controller device role */
+	writel((readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) |
+		CRGUDC_ROLE_DEVICE),
+	       crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		crg_udc->uicr[i] = crg_udc->mmio_virt_base + CRG_UICR_OFFSET +
+				   i * CRG_UICR_STRIDE;
+	}
+	crg_udc->uccr = crg_udc->mmio_virt_base + CRG_UCCR_OFFSET;
+
+	ret = crg_udc_reset(crg_udc, &flags);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc_clear_portpm(crg_udc);
+
+	ret = crg_gadget_irq_init(pdev, crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	ret = reset_data_struct(crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "reset_data_struct error\n");
+		goto err_free_resources;
+	}
+
+	init_ep_info(crg_udc);
+	ret = init_ep0(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	ep0_start(crg_udc);
+
+	ret = usb_add_gadget_udc(&pdev->dev, &crg_udc->gadget);
+	if (ret)
+		goto err_free_resources;
+
+	return 0;
+
+err_free_resources:
+	crg_udc_free_resources(crg_udc);
+err_ida_free:
+	ida_free(&crg_udc_ida, crg_udc->udc_id);
+	return ret;
+}
+
+static void crg_udc_remove(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	u32 tmp;
+
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_vbus_detect(crg_udc, 0);
+
+	usb_del_gadget_udc(&crg_udc->gadget);
+	crg_udc_free_resources(crg_udc);
+	ida_free(&crg_udc_ida, crg_udc->udc_id);
+
+	/* set controller host role */
+	tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
+	writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+
+	platform_set_drvdata(pdev, NULL);
+}
+
+static void crg_udc_shutdown(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_vbus_detect(crg_udc, 0);
+	crg_gadget_pullup(&crg_udc->gadget, 0);
+	if (crg_udc->uccr) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~CRG_U3DC_CTRL_INT_EN;
+		writel(val, &crg_udc->uccr->control);
+	}
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+}
+
+static int __maybe_unused crg_udc_suspend(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+
+	/* Stop the pullup while the controller is suspended. */
+	crg_gadget_pullup(&crg_udc->gadget, 0);
+	return 0;
+}
+
+static int __maybe_unused crg_udc_resume(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+
+	if (crg_udc->gadget_driver)
+		return crg_gadget_pullup(&crg_udc->gadget, 1);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend, crg_udc_resume);
+
+static struct platform_driver crg_udc_driver = {
+	.probe = crg_udc_probe,
+	.remove = crg_udc_remove,
+	.shutdown = crg_udc_shutdown,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_crg_udc_match,
+		.pm = &crg_udc_pm_ops,
+	},
+};
+module_platform_driver(crg_udc_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado AX3000/AX3005 USB Device Controller)");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/gadget/udc/crg_udc.h b/drivers/usb/gadget/udc/crg_udc.h
new file mode 100644
index 000000000000..d6d1ad3163b2
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg_udc.h
@@ -0,0 +1,355 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+
+#ifndef CRG_UDC_H
+#define CRG_UDC_H
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
+#define CRG_UCCR_OFFSET 0x2400
+#define CRG_UICR_OFFSET 0x2500
+#define CRG_UICR_STRIDE 0x20
+
+/* Corigine USB 3.1 device core register layout. */
+struct crg_uccr {
+	u32 capability;
+	u32 resv0[3];
+
+	u32 config0;
+	u32 config1;
+	u32 resv1[2];
+
+	u32 control;
+	u32 status;
+	u32 dcbaplo;
+	u32 dcbaphi;
+	u32 portsc;
+	u32 u3portpmsc;
+	u32 u2portpmsc;
+	u32 u3portli;
+
+	u32 doorbell;
+	u32 mfindex;
+	u32 speed_select;
+	u32 resv3[5];
+
+	u32 ep_enable;
+	u32 ep_running;
+	u32 resv4[2];
+
+	u32 cmd_param0;
+	u32 cmd_param1;
+	u32 cmd_control;
+	u32 resv5[1];
+
+	u32 odb_capability;
+	u32 resv6[3];
+	u32 odb_config[8];
+
+	u32 debug0;
+};
+
+struct crg_uicr {
+	u32 iman;
+	u32 imod;
+	u32 erstsz;
+	u32 resv0;
+
+	u32 erstbalo;
+	u32 erstbahi;
+	u32 erdplo;
+	u32 erdphi;
+};
+
+/* config0/config1 registers */
+#define CRG_U3DC_CFG0_MAXSPEED_MASK GENMASK(3, 0)
+#define CRG_U3DC_CFG0_MAXSPEED_FS 1
+#define CRG_U3DC_CFG0_MAXSPEED_HS 3
+#define CRG_U3DC_CFG0_MAXSPEED_SS 4
+#define CRG_U3DC_CFG0_MAXSPEED_SSP 5
+
+#define CRG_U3DC_CFG1_CSC_EVENT_EN BIT(0)
+#define CRG_U3DC_CFG1_PEC_EVENT_EN BIT(1)
+#define CRG_U3DC_CFG1_PPC_EVENT_EN BIT(3)
+#define CRG_U3DC_CFG1_PRC_EVENT_EN BIT(4)
+#define CRG_U3DC_CFG1_PLC_EVENT_EN BIT(5)
+#define CRG_U3DC_CFG1_CEC_EVENT_EN BIT(6)
+
+#define CRG_U3DC_CFG1_U3_ENTRY_EN BIT(8)
+#define CRG_U3DC_CFG1_L1_ENTRY_EN BIT(9)
+#define CRG_U3DC_CFG1_U3_RESUME_EN BIT(10)
+#define CRG_U3DC_CFG1_L1_RESUME_EN BIT(11)
+#define CRG_U3DC_CFG1_INACTIVE_PLC_EN BIT(12)
+#define CRG_U3DC_CFG1_U3_RESUME_NORESP_PLC_EN BIT(13)
+#define CRG_U3DC_CFG1_U2_RESUME_NORESP_PLC_EN BIT(14)
+
+#define CRG_U3DC_CFG1_SETUP_EVENT_EN BIT(16)
+
+/* control register */
+#define CRG_U3DC_CTRL_RUN BIT(0)
+#define CRG_U3DC_CTRL_STOP 0
+#define CRG_U3DC_CTRL_SWRST BIT(1)
+#define CRG_U3DC_CTRL_INT_EN BIT(2)
+#define CRG_U3DC_CTRL_SYSERR_EN BIT(3)
+#define CRG_U3DC_CTRL_EWE BIT(10)
+#define CRG_U3DC_CTRL_KP_CNCT BIT(11)
+
+/* status register */
+#define CRG_U3DC_STATUS_DEV_CTRL_HALT BIT(0)
+#define CRG_U3DC_STATUS_SYS_ERR BIT(2)
+#define CRG_U3DC_STATUS_EINT BIT(3)
+
+/* portsc register */
+#define CRG_U3DC_PORTSC_CCS BIT(0)
+#define CRG_U3DC_PORTSC_PED BIT(1)
+#define CRG_U3DC_PORTSC_PP BIT(3)
+#define CRG_U3DC_PORTSC_PR BIT(4)
+#define CRG_U3DC_PORTSC_PLS_MASK GENMASK(8, 5)
+
+#define CRG_U3DC_PORTSC_SPEED_MASK GENMASK(13, 10)
+#define CRG_U3DC_PORTSC_SPEED_FS 0x1
+#define CRG_U3DC_PORTSC_SPEED_LS 0x2
+#define CRG_U3DC_PORTSC_SPEED_HS 0x3
+#define CRG_U3DC_PORTSC_SPEED_SS 0x4
+#define CRG_U3DC_PORTSC_SPEED_SSP 0x5
+
+#define CRG_U3DC_PORTSC_LWS BIT(16)
+#define CRG_U3DC_PORTSC_CSC BIT(17)
+#define CRG_U3DC_PORTSC_PEC BIT(18)
+#define CRG_U3DC_PORTSC_PPC BIT(20)
+#define CRG_U3DC_PORTSC_PRC BIT(21)
+#define CRG_U3DC_PORTSC_PLC BIT(22)
+#define CRG_U3DC_PORTSC_CEC BIT(23)
+#define CRG_U3DC_PORTSC_WCE BIT(25)
+#define CRG_U3DC_PORTSC_WDE BIT(26)
+#define CRG_U3DC_PORTSC_WPR BIT(31)
+
+#define CRG_U3DC_PORTSC_W1C_MASK (CRG_U3DC_PORTSC_CSC | \
+				  CRG_U3DC_PORTSC_PEC | \
+				  CRG_U3DC_PORTSC_PPC | \
+				  CRG_U3DC_PORTSC_PRC | \
+				  CRG_U3DC_PORTSC_PLC | \
+				  CRG_U3DC_PORTSC_CEC)
+
+/* u3portpmsc */
+#define CRG_U3DC_U3PORTPM_U1TMOUT_MASK GENMASK(7, 0)
+#define CRG_U3DC_U3PORTPM_U2TMOUT_MASK GENMASK(15, 8)
+#define CRG_U3DC_U3PORTPM_FLA BIT(16)
+#define CRG_U3DC_U3PORTPM_U1IEN BIT(20)
+#define CRG_U3DC_U3PORTPM_U2IEN BIT(21)
+#define CRG_U3DC_U3PORTPM_U1AEN BIT(22)
+#define CRG_U3DC_U3PORTPM_U2AEN BIT(23)
+
+#define CRG_U3DC_U3PORTPM_U1U2TMOUT_MASK GENMASK(31, 24)
+
+/* u2portpmsc */
+#define CRG_U3DC_U2PORTPM_RJ_TH_MASK GENMASK(3, 0)
+#define CRG_U3DC_U2PORTPM_DS_TH_MASK GENMASK(7, 4)
+#define CRG_U3DC_U2PORTPM_LPM_EN BIT(8)
+#define CRG_U3DC_U2PORTPM_RJ_TH_EN BIT(9)
+#define CRG_U3DC_U2PORTPM_DS_EN BIT(10)
+#define CRG_U3DC_U2PORTPM_SLP_EN BIT(11)
+#define CRG_U3DC_U2PORTPM_LPM_FACK BIT(12)
+#define CRG_U3DC_U2PORTPM_L1_AEX BIT(13)
+#define CRG_U3DC_U2PORTPM_H_B_MASK GENMASK(19, 16)
+#define CRG_U3DC_U2PORTPM_RWE BIT(20)
+#define CRG_U3DC_U2PORTPM_TM_MASK GENMASK(31, 28)
+
+/* doorbell register */
+#define CRG_U3DC_DB_TARGET_MASK GENMASK(4, 0)
+
+/* odb registers */
+#define CRG_U3DC_ODBCFG_2N_OFFSET_MASK GENMASK(9, 0)
+#define CRG_U3DC_ODBCFG_2N_SIZE_MASK GENMASK(12, 10)
+#define CRG_U3DC_ODBCFG_2N1_OFFSET_MASK GENMASK(25, 16)
+#define CRG_U3DC_ODBCFG_2N1_SIZE_MASK GENMASK(28, 26)
+
+/* command control register */
+#define CRG_U3DC_CMD_CTRL_ACTIVE BIT(0)
+#define CRG_U3DC_CMD_CTRL_IOC_EN BIT(1)
+#define CRG_U3DC_CMD_CTRL_TYPE_MASK GENMASK(7, 4)
+#define CRG_U3DC_CMD_CTRL_STATUS_MASK GENMASK(19, 16)
+
+/* interrupt register / IMAN bits */
+#define CRG_U3DC_IMAN_INT_PEND BIT(0)
+#define CRG_U3DC_IMAN_INT_EN BIT(1)
+
+/* erdp bits */
+#define CRG_U3DC_ERDPLO_EHB BIT(3)
+
+/* command parameters: init EP0 */
+#define CRG_CMD0_0_DQPTRLO_MASK GENMASK(31, 4)
+#define CRG_CMD0_0_DCS_MASK BIT(0)
+
+/* command parameters: update EP0 */
+#define CRG_CMD1_0_MPS_MASK GENMASK(31, 16)
+
+/* command parameters: set address */
+#define CRG_CMD2_0_DEV_ADDR_MASK GENMASK(7, 0)
+
+#define CRG_UDC_MODE_REG 0x20fc
+#define CRGUDC_ROLE_DEVICE 0x1
+/* Vendor specific register */
+#define CRG_UDC_VENDOR_REG 0x210c
+#define CRG_UDC_VBUS_DETECT BIT(26)
+
+/*
+ * Device-visible data structures. The controller reads and writes these
+ * over DMA, so the layouts and field encodings below are fixed by the
+ * hardware in the same way as the register definitions above.
+ */
+
+/* Transfer and event TRB types */
+enum crg_trb_type {
+	TRB_TYPE_RSVD = 0,
+	TRB_TYPE_XFER_NORMAL,
+	TRB_TYPE_RSVD2,
+	TRB_TYPE_XFER_DATA_STAGE,
+	TRB_TYPE_XFER_STATUS_STAGE,
+	TRB_TYPE_XFER_DATA_ISOCH,
+	TRB_TYPE_LINK,
+	TRB_TYPE_RSVD7,
+	TRB_TYPE_NO_OP,
+
+	TRB_TYPE_EVT_TRANSFER = 32,
+	TRB_TYPE_EVT_CMD_COMPLETION = 33,
+	TRB_TYPE_EVT_PORT_STATUS_CHANGE = 34,
+	TRB_TYPE_EVT_MFINDEX_WRAP = 39,
+	TRB_TYPE_EVT_SETUP_PKT = 40,
+};
+
+/* Event TRB completion codes */
+enum crg_trb_cmpl_code {
+	CMPL_CODE_INVALID = 0,
+	CMPL_CODE_SUCCESS,
+	CMPL_CODE_DATA_BUFFER_ERR,
+	CMPL_CODE_BABBLE_DETECTED_ERR,
+	CMPL_CODE_USB_TRANS_ERR,
+	CMPL_CODE_TRB_ERR,
+	CMPL_CODE_TRB_STALL,
+	CMPL_CODE_INVALID_STREAM_TYPE_ERR = 10,
+	CMPL_CODE_SHORT_PKT = 13,
+	CMPL_CODE_RING_UNDERRUN,
+	CMPL_CODE_RING_OVERRUN,
+	CMPL_CODE_EVENT_RING_FULL_ERR = 21,
+	CMPL_CODE_STOPPED = 26,
+	CMPL_CODE_STOPPED_LENGTH_INVALID = 27,
+	CMPL_CODE_ISOCH_BUFFER_OVERRUN = 31,
+
+	CMPL_CODE_PROTOCOL_STALL = 192,
+	CMPL_CODE_SETUP_TAG_MISMATCH = 193,
+	CMPL_CODE_HALTED = 194,
+	CMPL_CODE_HALTED_LENGTH_INVALID = 195,
+	CMPL_CODE_DISABLED = 196,
+	CMPL_CODE_DISABLED_LENGTH_INVALID = 197,
+};
+
+/* Endpoint type encoding in the endpoint context */
+enum crg_ep_type {
+	EP_TYPE_INVALID = 0,
+	EP_TYPE_ISOCH_OUTBOUND,
+	EP_TYPE_BULK_OUTBOUND,
+	EP_TYPE_INTR_OUTBOUND,
+	EP_TYPE_INVALID2,
+	EP_TYPE_ISOCH_INBOUND,
+	EP_TYPE_BULK_INBOUND,
+	EP_TYPE_INTR_INBOUND,
+};
+
+/* transfer_trb_s dw2 fields */
+#define TRB_TRANSFER_LEN_MASK GENMASK(16, 0)
+#define TRB_TD_SIZE_MASK GENMASK(21, 17)
+#define TRB_INTR_TARGET_MASK GENMASK(31, 22)
+
+/* transfer_trb_s dw3 fields */
+#define TRB_CYCLE_BIT_MASK BIT(0)
+#define TRB_LINK_TOGGLE_CYCLE_MASK BIT(1)
+#define TRB_INTR_ON_SHORT_PKT_MASK BIT(2)
+#define TRB_NO_SNOOP_MASK BIT(3)
+#define TRB_CHAIN_BIT_MASK BIT(4)
+#define TRB_INTR_ON_COMPLETION_MASK BIT(5)
+#define TRB_APPEND_ZLP_MASK BIT(7)
+#define TRB_BLOCK_EVENT_INT_MASK BIT(9)
+#define TRB_TYPE_MASK GENMASK(15, 10)
+#define DATA_STAGE_TRB_DIR_MASK BIT(16)
+#define TRB_SETUP_TAG_MASK GENMASK(18, 17)
+#define STATUS_STAGE_TRB_STALL_MASK BIT(19)
+#define STATUS_STAGE_TRB_SET_ADDR_MASK BIT(20)
+#define ISOC_TRB_FRAME_ID_MASK GENMASK(30, 20)
+#define ISOC_TRB_SIA_MASK BIT(31)
+
+struct transfer_trb_s {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+};
+
+/* event_trb_s dw2 fields */
+#define EVE_TRB_TRAN_LEN_MASK GENMASK(16, 0)
+#define EVE_TRB_COMPL_CODE_MASK GENMASK(31, 24)
+
+/* event_trb_s dw3 fields */
+#define EVE_TRB_CYCLE_BIT_MASK BIT(0)
+#define EVE_TRB_TYPE_MASK GENMASK(15, 10)
+#define EVE_TRB_ENDPOINT_ID_MASK GENMASK(20, 16)
+#define EVE_TRB_SETUP_TAG_MASK GENMASK(22, 21)
+
+struct event_trb_s {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+};
+
+/* ep_cx_s dw0 fields */
+#define EP_CX_LOGICAL_EP_NUM_MASK GENMASK(6, 3)
+#define EP_CX_INTERVAL_MASK GENMASK(23, 16)
+
+/* ep_cx_s dw1 fields */
+#define EP_CX_EP_TYPE_MASK GENMASK(5, 3)
+#define EP_CX_MAX_BURST_SIZE_MASK GENMASK(15, 8)
+#define EP_CX_MAX_PACKET_SIZE_MASK GENMASK(31, 16)
+
+/* ep_cx_s dw2 fields */
+#define EP_CX_DEQ_CYC_STATE_MASK BIT(0)
+#define EP_CX_TR_DQPT_LO_MASK GENMASK(31, 4)
+
+struct ep_cx_s {
+	__le32 dw0;
+	__le32 dw1;
+	__le32 dw2;
+	__le32 dw3;
+};
+
+struct erst_s {
+	/* 64-bit event ring segment address */
+	__le32 seg_addr_lo;
+	__le32 seg_addr_hi;
+	__le32 seg_size;
+	/* Set to zero */
+	__le32 rsvd;
+};
+
+/* command type */
+enum crg_cmd_type {
+	CRG_CMD_INIT_EP0 = 0,
+	CRG_CMD_UPDATE_EP0_CFG = 1,
+	CRG_CMD_SET_ADDR = 2,
+	CRG_CMD_SEND_DEV_NOTIFICATION = 3,
+	CRG_CMD_CONFIG_EP = 4,
+	CRG_CMD_SET_HALT = 5,
+	CRG_CMD_CLEAR_HALT = 6,
+	CRG_CMD_RESET_SEQNUM = 7,
+	CRG_CMD_STOP_EP = 8,
+	CRG_CMD_SET_TR_DQPTR = 9,
+	CRG_CMD_FORCE_FLOW_CONTROL = 10,
+	CRG_CMD_REQ_LDM_EXCHANGE = 11,
+};
+
+#endif /* CRG_UDC_H */

-- 
2.34.1

