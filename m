Return-Path: <SRS0=FoFi=AF=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1433C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 24 Jun 2020 13:56:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4B9920781
	for <linux-usb@archiver.kernel.org>; Wed, 24 Jun 2020 13:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403991AbgFXN4t (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Jun 2020 09:56:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:43621 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403988AbgFXN4s (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jun 2020 09:56:48 -0400
IronPort-SDR: 8OSnzexdGGX/JDIqup3WxuoCCiC/BsQBEtJRUZhWPMcaCafLwgxl+kE5hgWLaKkKwT8rcKoSK8
 YYUDGnzRVANg==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132909228"
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="132909228"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2020 06:56:47 -0700
IronPort-SDR: xvMBw7Gk1rvKEjsyhUppXXpCFYuJsLwRg5fZhEtKZviUZPzJHJw61bRXa6X2K5+X0+i7HXv0W/
 7qrOXkfJj91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,275,1589266800"; 
   d="scan'208";a="263644016"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga007.fm.intel.com with ESMTP; 24 Jun 2020 06:56:46 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date:   Wed, 24 Jun 2020 16:59:44 +0300
Message-Id: <20200624135949.22611-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes for usb-linus that resolve a couple power management
related issues, and a full-speed USB device enumeration problem.

-Mathias

Al Cooper (1):
  xhci: Fix enumeration issue when setting max packet size for FS
    devices.

Kai-Heng Feng (2):
  xhci: Return if xHCI doesn't support LPM
  xhci: Poll for U0 after disabling USB2 LPM

Macpaul Lin (1):
  usb: host: xhci-mtk: avoid runtime suspend when removing hcd

Mathias Nyman (1):
  xhci: Fix incorrect EP_STATE_MASK

 drivers/usb/host/xhci-mtk.c | 5 +++--
 drivers/usb/host/xhci.c     | 9 ++++++++-
 drivers/usb/host/xhci.h     | 2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.17.1

