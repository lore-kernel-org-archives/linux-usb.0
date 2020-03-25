Return-Path: <SRS0=PfVG=5K=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3B2C54FCF
	for <linux-usb@archiver.kernel.org>; Wed, 25 Mar 2020 06:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FBEE20719
	for <linux-usb@archiver.kernel.org>; Wed, 25 Mar 2020 06:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgCYGRJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 25 Mar 2020 02:17:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:26252 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725815AbgCYGRJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 02:17:09 -0400
X-IronPort-AV: E=Sophos;i="5.72,303,1580742000"; 
   d="scan'208";a="42785192"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Mar 2020 15:17:07 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DB91B4000FAF;
        Wed, 25 Mar 2020 15:17:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] dt-bindings: usb: add r8a77961 support
Date:   Wed, 25 Mar 2020 15:16:43 +0900
Message-Id: <1585117006-8266-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds USB 2.0/3.0 devices support for r8a77961
(R-Car M3-W+).

Yoshihiro Shimoda (3):
  dt-bindings: usb: usb-xhci: add r8a77961 support
  dt-bindings: usb: renesas,usbhs: add r8a77961 support
  dt-bindings: usb: renesas,usb3-peri: add r8a77961 support

 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml     | 1 +
 Documentation/devicetree/bindings/usb/usb-xhci.txt           | 1 +
 3 files changed, 3 insertions(+)

-- 
2.7.4

