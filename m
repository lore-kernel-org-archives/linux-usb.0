Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF72C433E0
	for <linux-usb@archiver.kernel.org>; Fri, 19 Feb 2021 09:39:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49D5B64DFD
	for <linux-usb@archiver.kernel.org>; Fri, 19 Feb 2021 09:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhBSJjV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 19 Feb 2021 04:39:21 -0500
Received: from rtits2.realtek.com ([211.75.126.72]:47770 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhBSJjU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 04:39:20 -0500
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 11J9ccbmF020372, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs04.realtek.com.tw[172.21.6.97])
        by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 11J9ccbmF020372
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 19 Feb 2021 17:38:38 +0800
Received: from fc32.localdomain (172.21.177.102) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 19 Feb
 2021 17:38:38 +0800
From:   Hayes Wang <hayeswang@realtek.com>
To:     <netdev@vger.kernel.org>
CC:     <nic_swsd@realtek.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, Hayes Wang <hayeswang@realtek.com>
Subject: [PATCH net] r8152: move r8153_mac_clk_spd
Date:   Fri, 19 Feb 2021 17:38:03 +0800
Message-ID: <1394712342-15778-346-Taiwan-albertk@realtek.com>
X-Mailer: Microsoft Office Outlook 11
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.21.177.102]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20210219093803.Pbt8zX46KeD7pGM4UB97jelte19JdOHLkUIIvo7kQNA@z>

Move calling r8153_mac_clk_spd() from r8153_first_init() to rtl8153_up(),
and from r8153_enter_oob() to rtl8153_down().

r8153_mac_clk_spd() is used for RTL8153A. However, RTL8153B use
r8153_first_init() and r8153_enter_oob(), too. Therefore,
r8153_mac_clk_spd() needs to be moved.

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 drivers/net/usb/r8152.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 67cd6986634f..ec29878db566 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -4678,7 +4678,6 @@ static void r8153_first_init(struct r8152 *tp)
 {
 	u32 ocp_data;
 
-	r8153_mac_clk_spd(tp, false);
 	rxdy_gated_en(tp, true);
 	r8153_teredo_off(tp);
 
@@ -4729,8 +4728,6 @@ static void r8153_enter_oob(struct r8152 *tp)
 {
 	u32 ocp_data;
 
-	r8153_mac_clk_spd(tp, true);
-
 	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL);
 	ocp_data &= ~NOW_IS_OOB;
 	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL, ocp_data);
@@ -4956,6 +4953,7 @@ static void rtl8153_up(struct r8152 *tp)
 	r8153_u1u2en(tp, false);
 	r8153_u2p3en(tp, false);
 	r8153_aldps_en(tp, false);
+	r8153_mac_clk_spd(tp, false);
 	r8153_first_init(tp);
 
 	ocp_data = ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CONFIG6);
@@ -5003,6 +5001,7 @@ static void rtl8153_down(struct r8152 *tp)
 	r8153_u2p3en(tp, false);
 	r8153_power_cut_en(tp, false);
 	r8153_aldps_en(tp, false);
+	r8153_mac_clk_spd(tp, true);
 	r8153_enter_oob(tp);
 	r8153_aldps_en(tp, true);
 }
-- 
2.26.2

