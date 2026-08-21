Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013005.outbound.protection.outlook.com [52.101.72.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4174536B908;
	Fri, 21 Aug 2026 16:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329418; cv=fail; b=misI6X7xbSJEtSlObxHCeMyfvTGdckFrysuHnyycjx4yperEi4SdKxch9nsswQ9/NtkP4+uoVgq+jTTLvmEZG1Z8Jkuvkof6Rco42g1cN/85S1e/uUHRodAgUJcutB4OjlgK0wMmLzCEcGXRRGZJCqzWRwZJJmoMqFLW44QLl7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329418; c=relaxed/simple;
	bh=MmVmh97LLDVc2cUq/2jcQk4npfQ5dznSsUsG8LbYzP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lQnlUWnwQI6E+vN0HtT34RG4/4EK/RIcRMONW0Sw4O2MpsYmH/HhJmp5AAp7EVxQB4yi2rWUzJZpY50H8Mo3fzV+o9s5Dtv8ieowAdSZnhWETgNxE4hl92f4WK0Mc4kdLi6sQuuzbl9lj7YJs5O3Wk4+DfeNWJhIP5LXUSj4Bk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MUsRXjQI; arc=fail smtp.client-ip=52.101.72.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MUsRXjQI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtnWEolCCIAxuuem/W0MoMlALmVJrPwej6wJXsoMmO0xz6/834GM0OuAnxc7zHe7l3Pno4Itvfq+7PCSAxPLfRgCZocXCznzduXPPen7UrlzT2DqQzW6PfJdAVXuwMws9yfgA4CkN3BiRo5uSWUwcCTnfP7CK7dPDBsIZjxCknhCpMGNxSeuBnnc0ui/cFgja1IYLWbJP5BL4oQ3GlkVLqcBDX4eKZlUcKaWVfBwC55sw/8pwk1z70pW7ZP+Cafin3o6Xh8rYm7KCd8+D+y9MxFQ1iBjtPHPc6q7ORbyOOBZ8/y09HNyTN3niRPTjv8xsnxIiHMoIPmHRnCr1n8doA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUoxYuiZNjOupmLqRwZh4SEi9dIAImexQpr0ZE4ikGA=;
 b=YOS6U6B3kEoF2usQyGqzUmIH8cAXkiVFA/CcjGG/5R2Hl3Xef16d6mETMIHqx3xO5dlVyrEK11G++Y4X9Pe1K2d3xhhfsXVVg289Sv4qpPVYXnrXDAx24okulNBX93ZFv4sjW9mvOU6Dp/Xnj/UyuRhdd1PHImZxQJhUNMJebgnHp/fCiwwY+EKzWanGQrt+k/SarocUbIl7hkNXKJePCMRMNH2H8Gkaf6poNZtE5g40WuoVnwuNArVHSGzpHtDfkOWVe0aUT2Ep9XIIUmrFwxH7aM7FfsRENJvCq204/r0rHLj4h0FcqYjfTPJvev6I4125JZKs90Vvt1q5Ij2vPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUoxYuiZNjOupmLqRwZh4SEi9dIAImexQpr0ZE4ikGA=;
 b=MUsRXjQIfHCwEDLjt0j26LCrfPyR0KT3CIhmZyYYKwTUJvCv48/qCS1CCjOFHA/6CrP7KFfdUhEq5hZ3KsHl0MSLzKhZ0otflTLn8aXTuZkMZ2LPDlp7hwh4GKshJWZ6OZ5R5A3T76q2t3CdqX/hYX+9btE8++L7JCAOcekIOfOnsN5ekzgJuN3GNko2W5av7DyY8SgneLbTZuJ1FYrbzyNEGgf3ZRJocZzLHjTY7qmzMnrh0ggro7KpuF+s7w6tV5Z07NQTyHnb/6w8j5mDT591Egk7JnMyYjA2h9Dwug9QbRz41abdBxRzcMUbnCLOMJDd+wCl43SJCm7mDruB6w==
Received: from AM9P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::25)
 by VE1PR10MB3935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:160::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:27 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:20b:21d:cafe::4f) by AM9P192CA0020.outlook.office365.com
 (2603:10a6:20b:21d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:23:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:26 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:26 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:13 +0200
Subject: [PATCH 02/16] usb: typec: tcpm: Add STM32 tcpp driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-2-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|VE1PR10MB3935:EE_
X-MS-Office365-Filtering-Correlation-Id: 562f05f8-e51a-4463-9ed7-08deffa087ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|82310400026|1800799024|36860700016|18002099003|22082099003|18092099006|56012099006|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	14PJ7E10fiBUq/bbQweFXY9nZ/694lDrGCOrBqItEo+NDrPFxJHQTFo6TyNG2IlgDK5ANP8UOFtzUbU6QOdGvWQSBoNMdpIJ14bu5ia9GrCuiL7SwJjirybar6/ccih5BlmIyZh+y0doH7XYdbL9nkP+96RSMuDJbTUljA9j+KHWTvHXVsJzoEyb/e9uMIa/ArtNjFxpCN+jH0AWGmTCF4EAfntgGyKqKDifdQ8Jqfe9aQRT2I0BbRnS4CR89IaUKDmAgLiYRCMixe3gL0amrR8ipdS4kwqviYXD6F7yp/NxIiX7BZLKRlVHs2H6W2YccE9uF2PYTsyLUDUl+72UfjgWlCYfNCydC6rz6nP+Q7bG94YoIE6zSPDh5ibrdhykjPml4CC58yjic88+HOGBLc8SZWP1io+xpqKp+A0vxV3oILwCkmEycB6FKkJA7ygTCqCdgdlRDrQSFlfC7IMbEhSNKryjYUdhQxtp7KVR3n0rs8pUl6xSOB+xZBrqV+la3P/u8DPEriVjze/ObuJguI/HK97j8OBjRqHw+kLF51ceVbc5eueb7frqPC8IEy3xmFRewBpUh7oDIWJt68lqqb5AWyqgjeu49h+ke3Kz+r9RyMDIcGKG6M0W2AZjRyUoaQKeq945ipL5QgPdvF/KaQUS3jz/IILbnk5hSse7ELXTRUBBqpQYFum+P8LWvMa6FwGS0e8SuMvJBru0dKQjxhFXAY+gKQwBzRqC+mXN0C19CZFyoi4cmoWWx+oswqd5
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(18092099006)(56012099006)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r04fbd58UFeuyrWVC7Ye8jdia96Q89kDwzCyXumq6IAzqMs/+yfwz/ioEgm1PaSDxHuHHww5yBrORThoJEb0NoXdKOsdov7+JmShXZLX6oarvcfH/mTaNcPzlyzqOuFEakZXeGa8d3xjqJM0hJThb3DJyDogctkbBOrBMKIAOKTzj4U49Rg6N1lL2kz0nfJJ/+/jN5yyERo4OI6JofF0lGD01y3iG8fcyBLFuHjUzP5qi8BuuSkGBpvABNNIYl/oEzlSGGzbnmg+zReCIwipF2YGbWxH6hJTETqglQNJHenicIYHiF494ujlLA/y83GDHJ2761pBcGQ38BcSUfSXg0b8Wcuw7+ZYQeldgmIfYoXvMMTQmBRMRt18Hs5BGmKV+/sLDDRzo3qBOlvIU0TycEXetHxYUcaubq9Tk8CUqxpsU40wdFTs1Dx+j8Sv0G9d
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:27.0324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 562f05f8-e51a-4463-9ed7-08deffa087ce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3935

From: Christian Bruel <christian.bruel@foss.st.com>

Add support for the STMicroelectronics TCPP02 and TCPP03 USB-C PD
protection for dual role power (DRP).
It can be used with the STM32 family embedding UCPD controller.

Purpose is to be used by the UCPD driver and tcpm framework to notify
Vbus changes. To control the provider gate, the TCPP must be put in
normal PM mode. In this mode, only failures may be reported by the IRQ
line. So add a delayed work, to poll for VBUS status bits via I2C.
Start to poll when necessary: upon attach / detach, or when switching
on / off provider or consumer gates.

Also provide HW protection (mainly ESD) and drive Vbus and Vconn.
Isolate CC lines while in low power (hibernate mode) so the main STM32
controller can be put in standby mode safely.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/tcpm/Kconfig   |  10 +
 drivers/usb/typec/tcpm/Makefile  |   1 +
 drivers/usb/typec/tcpm/st_tcpp.c | 418 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/typec/tcpm/st_tcpp.h |  21 ++
 4 files changed, 450 insertions(+)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 00baa7503d45..c24d98200a57 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -65,6 +65,16 @@ config TYPEC_FUSB302
 	  Type-C Port Controller Manager to provide USB PD and USB
 	  Type-C functionalities.
 
+config TYPEC_ST_TCPP
+	tristate "STMicroelectronics TCCP USB-C Protection for UCPD DRP"
+	depends on I2C
+	help
+	  Say Y or M here if your system has STM TCPP03 or TCPP02 Type-C
+	  PD protection
+
+	  If you choose to build this driver as a dynamically linked
+	  module, the module will be called st_tcpp.ko.
+
 config TYPEC_WCOVE
 	tristate "Intel WhiskeyCove PMIC USB Type-C PHY driver"
 	depends on ACPI
diff --git a/drivers/usb/typec/tcpm/Makefile b/drivers/usb/typec/tcpm/Makefile
index 7a8cad0c0bdb..0ee6ff598f75 100644
--- a/drivers/usb/typec/tcpm/Makefile
+++ b/drivers/usb/typec/tcpm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC_TCPM)		+= tcpm.o
 obj-$(CONFIG_TYPEC_FUSB302)		+= fusb302.o
