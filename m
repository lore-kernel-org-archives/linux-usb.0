Return-Path: <SRS0=Sb/9=TW=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1947C282CE
	for <linux-usb@archiver.kernel.org>; Wed, 22 May 2019 11:31:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C31D0217D4
	for <linux-usb@archiver.kernel.org>; Wed, 22 May 2019 11:31:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbfEVLbi (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 22 May 2019 07:31:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:39534 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728335AbfEVLbi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 07:31:38 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 04:31:37 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by orsmga003.jf.intel.com with ESMTP; 22 May 2019 04:31:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/5] xhci fixes for usb-linus
Date:   Wed, 22 May 2019 14:33:56 +0300
Message-Id: <1558524841-25397-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few fixes for usb-linus, including regression fix for xhci IDT support
which was added to 5.2-rc1

-Mathias

Andrey Smirnov (1):
  xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()

Carsten Schmid (1):
  usb: xhci: avoid null pointer deref when bos field is NULL

Henry Lin (1):
  xhci: update bounce buffer with correct sg num

Jia-Ju Bai (1):
  usb: xhci: Fix a potential null pointer dereference in
    xhci_debugfs_create_endpoint()

Mathias Nyman (1):
  xhci: Fix immediate data transfer if buffer is already DMA mapped

 drivers/usb/host/xhci-debugfs.c |  3 +++
 drivers/usb/host/xhci-ring.c    | 26 +++++++++++++++++++-------
 drivers/usb/host/xhci.c         | 24 +++++++++++-------------
 drivers/usb/host/xhci.h         |  3 ++-
 4 files changed, 35 insertions(+), 21 deletions(-)

-- 
2.7.4

