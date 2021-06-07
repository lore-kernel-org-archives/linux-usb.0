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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36660C4743F
	for <linux-usb@archiver.kernel.org>; Mon,  7 Jun 2021 20:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22F62611AE
	for <linux-usb@archiver.kernel.org>; Mon,  7 Jun 2021 20:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhFGUwF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 7 Jun 2021 16:52:05 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:33657 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230444AbhFGUwF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 16:52:05 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id f3d5a950-c7d1-11eb-9eb8-005056bdd08f;
        Mon, 07 Jun 2021 23:50:11 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 3/3] usb: typec: intel_pmc_mux: Put ACPI device using acpi_dev_put()
Date:   Mon,  7 Jun 2021 23:50:07 +0300
Message-Id: <20210607205007.71458-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210607205007.71458-1-andy.shevchenko@gmail.com>
References: <20210607205007.71458-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For ACPI devices we have a symmetric API to put them, so use it in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v2: added Rb tag (Heikki)
 drivers/usb/typec/mux/intel_pmc_mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 34e1662ad6ef..2cdd22130834 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -600,12 +600,12 @@ static int pmc_usb_probe_iom(struct pmc_usb *pmc)
 	acpi_dev_free_resource_list(&resource_list);
 
 	if (!pmc->iom_base) {
-		put_device(&adev->dev);
+		acpi_dev_put(adev);
 		return -ENOMEM;
 	}
 
 	if (IS_ERR(pmc->iom_base)) {
-		put_device(&adev->dev);
+		acpi_dev_put(adev);
 		return PTR_ERR(pmc->iom_base);
 	}
 
@@ -676,7 +676,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
 		usb_role_switch_unregister(pmc->port[i].usb_sw);
 	}
 
-	put_device(&pmc->iom_adev->dev);
+	acpi_dev_put(pmc->iom_adev);
 
 	return ret;
 }
@@ -692,7 +692,7 @@ static int pmc_usb_remove(struct platform_device *pdev)
 		usb_role_switch_unregister(pmc->port[i].usb_sw);
 	}
 
-	put_device(&pmc->iom_adev->dev);
+	acpi_dev_put(pmc->iom_adev);
 
 	return 0;
 }
-- 
2.32.0

