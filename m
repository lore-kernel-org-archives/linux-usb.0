Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C9EC433F5
	for <linux-usb@archiver.kernel.org>; Wed, 30 Mar 2022 04:36:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242625AbiC3EiX (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 30 Mar 2022 00:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242661AbiC3EiQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 00:38:16 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144FD22B00
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 21:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1648614990; x=1680150990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fBx4UZiCzCK1j+2CfVkFTu4yhrZbHawb5Ljq+4d0Rxc=;
  b=ls1RLkI0Xvw8y6CgD23eWGz57d1VjUaXCPok7CeN+3M6tIe9idWi5WFP
   NtknjGnSV5wBfRvcf/CDF5ilSL7dkQtM2jfraAbMUSkFfwIbpZ95hLmBK
   9q8lUaE8t6E4ZLMT4QzOjYTgT/O01z6DW4MIEM4kfDidY+LxbFzfw41Lc
   k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Mar 2022 21:36:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 21:36:29 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 21:36:29 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 21:36:27 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 1/5] usb: gadget: remove gadgets_type storage type 'static'
Date:   Wed, 30 Mar 2022 12:36:16 +0800
Message-ID: <1648614980-25024-2-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648614980-25024-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1648614980-25024-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Prepare for new trace event function which will use gadgets_type variable.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v3: first add this change

 drivers/usb/gadget/configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 1fb837d..b2beeda 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -1642,7 +1642,7 @@ static struct configfs_group_operations gadgets_ops = {
 	.drop_item      = &gadgets_drop,
 };
 
-static const struct config_item_type gadgets_type = {
+const struct config_item_type gadgets_type = {
 	.ct_group_ops   = &gadgets_ops,
 	.ct_owner       = THIS_MODULE,
 };
-- 
2.7.4

