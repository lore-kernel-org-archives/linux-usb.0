Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1835EC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D03872073A
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529432;
	bh=yc5ToqQBeI1kMjuCP1DzHiu1scibGxVSvt3cv7/DZr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=2R2skbt0+Zi9z31Xb1erBh49F/aayc8YKhmqS7I4RnjMZxt7/FnZh/yuUt6M5wrnY
	 KNEr+aOPv74lW4A3PwbayaoJDx89t3ixcaFAExL0MYrfJHpqLf7U2jaHqahgno0Z7X
	 pQwNJRtK+d7rQKdvI/S9pIfgqkVD86RqbJXnjqrM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391124AbgJLTDo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:03:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391075AbgJLTDn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 15:03:43 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1266B21BE5;
        Mon, 12 Oct 2020 19:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602529422;
        bh=yc5ToqQBeI1kMjuCP1DzHiu1scibGxVSvt3cv7/DZr8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n2hQPnHdqtnB5IBZbKisQ+T+Diwkn99m9BLHReSjUNa7UBHj4gnkBWqlI2T2xWhnh
         of2GdORX0iftzT+feclK+rPMTLwlgiYLebB8P2XXV4lx2IWLy7QuAj/FDsx7tsYdu2
         tzxswLbNpmv9NOozOUg10yxJ4FtuX+mdLLFx/znI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wilken Gottwalt <wilken.gottwalt@mailbox.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 05/12] net: usb: ax88179_178a: add MCT usb 3.0 adapter
Date:   Mon, 12 Oct 2020 15:03:28 -0400
Message-Id: <20201012190335.3279538-5-sashal@kernel.org>
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

From: Wilken Gottwalt <wilken.gottwalt@mailbox.org>

[ Upstream commit c92a79829c7c169139874aa1d4bf6da32d10c38a ]

Adds the driver_info and usb ids of the AX88179 based MCT U3-A9003 USB
3.0 ethernet adapter.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@mailbox.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/ax88179_178a.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index ba6c6f834c508..25308a793231c 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1753,6 +1753,19 @@ static const struct driver_info toshiba_info = {
 	.tx_fixup = ax88179_tx_fixup,
 };
 
+static const struct driver_info mct_info = {
+	.description = "MCT USB 3.0 Gigabit Ethernet Adapter",
+	.bind	= ax88179_bind,
+	.unbind	= ax88179_unbind,
+	.status	= ax88179_status,
+	.link_reset = ax88179_link_reset,
+	.reset	= ax88179_reset,
+	.stop	= ax88179_stop,
+	.flags	= FLAG_ETHER | FLAG_FRAMING_AX,
+	.rx_fixup = ax88179_rx_fixup,
+	.tx_fixup = ax88179_tx_fixup,
+};
+
 static const struct usb_device_id products[] = {
 {
 	/* ASIX AX88179 10/100/1000 */
@@ -1790,6 +1803,10 @@ static const struct usb_device_id products[] = {
 	/* Toshiba USB 3.0 GBit Ethernet Adapter */
 	USB_DEVICE(0x0930, 0x0a13),
 	.driver_info = (unsigned long)&toshiba_info,
+}, {
+	/* Magic Control Technology U3-A9003 USB 3.0 Gigabit Ethernet Adapter */
+	USB_DEVICE(0x0711, 0x0179),
+	.driver_info = (unsigned long)&mct_info,
 },
 	{ },
 };
-- 
2.25.1

