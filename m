Return-Path: <SRS0=M0dr=64=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC32C433DF
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 11:01:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE00B2065F
	for <linux-usb@archiver.kernel.org>; Thu, 14 May 2020 11:01:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENLBt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 14 May 2020 07:01:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:33412 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgENLBs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 07:01:48 -0400
IronPort-SDR: Wv6yGGvrPujCMDcWa6rojYC9Q7RUxmtdIDuIka6x7S7dLWCHcF1Xmu4/TG61oQ7pvA17rcFGfy
 NNMivZEGVNgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2020 04:01:48 -0700
IronPort-SDR: fpgJgcm25JUGt0dbD35V9PWkRMACO1W8QH2a1ouw2Ufak5GkSL7khKOmpYXlY/+ZeDjk1wX6JP
 WDQoamcJ0Jlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,391,1583222400"; 
   d="scan'208";a="307071675"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 14 May 2020 04:01:47 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Thu, 14 May 2020 14:04:30 +0300
Message-Id: <20200514110432.25564-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Two small xhci fixes for usb-linus, both fix NULL pointer dereference issues.
Would be nice if they could still make 5.7 

Thanks
Mathias

Li Jun (1):
  usb: host: xhci-plat: keep runtime active when removing host

Sriharsha Allenki (1):
  usb: xhci: Fix NULL pointer dereference when enqueuing trbs from urb
    sg list

 drivers/usb/host/xhci-plat.c | 4 +++-
 drivers/usb/host/xhci-ring.c | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.17.1

