Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DC0C47083
	for <linux-usb@archiver.kernel.org>; Fri,  4 Jun 2021 13:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB1E06140F
	for <linux-usb@archiver.kernel.org>; Fri,  4 Jun 2021 13:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbhFDNoq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 4 Jun 2021 09:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbhFDNom (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 09:44:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C01C061283
        for <linux-usb@vger.kernel.org>; Fri,  4 Jun 2021 06:42:55 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lpA63-00072k-H3; Fri, 04 Jun 2021 15:42:47 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lpA61-0000f3-G7; Fri, 04 Jun 2021 15:42:45 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v1 0/7] port asix ax88772 to the PHYlib
Date:   Fri,  4 Jun 2021 15:42:37 +0200
Message-Id: <20210604134244.2467-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Port ax88772 part of asix driver to the phylib to be able to use more
advanced external PHY attached to this controller.

Oleksij Rempel (7):
  net: usb: asix: ax88772_bind: use devm_kzalloc() instead of kzalloc()
  net: usb: asix: ax88772: add phylib support
  net: usb/phy: asix: add support for ax88772A/C PHYs
  net: usb: asix: ax88772: add generic selftest support
  net: usb: asix: add error handling for asix_mdio_* functions
  net: phy: do not print dump stack if device was removed
  usbnet: run unbind() before unregister_netdev()

 drivers/net/phy/ax88796b.c     |  74 ++++++++++++++++-
 drivers/net/phy/phy.c          |   3 +
 drivers/net/usb/Kconfig        |   2 +
 drivers/net/usb/asix.h         |  10 +++
 drivers/net/usb/asix_common.c  |  68 +++++++++++++--
 drivers/net/usb/asix_devices.c | 148 +++++++++++++++++++++++----------
 drivers/net/usb/ax88172a.c     |  14 ----
 drivers/net/usb/usbnet.c       |   6 +-
 8 files changed, 253 insertions(+), 72 deletions(-)

-- 
2.29.2

