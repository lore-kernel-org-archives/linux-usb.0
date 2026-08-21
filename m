Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013021.outbound.protection.outlook.com [52.101.83.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E136EA99;
	Fri, 21 Aug 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329421; cv=fail; b=freH5RPeobgKO2fLJ8FuhvzeQrCoEAl8TN2+X73+cW0mcGZKGnhq8lf6I4ERAFxWZPxoY78P1oUdMxNqzYdtr8qvXQmLNN2mpTOzpQimifSLg606YaGWTsjcD+COlAsEZ2Lyd8+67Aos9I88b2QnjSzrRFsZu8Eggdxl/c9l2Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329421; c=relaxed/simple;
	bh=Fww8C6P3qBAjDYiho67rTKXgllHYR+174kqjYGvGCVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J2znBv7UrzhTrfnEkMO3uHTurqeygw2iFKGjpCrK17KtObqu5GynqX/ZapKGZnndEew3JHSwS4aq+Gn8z1xpMSbTN5HxHeen72xHNRp99DTSs5gUqqpBeVdpX3IU0VGhGOeqY33wLBx4RjREZDpwgwWA6YsBUCTFgcyvQnawL+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gO1h7tYx; arc=fail smtp.client-ip=52.101.83.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gO1h7tYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmGzMG6owokfOOk74ZIZElWlrt6RCbIIuZOmVZxZVZP4aptnQpP0+LxJXbz/k9ic5+fkChFLI9qsdltR3bZAOqzvZGRIIIZPVfx4Sj92P588p1ohGndbcnYLMJPpBY9Jy7eIsLfza9zq9GRCiSHutd6PfNwgNA4HDzHjU+0lUQPwnuzKpZIU1/xWxDpCIPh7doqsOCgkyrA20hhUr8Kbs4ClHTTqG6pNVGdcvrZCYCcPrL8I0aVYswn5SOdNdMZ/f7IZ9pqiN4mc/aRx4ZuwIfOlNS1BjlvuxEj/ffTKTOyZN/sBMLqYnwlaqWbD+h/AKjB42IX+goIgZYjAekdkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOhSer9+VFTgvvO2pzkIukL9IOFB6OsB8iEbNSuH6D4=;
 b=ruKjoy3h2WLCUZ9Q+YJAzbzvEnKmfAuENqf3XYV4IQHa9BJP5NcdNKTBMcQk+EXB8uLTnYDMIia9WvySqt+Tlj0oMYyJ5gvtlcMRWoP0QUjFMDglP+F+bQdNN20njvTjI39r0KaCJqnmYGYli1NSV/iDwE3fwkQ+yaAaxV5yRL9GlCQjhRMpPOGgBPqjdhYfPIvMEUCabdNtaOwNv6kGe/OHao8rLH0wIS5N1LFKZNSt0WSZTUVO7mvQ6k0Fqx0bkuwA4oHj2xpJDNVMDs4/m4tYcd/cUEJC6skLO7yfZ6e+gydhAF+WaQtEhODzs79HVpifemg5nW28L4HisK3RgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOhSer9+VFTgvvO2pzkIukL9IOFB6OsB8iEbNSuH6D4=;
 b=gO1h7tYxdLScnS5eE5eK2p0M9+dmdnChNdr2VNyh68BK3Oof3mnnhGk+hibXUBgqyxYYR+991H+rNJI0qaV14aqF3yFwPc7iBWJXUvPUhUuZFHF6X5WvwM34svyaHAX0+w0+DntyWEaU1HKkfdDoMju8/rmTmFQAX2wz38b94sF4Jsx9DiT+f109tPgAdYGx5sA/cIhUkStSfOmWvvIIPiHvPG8a7RocRmF9q3VMBr9uKjvq96nvWjxREsO89R7wj31XSN8QYoC6dyMt8/eqCgMypnZJUXyE/mDGQ359N5MRNjBrWzh6dDNzf2W3OyIukNAwtzn6NSroDTnawkv3fQ==
Received: from DU7PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::29) by AM8PR10MB4067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1eb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 16:23:28 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::2c) by DU7PR01CA0046.outlook.office365.com
 (2603:10a6:10:50e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:28 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:27 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:15 +0200
Subject: [PATCH 04/16] usb: typec: tcpm: Add STM32 UCPD driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-4-c5e27cbc0795@foss.st.com>
References: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
In-Reply-To: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, Marek Vasut <marex@nabladev.com>, Vinod Koul
	<vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev
	<pankaj.dev@st.com>, Marek Vasut <marex@nabladev.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|AM8PR10MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e99fcfa-50e4-4474-e805-08deffa088bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|6133799003|921020|18002099003|22082099003|3023799007|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	fxPBG+Y60WOxhlHjuJhj3odP7KztvdfwTvmK5LsJb4q6wQRx16K37psUL2dlySoFGeyuzQRw3Jn5AOIbscEvJlf9zumsn/76lqnlUT4q21f9MbMZSdHsWmf/usCcV3E5o7IO905PM1kGhJE7TsdOtIwS3EqrjGvNcl+OC+JLgbavjbqaVKUcHu+BRcil/jH4NJkx+K/GR/Q6d95jmLMsSYz+jzB0a/ufaIN2U8Rfum8KS9WGMIGRvtHzN6n2bjC8zojbx/maEdvyK1DJfLdXmnRLF31hZqPv8Kxaq8/Yk1dgmc3eOT2Q8joveuYPuMhstlSs3TO/PUHZFJOwXHH/Q6Efn7f14QbxovGVcrw6bcNW9hBQakYJkFF35oiA6ZKRg8/f5MMdiP5m7twt4Y9QSixYappqb2ziZv9HfOmsw/gHz15BKuExDl7gj8wSxPjaohm+OIL9bEFkrOa6cj67QqDDIflSLUzJhGcdRi8fDygqLvBNFaRDkdhB7tESv826b6U+hi9EUjXRRQdAh20veI2ixV3hrtcIbvZS8OR/QuHWYrsaY+CBjRqqDxkQY3W+VAEkGmszU0zhd1iyrH+CarSG4F0k0SJYQuA+KiWowlz0NeAX6IBJzPWNHjuB+rph+Ze28q2eQWX30kOpJwuUif5+mkEEVkUcY7Pjc7OBEqTKfpdxRVw2pj/evybHe+4q78VU6RQOUpzckoDpx4fcSPEURTYhlO3KidkgoDfC2TPq3QKAjWvm2Rk3O2TULvjp
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(6133799003)(921020)(18002099003)(22082099003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dM8brh6LcvFl/2M7J/DdYtrp+lgbFR0uVCXM/2d9N7T31apfQAdwehYXc1NuuOb2VTmiRuVqWy2LgmEXJF/zAKutZXAqhfYh3GKoeEich9HNzkY8tvqvRISrbyVJ4ouX6vL42g0pEUlRq1Or7QGNRjdsZ/J5n0+7G8RqsCnTE9Wvy2mj1LN6Fdx/N/7Tb4F8cL0pQKnXAL4AUEuyoXoxlCK8BzaM4fPZofvf8s+lyqoXBUA5BN5l3PC/h+w7cgMgxf2/c7o3LVsWltOTDdIpV+Uvd+ydO/zAtuAe15DLUPwHBYxubgguWbOe5QQKeh8iCaUlVBC2WsnSF0P7RLYsup2+Z6JMd2IqdyCiRImyI+e9WekYL5j21SvC7fef06xLy4JCsdvoO4dOakd5T++F9pfziWWm0+324FEisng93mkeePAy9X8qcPVj7odAcOv5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:28.5975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e99fcfa-50e4-4474-e805-08deffa088bc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4067

From: Christian Bruel <christian.bruel@foss.st.com>

Add support for the STM32 UCPD controller providing USB Type‑C
Configuration Channel (CC) management and USB Power Delivery (PD)
protocol handling.

The driver integrates with the TCPM (Type-C Port Manager) framework.
On this platform, VBUS monitoring is handled by an external TCPP03

Note the driver doesn't allow PD, so the role can only be set at
plug time.

The UCPD can be a wakeup source, in such a case, keep the hardware
enabled. Else, keep track of the vbus state as provider and as
consumer, to be restored after low power.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/tcpm/Kconfig      |  12 +
 drivers/usb/typec/tcpm/Makefile     |   1 +
 drivers/usb/typec/tcpm/stm32_ucpd.c | 818 ++++++++++++++++++++++++++++++++++++
 3 files changed, 831 insertions(+)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index c24d98200a57..371381d24ee2 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -75,6 +75,18 @@ config TYPEC_ST_TCPP
 	  If you choose to build this driver as a dynamically linked
 	  module, the module will be called st_tcpp.ko.
 
+config TYPEC_UCPD_STM32
+	tristate "USB-C UCPD Interface for STM32"
+	select TYPEC_ST_TCPP
+	help
+	  This driver provides both USB PD and Type-C functionalities.
+	  Only supports Type-C functionality in Peripheral mode.
+	  Say Y or M here if your system has Type-C UCPD controller on
+	  STM32 MP23/MP25 SoCs.
+
+	  If you choose to build this driver as a dynamically linked
+	  module, the module will be called stm32_ucpd.ko.
+
 config TYPEC_WCOVE
 	tristate "Intel WhiskeyCove PMIC USB Type-C PHY driver"
 	depends on ACPI
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 0ee6ff598f75..b1a6681622b0 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_TYPEC_TCPM)		+= tcpm.o
 obj-$(CONFIG_TYPEC_FUSB302)		+= fusb302.o
 obj-$(CONFIG_TYPEC_ST_TCPP)		+= st_tcpp.o
+obj-$(CONFIG_TYPEC_UCPD_STM32)		+= stm32_ucpd.o
 obj-$(CONFIG_TYPEC_WCOVE)		+= typec_wcove.o
 typec_wcove-y				:= wcove.o
 obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
diff --git a/drivers/usb/typec/tcpm/stm32_ucpd.c b/drivers/usb/typec/tcpm/stm32_ucpd.c
new file mode 100644
index 000000000000..b5c9dc417814
--- /dev/null
+++ b/drivers/usb/typec/tcpm/stm32_ucpd.c
@@ -0,0 +1,818 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STMicroelectronics USB-C PD driver
+ *
+ * Copyright (C) 2026 STMicroelectronics
+ */
+
+#include <linux/clk.h>
+#include <linux/devm-helpers.h>
+#include <linux/i2c.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/usb/tcpm.h>
+#include "st_tcpp.h"
+
+#define UCPD_CFGR1 0
+#define UCPD_EN          BIT(31)
+#define UCPD_RXORDSETEN  GENMASK(28, 20)
+#define UCPD_PSC_UCPDCLK GENMASK(19, 17)
+#define UCPD_TRANSWIN    GENMASK(15, 11)
+#define UCPD_IFRGAP      GENMASK(10, 6)
+#define UCPD_HBITCLKDIV  GENMASK(5, 0)
+
+#define UCPD_CFGR2 0x4
+#define UCPD_WUPEN BIT(3)
+
+#define UCPD_CFGR3 0x8
+#define TRIM_CC1_RD GENMASK(3, 0)
+#define TRIM_CC1_RP GENMASK(12, 9)
+#define TRIM_CC2_RD GENMASK(19, 16)
+#define TRIM_CC2_RP GENMASK(28, 25)
+
+#define UCPD_CR  0xc
+#define UCPD_PHYRXEN  BIT(5)
+#define UCPD_ANASUBMODE GENMASK(8, 7)
+#define UCPD_ANAMODE  BIT(9)
+#define UCPD_CCENABLE GENMASK(11, 10)
+#define UCPD_RDCH     BIT(18)
+#define UCPD_CC1TCDIS BIT(20)
+#define UCPD_CC2TCDIS BIT(21)
+
+#define UCPD_IMR 0x10
+#define UCPD_TXISIE BIT(0)
+#define TXMSGDISCIE BIT(1)
+#define TXMSGSENTIE BIT(2)
+#define TXMSGABTIE  BIT(3)
+#define HRSTDISCIE  BIT(4)
+#define HRSTSENTIE  BIT(5)
+#define TXUNDIE     BIT(6)
+#define RXNEIE      BIT(8)
+#define RXORDDETIE  BIT(9)
+#define RXHRSTDETIE BIT(10)
+#define RXOVRIE     BIT(11)
+#define RXMSGENDIE  BIT(12)
+#define TYPECEVT1IE BIT(14)
+#define TYPECEVT2IE BIT(15)
+
+#define UCPD_SR  0x14
+#define TYPECEVT1  BIT(14)
+#define TYPECEVT2  BIT(15)
+#define TYPEC_VSTATE_CC1 GENMASK(17, 16)
+#define TYPEC_VSTATE_CC2 GENMASK(19, 18)
+
+#define UCPD_ICR 0x18
+#define TYPECEVT1CF BIT(14)
+#define TYPECEVT2CF BIT(15)
+
+struct stm32_ucpd {
+	void __iomem *base;
+	struct device *dev;
+	struct device *tcpp_dev;
+	struct tcpm_port *tcpm_port;
+	struct tcpc_dev tcpc_dev;
+	struct reset_control *reset;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct regulator *vdd;
+	struct regulator *vconn;
+	int ucpd_irq;
+	int cc1_status;
+	int cc2_status;
+	enum typec_cc_status cc;
+	enum typec_cc_polarity polarity;
+	bool vbus_on;
+	bool charge_on;
+	bool vconn_on;
+	bool vconn_restore;
+	struct gpio_desc *vconn_cc1_gpio;
+	struct gpio_desc *vconn_cc2_gpio;
+	struct workqueue_struct *wq;
+	struct delayed_work cc_work;
+	struct {
+		u8 cc1_rd;
+		u8 cc2_rd;
+		u8 cc1_3a;
+		u8 cc2_3a;
+		u8 cc1_1a5;
+		u8 cc2_1a5;
+	} trim;
+};
+
+/*
+ * +-----------+---------------------+----------+----------+----------+-----------+----------+
+ * | ANAMODE   | ANASUBMODE[1:0]     | Notes    | CCx=00   | CCx=01   | CCx=10    | CCx=11   |
+ * +-----------+---------------------+----------+----------+----------+-----------+----------+
+ * | 0: Source | 00: Disabled        | Disabled | Disabled | N/A      | N/A       | N/A      |
+ * |           | 01: Default USB Rp  | -        | vRa[Def] | vRd[Def] | vOPEN[Def]| N/A      |
+ * |           | 10: 1.5A Rp         | -        | vRa[1.5] | vRd[1.5] | vOPEN[1.5]| N/A      |
+ * |           | 11: 3.0A Rp         | -        | vRa[3.0] | vRd[3.0] | vOPEN[3.0]| N/A      |
+ * | 1: Sink   | xx                  | -        | vRa      | vRd-USB  | vRd-1.5   | vRd-3.0  |
+ * +-----------+---------------------+----------+----------+----------+-----------+----------+
+ */
+static enum typec_cc_status ucpd_ccrd_to_tcpm(struct stm32_ucpd *ucpd, u32 cc)
+{
+	u32 cr = readl(ucpd->base + UCPD_CR);
+	bool is_src = !FIELD_GET(UCPD_ANAMODE, cr);
+
+	if (is_src) {
+		switch (cc) {
+		case 0:
+			return TYPEC_CC_RA;
+		case 1:
+			return TYPEC_CC_RD;
+		case 2:
+			return TYPEC_CC_OPEN;
+		default:
+			dev_err(ucpd->dev, "cc mode %d\n", cc);
+			return TYPEC_CC_OPEN;
+		}
+	}
+
+	switch (cc) {
+	case 0:
+		return TYPEC_CC_OPEN;
+	case 1:
+		return TYPEC_CC_RP_DEF;
+	case 2:
+		return TYPEC_CC_RP_1_5;
+	case 3:
+		return TYPEC_CC_RP_3_0;
+	default:
+		dev_err(ucpd->dev, "cc mode %d\n", cc);
+		return TYPEC_CC_OPEN;
+	}
+}
+
+static void ucpd_cc_work(struct work_struct *work)
+{
+	struct stm32_ucpd *ucpd = container_of(work, struct stm32_ucpd, cc_work.work);
+	u32 sr = readl(ucpd->base + UCPD_SR);
+	enum typec_cc_status cc1, cc2;
+
+	cc1 = ucpd_ccrd_to_tcpm(ucpd, FIELD_GET(TYPEC_VSTATE_CC1, sr));
+	cc2 = ucpd_ccrd_to_tcpm(ucpd, FIELD_GET(TYPEC_VSTATE_CC2, sr));
+
+	if (cc1 != ucpd->cc1_status || cc2 != ucpd->cc2_status) {
+		ucpd->cc1_status = cc1;
+		ucpd->cc2_status = cc2;
+		tcpm_cc_change(ucpd->tcpm_port);
+	}
+}
+
+static void ucpd_set_trim(struct stm32_ucpd *ucpd)
+{
+	u32 val = FIELD_PREP(TRIM_CC1_RD, ucpd->trim.cc1_rd) |
+		  FIELD_PREP(TRIM_CC2_RD, ucpd->trim.cc2_rd) |
+		  FIELD_PREP(TRIM_CC1_RP, ucpd->trim.cc1_3a) |
+		  FIELD_PREP(TRIM_CC2_RP, ucpd->trim.cc2_3a);
+
+	writel(val, ucpd->base + UCPD_CFGR3);
+}
+
+static int stm32_ucpd_init(struct tcpc_dev *dev)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+	u32 val;
+
+	ucpd_set_trim(ucpd);
+
+	val = readl(ucpd->base + UCPD_CFGR1);
+	val &= ~UCPD_EN;
+	writel(val, ucpd->base + UCPD_CFGR1);
+
+	val = TYPECEVT1IE | TYPECEVT2IE;
+	writel(val, ucpd->base + UCPD_IMR);
+
+	/* Enable wakeup when UCPD_EN = 0. It will be disabled if not needed upon suspend */
+	val = readl(ucpd->base + UCPD_CFGR2);
+	writel(val | UCPD_WUPEN, ucpd->base + UCPD_CFGR2);
+	enable_irq_wake(ucpd->ucpd_irq);
+
+	val = readl(ucpd->base + UCPD_CFGR1);
+	val |= UCPD_EN;
+	writel(val, ucpd->base + UCPD_CFGR1);
+
+	return tcpp_init(ucpd->tcpp_dev);
+}
+
+/*
+ * stm32_ucpd_deinit() should be called with IRQ disabled, to avoid undesired IRQ when
+ * disconnecting TCPP protection
+ */
+static void stm32_ucpd_deinit(struct tcpc_dev *dev)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+
+	/*
+	 * Place the UCPD lines into a safe state: switch OFF vbus gates and isolate CC lines.
+	 * It avoids a device that may be plugged into the Type-C port to pull-up the CC lines
+	 * at 5v and damage them (this must be avoided in case our vdd supply gets turned off
+	 * upon reboot/reset).
+	 */
+	tcpp_deinit(ucpd->tcpp_dev);
+
+	/* Can now disable UCPD (clear UCPD_EN), other register bits will be reset */
+	writel(0, ucpd->base + UCPD_CFGR1);
+	disable_irq_wake(ucpd->ucpd_irq);
+}
+
+static int stm32_ucpd_get_vbus(struct tcpc_dev *dev)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+
+	return tcpp_get_vbus(ucpd->tcpp_dev);
+}
+
+static int stm32_ucpd_set_vbus(struct tcpc_dev *dev, bool on, bool charge)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+	int ret;
+
+	dev_dbg(ucpd->dev, "%s: %s %s\n", __func__, str_on_off(on), str_on_off(charge));
+
+	ret = tcpp_set_vbus(ucpd->tcpp_dev, on, charge);
+	if (!ret) {
+		ucpd->vbus_on = on;
+		ucpd->charge_on = charge;
+	}
+
+	return ret;
+}
+
+static u32 stm32_ucpd_to_anasubmode(enum typec_cc_status cc)
+{
+	switch (cc) {
+	case TYPEC_CC_RP_DEF:
+		return FIELD_PREP(UCPD_ANASUBMODE, 1);
+	case TYPEC_CC_RP_1_5:
+		return FIELD_PREP(UCPD_ANASUBMODE, 2);
+	case TYPEC_CC_RP_3_0:
+		return FIELD_PREP(UCPD_ANASUBMODE, 3);
+	default:
+		return 0;
+	}
+}
+
+static int stm32_ucpd_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+	u32 val;
+
+	switch (cc) {
+	case TYPEC_CC_OPEN:
+		val = readl(ucpd->base + UCPD_CR);
+		val = (val & ~UCPD_CCENABLE) | UCPD_ANAMODE;
+		break;
+	case TYPEC_CC_RD:
+		val = readl(ucpd->base + UCPD_CR);
+		val |= (UCPD_ANAMODE | UCPD_CCENABLE);
+		break;
+	case TYPEC_CC_RP_DEF:
+	case TYPEC_CC_RP_1_5:
+	case TYPEC_CC_RP_3_0:
+		val = readl(ucpd->base + UCPD_CR);
+		val &= ~(UCPD_ANAMODE | UCPD_ANASUBMODE);
+		val |= stm32_ucpd_to_anasubmode(cc) | UCPD_CCENABLE;
+		break;
+	default:
+		dev_err(ucpd->dev, "%s: Unsupported cc status %d\n", __func__, cc);
+
+		return -EOPNOTSUPP;
+	}
+
+	writel(val, ucpd->base + UCPD_CR);
+	ucpd->cc = cc;
+
+	return 0;
+}
+
+static int stm32_ucpd_get_cc(struct tcpc_dev *dev, enum typec_cc_status *cc1,
+			     enum typec_cc_status *cc2)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+	u32 sr = readl(ucpd->base + UCPD_SR);
+
+	*cc1 = ucpd_ccrd_to_tcpm(ucpd, FIELD_GET(TYPEC_VSTATE_CC1, sr));
+	*cc2 = ucpd_ccrd_to_tcpm(ucpd, FIELD_GET(TYPEC_VSTATE_CC2, sr));
+
+	dev_dbg(ucpd->dev, "%s: cc1=0x%x cc2=0x%x\n", __func__, *cc1, *cc2);
+
+	return 0;
+}
+
+static int stm32_ucpd_set_polarity(struct tcpc_dev *dev, enum typec_cc_polarity polarity)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+
+	ucpd->polarity = polarity;
+	dev_dbg(ucpd->dev, "%s: polarity %d\n", __func__, polarity);
+
+	return 0;
+}
+
+static int stm32_ucpd_set_vconn_gpio(struct stm32_ucpd *ucpd, bool on)
+{
+	bool cc1_on = on && ucpd->polarity == TYPEC_POLARITY_CC2;
+	bool cc2_on = on && ucpd->polarity == TYPEC_POLARITY_CC1;
+	int ret;
+
+	/*
+	 * Enable regulator before turning cc1/cc2 gate on. Check vconn_on, to
+	 * ensure regulator enable / disable balance.
+	 */
+	if (on && !ucpd->vconn_on && ucpd->vconn) {
+		ret = regulator_enable(ucpd->vconn);
+		if (ret) {
+			dev_err(ucpd->dev, "vconn enable failed %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (ucpd->vconn_cc1_gpio) {
+		ret = gpiod_set_value_cansleep(ucpd->vconn_cc1_gpio, cc1_on);
+		if (ret) {
+			dev_err(ucpd->dev, "vconn-cc1 %s failed: %d\n", str_enable_disable(cc1_on),
+				ret);
+			goto undo_vconn;
+		}
+		dev_dbg(ucpd->dev, "vconn-cc1 %s\n", str_enabled_disabled(cc1_on));
+	}
+
+	if (ucpd->vconn_cc2_gpio) {
+		ret = gpiod_set_value_cansleep(ucpd->vconn_cc2_gpio, cc2_on);
+		if (ret) {
+			dev_err(ucpd->dev, "vconn-cc2 %s failed: %d\n", str_enable_disable(cc2_on),
+				ret);
+			goto undo_vconn;
+		}
+		dev_dbg(ucpd->dev, "vconn-cc2 %s\n", str_enabled_disabled(cc2_on));
+	}
+
+	/* Disable in the reverse order */
+	if (!on && ucpd->vconn_on && ucpd->vconn) {
+		ret = regulator_disable(ucpd->vconn);
+		if (ret) {
+			dev_err(ucpd->dev, "vconn disable failed %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+
+undo_vconn:
+	if (on && !ucpd->vconn_on && ucpd->vconn)
+		regulator_disable(ucpd->vconn);
+
+	return ret;
+}
+
+static int stm32_ucpd_set_vconn(struct tcpc_dev *dev, bool on)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+	int ret;
+
+	dev_dbg(ucpd->dev, "%s: %s\n", __func__, str_on_off(on));
+
+	if (!on) {
+		/* Disable optional gate for CC1/CC2 Vconn before tcpp */
+		ret = stm32_ucpd_set_vconn_gpio(ucpd, on);
+		if (ret)
+			return ret;
+	}
+
+	ret = tcpp_set_vconn(ucpd->tcpp_dev, on, ucpd->polarity);
+	if (ret) {
+		dev_err(ucpd->dev, "tcpp_set_vconn failed: %d\n", ret);
+		return ret;
+	}
+
+	if (on) {
+		/* Enable optional gate for CC1/CC2 Vconn after tcpp */
+		ret = stm32_ucpd_set_vconn_gpio(ucpd, on);
+		if (ret)
+			return ret;
+	}
+
+	ucpd->vconn_on = on;
+
+	return 0;
+}
+
+static int stm32_ucpd_set_pd_rx(struct tcpc_dev *dev, bool on)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+
+	dev_dbg(ucpd->dev, "%s power delivery reception\n", str_enable_disable(on));
+
+	if (on)
+		return -EOPNOTSUPP;
+	else
+		return 0;
+}
+
+static int stm32_ucpd_set_roles(struct tcpc_dev *dev, bool attached,
+				enum typec_role pwr, enum typec_data_role data)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+	int ret;
+
+	dev_dbg(ucpd->dev, "%s: Set role pwr %s data %s\n", __func__,
+		pwr == TYPEC_SINK ? "sink" : "source",
+		data == TYPEC_DEVICE ? "device" : "host");
+
+	if (attached) {
+		dev_dbg(ucpd->dev, "attached\n");
+		ret = tcpp_attach(ucpd->tcpp_dev);
+	} else {
+		dev_dbg(ucpd->dev, "detached\n");
+		ret = tcpp_detach(ucpd->tcpp_dev);
+	}
+
+	return ret;
+}
+
+static int stm32_ucpd_pd_transmit(struct tcpc_dev *dev, enum tcpm_transmit_type type,
+				  const struct pd_message *msg, unsigned int negotiated_rev)
+{
+	struct stm32_ucpd *ucpd = container_of(dev, struct stm32_ucpd, tcpc_dev);
+
+	dev_dbg(ucpd->dev, "%s regociated %d\n", __func__, negotiated_rev);
+
+	return -EOPNOTSUPP;
+}
+
+static void init_tcpc_dev(struct tcpc_dev *tcpc_dev)
+{
+	tcpc_dev->init = stm32_ucpd_init;
+	tcpc_dev->get_vbus = stm32_ucpd_get_vbus;
+	tcpc_dev->set_cc = stm32_ucpd_set_cc;
+	tcpc_dev->get_cc = stm32_ucpd_get_cc;
+	tcpc_dev->set_polarity = stm32_ucpd_set_polarity;
+	tcpc_dev->set_vconn = stm32_ucpd_set_vconn;
+	tcpc_dev->set_vbus = stm32_ucpd_set_vbus;
+	tcpc_dev->set_pd_rx = stm32_ucpd_set_pd_rx;
+	tcpc_dev->set_roles = stm32_ucpd_set_roles;
+	tcpc_dev->pd_transmit = stm32_ucpd_pd_transmit;
+}
+
+static int stm32_ucpd_read_trim(struct device *dev, const char *name, u8 *val)
+{
+	struct nvmem_cell *cell;
+	size_t len;
+	void *buf;
+
+	cell = devm_nvmem_cell_get(dev, name);
+	if (IS_ERR(cell)) {
+		dev_err(dev, "cannot get cell %s\n", name);
+		return PTR_ERR(cell);
+	}
+
+	buf = nvmem_cell_read(cell, &len);
+	if (IS_ERR(buf)) {
+		dev_err(dev, "cannot read %s\n", name);
+		return PTR_ERR(buf);
+	}
+
+	*val = *(u8 *)buf;
+	kfree(buf);
+
+	return 0;
+}
+
+struct trim_desc {
+	const char *name;
+	u8 *value;
+};
+
+static int stm32_ucpd_get_trim_values(struct stm32_ucpd *ucpd)
+{
+	struct trim_desc desc[] = {
+		{ "trim_1a5_cc1", &ucpd->trim.cc1_1a5 },
+		{ "trim_3a_cc1",  &ucpd->trim.cc1_3a },
+		{ "trim_3a_cc2",  &ucpd->trim.cc2_3a },
+		{ "trim_1a5_cc2", &ucpd->trim.cc2_1a5 },
+		{ "trim_rd_cc1", &ucpd->trim.cc1_rd },
+		{ "trim_rd_cc2", &ucpd->trim.cc2_rd },
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(desc); i++) {
+		int ret = stm32_ucpd_read_trim(ucpd->dev, desc[i].name, desc[i].value);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t ucpd_irq_handler(int irq, void *data)
+{
+	struct stm32_ucpd *ucpd = data;
+	enum typec_cc_status cc1 = ucpd->cc1_status;
+	enum typec_cc_status cc2 = ucpd->cc2_status;
+	u32 sr, handled = 0;
+
+	sr = readl(ucpd->base + UCPD_SR);
+
+	if (sr & TYPECEVT1) {
+		cc1 = ucpd_ccrd_to_tcpm(ucpd, FIELD_GET(TYPEC_VSTATE_CC1, sr));
+		handled |= TYPECEVT1CF;
+	}
+
+	if (sr & TYPECEVT2) {
+		cc2 = ucpd_ccrd_to_tcpm(ucpd, FIELD_GET(TYPEC_VSTATE_CC2, sr));
+		handled |= TYPECEVT2CF;
+	}
+
+	if (!handled) {
+		dev_err(ucpd->dev, "unexpected IRQ, SR %#x\n", sr);
+
+		return IRQ_NONE;
+	}
+
+	if (cc1 == ucpd->cc1_status && cc2 == ucpd->cc2_status)
+		goto irq_handled;
+
+	/*
+	 * For the first transition from unattached (cached CC_OPEN),
+	 * notify the TCPM framework and rely on its own attach debounce.
+	 * Debounce subsequent CC changes locally.
+	 */
+	if (ucpd->cc1_status != TYPEC_CC_OPEN || ucpd->cc2_status != TYPEC_CC_OPEN) {
+		mod_delayed_work(ucpd->wq, &ucpd->cc_work, msecs_to_jiffies(PD_T_PD_DEBOUNCE));
+	} else {
+		if (cc1 != TYPEC_CC_OPEN)
+			ucpd->cc1_status = cc1;
+		if (cc2 != TYPEC_CC_OPEN)
+			ucpd->cc2_status = cc2;
+		tcpm_cc_change(ucpd->tcpm_port);
+	}
+
+irq_handled:
+	writel(handled, ucpd->base + UCPD_ICR);
+
+	return IRQ_HANDLED;
+}
+
+static void ucpd_vbus_changed(void *data, bool vbus_present)
+{
+	struct stm32_ucpd *ucpd = data;
+
+	dev_dbg(ucpd->dev, "VBUS change: %d\n", vbus_present);
+
+	tcpm_vbus_change(ucpd->tcpm_port);
+}
+
+static int stm32_ucpd_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_client *tcpp_client;
+	struct device_node *tcpp_np;
+	struct stm32_ucpd *ucpd;
+	int ret;
+
+	ucpd = devm_kzalloc(dev, sizeof(*ucpd), GFP_KERNEL);
+	if (!ucpd)
+		return -ENOMEM;
+
+	ucpd->dev = dev;
+	platform_set_drvdata(pdev, ucpd);
+
+	ucpd->vdd = devm_regulator_get(&pdev->dev, "ucpd");
+	if (IS_ERR(ucpd->vdd))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ucpd->vdd), "vdd get failed\n");
+
+	ucpd->vconn = devm_regulator_get_optional(&pdev->dev, "vconn");
+	if (IS_ERR(ucpd->vconn)) {
+		if (PTR_ERR(ucpd->vconn) != -ENODEV)
+			return dev_err_probe(&pdev->dev, PTR_ERR(ucpd->vconn),
+					     "vconn get failed\n");
+		ucpd->vconn = NULL;
+	}
+
+	ucpd->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ucpd->base))
+		return PTR_ERR(ucpd->base);
+
+	ucpd->num_clks = devm_clk_bulk_get_all(dev, &ucpd->clks);
+	if (ucpd->num_clks <= 0)
+		return ucpd->num_clks ? : -ENOENT;
+
+	ucpd->reset = devm_reset_control_get_exclusive(dev, "ucpd");
+	if (IS_ERR(ucpd->reset))
+		return dev_err_probe(dev, PTR_ERR(ucpd->reset), "Failed to get UCPD reset\n");
+
+	ret = stm32_ucpd_get_trim_values(ucpd);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get trim values\n");
+
+	ucpd->vconn_cc1_gpio = devm_gpiod_get_optional(dev, "vconn-cc1", GPIOD_OUT_LOW);
+	if (IS_ERR(ucpd->vconn_cc1_gpio))
+		return dev_err_probe(dev, PTR_ERR(ucpd->vconn_cc1_gpio), "vconn-cc1 get failed\n");
+
+	ucpd->vconn_cc2_gpio = devm_gpiod_get_optional(dev, "vconn-cc2", GPIOD_OUT_LOW);
+	if (IS_ERR(ucpd->vconn_cc2_gpio))
+		return dev_err_probe(dev, PTR_ERR(ucpd->vconn_cc2_gpio), "vconn-cc2 get failed\n");
+
+	ucpd->ucpd_irq = platform_get_irq_byname(pdev, "ucpd");
+	if (ucpd->ucpd_irq < 0)
+		return ucpd->ucpd_irq;
+
+	ucpd->tcpc_dev.fwnode = device_get_named_child_node(dev, "connector");
+	if (IS_ERR(ucpd->tcpc_dev.fwnode))
+		return dev_err_probe(dev, PTR_ERR(ucpd->tcpc_dev.fwnode), "connector not found");
+
+	tcpp_np = of_parse_phandle(dev->of_node, "st,tcpp", 0);
+	if (!tcpp_np)
+		return -EINVAL;
+
+	tcpp_client = of_find_i2c_device_by_node(tcpp_np);
+	of_node_put(tcpp_np);
+
+	/* tcpp driver must be probed so tcpp_init() can be called from tcpm_register_port() */
+	if (!tcpp_client || !tcpp_client->dev.driver)
+		return -EPROBE_DEFER;
+
+	ucpd->tcpp_dev = &tcpp_client->dev;
+
+	/* No irq until tcpm_port is ready */
+	irq_set_status_flags(ucpd->ucpd_irq, IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, ucpd->ucpd_irq, NULL, ucpd_irq_handler, IRQF_ONESHOT,
+					dev_name(dev), ucpd);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to get irq\n");
+		goto put_tcpp;
+	}
+
+	init_tcpc_dev(&ucpd->tcpc_dev);
+
+	ret = regulator_enable(ucpd->vdd);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to enable regulator\n");
+		goto put_tcpp;
+	}
+
+	ret = clk_bulk_prepare_enable(ucpd->num_clks, ucpd->clks);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to enable clocks\n");
+		goto disable_regulator;
+	}
+
+	ret = reset_control_deassert(ucpd->reset);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to deassert reset\n");
+		goto disable_clks;
+	}
+
+	ret = devm_pm_runtime_get_noresume(dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get runtime PM noresume\n");
+		goto disable_clks;
+	}
+
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to activate and enable runtime PM\n");
+		goto disable_clks;
+	}
+
+	ucpd->wq = create_singlethread_workqueue(dev_name(ucpd->dev));
+	if (!ucpd->wq) {
+		ret = -ENOMEM;
+		goto disable_clks;
+	}
+
+	INIT_DELAYED_WORK(&ucpd->cc_work, ucpd_cc_work);
+
+	ucpd->tcpm_port = tcpm_register_port(dev, &ucpd->tcpc_dev);
+	if (IS_ERR(ucpd->tcpm_port)) {
+		ret = dev_err_probe(dev, PTR_ERR(ucpd->tcpm_port), "failed to register tcpm\n");
+		goto destroy_wq;
+	}
+
+	tcpp_register_vbus_notifier(ucpd->tcpp_dev, ucpd_vbus_changed, ucpd);
+
+	device_set_wakeup_capable(dev, true);
+
+	enable_irq(ucpd->ucpd_irq);
+
+	return 0;
+
+destroy_wq:
+	destroy_workqueue(ucpd->wq);
+
+disable_clks:
+	clk_bulk_disable_unprepare(ucpd->num_clks, ucpd->clks);
+
+disable_regulator:
+	regulator_disable(ucpd->vdd);
+
+put_tcpp:
+	put_device(ucpd->tcpp_dev);
+
+	return ret;
+};
+
+static void stm32_ucpd_remove(struct platform_device *pdev)
+{
+	struct stm32_ucpd *ucpd = platform_get_drvdata(pdev);
+
+	disable_irq(ucpd->ucpd_irq);
+	cancel_delayed_work_sync(&ucpd->cc_work);
+	tcpp_unregister_vbus_notifier(ucpd->tcpp_dev);
+	tcpm_unregister_port(ucpd->tcpm_port);
+	stm32_ucpd_deinit(&ucpd->tcpc_dev);
+	destroy_workqueue(ucpd->wq);
+	clk_bulk_disable_unprepare(ucpd->num_clks, ucpd->clks);
+	regulator_disable(ucpd->vdd);
+	put_device(ucpd->tcpp_dev);
+};
+
+static void stm32_ucpd_shutdown(struct platform_device *pdev)
+{
+	struct stm32_ucpd *ucpd = platform_get_drvdata(pdev);
+
+	disable_irq(ucpd->ucpd_irq);
+	stm32_ucpd_set_vconn(&ucpd->tcpc_dev, false);
+	stm32_ucpd_deinit(&ucpd->tcpc_dev);
+}
+
+static int stm32_ucpd_suspend(struct device *dev)
+{
+	struct stm32_ucpd *ucpd = dev_get_drvdata(dev);
+
+	/* Already enabled for wakeup: just return */
+	if (device_may_wakeup(dev))
+		return 0;
+
+	disable_irq(ucpd->ucpd_irq);
+	cancel_delayed_work_sync(&ucpd->cc_work);
+	/* backup vconn_on flag */
+	ucpd->vconn_restore = ucpd->vconn_on;
+	stm32_ucpd_set_vconn(&ucpd->tcpc_dev, false);
+	stm32_ucpd_deinit(&ucpd->tcpc_dev);
+	clk_bulk_disable_unprepare(ucpd->num_clks, ucpd->clks);
+	regulator_disable(ucpd->vdd);
+
+	return 0;
+}
+
+static int stm32_ucpd_resume(struct device *dev)
+{
+	struct stm32_ucpd *ucpd = dev_get_drvdata(dev);
+	int ret;
+
+	/* Kept active: just return */
+	if (device_may_wakeup(dev))
+		return 0;
+
+	ret = regulator_enable(ucpd->vdd);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(ucpd->num_clks, ucpd->clks);
+	if (ret) {
+		regulator_disable(ucpd->vdd);
+		return ret;
+	}
+
+	stm32_ucpd_init(&ucpd->tcpc_dev);
+	stm32_ucpd_set_cc(&ucpd->tcpc_dev, ucpd->cc);
+	stm32_ucpd_set_vconn(&ucpd->tcpc_dev, ucpd->vconn_restore);
+	tcpp_set_vbus(ucpd->tcpp_dev, ucpd->vbus_on, ucpd->charge_on);
+	enable_irq(ucpd->ucpd_irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops stm32_ucpd_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(stm32_ucpd_suspend, stm32_ucpd_resume)
+};
+
+static const struct of_device_id stm32_ucpd_of_match[] = {
+	{ .compatible = "st,stm32mp25-ucpd" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, stm32_ucpd_of_match);
+
+static struct platform_driver stm32_ucpd_driver = {
+	.probe = stm32_ucpd_probe,
+	.remove	= stm32_ucpd_remove,
+	.shutdown = stm32_ucpd_shutdown,
+	.driver = {
+		.name = "stm32-ucpd",
+		.pm = &stm32_ucpd_pm_ops,
+		.of_match_table = stm32_ucpd_of_match,
+	},
+};
+module_platform_driver(stm32_ucpd_driver);
+
+MODULE_DESCRIPTION("USB Type-C Power Delivery");
+MODULE_AUTHOR("Christian Bruel <christian.bruel@foss.st.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

