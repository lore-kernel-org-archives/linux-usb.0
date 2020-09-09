Return-Path: <SRS0=YJIA=CS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C2EC43461
	for <linux-usb@archiver.kernel.org>; Wed,  9 Sep 2020 11:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15E2621D7B
	for <linux-usb@archiver.kernel.org>; Wed,  9 Sep 2020 11:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgIILB6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Sep 2020 07:01:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:60640 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727893AbgIILAU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:00:20 -0400
IronPort-SDR: 4+1h/rOKHltkhKnLk9c3sXMQCOfuI5Sgo0U2dG6yzl0GkzCrhCeHbfCtEKjumLrRnKOecwLkL9
 Qs1ZjpoURgnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219865932"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="219865932"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:05 -0700
IronPort-SDR: GLECYUfF+Em21M5+RmHlv+k0qoL1gx4ABgSD+5pvNZ09+20j8LFewXYsgCN94N61xwDSWD00d7
 rCk5MWkATP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="284828211"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Sep 2020 04:00:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1C1FD29A; Wed,  9 Sep 2020 14:00:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/7] thunderbolt: Use "if USB4" instead of "depends on" in Kconfig
Date:   Wed,  9 Sep 2020 13:59:57 +0300
Message-Id: <20200909110001.71603-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This groups the USB4 options more nicely, and also does not require that
every config option lists explicit depends on USB4.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index afa3551633aa..7fc058f81d00 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -16,9 +16,10 @@ menuconfig USB4
 	  To compile this driver a module, choose M here. The module will be
 	  called thunderbolt.
 
+if USB4
+
 config USB4_DEBUGFS_WRITE
 	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
-	depends on USB4
 	help
 	  Enables writing to device configuration registers through
 	  debugfs interface.
@@ -28,5 +29,6 @@ config USB4_DEBUGFS_WRITE
 
 config USB4_KUNIT_TEST
 	bool "KUnit tests"
-	depends on USB4
 	depends on KUNIT=y
+
+endif # USB4
-- 
2.28.0

