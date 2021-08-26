Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D4FC43214
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 14:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7952360FC1
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 14:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242807AbhHZOci (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:32:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:40917 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242787AbhHZOch (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 10:32:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217789876"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="217789876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="598500957"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2021 07:31:47 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/7] usb: typec: ucsi: Don't stop alt mode registration on busy condition
Date:   Thu, 26 Aug 2021 17:31:41 +0300
Message-Id: <20210826143146.25799-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
References: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the PPM says it's busy, we can now simply try again.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ffb5be51daf85..a35efd8174bd4 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -437,6 +437,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
 		len = ucsi_send_command(con->ucsi, command, alt, sizeof(alt));
+		if (len == -EBUSY)
+			continue;
 		if (len <= 0)
 			return len;
 
-- 
2.32.0

