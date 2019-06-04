Return-Path: <SRS0=VYZK=UD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA1DC28CC6
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 04:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D248E223CB
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 04:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfFDEOd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 4 Jun 2019 00:14:33 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39132 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725267AbfFDEOd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 00:14:33 -0400
X-IronPort-AV: E=Sophos;i="5.60,549,1549897200"; 
   d="scan'208";a="17541932"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jun 2019 13:14:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4E9DD4002646;
        Tue,  4 Jun 2019 13:14:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: renesas_usbhs: remove unused features
Date:   Tue,  4 Jun 2019 13:09:33 +0900
Message-Id: <1559621375-5436-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series removes unused features of sudmac and controlling
PWEN/EXTLP.

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: remove sudmac support
  usb: renesas_usbhs: remove controlling PWEN/EXTLP support

 drivers/usb/renesas_usbhs/common.c | 4 ----
 drivers/usb/renesas_usbhs/fifo.c   | 5 +----
 include/linux/usb/renesas_usbhs.h  | 2 --
 3 files changed, 1 insertion(+), 10 deletions(-)

-- 
2.7.4

