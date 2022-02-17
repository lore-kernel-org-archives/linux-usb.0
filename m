Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7075CC433F5
	for <linux-usb@archiver.kernel.org>; Thu, 17 Feb 2022 01:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiBQBXU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Feb 2022 20:23:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiBQBXS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 20:23:18 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B1B2A0D49
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 17:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645060986; x=1676596986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JHyLjgz/tQBuN81Uu4KGbhomZZwt5Vjk/4lFE/Rc4ZI=;
  b=uQUF2PHQ8zH+UgBYBokKsO3reOtBKm0hz0uHoMpUQ8XAeVFoC/9Eu3EN
   WtFGKOidWwB3c72NnHD+bSYkYkuI5lk1a12RXYhiCmVuGe9Cn0SsxWVNS
   dCSLOdaZLHhsmQc6CqBysstK+wy/Gp6DGEyTqH11l9juTHsQcsibUFsfA
   c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 16 Feb 2022 17:23:05 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 17:23:05 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 16 Feb 2022 17:23:04 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 16 Feb 2022 17:23:02 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v2 4/5] usb: host: xhci: add blank line in xhci_halt()
Date:   Thu, 17 Feb 2022 09:22:50 +0800
Message-ID: <1645060971-27141-5-git-send-email-quic_linyyuan@quicinc.com>
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

It is more readable to add blank lines.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: no change

 drivers/usb/host/xhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 857a9c6..8b6f1a7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -110,6 +110,7 @@ void xhci_quiesce(struct xhci_hcd *xhci)
 int xhci_halt(struct xhci_hcd *xhci)
 {
 	int ret;
+
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Halt the HC");
 	xhci_quiesce(xhci);
 
@@ -119,8 +120,10 @@ int xhci_halt(struct xhci_hcd *xhci)
 		xhci_warn(xhci, "Host halt failed, %d\n", ret);
 		return ret;
 	}
+
 	xhci->xhc_state |= XHCI_STATE_HALTED;
 	xhci->cmd_ring_state = CMD_RING_STATE_STOPPED;
+
 	return ret;
 }
 
-- 
2.7.4

