Return-Path: <SRS0=IksB=C4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F30DC43468
	for <linux-usb@archiver.kernel.org>; Sat, 19 Sep 2020 08:44:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 259FE21481
	for <linux-usb@archiver.kernel.org>; Sat, 19 Sep 2020 08:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgISInF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 19 Sep 2020 04:43:05 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:48849 "EHLO
        out28-149.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgISInF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Sep 2020 04:43:05 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1407052|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0362472-0.0550842-0.908669;FP=0|0|0|0|0|-1|-1|-1;HT=e01l10422;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.IZF-VLZ_1600504972;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IZF-VLZ_1600504972)
          by smtp.aliyun-inc.com(10.147.42.253);
          Sat, 19 Sep 2020 16:43:01 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        vkoul@kernel.org, paul@crapouillou.net
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        christophe.jaillet@wanadoo.fr, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: [PATCH v4 0/2] Use the generic PHY framework for Ingenic USB PHY.
Date:   Sat, 19 Sep 2020 16:42:23 +0800
Message-Id: <20200919084225.112072-1-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v3->v4:
Only add new generic-PHY driver, without removing the old one. Because the
jz4740-musb driver is not ready to use the generic PHY framework. When the
jz4740-musb driver is modified to use the generic PHY framework, the old
jz4770-phy driver can be "retired".

周琰杰 (Zhou Yanjie) (2):
  USB: PHY: JZ4770: Remove unnecessary function calls.
  PHY: Ingenic: Add USB PHY driver using generic PHY framework.

 drivers/phy/Kconfig                   |   1 +
 drivers/phy/Makefile                  |   1 +
 drivers/phy/ingenic/Kconfig           |  12 ++
 drivers/phy/ingenic/Makefile          |   2 +
 drivers/phy/ingenic/phy-ingenic-usb.c | 373 ++++++++++++++++++++++++++++++++++
 drivers/usb/phy/phy-jz4770.c          |   2 +-
 6 files changed, 390 insertions(+), 1 deletion(-)
 create mode 100644 drivers/phy/ingenic/Kconfig
 create mode 100644 drivers/phy/ingenic/Makefile
 create mode 100644 drivers/phy/ingenic/phy-ingenic-usb.c

-- 
2.11.0

