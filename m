Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96118C32771
	for <linux-usb@archiver.kernel.org>; Tue, 27 Sep 2022 02:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiI0CJk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Sep 2022 22:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiI0CJj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 22:09:39 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEC0D112
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 19:09:37 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mc2yV0CkBz1P6kF;
        Tue, 27 Sep 2022 10:05:22 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 10:09:36 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:09:35 +0800
From:   Shang XiaoJing <shangxiaojing@huawei.com>
To:     <gregkh@linuxfoundation.org>, <oneukum@suse.com>,
        <rikard.falkeborn@gmail.com>, <ryazanov.s.a@gmail.com>,
        <linux-usb@vger.kernel.org>
CC:     <shangxiaojing@huawei.com>
Subject: [PATCH -next] usb: cdc-wdm: Use skb_put_data() instead of skb_put/memcpy pair
Date:   Tue, 27 Sep 2022 10:43:44 +0800
Message-ID: <20220927024344.14352-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use skb_put_data() instead of skb_put() and memcpy(), which is clear.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/usb/class/cdc-wdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index eebe782380fb..1f0951be15ab 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -958,7 +958,7 @@ static void wdm_wwan_rx(struct wdm_device *desc, int length)
 	if (!skb)
 		return;
 
-	memcpy(skb_put(skb, length), desc->inbuf, length);
+	skb_put_data(skb, desc->inbuf, length);
 	wwan_port_rx(port, skb);
 
 	/* inbuf has been copied, it is safe to check for outstanding data */
-- 
2.17.1

