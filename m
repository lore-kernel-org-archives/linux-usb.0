Return-Path: <SRS0=EFIa=36=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F26C3B186
	for <linux-usb@archiver.kernel.org>; Mon, 10 Feb 2020 13:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB1682173E
	for <linux-usb@archiver.kernel.org>; Mon, 10 Feb 2020 13:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgBJNns (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 10 Feb 2020 08:43:48 -0500
Received: from mga05.intel.com ([192.55.52.43]:14982 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728924AbgBJNnr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Feb 2020 08:43:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 05:43:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="scan'208";a="265858460"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2020 05:43:46 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable@vger.kernel.org
Subject: [PATCH 4/4] xhci: apply XHCI_PME_STUCK_QUIRK to Intel Comet Lake platforms
Date:   Mon, 10 Feb 2020 15:45:53 +0200
Message-Id: <20200210134553.9144-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210134553.9144-1-mathias.nyman@linux.intel.com>
References: <20200210134553.9144-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Comet Lake based platform require the XHCI_PME_STUCK_QUIRK
quirk as well. Without this xHC can not enter D3 in runtime suspend.

Cc: stable@vger.kernel.org
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index da7c2db41671..5e9b537df631 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -49,6 +49,7 @@
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_XHCI		0x15ec
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_XHCI		0x15f0
 #define PCI_DEVICE_ID_INTEL_ICE_LAKE_XHCI		0x8a13
+#define PCI_DEVICE_ID_INTEL_CML_XHCI			0xa3af
 
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
@@ -187,7 +188,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 		 pdev->device == PCI_DEVICE_ID_INTEL_BROXTON_M_XHCI ||
 		 pdev->device == PCI_DEVICE_ID_INTEL_BROXTON_B_XHCI ||
 		 pdev->device == PCI_DEVICE_ID_INTEL_APL_XHCI ||
-		 pdev->device == PCI_DEVICE_ID_INTEL_DNV_XHCI)) {
+		 pdev->device == PCI_DEVICE_ID_INTEL_DNV_XHCI ||
+		 pdev->device == PCI_DEVICE_ID_INTEL_CML_XHCI)) {
 		xhci->quirks |= XHCI_PME_STUCK_QUIRK;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
-- 
2.17.1

