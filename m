Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0782AC77B61
	for <linux-usb@archiver.kernel.org>; Tue, 25 Apr 2023 01:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbjDYB4I (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 24 Apr 2023 21:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjDYB4I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Apr 2023 21:56:08 -0400
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEBA19BF;
        Mon, 24 Apr 2023 18:56:06 -0700 (PDT)
Received: from pride-poweredge-r740.. ([172.16.0.254])
        (user=lihuya@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 33P1tmux021762-33P1tmv0021762
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 25 Apr 2023 09:55:48 +0800
From:   Liang Yuhang <lihuya@hust.edu.cn>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Liang Yuhang <lihuya@hust.edu.cn>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] usb: dwc3: remove dead code in dwc3_otg_get_irq
Date:   Tue, 25 Apr 2023 09:55:32 +0800
Message-Id: <20230425015532.13622-1-lihuya@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: lihuya@hust.edu.cn
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

platform_get_irq() only return non-zero irq number on success, or
negative error number on failure.

There is no need to check the return value of platform_get_irq()
to determine the return value of dwc3_otg_get_irq(), removing
them to solve this problem.

Signed-off-by: Liang Yuhang <lihuya@hust.edu.cn>

---
v1 -> v2: change name to real name
---
 drivers/usb/dwc3/drd.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 039bf241769a..c2e09700212d 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -154,11 +154,6 @@ static int dwc3_otg_get_irq(struct dwc3 *dwc)
 		goto out;
 
 	irq = platform_get_irq(dwc3_pdev, 0);
-	if (irq > 0)
-		goto out;
-
-	if (!irq)
-		irq = -EINVAL;
 
 out:
 	return irq;
-- 
2.34.1

