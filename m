Return-Path: <SRS0=di3T=YS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B26CA9EA0
	for <linux-usb@archiver.kernel.org>; Fri, 25 Oct 2019 14:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B95321D71
	for <linux-usb@archiver.kernel.org>; Fri, 25 Oct 2019 14:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404059AbfJYO2Y (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 25 Oct 2019 10:28:24 -0400
Received: from mga02.intel.com ([134.134.136.20]:10575 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730064AbfJYO2Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Oct 2019 10:28:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 07:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="192554834"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 25 Oct 2019 07:28:22 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Fri, 25 Oct 2019 17:30:26 +0300
Message-Id: <1572013829-14044-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few xhci fixes for usb-linus, solving a couple endianness issues, and a
use-after-free regression reported by Johan Hovold

-Mathias

Ben Dooks (Codethink) (1):
  usb: xhci: fix __le32/__le64 accessors in debugfs code

Mathias Nyman (1):
  xhci: Fix use-after-free regression in xhci clear hub TT
    implementation

Samuel Holland (1):
  usb: xhci: fix Immediate Data Transfer endianness

 drivers/usb/host/xhci-debugfs.c | 24 +++++++++---------
 drivers/usb/host/xhci-ring.c    |  2 ++
 drivers/usb/host/xhci.c         | 54 ++++++++++++++++++++++++++++++++++-------
 3 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.7.4

