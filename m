Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A41C7EE43
	for <linux-usb@archiver.kernel.org>; Mon, 12 Jun 2023 08:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbjFLIxm (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbjFLIxH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:07 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D722D7E
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559946; x=1718095946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+lLQwjuDjVIyIFbMo+no2sdW8t6c99YOhn+al4CK9rw=;
  b=kyBMXPENEY7uXy+Qv7bVeQn7jpK1SiGQcJYERq42qJNAjGE0TZC2mvDh
   XLuPKIXlylSlIF7nZ3QRu27QX3attqUwYGiGe7L8FTkSJZSHEqfHr43hq
   95LiTnBP6PZlCjBPnZMsrDkARvV8pRfgsHIvR6B2Rg+Xkfl0ScD0RS3zy
   dltDcCnq5fbXjoASKvQZ+Sm/pB4dE4uqyHjvn3ysRdMwdlOGRHVDtXHPV
   AqqXLQN2yY/bQqRajQjKFWAIZjJ90z+zDADMd5/qR8Oocj88tpHUR6Nbl
   dqKmLtbQLAfbJE38LhD5maW9k+qV+48C8TOFfzgDNgi+Nd4sGL7Jo03Sk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627295"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627295"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247763"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247763"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C246A85F; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 11/20] thunderbolt: Fix PCIe adapter capability length for USB4 v2 routers
Date:   Mon, 12 Jun 2023 11:21:36 +0300
Message-Id: <20230612082145.62218-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@linux.intel.com>

For USB4 v2 routers, the PCIe adapter capability length is longer.
Display the correct capability length in the debugfs register dump.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 78bcf77831fe..c9ddd49138d8 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -14,7 +14,8 @@
 #include "tb.h"
 #include "sb_regs.h"
 
-#define PORT_CAP_PCIE_LEN	1
+#define PORT_CAP_V1_PCIE_LEN	1
+#define PORT_CAP_V2_PCIE_LEN	2
 #define PORT_CAP_POWER_LEN	2
 #define PORT_CAP_LANE_LEN	3
 #define PORT_CAP_USB3_LEN	5
@@ -1175,7 +1176,10 @@ static void port_cap_show(struct tb_port *port, struct seq_file *s,
 
 	case TB_PORT_CAP_ADAP:
 		if (tb_port_is_pcie_down(port) || tb_port_is_pcie_up(port)) {
-			length = PORT_CAP_PCIE_LEN;
+			if (usb4_switch_version(port->sw) < 2)
+				length = PORT_CAP_V1_PCIE_LEN;
+			else
+				length = PORT_CAP_V2_PCIE_LEN;
 		} else if (tb_port_is_dpin(port)) {
 			if (usb4_switch_version(port->sw) < 2)
 				length = PORT_CAP_DP_V1_LEN;
-- 
2.39.2