+obj-$(CONFIG_TYPEC_ST_TCPP)		+= st_tcpp.o
 obj-$(CONFIG_TYPEC_WCOVE)		+= typec_wcove.o
 typec_wcove-y				:= wcove.o
 obj-$(CONFIG_TYPEC_TCPCI)		+= tcpci.o
diff --git a/drivers/usb/typec/tcpm/st_tcpp.c b/drivers/usb/typec/tcpm/st_tcpp.c
new file mode 100644
index 000000000000..975d20a1ec71
--- /dev/null
+++ b/drivers/usb/typec/tcpm/st_tcpp.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STMicroelectronics USB-C PD protection TCPP02/03 driver
+ *
+ * Copyright (C) 2026 STMicroelectronics
+ */
+
+#include <linux/i2c.h>
+#include <linux/of_irq.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/tcpm.h>
+#include "st_tcpp.h"
+
+struct st_tcpp {
+	struct device *dev;
+	struct regmap *regmap;
+	struct gpio_desc *enable_gpio;
+	struct workqueue_struct *wq;
+	struct delayed_work vbus_work;
+	unsigned long delay;
+	bool vbus;
+	tcpp_vbus_cb_t vbus_cb;
+	/* lock for sharing states with stm32_ucpd */
+	struct mutex lock;
+	void *vbus_cb_data;
+};
+
+#define TCPP_CR0 0
+#define TCPP_SR1 1
+#define TCPP_SR2 2
+
+/* writing register CR0 */
+#define TCPP_VCONN	GENMASK(1, 0)
+#define TCPP_V1		BIT(0)
+#define TCPP_V2		BIT(1)
+#define TCPP_GD		GENMASK(3, 2)
+#define TCPP_GDP	BIT(2)		/* Provider Gate */
+#define TCPP_GDP_OPEN	0
+#define TCPP_GDP_CLOSED	1
+#define TCPP_GDC	BIT(3)		/* Consumer Gate */
+#define TCPP_GDC_OPEN	1
+#define TCPP_GDC_CLOSED 0
+
+#define TCPP_PM       GENMASK(5, 4)
+#define PM_HIBERNATE  0
+#define PM_NORMAL     1
+#define PM_LP	      2
+#define TCPP_VBUSD    BIT(6)
+
+/* reading register SR1 */
+#define TCPP_VBUS_OK  BIT(5)
+
+#define VBUS_POLL_INTERVAL_MS	10
+
+int tcpp_register_vbus_notifier(struct device *dev, tcpp_vbus_cb_t cb, void *data)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+
+	tcpp->vbus_cb = cb;
+	tcpp->vbus_cb_data = data;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tcpp_register_vbus_notifier);
+
+void tcpp_unregister_vbus_notifier(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+
+	tcpp->vbus_cb = NULL;
+	tcpp->vbus_cb_data = NULL;
+}
+EXPORT_SYMBOL_GPL(tcpp_unregister_vbus_notifier);
+
+static int tcpp_update_cr0_bits(struct st_tcpp *tcpp, u32 msk, u32 val)
+{
+	u32 sr1;
+	int ret;
+
+	ret = regmap_read(tcpp->regmap, TCPP_SR1, &sr1);
+	if (ret)
+		dev_err(tcpp->dev, "%s: Unable to read SR1: %d\n", __func__, ret);
+
+	sr1 &= ~msk;
+	sr1 |= val;
+
+	ret = regmap_write(tcpp->regmap, TCPP_CR0, sr1);
+	if (ret)
+		dev_err(tcpp->dev, "%s: Unable to update CR0: %d\n", __func__, ret);
+
+	return ret;
+}
+
+static int tcpp_set_pm(struct st_tcpp *tcpp, int pm)
+{
+	dev_dbg(tcpp->dev, "%s: set %s mode\n", __func__,
+		pm == PM_NORMAL ? "NORMAL" :
+		pm == PM_LP ? "LP" :
+		pm == PM_HIBERNATE ? "HIBERNATE" : "NA");
+
+	return tcpp_update_cr0_bits(tcpp, TCPP_PM, FIELD_PREP(TCPP_PM, pm));
+}
+
+int tcpp_init(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&tcpp->lock);
+	gpiod_set_value_cansleep(tcpp->enable_gpio, true);
+
+	ret = tcpp_set_pm(tcpp, PM_LP);
+	if (ret) {
+		gpiod_set_value_cansleep(tcpp->enable_gpio, false);
+		goto err;
+	}
+
+	enable_irq(client->irq);
+
+err:
+	mutex_unlock(&tcpp->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(tcpp_init);
+
+void tcpp_deinit(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+
+	disable_irq(client->irq);
+	/* vbus_work may take the lock : cancel it without holding the mutex */
+	cancel_delayed_work_sync(&tcpp->vbus_work);
+
+	mutex_lock(&tcpp->lock);
+	tcpp_set_pm(tcpp, PM_HIBERNATE);
+	gpiod_set_value_cansleep(tcpp->enable_gpio, false);
+	tcpp->vbus = false;
+
+	mutex_unlock(&tcpp->lock);
+}
+EXPORT_SYMBOL(tcpp_deinit);
+
+int tcpp_get_vbus(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+	u32 sr2;
+	int ret;
+
+	mutex_lock(&tcpp->lock);
+	ret = regmap_read(tcpp->regmap, TCPP_SR2, &sr2);
+	if (ret) {
+		dev_err(tcpp->dev, "Unable to get SR2: %d\n", ret);
+		goto err;
+	}
+
+	ret = !!(sr2 & TCPP_VBUS_OK);
+
+err:
+	mutex_unlock(&tcpp->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(tcpp_get_vbus);
+
+int tcpp_set_vbus(struct device *dev, bool on, bool charge)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+	bool gdp, gdc;
+	int ret;
+
+	dev_dbg(dev, "provider: %s, consumer: %s\n", str_enable_disable(on),
+		str_enable_disable(charge));
+
+	if (on) {
+		/* Set to normal mode to allow provider gate control via i2c */
+		ret = tcpp_set_pm(tcpp, PM_NORMAL);
+		if (ret)
+			return ret;
+	}
+
+	gdp = on ? TCPP_GDP_CLOSED : TCPP_GDP_OPEN;
+	gdc = charge ? TCPP_GDC_CLOSED : TCPP_GDC_OPEN;
+
+	ret = tcpp_update_cr0_bits(tcpp, TCPP_GD,
+				   FIELD_PREP(TCPP_GDP, gdp) | FIELD_PREP(TCPP_GDC, gdc));
+	if (ret)
+		return ret;
+
+	/* Already done (switched ON or OFF) */
+	if ((on || charge) == tcpp->vbus)
+		return 0;
+
+	/*
+	 * Not getting IRQ on Vbus change in NORMAL mode (only failures).
+	 * Need to check Vbus state change to notify the tcpm state machine,
+	 * e.g. either vbus has been en(dis)abled as provider or consumer,
+	 * and vbus is in the expected en(dis)abled state (read it by i2c).
+	 */
+	if (on)
+		tcpp->delay = jiffies + msecs_to_jiffies(PD_T_SRC_TURN_ON);
+	else
+		tcpp->delay = jiffies + msecs_to_jiffies(PD_T_SAFE_0V);
+
+	mod_delayed_work(tcpp->wq, &tcpp->vbus_work, 0);
+
+	return 0;
+}
+EXPORT_SYMBOL(tcpp_set_vbus);
+
+int tcpp_set_vconn(struct device *dev, bool on, enum typec_cc_polarity polarity)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+	u32 vconn = 0;
+	int ret;
+
+	if (on) {
+		/* Set to normal mode to allow Vconn control via i2c */
+		ret = tcpp_set_pm(tcpp, PM_NORMAL);
+		if (ret)
+			return ret;
+
+		if (polarity == TYPEC_POLARITY_CC1)
+			vconn = TCPP_V2;
+		else
+			vconn = TCPP_V1;
+	}
+
+	dev_dbg(dev, "%s: set vconn 0x%x\n", __func__, vconn);
+
+	return tcpp_update_cr0_bits(tcpp, TCPP_VCONN, vconn);
+}
+EXPORT_SYMBOL(tcpp_set_vconn);
+
+int tcpp_attach(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&tcpp->lock);
+	ret = tcpp_set_pm(tcpp, PM_NORMAL);
+	mutex_unlock(&tcpp->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(tcpp_attach);
+
+int tcpp_detach(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&tcpp->lock);
+	ret = tcpp_set_pm(tcpp, PM_LP);
+	mutex_unlock(&tcpp->lock);
+	if (ret)
+		return ret;
+
+	/* Already OFF ? No need to poll. */
+	if (!tcpp->vbus)
+		return 0;
+
+	/*
+	 * Earlier in NORMAL mode, don't get IRQ on vbus change (only failures),
+	 * Check Vbus upon detach, to notify Vbus off.
+	 */
+	tcpp->delay = jiffies + msecs_to_jiffies(PD_T_SAFE_0V);
+	mod_delayed_work(tcpp->wq, &tcpp->vbus_work, 0);
+
+	return ret;
+}
+EXPORT_SYMBOL(tcpp_detach);
+
+static void tcpp_vbus_poll_work(struct work_struct *work)
+{
+	struct st_tcpp *tcpp = container_of(work, struct st_tcpp, vbus_work.work);
+	bool vbus_on = !!tcpp_get_vbus(tcpp->dev);
+
+	dev_dbg(tcpp->dev, "%s vbus: %s\n", __func__, str_on_off(vbus_on));
+
+	if (tcpp->vbus != vbus_on) {
+		mutex_lock(&tcpp->lock);
+		if (tcpp->vbus_cb)
+			tcpp->vbus_cb(tcpp->vbus_cb_data, vbus_on);
+		mutex_unlock(&tcpp->lock);
+		tcpp->vbus = vbus_on;
+		return;
+	}
+
+	if (time_is_after_jiffies(tcpp->delay))
+		mod_delayed_work(tcpp->wq, &tcpp->vbus_work,
+				 msecs_to_jiffies(VBUS_POLL_INTERVAL_MS));
+}
+
+static irqreturn_t tcpp_irq_thread(int irq, void *data)
+{
+	struct st_tcpp *tcpp = data;
+
+	mod_delayed_work(tcpp->wq, &tcpp->vbus_work, 0);
+
+	return IRQ_HANDLED;
+}
+
+static const struct regmap_config tcpp_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int tcpp_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct st_tcpp *tcpp;
+	int ret;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	tcpp = devm_kzalloc(dev, sizeof(*tcpp), GFP_KERNEL);
+	if (!tcpp)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, tcpp);
+
+	tcpp->dev = dev;
+	tcpp->regmap = devm_regmap_init_i2c(client, &tcpp_regmap);
+
+	mutex_init(&tcpp->lock);
+
+	tcpp->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(tcpp->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(tcpp->enable_gpio),
+				     "Failed to request TCPP enable GPIO\n");
+
+	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, tcpp_irq_thread,
+					IRQF_ONESHOT, "tcpp", tcpp);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	tcpp->wq = alloc_ordered_workqueue(dev_name(tcpp->dev), 0);
+	if (!tcpp->wq)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&tcpp->vbus_work, tcpp_vbus_poll_work);
+
+	return 0;
+}
+
+static void tcpp_remove(struct i2c_client *client)
+{
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+
+	cancel_delayed_work_sync(&tcpp->vbus_work);
+	destroy_workqueue(tcpp->wq);
+}
+
+static int tcpp_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct st_tcpp *tcpp = i2c_get_clientdata(client);
+
+	flush_workqueue(tcpp->wq);
+	disable_irq(client->irq);
+
+	return 0;
+}
+
+static int tcpp_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	enable_irq(client->irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tcpp_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(tcpp_suspend, tcpp_resume)
+};
+
+static const struct i2c_device_id tcpp_id[] = {
+	{ "tcpp", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tcpp_id);
+
+static const struct of_device_id stm_tcpp_match_table[] = {
+	{ .compatible = "st,tcpp03" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, stm_tcpp_match_table);
+
+static struct i2c_driver tcpp_driver = {
+	.driver = {
+		.name = "tcpp",
+		.pm = &tcpp_pm_ops,
+		.of_match_table = stm_tcpp_match_table,
+	},
+	.probe = tcpp_i2c_probe,
+	.remove = tcpp_remove,
+	.id_table = tcpp_id,
+};
+module_i2c_driver(tcpp_driver);
+
+MODULE_DESCRIPTION("TCPP02/03 USB Type-C PD protection driver");
+MODULE_AUTHOR("Christian Bruel <christian.bruel@foss.st.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/typec/tcpm/st_tcpp.h b/drivers/usb/typec/tcpm/st_tcpp.h
new file mode 100644
index 000000000000..9284410af581
--- /dev/null
+++ b/drivers/usb/typec/tcpm/st_tcpp.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 STMicroelectronics
+ */
+
+#ifndef __ST_TCPP_H__
+#define __ST_TCPP_H__
+
+typedef void (*tcpp_vbus_cb_t)(void *data, bool vbus_present);
+
+int tcpp_init(struct device *tcpp);
+void tcpp_deinit(struct device *tcpp);
+int tcpp_get_vbus(struct device *tcpp);
+int tcpp_set_vbus(struct device *tcpp, bool on, bool charge);
+int tcpp_set_vconn(struct device *dev, bool on, enum typec_cc_polarity polarity);
+int tcpp_attach(struct device *tcpp);
+int tcpp_detach(struct device *tcpp);
+int tcpp_register_vbus_notifier(struct device *dev, tcpp_vbus_cb_t cb, void *data);
+void tcpp_unregister_vbus_notifier(struct device *dev);
+
+#endif

-- 
2.43.0

