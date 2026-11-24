Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795526092;
	b=F47tYCPiamZVASGVotgg3wcVZF5PvCN4LYgeYBoRaJaD7mQkWJwfyLHxWaMaGWrCHWFj
	 8Wsz7Bos0nHh0zeOArcBa7v4QOBdeQRC/L8J3xsRMDWPk769jPfkspnktVoK0pPM1k5lS
	 JZndtreRIoo7XsrUE9Wf5vha4wkJU6ch81f51ZrvfmtKjwbqWsL2KjlECRJROv2qtBWAS
	 L7HbTZwiw+uELWdYvjYlLsSRo9//yqSi5wDVQbAwZCVE2nXP5FOiGtDZzov+xD5SUfNL4
	 Ut3peijxsdtDMqSgCoQpZ9bUfhsdgJXEQrZweeBg+U5qMWZAR3TtvlV4aBBNFTYKQ7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526092;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=v+E4TyN+94c0p6OIPGZeexYppMdqFHFzrbCT5Y0ju54=;
	b=TFtYWEecfYeV9dhujof0RCOwie+DZQGliOL51lkkucC4/m7T+0DV0dQjZnn3f2t+C46m
	 5Dbluvyvvmb4erg9vzJmz4y1V0oVAzEjXzY8LSiAFt/c/VJYXZy2mzOaXvjgsqm4Dmb0f
	 P0ZUeRrE0Z79oBpbt/hn9C0JY18cgjyiDozt8YLhvboPLdmlzmvewkdCEcP7jOBiFwOMB
	 JqApvSFuYnI2EQQTHpq/x7KsO3G+YCso6uYWYsFeba4Xwkms2LJdOxhPJwlYpsIfgcasJ
	 TCICrRFPLujQgJUThRq5SI1+6DfO5R+BB5gDa8tZpVCNyMTftFSKZNijgiKEP0bwWqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b="L6Z2/k9C";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.80
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021080.outbound.protection.outlook.com [40.93.194.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A9606A33C;
	Tue, 24 Nov 2026 13:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 191A9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=L6Z2/k9C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm4EvhUhhtH4WZ3K6b4/Nfpkk9cHYa+qNw+ax/te+HFghX52d8Caa1f1W+35oyxV3Vqw/K7kGMPBDfKduvWkRJzYPNZJ101ZHTPdTB5dL3WsFtUEgjGU7f06h99kZ9XVhGr2wjQF+UNDUchF3M09oVDlZn676yOAe3cjIPKMy9MP2zebyJOnkfTtY34JJvreEUIHjBjby62BoDG5WIHItsOcx36hozspGZF/pitUX6TPUHeT9kshG5DRCS9TCmMV7OVf+0zLijyf418WuBCdVcPabtH9N3HIJIKv7rc0PSRWQSXpDBDSdlAZUt3eFPGq0ksmsQ5oNfAPfQPjn7Ua2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+E4TyN+94c0p6OIPGZeexYppMdqFHFzrbCT5Y0ju54=;
 b=OoKtSo5n9iFOZJqlCCQIpjnXGlgaScEtiveGFFKtDlfSM9M6oZhKudmr0wX4eCSxDrHoS8x5kwFT+88M3c8ZtMyGYRp9Tr2izOdhiBtOcahIZqtCncuhZ/g9eefVXcf9dkqmVzOVY3wNDUHmJwcPr3mP8sUkfW5UosLcfLXpxvftPiGE8Gnh6BI5ehoggYUDDS9K2h4lxonpuNgCArENXXrWwW6dTGceNPlHRQEUWvEyKDOsZ7G14DcAljqfwUVZKDHomoz3LTNpzNoei3s7R5MzNxnsgAFE76rr1ddxEX1OyvLgYUR2wBdJa0smUY7sllCcxWhqkWAPs51qdjKScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+E4TyN+94c0p6OIPGZeexYppMdqFHFzrbCT5Y0ju54=;
 b=L6Z2/k9CY//+nTpdu+pozpF3mXWz4MGdxKn9A2A5D3NxlcHsZpBJe7/U5oPys/pS5eG0zDWB2kDDIhW1gzyuzctMMcrLwPlgsX/idLeE1flmhv78qyHrpxyCDRyAF75oXm0e5sGPT60ngm7mlHKoKJWCQBw4j5vOtzDSE1HUq1FeGg+xRatNhRZEDx0Qch20VW+dutyHoMbhrrXTE2jXezsOwiwLo7V9A3PNYSSJG3xsWhnx3hTFoAimMl3jiCcgGuui4hmRnmZY9DrmGUyi/fWYpjFU6Ser3CI3NbwExSn5GLeWx+lQDG1/oUj+NVdkfV6OB7uVVIQiCSnp6Xvohw==
Received: from MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::23)
 by IA2PR18MB6010.namprd18.prod.outlook.com (2603:10b6:208:4ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Tue, 24 Nov
 2026 13:14:46 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:115:cafe::19) by MW4P220CA0018.outlook.office365.com
 (2603:10b6:303:115::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 13:14:45 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 0A3984186B52;
	Tue, 24 Nov 2026 05:14:45 -0800 (PST)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 24 Nov 2026 05:14:39 -0800
Subject: [PATCH v6 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-axiado-ax3000-usb-device-controller-v6-6-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
To: Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>, 
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795526083; l=47937;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=hhF/KUZVBdLzYS60GDBCaNQlJ711DTdcJ12RAlkl5/w=;
 b=7OLEGk+F/ZF+zvbUVC/04z28vvg+PNeQGUErk4cXfZPuACc8+cUv6btmuSVVhJanyhHdAhktt
 NrVjLjvUOB9BPnxSPcw1FQe6XVuJWtfgNVTyQrUXM8TKWZIiB3Z4tNg
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|IA2PR18MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 291af5cd-8de2-4c59-6f1d-08df4a2ce8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|7416014|22082099003|18002099003|6133799003|261009223327099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|10067099003|56012099006|5023799004|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022113327099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	WARSHfxXBf3dkVhsF1SRoQ1Ev2U3lEHUOd85l3UjsVLueDEU+6bNuKaGEMfi4xCoyrEQkg47/TSHTo0ZSand9vxCnr1educInh24WWXfrB6YJHrW/mh+aOeOyDapCt9sa4L7Qym50cz7qvPPC6qGbUMvbvzEbjuW6ULeheHb85lSf+ay4UTdm5ZsKjLi5ukk/AJpUpoucEjYOuZZJVWyhr7n9gn5laP1Q77ypPNrf99V8LRvWCP2Hbk//llCB7TO5mmpvP8hdMSGUMVixdHt49hmep6iPOF3WaJhcqp3HNupV1pPxSAPXJq4/u6ci3yduldIt0/7LjtsMkxwLw58ofU0+KwummmpfNB70rTZ2gSxHWHiyfzZXpDcp+WUMM05gzBHGCzteyFwgW40WvJClyMmBVwTMzwWGYhmOE6rvZkrAHG+VjuyVccIrenhsJRttfWIGr+CRzfm5awBlGCPpp3gAIBgTRVE3SrTlDZnljMyLhagtt/YQke2Ssw8Th8Fq+LPUBeG7y+MbWOaiqq1AWHLuAREJ9VJWhZ9KVWAuSx50LfYRrZCVAM65XtJs27uycVrIecNYWKyREjZVFMLCbUxcmTCem3tiBAoYf5UsbtXJrzyUF89LfQDS8RPAIt8sDTIJtVq8HMbOzrZVEItUwOYR4I6W4LBZMCmlJFzCD8tVNsLf5oiU5cjGsKwjTfamT+qcbVaYobBCZcRHWboBw==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(6133799003)(261009223327099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(10067099003)(56012099006)(5023799004)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022113327099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Efohm6bL89RyBKsPCeW5+ONOodbO2U/t3PhMbsdIfO6SANTUxhlhL9kZACdbv4dZyxt5ch+wxfVGCzAWLvL+mFPkF0g0IIoHcWRHS/+mxZvQse1zxok8nZBzbHMmSrY1dayg7drE8Y9n/t80tMTH8J5shmY2Umo4yWisRJ04g8CvLHtJwrOGROyJYZILORrS0TyrtQN9ofCqJbhle617xIaT1AIaWcxhtveKRFkUFlTPLLLB5eF6eQUQNR0Arkw2Geje8bIki8jJ68sBZJyVIWJK4d4UrIFnxjEZMKR6Cqq+n+U1ihqjFL6XnawU4SjtkxOnEMyYopgUePWnnGpIxSDYPFPKCHtF9dNuy86rk7cibgQ1Dh1qT009tsYsueqZLsvINOEU1R6MoK/6PZn4DI8Ck+KKu3jh42g6uuPRRAm73UeAkPaTYxKg03Lwe+A
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:14:45.6610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 291af5cd-8de2-4c59-6f1d-08df4a2ce8f8
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR18MB6010

This patch introduces the core probe/remove functions for the Axiado
AX3000/AX3005 UDC driver, and wires up the directory into the build
system via Kconfig and Makefile.

Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/Kconfig            |    2 +
 drivers/usb/gadget/udc/Makefile           |    1 +
 drivers/usb/gadget/udc/crg/Kconfig        |   16 +
 drivers/usb/gadget/udc/crg/Makefile       |    9 +
 drivers/usb/gadget/udc/crg/crg-udc-core.c | 1467 +++++++++++++++++++++++++++++
 5 files changed, 1495 insertions(+)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 7ddbc2606686..72a5a8a04982 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -421,6 +421,8 @@ source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
 
 source "drivers/usb/gadget/udc/cdns2/Kconfig"
 
+source "drivers/usb/gadget/udc/crg/Kconfig"
+
 #
 # LAST -- dummy/emulated controller
 #
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 1b9b1a4f9c57..227d2a0b525b 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_USB_ASPEED_UDC)	+= aspeed_udc.o
 obj-$(CONFIG_USB_BDC_UDC)	+= bdc/
 obj-$(CONFIG_USB_MAX3420_UDC)	+= max3420_udc.o
 obj-$(CONFIG_USB_CDNS2_UDC)	+= cdns2/
+obj-$(CONFIG_USB_CRG_UDC)	+= crg/
diff --git a/drivers/usb/gadget/udc/crg/Kconfig b/drivers/usb/gadget/udc/crg/Kconfig
new file mode 100644
index 000000000000..7167c4943389
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config USB_CRG_UDC
+	tristate "Corigine / Axiado USB Device Controller"
+	depends on USB_GADGET
+	depends on HAS_DMA
+	depends on ARCH_AXIADO || COMPILE_TEST
+	help
+	  Say Y here to support the USB device controller found on Axiado AX3000
+	  and AX3005 SoCs, which is based on the Corigine USB 3.1 IP.
+
+	  This controller supports High-Speed and SuperSpeed.
+
+	  Say "y" to link the driver statically, or "m" to build a
+	  dynamically linked module called "crg-udc.ko".
+
+	  If unsure, say N.
diff --git a/drivers/usb/gadget/udc/crg/Makefile b/drivers/usb/gadget/udc/crg/Makefile
new file mode 100644
index 000000000000..96b209fb59fc
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# define_trace.h needs to know how to find our trace header
+CFLAGS_crg-udc-trace.o		:= -I$(src)
+
+obj-$(CONFIG_USB_CRG_UDC)	+= crg-udc.o
+
+crg-udc-y			:= crg-udc-core.o crg-udc-ring.o crg-udc-ep0.o crg-udc-gadget.o
+crg-udc-$(CONFIG_TRACING)	+= crg-udc-trace.o
diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadget/udc/crg/crg-udc-core.c
new file mode 100644
index 000000000000..4b5c28da7497
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
@@ -0,0 +1,1467 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "crg-udc.h"
+
+static int crg_gadget_irq_init(struct platform_device *pdev,
+			       struct crg_gadget_dev *crg_udc);
+static void crg_udc_phy_exit(void *data);
+static void crg_udc_recovery_work(struct work_struct *work);
+static int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags,
+			 bool preserve_enabled);
+static int crg_udc_finish_gadget_stop(struct crg_gadget_dev *crg_udc);
+
+static int crg_udc_alloc_ep_rings(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	/*
+	 * Preallocate two disjoint rings per endpoint. Endpoint enable and
+	 * controller recovery can run in atomic context.
+	 */
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_buffer_info *ring = &crg_udc->udc_ep[i].tran_ring_alloc;
+		size_t len = (i ? CRG_UDC_BULK_EP_TD_RING_SIZE :
+			      CRG_UDC_CONTROL_EP_TD_RING_SIZE) *
+			     sizeof(struct crg_transfer_trb);
+
+		if (i == 1)
+			continue;
+
+		ring->cpu_addr = dma_alloc_coherent(crg_udc->dev, 2 * len,
+						    &ring->dma_addr, GFP_KERNEL);
+		if (!ring->cpu_addr)
+			return -ENOMEM;
+		ring->len = 2 * len;
+	}
+
+	return 0;
+}
+
+static void crg_udc_select_transfer_rings(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	/*
+	 * Transfer events identify TRBs by DMA address. After confirmed
+	 * quiescence, use the other bank for the next session so a completion
+	 * for the previous bank cannot match a new request. Keep the selected
+	 * bank if a rebuild failed before RUN was set. Reusing a bank from
+	 * older sessions relies on the halt/reset and event-ring clear.
+	 */
+	if (crg_udc->transfer_rings_live) {
+		crg_udc->transfer_ring_bank = !crg_udc->transfer_ring_bank;
+		crg_udc->transfer_rings_live = false;
+	}
+
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *ep = &crg_udc->udc_ep[i];
+		struct crg_buffer_info *alloc = &ep->tran_ring_alloc;
+		u32 len = alloc->len / 2;
+		u32 offset = crg_udc->transfer_ring_bank ? len : 0;
+		void *addr;
+
+		if (!alloc->cpu_addr)
+			continue;
+
+		addr = (u8 *)alloc->cpu_addr + offset;
+		if (ep->tran_ring_info.cpu_addr == addr)
+			continue;
+
+		ep->tran_ring_info.cpu_addr = addr;
+		ep->tran_ring_info.dma_addr = alloc->dma_addr + offset;
+		ep->tran_ring_info.len = len;
+		ep->first_trb = NULL;
+		ep->last_trb = NULL;
+		ep->enq_pt = NULL;
+		ep->deq_pt = NULL;
+	}
+}
+
+static void crg_udc_gadget_release(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc;
+
+	crg_udc = container_of(dev, struct crg_gadget_dev, gadget.dev);
+	kfree(crg_udc);
+}
+
+static int crg_udc_wait_command(struct crg_gadget_dev *crg_udc,
+				unsigned int timeout_us)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status, ctrl;
+
+	if (readl_poll_timeout_atomic(&uccr->cmd_control, ctrl,
+				      !(ctrl & CRG_U3DC_CMD_CTRL_ACTIVE),
+				      1, timeout_us)) {
+		dev_dbg(crg_udc->dev, "command timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	status = FIELD_GET(CRG_U3DC_CMD_CTRL_STATUS_MASK, ctrl);
+	if (status) {
+		dev_dbg(crg_udc->dev, "command failed with status %u\n", status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* Called with udc_lock held after asserting RUN for a staged INIT_EP0. */
+int crg_udc_finish_staged_ep0(struct crg_gadget_dev *crg_udc)
+{
+	int ret;
+
+	ret = crg_udc_wait_command(crg_udc, 10000);
+	if (!ret)
+		crg_udc->init_ep0_pending = false;
+	return ret;
+}
+
+int crg_udc_issue_command(struct crg_gadget_dev *crg_udc,
+			  enum crg_cmd_type type, u32 param0, u32 param1)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 tmp;
+	bool running;
+
+	running = !!(readl(&uccr->control) & CRG_U3DC_CTRL_RUN);
+	/* Only INIT_EP0 may be staged while the controller is stopped. */
+	if (!running && type != CRG_CMD_INIT_EP0)
+		return -ESHUTDOWN;
+	if (crg_udc->init_ep0_pending)
+		return -EBUSY;
+
+	/*
+	 * A previous command may still be active after a timeout. Wait for it
+	 * before reusing the command registers while RUN is set.
+	 */
+	tmp = readl(&uccr->cmd_control);
+	if (tmp & CRG_U3DC_CMD_CTRL_ACTIVE) {
+		if (!running)
+			return -EBUSY;
+		if (readl_poll_timeout_atomic(&uccr->cmd_control, tmp,
+					      !(tmp & CRG_U3DC_CMD_CTRL_ACTIVE),
+					      1, 10000))
+			return -ETIMEDOUT;
+	}
+	/* Ensure that everything is written before issuing new command */
+	dma_wmb();
+
+	writel(param0, &uccr->cmd_param0);
+	writel(param1, &uccr->cmd_param1);
+
+	tmp = CRG_U3DC_CMD_CTRL_ACTIVE |
+	      FIELD_PREP(CRG_U3DC_CMD_CTRL_TYPE_MASK, type);
+	writel(tmp, &uccr->cmd_control);
+
+	if (!running) {
+		crg_udc->init_ep0_pending = true;
+		return 0;
+	}
+
+	return crg_udc_wait_command(crg_udc, 1000);
+}
+
+static void crg_udc_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+/*
+ * Stop the controller and wait for pending event writes before resetting it.
+ * Corigine USB 3.1 DRD v1.5, sections 8.3.3 and 8.3.4: Controller Halted
+ * requires Controller Idle, at which point queued events have reached the
+ * event ring. Discard those events when rebuilding the ring after reset.
+ */
+static int crg_udc_soft_reset(struct crg_gadget_dev *crg_udc, bool atomic)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 ctrl, val;
+	int ret;
+
+	ctrl = readl(&uccr->control);
+	ctrl &= ~(CRG_U3DC_CTRL_RUN | CRG_U3DC_CTRL_INT_EN |
+		  CRG_U3DC_CTRL_SYSERR_EN | CRG_U3DC_CTRL_SWRST);
+	writel(ctrl, &uccr->control);
+
+	if (atomic)
+		ret = readl_poll_timeout_atomic(&uccr->status, val,
+					       val & CRG_U3DC_STATUS_DEV_CTRL_HALT,
+					       10, 10000);
+	else
+		ret = readl_poll_timeout(&uccr->status, val,
+					val & CRG_U3DC_STATUS_DEV_CTRL_HALT,
+					10, 10000);
+	if (ret) {
+		dev_err(crg_udc->dev, "controller halt timed out before reset\n");
+		return ret;
+	}
+
+	writel(ctrl | CRG_U3DC_CTRL_SWRST, &uccr->control);
+	if (atomic)
+		ret = readl_poll_timeout_atomic(&uccr->control, val,
+					       !(val & CRG_U3DC_CTRL_SWRST), 10, 10000);
+	else
+		ret = readl_poll_timeout(&uccr->control, val,
+					!(val & CRG_U3DC_CTRL_SWRST), 10, 10000);
+	if (ret)
+		dev_err(crg_udc->dev, "software reset timed out\n");
+	else
+		crg_udc->init_ep0_pending = false;
+
+	return ret;
+}
+
+/*
+ * Stop bus-master DMA with new submissions blocked. This can sleep.
+ * An asserted SoC reset is a fallback when halting or SWRST times out.
+ */
+static int crg_udc_quiesce_hw(struct crg_gadget_dev *crg_udc)
+{
+	int ret;
+
+	if (crg_udc->hw_reset_asserted || !crg_udc->hw_dma_armed)
+		return 0;
+	if (!crg_udc->uccr)
+		return -ENODEV;
+
+	ret = crg_udc_soft_reset(crg_udc, false);
+	if (!ret) {
+		WRITE_ONCE(crg_udc->hw_dma_armed, false);
+		return 0;
+	}
+
+	if (!crg_udc->rst)
+		return ret;
+
+	ret = reset_control_assert(crg_udc->rst);
+	if (!ret) {
+		crg_udc->hw_reset_asserted = true;
+		WRITE_ONCE(crg_udc->hw_dma_armed, false);
+		crg_udc->init_ep0_pending = false;
+	}
+
+	return ret;
+}
+
+/*
+ * The caller holds udc_lock. The hard IRQ only reads registers while an
+ * interrupt source is enabled. Mask both sources and flush the write before
+ * allowing software reset or a sleeping reset-control operation.
+ */
+u32 crg_udc_set_irq_mask(struct crg_gadget_dev *crg_udc, u32 mask)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	unsigned long flags;
+	u32 old_mask, ctrl;
+
+	/* A recovery path can try to restore IRQs while unbind is starting. */
+	if (!crg_udc->async_callbacks)
+		mask = 0;
+
+	raw_spin_lock_irqsave(&crg_udc->irq_lock, flags);
+	old_mask = crg_udc->irq_mask;
+	if (old_mask != mask) {
+		ctrl = readl(&uccr->control);
+		ctrl = (ctrl & ~CRG_U3DC_CTRL_IRQ_MASK) | mask;
+		writel(ctrl, &uccr->control);
+		readl(&uccr->control);
+		crg_udc->irq_mask = mask;
+	}
+	raw_spin_unlock_irqrestore(&crg_udc->irq_lock, flags);
+
+	return old_mask;
+}
+
+/* Stop the IRQ and other scheduling paths before draining these workers. */
+static void crg_udc_cancel_work(struct crg_gadget_dev *crg_udc)
+{
+	cancel_delayed_work_sync(&crg_udc->port_retry_work);
+	cancel_work_sync(&crg_udc->recovery_work);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+}
+
+static void crg_udc_free_resources(struct crg_gadget_dev *crg_udc)
+{
+	unsigned long flags;
+	int i, ret;
+
+	/* Prevent new IRQ work before synchronizing and disabling workers. */
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc_set_irq_mask(crg_udc, 0);
+	crg_udc->shutting_down = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	disable_delayed_work_sync(&crg_udc->port_retry_work);
+	disable_work_sync(&crg_udc->recovery_work);
+	disable_work_sync(&crg_udc->udc_reset_work);
+	if (crg_udc->irq >= 0) {
+		devm_free_irq(crg_udc->dev, crg_udc->irq, crg_udc);
+		crg_udc->irq = -1;
+		crg_udc->gadget.irq = 0;
+	}
+
+	if (crg_udc->status_req) {
+		kfree(crg_udc->status_req->usb_req.buf);
+		crg_udc_free_request(&crg_udc->udc_ep[0].usb_ep,
+				     &crg_udc->status_req->usb_req);
+		crg_udc->status_req = NULL;
+	}
+
+	ret = crg_udc_quiesce_hw(crg_udc);
+	if (ret) {
+		crg_udc->dma_quiesce_failed = true;
+		/*
+		 * Retain potentially live DMA mappings and coherent allocations.
+		 * A platform with detachable DMA translations must isolate the
+		 * master independently before tearing down its DMA domain.
+		 */
+		dev_crit(crg_udc->dev,
+			 "DMA stop failed (%d); retaining allocations, platform isolation required\n",
+			 ret);
+		return;
+	}
+	crg_udc->dma_quiesce_failed = false;
+	crg_udc_release_quarantine(crg_udc);
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
+		struct crg_buffer_info *alloc = &udc_ep->tran_ring_alloc;
+
+		if (alloc->cpu_addr) {
+			dma_free_coherent(crg_udc->dev, alloc->len,
+					  alloc->cpu_addr, alloc->dma_addr);
+			*alloc = (struct crg_buffer_info){};
+			udc_ep->tran_ring_info.cpu_addr = NULL;
+			udc_ep->tran_ring_info.dma_addr = DMA_MAPPING_ERROR;
+			udc_ep->tran_ring_info.len = 0;
+			udc_ep->first_trb = NULL;
+			udc_ep->last_trb = NULL;
+			udc_ep->enq_pt = NULL;
+			udc_ep->deq_pt = NULL;
+		}
+	}
+}
+
+static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
+{
+	struct device *dev = crg_udc->dev;
+	struct reset_control *rst;
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
+	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to get reset\n");
+	crg_udc->rst = rst;
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
+static void crg_udc_phy_exit(void *data)
+{
+	struct phy *phy = data;
+
+	phy_power_off(phy);
+	phy_exit(phy);
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
+	crg_udc = kzalloc_obj(*crg_udc);
+	if (!crg_udc)
+		return -ENOMEM;
+	usb_initialize_gadget(&pdev->dev, &crg_udc->gadget,
+			      crg_udc_gadget_release);
+
+	crg_udc->dev = &pdev->dev;
+	crg_udc->irq = -1;
+	/* Probe errors can call free_resources() before hardware init. */
+	spin_lock_init(&crg_udc->udc_lock);
+	raw_spin_lock_init(&crg_udc->irq_lock);
+	init_waitqueue_head(&crg_udc->teardown_wait);
+	INIT_LIST_HEAD(&crg_udc->dma_quarantine);
+	INIT_WORK(&crg_udc->udc_reset_work, crg_udc_reset_work);
+	INIT_WORK(&crg_udc->recovery_work, crg_udc_recovery_work);
+	INIT_DELAYED_WORK(&crg_udc->port_retry_work, crg_udc_port_retry_work);
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
+	crg_udc->u12_initiate_forbidden = priv->quirks &
+					  CRG_QUIRK_DIS_U1U2_INITIATION;
+	crg_udc->reinit_ep0_on_bus_reset = priv->quirks &
+					   CRG_QUIRK_REINIT_EP0_ON_RESET;
+
+	platform_set_drvdata(pdev, crg_udc);
+
+	crg_udc->gadget.ops = &crg_gadget_ops;
+	crg_udc->gadget.ep0 = &crg_udc->udc_ep[0].usb_ep;
+	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
+	/*
+	 * The controller supports up to SuperSpeed. Honour the standard
+	 * "maximum-speed" property to cap it; default to the hardware
+	 * maximum when the property is absent.
+	 */
+	crg_udc->gadget.max_speed = usb_get_maximum_speed(&pdev->dev);
+	/* Hardware only supports Full-, High-, and SuperSpeed. */
+	switch (crg_udc->gadget.max_speed) {
+	case USB_SPEED_FULL:
+	case USB_SPEED_HIGH:
+	case USB_SPEED_SUPER:
+		break;
+	case USB_SPEED_LOW:
+		crg_udc->gadget.max_speed = USB_SPEED_FULL;
+		break;
+	default:
+		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
+		break;
+	}
+	crg_udc->max_speed = crg_udc->gadget.max_speed;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	crg_udc->gadget.name = KBUILD_MODNAME;
+	crg_udc->gadget.sg_supported = true;
+	crg_udc->gadget.wakeup_capable = true;
+	crg_udc->connected = 0;
+	crg_udc->dev_addr = 0;
+
+	crg_udc->mmio_virt_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(crg_udc->mmio_virt_base)) {
+		ret = dev_err_probe(&pdev->dev,
+				    PTR_ERR(crg_udc->mmio_virt_base),
+				    "failed to map registers\n");
+		goto err_put_gadget;
+	}
+
+	/* set controller device role */
+	writel((readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) |
+		CRG_UDC_ROLE_DEVICE),
+	       crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		crg_udc->uicr[i] = crg_udc->mmio_virt_base + CRG_UICR_OFFSET +
+				   i * CRG_UICR_STRIDE;
+	}
+	crg_udc->uccr = crg_udc->mmio_virt_base + CRG_UCCR_OFFSET;
+
+	/* Initialize endpoint objects before reset, DMA setup or any IRQ. */
+	crg_udc_init_ep_info(crg_udc);
+
+	ret = crg_udc_alloc_ep_rings(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	ret = crg_udc_reset(crg_udc, &flags, false);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc_clear_portpm(crg_udc);
+
+	ret = crg_udc_reset_data_struct(crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "crg_udc_reset_data_struct error\n");
+		goto err_free_resources;
+	}
+
+	ret = crg_udc_init_ep0(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->udc_ep[0].desc = &crg_udc->ep0_desc;
+	/* Release the reset gate only after EP0 and all event rings exist. */
+	crg_udc->resetting = false;
+
+	ret = crg_gadget_irq_init(pdev, crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	ret = usb_add_gadget(&crg_udc->gadget);
+	if (ret)
+		goto err_free_resources;
+
+	return 0;
+
+err_free_resources:
+	crg_udc_free_resources(crg_udc);
+err_put_gadget:
+	platform_set_drvdata(pdev, NULL);
+	usb_put_gadget(&crg_udc->gadget);
+	return ret;
+}
+
+static void crg_udc_remove(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	unsigned long flags;
+	u32 tmp;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc_set_irq_mask(crg_udc, 0);
+	crg_udc->shutting_down = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	/* The gadget core calls pullup(0) before the disconnect callback. */
+	usb_del_gadget(&crg_udc->gadget);
+	crg_udc_free_resources(crg_udc);
+
+	/* Do not access registers while the external reset is asserted. */
+	if (!crg_udc->hw_reset_asserted && !crg_udc->dma_quiesce_failed) {
+		tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
+		writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+	}
+
+	platform_set_drvdata(pdev, NULL);
+	usb_put_gadget(&crg_udc->gadget);
+}
+
+static void crg_udc_shutdown(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc_set_irq_mask(crg_udc, 0);
+	crg_udc->pullup_on = false;
+	crg_udc->shutting_down = true;
+	crg_udc->resetting = true;
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	crg_udc_cancel_work(crg_udc);
+
+	/* Reset and gadget stop may own the registers across a lock drop. */
+	spin_lock_irq(&crg_udc->udc_lock);
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->controller_recovering, crg_udc->udc_lock);
+	crg_udc_recovery_begin(crg_udc);
+	if (!crg_udc->hw_reset_asserted)
+		crg_udc_set_vbus_detect(crg_udc, false);
+	spin_unlock_irq(&crg_udc->udc_lock);
+
+	ret = crg_udc_quiesce_hw(crg_udc);
+	if (ret)
+		dev_crit(crg_udc->dev, "cannot stop DMA during shutdown: %d\n", ret);
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	crg_udc->dma_quiesce_failed = !!ret;
+	if (!ret)
+		crg_udc_release_quarantine(crg_udc);
+	crg_udc_recovery_end(crg_udc);
+	spin_unlock_irq(&crg_udc->udc_lock);
+}
+
+static int crg_udc_suspend(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+	bool notify_disconnect;
+	int i, ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
+	    crg_udc->external_reset_pending ||
+	    crg_udc->endpoint_recovery_pending ||
+	    (crg_udc->hw_reset_asserted && !crg_udc->gadget_stopping)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+	if (crg_udc->gadget_stopping) {
+		ret = crg_udc->hw_dma_armed ? -EBUSY : 0;
+		if (!ret)
+			crg_udc->suspended = true;
+		goto unlock;
+	}
+
+	crg_udc_set_irq_mask(crg_udc, 0);
+	crg_udc->suspend_recovery_result = -EINPROGRESS;
+	crg_udc->suspended = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	crg_udc_cancel_work(crg_udc);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->controller_recovering &&
+			    !crg_udc->gadget_callbacks_active && !crg_udc->queueing,
+			    crg_udc->udc_lock);
+	if (crg_udc->gadget_stopping || crg_udc->shutting_down) {
+		ret = -EBUSY;
+		goto failed;
+	}
+
+	/*
+	 * Return requests before disconnect callbacks can free them. Keep
+	 * usb_ep.enabled visible until the function drivers disable their
+	 * endpoints. A failed halt leaves DMA mappings in quarantine.
+	 */
+	notify_disconnect = crg_udc->connected || crg_udc->bus_reset_pending;
+	crg_udc->connected = false;
+	crg_udc->bus_reset_pending = false;
+	/* Use completed recovery or leave a pending reset to the worker. */
+	ret = crg_udc->suspend_recovery_result;
+	if (ret == -EINPROGRESS || (ret && !crg_udc->external_reset_pending))
+		ret = crg_udc_recover(crg_udc, &flags, notify_disconnect);
+	/* Endpoint disable can start a giveback while reset drops udc_lock. */
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->gadget_callbacks_active, crg_udc->udc_lock);
+	if (notify_disconnect && !crg_udc->gadget_stopping &&
+	    !crg_udc->shutting_down)
+		crg_udc_notify_disconnect(crg_udc, &flags);
+
+	/* Disconnect drops udc_lock and may race with gadget teardown. */
+	if (crg_udc->gadget_stopping || crg_udc->shutting_down) {
+		ret = ret ?: -EBUSY;
+		goto failed;
+	}
+	if (notify_disconnect)
+		for (i = 2; i < CRG_NUM_EP_CX; i++)
+			crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	if (ret) {
+		dev_err(crg_udc->dev, "suspend controller reset failed: %d\n", ret);
+		goto failed;
+	}
+	goto unlock;
+
+failed:
+	crg_udc->suspended = false;
+	crg_udc_kick_reset_work(crg_udc);
+unlock:
+	if (!ret)
+		crg_udc->suspend_complete = true;
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return ret;
+}
+
+static int crg_udc_resume(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	int ret = 0;
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	/* A gadget stopped while suspended deferred its hardware cleanup. */
+	if (crg_udc->suspend_complete && crg_udc->gadget_stopping &&
+	    !crg_udc->controller_recovering && !crg_udc->shutting_down &&
+	    crg_udc->hw_dma_armed)
+		ret = crg_udc_finish_gadget_stop(crg_udc);
+
+	crg_udc->suspend_complete = false;
+	crg_udc->suspended = false;
+	if (!crg_udc->gadget_stopping) {
+		if (crg_udc->shutting_down || crg_udc->resetting)
+			ret = -ESHUTDOWN;
+		else if (crg_udc->gadget_driver && crg_udc->pullup_on)
+			ret = crg_udc_set_pullup(crg_udc, true);
+	}
+	spin_unlock_irq(&crg_udc->udc_lock);
+	return ret;
+}
+
+/* Program the speed limit while the controller is stopped. */
+int crg_udc_program_speed(struct crg_gadget_dev *crg_udc)
+{
+	u32 cfg, speed;
+
+	switch (crg_udc->max_speed) {
+	case USB_SPEED_FULL:
+		speed = CRG_U3DC_CFG0_MAXSPEED_FS;
+		break;
+	case USB_SPEED_HIGH:
+		speed = CRG_U3DC_CFG0_MAXSPEED_HS;
+		break;
+	case USB_SPEED_SUPER:
+		speed = CRG_U3DC_CFG0_MAXSPEED_SS;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cfg = readl(&crg_udc->uccr->config0);
+	cfg &= ~CRG_U3DC_CFG0_MAXSPEED_MASK;
+	cfg |= FIELD_PREP(CRG_U3DC_CFG0_MAXSPEED_MASK, speed);
+	writel(cfg, &crg_udc->uccr->config0);
+
+	return 0;
+}
+
+int crg_udc_reset_data_struct(struct crg_gadget_dev *crg_udc)
+{
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
+	ret = crg_udc_program_speed(crg_udc);
+	if (ret)
+		return ret;
+
+	crg_udc_select_transfer_rings(crg_udc);
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		ret = crg_udc_init_event_ring(crg_udc, i);
+		if (ret)
+			return ret;
+	}
+
+	ret = crg_udc_init_device_context(crg_udc);
+	if (ret)
+		return ret;
+
+	if (!crg_udc->status_req) {
+		struct usb_request *req;
+
+		req = crg_udc_alloc_request(&crg_udc->udc_ep[0].usb_ep,
+					    GFP_ATOMIC);
+		if (!req)
+			return -ENOMEM;
+
+		crg_udc->status_req =
+			container_of(req, struct crg_udc_request, usb_req);
+	}
+
+	/* other hw ops */
+	return 0;
+}
+
+static void crg_gadget_handle_interrupt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	unsigned long flags = 0;
+	u32 tmp_status;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	/*
+	 * A reset started on another CPU owns the controller registers and
+	 * the event rings until it has rebuilt them. It drops udc_lock while
+	 * polling SWRST and during givebacks, so this handler can get in.
+	 */
+	if (crg_udc->resetting || crg_udc->suspended ||
+	    crg_udc->shutting_down || crg_udc->gadget_stopping ||
+	    crg_udc->controller_recovering) {
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return;
+	}
+
+	tmp_status = readl(&uccr->status);
+
+	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
+		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
+		crg_udc_handle_system_error(crg_udc, &flags);
+		goto unlock;
+	}
+
+	if (tmp_status & CRG_U3DC_STATUS_EINT) {
+		int i;
+
+		writel(CRG_U3DC_STATUS_EINT, &uccr->status);
+
+		for (i = 0; i < CRG_RING_NUM; i++) {
+			u32 generation = crg_udc->udc_event[i].generation;
+
+			ret = crg_udc_process_event_ring(crg_udc, i, &flags);
+			/*
+			 * The event handlers drop udc_lock, so a reset may have
+			 * started (resetting) or already completed and rebuilt
+			 * the rings (generation) while they ran. Either way
+			 * tmp_status and the checks below are stale.
+			 */
+			if (unlikely(crg_udc->resetting || crg_udc->suspended ||
+				     crg_udc->shutting_down ||
+				     generation != crg_udc->udc_event[i].generation)) {
+				spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+				return;
+			}
+			if (ret)
+				dev_err(crg_udc->dev,
+					"process event ring error: %d\n", ret);
+		}
+	}
+
+	crg_udc_finish_reconnect(crg_udc, &flags);
+	crg_udc_retry_deferred_trbs(crg_udc);
+unlock:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
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
+	irqreturn_t ret = IRQ_NONE;
+	u32 pending = 0;
+
+	raw_spin_lock(&crg_udc->irq_lock);
+	if (crg_udc->irq_mask & CRG_U3DC_CTRL_INT_EN)
+		pending |= CRG_U3DC_STATUS_EINT;
+	if (crg_udc->irq_mask & CRG_U3DC_CTRL_SYSERR_EN)
+		pending |= CRG_U3DC_STATUS_SYS_ERR;
+	if (pending && (readl(&uccr->status) & pending))
+		ret = IRQ_WAKE_THREAD;
+	raw_spin_unlock(&crg_udc->irq_lock);
+
+	return ret;
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
+	/*
+	 * IRQF_ONESHOT keeps this (level-triggered) line masked until
+	 * crg_udc_irq_thread() has cleared the status bits, which is the
+	 * correct pairing for IRQF_SHARED with a threaded handler.
+	 */
+	ret = devm_request_threaded_irq(&pdev->dev, irq, crg_udc_common_irq,
+					crg_udc_irq_thread,
+					IRQF_SHARED | IRQF_ONESHOT, "crg_udc",
+					crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "request of irq%d failed\n", irq);
+	} else {
+		crg_udc->irq = irq;
+		crg_udc->gadget.irq = irq;
+	}
+
+	return ret;
+}
+
+/* Invalidate the old software session before dropping udc_lock. */
+static void crg_udc_reset_session(struct crg_gadget_dev *crg_udc)
+{
+	crg_udc->resetting = true;
+	crg_udc->bus_reset_generation++;
+	crg_udc->bus_reset_pending = false;
+	crg_udc->external_reset_pending = false;
+	crg_udc->endpoint_recovery_pending = false;
+	crg_udc->restart_after_reset = false;
+	crg_udc->deferred_port_events = 0;
+	crg_udc->deferred_trb_retries = 0;
+	crg_udc->deferred_system_error = false;
+	crg_udc->portsc_on_reconnecting = false;
+	crg_udc->setup_fn_call_back = NULL;
+	crg_udc->set_tm = 0;
+	crg_udc->udc_ep[0].generation++;
+	crg_udc->pending_setup_valid = false;
+}
+
+static void crg_udc_reset_queues(struct crg_gadget_dev *crg_udc,
+				 bool preserve_enabled)
+{
+	int i;
+
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc->dev_addr = 0;
+	crg_udc->port_reset_pending = false;
+
+	crg_udc->udc_ep[0].desc = NULL;
+	crg_udc->udc_ep[0].ep_state = EP_STATE_DISABLED;
+
+	/* Data endpoint contexts start at DCI 2. DCI 1 has no queue. */
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *ep = &crg_udc->udc_ep[i];
+
+		ep->generation++;
+		ep->desc = NULL;
+		ep->comp_desc = NULL;
+		ep->tran_ring_full = false;
+		ep->halt_failed = false;
+		ep->disable_failed = false;
+		ep->dequeue_paused = false;
+		ep->ep_state = EP_STATE_DISABLED;
+	}
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_nuke(&crg_udc->udc_ep[i], -ESHUTDOWN);
+	crg_udc_ep_nuke(&crg_udc->udc_ep[0], -ESHUTDOWN);
+
+	/* Preserve Gadget's endpoint state through all givebacks. */
+	if (!preserve_enabled)
+		for (i = 2; i < CRG_NUM_EP_CX; i++)
+			crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+}
+
+static int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags,
+			 bool preserve_enabled)
+{
+	int ret;
+
+	crg_udc_set_irq_mask(crg_udc, 0);
+	crg_udc_reset_session(crg_udc);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	ret = crg_udc_soft_reset(crg_udc, true);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (ret)
+		return ret;
+
+	crg_udc->hw_dma_armed = false;
+	crg_udc->dma_quiesce_failed = false;
+	crg_udc_release_quarantine(crg_udc);
+	crg_udc_clear_portpm(crg_udc);
+	crg_udc_reset_queues(crg_udc, preserve_enabled);
+	return 0;
+}
+
+/* Called in process context with udc_lock held and submissions blocked. */
+static int crg_udc_finish_gadget_stop(struct crg_gadget_dev *crg_udc)
+{
+	int ret;
+
+	crg_udc_recovery_begin(crg_udc);
+	spin_unlock_irq(&crg_udc->udc_lock);
+	ret = crg_udc_quiesce_hw(crg_udc);
+	if (ret)
+		dev_err(crg_udc->dev,
+			"cannot stop DMA during gadget teardown: %d\n", ret);
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	crg_udc->dma_quiesce_failed = !!ret;
+	crg_udc->controller_faulted = !!ret;
+	if (!ret) {
+		if (!crg_udc->hw_reset_asserted)
+			crg_udc_set_vbus_detect(crg_udc, false);
+		crg_udc_release_quarantine(crg_udc);
+	}
+	/* Function drivers can inspect usb_ep.enabled during disconnect. */
+	crg_udc_reset_queues(crg_udc, true);
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+/*
+ * The UDC core serializes pullup, async-callback and stop operations.
+ * Return requests before disconnect or unbind can free their storage.
+ */
+int crg_udc_stop_gadget(struct crg_gadget_dev *crg_udc)
+{
+	int ret;
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	crg_udc->link_restart_retried = false;
+	if (crg_udc->suspend_complete)
+		goto stopped_suspended;
+	if (crg_udc->gadget_stopping) {
+		/* A previous stop or a failed restart can leave DMA armed. */
+		wait_event_lock_irq(crg_udc->teardown_wait,
+				    !crg_udc->controller_recovering &&
+				    !crg_udc->gadget_callbacks_active,
+				    crg_udc->udc_lock);
+		if (!crg_udc->hw_dma_armed) {
+			spin_unlock_irq(&crg_udc->udc_lock);
+			return 0;
+		}
+		goto quiesce;
+	}
+	if (!crg_udc->controller_recovering && crg_udc->hw_dma_armed)
+		crg_udc_set_pullup(crg_udc, false);
+	else
+		crg_udc_set_irq_mask(crg_udc, 0);
+	crg_udc->gadget_stopping = true;
+	crg_udc->pullup_on = false;
+	crg_udc_reset_session(crg_udc);
+	spin_unlock_irq(&crg_udc->udc_lock);
+
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	crg_udc_cancel_work(crg_udc);
+
+	spin_lock_irq(&crg_udc->udc_lock);
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->controller_recovering &&
+			    !crg_udc->gadget_callbacks_active && !crg_udc->queueing,
+			    crg_udc->udc_lock);
+quiesce:
+	if (crg_udc->suspend_complete)
+		goto stopped_suspended;
+	ret = crg_udc_finish_gadget_stop(crg_udc);
+	goto out;
+
+stopped_suspended:
+	/* Suspend already stopped transfers and drained the endpoint queues. */
+	if (!crg_udc->gadget_stopping) {
+		crg_udc->gadget_stopping = true;
+		crg_udc->pullup_on = false;
+		crg_udc_reset_session(crg_udc);
+	}
+	ret = 0;
+out:
+	/* Drain givebacks that started during hardware quiesce. */
+	wait_event_lock_irq(crg_udc->teardown_wait,
+			    !crg_udc->gadget_callbacks_active, crg_udc->udc_lock);
+	crg_udc->connected = false;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	spin_unlock_irq(&crg_udc->udc_lock);
+
+	usb_gadget_set_state(&crg_udc->gadget, USB_STATE_NOTATTACHED);
+	return ret;
+}
+
+/* Called with udc_lock held and IRQ and queue entry blocked. */
+static int crg_udc_deassert_reset(struct crg_gadget_dev *crg_udc,
+				  unsigned long *flags)
+{
+	int ret;
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	ret = reset_control_deassert(crg_udc->rst);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (!ret)
+		crg_udc->hw_reset_asserted = false;
+	return ret;
+}
+
+static int crg_udc_rebuild_after_stop(struct crg_gadget_dev *crg_udc)
+{
+	void __iomem *mode = crg_udc->mmio_virt_base + CRG_UDC_MODE_REG;
+	int ret;
+
+	writel(readl(mode) | CRG_UDC_ROLE_DEVICE, mode);
+	crg_udc_clear_portpm(crg_udc);
+	ret = crg_udc_reset_data_struct(crg_udc);
+	if (!ret)
+		ret = crg_udc_init_ep0(crg_udc);
+	if (!ret) {
+		crg_udc_set_vbus_detect(crg_udc, true);
+		crg_udc->stopped_needs_reset = false;
+		crg_udc->resetting = false;
+	}
+	return ret;
+}
+
+/*
+ * The gadget core serializes start and pullup with stop. Keep the IRQ and
+ * queue paths gated by gadget_stopping while the external reset may sleep.
+ */
+int crg_udc_restart_gadget(struct crg_gadget_dev *crg_udc,
+			   unsigned long *flags)
+{
+	int i, ret;
+
+	if (crg_udc->suspended)
+		return -EBUSY;
+
+	crg_udc_recovery_begin(crg_udc);
+	/*
+	 * A previous teardown or failed reconstruction may have left DMA
+	 * armed. Retry quiescing it before releasing any retained mappings.
+	 */
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	ret = crg_udc_quiesce_hw(crg_udc);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	crg_udc->dma_quiesce_failed = !!ret;
+	if (ret)
+		goto out;
+
+	crg_udc_release_quarantine(crg_udc);
+	if (crg_udc->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	if (crg_udc->hw_reset_asserted) {
+		ret = crg_udc_deassert_reset(crg_udc, flags);
+		if (ret)
+			goto out;
+	}
+	if (crg_udc->shutting_down) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	ret = crg_udc_rebuild_after_stop(crg_udc);
+	if (ret)
+		goto out;
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_clear_enabled(&crg_udc->udc_ep[i]);
+	crg_udc->gadget_stopping = false;
+out:
+	crg_udc->controller_faulted = !!ret;
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+/*
+ * Run the optional reset in process context after the atomic SWRST path
+ * has returned the requests and quarantined any DMA-visible mappings.
+ */
+static int crg_udc_recover_external(struct crg_gadget_dev *crg_udc,
+				     unsigned long *flags)
+{
+	int ret;
+
+	crg_udc->external_reset_pending = false;
+	crg_udc_recovery_begin(crg_udc);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	ret = reset_control_assert(crg_udc->rst);
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+	if (ret)
+		goto out;
+
+	crg_udc->hw_reset_asserted = true;
+	crg_udc->hw_dma_armed = false;
+	crg_udc->init_ep0_pending = false;
+	crg_udc->dma_quiesce_failed = false;
+	crg_udc_release_quarantine(crg_udc);
+
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	ret = crg_udc_deassert_reset(crg_udc, flags);
+	if (ret)
+		goto out;
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping) {
+		ret = -ESHUTDOWN;
+		goto out;
+	}
+	ret = crg_udc_rebuild_after_stop(crg_udc);
+out:
+	if (ret)
+		crg_udc->bus_reset_pending = false;
+	crg_udc->controller_faulted = !!ret;
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+static int crg_udc_restart_link(struct crg_gadget_dev *crg_udc,
+				bool notify_reset)
+{
+	if (!crg_udc->async_callbacks || !crg_udc->gadget_driver)
+		return 0;
+
+	crg_udc->restart_after_reset = true;
+	if (notify_reset) {
+		crg_udc->bus_reset_pending = true;
+		crg_udc_kick_reset_work(crg_udc);
+	}
+	return crg_udc_restart_if_pending(crg_udc);
+}
+
+int crg_udc_restart_if_pending(struct crg_gadget_dev *crg_udc)
+{
+	int ret;
+
+	if (!crg_udc->restart_after_reset || !crg_udc_gadget_ready(crg_udc) ||
+	    crg_udc->bus_reset_pending || crg_udc->reset_callback_active ||
+	    crg_udc->disconnect_callback_active)
+		return 0;
+
+	crg_udc->restart_after_reset = false;
+	ret = crg_udc_set_pullup(crg_udc, true);
+	if (ret && !crg_udc->link_restart_retried) {
+		/* Rebuild and retry once if the staged INIT_EP0 failed. */
+		crg_udc->link_restart_retried = true;
+		crg_udc_schedule_endpoint_recovery(crg_udc);
+	}
+	return ret;
+}
+
+static void crg_udc_recovery_work(struct work_struct *work)
+{
+	struct crg_gadget_dev *crg_udc =
+		container_of(work, struct crg_gadget_dev, recovery_work);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (crg_udc->controller_recovering || crg_udc->gadget_callbacks_active ||
+	    crg_udc->reset_callback_active ||
+	    crg_udc->suspended || crg_udc->shutting_down || crg_udc->gadget_stopping)
+		goto unlock;
+
+	if (crg_udc->endpoint_recovery_pending) {
+		/* A deferred SYS_ERR owns the disconnect notification and reset. */
+		if (crg_udc->deferred_system_error && !crg_udc->resetting)
+			crg_udc_handle_system_error(crg_udc, &flags);
+		else
+			crg_udc_recover_endpoints(crg_udc, &flags);
+		goto unlock;
+	}
+
+	if (!crg_udc->external_reset_pending)
+		goto unlock;
+
+	ret = crg_udc_recover_external(crg_udc, &flags);
+	if (ret) {
+		if (ret != -ESHUTDOWN)
+			dev_err(crg_udc->dev, "external reset recovery failed: %d\n", ret);
+		goto unlock;
+	}
+
+	crg_udc_restart_link(crg_udc, crg_udc->bus_reset_pending);
+unlock:
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+/*
+ * Called with udc_lock held. Keep the entire controller reconstruction
+ * serialized, not just the SWRST register poll. In particular, request
+ * callbacks drop udc_lock, allowing stop/suspend and IRQs to re-enter.
+ */
+int crg_udc_recover(struct crg_gadget_dev *crg_udc, unsigned long *flags,
+		    bool preserve_enabled)
+{
+	int ret;
+
+	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
+	    crg_udc->gadget_stopping || crg_udc->hw_reset_asserted)
+		return -EBUSY;
+
+	crg_udc_recovery_begin(crg_udc);
+	ret = crg_udc_reset(crg_udc, flags, preserve_enabled);
+	if (ret) {
+		crg_udc->controller_faulted = true;
+		crg_udc->dma_quiesce_failed = crg_udc->hw_dma_armed;
+		crg_udc_reset_queues(crg_udc, preserve_enabled);
+		/* Stop or shutdown may have taken over during polling or giveback. */
+		if (crg_udc->dma_quiesce_failed && crg_udc->rst &&
+		    !crg_udc->gadget_stopping && !crg_udc->shutting_down)
+			crg_udc->external_reset_pending = true;
+	}
+	if (!ret && !crg_udc->shutting_down && !crg_udc->gadget_stopping)
+		ret = crg_udc_reset_data_struct(crg_udc);
+	if (!ret && !crg_udc->shutting_down && !crg_udc->gadget_stopping)
+		ret = crg_udc_init_ep0(crg_udc);
+	if (!ret && (crg_udc->shutting_down || crg_udc->gadget_stopping))
+		ret = -ESHUTDOWN;
+
+	crg_udc->controller_faulted = !!ret;
+	crg_udc->resetting = !!ret;
+	if (!ret)
+		crg_udc->stopped_needs_reset = false;
+	crg_udc_recovery_end(crg_udc);
+	return ret;
+}
+
+/* Called with udc_lock held for recovery of a live USB session. */
+int crg_udc_recover_link(struct crg_gadget_dev *crg_udc, unsigned long *flags,
+			 bool notify_reset)
+{
+	int ret;
+
+	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
+	    crg_udc->gadget_stopping || crg_udc->suspended ||
+	    crg_udc->hw_reset_asserted)
+		return -EBUSY;
+
+	notify_reset = notify_reset && crg_udc->async_callbacks &&
+		       crg_udc->gadget_driver && !crg_udc->reset_callback_active;
+	crg_udc->connected = false;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	ret = crg_udc_recover(crg_udc, flags, notify_reset);
+
+	if (crg_udc->shutting_down || crg_udc->gadget_stopping)
+		return ret;
+
+	if (ret) {
+		dev_err(crg_udc->dev, "link recovery failed: %d\n", ret);
+		if (crg_udc->external_reset_pending)
+			crg_udc->bus_reset_pending = notify_reset;
+		return ret;
+	}
+
+	return crg_udc_restart_link(crg_udc, notify_reset);
+}
+
+/* A full endpoint recovery also invalidates the gadget configuration. */
+int crg_udc_recover_endpoints(struct crg_gadget_dev *crg_udc,
+			      unsigned long *flags)
+{
+	bool notify_reset = !crg_udc->disconnect_callback_active &&
+			    (crg_udc->device_state == USB_STATE_CONFIGURED ||
+			     crg_udc->bus_reset_pending ||
+			     crg_udc->gadget_callbacks_active);
+
+	if (crg_udc->suspended) {
+		bool bus_reset_pending = crg_udc->bus_reset_pending;
+		int ret;
+
+		/*
+		 * Suspend can be waiting for the callback that called
+		 * ep_disable(). Give back its requests synchronously. Keep
+		 * pullup and disconnect notification under suspend's control.
+		 */
+		ret = crg_udc_recover(crg_udc, flags, true);
+		if (!crg_udc->gadget_stopping && !crg_udc->shutting_down) {
+			crg_udc->bus_reset_pending = bus_reset_pending;
+			/* -EBUSY means another path still owns the controller. */
+			if (ret != -EBUSY)
+				crg_udc->suspend_recovery_result = ret;
+		}
+		return ret;
+	}
+
+	return crg_udc_recover_link(crg_udc, flags, notify_reset);
+}
+
+static const struct crg_udc_priv crg_udc_data = {
+	.quirks = CRG_UDC_QUIRKS_DEFAULT,
+};
+
+static const struct of_device_id of_crg_udc_match[] = {
+	{ .compatible = "axiado,ax3000-udc", .data = &crg_udc_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_crg_udc_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend,
+				crg_udc_resume);
+
+static struct platform_driver crg_udc_driver = {
+	.probe = crg_udc_probe,
+	.remove = crg_udc_remove,
+	.shutdown = crg_udc_shutdown,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_crg_udc_match,
+		.pm = pm_sleep_ptr(&crg_udc_pm_ops),
+	},
+};
+module_platform_driver(crg_udc_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado AX3000/AX3005 USB Device Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1

