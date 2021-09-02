Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D18C4320E
	for <linux-usb@archiver.kernel.org>; Thu,  2 Sep 2021 13:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C9F16108E
	for <linux-usb@archiver.kernel.org>; Thu,  2 Sep 2021 13:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345194AbhIBNO0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 2 Sep 2021 09:14:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:39192 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345196AbhIBNOA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 09:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630588383; x=1662124383;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TFi35WhD4a56J505HUE/gBsas+1Mde7mFWqML5o7Lq8=;
  b=q0zsI4BvFBmSB2sZYKnUhxL1Y4itfjCzKvuy9lcHPxfxJvqaGD0fQ778
   oPi/h+EqK9qofSSmVUNNDScD3nh/DTZ72IxQ8yuSzQRZaHsdeWJxRHTOd
   s7mN0mCk6ZTk4vC7Q23lBVNaInN3I8tow2Ho5T4kZBjuvVLy64BygYwnk
   Q=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 02 Sep 2021 06:13:01 -0700
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 06:13:00 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 2 Sep 2021 06:12:58 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH 0/5] usb: gadget: configfs: add some trace event
Date:   Thu, 2 Sep 2021 21:12:49 +0800
Message-ID: <1630588374-5169-1-git-send-email-quic_linyyuan@quicinc.com>
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

this series make some minor change to gadget configfs
which allow common trace from configfs layer.

follow suggestion from Felipe Balbi in link below,
https://lore.kernel.org/linux-usb/1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com/

Linyu Yuan (5):
  usb: gadget: configfs: expose some struct from configfs.c
  usb: gadget: configfs: change OS attributes operation
  usb: gadget: configfs: avoid list move operation of usb_function
  usb: gadget: configfs: add gadget_info for config group
  usb: gadget: configfs: add some trace event

 drivers/usb/gadget/Makefile         |   1 +
 drivers/usb/gadget/configfs.c       | 157 ++++++++++++----------------------
 drivers/usb/gadget/configfs.h       |  71 ++++++++++++++++
 drivers/usb/gadget/configfs_trace.c |  43 ++++++++++
 drivers/usb/gadget/configfs_trace.h | 164 ++++++++++++++++++++++++++++++++++++
 5 files changed, 333 insertions(+), 103 deletions(-)
 create mode 100644 drivers/usb/gadget/configfs_trace.c
 create mode 100644 drivers/usb/gadget/configfs_trace.h

-- 
2.7.4

