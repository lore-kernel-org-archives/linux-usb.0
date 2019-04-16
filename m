Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA36CC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9ADE20868
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 20:08:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfDPUIA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 16:08:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49458 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727136AbfDPUH7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 16:07:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C8763C04959F;
        Tue, 16 Apr 2019 20:07:59 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6E2A85D9D3;
        Tue, 16 Apr 2019 20:07:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: fusb302: Implement start_toggling for all port-types
Date:   Tue, 16 Apr 2019 22:07:53 +0200
Message-Id: <20190416200754.2826-2-hdegoede@redhat.com>
In-Reply-To: <20190416200754.2826-1-hdegoede@redhat.com>
References: <20190416200754.2826-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 16 Apr 2019 20:07:59 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416200753.pCUVp__YJtV1EGLejofVfu4O57Iss6nMDUS9hNYYX_8@z>

When in single-role port mode, we must start single-role toggling to
get an interrupt when a device / cable gets plugged into the port.

This commit modifies the fusb302 start_toggling implementation to
start toggling for all port-types, so that connection-detection works
on single-role ports too.

Fixes: ea3b4d5523bc("usb: typec: fusb302: Resolve fixed power role ...")
Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Adjust for the tcpm core renaming start_drp_toggling to start_toggling,
 instead of adding a new start_srp_connection_detect callback
---
 drivers/usb/typec/tcpm/fusb302.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 6d83891cc895..ba030b03d156 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -882,10 +882,20 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 {
 	struct fusb302_chip *chip = container_of(dev, struct fusb302_chip,
 						 tcpc_dev);
+	enum toggling_mode mode = TOGGLING_MODE_OFF;
 	int ret = 0;
 
-	if (port_type != TYPEC_PORT_DRP)
-		return -EOPNOTSUPP;
+	switch (port_type) {
+	case TYPEC_PORT_SRC:
+		mode = TOGGLING_MODE_SRC;
+		break;
+	case TYPEC_PORT_SNK:
+		mode = TOGGLING_MODE_SNK;
+		break;
+	case TYPEC_PORT_DRP:
+		mode = TOGGLING_MODE_DRP;
+		break;
+	}
 
 	mutex_lock(&chip->lock);
 	ret = fusb302_set_src_current(chip, cc_src_current[cc]);
@@ -894,7 +904,7 @@ static int tcpm_start_toggling(struct tcpc_dev *dev,
 			    typec_cc_status_name[cc], ret);
 		goto done;
 	}
-	ret = fusb302_set_toggling(chip, TOGGLING_MODE_DRP);
+	ret = fusb302_set_toggling(chip, mode);
 	if (ret < 0) {
 		fusb302_log(chip,
 			    "unable to start drp toggling, ret=%d", ret);
-- 
2.21.0

