Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49859C6FD1C
	for <linux-usb@archiver.kernel.org>; Mon, 13 Mar 2023 03:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjCMDGp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 12 Mar 2023 23:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjCMDGg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Mar 2023 23:06:36 -0400
Received: from mail-m11879.qiye.163.com (mail-m11879.qiye.163.com [115.236.118.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF3C27485;
        Sun, 12 Mar 2023 20:06:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [58.22.7.114])
        by mail-m11879.qiye.163.com (Hmail) with ESMTPA id EC7F368054C;
        Mon, 13 Mar 2023 10:58:47 +0800 (CST)
From:   Frank Wang <frank.wang@rock-chips.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, heiko@sntech.de
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
        william.wu@rock-chips.com, jianwei.zheng@rock-chips.com,
        yubing.zhang@rock-chips.com, wmc@rock-chips.com,
        Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH 4/4] usb: typec: tcpm: fix source caps may lost after soft reset
Date:   Mon, 13 Mar 2023 10:58:43 +0800
Message-Id: <20230313025843.17162-5-frank.wang@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230313025843.17162-1-frank.wang@rock-chips.com>
References: <20230313025843.17162-1-frank.wang@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
        tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU0fGlYYHhkeTB5ISExPHk5VEwETFh
        oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSkpLSEpMVUpLS1VLWQ
        Y+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06Hyo*GT0JIS9MURw0TzI*
        TCNPFBdVSlVKTUxDTUxNSElDQ0hJVTMWGhIXVR0JGhUQVQwaFRw7CRQYEFYYExILCFUYFBZFWVdZ
        EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFITk1ONwY+
X-HM-Tid: 0a86d8e7ff4c2eb5kusnec7f368054c
X-HM-MType: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Invoke set_pd_rx() may flush the RX FIFO of PD controller, so do
set_pd_rx() before sending Soft Reset in case Source caps may be flushed
at debounce time between SOFT_RESET_SEND and SNK_WAIT_CAPABILITIES state.

Without this patch, in PD charger stress test, the FUSB302 driver may
occur the following exceptions in power negotiation stage.

[ ...]
[ 4.512252] fusb302_irq_intn
[ 4.512260] AMS SOFT_RESET_AMS finished
[ 4.512269] state change SOFT_RESET_SEND ->SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
[ 4.514511] pd := on
[ 4.514516] pending state change SNK_WAIT_CAPABILITIES ->HARD_RESET_SEND @ 310 ms [rev3 NONE_AMS]
[ 4.515428] IRQ: 0x51, a: 0x00, b: 0x01, status0: 0x93
[ 4.515431] IRQ: BC_LVL, handler pending
[ 4.515435] IRQ: PD sent good CRC
[ 4.516434] PD message header: 0
[ 4.516437] PD message len: 0
[ 4.516444] PD RX, header: 0x0 [1]

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 9e583060e64fc..ba6bf71838eed 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4321,10 +4321,12 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_set_state(port, unattached_state(port), 0);
 		break;
 	case SNK_WAIT_CAPABILITIES:
-		ret = port->tcpc->set_pd_rx(port->tcpc, true);
-		if (ret < 0) {
-			tcpm_set_state(port, SNK_READY, 0);
-			break;
+		if (port->prev_state != SOFT_RESET_SEND) {
+			ret = port->tcpc->set_pd_rx(port->tcpc, true);
+			if (ret < 0) {
+				tcpm_set_state(port, SNK_READY, 0);
+				break;
+			}
 		}
 		/*
 		 * If VBUS has never been low, and we time out waiting
@@ -4603,6 +4605,7 @@ static void run_state_machine(struct tcpm_port *port)
 	case SOFT_RESET_SEND:
 		port->message_id = 0;
 		port->rx_msgid = -1;
+		port->tcpc->set_pd_rx(port->tcpc, true);
 		if (tcpm_pd_send_control(port, PD_CTRL_SOFT_RESET))
 			tcpm_set_state_cond(port, hard_reset_state(port), 0);
 		else
-- 
2.17.1

