Return-Path: <SRS0=bSdY=WX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33401C3A5A6
	for <linux-usb@archiver.kernel.org>; Tue, 27 Aug 2019 10:03:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15432206BB
	for <linux-usb@archiver.kernel.org>; Tue, 27 Aug 2019 10:03:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbfH0KDu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Aug 2019 06:03:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:27292 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727788AbfH0KDu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 06:03:50 -0400
X-IronPort-AV: E=Sophos;i="5.64,436,1559487600"; 
   d="scan'208";a="25044201"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Aug 2019 19:03:47 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B3DD640061AA;
        Tue, 27 Aug 2019 19:03:47 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] usb: host: xhci-{plat,rcar}: clean up and add a workaround
Date:   Tue, 27 Aug 2019 19:02:03 +0900
Message-Id: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series is based on the latest Greg's linux-usb.git /
usb-next branch.

From patch 1 to 3 are clean-up patches and patch 4 is adding
a workaround code for a specific condition. So, I don't think
the patch 4 is not a fixed patch.

Yoshihiro Shimoda (4):
  usb: host: xhci-plat: add quirks member into struct xhci_plat_priv
  usb: host: xhci-rcar: Add a helper macro to set xhci_plat_priv
  usb: host: xhci-rcar: Use xhci_plat_priv.quirks instead of code
    settings
  usb: host: xhci-rcar: avoid 60s wait by request_firmware() in system
    booting

 drivers/usb/host/xhci-plat.c | 14 +++++---------
 drivers/usb/host/xhci-plat.h |  2 ++
 drivers/usb/host/xhci-rcar.c | 34 +++++-----------------------------
 drivers/usb/host/xhci-rcar.h | 21 +++++++++++++++++++++
 4 files changed, 33 insertions(+), 38 deletions(-)

-- 
2.7.4

