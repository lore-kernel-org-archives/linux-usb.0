Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0D0C43332
	for <linux-usb@archiver.kernel.org>; Thu,  4 Mar 2021 12:34:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57C5D64F3A
	for <linux-usb@archiver.kernel.org>; Thu,  4 Mar 2021 12:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240605AbhCDMdW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 4 Mar 2021 07:33:22 -0500
Received: from mga18.intel.com ([134.134.136.126]:37321 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240614AbhCDMdO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Mar 2021 07:33:14 -0500
IronPort-SDR: v4NoApf6/xB1tyMgpITHM6hRz0Ls4bigAbA6Z4/Ok4YM86SLuCu3DzvrgFBerBRJpX5GlOdgaq
 NVg+Qj+HD3fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="175035984"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="175035984"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:31:29 -0800
IronPort-SDR: A6NQ3MoiuWyWnM+uvFHbs8bwjUXBDkmHZ5ScbetPz6CjODxeplW4Q/kTErMhemYeBdwpb9v4Qq
 zJDopct6GXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="400589989"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 04 Mar 2021 04:31:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 589172B7; Thu,  4 Mar 2021 14:31:26 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Subject: [PATCH 04/18] Documentation / thunderbolt: Drop speed/lanes entries for XDomain
Date:   Thu,  4 Mar 2021 15:31:11 +0300
Message-Id: <20210304123125.43630-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
References: <20210304123125.43630-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These are actually not needed as we already have similar entries that
apply to all devices on the Thunderbolt bus.

Cc: Isaac Hazan <isaac.hazan@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 .../ABI/testing/sysfs-bus-thunderbolt         | 28 -------------------
 1 file changed, 28 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index d7f09d011b6d..bfa4ca6f3fc1 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -1,31 +1,3 @@
-What:		/sys/bus/thunderbolt/devices/<xdomain>/rx_speed
-Date:		Feb 2021
-KernelVersion:	5.11
-Contact:	Isaac Hazan <isaac.hazan@intel.com>
-Description:	This attribute reports the XDomain RX speed per lane.
-		All RX lanes run at the same speed.
-
-What:		/sys/bus/thunderbolt/devices/<xdomain>/rx_lanes
-Date:		Feb 2021
-KernelVersion:	5.11
-Contact:	Isaac Hazan <isaac.hazan@intel.com>
-Description:	This attribute reports the number of RX lanes the XDomain
-		is using simultaneously through its upstream port.
-
-What:		/sys/bus/thunderbolt/devices/<xdomain>/tx_speed
-Date:		Feb 2021
-KernelVersion:	5.11
-Contact:	Isaac Hazan <isaac.hazan@intel.com>
-Description:	This attribute reports the XDomain TX speed per lane.
-		All TX lanes run at the same speed.
-
-What:		/sys/bus/thunderbolt/devices/<xdomain>/tx_lanes
-Date:		Feb 2021
-KernelVersion:	5.11
-Contact:	Isaac Hazan <isaac.hazan@intel.com>
-Description:	This attribute reports number of TX lanes the XDomain
-		is using simultaneously through its upstream port.
-
 What: /sys/bus/thunderbolt/devices/.../domainX/boot_acl
 Date:		Jun 2018
 KernelVersion:	4.17
-- 
2.30.1

