Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B1C433F5
	for <linux-usb@archiver.kernel.org>; Wed, 16 Feb 2022 07:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiBPHJX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Feb 2022 02:09:23 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:45602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiBPHJV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 02:09:21 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ABE24F39
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 23:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644995330; x=1676531330;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R6EVFUcpopQYS9lBRiXEJbFGIdfpQl10UvIq0aotlD0=;
  b=AEWyMRFZ7LuUonlPuvg6cDI/G3em0SrbTCXrCKewtS4NTUigCsdtQ1HH
   FbWMhcDd3980KILVjayvh421+6zhbd6PHQR3ux3YkhGjZeR1+NWVnGi4O
   P7CroCTUBDt6Tfvx1NGCKc0hGkeX1cJPGrr953r08V6I3YaZhPQON+s63
   U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Feb 2022 22:59:21 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 22:59:21 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Feb 2022 22:59:21 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 15 Feb 2022 22:59:19 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 0/5] usb: xhci: fix of some code/comment
Date:   Wed, 16 Feb 2022 14:59:10 +0800
Message-ID: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Only samll change, no description here.

Linyu Yuan (5):
  usb: host: xhci: use ffs() in xhci_mem_init()
  usb: host: xhci: fix a comment typo in xhci_mem_init()
  usb: host: xhci: update hci_version operation in xhci_gen_setup()
  usb: host: xhci: add blank line in xhci_halt()
  usb: host: xhci: remove init to some ret/retval

 drivers/usb/host/xhci-mem.c |  9 ++-------
 drivers/usb/host/xhci.c     | 14 ++++++++------
 2 files changed, 10 insertions(+), 13 deletions(-)

-- 
2.7.4

