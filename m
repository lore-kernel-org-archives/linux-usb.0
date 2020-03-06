Return-Path: <SRS0=xv5D=4X=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE2C10DCE
	for <linux-usb@archiver.kernel.org>; Fri,  6 Mar 2020 15:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E0162073D
	for <linux-usb@archiver.kernel.org>; Fri,  6 Mar 2020 15:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgCFPGh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Mar 2020 10:06:37 -0500
Received: from mga14.intel.com ([192.55.52.115]:49424 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgCFPGh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 6 Mar 2020 10:06:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2020 07:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,522,1574150400"; 
   d="scan'208";a="234831815"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 06 Mar 2020 07:06:35 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Fri,  6 Mar 2020 17:08:56 +0200
Message-Id: <20200306150858.21904-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple minor xhci fixes for usb-linus, fixing xhci trace events and
adding a quirk flag for a AMD xhci host.

-Mathias

Alberto Mattea (1):
  usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c

Steven Rostedt (VMware) (1):
  xhci: Do not open code __print_symbolic() in xhci trace events

 drivers/usb/host/xhci-pci.c   |  3 ++-
 drivers/usb/host/xhci-trace.h | 23 ++++++-----------------
 2 files changed, 8 insertions(+), 18 deletions(-)

-- 
2.17.1

