Return-Path: <SRS0=SlCS=BG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2A5C433E4
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jul 2020 17:02:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 527722074F
	for <linux-usb@archiver.kernel.org>; Mon, 27 Jul 2020 17:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbgG0RCI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 27 Jul 2020 13:02:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:8831 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726979AbgG0RCI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 13:02:08 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 496559162BB968D62170;
        Tue, 28 Jul 2020 01:02:05 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Jul 2020 01:01:58 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>
Subject: [PATCH -next] xhci: dbgtty: Make some functions static
Date:   Tue, 28 Jul 2020 01:11:49 +0800
Message-ID: <20200727171149.3011-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The sparse tool complains as follows:

drivers/usb/host/xhci-dbgtty.c:401:5: warning:
 symbol 'xhci_dbc_tty_register_device' was not declared. Should it be static?
drivers/usb/host/xhci-dbgtty.c:452:6: warning:
 symbol 'xhci_dbc_tty_unregister_device' was not declared. Should it be static?

After commit 6ae6470bfa33 ("xhci: dbc: Add a operations structure
to access driver functions"), those functions are not used outside
of xhci-dbgtty.c, so this commit marks them static.

Fixes: 6ae6470bfa33 ("xhci: dbc: Add a operations structure to access driver functions")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/host/xhci-dbgtty.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 0b942112b6f8..b8918f73a432 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -398,7 +398,7 @@ xhci_dbc_tty_exit_port(struct dbc_port *port)
 	tty_port_destroy(&port->port);
 }
 
-int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
+static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 {
 	int			ret;
 	struct device		*tty_dev;
@@ -449,7 +449,7 @@ int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 	return ret;
 }
 
-void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
+static void xhci_dbc_tty_unregister_device(struct xhci_dbc *dbc)
 {
 	struct dbc_port		*port = dbc_to_port(dbc);
 

