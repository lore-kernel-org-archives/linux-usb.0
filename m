Return-Path: <SRS0=EQXy=X2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259E2ECE587
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 16:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7D3C21A4C
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569948306;
	bh=DdStZYFpYZrqCK5j5UIujWCDEOKqjXsCIKOn23cHrNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RQ0FnWX9+uncyDOF80yonT6xuajxr9yGIW0Ksa420o17NgPL4JTmUBuEl9xJwkBAn
	 OHj4IJDUmo+YBdWIau7Ffsv33TGnSTJA2m1ECGLNaid+qMfQgrawcVEwUY8EtXM724
	 ziPVdKHE3HEPGVjlItXjoZj59waOVeSWggPJwewE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388316AbfJAQpF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Oct 2019 12:45:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390154AbfJAQpE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 12:45:04 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A18C520B7C;
        Tue,  1 Oct 2019 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569948303;
        bh=DdStZYFpYZrqCK5j5UIujWCDEOKqjXsCIKOn23cHrNI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bcP3hhzaVAM4UOFTdEIy1LojEvaog28ogA5U2UHjWmYzNV1Va+U4PoKGdTRH4W/ad
         Zy699cdYVZMKL2Nhmq0VSQY8Z0iNoEf0qvO1GJgysTam0EC3WE3hun0Yh5D4ONxFC9
         K8EpJZ/cMjeyOfQKJrTjRSd80Fs7oZ13HDEfwFgk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 28/29] usbnet: sanity checking of packet sizes and device mtu
Date:   Tue,  1 Oct 2019 12:44:22 -0400
Message-Id: <20191001164423.16406-28-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164423.16406-1-sashal@kernel.org>
References: <20191001164423.16406-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit 280ceaed79f18db930c0cc8bb21f6493490bf29c ]

After a reset packet sizes and device mtu can change and need
to be reevaluated to calculate queue sizes.
Malicious devices can set this to zero and we divide by it.
Introduce sanity checking.

Reported-and-tested-by:  syzbot+6102c120be558c885f04@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/usbnet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 42e3244d3a705..cb9a18eda798f 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -356,6 +356,8 @@ void usbnet_update_max_qlen(struct usbnet *dev)
 {
 	enum usb_device_speed speed = dev->udev->speed;
 
+	if (!dev->rx_urb_size || !dev->hard_mtu)
+		goto insanity;
 	switch (speed) {
 	case USB_SPEED_HIGH:
 		dev->rx_qlen = MAX_QUEUE_MEMORY / dev->rx_urb_size;
@@ -372,6 +374,7 @@ void usbnet_update_max_qlen(struct usbnet *dev)
 		dev->tx_qlen = 5 * MAX_QUEUE_MEMORY / dev->hard_mtu;
 		break;
 	default:
+insanity:
 		dev->rx_qlen = dev->tx_qlen = 4;
 	}
 }
-- 
2.20.1

