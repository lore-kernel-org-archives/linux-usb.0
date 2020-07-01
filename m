Return-Path: <SRS0=oYLI=AM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD92C433E0
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jul 2020 16:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31E312078B
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jul 2020 16:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593622459;
	bh=gJ8Ou7MGFxvgws/ICcrzy9NSV2FPtMy8qQaCtRfhYSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=VE06vcDugzswb1eSD528loihsSSr5YYdF+k4jdA1hLI4fQbLmfW8UjyaQTVvQlT5C
	 v9ImvM47chOEiOo5a6CYfYF/V61YVysVbd8nuZOSxbwpF5dJo+HhsFlMf54Xu+3XT7
	 7s817AkoSO9dtJsIErYai7Rr07xLdWmhNpXAyDmw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732581AbgGAQyR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Jul 2020 12:54:17 -0400
Received: from mail-lj1-f181.google.com ([209.85.208.181]:44965 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732801AbgGAQyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 12:54:15 -0400
Received: by mail-lj1-f181.google.com with SMTP id s9so27948924ljm.11
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 09:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gb/RUJ5ZowCAGUAzFbl/YHdM1aI+3dNxCl1/CW0J3uY=;
        b=c2vx/+XMve1wAy1JK61D6s95QMfLM9J/Htonlmrw4xVwHNufXSwnYOiSayAhoMisdR
         FXhFuNN449UnX23i7czOwEloiLQHNL8zG8w9fP4oNK2bS6ytU9pR0Uvw7cK/xSvfQS43
         HsfN6Pi3iPJbBdUvsBppfgqJtz49FKlY2ccLF1GXvn7Ky5133lncHiP0GuVXV+tnc1B9
         pF8ZFpYAvk8iIvXsoc6femkBy+zIdDzqMJT6LDG/e8UKlEiuS6Xn4IoaLk4rdMj+tsPQ
         Q6DOL6c1aRNHSxiQsiYvGSHtsqQcZxB59wRycNY/yIq1B22MThpPe8zxj22DPV+5XvaU
         OSug==
X-Gm-Message-State: AOAM531nwJj4FrDXrre776mPrRIH/B4i2jFJ2tyaLOAYQAneKLQLIiVF
        YVh9G5M3zpTYF9IV/WW3FbTVDsN+w1g=
X-Google-Smtp-Source: ABdhPJzrTUS5bD7zJmlloW2n79rKnX/+FGzSdag5BU6TAFmUEH+XnV1vRQLmvd+Q2PmGgmdSa+W0mA==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr5102838lji.81.1593622453089;
        Wed, 01 Jul 2020 09:54:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id s20sm2225530ljs.36.2020.07.01.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:54:12 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqfzq-00042P-ON; Wed, 01 Jul 2020 18:54:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 5/5] USB: serial: quatech2: drop two stub functions
Date:   Wed,  1 Jul 2020 18:53:42 +0200
Message-Id: <20200701165342.15448-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701165342.15448-1-johan@kernel.org>
References: <20200701165342.15448-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop two unused stub functions which only served as documentation.

This also avoids a W=1 (-Wunused-but-set-variable) warning.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/quatech2.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/usb/serial/quatech2.c b/drivers/usb/serial/quatech2.c
index f93b81a297d6..872d1bc86ab4 100644
--- a/drivers/usb/serial/quatech2.c
+++ b/drivers/usb/serial/quatech2.c
@@ -480,21 +480,6 @@ static void qt2_process_status(struct usb_serial_port *port, unsigned char *ch)
 	}
 }
 
-/* not needed, kept to document functionality */
-static void qt2_process_xmit_empty(struct usb_serial_port *port,
-				   unsigned char *ch)
-{
-	int bytes_written;
-
-	bytes_written = (int)(*ch) + (int)(*(ch + 1) << 4);
-}
-
-/* not needed, kept to document functionality */
-static void qt2_process_flush(struct usb_serial_port *port, unsigned char *ch)
-{
-	return;
-}
-
 static void qt2_process_read_urb(struct urb *urb)
 {
 	struct usb_serial *serial;
@@ -540,7 +525,7 @@ static void qt2_process_read_urb(struct urb *urb)
 						 __func__);
 					break;
 				}
-				qt2_process_xmit_empty(port, ch + 3);
+				/* bytes_written = (ch[1] << 4) + ch[0]; */
 				i += 4;
 				escapeflag = true;
 				break;
@@ -569,7 +554,6 @@ static void qt2_process_read_urb(struct urb *urb)
 				break;
 			case QT2_REC_FLUSH:
 			case QT2_XMIT_FLUSH:
-				qt2_process_flush(port, ch + 2);
 				i += 2;
 				escapeflag = true;
 				break;
-- 
2.26.2

