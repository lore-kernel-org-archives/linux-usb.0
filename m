Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333CBC10F12
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECE8A2075B
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 12:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfDOMJl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 08:09:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:10510 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfDOMJl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Apr 2019 08:09:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2019 05:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,353,1549958400"; 
   d="scan'208";a="164850776"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 05:09:39 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 4/7] usb: typec: ucsi: Preliminary support for alternate modes
Date:   Mon, 15 Apr 2019 15:09:28 +0300
Message-Id: <20190415120931.61328-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190415120928.oeFwdh0NSeW-fGE2gox3awaz6ukjGm-CIB6QbR8Vduc@z>

With UCSI the alternate modes, just like everything else
related to USB Type-C connectors, are handled in firmware.
The operating system can see the status and is allowed to
request certain things, for example entering and exiting the
modes, but the support for alternate modes is very limited
in UCSI. The feature is also optional, which means that even
when the platform supports alternate modes, the operating
system may not be even made aware of them.

UCSI does not support direct VDM reading or writing.
Instead, alternate modes can be entered and exited using a
single custom command which takes also an optional SVID
specific configuration value as parameter. That means every
supported alternate mode has to be handled separately in
UCSI driver.

This commit does not include support for any specific
alternate mode. The discovered alternate modes are now
registered, but binding a driver to an alternate mode will
not be possible until support for that alternate mode is
added to the UCSI driver.

Tested-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/trace.c |  12 ++
 drivers/usb/typec/ucsi/trace.h |  26 +++
 drivers/usb/typec/ucsi/ucsi.c  | 358 +++++++++++++++++++++++++++------
 drivers/usb/typec/ucsi/ucsi.h  |  72 +++++++
 4 files changed, 403 insertions(+), 65 deletions(-)

diff --git a/drivers/usb/typec/ucsi/trace.c b/drivers/usb/typec/ucsi/trace.c
index ffa3b4c3f338..1dabafb74320 100644
--- a/drivers/usb/typec/ucsi/trace.c
+++ b/drivers/usb/typec/ucsi/trace.c
@@ -60,3 +60,15 @@ const char *ucsi_cci_str(u32 cci)
 
 	return "";
 }
+
+static const char * const ucsi_recipient_strs[] = {
+	[UCSI_RECIPIENT_CON]		= "port",
+	[UCSI_RECIPIENT_SOP]		= "partner",
+	[UCSI_RECIPIENT_SOP_P]		= "plug (prime)",
+	[UCSI_RECIPIENT_SOP_PP]		= "plug (double prime)",
+};
+
+const char *ucsi_recipient_str(u8 recipient)
+{
+	return ucsi_recipient_strs[recipient];
+}
diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
index 5e2906df2db7..783ec9c72055 100644
--- a/drivers/usb/typec/ucsi/trace.h
+++ b/drivers/usb/typec/ucsi/trace.h
@@ -7,6 +7,7 @@
 #define __UCSI_TRACE_H
 
 #include <linux/tracepoint.h>
+#include <linux/usb/typec_altmode.h>
 
 const char *ucsi_cmd_str(u64 raw_cmd);
 const char *ucsi_ack_str(u8 ack);
@@ -134,6 +135,31 @@ DEFINE_EVENT(ucsi_log_connector_status, ucsi_register_port,
 	TP_ARGS(port, status)
 );
 
+DECLARE_EVENT_CLASS(ucsi_log_register_altmode,
+	TP_PROTO(u8 recipient, struct typec_altmode *alt),
+	TP_ARGS(recipient, alt),
+	TP_STRUCT__entry(
+		__field(u8, recipient)
+		__field(u16, svid)
+		__field(u8, mode)
+		__field(u32, vdo)
+	),
+	TP_fast_assign(
+		__entry->recipient = recipient;
+		__entry->svid = alt->svid;
+		__entry->mode = alt->mode;
+		__entry->vdo = alt->vdo;
+	),
+	TP_printk("%s alt mode: svid %04x, mode %d vdo %x",
+		  ucsi_recipient_str(__entry->recipient), __entry->svid,
+		  __entry->mode, __entry->vdo)
+);
+
+DEFINE_EVENT(ucsi_log_register_altmode, ucsi_register_altmode,
+	TP_PROTO(u8 recipient, struct typec_altmode *alt),
+	TP_ARGS(recipient, alt)
+);
+
 #endif /* __UCSI_TRACE_H */
 
 /* This part must be outside protection */
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 8d0a6fe748bd..585ab04be940 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -12,7 +12,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
 
 #include "ucsi.h"
 #include "trace.h"
