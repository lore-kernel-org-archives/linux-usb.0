Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DFCC433E6
	for <linux-usb@archiver.kernel.org>; Tue, 19 Jan 2021 08:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3F6823135
	for <linux-usb@archiver.kernel.org>; Tue, 19 Jan 2021 08:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbhASIgY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 19 Jan 2021 03:36:24 -0500
Received: from mga03.intel.com ([134.134.136.65]:35806 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731464AbhASIgE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Jan 2021 03:36:04 -0500
IronPort-SDR: F4pVrcFL4yvdDPYz8eYJr8De5eryRK8JzRj+TIF0kx+FcOZaTRBCuyYOwQ4cWZhw4pRjiUT/9Y
 0AsHmOjnSnYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="178982810"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="178982810"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 00:34:08 -0800
IronPort-SDR: UgEStLk8aXg638yHDbWB4vOjHZoYpi4iOjmZtTUu4ho6eUfnx2aGLdcTQtpSNNwrKneA6tdERP
 x8mzmMJdtQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="466609754"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2021 00:34:06 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mayank Rana <mrana@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] usb: typec: ucsi: Add conditional dependency on USB role switch
Date:   Tue, 19 Jan 2021 11:34:05 +0300
Message-Id: <20210119083405.18325-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Preventing the driver from being built-in when USB Role
Switch Class is being build as module. That fixes a
potential undefined reference error.

Fixes: 89795852c9c4 ("usb: typec: ucsi: Add support for USB role switch")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 2192d7c4fec7f..5e9b37b3f25e1 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -3,6 +3,7 @@
 config TYPEC_UCSI
 	tristate "USB Type-C Connector System Software Interface driver"
 	depends on !CPU_BIG_ENDIAN
+	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
 	help
 	  USB Type-C Connector System Software Interface (UCSI) is a
 	  specification for an interface that allows the operating system to
-- 
2.29.2

