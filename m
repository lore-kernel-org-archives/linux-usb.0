Return-Path: <SRS0=jcui=SP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02468C10F14
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 20:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C222020870
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 20:40:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfDMUkB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 13 Apr 2019 16:40:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40311 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727113AbfDMUkA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 13 Apr 2019 16:40:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 74E5B3092674;
        Sat, 13 Apr 2019 20:40:00 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-44.ams2.redhat.com [10.36.116.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EE7E860BE2;
        Sat, 13 Apr 2019 20:39:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: fusb302: Implement start_srp_connection_detect
Date:   Sat, 13 Apr 2019 22:39:54 +0200
Message-Id: <20190413203955.10788-2-hdegoede@redhat.com>
In-Reply-To: <20190413203955.10788-1-hdegoede@redhat.com>
References: <20190413203955.10788-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 13 Apr 2019 20:40:00 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413203954.VQQ0p7pVeC4KBrqGAvZyeyfHYC6Gd0r0_60R3y1_FJ8@z>

When in single role port mode, we most start single-role toggling to
get an interrupt when a device / cable gets plugged into the port.

This commit implements the tcpc_dev start_srp_connection_detect callback
for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 6ea6199caafa..30413a45104f 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -876,6 +876,34 @@ static int tcpm_set_roles(struct tcpc_dev *dev, bool attached,
 	return ret;
 }
 
+static int tcpm_start_srp_connection_detect(struct tcpc_dev *dev,
+					    enum typec_cc_status cc)
+{
+	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
+						 tcpc_dev);
+	int ret = 0;
+
+	mutex_lock(&chip->lock);
+	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
+	if (ret < 0) {
+		fusb302_log(chip, "unable to set src current %s, ret=%d",
+			    typec_cc_status_name[cc], ret);
+		goto done;
+	}
+	ret = fusb302_set_toggling(chip, (cc == TYPEC_CC_RD) ?
+					 TOGGLING_MODE_SNK : TOGGLING_MODE_SRC);
+	if (ret < 0) {
+		fusb302_log(chip,
+			    "unable to start srp toggling, ret=%d", ret);
+		goto done;
+	}
+	fusb302_log(chip, "start srp toggling");
+done:
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
 static int tcpm_start_drp_toggling(struct tcpc_dev *dev,
 				   enum typec_cc_status cc)
 {
@@ -1095,6 +1123,8 @@ static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
 	fusb302_tcpc_dev->set_pd_rx = tcpm_set_pd_rx;
 	fusb302_tcpc_dev->set_roles = tcpm_set_roles;
 	fusb302_tcpc_dev->start_drp_toggling = tcpm_start_drp_toggling;
+	fusb302_tcpc_dev->start_srp_connection_detect =
+					tcpm_start_srp_connection_detect;
 	fusb302_tcpc_dev->pd_transmit = tcpm_pd_transmit;
 }
 
-- 
2.21.0

