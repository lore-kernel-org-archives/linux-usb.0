Return-Path: <SRS0=9UCG=UR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC5BC31E5B
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jun 2019 14:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A262E213F2
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jun 2019 14:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbfFROZB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Jun 2019 10:25:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:24098 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728982AbfFROZA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 10:25:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 07:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,389,1557212400"; 
   d="scan'208";a="243006657"
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga001.jf.intel.com with ESMTP; 18 Jun 2019 07:24:58 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Tue, 18 Jun 2019 17:27:46 +0300
Message-Id: <1560868068-2583-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple of fixes for usb-linus, one to detect usb 3.2 xhci hosts,
another to resolve a rare host hang at resume issue.

-Mathias

Mathias Nyman (2):
  usb: xhci: Don't try to recover an endpoint if port is in error state.
  xhci: detect USB 3.2 capable host controllers correctly

 drivers/usb/host/xhci-ring.c | 15 ++++++++++++++-
 drivers/usb/host/xhci.c      | 25 ++++++++++++++++++++-----
 drivers/usb/host/xhci.h      |  9 +++++++++
 3 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.7.4

