Return-Path: <SRS0=r0HW=2R=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61167C2D0C6
	for <linux-usb@archiver.kernel.org>; Fri, 27 Dec 2019 18:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3145A21775
	for <linux-usb@archiver.kernel.org>; Fri, 27 Dec 2019 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577470612;
	bh=qP6wAILzhbdBxme3nfpCR6FxBQ980w+RpCK5piHz7pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=DNyuL7mMfF5LroQIOVGM0csj3k9M1zw8FBe/jGOJn2npQaJ5cK5FqezYn6cITcosa
	 AVDAdTqzbRXGDTo3Jq2j39hB1afD7esgq5u8k9cmEp8ylbU1NKVMeaySfcM6IQH1Lq
	 rV7cTkpcGnst09zYjH0AMwEwKcmPk2rscPF8d9qs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbfL0SQv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 27 Dec 2019 13:16:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:41298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728272AbfL0SQI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Dec 2019 13:16:08 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76C3121582;
        Fri, 27 Dec 2019 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577470568;
        bh=qP6wAILzhbdBxme3nfpCR6FxBQ980w+RpCK5piHz7pQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k3uS/dNH836xCiWd74Kj1ALHHfDk7yBMbtO+qv0UcbKxWZilhx0DW0CY2j6pYfJxp
         025cPsa1+HRDFndDfi3foLVC2fKrBpN0E0tCTfkgz5GGUMR6skUk5SVsp0/7l+BmxS
         vcNdR1x3Mb0ueyuvc0FZWeT9kIil8xRS9JL/5R8E=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Cristian Birsan <cristian.birsan@microchip.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 15/25] net: usb: lan78xx: Fix error message format specifier
Date:   Fri, 27 Dec 2019 13:15:39 -0500
Message-Id: <20191227181549.8040-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227181549.8040-1-sashal@kernel.org>
References: <20191227181549.8040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Cristian Birsan <cristian.birsan@microchip.com>

[ Upstream commit 858ce8ca62ea1530f2779d0e3f934b0176e663c3 ]

Display the return code as decimal integer.

Fixes: 55d7de9de6c3 ("Microchip's LAN7800 family USB 2/3 to 10/100/1000 Ethernet device driver")
Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/lan78xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index c813c5345a52..2340c61073de 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -370,7 +370,7 @@ static int lan78xx_read_stats(struct lan78xx_net *dev,
 		}
 	} else {
 		netdev_warn(dev->net,
-			    "Failed to read stat ret = 0x%x", ret);
+			    "Failed to read stat ret = %d", ret);
 	}
 
 	kfree(stats);
-- 
2.20.1

