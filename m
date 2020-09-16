Return-Path: <SRS0=9a5V=CZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482BFC35256
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 08:16:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15B1320872
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 08:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgIPIQ1 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Sep 2020 04:16:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:38803 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726425AbgIPIQZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:16:25 -0400
IronPort-SDR: L2kTPhGyJc6zXx2q93r/Jh863X0DloHy0ivxibR3GVaCZCUI+nmZWv2i1UVyxE9G37o5JOZkgo
 EZuVfa8RJI4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147174211"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="147174211"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 01:16:24 -0700
IronPort-SDR: nrkx8zL7/kVq08FEOqCaZARcNvsdtiVZeMJ03wJ+B7PONF+QL29/bljg2twPE8PY/Y+ZvW6Xtu
 j6CpagDfKU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409471850"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 01:16:23 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 3/5] usb: typec: intel_pmc_mux: Add dependency on ACPI
Date:   Wed, 16 Sep 2020 11:16:15 +0300
Message-Id: <20200916081617.17146-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
References: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the driver now needs to find the IOM ACPI node, the
driver depends on ACPI. Without the dependency set, the
driver will only fail to compile when ACPI is not enabled.

Fixes: 43d596e32276 ("usb: typec: intel_pmc_mux: Check the port status before connect")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index a4dbd11f8ee26..edead555835e2 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -11,6 +11,7 @@ config TYPEC_MUX_PI3USB30532
 
 config TYPEC_MUX_INTEL_PMC
 	tristate "Intel PMC mux control"
+	depends on ACPI
 	depends on INTEL_SCU_IPC
 	select USB_ROLE_SWITCH
 	help
-- 
2.28.0

