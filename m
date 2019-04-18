Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DCCC282DC
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF71321850
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IxvwAG/F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387855AbfDRAPR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 20:15:17 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43408 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387687AbfDRAO7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 20:14:59 -0400
Received: by mail-pf1-f196.google.com with SMTP id c8so224304pfd.10
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 17:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEymG5YLHbrDDzFxo52pdSm6cWs0XYbMN/p1plON6hw=;
        b=IxvwAG/FD+h3vReXVkO8WN6TgoWmn5hmjEDHCWUqYGymihVRS6a5o1mVUT3QNKxtUS
         s8WcGVHZle2CbosV4XoPgSRF+m5tBlUbQOt2yAkreM99lgKyKUsc0Fkuy3JlX/HFQ/4d
         bdAJoUwFWOoAEIZttOkK4YpGJT2cIkcGbSuHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEymG5YLHbrDDzFxo52pdSm6cWs0XYbMN/p1plON6hw=;
        b=l3EouFYzIhru0xbi4cfofZS6ip8Srpgkj3/681BezGq20/Vlr/UpK/3AvusAI/lAj2
         yYHt105gK0sNCI113358EjtG7JTzUiFsFMEd8+dBPmUAH5eHo5V0T1PVkfNzmGD/jFoV
         m/ZhndKD5Wf7NPscrPCTZ4iUPfx4eCpCV3dGUnxw2l/hsW5VT3i+m2XgloQt33v9rw/+
         lZIFkxkDLzL14PcSSInQqibpMZxIOPZwLv0gYAw44xCSgXjX9keK5L5MHjcPyHj/wfO0
         eq+VkVYpFq12WsnF1MOQAy7XMA5Yr78f114JgEmUxJao3hbLQcPqpCqjr63Rk/B9VFhk
         nN/A==
X-Gm-Message-State: APjAAAXqdB09IS+LXly4H+8mD9UYobMEoJ+Nqot25wnhPxEWts9QUrTR
        VWn+0gHG9F6yMU8smWkSbs9IaQ==
X-Google-Smtp-Source: APXvYqzyMQB6DofPsR3ROmeLa7d3NvmAdljo4RKmr1talzLCVFturW2bHncz7YNf+WhFu2sdhPQ5/g==
X-Received: by 2002:a62:aa06:: with SMTP id e6mr2953350pff.254.1555546499283;
        Wed, 17 Apr 2019 17:14:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id q5sm447668pff.97.2019.04.17.17.14.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 17:14:58 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, zyw@rock-chips.com,
        mka@chromium.org, ryandcase@chromium.org,
        Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org,
        dinguyen@opensource.altera.com,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-kernel@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jon Flatley <jflat@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 2/5] USB: Export usb_wakeup_enabled_descendants()
Date:   Wed, 17 Apr 2019 17:13:53 -0700
Message-Id: <20190418001356.124334-3-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190418001356.124334-1-dianders@chromium.org>
References: <20190418001356.124334-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190418001353.iWi5HJRm79FLW0GlFvCxGwrEM2TLw-qk6NX0gdkhV88@z>

In (e583d9d USB: global suspend and remote wakeup don't mix) we
introduced wakeup_enabled_descendants() as a static function.  We'd
like to use this function in USB controller drivers to know if we
should keep the controller on during suspend time, since doing so has
a power impact.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
For relevant prior discussion of this idea, see:

https://lkml.kernel.org/r/1436207224-21849-4-git-send-email-dianders@chromium.org

If I'm reading all the responses correctly folks were of the opinion
that this patch is still the right way to go.

Changes in v2: None

 drivers/usb/core/hub.c  | 7 ++++---
 include/linux/usb/hcd.h | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8d4631c81b9f..5e8f3fa7ae5a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3174,13 +3174,14 @@ static int usb_disable_remote_wakeup(struct usb_device *udev)
 }
 
 /* Count of wakeup-enabled devices at or below udev */
-static unsigned wakeup_enabled_descendants(struct usb_device *udev)
+unsigned usb_wakeup_enabled_descendants(struct usb_device *udev)
 {
 	struct usb_hub *hub = usb_hub_to_struct_hub(udev);
 
 	return udev->do_remote_wakeup +
 			(hub ? hub->wakeup_enabled_descendants : 0);
 }
+EXPORT_SYMBOL_GPL(usb_wakeup_enabled_descendants);
 
 /*
  * usb_port_suspend - suspend a usb device's upstream port
@@ -3282,7 +3283,7 @@ int usb_port_suspend(struct usb_device *udev, pm_message_t msg)
 	 * Therefore we will turn on the suspend feature if udev or any of its
 	 * descendants is enabled for remote wakeup.
 	 */
-	else if (PMSG_IS_AUTO(msg) || wakeup_enabled_descendants(udev) > 0)
+	else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0)
 		status = set_port_feature(hub->hdev, port1,
 				USB_PORT_FEAT_SUSPEND);
 	else {
@@ -3687,7 +3688,7 @@ static int hub_suspend(struct usb_interface *intf, pm_message_t msg)
 		}
 		if (udev)
 			hub->wakeup_enabled_descendants +=
-					wakeup_enabled_descendants(udev);
+					usb_wakeup_enabled_descendants(udev);
 	}
 
 	if (hdev->do_remote_wakeup && hub->quirk_check_port_auto_suspend) {
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 695931b03684..ed4fbbd1b35f 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -652,11 +652,16 @@ extern wait_queue_head_t usb_kill_urb_queue;
 #define usb_endpoint_out(ep_dir)	(!((ep_dir) & USB_DIR_IN))
 
 #ifdef CONFIG_PM
+extern unsigned usb_wakeup_enabled_descendants(struct usb_device *udev);
 extern void usb_root_hub_lost_power(struct usb_device *rhdev);
 extern int hcd_bus_suspend(struct usb_device *rhdev, pm_message_t msg);
 extern int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg);
 extern void usb_hcd_resume_root_hub(struct usb_hcd *hcd);
 #else
+static inline unsigned usb_wakeup_enabled_descendants(struct usb_device *udev)
+{
+	return 0;
+}
 static inline void usb_hcd_resume_root_hub(struct usb_hcd *hcd)
 {
 	return;
-- 
2.21.0.593.g511ec345e18-goog

