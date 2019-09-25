Return-Path: <SRS0=dvfo=XU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553CCC432C2
	for <linux-usb@archiver.kernel.org>; Wed, 25 Sep 2019 09:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C18D20872
	for <linux-usb@archiver.kernel.org>; Wed, 25 Sep 2019 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569403766;
	bh=hXFOlyeaNQM+XSUr9JB6/L52cy2cgWALgNViUGqYHJg=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=pZbYgCGMHlCqovijA+a8DWgtUT7xqYb+UolwpJ9wGJBcEVzVcRJ2QYAbfIe/RWjlU
	 yYlB0rIdWSGyYiOSND9V1d/VCrcGJevfYua34T1mICJrkKsg/sbNsFDD7zRZcKv2IQ
	 0qU6RuT7J2nGI9BOtnMCyTHId/cbE2DMkKOT2TPM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbfIYJ3Z (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 25 Sep 2019 05:29:25 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35102 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731569AbfIYJ3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Sep 2019 05:29:24 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so3674264lfl.2;
        Wed, 25 Sep 2019 02:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3A//nQ4U0ch//9NRjZkGVGrLiOj9F1zd5dYhN2nB9J0=;
        b=bOuoov9amIJClorT7w/Mt1UYfrquhlserOOWvVpzztMaXTV6aaOHc/Mp1yXcFaP0rG
         zFfyI6/NtNYM64JDo5TsKVKP4qx9JnnU3T4k85kJR6JQkzQmAwraG3H2I/aCIgIlXTiP
         Vf4Ecm/FmIpmUTWMbgswT1VrXRgpgz87/Nq0jVNztFiBK3Py+/2nWW2hszPcQWXFjTfj
         AdFiXkegQU6XlEq1i12cxkFKohca5cf576XaOAXDfNd4KXoiwlyUcG3D2ZAlJyr95bWC
         5JlhKzzY7L367VVQ+EWxuxR4vCN0/xvKjiBv7q+jMsIPZJXpN8xJAnIuEirorAYdJYJL
         5k7w==
X-Gm-Message-State: APjAAAVFlqBSmhYIsRn7RockvubPzaL/+gUCkGcgYNbscBOtA08RcKgr
        /Adz5Ar1JcZ1BQ+RGciFyH4=
X-Google-Smtp-Source: APXvYqzhIOrwZ5xeA83zTwMncUhIL9gjkSxGjou7BjEKHVXBSk8cG52Z3Fz5DChZNYIXrIPwyVmiaQ==
X-Received: by 2002:a19:4f5a:: with SMTP id a26mr5079832lfk.116.1569403763000;
        Wed, 25 Sep 2019 02:29:23 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r6sm1069401ljr.77.2019.09.25.02.29.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 02:29:21 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iD3bz-0002Fa-7g; Wed, 25 Sep 2019 11:29:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        stable <stable@vger.kernel.org>,
        syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
Subject: [PATCH 1/2] USB: adutux: fix use-after-free on disconnect
Date:   Wed, 25 Sep 2019 11:29:12 +0200
Message-Id: <20190925092913.8608-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver was clearing its struct usb_device pointer, which it used as
an inverted disconnected flag, before deregistering the character device
and without serialising against racing release().

This could lead to a use-after-free if a racing release() callback
observes the cleared pointer and frees the driver data before
disconnect() is finished with it.

This could also lead to NULL-pointer dereferences in a racing open().

Fixes: f08812d5eb8f ("USB: FIx locks and urb->status in adutux (updated)")
Cc: stable <stable@vger.kernel.org>     # 2.6.24
Reported-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
Tested-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/adutux.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 344d523b0502..bcc138990e2f 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -762,14 +762,15 @@ static void adu_disconnect(struct usb_interface *interface)
 
 	dev = usb_get_intfdata(interface);
 
-	mutex_lock(&dev->mtx);	/* not interruptible */
-	dev->udev = NULL;	/* poison */
 	usb_deregister_dev(interface, &adu_class);
-	mutex_unlock(&dev->mtx);
 
 	mutex_lock(&adutux_mutex);
 	usb_set_intfdata(interface, NULL);
 
+	mutex_lock(&dev->mtx);	/* not interruptible */
+	dev->udev = NULL;	/* poison */
+	mutex_unlock(&dev->mtx);
+
 	/* if the device is not opened, then we clean up right now */
 	if (!dev->open_count)
 		adu_delete(dev);
-- 
2.23.0

