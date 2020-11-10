Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0ACC55ABD
	for <linux-usb@archiver.kernel.org>; Tue, 10 Nov 2020 09:20:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F38AE2080A
	for <linux-usb@archiver.kernel.org>; Tue, 10 Nov 2020 09:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgKJJUC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 10 Nov 2020 04:20:02 -0500
Received: from mga07.intel.com ([134.134.136.100]:23648 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727991AbgKJJUC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 04:20:02 -0500
IronPort-SDR: OS/klgH8nyAVhn+JmT1GDj3nvrdPi4K5DgGx5z+oTZKz9lKaSlNMg7EjMP7JmyDrKt95gYeN34
 8SJO6QsCY1Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="234110519"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="234110519"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 01:20:00 -0800
IronPort-SDR: g52cRAQDOgpdiXk27dOVIMyGvO5rHih1Pm698eEyVdmH5wOUAWSRa35FPjV5hGkhTGUIpkjy3l
 rdEQuUuaIe6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="360039247"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 10 Nov 2020 01:19:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4E11327E; Tue, 10 Nov 2020 11:19:57 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Isaac Hazan <isaac.hazan@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        netdev@vger.kernel.org
Subject: [PATCH v2 02/10] thunderbolt: Find XDomain by route instead of UUID
Date:   Tue, 10 Nov 2020 12:19:49 +0300
Message-Id: <20201110091957.17472-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110091957.17472-1-mika.westerberg@linux.intel.com>
References: <20201110091957.17472-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We are going to represent loops back to the host also as XDomains and
they all have the same (host) UUID, so finding them needs to use route
string instead. This also requires that we check if the XDomain device
is added to the bus before its properties can be updated. Otherwise the
remote UUID might not be populated yet.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>
---
 drivers/thunderbolt/xdomain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 48907853732a..e436e9efa7e7 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -587,8 +587,6 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		break;
 
 	case PROPERTIES_CHANGED_REQUEST: {
-		const struct tb_xdp_properties_changed *xchg =
-			(const struct tb_xdp_properties_changed *)pkg;
 		struct tb_xdomain *xd;
 
 		ret = tb_xdp_properties_changed_response(ctl, route, sequence);
@@ -598,10 +596,12 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		 * the xdomain related to this connection as well in
 		 * case there is a change in services it offers.
 		 */
-		xd = tb_xdomain_find_by_uuid_locked(tb, &xchg->src_uuid);
+		xd = tb_xdomain_find_by_route_locked(tb, route);
 		if (xd) {
-			queue_delayed_work(tb->wq, &xd->get_properties_work,
-					   msecs_to_jiffies(50));
+			if (device_is_registered(&xd->dev)) {
+				queue_delayed_work(tb->wq, &xd->get_properties_work,
+						   msecs_to_jiffies(50));
+			}
 			tb_xdomain_put(xd);
 		}
 
-- 
2.28.0