@@ -45,22 +45,6 @@ enum ucsi_status {
 	UCSI_ERROR,
 };
 
-struct ucsi_connector {
-	int num;
-
-	struct ucsi *ucsi;
-	struct work_struct work;
-	struct completion complete;
-
-	struct typec_port *port;
-	struct typec_partner *partner;
-
-	struct typec_capability typec_cap;
-
-	struct ucsi_connector_status status;
-	struct ucsi_connector_capability cap;
-};
-
 struct ucsi {
 	struct device *dev;
 	struct ucsi_ppm *ppm;
@@ -238,8 +222,204 @@ static int ucsi_run_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
 	return ret;
 }
 
+int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
+		      void *retval, size_t size)
+{
+	int ret;
+
+	mutex_lock(&ucsi->ppm_lock);
+	ret = ucsi_run_command(ucsi, ctrl, retval, size);
+	mutex_unlock(&ucsi->ppm_lock);
+
+	return ret;
+}
+
 /* -------------------------------------------------------------------------- */
 
+void ucsi_altmode_update_active(struct ucsi_connector *con)
+{
+	const struct typec_altmode *altmode = NULL;
+	struct ucsi_control ctrl;
+	int ret;
+	u8 cur;
+	int i;
+
+	UCSI_CMD_GET_CURRENT_CAM(ctrl, con->num);
+	ret = ucsi_run_command(con->ucsi, &ctrl, &cur, sizeof(cur));
+	if (ret < 0) {
+		if (con->ucsi->ppm->data->version > 0x0100) {
+			dev_err(con->ucsi->dev,
+				"GET_CURRENT_CAM command failed\n");
+			return;
+		}
+		cur = 0xff;
+	}
+
+	if (cur < UCSI_MAX_ALTMODES)
+		altmode = typec_altmode_get_partner(con->port_altmode[cur]);
+
+	for (i = 0; con->partner_altmode[i]; i++)
+		typec_altmode_update_active(con->partner_altmode[i],
+					    con->partner_altmode[i] == altmode);
+}
+
+static u8 ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
+{
+	u8 mode = 1;
+	int i;
+
+	for (i = 0; alt[i]; i++)
+		if (alt[i]->svid == svid)
+			mode++;
+
+	return mode;
+}
+
+static int ucsi_next_altmode(struct typec_altmode **alt)
+{
+	int i = 0;
+
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++)
+		if (!alt[i])
+			return i;
+
+	return -ENOENT;
+}
+
+static int ucsi_register_altmode(struct ucsi_connector *con,
+				 struct typec_altmode_desc *desc,
+				 u8 recipient)
+{
+	struct typec_altmode *alt;
+	int ret;
+	int i;
+
+	switch (recipient) {
+	case UCSI_RECIPIENT_CON:
+		i = ucsi_next_altmode(con->port_altmode);
+		if (i < 0) {
+			ret = i;
+			goto err;
+		}
+
+		desc->mode = ucsi_altmode_next_mode(con->port_altmode,
+						    desc->svid);
+
+		alt = typec_port_register_altmode(con->port, desc);
+		if (IS_ERR(alt)) {
+			ret = PTR_ERR(alt);
+			goto err;
+		}
+
+		con->port_altmode[i] = alt;
+		break;
+	case UCSI_RECIPIENT_SOP:
+		i = ucsi_next_altmode(con->partner_altmode);
+		if (i < 0) {
+			ret = i;
+			goto err;
+		}
+
+		desc->mode = ucsi_altmode_next_mode(con->partner_altmode,
+						    desc->svid);
+
+		alt = typec_partner_register_altmode(con->partner, desc);
+		if (IS_ERR(alt)) {
+			ret = PTR_ERR(alt);
+			goto err;
+		}
+
+		con->partner_altmode[i] = alt;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	trace_ucsi_register_altmode(recipient, alt);
+
+	return 0;
+
+err:
+	dev_err(con->ucsi->dev, "failed to registers svid 0x%04x mode %d\n",
+		desc->svid, desc->mode);
+
+	return ret;
+}
+
+static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
+{
+	int max_altmodes = UCSI_MAX_ALTMODES;
+	struct typec_altmode_desc desc;
+	struct ucsi_altmode alt[2];
+	struct ucsi_control ctrl;
+	int num = 1;
+	int ret;
+	int len;
+	int j;
+	int i;
+
+	if (!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS))
+		return 0;
+
+	if (recipient == UCSI_RECIPIENT_CON)
+		max_altmodes = con->ucsi->cap.num_alt_modes;
+
+	for (i = 0; i < max_altmodes;) {
+		memset(alt, 0, sizeof(alt));
+		UCSI_CMD_GET_ALTERNATE_MODES(ctrl, recipient, con->num, i, 1);
+		len = ucsi_run_command(con->ucsi, &ctrl, alt, sizeof(alt));
+		if (len <= 0)
+			return len;
+
+		/*
+		 * This code is requesting one alt mode at a time, but some PPMs
+		 * may still return two. If that happens both alt modes need be
+		 * registered and the offset for the next alt mode has to be
+		 * incremented.
+		 */
+		num = len / sizeof(alt[0]);
+		i += num;
+
+		for (j = 0; j < num; j++) {
+			if (!alt[j].svid)
+				return 0;
+
+			memset(&desc, 0, sizeof(desc));
+			desc.vdo = alt[j].mid;
+			desc.svid = alt[j].svid;
+			desc.roles = TYPEC_PORT_DRD;
+
+			ret = ucsi_register_altmode(con, &desc, recipient);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
+{
+	struct typec_altmode **adev;
+	int i = 0;
+
+	switch (recipient) {
+	case UCSI_RECIPIENT_CON:
+		adev = con->port_altmode;
+		break;
+	case UCSI_RECIPIENT_SOP:
+		adev = con->partner_altmode;
+		break;
+	default:
+		return;
+	}
+
+	while (adev[i]) {
+		typec_unregister_altmode(adev[i]);
+		adev[i++] = NULL;
+	}
+}
+
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
 	switch (con->status.pwr_op_mode) {
@@ -299,10 +479,46 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 	if (!con->partner)
 		return;
 
+	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
 	typec_unregister_partner(con->partner);
 	con->partner = NULL;
 }
 
+static void ucsi_partner_change(struct ucsi_connector *con)
+{
+	int ret;
+
+	if (!con->partner)
+		return;
+
+	switch (con->status.partner_type) {
+	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+		typec_set_data_role(con->port, TYPEC_HOST);
+		break;
+	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
+		typec_set_data_role(con->port, TYPEC_DEVICE);
+		break;
+	default:
+		break;
+	}
+
+	/* Complete pending data role swap */
+	if (!completion_done(&con->complete))
+		complete(&con->complete);
+
+	if (con->partner_altmode[0])
+		return;
+
+	/* Can't rely on Partner Flags field. Always checking the alt modes. */
+	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
+	if (ret)
+		dev_err(con->ucsi->dev,
+			"con%d: failed to register partner alternate modes\n",
+			con->num);
+	else
+		ucsi_altmode_update_active(con);
+}
+
 static void ucsi_connector_change(struct work_struct *work)
 {
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
@@ -311,10 +527,10 @@ static void ucsi_connector_change(struct work_struct *work)
 	struct ucsi_control ctrl;
 	int ret;
 
-	mutex_lock(&ucsi->ppm_lock);
+	mutex_lock(&con->lock);
 
 	UCSI_CMD_GET_CONNECTOR_STATUS(ctrl, con->num);
-	ret = ucsi_run_command(ucsi, &ctrl, &con->status, sizeof(con->status));
+	ret = ucsi_send_command(ucsi, &ctrl, &con->status, sizeof(con->status));
 	if (ret < 0) {
 		dev_err(ucsi->dev, "%s: GET_CONNECTOR_STATUS failed (%d)\n",
 			__func__, ret);
@@ -332,23 +548,6 @@ static void ucsi_connector_change(struct work_struct *work)
 			complete(&con->complete);
 	}
 
-	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE) {
-		switch (con->status.partner_type) {
-		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
-			typec_set_data_role(con->port, TYPEC_HOST);
-			break;
-		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
-			typec_set_data_role(con->port, TYPEC_DEVICE);
-			break;
-		default:
-			break;
-		}
-
-		/* Complete pending data role swap */
-		if (!completion_done(&con->complete))
-			complete(&con->complete);
-	}
-
 	if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
 		typec_set_pwr_role(con->port, con->status.pwr_dir);
 
@@ -369,6 +568,19 @@ static void ucsi_connector_change(struct work_struct *work)
 			ucsi_unregister_partner(con);
 	}
 
+	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE) {
+		/*
+		 * We don't need to know the currently supported alt modes here.
+		 * Running GET_CAM_SUPPORTED command just to make sure the PPM
+		 * does not get stuck in case it assumes we do so.
+		 */
+		UCSI_CMD_GET_CAM_SUPPORTED(ctrl, con->num);
+		ucsi_run_command(con->ucsi, &ctrl, NULL, 0);
+	}
+
+	if (con->status.change & UCSI_CONSTAT_PARTNER_CHANGE)
+		ucsi_partner_change(con);
+
 	ret = ucsi_ack(ucsi, UCSI_ACK_EVENT);
 	if (ret)
 		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
@@ -377,7 +589,7 @@ static void ucsi_connector_change(struct work_struct *work)
 
 out_unlock:
 	clear_bit(EVENT_PENDING, &ucsi->flags);
-	mutex_unlock(&ucsi->ppm_lock);
+	mutex_unlock(&con->lock);
 }
 
 /**
@@ -427,7 +639,7 @@ static int ucsi_reset_connector(struct ucsi_connector *con, bool hard)
 
 	UCSI_CMD_CONNECTOR_RESET(ctrl, con, hard);
 
-	return ucsi_run_command(con->ucsi, &ctrl, NULL, 0);
+	return ucsi_send_command(con->ucsi, &ctrl, NULL, 0);
 }
 
 static int ucsi_reset_ppm(struct ucsi *ucsi)
@@ -481,15 +693,17 @@ static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control *ctrl)
 {
 	int ret;
 
-	ret = ucsi_run_command(con->ucsi, ctrl, NULL, 0);
+	ret = ucsi_send_command(con->ucsi, ctrl, NULL, 0);
 	if (ret == -ETIMEDOUT) {
 		struct ucsi_control c;
 
 		/* PPM most likely stopped responding. Resetting everything. */
