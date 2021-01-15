Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94876C433E0
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 16:19:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CAF0238EF
	for <linux-usb@archiver.kernel.org>; Fri, 15 Jan 2021 16:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbhAOQTG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:19:06 -0500
Received: from mga07.intel.com ([134.134.136.100]:57454 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbhAOQTG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 11:19:06 -0500
IronPort-SDR: 8h8IMfgMGqPxwVBr0uv0K352b2VT5su3we3Eho9Xi7xpTMI9U4r9Z846i0oDIICHyy7dA7lC1H
 EVkQWNEjvG6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="242638644"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="242638644"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 08:17:15 -0800
IronPort-SDR: eTClp16T96lKC3TGgzZEz+P3Rj28rCgoS83REhGRtZRROqrXBAA9uvL85FwplLk9quE6p1o+/X
 Udj6c5OKTIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="465626801"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2021 08:17:14 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Fri, 15 Jan 2021 18:19:05 +0200
Message-Id: <20210115161907.2875631-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple fixes for usb-linus.
Fixes one "xHCI died" case found when stress testing URB cancel on
several devices at once, and one timing issue on Tegra xhci

JC Kuo (1):
  xhci: tegra: Delay for disabling LFPS detector

Mathias Nyman (1):
  xhci: make sure TRB is fully written before giving it to the
    controller

 drivers/usb/host/xhci-ring.c  | 2 ++
 drivers/usb/host/xhci-tegra.c | 7 +++++++
 2 files changed, 9 insertions(+)

-- 
2.25.1

