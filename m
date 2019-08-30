Return-Path: <SRS0=68Iu=W2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A1EC3A5A6
	for <linux-usb@archiver.kernel.org>; Fri, 30 Aug 2019 13:37:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 009C121726
	for <linux-usb@archiver.kernel.org>; Fri, 30 Aug 2019 13:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3Nhg (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Aug 2019 09:37:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:23363 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfH3Nhg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Aug 2019 09:37:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 06:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="332860286"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2019 06:37:34 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci features for usb-next
Date:   Fri, 30 Aug 2019 16:39:12 +0300
Message-Id: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Minor xhci tuneups for usb-next.
The memory leak fix might look like it belongs to usb-linus and stable,
but is really about a leak possibility on a very unlikely error path.
Nice to have it fixed, but not sure it's stable material.

-Mathias

Christophe JAILLET (2):
  usb: xhci: dbc: Simplify error handling in 'xhci_dbc_alloc_requests()'
  usb: xhci: dbc: Use GFP_KERNEL instead of GFP_ATOMIC in
    'xhci_dbc_alloc_requests()'

Ikjoon Jang (1):
  xhci: fix possible memleak on setup address fails.

Mathias Nyman (1):
  xhci: add TSP bitflag to TRB tracing

 drivers/usb/host/xhci-dbgtty.c | 4 ++--
 drivers/usb/host/xhci.c        | 3 ++-
 drivers/usb/host/xhci.h        | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.7.4

