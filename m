Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9B4C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 14:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3CA220674
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 14:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfDWO1F (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 10:27:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:63190 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfDWO1F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 10:27:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Apr 2019 07:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,386,1549958400"; 
   d="scan'208";a="167140019"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2019 07:22:01 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v4 5/7] usb: typec: ucsi: Support for DisplayPort alt mode
Date:   Tue, 23 Apr 2019 17:21:49 +0300
Message-Id: <20190423142151.26135-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
References: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190423142149.Yvy8QOYy1sLEmjV5PeusYZFpJQZheOSoze0b8xejHxI@z>

This makes it possible to bind a driver to a DisplayPort
alt mode adapter devices.

The driver attempts to cope with the limitations of UCSI by
"emulating" behaviour and attempting to guess things when
ever possible in order to satisfy the requirements the
standard DisplayPort alt mode driver has.

Tested-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/Makefile      |  15 +-
 drivers/usb/typec/ucsi/displayport.c | 315 +++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c        |  21 +-
 drivers/usb/typec/ucsi/ucsi.h        |  21 ++
 4 files changed, 364 insertions(+), 8 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/displayport.c

diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index 2f4900b26210..b35e15a1f02c 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -1,12 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS_trace.o			:= -I$(src)
+CFLAGS_trace.o				:= -I$(src)
 
-obj-$(CONFIG_TYPEC_UCSI)	+= typec_ucsi.o
+obj-$(CONFIG_TYPEC_UCSI)		+= typec_ucsi.o
 
-typec_ucsi-y			:= ucsi.o
+typec_ucsi-y				:= ucsi.o
 
-typec_ucsi-$(CONFIG_TRACING)	+= trace.o
+typec_ucsi-$(CONFIG_TRACING)		+= trace.o
 
-obj-$(CONFIG_UCSI_ACPI)		+= ucsi_acpi.o
+ifneq ($(CONFIG_TYPEC_DP_ALTMODE),)
+	typec_ucsi-y			+= displayport.o
+endif
 
