Return-Path: <SRS0=j0NE=XV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29285C4360C
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 09:12:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 000A9222C5
	for <linux-usb@archiver.kernel.org>; Thu, 26 Sep 2019 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569489169;
	bh=3qyApSFj4rcXV3bqrE1BDXVcdGMJW0R7O3zKWdjA7dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Q0ZSNszbSIIdgsqJDIKIP+NX5F/1LqN/z+aczeFt6Jp+LxReUD0698oEnrwteoSgL
	 7N9+JulvWRcIOltlZ/p3PRYGKBTXmiDOzuH52Q94tccbcQXj6bMqRJFMJErGZcvBzF
	 4Qy7GNqHMJZAF7lCRxmvPHrMc3ckAIrPVNSL5cps=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729881AbfIZJMs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Sep 2019 05:12:48 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44060 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfIZJMr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:47 -0400
Received: by mail-lf1-f67.google.com with SMTP id q11so1102455lfc.11
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nSE68eO8cJa8cg6l73GI+YOtkPnzSUMRPGBx5GZoj60=;
        b=SiXYJbfi+IlY7Fowdh8ygbIdYFvWMt3A9wIc2t+l5RYy0y/uwdKQo8jYet+h1ppTw1
         1yNSRbPP5diPWtYZ9daVUSQ5KjPI/U3rYB4LuipK2QPUS4aKjqyT+0jzbn0HdAhYU+v+
         rbQPFvjBqJyMPKW6kko+1HbrVzZem7O6Fu9ellPn7mn11DXHLpKSi6aCN2DpG7uz2XZt
         2QTUb6VI4SPLBIVhLaZHAbNNOCtcGwYcyTl9HGQ+rxNJYKPvnvM9wJEITimK5t3f/2CY
         31a9b4OmLlS9YYpMyKCSMeBUNbuQ+RK2G0tXsN3R1altlOhT0yVVizBZvoWkUh9YrKI2
         AwKw==
X-Gm-Message-State: APjAAAUx8vZUK3cBxsabscKacKZlpQrNKo43whLzs4R7IlkOaXfrUA7F
        0erafc80goiIEM3rU29wQ6g=
X-Google-Smtp-Source: APXvYqzysxeR+pQPgfpZN7EZKz/1TGHZlvoLW9zO3y3sJFE+Id8TKZPc2fV2Lw8TypRuoaYmC7rITw==
X-Received: by 2002:a19:f707:: with SMTP id z7mr1579702lfe.142.1569489164676;
        Thu, 26 Sep 2019 02:12:44 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id o13sm371024lji.31.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:43 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpR-0006QW-RZ; Thu, 26 Sep 2019 11:12:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/4] USB: usblcd: drop redundant disconnect mutex
Date:   Thu, 26 Sep 2019 11:12:21 +0200
Message-Id: <20190926091228.24634-3-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190926091228.24634-1-johan@kernel.org>
References: <20190926091228.24634-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the redundant disconnect mutex which was introduced after the
open-disconnect race had been addressed generally in USB core by commit
d4ead16f50f9 ("USB: prevent char device open/deregister race").

Specifically, the rw-semaphore in core guarantees that all calls to
open() will have completed and that no new calls to open() will occur
after usb_deregister_dev() returns. Hence there is no need use the
driver data as an inverted disconnected flag.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/usblcd.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/usb/misc/usblcd.c b/drivers/usb/misc/usblcd.c
index aa982d3ca36b..b898650a5570 100644
--- a/drivers/usb/misc/usblcd.c
+++ b/drivers/usb/misc/usblcd.c
@@ -37,9 +37,6 @@ static const struct usb_device_id id_table[] = {
 };
 MODULE_DEVICE_TABLE(usb, id_table);
 
-static DEFINE_MUTEX(open_disc_mutex);
-
-
 struct usb_lcd {
 	struct usb_device	*udev;			/* init: probe_lcd */
 	struct usb_interface	*interface;		/* the interface for
@@ -95,17 +92,10 @@ static int lcd_open(struct inode *inode, struct file *file)
 		return -ENODEV;
 	}
 
-	mutex_lock(&open_disc_mutex);
 	dev = usb_get_intfdata(interface);
-	if (!dev) {
-		mutex_unlock(&open_disc_mutex);
-		mutex_unlock(&lcd_mutex);
-		return -ENODEV;
-	}
 
 	/* increment our usage count for the device */
 	kref_get(&dev->kref);
-	mutex_unlock(&open_disc_mutex);
 
 	/* grab a power reference */
 	r = usb_autopm_get_interface(interface);
@@ -388,7 +378,6 @@ static int lcd_probe(struct usb_interface *interface,
 		/* something prevented us from registering this driver */
 		dev_err(&interface->dev,
 			"Not able to get a minor for this device.\n");
-		usb_set_intfdata(interface, NULL);
 		goto error;
 	}
 
@@ -434,14 +423,9 @@ static int lcd_resume(struct usb_interface *intf)
 
 static void lcd_disconnect(struct usb_interface *interface)
 {
-	struct usb_lcd *dev;
+	struct usb_lcd *dev = usb_get_intfdata(interface);
 	int minor = interface->minor;
 
-	mutex_lock(&open_disc_mutex);
-	dev = usb_get_intfdata(interface);
-	usb_set_intfdata(interface, NULL);
-	mutex_unlock(&open_disc_mutex);
-
 	/* give back our minor */
 	usb_deregister_dev(interface, &lcd_class);
 
-- 
2.23.0

