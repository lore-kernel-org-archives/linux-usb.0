Return-Path: <SRS0=w6LC=VI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D220C742A2
	for <linux-usb@archiver.kernel.org>; Thu, 11 Jul 2019 22:22:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 255D320872
	for <linux-usb@archiver.kernel.org>; Thu, 11 Jul 2019 22:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkL0uG42"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfGKWWz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Jul 2019 18:22:55 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:49080 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfGKWWz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Jul 2019 18:22:55 -0400
Received: by mail-pg1-f202.google.com with SMTP id k20so4419900pgg.15
        for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2019 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=mCycy9aqqdoaUABFG6E8LVTO4jk0v6n9tUe0m2UvIH8=;
        b=HkL0uG42CEBeEhg6hS9/u6ABaO3yYAxIoLdzuP23ZxU4EmFxGd3Gu7dmmjU4FuR5X4
         mPIJOhxlBiAXZYDpBlFxab4xok2wit/P5O5VdMXYUHWJ29iB1OL0LT1JLbDNF3+42Nlt
         kkpz+eBu8GmUjK54/LWdIdiapjPBz6bhtvdk7rXQHLtknVrVgKvSpOth4IYgk9C/koQK
         /bDy2iN8yGoxcb+aokz0wlTlRIS974y28FXxl3MSxvvfO6R1+HhOLGnuR2s0I/mOVFvQ
         jiYsMZ1qYOgihwz16+4658CM4V036Dj/nAEGU2LwNxnOjJCzQpEeybLuui0swsvyEjfo
         BpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=mCycy9aqqdoaUABFG6E8LVTO4jk0v6n9tUe0m2UvIH8=;
        b=SkXe27KV6EqzTl7qJEmFacdwrMr7Nunv/QwlKJo+5QDyfEsNK1afqHURMU2oxU9MHE
         wmAYk9NM7U9pb0QkNbyqTLvFm448WdZbLr+wNW7TT85FSYCRGy6g92BMFTdl1Qgl0kp1
         aitAwS0a4plOdf4NHfgEvN28U3JU/+KiLgYm5UCfBOYYIicBXz8gs/Z948vTLXQT1qS7
         KHQTU6GjOpUGB19K1YagzCrQqWoHSgJxp/pJ90k7eNWD1wYElIOXUkqYQAZF6eo+zW/u
         NPgpsugmr6+qZKTXjKTVdsQgFZGpmTqxJlLw1C6GBckCQUJIToBKlEX3qGowcUmGBmNd
         mgvA==
X-Gm-Message-State: APjAAAWZXgjM+rOoO/xBbMcREuxPA/YkIUCwNX4oUeiwJ/izwLBvfFMB
        gszAhUf9NxNhCSd5/HCziIxMK68AUXkpQCQpJXF4bw==
X-Google-Smtp-Source: APXvYqy5sjDWnwnDUx+ybLSMmSX8KEPpA4NxNZqe/W7zE/QllNvWY6BNMsUoC04BN3sj4nREBDcN/q/+xxfQ+PGXHhKIHg==
X-Received: by 2002:a63:1645:: with SMTP id 5mr6730418pgw.175.1562883774729;
 Thu, 11 Jul 2019 15:22:54 -0700 (PDT)
Date:   Thu, 11 Jul 2019 15:22:32 -0700
Message-Id: <20190711222232.77701-1-granthernandez@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH] Input: gtco - bounds check collection indent level
From:   Grant Hernandez <granthernandez@google.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     linux-usb@vger.kernel.org,
        Grant Hernandez <granthernandez@google.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The GTCO tablet input driver configures itself from an HID report sent
via USB during the initial enumeration process. Some debugging messages
are generated during the parsing. A debugging message indentation
counter is not bounds checked, leading to the ability for a specially
crafted HID report to cause '-' and null bytes be written past the end
of the indentation array. As long as the kernel has CONFIG_DYNAMIC_DEBUG
enabled, this code will not be optimized out.  This was discovered
during code review after a previous syzkaller bug was found in this
driver.

Cc: stable@vger.kernel.org
Signed-off-by: Grant Hernandez <granthernandez@google.com>
---
 drivers/input/tablet/gtco.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/input/tablet/gtco.c b/drivers/input/tablet/gtco.c
index 4b8b9d7aa75e..9771052ed027 100644
--- a/drivers/input/tablet/gtco.c
+++ b/drivers/input/tablet/gtco.c
@@ -78,6 +78,7 @@ Scott Hill shill@gtcocalcomp.com
 
 /* Max size of a single report */
 #define REPORT_MAX_SIZE       10
+#define MAX_COLLECTION_LEVELS  10
 
 
 /* Bitmask whether pen is in range */
@@ -223,8 +224,7 @@ static void parse_hid_report_descriptor(struct gtco *device, char * report,
 	char  maintype = 'x';
 	char  globtype[12];
 	int   indent = 0;
-	char  indentstr[10] = "";
-
+	char  indentstr[MAX_COLLECTION_LEVELS+1] = {0};
 
 	dev_dbg(ddev, "======>>>>>>PARSE<<<<<<======\n");
 
@@ -350,6 +350,12 @@ static void parse_hid_report_descriptor(struct gtco *device, char * report,
 			case TAG_MAIN_COL_START:
 				maintype = 'S';
 
+				if (indent == MAX_COLLECTION_LEVELS) {
+					dev_err(ddev, "Collection level %d would exceed limit of %d\n",
+						indent+1, MAX_COLLECTION_LEVELS);
+					break;
+				}
+
 				if (data == 0) {
 					dev_dbg(ddev, "======>>>>>> Physical\n");
 					strcpy(globtype, "Physical");
@@ -369,8 +375,15 @@ static void parse_hid_report_descriptor(struct gtco *device, char * report,
 				break;
 
 			case TAG_MAIN_COL_END:
-				dev_dbg(ddev, "<<<<<<======\n");
 				maintype = 'E';
+
+				if (indent == 0) {
+					dev_err(ddev, "Collection level already at zero\n");
+					break;
+				}
+
+				dev_dbg(ddev, "<<<<<<======\n");
+
 				indent--;
 				for (x = 0; x < indent; x++)
 					indentstr[x] = '-';
-- 
2.22.0.410.gd8fdbe21b5-goog

