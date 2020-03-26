Return-Path: <SRS0=73Qb=5L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C804BC43331
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 13:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4C9220774
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 13:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgCZNq2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Mar 2020 09:46:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:33209 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727612AbgCZNq1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 09:46:27 -0400
IronPort-SDR: cHaWztaLhBkRToQvm48VjSxKzWW5gomuhQuVlQ4Wy3AwEim62CyO5tIf0etburY1nfLs6YRWXO
 K2fqDWIoes5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 06:46:27 -0700
IronPort-SDR: ZpmuSC4fuBcgpGPshhuzDZdW5IvUMKxuf6RMeKC4R0n6v8NPf4swbbCGDoTE68wr9twRUfdPEL
 2lzQORDjbCjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; 
   d="scan'208";a="265870539"
Received: from otc-chromeosbuild-1.jf.intel.com ([10.54.30.83])
  by orsmga002.jf.intel.com with ESMTP; 26 Mar 2020 06:46:26 -0700
From:   Azhar Shaikh <azhar.shaikh@intel.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, azhar.shaikh@intel.com
Subject: [PATCH] usb: typec: Correct the documentation for typec_cable_put()
Date:   Thu, 26 Mar 2020 06:46:33 -0700
Message-Id: <20200326134633.26780-1-azhar.shaikh@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

typec_cable_put() function had typec_cable_get in it's documentation.
Change it to reflect the correct name.

Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>
---
 drivers/usb/typec/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 7c44e930602f..a7ca415ad1ef 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -859,7 +859,7 @@ struct typec_cable *typec_cable_get(struct typec_port *port)
 EXPORT_SYMBOL_GPL(typec_cable_get);
 
 /**
- * typec_cable_get - Decrement the reference count on USB Type-C cable
+ * typec_cable_put - Decrement the reference count on USB Type-C cable
  * @cable: The USB Type-C cable
  */
 void typec_cable_put(struct typec_cable *cable)
-- 
2.17.1

