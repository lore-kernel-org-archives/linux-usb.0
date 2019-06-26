Return-Path: <SRS0=I8I8=UZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA43C48BD6
	for <linux-usb@archiver.kernel.org>; Wed, 26 Jun 2019 03:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C1BE205ED
	for <linux-usb@archiver.kernel.org>; Wed, 26 Jun 2019 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561520816;
	bh=snwXb/1Pl27ttUkLcEKMD4IYTwwdeDCbPOUtZ32LCu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ubN5XEE8zFc0KhJy5zjB1IFsivbJJg7k0tvZJnLo1sXnUZb/HvFj17qjYMCcC0U8E
	 EhSUSDJVboEg1yBIxVDKoDc5FVcCCOmAaqp+zW8dx8q+rz7qXI/snvRKEdS+kIzOwM
	 nArD0T3ysxWsZImW4MRctxqM5m7jj1OOOuq7EvnI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfFZDqz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 25 Jun 2019 23:46:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:58792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728044AbfFZDqw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Jun 2019 23:46:52 -0400
Received: from sasha-vm.mshome.net (mobile-107-77-172-90.mobile.att.net [107.77.172.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A59A205ED;
        Wed, 26 Jun 2019 03:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561520811;
        bh=snwXb/1Pl27ttUkLcEKMD4IYTwwdeDCbPOUtZ32LCu4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UcGKrI0WPr8AbfjB+URD5wgjeDCqyc7N7OIyRf+sYkHAor6d9GtE0SrGknW/GkU/g
         W1OHd4flqLb/qStT9uSwba3u6S6akOh4bSwKuwDWqYS9hcGBimcspfYgnIHSrEQoIG
         qKEYwkhdrZutCYhLrhmXg8aYYoKZDv/qNS8Lz7rg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        James Grant <jamesg@zaltys.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 5/6] usb: gadget: udc: lpc32xx: allocate descriptor with GFP_ATOMIC
Date:   Tue, 25 Jun 2019 23:46:36 -0400
Message-Id: <20190626034637.24515-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034637.24515-1-sashal@kernel.org>
References: <20190626034637.24515-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

[ Upstream commit fbc318afadd6e7ae2252d6158cf7d0c5a2132f7d ]

Gadget drivers may queue request in interrupt context. This would lead to
a descriptor allocation in that context. In that case we would hit
BUG_ON(in_interrupt()) in __get_vm_area_node.

Also remove the unnecessary cast.

Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
Tested-by: James Grant <jamesg@zaltys.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 00b5006baf15..90d24f62bd81 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -964,8 +964,7 @@ static struct lpc32xx_usbd_dd_gad *udc_dd_alloc(struct lpc32xx_udc *udc)
 	dma_addr_t			dma;
 	struct lpc32xx_usbd_dd_gad	*dd;
 
-	dd = (struct lpc32xx_usbd_dd_gad *) dma_pool_alloc(
-			udc->dd_cache, (GFP_KERNEL | GFP_DMA), &dma);
+	dd = dma_pool_alloc(udc->dd_cache, GFP_ATOMIC | GFP_DMA, &dma);
 	if (dd)
 		dd->this_dma = dma;
 
-- 
2.20.1

