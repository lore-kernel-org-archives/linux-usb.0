Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FE0C433EF
	for <linux-usb@archiver.kernel.org>; Mon, 11 Apr 2022 13:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346815AbiDKN5J (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 11 Apr 2022 09:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240988AbiDKN5D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 09:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2ED3913DF6
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 06:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649685288;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+Ko5UdiZ2Nq5k+VVxETea59ROYKz8KfsDRGUL0i/214=;
        b=VqrzBFyBq5X3lt6Du+2WSpwZxw3ur6zcq4W1HooEJbjZtq/K8PmPbLmYvH4qAuB3v+6+sZ
        bSgLGO/l9BvT/oF+OcKZn+GApsTokr/KMsuvaXtl4yMMH7PMCOcB50+pCo2aQKWeoGhfmH
        GZqNdtFd7vgde85ZAaMfGGM4p3u9hRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-PVPV12FKOxenaDYVX_UFLg-1; Mon, 11 Apr 2022 09:54:43 -0400
X-MC-Unique: PVPV12FKOxenaDYVX_UFLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80C662A5954D;
        Mon, 11 Apr 2022 13:54:42 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.187])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8E5EBC4C7A0;
        Mon, 11 Apr 2022 13:54:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] phy: ti: tusb1210: Make tusb1210_chg_det_states static
Date:   Mon, 11 Apr 2022 15:54:40 +0200
Message-Id: <20220411135440.558394-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Make tusb1210_chg_det_states static, fixing the following sparse warning:

drivers/phy/ti/phy-tusb1210.c:158:12: sparse: sparse:
 symbol 'tusb1210_chg_det_states' was not declared. Should it be static?

Fixes: 48969a5623ed ("phy: ti: tusb1210: Add charger detection")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/phy/ti/phy-tusb1210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index a0cdbcadf09e..c5bd74874f73 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -155,7 +155,7 @@ static int tusb1210_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }
 
 #ifdef CONFIG_POWER_SUPPLY
-const char * const tusb1210_chg_det_states[] = {
+static const char * const tusb1210_chg_det_states[] = {
 	"CHG_DET_CONNECTING",
 	"CHG_DET_START_DET",
 	"CHG_DET_READ_DET",
-- 
2.35.1

