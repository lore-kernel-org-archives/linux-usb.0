Return-Path: <SRS0=o8ur=X3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED15C10F14
	for <linux-usb@archiver.kernel.org>; Wed,  2 Oct 2019 17:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06CA221D81
	for <linux-usb@archiver.kernel.org>; Wed,  2 Oct 2019 17:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh3xLmmx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfJBRjY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 2 Oct 2019 13:39:24 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43322 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfJBRjY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 13:39:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id v27so12222195pgk.10
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cFpXM64CfYsN6fqI2zVJX/hi/GzgkYdzD93O/deq/9o=;
        b=Kh3xLmmxFykn7KjO4tQLTIcF8hVGYjTWAZs3UltCFf0B3zu2nEi13Z6MRL1xYhpDs7
         HdgM0c/MileIqDM6iYUi9QPvOsLO6qOTLWZ5F/veOnoQujDiCL2P4M9mRBl46M9NGG0P
         J+Llf6VzhwjdqbFM74RbyocpH4ztcm/x0fG3H+iIhNXtOdK08GajG2sGDFotIQ1vAARs
         6t6UcpQ+U7h1raiCMuOQGRp4UmszsYcAL6XjZn6dIQ8j5AQR1tZAb70AWJfIaShXptZ/
         etirohvslFx608Su9L1HAztHSxLrQOsveEgntrNWnTaECea/gmMMdZzRokIBO5339Fsu
         PVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cFpXM64CfYsN6fqI2zVJX/hi/GzgkYdzD93O/deq/9o=;
        b=DByIcjj1fQ/MfmVbxiMmxU96kfFWqZ0H2+nv7HlVXfei/6eM1bFA0OWKmisLSof3ew
         3VgfkI5R/FrlJfH1OF9IPNvgLenUf8lcCtCFVkYs5jJDaXV/+vq9kLa4jUoFvT2JX8jB
         Y/9qOX/WyUfqQlYl3HJj0U02f0t2TFdNR2PUSHWjkDQ5GaarjmPlaiH3HRI/s2uXWUTi
         CNsXbeKJ8zgiiPNInwENoKqbVwK5q/r3HfFrdQhaEMm0QP2+FaMdsc7KugAatyxUsA8e
         sHC3fWHMQ0aVAnuz/RnC4txP5v105rwE/dWBsTnYrbH+Gsgn/Z9crM3taOB0et37ezMZ
         S5iQ==
X-Gm-Message-State: APjAAAUr4cZI2VZWGAIdBRnglh+8wt88342MHs9Ag0xJmE6Is2eBTOHx
        GJeA8M1PXJQyNbTOIzwwk1J/SB4ykEM=
X-Google-Smtp-Source: APXvYqznts+CFJfaLyG+WUIPhiZursfww/zOZoR95RE+B+KbsJ9FH9RixZfhO5FN8Ud+HG6VbacRrg==
X-Received: by 2002:a63:8f5e:: with SMTP id r30mr5089998pgn.161.1570037963477;
        Wed, 02 Oct 2019 10:39:23 -0700 (PDT)
Received: from localhost.localdomain ([103.241.225.67])
        by smtp.gmail.com with ESMTPSA id c62sm72271pfa.92.2019.10.02.10.39.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 10:39:22 -0700 (PDT)
From:   aliasgar.surti500@gmail.com
To:     b-liu@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Aliasgar Surti <aliasgar.surti500@gmail.com>
Subject: [PATCH] drivers: musb: removed unused status variable
Date:   Wed,  2 Oct 2019 23:09:13 +0530
Message-Id: <20191002173913.12847-1-aliasgar.surti500@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Aliasgar Surti <aliasgar.surti500@gmail.com>

Status variable is initialized and returned without updating it's value.
Removed status variable and returned value directly.

Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
---
 drivers/usb/musb/musb_gadget.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index ffe462a657b1..2cb31fc0cd60 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1085,7 +1085,6 @@ static int musb_gadget_disable(struct usb_ep *ep)
 	u8		epnum;
 	struct musb_ep	*musb_ep;
 	void __iomem	*epio;
-	int		status = 0;
 
 	musb_ep = to_musb_ep(ep);
 	musb = musb_ep->musb;
@@ -1118,7 +1117,7 @@ static int musb_gadget_disable(struct usb_ep *ep)
 
 	musb_dbg(musb, "%s", musb_ep->end_point.name);
 
-	return status;
+	return 0;
 }
 
 /*
-- 
2.17.1

