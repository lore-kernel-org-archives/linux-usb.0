Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBD1C433ED
	for <linux-usb@archiver.kernel.org>; Wed,  5 May 2021 14:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C439610E9
	for <linux-usb@archiver.kernel.org>; Wed,  5 May 2021 14:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhEEOVb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 5 May 2021 10:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbhEEOVb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 May 2021 10:21:31 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC2CC061574;
        Wed,  5 May 2021 07:20:34 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id y32so1876322pga.11;
        Wed, 05 May 2021 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=70Vtk3cTkEH+v9q1J6g0pF83dKihPS0No/AaCgqegvc=;
        b=R44r3rtYIMKmWn0I1E4rk3/ogyHPR8YBCBYMkxtcftL/c35wTTZG+h3CF3lQomHiHS
         XF/x2xdGYMY3LL+T5rppkyyFl7HcjY7G0GRB8+TQZUctXx2jty0UkcsdvaH1SOU3fvcx
         ezsZEKXrPUoAXNCC12NaMg95vkwJL4yz9LsQHvIaI4PKgwyf1TX0jmLNGO9wPvYWEG7O
         THrLiIIvXdivL2e98CWnzQi7LMI+c4WL4pNf9otRckw3pbMRlv/i4j7bFpI3qripoMpX
         5vu5LRYwL504MszHxYmJnJ+MhyGMWccAx8yfOBvgPWP8Pb/wd3SxGLZjHsWn61kSWp+g
         qUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=70Vtk3cTkEH+v9q1J6g0pF83dKihPS0No/AaCgqegvc=;
        b=sXS7OCxL8No8n/vSOVeGZ8xFCuC23ELZQVlI0avKrTR19r9JVfjztMuWt9IWbE1bOY
         qWEQBns/zcqvgpGpheQpWMQbtjp56d4cmy6+P1mm+PjawHXVYrGVx4UKn57f3kKCA/ph
         so+KZhcj5a8BJpQypbXY/87I90x2W7SfbagIR+t8V7zRnHq3mVhZU2ZklW7GCaZUm7Xo
         /QHWUpGepID+As2KmwOo8V2GeK2Il7tQOEXtVYtKvZAgVPNuy1Bpdz+JbRc+UI7Kp4KM
         qu7Cep3I4uzbtQARr4iOPurYXGiAvIO69gxEfWwSaMiCFvcrvKi27TgP6nG7N27X02eT
         EIIg==
X-Gm-Message-State: AOAM531aWez4uwMrcMTXe8tKzoRE19i9/zj4xPJU/+/U3e8/+MgksAyu
        9lrCaug/D0vBULRNg6utgq8IHy6qJBITrpos7TY=
X-Google-Smtp-Source: ABdhPJzDZot3Y38Q1FZ2t0aN4qB6SNpVdwfUALKFIucHoa4/XdIEJ9z4z7gJL0K9wbNX/yvum6732w==
X-Received: by 2002:a63:796:: with SMTP id 144mr28563579pgh.246.1620224433949;
        Wed, 05 May 2021 07:20:33 -0700 (PDT)
Received: from localhost.localdomain (host-219-71-67-82.dynamic.kbtelecom.net. [219.71.67.82])
        by smtp.gmail.com with ESMTPSA id s13sm15240598pfd.79.2021.05.05.07.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:20:33 -0700 (PDT)
From:   Wei Ming Chen <jj251510319013@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        Wei Ming Chen <jj251510319013@gmail.com>
Subject: [PATCH] usb: phy: Use fallthrough pseudo-keyword
Date:   Wed,  5 May 2021 22:19:36 +0800
Message-Id: <20210505141936.4343-1-jj251510319013@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Replace /* FALLTHROUGH */ comment with pseudo-keyword macro fallthrough[1]

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Wei Ming Chen <jj251510319013@gmail.com>
---
 drivers/usb/phy/phy-isp1301-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp1301-omap.c
index 02bb7ddd4bd6..f3e9b3b6ac3e 100644
--- a/drivers/usb/phy/phy-isp1301-omap.c
+++ b/drivers/usb/phy/phy-isp1301-omap.c
@@ -555,7 +555,7 @@ static void otg_update_isp(struct isp1301 *isp)
 	case OTG_STATE_A_PERIPHERAL:
 		if (otg_ctrl & OTG_PULLUP)
 			goto pullup;
-		/* FALLTHROUGH */
+		fallthrough;
 	// case OTG_STATE_B_WAIT_ACON:
 	default:
 pulldown:
-- 
2.25.1

