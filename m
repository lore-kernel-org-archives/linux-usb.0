Return-Path: <SRS0=7kPi=AO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAF7C433E0
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 17:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E5E120870
	for <linux-usb@archiver.kernel.org>; Fri,  3 Jul 2020 17:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V678svqB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgGCRmE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 3 Jul 2020 13:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgGCRmD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:03 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC54C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:02 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id z15so22287399wrl.8
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oUjHYg6XEDC1PONs5ecYCAMD6hQ6HUyQ5SfKo5ZoAoI=;
        b=V678svqBj5ZEzdGJKB69Vodq9pQ31EIwBoLQP1As6lWOXIP/1kJzIqJLjtOvblSkXy
         MGxl0iGDkHU0uljNJKGH03hr+d07Q2Snp4haL9GaJ2ECnEqfljKwL6ibxma86kajreu8
         TA9jvVxRARz9NQU8MvUH+6tDKzsNjuSpnqk6vImwQ4hXw35BuvZcyA+zSVh6APrv+3AX
         gmXxT3q/ZYNpFS1sGomuuZ5QRj5DfnK67GvuVpvUsP0YzvhguEnTqDR0J/QZNL57ZKIP
         TYqim9pcfdfTLug72OqEjJojTk83E5F+sCUgu8ZcofVXsYiA6JFIbxmSDf8sHNsVMx8a
         K4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oUjHYg6XEDC1PONs5ecYCAMD6hQ6HUyQ5SfKo5ZoAoI=;
        b=HiokKQmK65Ad4shgr9GKuJPLgBIoqjjTA/EUVTwJkDXraru1DCSphfyiRwzGLYZOmd
         Imyf+xOUCzintrCjTmwa/JymYOHMxNzIQtEQjCkuVCebsjCD+rkwfIB+6Q+tbbIHV7H7
         qNS1nfDpp//o6SZmnbTCtDjQSviTqlu22I6+ndX9n0PRxY2ZliuFHtPo2gfsfBQBIrkT
         jeF5CjmTOKJT6XBmgJNhPVnv/j1VA1KI1eqlXfp+sPJVIoWxSgN81p8VeiynVRB7wAVT
         R9FMGgwZws3nIeOT5DdV+W4a6aysemrunxczDjYt0EWajc8xg74g2Ke26uO6O6i5tD2j
         x8Tw==
X-Gm-Message-State: AOAM531yXYLbD372oPN2SDM47+ggHd2vPSbHcPg+3A5OJ77YIiWxcP9T
        4BOxpQyeoiSFJWkrpJ8nQ5yhdQ==
X-Google-Smtp-Source: ABdhPJzGvTblYJ7UXyonhX71xr+CGK3bV2MNNRAwpzZl2DyxwAc9szCyt2n/Ezh4sar6tAoDQOPNeA==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr38704827wrp.96.1593798121551;
        Fri, 03 Jul 2020 10:42:01 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 03/30] usb: core: ledtrig-usbport: Demote obvious misuse of kerneldoc to standard comment blocks
Date:   Fri,  3 Jul 2020 18:41:21 +0100
Message-Id: <20200703174148.2749969-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the functions here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/core/ledtrig-usbport.c:42: warning: Function parameter or member 'usbport_data' not described in 'usbport_trig_usb_dev_observed'
 drivers/usb/core/ledtrig-usbport.c:42: warning: Function parameter or member 'usb_dev' not described in 'usbport_trig_usb_dev_observed'
 drivers/usb/core/ledtrig-usbport.c:71: warning: Function parameter or member 'usbport_data' not described in 'usbport_trig_update_count'
 drivers/usb/core/ledtrig-usbport.c:131: warning: Function parameter or member 'usbport_data' not described in 'usbport_trig_port_observed'
 drivers/usb/core/ledtrig-usbport.c:131: warning: Function parameter or member 'usb_dev' not described in 'usbport_trig_port_observed'
 drivers/usb/core/ledtrig-usbport.c:131: warning: Function parameter or member 'port1' not described in 'usbport_trig_port_observed'

Cc: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/core/ledtrig-usbport.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index c12ac56606c3f..ba371a24ff781 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -34,7 +34,7 @@ struct usbport_trig_port {
  * Helpers
  ***************************************/
 
-/**
+/*
  * usbport_trig_usb_dev_observed - Check if dev is connected to observed port
  */
 static bool usbport_trig_usb_dev_observed(struct usbport_trig_data *usbport_data,
@@ -64,7 +64,7 @@ static int usbport_trig_usb_dev_check(struct usb_device *usb_dev, void *data)
 	return 0;
 }
 
-/**
+/*
  * usbport_trig_update_count - Recalculate amount of connected matching devices
  */
 static void usbport_trig_update_count(struct usbport_trig_data *usbport_data)
@@ -123,7 +123,7 @@ static const struct attribute_group ports_group = {
  * Adding & removing ports
  ***************************************/
 
-/**
+/*
  * usbport_trig_port_observed - Check if port should be observed
  */
 static bool usbport_trig_port_observed(struct usbport_trig_data *usbport_data,
-- 
2.25.1