+		mutex_lock(&con->ucsi->ppm_lock);
 		ucsi_reset_ppm(con->ucsi);
+		mutex_unlock(&con->ucsi->ppm_lock);
 
 		UCSI_CMD_SET_NTFY_ENABLE(c, UCSI_ENABLE_NTFY_ALL);
-		ucsi_run_command(con->ucsi, &c, NULL, 0);
+		ucsi_send_command(con->ucsi, &c, NULL, 0);
 
 		ucsi_reset_connector(con, true);
 	}
@@ -504,10 +718,12 @@ ucsi_dr_swap(const struct typec_capability *cap, enum typec_data_role role)
 	struct ucsi_control ctrl;
 	int ret = 0;
 
-	if (!con->partner)
-		return -ENOTCONN;
+	mutex_lock(&con->lock);
 
-	mutex_lock(&con->ucsi->ppm_lock);
+	if (!con->partner) {
+		ret = -ENOTCONN;
+		goto out_unlock;
+	}
 
 	if ((con->status.partner_type == UCSI_CONSTAT_PARTNER_TYPE_DFP &&
 	     role == TYPEC_DEVICE) ||
@@ -520,18 +736,14 @@ ucsi_dr_swap(const struct typec_capability *cap, enum typec_data_role role)
 	if (ret < 0)
 		goto out_unlock;
 
-	mutex_unlock(&con->ucsi->ppm_lock);
-
 	if (!wait_for_completion_timeout(&con->complete,
 					msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS)))
