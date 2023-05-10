Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7B4C7EE22
	for <linux-usb@archiver.kernel.org>; Wed, 10 May 2023 13:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbjEJN2g (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 May 2023 09:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237091AbjEJN2c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 09:28:32 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B08949D2;
        Wed, 10 May 2023 06:28:22 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5CC7A24E00D;
        Wed, 10 May 2023 21:28:18 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 21:28:18 +0800
Received: from ubuntu.localdomain (183.27.98.219) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 21:28:17 +0800
From:   Minda Chen <minda.chen@starfivetech.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 0/2] Add clock and reset in cdns3 platform
Date:   Wed, 10 May 2023 21:28:14 +0800
Message-ID: <20230510132816.108820-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patchset is add generic clock and reset init codes in
Cadence USBSS controller.

This patchset is base on v6.4-rc1.

patch 1 is add clock and reset dts in cdns3 dt-binding doc.
patch 2 is cdns3 platform codes changes.

previous commits
v1: https://patchwork.kernel.org/project/linux-usb/cover/20230502081805.112149-1-minda.chen@starfivetech.com/

changes:
v2:
    patch 1
      - add maxItem in clocks and resets.
      - add clocks and reset in example.
    patch 2
      - suspend/resume just disable/enable clocks.

Minda Chen (2):
  dt-bindings: cdns,usb3: Add clock and reset
  usb: cdns3: cdns3-plat: Add clk and reset init

 .../devicetree/bindings/usb/cdns,usb3.yaml    | 14 +++++
 drivers/usb/cdns3/cdns3-plat.c                | 58 +++++++++++++++++++
 drivers/usb/cdns3/core.h                      |  3 +
 3 files changed, 75 insertions(+)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.17.1

