Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FA1C4332F
	for <linux-usb@archiver.kernel.org>; Mon,  4 Apr 2022 08:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239340AbiDDIvd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 4 Apr 2022 04:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiDDIva (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 04:51:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832C91DA5C
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 01:49:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbIOy-0004pL-R1; Mon, 04 Apr 2022 10:49:32 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nanKx-000dFD-0U; Sun, 03 Apr 2022 01:39:17 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nanKu-00FD9Q-8m; Sun, 03 Apr 2022 01:39:16 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: [PATCH 0/5] usb: gadget: uvc: fixes and improvements
Date:   Sun,  3 Apr 2022 01:39:09 +0200
Message-Id: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series includes several patches to improve the overall usb uvc
gadget code. It includes some style changes and some serious fixes.

Michael Grzeschik (5):
  usb: gadget: uvc: reset bytesused on queue cancel
  usb: gadget: uvc: calculate the number of request depending on
    framesize
  usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
  usb: gadget: uvc: call uvc uvcg_warn on completed status instead of
    uvcg_info
  usb: gadget: uvc: stop the pump on more conditions

 drivers/usb/gadget/function/uvc.h       |  1 +
 drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
 drivers/usb/gadget/function/uvc_v4l2.c  |  2 +-
 drivers/usb/gadget/function/uvc_video.c | 13 +++++++++----
 4 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.30.2

