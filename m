Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795409903;
	b=nV/aJauGfTQiBENGj5grSt7/NHGgxBoxOLTM4a6Mfx8QjBQHsf6tBlX3BZ7+ZUJznRqy
	 DXjFpsImhCzfsR4X4/SevPc6RbLKPYQuVmm1DFSgeF4UFCbgqB425fzZ/kb6D0wvLjU0s
	 FzezM2IrNB6vNCKfjNOxNZdWWb3ZBueZ/1gBG9XRmP9fGXFA/5b5bpFRlSSZ+NWuGIXLP
	 7Bu/4ijjN0ee43eQtOEIJ6Xe6S3hBYFvAWBWvmJ3XSXzT7CLBrqZEcsQleUFCIIwwEwm3
	 DfR/KLSdVtptoLicZras0C60lJ5v/9isvhxscMmX5Rx8C2xAqOE4kxcB6NLbb0Qj2Pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409903;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=tFEVyeODVoSeDl6Te3aDmdw8tn+/6tCKl1+kIs/zVGk=;
	b=FgcG23+zyAptmdUpHCqEpR52ixGlPbjnmPj4y/59Qeh+hHTfQL+GA3EpmFjS232gL88X
	 6dKFeNLFshPffmG+N4TneHJewk6clb7mNw2/MuGDWbJ3XwGh/SBL4yI86wkbCSaT95S6y
	 1F7+9lij04H8nYJaD5IHzw+X2tD9VpDSQ/CIEojG5sSq2yzX1hl1covsIu2CmLq2YTi1/
	 SulgIuFMprHFamTRp7ocpGAtcnOSzlA1WlYRVRW4DQNP2D6+uKJp/Ic3/tRHORO5q18n2
	 gAdGXYFhELBUtHsYfJTBCnBrYoPhx4ZwwJN4J+96+q6ZcJYmXysgU6WZy9nYmGfAYNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.132
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023132.outbound.protection.outlook.com [40.107.44.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCD4606A320;
	Mon, 23 Nov 2026 04:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BCD4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLJ4Ph6rbi1F2oCzwgjVXgkKyWSnCpob5CvZRxx492FLUDqqB05ER0Zgq0qRexs10geTVnGm6WgGbdvCuSRSoAaSYa25XrdjsFLLa0IaJJBMqiKOrXETEm+r43gmeamWk2t6eKCJpj30CtckMwQ934vKZQv+ykNIcZwtRMEwY1Pc8jiWnJWs1zVefHsxXT8M1DW2sG722Fp04019lqkNDfy5obRMOnD+WRg1iOrDRE/XRbxnpKD7j05Gpa3u1yJy+s6H9E5w0Fz7vBMcrFXpd6w9IYONkGpZnqMO5APVi2Vg+viFAIcosNn+n29uUm/isO94/HA65VRRnQaU3/R2iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFEVyeODVoSeDl6Te3aDmdw8tn+/6tCKl1+kIs/zVGk=;
 b=ONpDjL3jQpnWwUEpO8TKA+YolSJY0dOnlXo2CXBrDgIWd+rOpQhT5OWAYs//hg0wsUMz4+eUjaCKBZEMAzJAqwNJyDEoi3cDMvAeJsM/6SvVDsVfm2Bb6XzkLnGcvjoNTkje5YC/SLI7j2n2c2bHKE1tcJgCRGmxLBhIAWSDZ94gTPs3Ow+Ie47krBlJSDlBe1DI4nxR3tG4eI3vcK/Pz9Ddx0IDOv8ckUvucQrkDVHUEnUcGD+mLPUDBuq2vZjT/3fVsSDKiv4jkbXY6i1tWTr7mRYte0J4VIiYwjJqnjpa5R5pmJwEcjYIu1yrpN4k3dFR4C+s6mOIVISAANZiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) by SEYPR06MB8309.apcprd06.prod.outlook.com
 (2603:1096:101:301::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 04:58:18 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::77) by SI2PR01CA0041.outlook.office365.com
 (2603:1096:4:193::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 04:58:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 04:58:16 +0000
Received: from gary-System-Product-Name (unknown [172.16.66.27])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EE76440920E1;
	Mon, 23 Nov 2026 12:58:15 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v7 2/2] usb: typec: add CIX Type-C PD controller driver
Date: Mon, 23 Nov 2026 12:58:15 +0800
Message-ID: <20261123045815.812561-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261123045815.812561-1-gary.yang@cixtech.com>
References: <20261123045815.812561-1-gary.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEYPR06MB8309:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 43e9ee80-a163-48ee-0c24-08df491e6343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|18002099003|22082099003|18092099006|6133799003|261009223027099003|3023799007|5023799004|56012099006|261102123227099003|261026121527099003|261026135527099003|261028144727099003|261022115727099003|261022075727099003|261022105027099003|261022113327099003|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261026130827099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8B4krRid8AwTh9ywhJCKthd1p5r0oP1KVs/blJI57nRenHa+R8k9Ml4Wu53t760o2HXMQ9qz750tyzGAMTKQvGVQ6rZZpYjDAM+jChETroguK5yCbtmreXUU6WHGtuCAihMSIspUP6rOyzPplYeug/UcTJCO2u46xS1cezO6O2igNAthy6t7daHpuI3Jd6b8wr/eXQgHk8yHI2szFHWcl9l/VyY9/IMlfdzWMXpxPPwSOPcZrOR7ZGPQ1vO34i7Gl/gMT6YrL9k0GGRkTmGL4ex+5+W3zblk1obvTVmPZfeGTuhbqiPk0lvJNRglOiFF/3QnlcghnvNKai2Ek8BTFNb/HMrlJcd4RBR5KiBcjM9GKYRh9dwXqXBij0XrvmwwvUAHDGkAHku/8WgZN/5LBjzwBbEG32yn2Ocg243pzYsxNS2z9zRffRIbC/iAYN1JWRT8BREcZwDKpfEYLkQqrDz6y1zNh4nBkohFVZfwFykfEXZ3LeP5LSnZqLJ4RqRFrp0t3bud/N9jXLpWVEZ9Dj1O10D8XZnlWDsV9dwaPPEn3eNKaqfT6dezvKbIK9b2WBdl701PuIVmKWwGp8b/tKubgTmXtLSPuYTGjKOSc4GupkXzo86lcwZUyZ/ZtPkrN/IJ5jTA1pIeNpeAnLdycUK1gj5Lb3JYh/0AvH2Xl/7a3CVmmpW/TwoCp2MVwN3f
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(18092099006)(6133799003)(261009223027099003)(3023799007)(5023799004)(56012099006)(261102123227099003)(261026121527099003)(261026135527099003)(261028144727099003)(261022115727099003)(261022075727099003)(261022105027099003)(261022113327099003)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261026130827099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MaAqbei+enw04s9t9Mqhb39ENytvIzjKeX0MdTIrONNPNvOl+ZQGvYPwoNDeJPeeqUg2KnFZWiV9hvXrkEkMQv77UuaCob3NgVlDwqW80NEMuIzFXZSZXMqu9H68l2eIqcsIB0QbxGXRxXiBe1X4ROTLGwO/HVT1FksrJdLtg4W0BkitAnTElIwcKuH7Nmjkj8ZdVfOihrifjH1CV/9cklqu15KAdLP//xuiXTXcnB4eWSPOHe3PY9vdvO5Pr1Lv1lL44ElNv7FMuD3oeoPItJ/mfXB/MY44fSLLbdtggsbOWbNPFWmOvKPdtC1Fo2iGpaXbSQWVFYfIc4K272NlJbRcInAYMSeWFQ/LK2Rm7H+gUvsaaXC4+MQljKTODAjSoSaZWN08MJ4RAoJYeBV4QsWVPgJ5PgwG1WwmPE0aXgGYhm2PDOnqzPL6lURafzXT
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 04:58:16.8737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e9ee80-a163-48ee-0c24-08df491e6343
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8309

Add a Type-C PD controller driver for CIX platforms. The Realtek
RTS5453H is the first supported device.

The controller runs the Type-C and PD state machines in its firmware.
The register addresses are agreed between CIX and the controller vendor
and are configured into that firmware, so the host interface is not
specific to the RTS5453H: further register-compatible controllers can be
supported by the same driver, each with its own compatible string. The
host reads the decoded port status from the data status register (0x5F)
and acknowledges port and HPD events through the data control register
(0x50). The driver translates that into Type-C class notifications and
drives the platform PHY's orientation switch and mode mux for the
DisplayPort alternate mode, and the platform USB role switch for the
negotiated data role.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 MAINTAINERS                |   7 +
 drivers/usb/typec/Kconfig  |  13 +
 drivers/usb/typec/Makefile |   1 +
 drivers/usb/typec/cix_pd.c | 766 +++++++++++++++++++++++++++++++++++++
 4 files changed, 787 insertions(+)
 create mode 100644 drivers/usb/typec/cix_pd.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..bd99313bf91d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6522,6 +6522,13 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX USB TYPE-C PD CONTROLLER
+M:	Gary Yang <gary.yang@cixtech.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
+F:	drivers/usb/typec/cix_pd.c
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 2f80c2792dbd..4d62f5deeeba 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -110,6 +110,19 @@ config TYPEC_WUSB3801
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called wusb3801.ko.
 
+config TYPEC_CIX_PD
+	tristate "CIX Type-C PD controller driver"
+	depends on I2C
+	depends on USB_ROLE_SWITCH
+	depends on ARCH_CIX || COMPILE_TEST
+	select REGMAP_I2C
+	help
+	  Say Y or M here if your system has a CIX Type-C PD controller.
+	  This driver currently supports the Realtek RTS5453H controller.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called cix_pd.ko.
+
 source "drivers/usb/typec/mux/Kconfig"
 
 source "drivers/usb/typec/altmodes/Kconfig"
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 8a6a1c663eb6..bb3f3139fd7e 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
 obj-$(CONFIG_TYPEC_RT1719)	+= rt1719.o
 obj-$(CONFIG_TYPEC_WUSB3801)	+= wusb3801.o
+obj-$(CONFIG_TYPEC_CIX_PD)	+= cix_pd.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/cix_pd.c b/drivers/usb/typec/cix_pd.c
new file mode 100644
index 000000000000..c366a201631f
--- /dev/null
+++ b/drivers/usb/typec/cix_pd.c
@@ -0,0 +1,766 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ * Driver for the CIX Type-C PD controller.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+#include <linux/usb/role.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+
+#define RTS_DATA_CONTROL			0x50
+#define I2C_INT_ACK_BIT				BIT(2)
+#define HPD_IRQ_ACK				BIT(5)
+#define RTS_DATA_STATUS				0x5F
+/* byte 1 */
+#define CONNECTION_ORIENTATION			BIT(1)
+#define USB2_CONNECTION				BIT(4)
+#define USB3_2_CONNECTION			BIT(5)
+#define USB_DATA_ROLE				BIT(7)
+/* byte 2 */
+#define DP_CONNECTION				BIT(0)
+#define DP_SOURCE_SINK				BIT(1)
+#define DEBUG_ACCESSORY_ATTACHED		BIT(4)
+#define HPD_IRQ					BIT(6)
+#define HPD_STATE				BIT(7)
+/* byte 3 */
+#define POWER_SOURCE				BIT(0)
+#define POWER_SINK				BIT(1)
+#define POWER_MASK				3
+
+#define DATA_STATUS_COUNT			6
+
+struct cix_pd {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock; /* device lock */
+	int id;
+	u8 data_status[DATA_STATUS_COUNT];
+	u8 prev_status[DATA_STATUS_COUNT];
+	bool status_valid;
+	struct typec_displayport_data dp_data;
+	struct typec_mux_state state;
+	struct typec_capability caps;
+	struct typec_mux *mux;
+	struct usb_role_switch *role_sw;
+	struct typec_altmode *port_altmode;
+	struct typec_altmode *partner_altmode;
+	struct typec_port *port;
+	enum usb_role role;
+	enum typec_orientation orientation;
+	unsigned long mode;
+	u32 hpd_status;
+	struct typec_partner	*partner;
+	struct typec_partner_desc desc;
+};
+
+static int cix_pd_block_read(struct cix_pd *rts, u8 reg, void *val, size_t len)
+{
+	return regmap_bulk_read(rts->regmap, reg, val, len);
+}
+
+static int cix_pd_block_write(struct cix_pd *rts, u8 reg,
+			      const void *val, size_t len)
+{
+	return regmap_bulk_write(rts->regmap, reg, val, len);
+}
+
+static const struct regmap_config cix_pd_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x7F,
+};
+
+static const char *const dp_only_mode = "Alt Mode:DP";
+static const char *const dp_usb_mode = "Alt Mode:DP + USB";
+static const char *const usb_mode = "Alt Mode:USB";
+
+static const char *const power_source = "power source";
+static const char *const power_sink = "power sink";
+
+static const char *const orientation_normal = "orientation normal";
+static const char *const orientation_reverse = "orientation reverse";
+
+static const char *const data_host = "usb host";
+static const char *const data_device = "usb device";
+
+static const char *cix_pd_pwr_role_str(const struct cix_pd *rts)
+{
+	switch (rts->data_status[3] & POWER_MASK) {
+	case POWER_SOURCE:
+		return power_source;
+	case POWER_SINK:
+		return power_sink;
+	default:
+		return "unknown";
+	}
+}
+
+/*
+ * The controller negotiates the DisplayPort alternate mode autonomously,
+ * so the capabilities below describe the fixed set supported by the
+ * platform DP output: a receptacle exposing DFP_D with pin assignments
+ * C, D and E.
+ */
+#define CIX_PD_DP_PIN_ASSIGN	(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D) | \
+				 BIT(DP_PIN_ASSIGN_E))
+
+static const struct typec_altmode_desc cix_pd_dp_port_altmode = {
+	.svid = USB_TYPEC_DP_SID,
+	.mode = USB_TYPEC_DP_MODE,
+	.vdo = DP_CAP_DFP_D | DP_CAP_RECEPTACLE |
+	       (CIX_PD_DP_PIN_ASSIGN << 8),
+};
+
+static const struct typec_altmode_desc cix_pd_dp_partner_altmode = {
+	.svid = USB_TYPEC_DP_SID,
+	.mode = USB_TYPEC_DP_MODE,
+	.vdo = DP_CAP_UFP_D | DP_CAP_RECEPTACLE |
+	       (CIX_PD_DP_PIN_ASSIGN << 16),
+	.mode_selection = true,
+};
+
+/*
+ * typec_altmode_update_active() takes a reference to the alternate mode
+ * driver's module when the mode is activated and drops it when the mode is
+ * deactivated, but only while a driver is bound. Report the mode as active
+ * only after a driver has bound: activating it earlier would make the later
+ * deactivation drop a reference that was never taken. The port state, which
+ * is what drives the DisplayPort output on this platform, is programmed
+ * through the mux regardless.
+ *
+ * The mode device lock keeps the check consistent with driver binding and
+ * with typec_remove(), which reports the mode inactive when a driver
+ * unbinds.
+ */
+static void cix_pd_altmode_set_active(struct cix_pd *typec, bool active)
+{
+	struct typec_altmode *alt = typec->partner_altmode;
+	struct device *alt_dev;
+
+	if (!alt)
+		return;
+
+	alt_dev = &alt->dev;
+	device_lock(alt_dev);
+	if (!active || device_is_bound(alt_dev))
+		typec_altmode_update_active(alt, active);
+	device_unlock(alt_dev);
+}
+
+static int cix_pd_typec_port_update(struct cix_pd *typec, bool force)
+{
+	struct typec_displayport_data *dp_data = &typec->dp_data;
+	enum typec_orientation orientation;
+	enum usb_role role;
+	bool usb2, usb3, dp, connected, dev_role;
+	int ret, err;
+
+	usb2 = typec->data_status[1] & USB2_CONNECTION;
+	usb3 = typec->data_status[1] & USB3_2_CONNECTION;
+	dp = typec->data_status[2] & DP_CONNECTION;
+
+	/*
+	 * Debug accessories are not supported, so they are reported as
+	 * disconnected instead of being passed on to the framework.
+	 */
+	if (typec->data_status[2] & DEBUG_ACCESSORY_ATTACHED) {
+		dev_err(typec->dev,
+			"debug accessory mode not supported, try another usb cable\n");
+		connected = false;
+	} else {
+		connected = usb2 || usb3 || dp;
+	}
+
+	if (!connected)
+		orientation = TYPEC_ORIENTATION_NONE;
+	else if (typec->data_status[1] & CONNECTION_ORIENTATION)
+		orientation = TYPEC_ORIENTATION_REVERSE;
+	else
+		orientation = TYPEC_ORIENTATION_NORMAL;
+
+	/*
+	 * The controller keeps reporting the same orientation when a sibling
+	 * port raises the shared interrupt, and the Type-C class emits an
+	 * event for every call, so the switch is only programmed again when
+	 * the orientation changed or after system resume.
+	 */
+	if (force || typec->orientation != orientation) {
+		ret = typec_set_orientation(typec->port, orientation);
+		if (ret)
+			return ret;
+		typec->orientation = orientation;
+	}
+
+	/*
+	 * The controller reports the data role whenever a cable is attached,
+	 * including DisplayPort-only configurations where no USB data role is
+	 * available. Keep the port's data role in sync independently of the
+	 * USB role switch.
+	 */
+	dev_role = typec->data_status[1] & USB_DATA_ROLE;
+	if (connected)
+		typec_set_data_role(typec->port,
+				    dev_role ? TYPEC_DEVICE : TYPEC_HOST);
+
+	if (!connected || !(usb2 || usb3))
+		role = USB_ROLE_NONE;
+	else if (dev_role)
+		role = USB_ROLE_DEVICE;
+	else
+		role = USB_ROLE_HOST;
+
+	if (force || typec->role != role) {
+		err = 0;
+		if (typec->role_sw) {
+			err = usb_role_switch_set_role(typec->role_sw, role);
+			if (err)
+				dev_err(typec->dev,
+					"typec port(%d): failed to set USB role: %d\n",
+					typec->id, err);
+		}
+
+		/* Only cache the role once the switch accepted it. */
+		if (!err)
+			typec->role = role;
+	}
+
+	if ((typec->data_status[3] & POWER_MASK) == POWER_SOURCE) {
+		typec_set_pwr_role(typec->port, TYPEC_SOURCE);
+	} else if ((typec->data_status[3] & POWER_MASK) == POWER_SINK) {
+		typec_set_pwr_role(typec->port, TYPEC_SINK);
+	} else {
+		dev_dbg(typec->dev, "typec port(%d): unknown power state %d\n",
+			typec->id, typec->data_status[3]);
+	}
+
+	if (!connected) {
+		if (typec->partner_altmode) {
+			cix_pd_altmode_set_active(typec, false);
+			typec_unregister_altmode(typec->partner_altmode);
+			typec->partner_altmode = NULL;
+		}
+		if (typec->partner) {
+			typec_unregister_partner(typec->partner);
+			typec->partner = NULL;
+		}
+	} else {
+		if (!typec->partner) {
+			typec->partner = typec_register_partner(typec->port,
+								&typec->desc);
+			if (IS_ERR(typec->partner)) {
+				dev_err(typec->dev,
+					"typec port(%d): failed to register partner: %ld\n",
+					typec->id, PTR_ERR(typec->partner));
+				typec->partner = NULL;
+			}
+		}
+
+		if (typec->partner_altmode && !dp) {
+			cix_pd_altmode_set_active(typec, false);
+			typec_unregister_altmode(typec->partner_altmode);
+			typec->partner_altmode = NULL;
+		}
+
+		if (typec->partner && dp && !typec->partner_altmode) {
+			typec->partner_altmode =
+				typec_partner_register_altmode(typec->partner,
+							       &cix_pd_dp_partner_altmode);
+			if (IS_ERR(typec->partner_altmode)) {
+				dev_err(typec->dev,
+					"typec port(%d): failed to register DP altmode: %ld\n",
+					typec->id,
+					PTR_ERR(typec->partner_altmode));
+				typec->partner_altmode = NULL;
+			}
+		}
+
+		if (typec->partner_altmode)
+			cix_pd_altmode_set_active(typec, true);
+	}
+
+	dp_data->status = 0;
+	typec->state.data = NULL;
+	typec->state.alt = NULL;
+
+	/*
+	 * Only pass a DisplayPort state to the mux when the partner's
+	 * alternate mode was registered successfully.
+	 */
+	if (connected && dp && typec->partner_altmode) {
+		dp_data->status = DP_STATUS_ENABLED;
+		if (typec->data_status[2] & HPD_STATE)
+			dp_data->status |= DP_STATUS_HPD_STATE;
+		if (typec->data_status[2] & HPD_IRQ)
+			dp_data->status |= DP_STATUS_IRQ_HPD;
+
+		typec->state.data = dp_data;
+		typec->state.alt = typec->port_altmode;
+		typec->state.mode = usb3 ? TYPEC_DP_STATE_D :
+					   TYPEC_DP_STATE_E;
+	} else if (connected && (usb2 || usb3)) {
+		typec->state.mode = TYPEC_STATE_USB;
+	} else {
+		typec->state.mode = TYPEC_STATE_SAFE;
+	}
+
+	ret = typec_mux_set(typec->mux, &typec->state);
+	if (ret)
+		return ret;
+
+	if (typec->mode == typec->state.mode &&
+	    typec->hpd_status == dp_data->status)
+		return 0;
+
+	if (typec->state.mode == TYPEC_DP_STATE_D)
+		dev_dbg(typec->dev,
+			"typec port(%d): alt mode(%s) orientation(%s), usb_data_role(%s), power role(%s), hpd_state(%d)\n",
+			typec->id, dp_usb_mode,
+			orientation == TYPEC_ORIENTATION_REVERSE ?
+			orientation_reverse : orientation_normal,
+			role == USB_ROLE_DEVICE ? data_device : data_host,
+			cix_pd_pwr_role_str(typec),
+			(int)(dp_data->status & DP_STATUS_HPD_STATE));
+	else if (typec->state.mode == TYPEC_DP_STATE_E)
+		dev_dbg(typec->dev,
+			"typec port(%d): alt mode(%s) orientation(%s), power role(%s), hpd_state(%d)\n",
+			typec->id, dp_only_mode,
+			orientation == TYPEC_ORIENTATION_REVERSE ?
+			orientation_reverse : orientation_normal,
+			cix_pd_pwr_role_str(typec),
+			(int)(dp_data->status & DP_STATUS_HPD_STATE));
+	else if (typec->state.mode == TYPEC_STATE_USB)
+		dev_dbg(typec->dev,
+			"typec port(%d): alt mode(%s) orientation(%s), power role(%s), usb_data_role(%s)\n",
+			typec->id, usb_mode,
+			orientation == TYPEC_ORIENTATION_REVERSE ?
+			orientation_reverse : orientation_normal,
+			cix_pd_pwr_role_str(typec),
+			role == USB_ROLE_DEVICE ? data_device : data_host);
+	else if (typec->state.mode == TYPEC_STATE_SAFE)
+		dev_dbg(typec->dev, "typec port(%d): disconnect state\n",
+			typec->id);
+
+	typec->mode = typec->state.mode;
+	typec->hpd_status = dp_data->status;
+
+	return 0;
+}
+
+static void cix_pd_typec_init_state(struct cix_pd *typec)
+{
+	typec->state.alt = NULL;
+	typec->state.mode = TYPEC_STATE_SAFE;
+	typec->state.data = NULL;
+	typec->partner = NULL;
+	typec->desc.accessory = TYPEC_ACCESSORY_NONE;
+	/*
+	 * The data status registers only report the source/sink state, not
+	 * whether USB PD is being used, so the partner is not advertised as
+	 * PD capable.
+	 */
+	typec->desc.usb_pd = 0;
+}
+
+/*
+ * Returns 1 when the reported port state changed or an HPD interrupt was
+ * handled, 0 when there was nothing to report, and a negative error code when
+ * the controller could not be accessed.
+ */
+static int cix_pd_event_handler(struct cix_pd *rts, bool clear_irq, bool force)
+{
+	int ret, err = 0;
+	bool hpd_irq, changed;
+	u8 data_control[3] = {0};
+
+	guard(mutex)(&rts->lock);
+
+	if (clear_irq) {
+		data_control[0] = 2;
+		data_control[1] = I2C_INT_ACK_BIT;
+		data_control[2] = 0;
+
+		ret = cix_pd_block_write(rts, RTS_DATA_CONTROL, data_control, 3);
+		if (ret)
+			goto i2c_err;
+	}
+
+	ret = cix_pd_block_read(rts, RTS_DATA_STATUS, rts->data_status, 6);
+	if (ret)
+		goto i2c_err;
+
+	dev_dbg(rts->dev,
+		"typec port(%d): data status = 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
+		rts->id, rts->data_status[0], rts->data_status[1],
+		rts->data_status[2], rts->data_status[3], rts->data_status[4],
+		rts->data_status[5]);
+
+	hpd_irq = rts->data_status[2] & HPD_IRQ;
+
+	/*
+	 * HPD_IRQ is an event bit which stays set until it is acknowledged
+	 * below, so it is excluded from the comparison: the acknowledged
+	 * status would otherwise look different on the next read. Byte 0 and
+	 * bytes 4..5 are not decoded, so a change in them is not a port
+	 * event either.
+	 */
+	changed = !rts->status_valid ||
+		  rts->data_status[1] != rts->prev_status[1] ||
+		  (rts->data_status[2] & ~HPD_IRQ) !=
+		  (rts->prev_status[2] & ~HPD_IRQ) ||
+		  rts->data_status[3] != rts->prev_status[3];
+
+	memcpy(rts->prev_status, rts->data_status, DATA_STATUS_COUNT);
+	rts->status_valid = true;
+
+	/*
+	 * Reprogram the port only when one of the decoded bits changed, when
+	 * an HPD interrupt arrived, or when the caller forces a refresh after
+	 * system resume. The ports share one interrupt line, so a sibling's
+	 * interrupt must not re-report an unchanged orientation and power
+	 * role to the Type-C class.
+	 */
+	if (changed || hpd_irq || force) {
+		err = cix_pd_typec_port_update(rts, force);
+		if (err) {
+			/*
+			 * Invalidate the cached status so that the update is
+			 * retried on the next interrupt or on system resume
+			 * instead of being lost with the acknowledged event.
+			 */
+			rts->status_valid = false;
+			dev_err(rts->dev,
+				"typec port(%d): failed to update port: %d\n",
+				rts->id, err);
+		}
+	}
+
+	if (hpd_irq) {
+		data_control[0] = 2;
+		data_control[1] = 0;
+		data_control[2] = HPD_IRQ_ACK;
+		ret = cix_pd_block_write(rts, RTS_DATA_CONTROL, data_control, 3);
+		if (ret)
+			goto i2c_err;
+	}
+
+	return (changed || hpd_irq) ? 1 : 0;
+
+i2c_err:
+	dev_err(rts->dev, "typec port(%d): i2c transfer error = %d\n",
+		rts->id, ret);
+	return ret;
+}
+
+static int cix_pd_typec_parse_port_props(struct typec_capability *cap,
+					 struct fwnode_handle *fwnode,
+					 struct device *dev)
+{
+	int ret;
+
+	memset(cap, 0, sizeof(*cap));
+	ret = typec_get_fw_cap(cap, fwnode);
+	if (ret) {
+		/*
+		 * typec_get_fw_cap() stores a borrowed reference without
+		 * taking it, so it must not be dropped by the caller.
+		 */
+		cap->fwnode = NULL;
+		return dev_err_probe(dev, ret,
+				     "failed to parse connector properties\n");
+	}
+
+	cap->fwnode = fwnode_handle_get(fwnode);
+	cap->orientation_aware = true;
+	/* Alternate modes are entered and exited by the controller firmware. */
+	cap->no_mode_control = true;
+
+	return 0;
+}
+
+static int cix_pd_typec_get_handles(struct cix_pd *typec,
+				    struct fwnode_handle *fwnode,
+				    struct device *dev)
+{
+	int ret;
+
+	typec->mux = fwnode_typec_mux_get(fwnode);
+	if (IS_ERR(typec->mux))
+		return dev_err_probe(dev, PTR_ERR(typec->mux),
+				     "failed to get mux\n");
+
+	typec->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(typec->role_sw)) {
+		ret = PTR_ERR(typec->role_sw);
+		typec->role_sw = NULL;
+		typec_mux_put(typec->mux);
+		typec->mux = NULL;
+		return dev_err_probe(dev, ret,
+				     "failed to get USB role switch\n");
+	}
+
+	if (!typec->mux)
+		dev_dbg(dev, "mux not found\n");
+
+	return 0;
+}
+
+static void cix_pd_unregister_ports(struct cix_pd *typec)
+{
+	if (!IS_ERR_OR_NULL(typec->port)) {
+		typec->state.alt = NULL;
+		typec->state.mode = TYPEC_STATE_SAFE;
+		typec->state.data = NULL;
+		usb_role_switch_set_role(typec->role_sw, USB_ROLE_NONE);
+		typec_set_orientation(typec->port, TYPEC_ORIENTATION_NONE);
+		typec_mux_set(typec->mux, &typec->state);
+
+		if (typec->partner_altmode)
+			cix_pd_altmode_set_active(typec, false);
+		typec_unregister_altmode(typec->partner_altmode);
+		typec->partner_altmode = NULL;
+		typec_unregister_partner(typec->partner);
+		typec->partner = NULL;
+		typec_unregister_altmode(typec->port_altmode);
+		typec->port_altmode = NULL;
+
+		typec_unregister_port(typec->port);
+		typec->port = NULL;
+	}
+
+	usb_role_switch_put(typec->role_sw);
+	typec->role_sw = NULL;
+	typec_mux_put(typec->mux);
+	typec->mux = NULL;
+	fwnode_handle_put(typec->caps.fwnode);
+	typec->caps.fwnode = NULL;
+}
+
+static irqreturn_t cix_pd_irq_handle(int irq, void *data)
+{
+	struct cix_pd *rts = data;
+	int ret;
+
+	/*
+	 * The Type-C ports of this platform are wired to one shared,
+	 * level-triggered interrupt line and the controller has no
+	 * per-instance pending bit, so the interrupt is attributed by
+	 * comparing the port status with the previously reported one. The
+	 * controller interrupt is acknowledged in any case, but an unchanged
+	 * status is reported as IRQ_NONE: if a sibling keeps the shared line
+	 * asserted without ever clearing its interrupt, the spurious
+	 * interrupt detector can then eventually disable the line instead of
+	 * leaving the system in an interrupt storm.
+	 */
+	ret = cix_pd_event_handler(rts, true, false);
+	return ret > 0 ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static int cix_pd_init_ports(struct cix_pd *typec)
+{
+	struct device *dev = typec->dev;
+	struct typec_altmode_desc desc = cix_pd_dp_port_altmode;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = device_get_named_child_node(dev, "connector");
+	if (!fwnode)
+		return dev_err_probe(dev, -ENODEV, "no connector node found\n");
+
+	ret = cix_pd_typec_get_handles(typec, fwnode, dev);
+	if (ret)
+		goto out_put_fwnode;
+
+	ret = cix_pd_typec_parse_port_props(&typec->caps, fwnode, dev);
+	if (ret)
+		goto out_unregister_ports;
+
+	typec->port = typec_register_port(dev, &typec->caps);
+	if (IS_ERR(typec->port)) {
+		ret = PTR_ERR(typec->port);
+		typec->port = NULL;
+		dev_err_probe(dev, ret, "failed to register port\n");
+		goto out_unregister_ports;
+	}
+
+	desc.roles = typec->caps.data;
+	typec->port_altmode = typec_port_register_altmode(typec->port, &desc);
+	if (IS_ERR(typec->port_altmode)) {
+		ret = PTR_ERR(typec->port_altmode);
+		typec->port_altmode = NULL;
+		dev_err_probe(dev, ret, "failed to register DP altmode\n");
+		goto out_unregister_ports;
+	}
+
+	fwnode_handle_put(fwnode);
+
+	return 0;
+
+out_unregister_ports:
+	cix_pd_unregister_ports(typec);
+out_put_fwnode:
+	fwnode_handle_put(fwnode);
+	return ret;
+}
+
+static int cix_pd_probe(struct i2c_client *client)
+{
+	struct cix_pd *rts;
+	int ret;
+
+	rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
+	if (!rts)
+		return -ENOMEM;
+
+	rts->dev = &client->dev;
+	mutex_init(&rts->lock);
+	cix_pd_typec_init_state(rts);
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "i2c check functionality failed\n");
+
+	rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
+	if (IS_ERR(rts->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
+				     "failed to init regmap\n");
+
+	i2c_set_clientdata(client, rts);
+	rts->id = client->addr;
+
+	ret = cix_pd_init_ports(rts);
+	if (ret)
+		return ret;
+
+	/*
+	 * Acknowledge any interrupt the controller raised before the IRQ was
+	 * requested, so the shared line is not left asserted by this instance,
+	 * and program the port state once so that the switch and the mux are
+	 * in a known state even when no cable is attached.
+	 */
+	ret = cix_pd_event_handler(rts, true, true);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read initial status: %d\n", ret);
+		goto err_unregister_ports;
+	}
+
+	if (client->irq > 0) {
+		ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
+					   IRQF_SHARED | IRQF_ONESHOT,
+					   dev_name(&client->dev), rts);
+		if (ret) {
+			dev_err(&client->dev, "failed to request irq: %d\n", ret);
+			goto err_unregister_ports;
+		}
+	}
+
+	return 0;
+
+err_unregister_ports:
+	cix_pd_unregister_ports(rts);
+	return ret;
+}
+
+static void cix_pd_remove(struct i2c_client *client)
+{
+	struct cix_pd *rts = i2c_get_clientdata(client);
+
+	if (client->irq > 0)
+		free_irq(client->irq, rts);
+
+	cix_pd_unregister_ports(rts);
+}
+
+static const struct of_device_id cix_pd_of_match[] = {
+	{ .compatible = "realtek,rts5453h", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cix_pd_of_match);
+
+static const struct i2c_device_id cix_pd_id[] = {
+	{ .name = "rts5453h" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, cix_pd_id);
+
+static int __maybe_unused cix_pd_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	/*
+	 * The controller is not accessible once the parent I2C adapter is
+	 * suspended, so keep the interrupt masked for the whole sleep. The line
+	 * is level-triggered and shared by the ports: left enabled, a cable
+	 * event would loop in the handler, which could not acknowledge the
+	 * controller before ->resume(). The parent adapter is still alive here
+	 * because children are suspended first, so disable_irq() can safely
+	 * wait for an in-flight handler to finish.
+	 */
+	if (client->irq > 0)
+		disable_irq(client->irq);
+
+	return 0;
+}
+
+static int __maybe_unused cix_pd_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+	int ret;
+
+	/*
+	 * Read the status the controller kept while the system was asleep and
+	 * acknowledge it. The parent I2C adapter is always resumed before this
+	 * device, and the interrupt is still masked.
+	 */
+	ret = cix_pd_event_handler(rts, true, true);
+
+	if (client->irq > 0)
+		enable_irq(client->irq);
+
+	if (ret < 0) {
+		dev_err(dev, "failed to refresh status: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops cix_pd_pm_ops = {
+	.suspend = pm_sleep_ptr(cix_pd_suspend),
+	.resume = pm_sleep_ptr(cix_pd_resume),
+	.freeze = pm_sleep_ptr(cix_pd_suspend),
+	.thaw = pm_sleep_ptr(cix_pd_resume),
+	.poweroff = pm_sleep_ptr(cix_pd_suspend),
+	.restore = pm_sleep_ptr(cix_pd_resume),
+};
+
+static struct i2c_driver cix_pd_i2c_driver = {
+	.driver = {
+		.name = "rts5453h",
+		.of_match_table = cix_pd_of_match,
+		.pm = pm_ptr(&cix_pd_pm_ops),
+	},
+	.id_table = cix_pd_id,
+	.probe = cix_pd_probe,
+	.remove = cix_pd_remove,
+};
+
+module_i2c_driver(cix_pd_i2c_driver);
+MODULE_DESCRIPTION("CIX Type-C PD controller driver");
+MODULE_AUTHOR("Chao Zeng <Chao.Zeng@cixtech.com>");
+MODULE_AUTHOR("Gary Yang <gary.yang@cixtech.com>");
+MODULE_LICENSE("GPL");
-- 
2.50.1

