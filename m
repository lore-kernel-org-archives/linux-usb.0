Return-Path: <SRS0=j0NE=XV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C941BC4360C
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 10:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9A9B222C2
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 10:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfIZKHc (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Sep 2019 06:07:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:2189 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfIZKHb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 06:07:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 03:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,551,1559545200"; 
   d="scan'208";a="203825683"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2019 03:07:30 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 02/14] usb: typec: Introduce typec_get_drvdata()
Date:   Thu, 26 Sep 2019 13:07:20 +0300
Message-Id: <20190926100727.71117-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
References: <20190926100727.71117-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Leaving the private driver_data pointer of the port device
to the port drivers.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 11 +++++++++++
 include/linux/usb/typec.h |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 3835e2d9fba6..9fab0be8f08c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1492,6 +1492,16 @@ EXPORT_SYMBOL_GPL(typec_set_mode);
 
 /* --------------------------------------- */
 
+/**
+ * typec_get_drvdata - Return private driver data pointer
+ * @port: USB Type-C port
+ */
+void *typec_get_drvdata(struct typec_port *port)
+{
+	return dev_get_drvdata(&port->dev);
+}
+EXPORT_SYMBOL_GPL(typec_get_drvdata);
+
 /**
  * typec_port_register_altmode - Register USB Type-C Port Alternate Mode
  * @port: USB Type-C Port that supports the alternate mode
@@ -1604,6 +1614,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->dev.fwnode = cap->fwnode;
 	port->dev.type = &typec_port_dev_type;
 	dev_set_name(&port->dev, "port%d", id);
+	dev_set_drvdata(&port->dev, cap->driver_data);
 
 	port->sw = typec_switch_get(&port->dev);
 	if (IS_ERR(port->sw)) {
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 7df4ecabc78a..8b90cd77331c 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -179,6 +179,7 @@ struct typec_partner_desc {
  * @sw: Cable plug orientation switch
  * @mux: Multiplexer switch for Alternate/Accessory Modes
  * @fwnode: Optional fwnode of the port
+ * @driver_data: Private pointer for driver specific info
  * @try_role: Set data role preference for DRP port
  * @dr_set: Set Data Role
  * @pr_set: Set Power Role
@@ -198,6 +199,7 @@ struct typec_capability {
 	struct typec_switch	*sw;
 	struct typec_mux	*mux;
 	struct fwnode_handle	*fwnode;
+	void			*driver_data;
 
 	int		(*try_role)(const struct typec_capability *,
 				    int role);
@@ -241,6 +243,8 @@ int typec_set_orientation(struct typec_port *port,
 enum typec_orientation typec_get_orientation(struct typec_port *port);
 int typec_set_mode(struct typec_port *port, int mode);
 
+void *typec_get_drvdata(struct typec_port *port);
+
 int typec_find_port_power_role(const char *name);
 int typec_find_power_role(const char *name);
 int typec_find_port_data_role(const char *name);
-- 
2.23.0

