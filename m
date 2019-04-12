Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD433C10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 10:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACE3C2083E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 10:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbfDLKXM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:23:12 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:27960 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726327AbfDLKXL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 06:23:11 -0400
X-IronPort-AV: E=Sophos;i="5.60,340,1549897200"; 
   d="scan'208";a="12867509"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Apr 2019 19:23:10 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B92B542F9419;
        Fri, 12 Apr 2019 19:23:07 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V3 5/7] arm64: defconfig: enable TYPEC_HD3SS3220 config option
Date:   Fri, 12 Apr 2019 11:16:17 +0100
Message-Id: <1555064179-15626-6-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
References: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412101617.CZCzKB6bM66xVzbS61ehA7qk9Vggenv3MOsQTEefMSI@z>

Enable support for the TI HD3SS320 USB Type-C DRP Port controller driver
by turning on CONFIG_TYPEC and CONFIG_TYPEC_HD3SS3220 as modules.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V2-->V3
  * No change
V1-->V2
  * No change
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d06825f..16cb687 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -578,6 +578,8 @@ CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
 CONFIG_USB_RENESAS_USB3=m
+CONFIG_TYPEC=m
+CONFIG_TYPEC_HD3SS3220=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.7.4