-		return -ETIMEDOUT;
-
-	return 0;
+		ret = -ETIMEDOUT;
 
 out_unlock:
-	mutex_unlock(&con->ucsi->ppm_lock);
+	mutex_unlock(&con->lock);
 
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 static int
@@ -541,10 +753,12 @@ ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
 	struct ucsi_control ctrl;
 	int ret = 0;
 
-	if (!con->partner)
-		return -ENOTCONN;
+	mutex_lock(&con->lock);
 
-	mutex_lock(&con->ucsi->ppm_lock);
+	if (!con->partner) {
+		ret = -ENOTCONN;
+		goto out_unlock;
+	}
 
 	if (con->status.pwr_dir == role)
 		goto out_unlock;
@@ -554,13 +768,11 @@ ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
 	if (ret < 0)
 		goto out_unlock;
 
-	mutex_unlock(&con->ucsi->ppm_lock);
-
 	if (!wait_for_completion_timeout(&con->complete,
-					msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS)))
-		return -ETIMEDOUT;
-
-	mutex_lock(&con->ucsi->ppm_lock);
+				msecs_to_jiffies(UCSI_SWAP_TIMEOUT_MS))) {
+		ret = -ETIMEDOUT;
+		goto out_unlock;
+	}
 
 	/* Something has gone wrong while swapping the role */
 	if (con->status.pwr_op_mode != UCSI_CONSTAT_PWR_OPMODE_PD) {
@@ -569,7 +781,7 @@ ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
 	}
 
 out_unlock:
