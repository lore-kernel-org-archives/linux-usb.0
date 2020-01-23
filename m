Return-Path: <SRS0=AWg3=3M=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF71BC2D0DB
	for <linux-usb@archiver.kernel.org>; Thu, 23 Jan 2020 18:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8F5721D7E
	for <linux-usb@archiver.kernel.org>; Thu, 23 Jan 2020 18:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vZNlSpU4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgAWSXF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 23 Jan 2020 13:23:05 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34764 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729030AbgAWSXF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jan 2020 13:23:05 -0500
Received: by mail-pl1-f193.google.com with SMTP id q13so981191pls.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2020 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OFUvWCgmfRBKh1qgMuTmkB1yrgtzYhWKuC/q6gp0Heo=;
        b=vZNlSpU4zYFva5bDpBvh1LI5/u9K359NpuFJ3EtzFHVz2yolgGRfC+o3GtqJaYdOEP
         gkiZfJHG5Xs0vDv+XZL6f7phQrkIXUFTsVQHOsLFSrvS44Y7CZijvEyHKAuYaN3wbANF
         rYO+A58n70JGGK0t3QTenwXUAGTZ5Xq2Uoiak244sDhRNZ+S66zSde3qWK2GPLRTJ2of
         jEpzOH7Az9s2apKgIKWAXozxtvjRvy3Vk+aEJe1Qo0k5upd1ztCoHAjVTpuYHojgPfbi
         CjzW0MCKyWcdeJ+5K6i6oR+HkJABxlctyXpHrOtfkxaQCvuakLgiQI5DCd6NXoLLtnMv
         /REw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OFUvWCgmfRBKh1qgMuTmkB1yrgtzYhWKuC/q6gp0Heo=;
        b=nwwVVREz/YLrNJLEDCLNBYcTYxknzeYm5S4o35tHs57HXNb6xJjG/AhVo9dbgtvOyt
         mcc8fe+wzS67vyGg/BRbhnWCYqO0gQej+2YGNCmUZPimqxRRtp2R2xevKSUGEJsFFWMO
         4HYcM9GYipBsRfHcEl8XJqZ10i4S7EKXW/Z4qflkV4d2XtspdgPP2th3hulkqMuFY1BE
         QqR+zN9KBm3FmxZEe3XLuAVOhBKV9xLI9peQCITkbj15+jCoV3TJt8NU1vPdyLUbs0Pj
         DSVmsBEe2LVI3Ri1LDpgT7bRvkhJaWpWiSwBy/5EPxjVWCnI3Fo2KbYlNlKxmpqh+Ykw
         D2hg==
X-Gm-Message-State: APjAAAVdBYGSQFz6wSVt/ksG/Gd3O1Q4YlGuj/YhNjL4FW9nVDg1Jmgc
        frBIKv+onfpwshX1/sNz6ydtnKMYB4c=
X-Google-Smtp-Source: APXvYqz7GS8exZa+Z5CPIWzSiuWWFYqsrHtIWuVkh5tepN6MZm5t2iJVNBCwPRSOtjzR0MhJ9W/X2g==
X-Received: by 2002:a17:90a:cf07:: with SMTP id h7mr5837294pju.66.1579803784554;
        Thu, 23 Jan 2020 10:23:04 -0800 (PST)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id p21sm3427894pfn.103.2020.01.23.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 10:23:04 -0800 (PST)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v2 2/2] usb: ucsi: ccg: disable runtime pm during fw flashing
Date:   Wed, 22 Jan 2020 16:58:59 -0800
Message-Id: <20200123005859.13194-2-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123005859.13194-1-ajayg@nvidia.com>
References: <20200123005859.13194-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Ucsi ppm is unregistered during fw flashing so disable
runtime pm also and reenable after fw flashing is completed
and ppm is re-registered.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
---
Change from v1->v2: None

 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index a5b8530490db..2658cda5da11 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1219,6 +1219,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
+	pm_runtime_enable(uc->dev);
 	return 0;
 }
 
@@ -1234,6 +1235,7 @@ static void ccg_update_firmware(struct work_struct *work)
 
 	if (flash_mode != FLASH_NOT_NEEDED) {
 		ucsi_unregister(uc->ucsi);
+		pm_runtime_disable(uc->dev);
 		free_irq(uc->irq, uc);
 
 		ccg_fw_update(uc, flash_mode);
-- 
2.17.1

