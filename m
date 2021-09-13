Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616B3C433F5
	for <linux-usb@archiver.kernel.org>; Mon, 13 Sep 2021 18:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48A9060F6D
	for <linux-usb@archiver.kernel.org>; Mon, 13 Sep 2021 18:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240341AbhIMSQu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 13 Sep 2021 14:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239715AbhIMSQt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Sep 2021 14:16:49 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B40C061574
        for <linux-usb@vger.kernel.org>; Mon, 13 Sep 2021 11:15:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t18so16122453wrb.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Sep 2021 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=62ELIcLks3gozGPuoYKYGXtj/qgh9+cNSh/1lUiecQA=;
        b=K2imFpxQNIauTUdd8GljZRstjSkpHFGGySaVC7HaNTI6kf/uG/fdQHydlyfSajkuuQ
         St+i7Wa23BbCDLywYOcfbRXkZ38F0sHhZOpGZ7T/aMPQzH+neAfJwor7C5v+fCOkF9ix
         jts2CRljD7gWds0kPriqFpRDOa5YJBgHZmVldHaXFdBBBz8jnpRt8oGDGwMyrKnDZUun
         28CbPqtOa530siOR+YFT8ae/sJvzc1Jchz0GwuWoe/3pC//bJF7lmzqLk6GyQuezwnLM
         lO2SJazQgLUdge9ZaoqUFcu71JdTSm5Lgsfx1Tj9Co1VeOjHifrapv7UhNNrH33lumfg
         icRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=62ELIcLks3gozGPuoYKYGXtj/qgh9+cNSh/1lUiecQA=;
        b=QyGOoxWcHpCycOkdVZZd2Sm/ir5htTV5ihP8EEhRmivGNH9XLRiLrcEm3mlliHs2vc
         Mgpn53c4xgYwjqADB5KLPRrmYdiim2SFzTy6Rp8OwAszziG97dHXhp7sB/s2cayyUtyF
         /GPwe+5ZTZ5hOkqeKpkRlnJDifdnsLBD4QizQAel6pF8Bo/1Jj20co0cuu6c3epOOFZs
         H19TkgD9x+EMaVirWJ91UDouF3Vr+/Zhh1Vbd1QyRjUfcZYfT8LcbHG+DUbPAvtITdoU
         w4yDqnBT2kqamKZwd6jPmh5GZth6BDy5RWHHiNR8rB7CBmVw63QGSv4WFVybc9aq9vgb
         KXkw==
X-Gm-Message-State: AOAM531tgxvYR6rtNRGtToXJgpbhjQYg4VIEInWsULy1DMxbNZZd1/E+
        iJxmBHD5v4iCyJz4EqswSarBImgbzneR5g==
X-Google-Smtp-Source: ABdhPJxK9HONfalGKJcdAYgEjEgU24NjHeL5ujUYJXURN14+OnmR4alAh6TyGl+Lwkf0KJlygDUOGA==
X-Received: by 2002:adf:f884:: with SMTP id u4mr13704870wrp.411.1631556931806;
        Mon, 13 Sep 2021 11:15:31 -0700 (PDT)
Received: from napoleon2.. ([2a02:908:1980:80a0::a7df])
        by smtp.gmail.com with ESMTPSA id y6sm660788wrp.46.2021.09.13.11.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 11:15:31 -0700 (PDT)
From:   Julian Sikorski <belegdol@gmail.com>
X-Google-Original-From: Julian Sikorski <belegdol+github@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     oneukum@suse.com, hdegoede@redhat.com,
        Julian Sikorski <belegdol+github@gmail.com>
Subject: [PATCH] Re-enable UAS for LaCie Rugged USB3-FW with fk quirk
Date:   Mon, 13 Sep 2021 20:14:55 +0200
Message-Id: <20210913181454.7365-1-belegdol+github@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Further testing has revealed that LaCie Rugged USB3-FW does work with
uas as long as US_FL_NO_REPORT_OPCODES and US_FL_NO_SAME are enabled.

Signed-off-by: Julian Sikorski <belegdol+github@gmail.com>
Suggested-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/linux-usb/2167ea48-e273-a336-a4e0-10a4e883e75e@redhat.com/
---
 drivers/usb/storage/unusual_uas.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index c35a6db993f1..4051c8cd0cd8 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -50,7 +50,7 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
 		"LaCie",
 		"Rugged USB3-FW",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
-		US_FL_IGNORE_UAS),
+		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
 
 /*
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
-- 
2.31.1

