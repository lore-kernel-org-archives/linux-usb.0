Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2E3C77B7E
	for <linux-usb@archiver.kernel.org>; Tue,  2 May 2023 08:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbjEBIVG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 May 2023 04:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233812AbjEBIVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 04:21:04 -0400
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027724EE9;
        Tue,  2 May 2023 01:20:48 -0700 (PDT)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
        by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2436024DB84;
        Tue,  2 May 2023 16:18:07 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 2 May
 2023 16:18:07 +0800
Received: from ubuntu.localdomain (183.27.99.121) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 2 May
 2023 16:18:06 +0800
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
Subject: [PATCH v1 0/2] Add clock and reset in cdns3 platform
Date:   Tue, 2 May 2023 16:18:03 +0800
Message-ID: <20230502081805.112149-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.99.121]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patchset is add generic clock and reset init codes in
Cadence USBSS controller.

This patchset is base on v6.3-rc4.

patch 1 is add clock and reset dts in cdns3 dt-binding doc.
patch 2 is cdns3 platform codes changes.

Minda Chen (2):
  dt-binding: cdns,usb3: Add clock and reset
  usb: cdns3: cdns3-plat: Add clk and reset init

 .../devicetree/bindings/usb/cdns,usb3.yaml    | 12 +++++
 drivers/usb/cdns3/cdns3-plat.c                | 52 +++++++++++++++++++
 drivers/usb/cdns3/core.h                      |  3 ++
 3 files changed, 67 insertions(+)


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
-- 
2.17.1
