Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0356C47082
	for <linux-usb@archiver.kernel.org>; Mon,  7 Jun 2021 20:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7F4B611AE
	for <linux-usb@archiver.kernel.org>; Mon,  7 Jun 2021 20:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhFGUwE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 7 Jun 2021 16:52:04 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:33631 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230438AbhFGUwD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 16:52:03 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id f2d6f560-c7d1-11eb-9eb8-005056bdd08f;
        Mon, 07 Jun 2021 23:50:10 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 1/3] usb: typec: intel_pmc_mux: Put fwnode in error case during ->probe()
Date:   Mon,  7 Jun 2021 23:50:05 +0300
Message-Id: <20210607205007.71458-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

device_get_next_child_node() bumps a reference counting of a returned variable.
We have to balance it whenever we return to the caller.

Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v2: moved put call into the conditional inside the loop (Heikki)
 drivers/usb/typec/mux/intel_pmc_mux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index dc8689db0100..221aa1c0e77a 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -654,8 +654,10 @@ static int pmc_usb_probe(struct platform_device *pdev)
 			break;
 
 		ret = pmc_usb_register_port(pmc, i, fwnode);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(fwnode);
 			goto err_remove_ports;
+		}
 	}
 
 	platform_set_drvdata(pdev, pmc);
-- 
2.32.0

