Return-Path: <SRS0=jcui=SP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A518C10F11
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 20:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 205CD20870
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 20:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfDMUj7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 13 Apr 2019 16:39:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34408 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbfDMUj7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 13 Apr 2019 16:39:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id ABBD93089692;
        Sat, 13 Apr 2019 20:39:58 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-44.ams2.redhat.com [10.36.116.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1838560BE2;
        Sat, 13 Apr 2019 20:39:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: tcpm: Add start_srp_connection_detect callback
Date:   Sat, 13 Apr 2019 22:39:53 +0200
Message-Id: <20190413203955.10788-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sat, 13 Apr 2019 20:39:58 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413203953.cByVTEesv4B_0NSt2mrl01tkeh-8DuS-QNm19U8yjD4@z>

Some tcpc device-drivers need to explicitly be told to watch for connection
events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
being plugged into the Type-C port will not be noticed.

For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
watch for connection events. But for single-role ports we've so far been
falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
fusb302 this is not enough and no TCPM_CC_EVENT will be generated.

This commit adds a new start_srp_connection_detect callback to tcpc_dev
and when this is implemented calls this in place of start_drp_toggling
for SRP devices.

Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
 include/linux/usb/tcpm.h      | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a2233d72ae7c..1af54af90b50 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2553,6 +2553,14 @@ static bool tcpm_start_drp_toggling(struct tcpm_port *port,
 			return true;
 	}
 
+	if (port->tcpc->start_srp_connection_detect &&
+	    port->port_type != TYPEC_PORT_DRP) {
+		tcpm_log_force(port, "Start SRP connection detection");
+		ret = port->tcpc->start_srp_connection_detect(port->tcpc, cc);
+		if (!ret)
+			return true;
+	}
+
 	return false;
 }
 
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 0c532ca3f079..bf2bbbf2e2b2 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -125,6 +125,10 @@ struct tcpc_config {
  *		Optional; if supported by hardware, called to start DRP
  *		toggling. DRP toggling is stopped automatically if
  *		a connection is established.
+ * @start_srp_connection_detect:
+ *		Optional; if supported by hardware, called to start connection
+ *		detection for single role ports. Connection detection is stopped
+ *		automatically if a connection is established.
  * @try_role:	Optional; called to set a preferred role
  * @pd_transmit:Called to transmit PD message
  * @mux:	Pointer to multiplexer data
@@ -149,6 +153,8 @@ struct tcpc_dev {
 			 enum typec_role role, enum typec_data_role data);
 	int (*start_drp_toggling)(struct tcpc_dev *dev,
 				  enum typec_cc_status cc);
+	int (*start_srp_connection_detect)(struct tcpc_dev *dev,
+					   enum typec_cc_status cc);
 	int (*try_role)(struct tcpc_dev *dev, int role);
 	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 			   const struct pd_message *msg);
-- 
2.21.0

