Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1E4C001DC
	for <linux-usb@archiver.kernel.org>; Mon, 24 Jul 2023 01:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjGXBkk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 23 Jul 2023 21:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbjGXBkH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Jul 2023 21:40:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B364682;
        Sun, 23 Jul 2023 18:35:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F007260FD0;
        Mon, 24 Jul 2023 01:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77B4C433CA;
        Mon, 24 Jul 2023 01:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690162366;
        bh=GLv9J9Q1GULk2tk6a21BWz9R/YTSf1sjlRUmrDHNGhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rd2TDaFgAUUvQ8vfDcU6n4akQcaBGUt9sTf3qB705qQ7VtUOOheMWcl4xtzoKSWnN
         jDAa2A6fRCoxSmNPMQdUupmDvMiljCMob0TQimrirDPbUGwB2A5sFmT1Yd9WwXOzG8
         VqBBQiOYYGtLLdIAvemcaiPzZAsXjpmsGZ6HRTDyIj0LhFrN6eTJ5+66TH41OUtHpS
         BVBx1cyBT1PXkrCMiJyU0HHQAawl8i3RikQn/bw6LJPb+vfJwSeEVt1CGR1xIDJ1/Q
         trNCJTmnqDCJ0Xq8LQQZh1zKI+cvt6Hion15bTPwyU21Ha854thGjQAKw26T/hT7nK
         22icnmRybIAzA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Prashanth K <quic_prashk@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/34] usb: gadget: u_serial: Avoid spinlock recursion in __gs_console_push
Date:   Sun, 23 Jul 2023 21:32:08 -0400
Message-Id: <20230724013238.2329166-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013238.2329166-1-sashal@kernel.org>
References: <20230724013238.2329166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Prashanth K <quic_prashk@quicinc.com>

[ Upstream commit e5990469943c711cb00bfde6338d2add6c6d0bfe ]

When serial console over USB is enabled, gs_console_connect
queues gs_console_work, where it acquires the spinlock and
queues the usb request, and this request goes to gadget layer.
Now consider a situation where gadget layer prints something
to dmesg, this will eventually call gs_console_write() which
requires cons->lock. And this causes spinlock recursion. Avoid
this by excluding usb_ep_queue from the spinlock.

 spin_lock_irqsave //needs cons->lock
 gs_console_write
	.
	.
 _printk
 __warn_printk
 dev_warn/pr_err
	.
	.
 [USB Gadget Layer]
	.
	.
 usb_ep_queue
 gs_console_work
 __gs_console_push // acquires cons->lock
 process_one_work

Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
Link: https://lore.kernel.org/r/1683638872-6885-1-git-send-email-quic_prashk@quicinc.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/function/u_serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index db6fd0238d4b4..2dcd30c96e20d 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -915,8 +915,11 @@ static void __gs_console_push(struct gs_console *cons)
 	}
 
 	req->length = size;
+
+	spin_unlock_irq(&cons->lock);
 	if (usb_ep_queue(ep, req, GFP_ATOMIC))
 		req->length = 0;
+	spin_lock_irq(&cons->lock);
 }
 
 static void gs_console_work(struct work_struct *work)
-- 
2.39.2

