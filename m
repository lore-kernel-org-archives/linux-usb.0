Return-Path: <SRS0=r4gL=VX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E82C7618F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jul 2019 05:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6E8721734
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jul 2019 05:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfGZFGE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Jul 2019 01:06:04 -0400
Received: from gate.crashing.org ([63.228.1.57]:51658 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZFGE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:06:04 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q55j3T017580;
        Fri, 26 Jul 2019 00:05:58 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v3 05/10] usb: gadget: aspeed: Check suspend/resume callback existence
Date:   Fri, 26 Jul 2019 15:05:34 +1000
Message-Id: <20190726050539.7875-6-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726050539.7875-1-benh@kernel.crashing.org>
References: <20190726050539.7875-1-benh@kernel.crashing.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

.. before calling them

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 71e2416858fd..5f7e3b6de531 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -458,7 +458,7 @@ static const struct usb_gadget_ops ast_vhub_udc_ops = {
 void ast_vhub_dev_suspend(struct ast_vhub_dev *d)
 {
 	d->suspended = true;
-	if (d->driver) {
+	if (d->driver && d->driver->suspend) {
 		spin_unlock(&d->vhub->lock);
 		d->driver->suspend(&d->gadget);
 		spin_lock(&d->vhub->lock);
@@ -468,7 +468,7 @@ void ast_vhub_dev_suspend(struct ast_vhub_dev *d)
 void ast_vhub_dev_resume(struct ast_vhub_dev *d)
 {
 	d->suspended = false;
-	if (d->driver) {
+	if (d->driver && d->driver->resume) {
 		spin_unlock(&d->vhub->lock);
 		d->driver->resume(&d->gadget);
 		spin_lock(&d->vhub->lock);
-- 
2.17.1

