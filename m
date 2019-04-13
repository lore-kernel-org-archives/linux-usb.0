Return-Path: <SRS0=jcui=SP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EEBC10F14
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 20:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF95820870
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 20:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfDMUkD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 13 Apr 2019 16:40:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37678 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727113AbfDMUkC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 13 Apr 2019 16:40:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1E2AE5946D;
        Sat, 13 Apr 2019 20:40:02 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-44.ams2.redhat.com [10.36.116.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B526C60BE2;
        Sat, 13 Apr 2019 20:40:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Kyle Tso <kyletso@google.com>, linux-usb@vger.kernel.org
Subject: [PATCH 3/3] usb: typec: fusb302: Revert "Resolve fixed power role contract setup"
Date:   Sat, 13 Apr 2019 22:39:55 +0200
Message-Id: <20190413203955.10788-3-hdegoede@redhat.com>
In-Reply-To: <20190413203955.10788-1-hdegoede@redhat.com>
References: <20190413203955.10788-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sat, 13 Apr 2019 20:40:02 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190413203955.kqsYGFyk-kp3HI0mZ29Sc8ou8YzqrFBdH0GeiSDVt1Y@z>

Some tcpc device-drivers need to explicitly be told to watch for connection
events, otherwise the tcpc will not generate any TCPM_CC_EVENTs and devices
being plugged into the Type-C port will not be noticed.

For dual-role ports tcpm_start_drp_toggling() is used to tell the tcpc to
watch for connection events. But for single-role ports we've so far been
falling back to just calling tcpm_set_cc(). For some tcpc-s such as the
fusb302 this is not enough and no TCPM_CC_EVENT will be generated.

Commit ea3b4d5523bc ("usb: typec: fusb302: Resolve fixed power role
contract setup") fixed SRPs not working because of this by making the
fusb302 driver start connection detection on every tcpm_set_cc() call.
It turns out this breaks src->snk power-role swapping because during the
swap we first set the Cc pins to Rp, calling set_cc, and then send a PS_RDY
message. But the fusb302 cannot send PD messages while its toggling engine
is active, so sending the PS_RDY message fails.

Struct tcpc_dev now has a new start_srp_connection_detect callback and
fusb302.c now implements this. This callback gets called when we the
fusb302 needs to start connection detection, fixing fusb302 SRPs not
seeing connected devices.

This allows us to revert the changes to fusb302's set_cc implementation,
making it once again purely setup the Cc-s and matching disconnect
detection, fixing src->snk power-role swapping no longer working.

Note that since the code was refactored in between, codewise this is not a
straight forward revert. Functionality wise this is a straight revert and
the original functionality is fully restored.

Fixes: ea3b4d5523bc ("usb: typec: fusb302: Resolve fixed power role ...")
Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 55 ++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 30413a45104f..96da41f82834 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -606,19 +606,16 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
 			    FUSB_REG_SWITCHES0_CC2_PU_EN |
 			    FUSB_REG_SWITCHES0_CC1_PD_EN |
 			    FUSB_REG_SWITCHES0_CC2_PD_EN;
-	u8 switches0_data = 0x00;
+	u8 rd_mda, switches0_data = 0x00;
 	int ret = 0;
-	enum toggling_mode mode;
 
 	mutex_lock(&chip->lock);
 	switch (cc) {
 	case TYPEC_CC_OPEN:
-		mode = TOGGLING_MODE_OFF;
 		break;
 	case TYPEC_CC_RD:
 		switches0_data |= FUSB_REG_SWITCHES0_CC1_PD_EN |
 				  FUSB_REG_SWITCHES0_CC2_PD_EN;
-		mode = TOGGLING_MODE_SNK;
 		break;
 	case TYPEC_CC_RP_DEF:
 	case TYPEC_CC_RP_1_5:
@@ -626,7 +623,6 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
 		switches0_data |= (chip->cc_polarity == TYPEC_POLARITY_CC1) ?
 				  FUSB_REG_SWITCHES0_CC1_PU_EN :
 				  FUSB_REG_SWITCHES0_CC2_PU_EN;
-		mode = TOGGLING_MODE_SRC;
 		break;
 	default:
 		fusb302_log(chip, "unsupported cc value %s",
@@ -637,6 +633,12 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
 
 	fusb302_log(chip, "cc := %s", typec_cc_status_name[cc]);
 
+	ret = fusb302_set_toggling(chip, TOGGLING_MODE_OFF);
+	if (ret < 0) {
+		fusb302_log(chip, "cannot set toggling mode, ret=%d", ret);
+		goto done;
+	}
+
 	ret = fusb302_i2c_mask_write(chip, FUSB_REG_SWITCHES0,
 				     switches0_mask, switches0_data);
 	if (ret < 0) {
@@ -655,10 +657,45 @@ static int tcpm_set_cc(struct tcpc_dev *dev, enum typec_cc_status cc)
 		goto done;
 	}
 
-	ret = fusb302_set_toggling(chip, mode);
-	if (ret < 0)
-		fusb302_log(chip, "cannot set toggling mode, ret=%d", ret);
-
+	/* enable/disable interrupts, BC_LVL for SNK and COMP_CHNG for SRC */
+	switch (cc) {
+	case TYPEC_CC_RP_DEF:
+	case TYPEC_CC_RP_1_5:
+	case TYPEC_CC_RP_3_0:
+		rd_mda = rd_mda_value[cc_src_current[cc]];
+		ret = fusb302_i2c_write(chip, FUSB_REG_MEASURE, rd_mda);
+		if (ret < 0) {
+			fusb302_log(chip,
+				    "cannot set SRC measure value, ret=%d",
+				    ret);
+			goto done;
+		}
+		ret = fusb302_i2c_mask_write(chip, FUSB_REG_MASK,
+					     FUSB_REG_MASK_BC_LVL |
+					     FUSB_REG_MASK_COMP_CHNG,
+					     FUSB_REG_MASK_COMP_CHNG);
+		if (ret < 0) {
+			fusb302_log(chip, "cannot set SRC interrupt, ret=%d",
+				    ret);
+			goto done;
+		}
+		chip->intr_comp_chng = true;
+		break;
+	case TYPEC_CC_RD:
+		ret = fusb302_i2c_mask_write(chip, FUSB_REG_MASK,
+					     FUSB_REG_MASK_BC_LVL |
+					     FUSB_REG_MASK_COMP_CHNG,
+					     FUSB_REG_MASK_BC_LVL);
+		if (ret < 0) {
+			fusb302_log(chip, "cannot set SRC interrupt, ret=%d",
+				    ret);
+			goto done;
+		}
+		chip->intr_bc_lvl = true;
+		break;
+	default:
+		break;
+	}
 done:
 	mutex_unlock(&chip->lock);
 
-- 
2.21.0

