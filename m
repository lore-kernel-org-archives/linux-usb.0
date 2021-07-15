Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BA7C1B08C
	for <linux-usb@archiver.kernel.org>; Thu, 15 Jul 2021 15:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C6F26128B
	for <linux-usb@archiver.kernel.org>; Thu, 15 Jul 2021 15:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236739AbhGOPH3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 15 Jul 2021 11:07:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:57122 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235419AbhGOPH2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 11:07:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="210551975"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; 
   d="scan'208";a="210551975"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 08:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; 
   d="scan'208";a="466708923"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2021 08:04:32 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus
Date:   Thu, 15 Jul 2021 18:06:50 +0300
Message-Id: <20210715150651.1996099-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

One small xhci fix resolving a missed usb 2 device-intiated wake.

I'll be out on vacation for two weeks, starting monday, so any response
will be delayed.

Thanks
-Mathias

Mathias Nyman (1):
  xhci: Fix lost USB 2 remote wake

 drivers/usb/host/xhci-hub.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.25.1

