Return-Path: <SRS0=+jy/=ZV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1163CC432C3
	for <linux-usb@archiver.kernel.org>; Fri, 29 Nov 2019 10:20:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D904C2086A
	for <linux-usb@archiver.kernel.org>; Fri, 29 Nov 2019 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575022806;
	bh=jAzA4Sfd9bJGOMdJJqTPorOs7dOko/+46Xq2XKJAgSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=xTXilRTHf1k5ZlpJ7TMrRtWd4Glfvue57SsHySNc6hNrJF0fz9UIfHbyJveuoSn29
	 0+Mw0VfG1M+G5arXdB1VAdFxdClRZYmxeN+04a8QYOPoMDPWA3qJXqQbSVQkrcWwHp
	 4pkLhy5I3znaUbdwYYOsTM+3+MIWRCASk0TQ4tYs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfK2KUA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 29 Nov 2019 05:20:00 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43725 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbfK2KT6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Nov 2019 05:19:58 -0500
Received: by mail-lj1-f193.google.com with SMTP id a13so8232489ljm.10;
        Fri, 29 Nov 2019 02:19:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o4x724Do8urT6OaZpBWsj3Wi4vFYKy69gf8Bt4EpD18=;
        b=HO35PgUPa0TRQ37VKtDYGBGv9mqy5g14Xy72kKfNNO8QovQcLUCDif+Qyf2p1rGI71
         FP7GNLol6qD0rcIYpiYZF7A20A7PvpKIiPC45zZb4OF+nhifOaHryJa9FhQpsjnHozRQ
         SYpEPE6x/esdujbnizKgofFRG5PVD/loALLqwm53T901DgrtujWi/56pLVhbswbyQw9w
         BYW8q0X6t6EXX3X4xZvhfaCD0w2z7tMrI8jDcnH1RHYyBrki+YSSXSW/FhErbsS63iwi
         5oZkB6pvUdF4ZTmh7QcollIOsPYYeo+oo/Puw1NOZ8SAXrXn28qf8olfpQ5tE+K+kjqa
         rXXg==
X-Gm-Message-State: APjAAAUMSn+EqgJyPjshIAyhFuhGZgGfSRezE21OPMa6FB+r8RY2xsy3
        vFg87sg2b3xDkA7wrymWrpE=
X-Google-Smtp-Source: APXvYqxUKJ2Ry6AfAHcKf0XABmShcowXhlWbcGdZsRZNCePAZURUZrhHereMSi2W5VFWNaDdMgny5Q==
X-Received: by 2002:a2e:8745:: with SMTP id q5mr7995655ljj.208.1575022796310;
        Fri, 29 Nov 2019 02:19:56 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id u16sm11279263lfi.36.2019.11.29.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 02:19:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iadNU-0002Yl-F7; Fri, 29 Nov 2019 11:19:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] staging: gigaset: add endpoint-type sanity check
Date:   Fri, 29 Nov 2019 11:17:52 +0100
Message-Id: <20191129101753.9721-4-johan@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191129101753.9721-1-johan@kernel.org>
References: <20191129101753.9721-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add endpoint type-sanity checks to prevent a warning in USB core on URB
submission.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/isdn/gigaset/usb-gigaset.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/isdn/gigaset/usb-gigaset.c b/drivers/staging/isdn/gigaset/usb-gigaset.c
index a84722d83bc6..6c07c8379711 100644
--- a/drivers/staging/isdn/gigaset/usb-gigaset.c
+++ b/drivers/staging/isdn/gigaset/usb-gigaset.c
@@ -705,6 +705,12 @@ static int gigaset_probe(struct usb_interface *interface,
 
 	endpoint = &hostif->endpoint[0].desc;
 
+	if (!usb_endpoint_dir_out(endpoint) || !usb_endpoint_xfer_bulk(endpoint)) {
+		dev_err(&interface->dev, "missing bulk-out endpoint\n");
+		retval = -ENODEV;
+		goto error;
+	}
+
 	buffer_size = le16_to_cpu(endpoint->wMaxPacketSize);
 	ucs->bulk_out_size = buffer_size;
 	ucs->bulk_out_epnum = usb_endpoint_num(endpoint);
@@ -724,6 +730,12 @@ static int gigaset_probe(struct usb_interface *interface,
 
 	endpoint = &hostif->endpoint[1].desc;
 
+	if (!usb_endpoint_dir_in(endpoint) || !usb_endpoint_xfer_int(endpoint)) {
+		dev_err(&interface->dev, "missing int-in endpoint\n");
+		retval = -ENODEV;
+		goto error;
+	}
+
 	ucs->busy = 0;
 
 	ucs->read_urb = usb_alloc_urb(0, GFP_KERNEL);
-- 
2.24.0

