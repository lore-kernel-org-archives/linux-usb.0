Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C08CC43457
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E9EB21BE5
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529631;
	bh=skjEFp/EQ9L/VIgGNTWEnzNSWGVcW8CQ2KOl+wMUIs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=s/edAq1FRIy6IVSGHgbXvPcCs7z02I6BLZklVIfZT+36hqlgXoWQlXtbiY9adNSvw
	 WUl2m41me/K7JE3b5wAZ/2JBl9vzwfW3AG7dkFZV/smqKMm5oOK/XidV03s26j1zzy
	 NZsYNoYJQ1E0iA0p27QQ4cFINWKRVCFORfHz+Ej0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391189AbgJLTGz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:06:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:53460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391175AbgJLTDs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 15:03:48 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC4AC221FF;
        Mon, 12 Oct 2020 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602529427;
        bh=skjEFp/EQ9L/VIgGNTWEnzNSWGVcW8CQ2KOl+wMUIs8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vgts0MThNjSozgDgcH/CbjSERE0JEpcwxGaq50sCYIDj6vpVPT4lQl2KV65jjoftt
         S/oGNb02XjZTZJ5T/OJl0JwvKr7rOIeFEyGzfiKHLP/e2KpTF+v+UxwYfmKbDO9vS3
         71AR6ElSrDKdjwyTs+p347firryalaQ9gHcQsuIc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Anant Thazhemadam <anant.thazhemadam@gmail.com>,
        syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
        Petko Manolov <petkan@nucleusys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/12] net: usb: rtl8150: set random MAC address when set_ethernet_addr() fails
Date:   Mon, 12 Oct 2020 15:03:32 -0400
Message-Id: <20201012190335.3279538-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012190335.3279538-1-sashal@kernel.org>
References: <20201012190335.3279538-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Anant Thazhemadam <anant.thazhemadam@gmail.com>

[ Upstream commit f45a4248ea4cc13ed50618ff066849f9587226b2 ]

When get_registers() fails in set_ethernet_addr(),the uninitialized
value of node_id gets copied over as the address.
So, check the return value of get_registers().

If get_registers() executed successfully (i.e., it returns
sizeof(node_id)), copy over the MAC address using ether_addr_copy()
(instead of using memcpy()).

Else, if get_registers() failed instead, a randomly generated MAC
address is set as the MAC address instead.

Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Acked-by: Petko Manolov <petkan@nucleusys.com>
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/rtl8150.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 80373a9171dd2..933d1a74bcdb3 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -277,12 +277,20 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
 		return 1;
 }
 
-static inline void set_ethernet_addr(rtl8150_t * dev)
+static void set_ethernet_addr(rtl8150_t *dev)
 {
-	u8 node_id[6];
+	u8 node_id[ETH_ALEN];
+	int ret;
+
+	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
 
-	get_registers(dev, IDR, sizeof(node_id), node_id);
-	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
+	if (ret == sizeof(node_id)) {
+		ether_addr_copy(dev->netdev->dev_addr, node_id);
+	} else {
+		eth_hw_addr_random(dev->netdev);
+		netdev_notice(dev->netdev, "Assigned a random MAC address: %pM\n",
+			      dev->netdev->dev_addr);
+	}
 }
 
 static int rtl8150_set_mac_address(struct net_device *netdev, void *p)
-- 
2.25.1

