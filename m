Return-Path: <SRS0=dNjG=IG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842C5C433E0
	for <linux-usb@archiver.kernel.org>; Mon,  8 Mar 2021 06:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40B1C651F7
	for <linux-usb@archiver.kernel.org>; Mon,  8 Mar 2021 06:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbhCHGfg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Mar 2021 01:35:36 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:49092 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232629AbhCHGfg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Mar 2021 01:35:36 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UQr4v4L_1615185332;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UQr4v4L_1615185332)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 08 Mar 2021 14:35:32 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     linux@roeck-us.net
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH v2] usb: typec: tcpm: turn tcpm_ams_finish into void function
Date:   Mon,  8 Mar 2021 14:35:30 +0800
Message-Id: <1615185330-118246-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This function always return '0' and no callers use the return value.
So make it a void function.

This eliminates the following coccicheck warning:
./drivers/usb/typec/tcpm/tcpm.c:778:5-8: Unneeded variable: "ret".
Return "0" on line 794

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---

Change in v2:
-remove the unnecessary return statement

 drivers/usb/typec/tcpm/tcpm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index be0b646..8159229 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -773,10 +773,8 @@ static enum typec_cc_status tcpm_rp_cc(struct tcpm_port *port)
 	return TYPEC_CC_RP_DEF;
 }
 
-static int tcpm_ams_finish(struct tcpm_port *port)
+static void tcpm_ams_finish(struct tcpm_port *port)
 {
-	int ret = 0;
-
 	tcpm_log(port, "AMS %s finished", tcpm_ams_str[port->ams]);
 
 	if (port->pd_capable && port->pwr_role == TYPEC_SOURCE) {
@@ -790,8 +788,6 @@ static int tcpm_ams_finish(struct tcpm_port *port)
 
 	port->in_ams = false;
 	port->ams = NONE_AMS;
-
-	return ret;
 }
 
 static int tcpm_pd_transmit(struct tcpm_port *port,
-- 
1.8.3.1

