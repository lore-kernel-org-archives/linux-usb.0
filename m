Return-Path: <SRS0=HY1r=DD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51046C47420
	for <linux-usb@archiver.kernel.org>; Sat, 26 Sep 2020 09:13:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12FB8238D6
	for <linux-usb@archiver.kernel.org>; Sat, 26 Sep 2020 09:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="lvZOtjwX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgIZJNk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 26 Sep 2020 05:13:40 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33728 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725208AbgIZJNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 05:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=f5+2fG3fJDSIkP7ccDc5Wy5l42PYi/rcGVgvffhEsFc=; b=lvZOtjwX182RgO+Yq0ezB54WkZ
        mrQXdgMHMN/YiyDz0dzuM/6zS1afAhaDfSpZuhURl0J4pAZOcZWVx7kAk6iNh/Xs5ZRiFZGIpV+Eu
        9FEj/VzBFXwGNwRt0vsd3dBVKAvXlEkq9AWptNOEnLbJ17Xaj0Zte0e2/S8jrb4prG6g=;
Received: from [94.26.108.4] (helo=karbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kM6Gu-0003As-TI; Sat, 26 Sep 2020 12:13:37 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     oneukum@suse.com
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 2/2] net: rtl8150: Use the new usb control message API.
Date:   Sat, 26 Sep 2020 12:13:27 +0300
Message-Id: <20200926091327.8021-3-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926091327.8021-1-petkan@nucleusys.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200926091327.8021-1-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

The old usb_control_msg() let the caller handle the error and also did not
account for partial reads.  Since these are now considered harmful, move the
driver over to usb_control_msg_recv/send() calls.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 drivers/net/usb/rtl8150.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..b3a0b188b1a1 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -152,36 +152,16 @@ static const char driver_name [] = "rtl8150";
 */
 static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
 {
-	void *buf;
-	int ret;
-
-	buf = kmalloc(size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
-			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
-			      indx, 0, buf, size, 500);
-	if (ret > 0 && ret <= size)
-		memcpy(data, buf, ret);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_recv(dev->udev, 0, RTL8150_REQ_GET_REGS,
+				    RTL8150_REQT_READ, indx, 0, data, size,
+				    1000, GFP_NOIO);
 }
 
 static int set_registers(rtl8150_t * dev, u16 indx, u16 size, const void *data)
 {
-	void *buf;
-	int ret;
-
-	buf = kmemdup(data, size, GFP_NOIO);
-	if (!buf)
-		return -ENOMEM;
-
-	ret = usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
-			      RTL8150_REQ_SET_REGS, RTL8150_REQT_WRITE,
-			      indx, 0, buf, size, 500);
-	kfree(buf);
-	return ret;
+	return usb_control_msg_send(dev->udev, 0, RTL8150_REQ_SET_REGS,
+				    RTL8150_REQT_WRITE, indx, 0, data, size,
+				    1000, GFP_NOIO);
 }
 
 static void async_set_reg_cb(struct urb *urb)
-- 
2.28.0

