Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF9FC4361B
	for <linux-usb@archiver.kernel.org>; Tue,  8 Dec 2020 09:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 920BC23A81
	for <linux-usb@archiver.kernel.org>; Tue,  8 Dec 2020 09:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgLHJ3q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 8 Dec 2020 04:29:46 -0500
Received: from mga06.intel.com ([134.134.136.31]:9877 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726840AbgLHJ3q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 04:29:46 -0500
IronPort-SDR: 7OH9yFrw2chpYbnVXjHi0C9Kp97n6SROa9xso20/oVWg/IEITegvmSy3bgixgO1v8P2q9ZhHKd
 QfBBy83xWOjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235460673"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="235460673"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 01:27:58 -0800
IronPort-SDR: RQPheXLl89puH5UMbqfR2iYhyEXDWBtio6espxak7og7xcDn9TJNi4t8t7yJ0qqgtm4Tpu4Q4U
 qrRibzyJi3BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="552165883"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2020 01:27:57 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci features for usb-next
Date:   Tue,  8 Dec 2020 11:29:07 +0200
Message-Id: <20201208092912.1773650-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few patches for usb-next, a bit late in the cycle but nice if
they can make 5.11.

-Mathias

Hans de Goede (1):
  xhci-pci: Allow host runtime PM as default for Intel Alpine Ridge LP

Li Jun (1):
  xhci: Give USB2 ports time to enter U3 in bus suspend

Mika Westerberg (1):
  xhci-pci: Allow host runtime PM as default for Intel Maple Ridge xHCI

Tejas Joglekar (2):
  usb: xhci: Set quirk for XHCI_SG_TRB_CACHE_SIZE_QUIRK
  usb: xhci: Use temporary buffer to consolidate SG

 drivers/usb/host/xhci-hub.c  |   4 ++
 drivers/usb/host/xhci-pci.c  |   6 +-
 drivers/usb/host/xhci-plat.c |   3 +
 drivers/usb/host/xhci-ring.c |   2 +-
 drivers/usb/host/xhci.c      | 129 ++++++++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |   5 ++
 6 files changed, 146 insertions(+), 3 deletions(-)

-- 
2.25.1