-obj-$(CONFIG_UCSI_CCG)		+= ucsi_ccg.o
+obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
+obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
new file mode 100644
index 000000000000..6c103697c582
--- /dev/null
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UCSI DisplayPort Alternate Mode Support
+ *
+ * Copyright (C) 2018, Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/pd_vdo.h>
+
+#include "ucsi.h"
+
+#define UCSI_CMD_SET_NEW_CAM(_con_num_, _enter_, _cam_, _am_)		\
+	 (UCSI_SET_NEW_CAM | ((_con_num_) << 16) | ((_enter_) << 23) |	\
+	  ((_cam_) << 24) | ((u64)(_am_) << 32))
+
+struct ucsi_dp {
+	struct typec_displayport_data data;
+	struct ucsi_connector *con;
+	struct typec_altmode *alt;
+	struct work_struct work;
+	int offset;
+
+	bool override;
+	bool initialized;
+
+	u32 header;
+	u32 *vdo_data;
+	u8 vdo_size;
+};
+
+/*
+ * Note. Alternate mode control is optional feature in UCSI. It means that even
+ * if the system supports alternate modes, the OS may not be aware of them.
+ *
+ * In most cases however, the OS will be able to see the supported alternate
+ * modes, but it may still not be able to configure them, not even enter or exit
+ * them. That is because UCSI defines alt mode details and alt mode "overriding"
+ * as separate options.
+ *
+ * In case alt mode details are supported, but overriding is not, the driver
+ * will still display the supported pin assignments and configuration, but any
+ * changes the user attempts to do will lead into failure with return value of
+ * -EOPNOTSUPP.
+ */
+
+static int ucsi_displayport_enter(struct typec_altmode *alt)
+{
+	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	struct ucsi_control ctrl;
+	u8 cur = 0;
+	int ret;
+
+	mutex_lock(&dp->con->lock);
+
+	if (!dp->override && dp->initialized) {
+		const struct typec_altmode *p = typec_altmode_get_partner(alt);
+
+		dev_warn(&p->dev,
+			 "firmware doesn't support alternate mode overriding\n");
+		mutex_unlock(&dp->con->lock);
+		return -EOPNOTSUPP;
+	}
+
+	UCSI_CMD_GET_CURRENT_CAM(ctrl, dp->con->num);
+	ret = ucsi_send_command(dp->con->ucsi, &ctrl, &cur, sizeof(cur));
+	if (ret < 0) {
+		if (dp->con->ucsi->ppm->data->version > 0x0100) {
+			mutex_unlock(&dp->con->lock);
+			return ret;
+		}
+		cur = 0xff;
+	}
+
+	if (cur != 0xff) {
+		mutex_unlock(&dp->con->lock);
+		return -EBUSY;
+	}
+
+	/*
+	 * We can't send the New CAM command yet to the PPM as it needs the
+	 * configuration value as well. Pretending that we have now entered the
+	 * mode, and letting the alt mode driver continue.
+	 */
+
+	dp->header = VDO(USB_TYPEC_DP_SID, 1, CMD_ENTER_MODE);
+	dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
+	dp->header |= VDO_CMDT(CMDT_RSP_ACK);
+
+	dp->vdo_data = NULL;
+	dp->vdo_size = 1;
+
+	schedule_work(&dp->work);
+
+	mutex_unlock(&dp->con->lock);
+
+	return 0;
+}
+
+static int ucsi_displayport_exit(struct typec_altmode *alt)
+{
+	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	struct ucsi_control ctrl;
+	int ret = 0;
+
+	mutex_lock(&dp->con->lock);
+
+	if (!dp->override) {
+		const struct typec_altmode *p = typec_altmode_get_partner(alt);
+
+		dev_warn(&p->dev,
+			 "firmware doesn't support alternate mode overriding\n");
+		ret = -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
+	ctrl.raw_cmd = UCSI_CMD_SET_NEW_CAM(dp->con->num, 0, dp->offset, 0);
+	ret = ucsi_send_command(dp->con->ucsi, &ctrl, NULL, 0);
+	if (ret < 0)
+		goto out_unlock;
+
+	dp->header = VDO(USB_TYPEC_DP_SID, 1, CMD_EXIT_MODE);
+	dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
+	dp->header |= VDO_CMDT(CMDT_RSP_ACK);
+
+	dp->vdo_data = NULL;
+	dp->vdo_size = 1;
+
+	schedule_work(&dp->work);
+
+out_unlock:
+	mutex_unlock(&dp->con->lock);
+
+	return ret;
+}
+
+/*
+ * We do not actually have access to the Status Update VDO, so we have to guess
+ * things.
+ */
+static int ucsi_displayport_status_update(struct ucsi_dp *dp)
+{
+	u32 cap = dp->alt->vdo;
+
+	dp->data.status = DP_STATUS_ENABLED;
+
+	/*
+	 * If pin assignement D is supported, claiming always
+	 * that Multi-function is preferred.
+	 */
+	if (DP_CAP_CAPABILITY(cap) & DP_CAP_UFP_D) {
+		dp->data.status |= DP_STATUS_CON_UFP_D;
+
+		if (DP_CAP_UFP_D_PIN_ASSIGN(cap) & BIT(DP_PIN_ASSIGN_D))
+			dp->data.status |= DP_STATUS_PREFER_MULTI_FUNC;
+	} else {
+		dp->data.status |= DP_STATUS_CON_DFP_D;
+
+		if (DP_CAP_DFP_D_PIN_ASSIGN(cap) & BIT(DP_PIN_ASSIGN_D))
+			dp->data.status |= DP_STATUS_PREFER_MULTI_FUNC;
+	}
+
+	dp->vdo_data = &dp->data.status;
+	dp->vdo_size = 2;
+
+	return 0;
+}
+
+static int ucsi_displayport_configure(struct ucsi_dp *dp)
+{
+	u32 pins = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
+	struct ucsi_control ctrl;
+
+	if (!dp->override)
+		return 0;
+
+	ctrl.raw_cmd = UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
+
+	return ucsi_send_command(dp->con->ucsi, &ctrl, NULL, 0);
+}
+
+static int ucsi_displayport_vdm(struct typec_altmode *alt,
+				u32 header, const u32 *data, int count)
+{
+	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	int cmd_type = PD_VDO_CMDT(header);
+	int cmd = PD_VDO_CMD(header);
+
+	mutex_lock(&dp->con->lock);
+
+	if (!dp->override && dp->initialized) {
+		const struct typec_altmode *p = typec_altmode_get_partner(alt);
+
+		dev_warn(&p->dev,
+			 "firmware doesn't support alternate mode overriding\n");
+		mutex_unlock(&dp->con->lock);
+		return -EOPNOTSUPP;
+	}
+
+	switch (cmd_type) {
+	case CMDT_INIT:
+		dp->header = VDO(USB_TYPEC_DP_SID, 1, cmd);
+		dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
+
+		switch (cmd) {
+		case DP_CMD_STATUS_UPDATE:
+			if (ucsi_displayport_status_update(dp))
+				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
+			else
+				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
+			break;
+		case DP_CMD_CONFIGURE:
+			dp->data.conf = *data;
+			if (ucsi_displayport_configure(dp)) {
+				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
+			} else {
+				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
+				if (dp->initialized)
+					ucsi_altmode_update_active(dp->con);
+				else
+					dp->initialized = true;
+			}
+			break;
+		default:
+			dp->header |= VDO_CMDT(CMDT_RSP_ACK);
+			break;
+		}
+
+		schedule_work(&dp->work);
+		break;
+	default:
+		break;
+	}
+
+	mutex_unlock(&dp->con->lock);
+
+	return 0;
+}
+
+static const struct typec_altmode_ops ucsi_displayport_ops = {
+	.enter = ucsi_displayport_enter,
+	.exit = ucsi_displayport_exit,
+	.vdm = ucsi_displayport_vdm,
+};
+
+static void ucsi_displayport_work(struct work_struct *work)
+{
+	struct ucsi_dp *dp = container_of(work, struct ucsi_dp, work);
+	int ret;
+
+	mutex_lock(&dp->con->lock);
+
+	ret = typec_altmode_vdm(dp->alt, dp->header,
+				dp->vdo_data, dp->vdo_size);
+	if (ret)
+		dev_err(&dp->alt->dev, "VDM 0x%x failed\n", dp->header);
+
+	dp->vdo_data = NULL;
+	dp->vdo_size = 0;
+	dp->header = 0;
+
+	mutex_unlock(&dp->con->lock);
+}
+
+void ucsi_displayport_remove_partner(struct typec_altmode *alt)
+{
+	struct ucsi_dp *dp;
+
+	if (!alt)
+		return;
+
+	dp = typec_altmode_get_drvdata(alt);
+	dp->data.conf = 0;
+	dp->data.status = 0;
+	dp->initialized = false;
+}
+
+struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
+						bool override, int offset,
+						struct typec_altmode_desc *desc)
+{
+	u8 all_assignments = BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D) |
+			     BIT(DP_PIN_ASSIGN_E);
+	struct typec_altmode *alt;
+	struct ucsi_dp *dp;
+
+	/* We can't rely on the firmware with the capabilities. */
+	desc->vdo |= DP_CAP_DP_SIGNALING | DP_CAP_RECEPTACLE;
+
+	/* Claiming that we support all pin assignments */
+	desc->vdo |= all_assignments << 8;
+	desc->vdo |= all_assignments << 16;
+
+	alt = typec_port_register_altmode(con->port, desc);
+	if (IS_ERR(alt))
+		return alt;
+
+	dp = devm_kzalloc(&alt->dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp) {
+		typec_unregister_altmode(alt);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	INIT_WORK(&dp->work, ucsi_displayport_work);
+	dp->override = override;
+	dp->offset = offset;
+	dp->con = con;
+	dp->alt = alt;
+
+	alt->ops = &ucsi_displayport_ops;
+	typec_altmode_set_drvdata(alt, dp);
+
+	return alt;
+}
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index fcb9434f218a..b4fb2e05d2e5 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -12,7 +12,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
 
 #include "ucsi.h"
 #include "trace.h"
