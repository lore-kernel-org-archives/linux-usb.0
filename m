Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC48C43217
	for <linux-usb@archiver.kernel.org>; Thu,  1 Dec 2022 17:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiLARzi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 1 Dec 2022 12:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiLARz3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Dec 2022 12:55:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1133723E88
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 09:55:28 -0800 (PST)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1p0nmQ-0001ds-9O; Thu, 01 Dec 2022 18:55:26 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     linux-usb@vger.kernel.org, netdev@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH 1/2] net: asix: Simplify return value check after asix_check_host_enable
Date:   Thu,  1 Dec 2022 18:55:24 +0100
Message-Id: <20221201175525.2733125-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Any negative return value from this function is indicative of an
error. Simplify the condition to cover all possible error codes.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/net/usb/asix_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 72ffc89b477a..be1e103b7a95 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -504,7 +504,7 @@ static int __asix_mdio_read(struct net_device *netdev, int phy_id, int loc,
 	mutex_lock(&dev->phy_mutex);
 
 	ret = asix_check_host_enable(dev, in_pm);
-	if (ret == -ENODEV || ret == -ETIMEDOUT) {
+	if (ret < 0) {
 		mutex_unlock(&dev->phy_mutex);
 		return ret;
 	}
@@ -542,7 +542,7 @@ static int __asix_mdio_write(struct net_device *netdev, int phy_id, int loc,
 	mutex_lock(&dev->phy_mutex);
 
 	ret = asix_check_host_enable(dev, in_pm);
-	if (ret == -ENODEV)
+	if (ret < 0)
 		goto out;
 
 	ret = asix_write_cmd(dev, AX_CMD_WRITE_MII_REG, phy_id, (__u16)loc, 2,
-- 
2.30.2

