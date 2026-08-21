Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128EF4CA29B;
	Fri, 21 Aug 2026 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329420; cv=fail; b=ZrW2BuYaPoYEfv7w219bHLnHncf0lLrJrFylYxGZPoLt/exqDDPLb9ucLnXEfndlcBBcMeUmSYY/LMtpC+vJVCGrPjvulmdazwXY4PH3li30O+8R2sR5A77sAzEy+fJ59psgnVb4T+z/r/P135HVwUz8zUuyLsmS011urA1sgs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329420; c=relaxed/simple;
	bh=wuEtphK4neb1r3my+cJ8QlNHL0MUM2HCdoH2yStWciE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rFnyVqaoqQRD1OoRhb0ATSoA6dXp000ni1IHziuxB3AgbSJqxkKE3Y5nCfodA2vZpCkLavJcdjN2nkQNB6dBsCuhAsaaWecC2thk+isL7vRB9YN23iuY5wCKWKO8iXKCTWsUWXR6psIsVM6MXpXzQvkraHC8LkwGVeQXgo+zIeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ailA5GaB; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ailA5GaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZ4UJJSf3Hi3ph+uUVqXs2dC/IARrBxCj+C8IV2QzwSzHzkxgNiXhEMUaCXBh1NcXeiwviRPy4bG9dUEnhK0LV8hTAD6W1a3y6EjFkMMkuw3sZsuMx297HRgH7aBgabWeST6KO8tySI3svyiZpn+FIoHsogjgM12pwmDNgQwX/1TBvO5f9YQ+2byWka38Utg0ucHpTWdJmrxjCrBAvPCAE9/zDjDM0xwRU+z854awC11uA1mLY2gwJDC75nLnT8rpsVBcznzUaK+Td/Fg8fTx7sV5Jr+TH+GNkZNmPn5monw1m5wQ5ZtxAAieES7C4N4c/+PMCOXx+KGo5qZyibb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJvF+ajMT5Rj8G8rE7i3yyhW6dDFZy1jd0sfOzELSPo=;
 b=DldFKDjwQmG4jrIvwo7gRtsiSTC8cOAkn6uLubAvnV6zI7Z9PLs3Mzg03nHXhJQ1DlsY3XwuU/qUCwaQ7F5pm9sy/c1qQezOBSI5VxYSvuTCqAV5JOBhHNqMQ2htDCYABfuhsJIzESkAZuelFFUz47a8mxYswjCcFtmjoSL5L7oV9ubvmhv9VPGDMko0aXCooBGH50lDdLZtbhIvQMd/qby2Lcx103Vasxc7wG6izbrGO8PH5k2gMJWyS9awMfEZtDY5jTHKAggf73Q1j0prAHlQfudJUHYIq1Ls/oPLc+KR2WdDmPU3UT8r5Sa8LWeb01PJNP+waSOYtDwQKIftlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJvF+ajMT5Rj8G8rE7i3yyhW6dDFZy1jd0sfOzELSPo=;
 b=ailA5GaBBxkw37l+JNjzrCaBYkJuu2l3hkenXT9z9rgSUCaY9HbGaVFj6En8KlSYMLFXoKyzmR34ulVZ6uGlLIsIoViGwq4Hp4PykV++YbdJ3zcYHY3IQjf49TSCUE8E39D2kJsGVSq3mbBBQVMfZhbnu0MUNX+gfHrh2W43NjvUrtTYYOY3zyx05auPkFp8lD4yjNhpdrfp7MWtFpy47e3cr6up6Epz2ZMEBJShmvXx3ukmnKCbCxTl+A25bROAz+7Ur3pLlCYd4VQ2qIu62g1WHOxrzLN9vXu9hYGd1tSuy3PmqTlhx/ZlffqK8Rh0KZa13Y+DZMCC03dFUKr8eg==
