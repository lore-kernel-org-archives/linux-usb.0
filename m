Return-Path: <SRS0=VvWj=ZA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D13FC6196
	for <linux-usb@archiver.kernel.org>; Fri,  8 Nov 2019 11:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB2A720869
	for <linux-usb@archiver.kernel.org>; Fri,  8 Nov 2019 11:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573214388;
	bh=Hq+Kirpl2aSeCgJgShXLAvmK60yJ6X9nHLUCM+aCuiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=AE0KTU9Y06KMd0jg1NyTciotaXYd2RkOv0plrGyjC7WUB3ABCwm+wIREOHYL5V++H
	 iOlqULFKcHT2L1YcOmzW5u3uEm6ejgUyEMGhUu9SoyYB64QSCDeC9xM1+zKoxf4yqj
	 8F9gCxlZt70bxUr6AlpShpqFl+vZYQZVfuApSga8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391003AbfKHL7r (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:59:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:58848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390662AbfKHLoG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Nov 2019 06:44:06 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 052C7222C4;
        Fri,  8 Nov 2019 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213445;
        bh=Hq+Kirpl2aSeCgJgShXLAvmK60yJ6X9nHLUCM+aCuiM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JWnMG028658jtQ/1Gb+XNoXkputjgN5y8/8XMTjp7q3YvjSfgVbk14FfqE6Nj8Vj5
         nM3i9iLtK0Yj6nZIVkuZFGK+gzn2F/kDJu/CuyNB1Dx6w345KjFy077Ju5uMUHHm9c
         t4dMgPq0/So8Na/AIF0vQUVYfd8F/efjCBu2dAoU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Raghuram Chary Jallipalli 
        <raghuramchary.jallipalli@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 039/103] net: lan78xx: Bail out if lan78xx_get_endpoints fails
Date:   Fri,  8 Nov 2019 06:42:04 -0500
Message-Id: <20191108114310.14363-39-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108114310.14363-1-sashal@kernel.org>
References: <20191108114310.14363-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Stefan Wahren <stefan.wahren@i2se.com>

[ Upstream commit fa8cd98c06407b5798b927cd7fd14d30f360ed02 ]

We need to bail out if lan78xx_get_endpoints() fails, otherwise the
result is overwritten.

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet")
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Raghuram Chary Jallipalli <raghuramchary.jallipalli@microchip.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/lan78xx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 24b994c68bccd..316930d4129f9 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2818,6 +2818,11 @@ static int lan78xx_bind(struct lan78xx_net *dev, struct usb_interface *intf)
 	int i;
 
 	ret = lan78xx_get_endpoints(dev, intf);
+	if (ret) {
+		netdev_warn(dev->net, "lan78xx_get_endpoints failed: %d\n",
+			    ret);
+		return ret;
+	}
 
 	dev->data[0] = (unsigned long)kzalloc(sizeof(*pdata), GFP_KERNEL);
 
-- 
2.20.1