-	mutex_unlock(&con->ucsi->ppm_lock);
+	mutex_unlock(&con->lock);
 
 	return ret;
 }
@@ -595,6 +807,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	INIT_WORK(&con->work, ucsi_connector_change);
 	init_completion(&con->complete);
+	mutex_init(&con->lock);
 	con->num = index + 1;
 	con->ucsi = ucsi;
 
@@ -636,6 +849,12 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	if (IS_ERR(con->port))
 		return PTR_ERR(con->port);
 
+	/* Alternate modes */
+	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
+	if (ret)
+		dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
+			con->num);
+
 	/* Get the status */
 	UCSI_CMD_GET_CONNECTOR_STATUS(ctrl, con->num);
 	ret = ucsi_run_command(ucsi, &ctrl, &con->status, sizeof(con->status));
@@ -662,6 +881,16 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	if (con->status.connected)
 		ucsi_register_partner(con);
 
+	if (con->partner) {
+		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
+		if (ret)
+			dev_err(ucsi->dev,
+				"con%d: failed to register alternate modes\n",
+				con->num);
+		else
+			ucsi_altmode_update_active(con);
+	}
+
 	trace_ucsi_register_port(con->num, &con->status);
 
 	return 0;
@@ -730,6 +959,7 @@ static void ucsi_init(struct work_struct *work)
 err_unregister:
 	for (con = ucsi->connector; con->port; con++) {
 		ucsi_unregister_partner(con);
+		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
 		typec_unregister_port(con->port);
 		con->port = NULL;
 	}
@@ -788,17 +1018,15 @@ void ucsi_unregister_ppm(struct ucsi *ucsi)
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
 
-	mutex_lock(&ucsi->ppm_lock);
-
 	/* Disable everything except command complete notification */
 	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_CMD_COMPLETE)
-	ucsi_run_command(ucsi, &ctrl, NULL, 0);
-
-	mutex_unlock(&ucsi->ppm_lock);
+	ucsi_send_command(ucsi, &ctrl, NULL, 0);
 
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
 		ucsi_unregister_partner(&ucsi->connector[i]);
