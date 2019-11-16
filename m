Return-Path: <SRS0=pcVx=ZI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1406AC33C8C
	for <linux-usb@archiver.kernel.org>; Sat, 16 Nov 2019 15:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D699B2073B
	for <linux-usb@archiver.kernel.org>; Sat, 16 Nov 2019 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573918963;
	bh=FsvQRTDHzkmyfaLsTy8u40CfgdoIRfi8ccBGcX4mt+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=d4/mBCZQqTOXl37B8tDdo3fhHqdy/i7Rfkb0jMnn+A1AIPWHl0bHYzUYY400USvqJ
	 JWnoyLObammRy/Xf8PhvwG6xBgkqM9R20B+8TgSgU9KSrQfYK1yBbZz3MAm0ATU7az
	 sllrWqhTA32eWjfrEstRIE6JcihpsSbQWIJOlq24=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbfKPPml (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 16 Nov 2019 10:42:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:46436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728394AbfKPPml (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 Nov 2019 10:42:41 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45E7B20733;
        Sat, 16 Nov 2019 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573918960;
        bh=FsvQRTDHzkmyfaLsTy8u40CfgdoIRfi8ccBGcX4mt+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MLhbhzue7t/GpDkcejpU+B/Wq4Qs5LpyUwOT9d7kASgTXPr7GIwUGcyE0ezfxab5J
         W/EXIYBwueTElW/etUSlv/aqCz04A1iDA6PbhCM8ZS5JgCu1gYPIMGm87dYhvVvRdV
         /YESeWkhzDeMFaZVepgJZI37ktUuNS0Uw4eWws9g=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mattias Jacobsson <2pi@mok.nu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 077/237] USB: misc: appledisplay: fix backlight update_status return code
Date:   Sat, 16 Nov 2019 10:38:32 -0500
Message-Id: <20191116154113.7417-77-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116154113.7417-1-sashal@kernel.org>
References: <20191116154113.7417-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mattias Jacobsson <2pi@mok.nu>

[ Upstream commit 090158555ff8d194a98616034100b16697dd80d0 ]

Upon success the update_status handler returns a positive number
corresponding to the number of bytes transferred by usb_control_msg.
However the return code of the update_status handler should indicate if
an error occurred(negative) or how many bytes of the user's input to sysfs
that was consumed. Return code zero indicates all bytes were consumed.

The bug can for example result in the update_status handler being called
twice, the second time with only the "unconsumed" part of the user's input
to sysfs. Effectively setting an incorrect brightness.

Change the update_status handler to return zero for all successful
transactions and forward usb_control_msg's error code upon failure.

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/misc/appledisplay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index 1c6da8d6cccf8..39ca31b4de466 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -148,8 +148,11 @@ static int appledisplay_bl_update_status(struct backlight_device *bd)
 		pdata->msgdata, 2,
 		ACD_USB_TIMEOUT);
 	mutex_unlock(&pdata->sysfslock);
-	
-	return retval;
+
+	if (retval < 0)
+		return retval;
+	else
+		return 0;
 }
 
 static int appledisplay_bl_get_brightness(struct backlight_device *bd)
-- 
2.20.1

