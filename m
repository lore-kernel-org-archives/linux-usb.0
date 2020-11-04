Return-Path: <SRS0=Q74q=EK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79BDC2D0A3
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 14:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A35320659
	for <linux-usb@archiver.kernel.org>; Wed,  4 Nov 2020 14:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgKDOAf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:00:35 -0500
Received: from mga11.intel.com ([192.55.52.93]:11983 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730074AbgKDOAe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Nov 2020 09:00:34 -0500
IronPort-SDR: yGGcITX5S5aUVzuNfIu10xaHHyvhrORMg7CCWSTapSKNHpAQPUrdIec468AVK5uV21iKJh+bR4
 FU3mLDcfWxzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="165711170"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="165711170"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 06:00:33 -0800
IronPort-SDR: SMt0g0IDCdg3TgoxxBQ+WVpNwYkpkSq/7d90U6faiPxZnf5ffOfgpsqBGirdeqTfia6/b9Cq2G
 XuQ9ctNSkOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="306424180"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2020 06:00:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id F19411C5; Wed,  4 Nov 2020 16:00:30 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        netdev@vger.kernel.org
Subject: [PATCH 03/10] thunderbolt: Create XDomain devices for loops back to the host
Date:   Wed,  4 Nov 2020 17:00:23 +0300
Message-Id: <20201104140030.6853-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104140030.6853-1-mika.westerberg@linux.intel.com>
References: <20201104140030.6853-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It is perfectly possible to have loops back from the routers to the
host, or even from one host port to another. Instead of ignoring these,
we create XDomain devices for each. This allows creating services such
as DMA traffic test that is used in manufacturing for example.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index e2866248f389..7c61d2aeaac9 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -960,10 +960,8 @@ static void tb_xdomain_get_uuid(struct work_struct *work)
 		return;
 	}
 
-	if (uuid_equal(&uuid, xd->local_uuid)) {
+	if (uuid_equal(&uuid, xd->local_uuid))
 		dev_dbg(&xd->dev, "intra-domain loop detected\n");
-		return;
-	}
 
 	/*
 	 * If the UUID is different, there is another domain connected
-- 
2.28.0