+		ucsi_unregister_altmodes(&ucsi->connector[i],
+					 UCSI_RECIPIENT_CON);
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 53b80f40a908..c416bae4b5ca 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -6,6 +6,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/types.h>
+#include <linux/usb/typec.h>
 
 /* -------------------------------------------------------------------------- */
 
@@ -60,6 +61,20 @@ struct ucsi_uor_cmd {
 	u16:6; /* reserved */
 } __packed;
 
+/* Get Alternate Modes Command structure */
+struct ucsi_altmode_cmd {
+	u8 cmd;
+	u8 length;
+	u8 recipient;
+#define UCSI_RECIPIENT_CON			0
+#define UCSI_RECIPIENT_SOP			1
+#define UCSI_RECIPIENT_SOP_P			2
+#define UCSI_RECIPIENT_SOP_PP			3
+	u8 con_num;
+	u8 offset;
+	u8 num_altmodes;
+} __packed;
+
 struct ucsi_control {
 	union {
 		u64 raw_cmd;
@@ -67,6 +82,7 @@ struct ucsi_control {
 		struct ucsi_uor_cmd uor;
 		struct ucsi_ack_cmd ack;
 		struct ucsi_con_rst con_rst;
+		struct ucsi_altmode_cmd alt;
 	};
 };
 
@@ -112,6 +128,30 @@ struct ucsi_control {
 	(_ctrl_).cmd.data = _con_;					\
 }
 
+/* Helper for preparing ucsi_control for GET_ALTERNATE_MODES command. */
+#define UCSI_CMD_GET_ALTERNATE_MODES(_ctrl_, _r_, _con_num_, _o_, _num_)\
+{									\
+	__UCSI_CMD((_ctrl_), UCSI_GET_ALTERNATE_MODES)			\
+	_ctrl_.alt.recipient = (_r_);					\
+	_ctrl_.alt.con_num = (_con_num_);				\
+	_ctrl_.alt.offset = (_o_);					\
+	_ctrl_.alt.num_altmodes = (_num_) - 1;				\
+}
+
+/* Helper for preparing ucsi_control for GET_CAM_SUPPORTED command. */
+#define UCSI_CMD_GET_CAM_SUPPORTED(_ctrl_, _con_)			\
+{									\
+	__UCSI_CMD((_ctrl_), UCSI_GET_CAM_SUPPORTED)			\
+	_ctrl_.cmd.data = (_con_);					\
+}
+
+/* Helper for preparing ucsi_control for GET_CAM_SUPPORTED command. */
+#define UCSI_CMD_GET_CURRENT_CAM(_ctrl_, _con_)			\
+{									\
+	__UCSI_CMD((_ctrl_), UCSI_GET_CURRENT_CAM)			\
+	_ctrl_.cmd.data = (_con_);					\
+}
+
 /* Helper for preparing ucsi_control for GET_CONNECTOR_STATUS command. */
 #define UCSI_CMD_GET_CONNECTOR_STATUS(_ctrl_, _con_)			\
 {									\
@@ -334,4 +374,36 @@ struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm);
 void ucsi_unregister_ppm(struct ucsi *ucsi);
 void ucsi_notify(struct ucsi *ucsi);
 
+/* -------------------------------------------------------------------------- */
+
+struct ucsi;
+
+#define UCSI_MAX_SVID		5
+#define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
+
+struct ucsi_connector {
+	int num;
+
+	struct ucsi *ucsi;
+	struct mutex lock; /* port lock */
+	struct work_struct work;
+	struct completion complete;
+
+	struct typec_port *port;
+	struct typec_partner *partner;
+
+	struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
+	struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
+
+	struct typec_capability typec_cap;
+
+	struct ucsi_connector_status status;
+	struct ucsi_connector_capability cap;
+};
+
+int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
+		      void *retval, size_t size);
+
+void ucsi_altmode_update_active(struct ucsi_connector *con);
+
 #endif /* __DRIVER_USB_TYPEC_UCSI_H */
-- 
2.20.1

