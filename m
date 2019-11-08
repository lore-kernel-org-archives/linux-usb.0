Return-Path: <SRS0=VvWj=ZA=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B5CC5DF60
	for <linux-usb@archiver.kernel.org>; Fri,  8 Nov 2019 11:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51615222C6
	for <linux-usb@archiver.kernel.org>; Fri,  8 Nov 2019 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573213211;
	bh=rmvVJUanAKAsUv3kGo40KfhFzGB1VQW2ebOCc4xWCzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=dJufTcXHjH9jhTRd3LYj4N9N/0r2sPkP8FwnAumX8r7fx7mFmmRJl8a+B1HdbT825
	 Rlm95xI/d0rrXmwzB4twexRiCmDi84LOpAekfWgVc75a0d2LBofOT4wOVR9/Y37iTM
	 ZllWm8MClJDWbcf1+JP3mBFg09fVDk6pvIjnoa4Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388464AbfKHLkK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 8 Nov 2019 06:40:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:53054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388406AbfKHLkH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Nov 2019 06:40:07 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F14E921D6C;
        Fri,  8 Nov 2019 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573213206;
        bh=rmvVJUanAKAsUv3kGo40KfhFzGB1VQW2ebOCc4xWCzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DdQiFKYylFV9WoNX1Ynuy2dngD6+uyQ7Phmr3ZlFA5ZVSQkzAUyCrtP3IB/mJIbcw
         rqos3Adu8Xsy6tC609jwOtE1oO9dMA4SGwyVWqugZQO8R3m5a5BiVQwZ0eKKdWTs5S
         XbSRQdGjIS7HllCDtzezrE1RElmKLsfb15nR4QOI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Raghuram Chary Jallipalli 
        <raghuramchary.jallipalli@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 089/205] net: lan78xx: Bail out if lan78xx_get_endpoints fails
Date:   Fri,  8 Nov 2019 06:35:56 -0500
Message-Id: <20191108113752.12502-89-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108113752.12502-1-sashal@kernel.org>
References: <20191108113752.12502-1-sashal@kernel.org>
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
index e20266bd209e2..9e995767dbfe3 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2947,6 +2947,11 @@ static int lan78xx_bind(struct lan78xx_net *dev, struct usb_interface *intf)
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

