Return-Path: <SRS0=73Qb=5L=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE85C43331
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 10:43:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF4F52076A
	for <linux-usb@archiver.kernel.org>; Thu, 26 Mar 2020 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585219420;
	bh=OZQ6h2G5aW8cEj+kZSt+w47jzOr4L+jzrjMQVhuLEZ0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=A1evrVN8RCxhxwL0ewfz4lTCcv/rmDtZ78DF/WluMiky39FeLxyPdpevSn/iQNnQV
	 Zo8FugH/21Fu92+PYgPBo/MrwwKWP4UK3CC6JUljoA5NlzE+0uvg+gey9LMM1J9u6v
	 klom2sqa8ADpz6OtzM8mxELqlXljlH+7xs/ZnuOw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgCZKnk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Mar 2020 06:43:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZKnk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 06:43:40 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85EC820714;
        Thu, 26 Mar 2020 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585219419;
        bh=OZQ6h2G5aW8cEj+kZSt+w47jzOr4L+jzrjMQVhuLEZ0=;
        h=From:To:Cc:Subject:Date:From;
        b=eDPVPrwwvGcfGlgDaCwYu1QuQ4ZIu0tDUCIOeZ8xqiMxS2MkYi+YnmuwkW7mV6nwl
         KutwQELWMuOgKDSF7bjId5pqXK8HnN/WdD/kmaDa8LZKSOFsEbVvpnWowLNUIuVYvd
         ZYw7z0+p9Qf6cDAcGtJMdTE05+rEsG6MliaSZWXQ=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/3] usb: chipidea: udc: fix the kernel doc for udc.h
Date:   Thu, 26 Mar 2020 18:43:23 +0800
Message-Id: <20200326104325.5628-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The kernel doc for td_node is outdated, update it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/udc.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/udc.h b/drivers/usb/chipidea/udc.h
index ebb11b625bb8..32b56f84f77a 100644
--- a/drivers/usb/chipidea/udc.h
+++ b/drivers/usb/chipidea/udc.h
@@ -67,10 +67,7 @@ struct td_node {
  * struct ci_hw_req - usb request representation
  * @req: request structure for gadget drivers
  * @queue: link to QH list
- * @ptr: transfer descriptor for this request
- * @dma: dma address for the transfer descriptor
- * @zptr: transfer descriptor for the zero packet
- * @zdma: dma address of the zero packet's transfer descriptor
+ * @tds: link to TD list
  */
 struct ci_hw_req {
 	struct usb_request	req;
-- 
2.17.1

