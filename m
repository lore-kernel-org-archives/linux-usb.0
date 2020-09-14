Return-Path: <SRS0=w69b=CX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92073C433E2
	for <linux-usb@archiver.kernel.org>; Mon, 14 Sep 2020 16:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00FED2193E
	for <linux-usb@archiver.kernel.org>; Mon, 14 Sep 2020 16:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="nATTfBxo";
	dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="nATTfBxo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINQ5G (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 14 Sep 2020 12:57:06 -0400
Received: from node.akkea.ca ([192.155.83.177]:44354 "EHLO node.akkea.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgINQ4x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Sep 2020 12:56:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by node.akkea.ca (Postfix) with ESMTP id 8A0E14E2060;
        Mon, 14 Sep 2020 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1600102042; bh=TewfR8oNdgA6QFyKNMPw5YQXF3SDE1d3KTQlTx9hz8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nATTfBxoj2s/kL5tG+9lYvToGQgSHelE6bdq1V4BUpqCcrfGSCJnP1Xhmp6cJvsRw
         QNC3NgXsSaHOvqeynQvBca+D2+0i1KihBcYlw3bPgEVSYYeqmINSlus3qgu4iDObPv
         W+dGKn/aeqOQGULqqAtbcqHdVdkQ4O47VwUTQF5I=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
        by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nikiRblBkwHJ; Mon, 14 Sep 2020 16:47:22 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net [70.66.86.75])
        by node.akkea.ca (Postfix) with ESMTPSA id E64EB4E201A;
        Mon, 14 Sep 2020 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1600102042; bh=TewfR8oNdgA6QFyKNMPw5YQXF3SDE1d3KTQlTx9hz8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nATTfBxoj2s/kL5tG+9lYvToGQgSHelE6bdq1V4BUpqCcrfGSCJnP1Xhmp6cJvsRw
         QNC3NgXsSaHOvqeynQvBca+D2+0i1KihBcYlw3bPgEVSYYeqmINSlus3qgu4iDObPv
         W+dGKn/aeqOQGULqqAtbcqHdVdkQ4O47VwUTQF5I=
From:   Angus Ainslie <angus@akkea.ca>
To:     kernel@puri.sm
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bryan.odonoghue@linaro.org, Angus Ainslie <angus@akkea.ca>
Subject: [PATCH 3/4] usb: typec: tps6598x: Add the extcon USB chargers
Date:   Mon, 14 Sep 2020 09:46:38 -0700
Message-Id: <20200914164639.1487650-4-angus@akkea.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914164639.1487650-1-angus@akkea.ca>
References: <20200914164639.1487650-1-angus@akkea.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Notify extcon devcies that the charge current has changed

Signed-off-by: Angus Ainslie <angus@akkea.ca>
---
 drivers/usb/typec/tps6598x.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 3b06d43c810d..d5aa58c9da0a 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -240,17 +240,25 @@ static void tps6589x_set_extcon_state(struct tps6598x *tps,
 			    EXTCON_PROP_USB_VBUS_SRC,
 			    val);
 
+	extcon_set_state(tps->edev, EXTCON_CHG_USB_SDP, 0);
+	extcon_set_state(tps->edev, EXTCON_CHG_USB_DCP, 0);
+	extcon_set_state(tps->edev, EXTCON_CHG_USB_CDP, 0);
+	extcon_set_state(tps->edev, EXTCON_CHG_USB_SLOW, 0);
+	extcon_set_state(tps->edev, EXTCON_CHG_USB_FAST, 0);
+
 	switch (TPS_POWER_STATUS_PWROPMODE(pwr_status)) {
 	case TYPEC_PWR_MODE_USB:
-		max_current = 500;
+		max_current = val.intval = 500;
 		extcon_set_state(tps->edev, EXTCON_CHG_USB_SDP, state);
 		extcon_set_state(tps->edev, EXTCON_CHG_USB_SLOW, state);
 		break;
 	case TYPEC_PWR_MODE_1_5A:
-		max_current = 1500;
+		max_current = val.intval = 1500;
+		extcon_set_state(tps->edev, EXTCON_CHG_USB_CDP, state);
 		break;
 	case TYPEC_PWR_MODE_3_0A:
-		max_current = 3000;
+		max_current = val.intval = 3000;
+		extcon_set_state(tps->edev, EXTCON_CHG_USB_CDP, state);
 		break;
 	case TYPEC_PWR_MODE_PD:
 		max_current = 500;
@@ -265,10 +273,14 @@ static void tps6589x_set_extcon_state(struct tps6598x *tps,
 			    EXTCON_PROP_USB_VBUS_CURRENT,
 			    val);
 
-	extcon_sync(tps->edev, EXTCON_USB);
-	extcon_sync(tps->edev, EXTCON_USB_HOST);
 	extcon_sync(tps->edev, EXTCON_CHG_USB_SDP);
+	extcon_sync(tps->edev, EXTCON_CHG_USB_CDP);
+	extcon_sync(tps->edev, EXTCON_CHG_USB_DCP);
 	extcon_sync(tps->edev, EXTCON_CHG_USB_SLOW);
+	extcon_sync(tps->edev, EXTCON_CHG_USB_FAST);
+	/* do these last for extcon notifiers */
+	extcon_sync(tps->edev, EXTCON_USB);
+	extcon_sync(tps->edev, EXTCON_USB_HOST);
 }
 #endif
 
@@ -562,6 +574,8 @@ static const unsigned int tps6598x_extcon_cable[] = {
 	EXTCON_USB,
 	EXTCON_USB_HOST,
 	EXTCON_CHG_USB_SDP,
+	EXTCON_CHG_USB_CDP,
+	EXTCON_CHG_USB_DCP,
 	EXTCON_CHG_USB_SLOW,
 	EXTCON_CHG_USB_FAST,
 	EXTCON_NONE,
-- 
2.25.1

