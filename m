Return-Path: <SRS0=sEZ0=UY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FABC48BD7
	for <linux-usb@archiver.kernel.org>; Tue, 25 Jun 2019 05:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BAD820659
	for <linux-usb@archiver.kernel.org>; Tue, 25 Jun 2019 05:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbfFYFjf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Jun 2019 01:39:35 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53837 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728311AbfFYFjf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 01:39:35 -0400
X-IronPort-AV: E=Sophos;i="5.62,413,1554735600"; 
   d="scan'208";a="19607549"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2019 14:39:32 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5AAC240031EF;
        Tue, 25 Jun 2019 14:39:32 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/13] usb: renesas_usbhs: refactor this driver
Date:   Tue, 25 Jun 2019 14:38:44 +0900
Message-Id: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series is based on Greg's usb.git / usb-next branch.

The previous code had redundant memory allocations so that
the code readability was not good. I believe this patch series
makes it better.

Yoshihiro Shimoda (13):
  usb: renesas_usbhs: revise the irq_vbus comments
  usb: renesas_usbhs: remove notify_hotplug callback
  usb: renesas_usbhs: move macros from mod.c to the mod.h
  usb: renesas_usbhs: Avoid to write platform_data's value
  usb: renesas_usbhs: Use a specific flag instead of type for multi_clks
  usb: renesas_usbhs: Remove type member from renesas_usbhs_driver_param
  usb: renesas_usbhs: Use dev_of_node macro instead of open coded
  usb: renesas_usbhs: Add has_new_pipe_configs flag
  usb: renesas_usbhs: Add struct device * declaration in usbhs_probe()
  usb: renesas_usbhs: move device tree properties parsing
  usb: renesas_usbhs: Add a common function for the .get_id
  usb: renesas_usbhs: Use renesas_usbhs_platform_info on
    of_device_id.data
  usb: renesas_usbhs: Use struct platform_callback pointer

 drivers/usb/renesas_usbhs/common.c     | 197 +++++++++++----------------------
 drivers/usb/renesas_usbhs/common.h     |  11 +-
 drivers/usb/renesas_usbhs/fifo.c       |   3 +-
 drivers/usb/renesas_usbhs/mod.c        |  23 ++--
 drivers/usb/renesas_usbhs/mod.h        |  26 ++++-
 drivers/usb/renesas_usbhs/mod_gadget.c |   7 +-
 drivers/usb/renesas_usbhs/rcar2.c      |  22 ++--
 drivers/usb/renesas_usbhs/rcar2.h      |   3 +-
 drivers/usb/renesas_usbhs/rcar3.c      |  33 ++++--
 drivers/usb/renesas_usbhs/rcar3.h      |   5 +-
 drivers/usb/renesas_usbhs/rza.c        |  18 +--
 drivers/usb/renesas_usbhs/rza.h        |   4 +-
 drivers/usb/renesas_usbhs/rza2.c       |  22 ++--
 include/linux/usb/renesas_usbhs.h      |  35 +-----
 14 files changed, 168 insertions(+), 241 deletions(-)

-- 
2.7.4

