Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD069C4332F
	for <linux-usb@archiver.kernel.org>; Sun, 20 Nov 2022 15:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiKTPho (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 20 Nov 2022 10:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiKTPhk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Nov 2022 10:37:40 -0500
Received: from mailfilter01-out40.webhostingserver.nl (mailfilter01-out40.webhostingserver.nl [195.211.73.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF243A3
        for <linux-usb@vger.kernel.org>; Sun, 20 Nov 2022 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=exalondelft.nl; s=whs1;
        h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
         subject:cc:to:from:from;
        bh=QQeRuPxvis9IApqQRvO4LcaXKr9jzOl2EQ5uHPW9pYc=;
        b=g3TCgOFNr1Fncb+ZK5iRIcw8GXA+ex+WN5HUzj0qtTb56wtMW4AugvL+IJvh80PVgFl5zewDHN1/R
         qPFAL4jZV0CUoQunPafTOGoqNNISyJ90Jfbq4aHBwkg34EI0FPEEd4EgwRTDt5+Xb7JaaHRjoSkijW
         RSPegHapfwbjmg/oFbDmskCy/CkPYteVqwpzTbprNqitXOuWVTuyZqCPYV2xGpjLOf0vo5qxsQQYJk
         KK+6eW+Oi6lUUNuZzGTujXea7c2zodqEJlukcdMqGC+yZaUACvTg4/YdxJ8wYp0/Uuh2rtiZkroHko
         bUPNq3o5Di3lzY7lZTGVjRUBsxWh4dA==
X-Halon-ID: 41c3f0a1-68e9-11ed-a6af-001a4a4cb906
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
        by mailfilter01.webhostingserver.nl (Halon) with ESMTPSA
        id 41c3f0a1-68e9-11ed-a6af-001a4a4cb906;
        Sun, 20 Nov 2022 16:37:35 +0100 (CET)
Received: from 2a02-a466-68ed-1-a813-1b80-f6b2-b786.fixed6.kpn.net ([2a02:a466:68ed:1:a813:1b80:f6b2:b786] helo=delfion.fritz.box)
        by s198.webhostingserver.nl with esmtpa (Exim 4.96)
        (envelope-from <ftoth@exalondelft.nl>)
        id 1owmNz-004Y9S-2T;
        Sun, 20 Nov 2022 16:37:35 +0100
From:   Ferry Toth <ftoth@exalondelft.nl>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Ferry Toth <fntoth@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ferry Toth <ftoth@exalondelft.nl>, stable@vger.kernel.org
Subject: [PATCH v4 2/2] usb: dwc3: core: defer probe on ulpi_read_id timeout
Date:   Sun, 20 Nov 2022 16:37:04 +0100
Message-Id: <20221120153704.9090-3-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221120153704.9090-1-ftoth@exalondelft.nl>
References: <20221120153704.9090-1-ftoth@exalondelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since commit 0f0101719138 ("usb: dwc3: Don't switch OTG -> peripheral if extcon is present"),
Dual Role support on Intel Merrifield platform broke due to rearranging
the call to dwc3_get_extcon().

It appears to be caused by ulpi_read_id() masking the timeout on the first
test write. In the past dwc3 probe continued by calling dwc3_core_soft_reset()
followed by dwc3_get_extcon() which happend to return -EPROBE_DEFER.
On deferred probe ulpi_read_id() finally succeeded. Due to above mentioned
rearranging -EPROBE_DEFER is not returned and probe completes without phy.

As we now changed ulpi_read_id() to return -ETIMEDOUT in this case, we
need to handle the error by calling dwc3_core_soft_reset() and request
-EPROBE_DEFER. On deferred probe ulpi_read_id() is retried and succeeds.

Fixes: ef6a7bcfb01c ("usb: ulpi: Support device discovery via DT")
Cc: stable@vger.kernel.org

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
---
 drivers/usb/dwc3/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 648f1c570021..2779f17bffaf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1106,8 +1106,13 @@ static int dwc3_core_init(struct dwc3 *dwc)
 
 	if (!dwc->ulpi_ready) {
 		ret = dwc3_core_ulpi_init(dwc);
-		if (ret)
+		if (ret) {
+			if (ret == -ETIMEDOUT) {
+				dwc3_core_soft_reset(dwc);
+				ret = -EPROBE_DEFER;
+			}
 			goto err0;
+		}
 		dwc->ulpi_ready = true;
 	}
 
-- 
2.37.2

