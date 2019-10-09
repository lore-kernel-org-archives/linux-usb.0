Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F16AECE58D
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 08:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F1C2206C0
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 08:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbfJIIdd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 04:33:33 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37890 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbfJIIdd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 04:33:33 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E8759EA64E1B4E4E2FBD;
        Wed,  9 Oct 2019 16:33:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 16:33:23 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 0/2] usb: gadget: Remove set but not used variable 'opts'
Date:   Wed, 9 Oct 2019 16:40:32 +0800
Message-ID: <1570610434-68293-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

zhengbin (2):
  usb: gadget: Remove set but not used variable 'opts' in
    acm_ms_do_config
  usb: gadget: Remove set but not used variable 'opts' in msg_do_config

 drivers/usb/gadget/legacy/acm_ms.c       | 3 ---
 drivers/usb/gadget/legacy/mass_storage.c | 3 ---
 2 files changed, 6 deletions(-)

--
2.7.4

