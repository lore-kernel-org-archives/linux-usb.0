Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE02C43219
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67E4D2077B
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 13:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfDZNVH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 09:21:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:37097 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbfDZNVH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Apr 2019 09:21:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Apr 2019 06:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,397,1549958400"; 
   d="scan'208";a="168185687"
Received: from mattu-haswell.fi.intel.com ([10.237.72.164])
  by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2019 06:21:05 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci features for usb-next
Date:   Fri, 26 Apr 2019 16:23:28 +0300
Message-Id: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few features for usb next, mostly tracing and debugging features, but
also support for Immediate Data Transfer for small (up to 8 bytes)
data transfers

-Mathias

Mathias Nyman (3):
  xhci: add port and bus number to port dynamic debugging
  xhci: Add tracing for input control context
  usb: xhci: add endpoint context tracing when an endpoint is added

Nicolas Saenz Julienne (1):
  usb: xhci: add Immediate Data Transfer support

 drivers/usb/host/xhci-hub.c   | 44 +++++++++++++++++++++++++----------------
 drivers/usb/host/xhci-ring.c  | 24 ++++++++++++++++++----
 drivers/usb/host/xhci-trace.h | 30 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci.c       | 40 +++++++++++++++++++++++++++++++++----
 drivers/usb/host/xhci.h       | 46 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 159 insertions(+), 25 deletions(-)

-- 
2.7.4

