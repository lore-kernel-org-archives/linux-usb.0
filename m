Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E99C433F5
	for <linux-usb@archiver.kernel.org>; Mon, 20 Sep 2021 14:24:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECDFC610CE
	for <linux-usb@archiver.kernel.org>; Mon, 20 Sep 2021 14:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbhITOZp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:25:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:20391 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhITOZp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 10:25:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286817097"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="286817097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="612525272"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 07:24:16 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Ulrich Huber <ulrich@huberulrich.de>, linux-usb@vger.kernel.org
Subject: [PATCH 1/7] usb: typec: ucsi: Always cancel the command if PPM reports BUSY condition
Date:   Mon, 20 Sep 2021 17:24:13 +0300
Message-Id: <20210920142419.54493-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it possible to execute next command immediately
after the busy condition.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5ef5bd0e87cf2..ffb5be51daf85 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -128,8 +128,10 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (ret)
 		return ret;
 
-	if (cci & UCSI_CCI_BUSY)
+	if (cci & UCSI_CCI_BUSY) {
+		ucsi->ops->async_write(ucsi, UCSI_CANCEL, NULL, 0);
 		return -EBUSY;
+	}
 
 	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
-- 
2.33.0

