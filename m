Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A5DC4320E
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 14:31:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11A1960EE9
	for <linux-usb@archiver.kernel.org>; Thu, 26 Aug 2021 14:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242819AbhHZOck (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:32:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:40917 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242737AbhHZOck (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 10:32:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217789893"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="217789893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="598500999"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2021 07:31:51 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 4/7] usb: typec: ucsi: acpi: Reduce the command completion timeout
Date:   Thu, 26 Aug 2021 17:31:43 +0300
Message-Id: <20210826143146.25799-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
References: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The huge delay was there to workaround a problem where the
firmware did not report that it was busy with the alternate
mode commands. Now that the alternate modes are polled, the
delay can be dropped.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 04976435ad736..6771f05e32c29 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -78,7 +78,7 @@ static int ucsi_acpi_sync_write(struct ucsi *ucsi, unsigned int offset,
 	if (ret)
 		goto out_clear_bit;
 
-	if (!wait_for_completion_timeout(&ua->complete, 60 * HZ))
+	if (!wait_for_completion_timeout(&ua->complete, HZ))
 		ret = -ETIMEDOUT;
 
 out_clear_bit:
-- 
2.32.0

