Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E68C433ED
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 09:14:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 934506113C
	for <linux-usb@archiver.kernel.org>; Thu,  8 Apr 2021 09:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhDHJOI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 8 Apr 2021 05:14:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:16829 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbhDHJOG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 05:14:06 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGFrG3BpFz93fq;
        Thu,  8 Apr 2021 17:11:42 +0800 (CST)
Received: from huawei.com (10.67.165.24) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 17:13:46 +0800
From:   Longfang Liu <liulongfang@huawei.com>
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <stern@rowland.harvard.edu>, <liudongdong3@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <liulongfang@huawei.com>, <kong.kongxinwei@hisilicon.com>,
        <yisen.zhuang@huawei.com>
Subject: [PATCH 0/2] USB:ehci:fix the no SRBN register problem
Date:   Thu, 8 Apr 2021 17:11:11 +0800
Message-ID: <1617873073-37371-1-git-send-email-liulongfang@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(1) Add a whitelist for EHCI devices without SBRN registers.
(2) Add Kunpeng920's EHCI device to the whitelist.

Longfang Liu (2):
  USB:ehci:Add a whitelist for EHCI controllers
  USB:ehci:fix Kunpeng920 ehci hardware problem

 drivers/usb/host/ehci-pci.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

-- 
2.8.1

