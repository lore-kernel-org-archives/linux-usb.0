Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5019DC6FA86
	for <linux-usb@archiver.kernel.org>; Tue, 27 Sep 2022 07:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiI0HTz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Sep 2022 03:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiI0HTx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 03:19:53 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3FA4F65C
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 00:19:52 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mc9rR3fHRz1P6pY;
        Tue, 27 Sep 2022 15:15:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 15:19:50 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 15:19:49 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-usb@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <b-liu@ti.com>,
        <sergei.shtylyov@gmail.com>, <yangyingliang@huawei.com>
Subject: [PATCH -next v2 0/5] usb: musb: Switch to use dev_err_probe() helper
Date:   Tue, 27 Sep 2022 15:26:11 +0800
Message-ID: <20220927072616.913672-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset is trying to replace dev_err() with dev_err_probe() in
the probe path.

v1 -> v2:
  Remove " with status" from error message in patch #1.

Yang Yingliang (5):
  usb: musb: core: Switch to use dev_err_probe() helper
  usb: musb: da8xx: Switch to use dev_err_probe() helper
  usb: musb: cppi41: Switch to use dev_err_probe() helper
  usb: musb: jz4740: Switch to use dev_err_probe() helper
  usb: musb: sunxi: Switch to use dev_err_probe() helper

 drivers/usb/musb/da8xx.c       |  8 +++-----
 drivers/usb/musb/jz4740.c      | 10 +++-------
 drivers/usb/musb/musb_core.c   |  4 +---
 drivers/usb/musb/musb_cppi41.c |  6 ++----
 drivers/usb/musb/sunxi.c       | 29 +++++++++--------------------
 5 files changed, 18 insertions(+), 39 deletions(-)

-- 
2.25.1

