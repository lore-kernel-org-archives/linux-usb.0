Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A99C282DA
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 09:44:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9025220684
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 09:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbfDPJow (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 05:44:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:10628 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726895AbfDPJow (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 05:44:52 -0400
X-IronPort-AV: E=Sophos;i="5.60,357,1549897200"; 
   d="scan'208";a="13414210"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Apr 2019 18:44:49 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 38C534038498;
        Tue, 16 Apr 2019 18:44:46 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V4 0/7] Add USB3.0 and TI HD3SS3220 driver support
Date:   Tue, 16 Apr 2019 10:38:00 +0100
Message-Id: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series adds USB 3.0 support for the CAT874 platform, including a
new driver for the TI HD3SS3220 USB Type-C DRP port controller.

This patch series supports:
1) Host hotplug operation
2) Device hot plug operation
3) USB type-C data_role switch
   (Tested with 2 RZ/G2E boards connected with a Type-C cable)

This patchset is based on linux_next next-20190411 branch.
V3-->V4
  * Incorporated Chunfeng Yun's review comment
    (https://patchwork.kernel.org/project/linux-usb/list/?submitter=133171)
  * Used fwnode API's to get roleswitch handle

V2-->V3
  * Used the new API to usb_role_switch by node to find the remote endpoint
    (https://patchwork.kernel.org/patch/10882555/)
  * Added renesas,usb-role-switch property
  * Incorporated shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10852507/)

V1-->V2
  * Use USB role class instead of extcon to receive connect and disconnect
    events and also for the dual role switch.
  * Dropped patch 6
  * Squashed patch 8 and patch 9
  * https://patchwork.kernel.org/cover/10840641/


Biju Das (7):
  dt-bindings: usb: hd3ss3220 device tree binding document
  dt-bindings: usb: renesas_usb3: Add renesas,usb-role-switch property
  usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
  usb: gadget: udc: renesas_usb3: Use usb_role_switch framework
  arm64: defconfig: enable TYPEC_HD3SS3220 config option
  arm64: dts: renesas: r8a774c0-cat874: Enable USB3.0 host/peripheral
    device node
  arm64: dts: renesas: r8a774c0-cat874: Enable usb role switch support

 .../devicetree/bindings/usb/renesas_usb3.txt       |  22 ++
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  37 +++
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |  56 +++++
 arch/arm64/configs/defconfig                       |   2 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 126 ++++++++--
 drivers/usb/typec/Kconfig                          |  10 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/hd3ss3220.c                      | 263 +++++++++++++++++++++
 8 files changed, 495 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 drivers/usb/typec/hd3ss3220.c

-- 
2.7.4

