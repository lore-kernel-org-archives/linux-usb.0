Return-Path: <SRS0=j0NE=XV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D32C47E48
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 09:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55CC2222C0
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569489174;
	bh=D0IHdoYL+cdWFefW3ed7cXAIOAxO7+Hp43rw32M1Kyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=e56+BKGiv6iAnrGODXrBqu0nU6yZRJUHyD6XNY2v8uP+xMZovgh7FRx3FxB0ozzc5
	 aH6/zy5uyn8m75Pa94k5eddJpOOyrf+Xiy09zxZiH0+lCIrSdBny5sWNRhsL45Ie3a
	 oCmcmSV/+Nu3Ajejx3+88llxMGoDY1f0ZFuQ0njk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbfIZJMw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Sep 2019 05:12:52 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42881 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730195AbfIZJMw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:52 -0400
Received: by mail-lf1-f68.google.com with SMTP id c195so1110771lfg.9
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E6Ii7hCmgGJll6q9WG6b8f58XKzO8877IKSX+QpN4qo=;
        b=uU0HRI9diiiq/0nPHjFyJerNkvbGTp2ora1euAtNkQu5Rxe/3fw0do/AkmTi6Lng+Y
         89Qjcx20ryKd5LCXlawnQKncbqV6Pw9OY7q6VvibgLha271IWZ11UjZhHG3WJvbCvggl
         YUHPTGEBY8LIa+JNYdd6oO+CFtkDot3kpufT0K4bPJPB/LWVlvfnxexjElb97p7wY1XP
         azzYM78oBMNgZUeegMQfqYMsR3RFWAfeV98yQLd0jJLkFv+Mcmc416hmsK7TyOuAf30d
         FYf0yEeqGg14rn3cyCfQ6m4iwXqt8mov/ZV46OcUC490EWRmNLP7Wc/sbqUIawNvs8w/
         sULg==
X-Gm-Message-State: APjAAAWpkHOe8HPKWwFGIm1oK7zRlwce5PoSXSsQbvkyScmT3/oMA3YZ
        xHxo1SAmhRtLN2cQXhso04o=
X-Google-Smtp-Source: APXvYqxk1eyI35xE8GQRmDOZC5w0GeIIH8KAorU/FIlbjGf9Dl7IkRhzFzf7bcSNdmvx9lExEWr3oA==
X-Received: by 2002:a19:4b4a:: with SMTP id y71mr1487139lfa.118.1569489168248;
        Thu, 26 Sep 2019 02:12:48 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id n5sm415420ljh.54.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpS-0006R2-Dj; Thu, 26 Sep 2019 11:12:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] USB: usblcd: drop redundant lcd mutex
Date:   Thu, 26 Sep 2019 11:12:27 +0200
Message-Id: <20190926091228.24634-9-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926091228.24634-1-johan@kernel.org>
References: <20190926091228.24634-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant lcd mutex introduced by commit 925ce689bb31 ("USB:
autoconvert trivial BKL users to private mutex") which replaced an
earlier BKL use.

The lock serialised calls to open() against other open() and a custom
ioctl() returning the bcdDevice (sic!), but neither is needed.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/usblcd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/misc/usblcd.c b/drivers/usb/misc/usblcd.c
index b898650a5570..732eb1f81368 100644
--- a/drivers/usb/misc/usblcd.c
+++ b/drivers/usb/misc/usblcd.c
@@ -30,7 +30,6 @@
 #define IOCTL_GET_DRV_VERSION	2
 
 
-static DEFINE_MUTEX(lcd_mutex);
 static const struct usb_device_id id_table[] = {
 	{ .idVendor = 0x10D2, .match_flags = USB_DEVICE_ID_MATCH_VENDOR, },
 	{ },
@@ -81,12 +80,10 @@ static int lcd_open(struct inode *inode, struct file *file)
 	struct usb_interface *interface;
 	int subminor, r;
 
-	mutex_lock(&lcd_mutex);
 	subminor = iminor(inode);
 
 	interface = usb_find_interface(&lcd_driver, subminor);
 	if (!interface) {
-		mutex_unlock(&lcd_mutex);
 		printk(KERN_ERR "USBLCD: %s - error, can't find device for minor %d\n",
 		       __func__, subminor);
 		return -ENODEV;
@@ -101,13 +98,11 @@ static int lcd_open(struct inode *inode, struct file *file)
 	r = usb_autopm_get_interface(interface);
 	if (r < 0) {
 		kref_put(&dev->kref, lcd_delete);
-		mutex_unlock(&lcd_mutex);
 		return r;
 	}
 
 	/* save our object in the file's private structure */
 	file->private_data = dev;
-	mutex_unlock(&lcd_mutex);
 
 	return 0;
 }
@@ -176,14 +171,12 @@ static long lcd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	switch (cmd) {
 	case IOCTL_GET_HARD_VERSION:
-		mutex_lock(&lcd_mutex);
 		bcdDevice = le16_to_cpu((dev->udev)->descriptor.bcdDevice);
 		sprintf(buf, "%1d%1d.%1d%1d",
 			(bcdDevice & 0xF000)>>12,
 			(bcdDevice & 0xF00)>>8,
 			(bcdDevice & 0xF0)>>4,
 			(bcdDevice & 0xF));
-		mutex_unlock(&lcd_mutex);
 		if (copy_to_user((void __user *)arg, buf, strlen(buf)) != 0)
 			return -EFAULT;
 		break;
-- 
2.23.0

