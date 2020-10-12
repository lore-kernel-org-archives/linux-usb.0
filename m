Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4CEC433DF
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:09:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A2A121D7F
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529790;
	bh=0a+Di7YlgN5HRSShppmp+yVKmT72PyxoFLhMjy+6XGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ISkQbwMi5Xi8Deio9czgTo0phiLRRHVuJCDYkOLjWgWdYeFbS4WRIbQCP3DAg/hDG
	 7lCUGc7UkfOFa5qlBJI5V7HqMul2vvi/l8wEtzBYsqNHjZIBUeak3SgrJ4cJGUbOsD
	 QEoWNtBl33qgwTkwE3iS34Wf+29RNY3Im/N4M620=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388079AbgJLTJb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:09:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:52196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730847AbgJLTCy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 15:02:54 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E6BA208FE;
        Mon, 12 Oct 2020 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602529373;
        bh=0a+Di7YlgN5HRSShppmp+yVKmT72PyxoFLhMjy+6XGI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0mLB7VgwvqcIB7OmAbBAt8Fy51oEP1RjC9rsw3o1+c1UU+ZdUIJxJrKO0a8iKOEjh
         HkrHw+lI7GIvGnYU92bxXpPwNKTuNDV6YpXajSNAK5V185XSYJQIjrMAgFh6Do/td6
         AMs0HGRIPrPVmftubNv1p3AQ6VD42L4kHEVV5+04=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wilken Gottwalt <wilken.gottwalt@mailbox.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 10/24] net: usb: ax88179_178a: add Toshiba usb 3.0 adapter
Date:   Mon, 12 Oct 2020 15:02:25 -0400
Message-Id: <20201012190239.3279198-10-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012190239.3279198-1-sashal@kernel.org>
References: <20201012190239.3279198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wilken Gottwalt <wilken.gottwalt@mailbox.org>

[ Upstream commit e42d72fea91f8f2e82b65808739ca04b7a8cd7a8 ]

Adds the driver_info and usb ids of the AX88179 based Toshiba USB 3.0
ethernet adapter.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@mailbox.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/ax88179_178a.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index a38e868e44d46..125f7bf57590b 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1828,6 +1828,19 @@ static const struct driver_info belkin_info = {
 	.tx_fixup = ax88179_tx_fixup,
 };
 
+static const struct driver_info toshiba_info = {
+	.description = "Toshiba USB Ethernet Adapter",
+	.bind	= ax88179_bind,
+	.unbind = ax88179_unbind,
+	.status = ax88179_status,
+	.link_reset = ax88179_link_reset,
+	.reset	= ax88179_reset,
+	.stop = ax88179_stop,
+	.flags	= FLAG_ETHER | FLAG_FRAMING_AX,
+	.rx_fixup = ax88179_rx_fixup,
+	.tx_fixup = ax88179_tx_fixup,
+};
+
 static const struct usb_device_id products[] = {
 {
 	/* ASIX AX88179 10/100/1000 */
@@ -1861,6 +1874,10 @@ static const struct usb_device_id products[] = {
 	/* Belkin B2B128 USB 3.0 Hub + Gigabit Ethernet Adapter */
 	USB_DEVICE(0x050d, 0x0128),
 	.driver_info = (unsigned long)&belkin_info,
+}, {
+	/* Toshiba USB 3.0 GBit Ethernet Adapter */
+	USB_DEVICE(0x0930, 0x0a13),
+	.driver_info = (unsigned long)&toshiba_info,
 },
 	{ },
 };
-- 
2.25.1

