Return-Path: <SRS0=WwEB=DG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04392C4727C
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 01:36:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B170121D7D
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 01:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601343399;
	bh=jCAJpA4MoOkk1Y3avzyE2lD63xoo8nkUKvGvEriN85g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=knR1kCNhc69hx2KY3fJexKfR7gI7ZtMegRpueLwAMcy73DamVeB/qi8jCPQ17qalE
	 pOpi7Up46Jn3yBmVIqBafgMNzjAJ4rJGxX8pcnyBkPf8zGzk5MyQHwnJ4VRwiUB4l5
	 4tFYStCzVZRPdG/6HGD969PrnJhwegQqtYu4a0Ts=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgI2Bga (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 28 Sep 2020 21:36:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727386AbgI2Ban (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 21:30:43 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBDBD21734;
        Tue, 29 Sep 2020 01:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601343042;
        bh=jCAJpA4MoOkk1Y3avzyE2lD63xoo8nkUKvGvEriN85g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qjp4i2nzbPPmi3dKUIuhXdeshi2KZmNcqZEs7/HaPhbr5OuyGb7/D1ewiOh6Xax7D
         cjHbzhOnL9oIy+/7fG3e1i/G4bx+HOST/GhzfM5XkBCtxCWOjNvAV8XEiPXutGo7IS
         NZxtAG7WLvh7RWo70S4C+mElE8scetxtYSovJoqI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Olympia Giannou <ogiannou@gmail.com>,
        Olympia Giannou <olympia.giannou@leica-geosystems.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 11/29] rndis_host: increase sleep time in the query-response loop
Date:   Mon, 28 Sep 2020 21:30:08 -0400
Message-Id: <20200929013027.2406344-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929013027.2406344-1-sashal@kernel.org>
References: <20200929013027.2406344-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Olympia Giannou <ogiannou@gmail.com>

[ Upstream commit 4202c9fdf03d79dedaa94b2c4cf574f25793d669 ]

Some WinCE devices face connectivity issues via the NDIS interface. They
fail to register, resulting in -110 timeout errors and failures during the
probe procedure.

In this kind of WinCE devices, the Windows-side ndis driver needs quite
more time to be loaded and configured, so that the linux rndis host queries
to them fail to be responded correctly on time.

More specifically, when INIT is called on the WinCE side - no other
requests can be served by the Client and this results in a failed QUERY
afterwards.

The increase of the waiting time on the side of the linux rndis host in
the command-response loop leaves the INIT process to complete and respond
to a QUERY, which comes afterwards. The WinCE devices with this special
"feature" in their ndis driver are satisfied by this fix.

Signed-off-by: Olympia Giannou <olympia.giannou@leica-geosystems.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/rndis_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index bd9c07888ebb4..6fa7a009a24a4 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -201,7 +201,7 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
 			dev_dbg(&info->control->dev,
 				"rndis response error, code %d\n", retval);
 		}
-		msleep(20);
+		msleep(40);
 	}
 	dev_dbg(&info->control->dev, "rndis response timeout\n");
 	return -ETIMEDOUT;
-- 
2.25.1

