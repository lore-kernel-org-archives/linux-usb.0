Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AD3C43465
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 14:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39A5A20B1F
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600696806;
	bh=0nVXFxKlv3B/GshEQOcN9O2mcYuufyoFZnV3PZOywDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Krz5CgBvjIZfxZS6vfyMI+PVtiFbup77N+df07wm1I9r1VwKMZB1V9x892wv9X+DK
	 3YIdIL4ctdzSVPJHb2oaDzfEPkyMWLHq/inCiKBWr20DdGCrgpg8wZHK+gbIE/J20j
	 YgpHKkvMo6FxgoETqUbk6rdQyF5D47ZmOCDMr3Qs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgIUOAF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 10:00:05 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40367 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727212AbgIUOAE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:00:04 -0400
Received: by mail-lj1-f195.google.com with SMTP id s205so11170317lja.7;
        Mon, 21 Sep 2020 07:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hb+hvNgCGvB638VQzdE3NIGwCfs5oVJCLR3se4p/iOQ=;
        b=mmArRY58tz1JUoF4Mt13TyuEU2tR1XntFGnzjmQZIURnM8V4zoV+WGF4Go2XSqQe6f
         IKc40KM285evvj9AiLc66SixWYy5Fb0rqiwyEKe9nYSqvH8NKx9+VxGl9h8RzXYqHB95
         J0L5K4WiVm0VUo7tarqlkVaSnKdRJGEZUi3/F1WbbAjUOq1siiNlGn71SjBPpjqmmSn7
         n0cbYDN7sMVrMj6y8TgvTfdjBvnXc3rGXCXSz4gUq4BdxdsmwEp17jBPl4Hiuoy74EMp
         8QFwGpZaG6bCMc3gdx9CRQl4TbMZiZ8aCC5qEkTOKYvOz1iAhfDUFBCAKFQHNAgVXt+L
         5dLw==
X-Gm-Message-State: AOAM530RPtuzKJjdOevWz0D+fUvTMpq/Zh/GsJVxNqlkK5sKeHYhs+gd
        aFHur82lGooDK3R3+pzJKfE=
X-Google-Smtp-Source: ABdhPJz7LguBTd+8s7pivgoffUS7JzHCqg1FrpvAy9NmuriFUwh+MTpgAq7UPuAEvXTmBIZ/FLMscg==
X-Received: by 2002:a2e:7215:: with SMTP id n21mr16504713ljc.438.1600696801854;
        Mon, 21 Sep 2020 07:00:01 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k205sm2594711lfk.19.2020.09.21.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:00:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKMMF-0006Gu-2Q; Mon, 21 Sep 2020 15:59:55 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Subject: [PATCH v2 2/4] USB: cdc-acm: handle broken union descriptors
Date:   Mon, 21 Sep 2020 15:59:49 +0200
Message-Id: <20200921135951.24045-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921135951.24045-1-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Handle broken union functional descriptors where the master-interface
doesn't exist or where its class is of neither Communication or Data
type (as required by the specification) by falling back to
"combined-interface" probing.

Note that this still allows for handling union descriptors with switched
interfaces.

This specifically makes the Whistler radio scanners TRX series devices
work with the driver without adding further quirks to the device-id
table.

Link: https://lore.kernel.org/r/5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com
Reported-by: Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index e28ac640ff9c..f42ade505569 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1240,9 +1240,21 @@ static int acm_probe(struct usb_interface *intf,
 			}
 		}
 	} else {
+		int class = -1;
+
 		data_intf_num = union_header->bSlaveInterface0;
 		control_interface = usb_ifnum_to_if(usb_dev, union_header->bMasterInterface0);
 		data_interface = usb_ifnum_to_if(usb_dev, data_intf_num);
+
+		if (control_interface)
+			class = control_interface->cur_altsetting->desc.bInterfaceClass;
+
+		if (class != USB_CLASS_COMM && class != USB_CLASS_CDC_DATA) {
+			dev_dbg(&intf->dev, "Broken union descriptor, assuming single interface\n");
+			combined_interfaces = 1;
+			control_interface = data_interface = intf;
+			goto look_for_collapsed_interface;
+		}
 	}
 
 	if (!control_interface || !data_interface) {
-- 
2.26.2

