Return-Path: <SRS0=W/rD=DC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A03C4363D
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 09:31:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D749320678
	for <linux-usb@archiver.kernel.org>; Fri, 25 Sep 2020 09:31:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="QgKFCT1Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgIYJb6 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 25 Sep 2020 05:31:58 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33322 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726990AbgIYJb6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 05:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=9Z2YycmKLsAk+fqK/L79ZzqRS8aYenV/Zfj3Tn5ZoEs=; b=QgKFCT1QpBBPANDBglZsgVhOUF
        /T1k92+TNoRduOd0SRPr0ezuv3aSRtmGTk6PtFaI6wfrNw2K+91oygJcbI9dXWA7LUiSwldmBc4Ui
        +V9e3ehCW9+xyNXGYfRfqE/44vOhGwyVX2cX6KIyDPzLPJIH2wbGJqtl09CBmHtrkZC4=;
Received: from [94.26.108.4] (helo=karbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLk54-0001hA-9l; Fri, 25 Sep 2020 12:31:54 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     oneukum@suse.com
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH 1/2] net: pegasus: convert control messages to the new send/recv scheme.
Date:   Fri, 25 Sep 2020 12:31:23 +0300
Message-Id: <20200925093124.22483-2-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925093124.22483-1-petkan@nucleusys.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200925093124.22483-1-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/net/usb/pegasus.c | 56 +++++++--------------------------------
 1 file changed, 9 insertions(+), 47 deletions(-)

diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index e92cb51a2c77..0ecc1eb2e71b 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -124,62 +124,24 @@ static void async_ctrl_callback(struct urb *urb)
 
 static int get_registers(pegasus_t *pegasus, __u16 indx, __u16 size, void *data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmalloc(size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(pegasus->usb, usb_rcvctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_GET_REGS, PEGASUS_REQT_READ, 0,
-			      indx, buf, size, 1000);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	else if (ret <= size)
-		memcpy(data, buf, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_recv(pegasus->usb, 0, PEGASUS_REQ_GET_REGS,
+				    PEGASUS_REQT_READ, 0, indx, data, size,
+				    1000, GFP_NOIO);
 }
 
 static int set_registers(pegasus_t *pegasus, __u16 indx, __u16 size,
 			 const void *data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmemdup(data, size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_SET_REGS, PEGASUS_REQT_WRITE, 0,
-			      indx, buf, size, 100);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REGS,
+			      PEGASUS_REQT_WRITE, 0, indx, data, size, 1000,
+			      GFP_NOIO);
 }
 
 static int set_register(pegasus_t *pegasus, __u16 indx, __u8 data)
 {
-	u8 *buf;
-	int ret;
-
-	buf = kmemdup(&data, 1, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(pegasus->usb, usb_sndctrlpipe(pegasus->usb, 0),
-			      PEGASUS_REQ_SET_REG, PEGASUS_REQT_WRITE, data,
-			      indx, buf, 1, 1000);
-	if (ret < 0)
-		netif_dbg(pegasus, drv, pegasus->net,
-			  "%s returned %d\n", __func__, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(pegasus->usb, 0, PEGASUS_REQ_SET_REG,
+			            PEGASUS_REQT_WRITE, data, indx, &data, 1,
+				    1000, GFP_NOIO);
 }
 
 static int update_eth_regs_async(pegasus_t *pegasus)
-- 
2.28.0

