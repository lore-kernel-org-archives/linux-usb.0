Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FD1C47095
	for <linux-usb@archiver.kernel.org>; Mon,  7 Jun 2021 11:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8256C61205
	for <linux-usb@archiver.kernel.org>; Mon,  7 Jun 2021 11:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhFGLCE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 7 Jun 2021 07:02:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:16555 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230428AbhFGLCD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:02:03 -0400
IronPort-SDR: VC9+rep48R6BI8ik9livKizIDuYfOevEygiv8CMixm2SthZgi37gxY/ZgYDc4BmBA7K0BtGsrf
 ftFv0xi79JwA==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="191928008"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="191928008"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 04:00:09 -0700
IronPort-SDR: 0iuRss4nm8UWVvxt4uvwRi6x1fL9CF4rIlflwSXfWluxXSNmJTS+V842Vwo9zKNNTUdIfxtIT4
 tn1dXdUCocww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="618915261"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2021 04:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 78FAD30E; Mon,  7 Jun 2021 14:00:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Subject: [PATCH 4/5] thunderbolt: No need to include <linux/acpi.h> in usb4_port.c
Date:   Mon,  7 Jun 2021 14:00:29 +0300
Message-Id: <20210607110030.38664-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This include is not needed so drop it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4_port.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index 765c74179598..29e2a4f9c9f5 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -6,7 +6,6 @@
  * Author: Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
-#include <linux/acpi.h>
 #include <linux/pm_runtime.h>
 
 #include "tb.h"
-- 
2.30.2