@@ -264,9 +264,12 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 				 u8 recipient)
 {
 	struct typec_altmode *alt;
+	bool override;
 	int ret;
 	int i;
 
+	override = !!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
+
 	switch (recipient) {
 	case UCSI_RECIPIENT_CON:
 		i = ucsi_next_altmode(con->port_altmode);
@@ -278,7 +281,15 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 		desc->mode = ucsi_altmode_next_mode(con->port_altmode,
 						    desc->svid);
 
-		alt = typec_port_register_altmode(con->port, desc);
+		switch (desc->svid) {
+		case USB_TYPEC_DP_SID:
+			alt = ucsi_register_displayport(con, override, i, desc);
+			break;
+		default:
+			alt = typec_port_register_altmode(con->port, desc);
+			break;
+		}
+
 		if (IS_ERR(alt)) {
 			ret = PTR_ERR(alt);
 			goto err;
@@ -376,6 +387,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 
 static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 {
+	const struct typec_altmode *pdev;
 	struct typec_altmode **adev;
 	int i = 0;
 
@@ -391,6 +403,11 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	}
 
 	while (adev[i]) {
+		if (recipient == UCSI_RECIPIENT_SOP &&
+		    adev[i]->svid == USB_TYPEC_DP_SID) {
+			pdev = typec_altmode_get_partner(adev[i]);
+			ucsi_displayport_remove_partner((void *)pdev);
+		}
 		typec_unregister_altmode(adev[i]);
 		adev[i++] = NULL;
 	}
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 6cafa6b4a60a..1e2981aef629 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -431,4 +431,25 @@ int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 
 void ucsi_altmode_update_active(struct ucsi_connector *con);
 
+#if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
+struct typec_altmode *
+ucsi_register_displayport(struct ucsi_connector *con,
+			  bool override, int offset,
+			  struct typec_altmode_desc *desc);
+
+void ucsi_displayport_remove_partner(struct typec_altmode *adev);
+
+#else
+static inline struct typec_altmode *
+ucsi_register_displayport(struct ucsi_connector *con,
+			  bool override, int offset,
+			  struct typec_altmode_desc *desc)
+{
+	return NULL;
+}
+
+static inline void
+ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
+#endif /* CONFIG_TYPEC_DP_ALTMODE */
+
 #endif /* __DRIVER_USB_TYPEC_UCSI_H */
-- 
2.20.1