Received: from AS9PR05CA0218.eurprd05.prod.outlook.com (2603:10a6:20b:494::7)
 by PAVPR10MB7418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:300::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:23:30 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:20b:494:cafe::15) by AS9PR05CA0218.outlook.office365.com
 (2603:10a6:20b:494::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 16:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 16:23:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:28:29 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 18:23:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 18:23:17 +0200
Subject: [PATCH 06/16] usb: typec: add FUSB340 SuperSpeed switch driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ucpd-host-fusb340-v7-2-rfc-v1-6-c5e27cbc0795@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|PAVPR10MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 57437884-ec89-4457-c378-08deffa089b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|23010399003|36860700016|11063799006|56012099006|18002099003|10067099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	M35I/ykL8KA+qr1yOuwaDmwiqSQAfR2ibqedX+6UiuR0SU2pc9ir3dd41wmbxJtliCjJP0hzUuDa8ULQegCcGHCRza2YifejudHEAzlUbpQgH8VRk00KJWSKYMhaJ6e6lvEfSHxT6s2XTdshC1lKry9YBExAL5iy7QwX4lb6L2fsDrDjZL3Q69tBTjWaYixVUs0GhE5CedQA1PMA7S7lCN4S14PWC291yUHlQL+INK9EwFJ5RxJFtYdggN+dp7e40ZXyBo7VnlziyTRUugneVj+dgu2ygC2bQS3DbxBA6Czlbgy8Bqyjpeu5VqMpihMlv4ZdXQfGeuzng+2R/F6U5AjoLEW0WGlyuw2D1H23dlnBh6Dws/1m92KBlAkuMB0S1sA2G2GqNg0bB2J0+l4o72r4vytByejnm5Ril9RdhAnREBKIOGQv/ZFLvu828TYUwSghozQwENIg758CS4YGlyxDa/+GZY/VXd7KA/PgZ2olSDCAo6f+KFORhpUtYq6zK9kyNQXDkHO4MjmrW9NcQDoGicNdAtz6WgP6Jd1oyIW4wytROiQFS2clkvaKPXaNX2wK8jg3f2hzGdSz6lfZGR0HCddlJTa8QicZGbhI+k2PNl4aXqgHOef4Ve5vblu7oVLSHALx1rx2HPkzsBbdjODwZvoTh7dhvvUIa0xpU75scJzsW7wQ46R7RpW2/a7UQc+CvDPY+p4BGP03QkJ5VsAxJKqV2lEFLHQrD9/FNYcBDMpg6ja+UPCpVC2bLzXr
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(23010399003)(36860700016)(11063799006)(56012099006)(18002099003)(10067099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gHOwT3q/45BAcOYBt2tZPdtMClaSEJ/f66RSTFSZd2/Ve+XaZInRYYkKQvBCyIBpY8kSLWnWmw7CVnLMgYTmUXBoiCM3LpQ+y6JOpe2qwt2pYLYADx2fgmyr32AEbJNjviKJPCalg2Yo2wV3VMJ1gk+/BoLT0at0Kl/iS7isPA+KbvTslXDuhKNBuX4wcivmN+jDQ02YRd/VoNqijLN921oRB/MI13ogG9gml5+eNxTYHI+QpbuVNk+e0MYsQxugp0j0haRoqKLRYUOegchq7VIOsy50k+XpbreG4wxDZbk8xHY4E3Q2m2UXvogVKDMEnR1yps2IVrkpdb9Vua0og8v3++NceMVrMi2SlUpwKnyFrfycMxPr7p1Vl3NXOa+7yosW842Ig3mHJBzrRXHmF86JSjuLnXqf48JSL/fHFUsPQmwi/Qc4tvvBh0yFF3it
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:23:30.2162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57437884-ec89-4457-c378-08deffa089b4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7418

Add a platform driver for the ON Semiconductor FUSB340 SuperSpeed switch.
The driver uses enable-gpios and select-gpios to control the switch and
registers Type-C switch and mux providers for Type-C applications where a
reversible cable requires a switch.

Assisted-by: GitHub-Copilot:GPT-5.4-mini
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 drivers/usb/typec/mux/Kconfig   |   8 ++
 drivers/usb/typec/mux/Makefile  |   1 +
 drivers/usb/typec/mux/fusb340.c | 169 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 6dd8f961b593..6a1da48a2a8f 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -12,6 +12,14 @@ config TYPEC_MUX_FSA4480
 	  common USB Type-C connector.
 	  If compiled as a module, the module will be named fsa4480.
 
+config TYPEC_MUX_FUSB340
+	tristate "ON Semi FUSB340 SuperSpeed switch driver"
+	help
+	  Driver for the ON Semiconductor FUSB340 SuperSpeed switch, which
+	  provides support for routing SuperSpeed pairs in Type-C applications
+	  where a reversible cable requires a switch.
+	  If compiled as a module, the module will be named fusb340.
+
 config TYPEC_MUX_GPIO_SBU
 	tristate "Generic GPIO based SBU mux for USB Type-C applications"
 	help
diff --git a/drivers/usb/typec/mux/Makefile b/drivers/usb/typec/mux/Makefile
index b4f599eb5053..ef8d2b05ff7f 100644
--- a/drivers/usb/typec/mux/Makefile
+++ b/drivers/usb/typec/mux/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_TYPEC_MUX_FSA4480)		+= fsa4480.o
+obj-$(CONFIG_TYPEC_MUX_FUSB340)		+= fusb340.o
 obj-$(CONFIG_TYPEC_MUX_GPIO_SBU)	+= gpio-sbu-mux.o
 obj-$(CONFIG_TYPEC_MUX_PI3USB30532)	+= pi3usb30532.o
 obj-$(CONFIG_TYPEC_MUX_INTEL_PMC)	+= intel_pmc_mux.o
diff --git a/drivers/usb/typec/mux/fusb340.c b/drivers/usb/typec/mux/fusb340.c
new file mode 100644
index 000000000000..0f0e45743784
--- /dev/null
+++ b/drivers/usb/typec/mux/fusb340.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ON Semiconductor FUSB340 SuperSpeed switch driver
+ *
+ * Copyright (C) 2026 STMicroelectronics
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_mux.h>
+
+struct fusb340 {
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *select_gpio;
+	struct mutex lock; /* serialize orientation and mode updates */
+	struct typec_switch_dev *sw;
+	struct typec_mux_dev *mux;
+	enum typec_orientation orientation;
+	unsigned long mode;
+};
+
+static void fusb340_update_locked(struct fusb340 *fusb)
+{
+	bool enable = fusb->mode == TYPEC_STATE_USB &&
+		      fusb->orientation != TYPEC_ORIENTATION_NONE;
+	bool select = fusb->orientation == TYPEC_ORIENTATION_REVERSE;
+
+	gpiod_set_value_cansleep(fusb->enable_gpio, enable);
+	gpiod_set_value_cansleep(fusb->select_gpio, select);
+}
+
+static int fusb340_switch_set(struct typec_switch_dev *sw,
+			      enum typec_orientation orientation)
+{
+	struct fusb340 *fusb = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&fusb->lock);
+
+	if (fusb->orientation != orientation) {
+		fusb->orientation = orientation;
+		fusb340_update_locked(fusb);
+	}
+
+	mutex_unlock(&fusb->lock);
+
+	return 0;
+}
+
+static int fusb340_mux_set(struct typec_mux_dev *mux,
+			   struct typec_mux_state *state)
+{
+	struct fusb340 *fusb = typec_mux_get_drvdata(mux);
+	int ret = 0;
+
+	mutex_lock(&fusb->lock);
+
+	if (state->mode != TYPEC_STATE_SAFE && state->mode != TYPEC_STATE_USB) {
+		ret = -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
+	if (fusb->mode != state->mode) {
+		fusb->mode = state->mode;
+		fusb340_update_locked(fusb);
+	}
+
+out_unlock:
+	mutex_unlock(&fusb->lock);
+
+	return ret;
+}
+
+static int fusb340_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct typec_switch_desc sw_desc = { };
+	struct typec_mux_desc mux_desc = { };
+	struct fusb340 *fusb;
+	int ret;
+
+	fusb = devm_kzalloc(dev, sizeof(*fusb), GFP_KERNEL);
+	if (!fusb)
+		return -ENOMEM;
+
+	fusb->orientation = TYPEC_ORIENTATION_NONE;
+	fusb->mode = TYPEC_STATE_SAFE;
+
+	fusb->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(fusb->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(fusb->enable_gpio),
+				     "failed to get enable gpio\n");
+
+	fusb->select_gpio = devm_gpiod_get(dev, "select", GPIOD_OUT_LOW);
+	if (IS_ERR(fusb->select_gpio))
+		return dev_err_probe(dev, PTR_ERR(fusb->select_gpio),
+				     "failed to get select gpio\n");
+
+	mutex_init(&fusb->lock);
+
+	sw_desc.drvdata = fusb;
+	sw_desc.fwnode = dev_fwnode(dev);
+	sw_desc.set = fusb340_switch_set;
+
+	fusb->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(fusb->sw)) {
+		ret = dev_err_probe(dev, PTR_ERR(fusb->sw),
+				    "failed to register typec switch\n");
+		goto err_mutex_destroy;
+	}
+
+	mux_desc.drvdata = fusb;
+	mux_desc.fwnode = dev_fwnode(dev);
+	mux_desc.set = fusb340_mux_set;
+
+	fusb->mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(fusb->mux)) {
+		ret = dev_err_probe(dev, PTR_ERR(fusb->mux),
+				    "failed to register typec mux\n");
+		goto err_unregister_switch;
+	}
+
+	platform_set_drvdata(pdev, fusb);
+
+	return 0;
+
+err_unregister_switch:
+	typec_switch_unregister(fusb->sw);
+err_mutex_destroy:
+	mutex_destroy(&fusb->lock);
+	return ret;
+}
+
+static void fusb340_remove(struct platform_device *pdev)
+{
+	struct fusb340 *fusb = platform_get_drvdata(pdev);
+
+	gpiod_set_value_cansleep(fusb->enable_gpio, 0);
+	gpiod_set_value_cansleep(fusb->select_gpio, 0);
+
+	typec_mux_unregister(fusb->mux);
+	typec_switch_unregister(fusb->sw);
+	mutex_destroy(&fusb->lock);
+}
+
+static const struct of_device_id fusb340_of_match[] = {
+	{ .compatible = "onnn,fusb340" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, fusb340_of_match);
+
+static struct platform_driver fusb340_driver = {
+	.probe = fusb340_probe,
+	.remove = fusb340_remove,
+	.driver = {
+		.name = "fusb340",
+		.of_match_table = fusb340_of_match,
+	},
+};
+module_platform_driver(fusb340_driver);
+
+MODULE_DESCRIPTION("ON Semiconductor FUSB340 SuperSpeed switch driver");
+MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@foss.st.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

