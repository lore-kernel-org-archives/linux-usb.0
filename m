Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE17BC433E0
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 12:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A1DA64D5D
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 12:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhBBMx5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Feb 2021 07:53:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:18029 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232020AbhBBMxv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Feb 2021 07:53:51 -0500
IronPort-SDR: DABEPmuPdakQ1XFd+KhttUfrTSKt8PinbbfU+qGZpQLA41NRWAjQUoV6igO9gyzQD6WYSqqaJF
 JY/8VrPA5q3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180070676"
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="180070676"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2021 04:50:46 -0800
IronPort-SDR: 2eEglJnb8wDHlnYhhDR0k0yjMX0lopiO2Fj6taPtdPz74MsolW2dNLFnlufZVNvvT6cm9hYoxD
 9r9o74M0cuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,395,1602572400"; 
   d="scan'208";a="479741067"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2021 04:50:44 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 5/6] usb: dwc3: host: Use software node API with the properties
Date:   Tue,  2 Feb 2021 15:50:31 +0300
Message-Id: <20210202125032.64982-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202125032.64982-1-heikki.krogerus@linux.intel.com>
References: <20210202125032.64982-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This replaces the platform_device_add_properties() call with
the safer device_create_managed_software_node() that does
exactly the same, but can also guarantee that the lifetime
of the node that is created for the device is tied to the
lifetime of device itself.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e195176580de1..f29a264635aa1 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -108,7 +108,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
 
 	if (prop_idx) {
-		ret = platform_device_add_properties(xhci, props);
+		ret = device_create_managed_software_node(&xhci->dev, props, NULL);
 		if (ret) {
 			dev_err(dwc->dev, "failed to add properties to xHCI\n");
 			goto err;
-- 
2.30.0

