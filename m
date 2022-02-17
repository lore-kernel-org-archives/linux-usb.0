Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F66C433F5
	for <linux-usb@archiver.kernel.org>; Thu, 17 Feb 2022 01:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbiBQBXf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Feb 2022 20:23:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiBQBXf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 20:23:35 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08734243A2B
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 17:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645061002; x=1676597002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fYLKTpth04kPN5uBJAog73tyRfahB6BaZ38bC2pcZzg=;
  b=DYMAQkjUhigfFvCpgST6r0N7d//ck4/2Ey6Gv1rwwDSvHUsQnuy5DekK
   619QXsij9Dpgjh6pvEGzMBbD/iqsh1Rh9yHn9KFjNvJCissQc6RRJOdJl
   4SUrUt2WMPi4dj7vNhuw9qd76hXXBUpK7tTHcvx0jFjSLpHAvjtM2L4L/
   Y=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Feb 2022 17:23:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 17:23:06 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 17:23:06 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 17:23:04 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 5/5] usb: host: xhci: remove init to some ret/retval
Date:   Thu, 17 Feb 2022 09:22:51 +0800
Message-ID: <1645060971-27141-6-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1645060971-27141-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ret/retval will be set when it used, no need to init at definition.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/host/xhci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 8b6f1a7..b37735e 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -327,7 +327,7 @@ static int xhci_setup_msi(struct xhci_hcd *xhci)
  */
 static int xhci_setup_msix(struct xhci_hcd *xhci)
 {
-	int i, ret = 0;
+	int i, ret;
 	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
 
@@ -581,7 +581,7 @@ static int xhci_all_ports_seen_u0(struct xhci_hcd *xhci)
 static int xhci_init(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
-	int retval = 0;
+	int retval;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "xhci_init");
 	spin_lock_init(&xhci->lock);
@@ -3971,7 +3971,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 	struct xhci_command *command;
 	unsigned long flags;
 	u32 state;
-	int ret = 0;
+	int ret;
 
 	command = xhci_alloc_command(xhci, true, GFP_KERNEL);
 	if (!command)
@@ -4007,7 +4007,7 @@ int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id)
 
 	xhci_free_command(xhci, command);
 
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.7.4

