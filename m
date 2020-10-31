Return-Path: <SRS0=qLpr=EG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82942C4742C
	for <linux-usb@archiver.kernel.org>; Sat, 31 Oct 2020 01:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3342A20727
	for <linux-usb@archiver.kernel.org>; Sat, 31 Oct 2020 01:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgJaBgZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Oct 2020 21:36:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7012 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgJaBgZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Oct 2020 21:36:25 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CNMGH6WfMzhbs6;
        Sat, 31 Oct 2020 09:36:23 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 09:36:15 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <alcooperx@gmail.com>, <gregkh@linuxfoundation.org>,
        <f.fainelli@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>
CC:     <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next v2] usb: Mark sync_all_pins() with static keyword
Date:   Sat, 31 Oct 2020 09:48:09 +0800
Message-ID: <1604108889-15205-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following sparse warning:

./brcmstb-usb-pinmap.c:219:6: warning: symbol 'sync_all_pins' was not declared. Should it be static?

The sync_all_pins has only call site within brcmstb-usb-pinmap.c
Mark it static as suggested.

Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
v2:
- Make title more precise.
- Shorten the warning path.
- Add period.
 drivers/usb/misc/brcmstb-usb-pinmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/brcmstb-usb-pinmap.c b/drivers/usb/misc/brcmstb-usb-pinmap.c
index 02144c3..cc9618d 100644
--- a/drivers/usb/misc/brcmstb-usb-pinmap.c
+++ b/drivers/usb/misc/brcmstb-usb-pinmap.c
@@ -216,7 +216,7 @@ static int parse_pins(struct device *dev, struct device_node *dn,
 	return 0;
 }
 
-void sync_all_pins(struct brcmstb_usb_pinmap_data *pdata)
+static void sync_all_pins(struct brcmstb_usb_pinmap_data *pdata)
 {
 	struct out_pin *pout;
 	struct in_pin *pin;
-- 
2.6.2

