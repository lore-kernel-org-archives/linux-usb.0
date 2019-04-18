Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA19DC282DC
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0D222183E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mixCdUtw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbfDRAPD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 20:15:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39674 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387799AbfDRAPD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 20:15:03 -0400
Received: by mail-pf1-f196.google.com with SMTP id i17so232962pfo.6
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 17:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MIQc6nb78x4dX7zZdpFCr2Ou987p1QUJbog7A/7Fv+o=;
        b=mixCdUtwMK+XLff4ncol1Q/8d97x7uycyS81jNA6X8UeFFCPVEiwfCbVn3fmxHXH2n
         WZBSKRzGfuOth7RXk3aT2rquxXh4yZsXZOePcLhgUoWHJ4g7sKlwpO34Mo86+wQ3fMkr
         PUbwgq85Piz5xEcnPXjzHl7xjl5SuE0gnsEnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MIQc6nb78x4dX7zZdpFCr2Ou987p1QUJbog7A/7Fv+o=;
        b=oIZBbddGeshCeAvJjqrlULOcn9Gf6LX1Bf8Nya1GpgK2kzWmJsoIch79DOGPEH2zQ8
         3DDZDHPUuZm+DDwv1ztYeKcP7HXRweakA0+jQNVwvWIsdfv/u3cp1ELxhcqMxDihoIz2
         5pJIZaiNxJJU75UWAbwJ2TmrMNAKIKGi9XZJ+s0wGuMglonTgEEvW1S43e1+0SGK6EAs
         AbFqJy05Z5fFDqyMrlhvX4+mMbSO3c5HMfdR7wyLbFAsxhmfzu3b4ZXGZfC3wuQqA/y8
         KRkkYVxnu1muMPzT2r4Dp47kR8lXWNGwPwgmKRKeozchtuCImzcCAaAEIUSvRIctWpck
         J89w==
X-Gm-Message-State: APjAAAV3d/JfsBMswaJYaabTFqbyKm767tXoJLGRJXZlIF33lEkg59BQ
        gcfeoV3ow/taWWCkTTIyapvi5g==
X-Google-Smtp-Source: APXvYqxx2dZRVxVNGwedp5XviAZdXPDEUKgfhKXZ+ubd9+S7qL/RTyB90fe0SwHbr45tjLTZpZWzKg==
X-Received: by 2002:a63:c746:: with SMTP id v6mr84071022pgg.401.1555546501936;
        Wed, 17 Apr 2019 17:15:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id q5sm447668pff.97.2019.04.17.17.15.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 17:15:01 -0700 (PDT)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled
Date:   Wed, 17 Apr 2019 17:13:55 -0700
Message-Id: <20190418001356.124334-5-dianders@chromium.org>
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
Message-ID: <20190418001355.2Wyp2X9Macey8e5kJ20F1E0nWhHfezddJyCv0YVOojo@z>

If the 'snps,need-phy-for-wake' is set in the device tree then:

- We know that we can wakeup, so call device_set_wakeup_capable().
  The USB core will use this knowledge to enable wakeup by default.
- We know that we should keep the PHY on during suspend if something
  on our root hub needs remote wakeup.  This requires the patch (USB:
  Export usb_wakeup_enabled_descendants()).  Note that we don't keep
  the PHY on at suspend time if it's not needed because it would be a
  power draw.

If we later find some users of dwc2 that can support wakeup without
keeping the PHY on we may want to add a way to call
device_set_wakeup_capable() without keeping the PHY on at suspend
time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---
For relevant prior discussion of this idea, see:

https://lkml.kernel.org/r/1436207224-21849-4-git-send-email-dianders@chromium.org

If I'm reading all the responses correctly folks were of the opinion
that this patch is still the right way to go.

Changes in v2:
- Rebased to mainline atop rk3288 remote wake quirk series.

 drivers/usb/dwc2/core.h     |  5 +++++
 drivers/usb/dwc2/platform.c | 43 +++++++++++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index f30748f4fe7e..a99fe7851352 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -861,6 +861,9 @@ struct dwc2_hregs_backup {
  * @hibernated:		True if core is hibernated
  * @reset_phy_on_wake:	Quirk saying that we should assert PHY reset on a
  *			remote wakeup.
+ * @phy_off_for_suspend: Status of whether we turned the PHY off at suspend.
+ * @need_phy_for_wake:	Quirk saying that we should keep the PHY on at
+ *			suspend if we need USB to wake us up.
  * @frame_number:       Frame number read from the core. For both device
  *			and host modes. The value ranges are from 0
  *			to HFNUM_MAX_FRNUM.
@@ -1049,6 +1052,8 @@ struct dwc2_hsotg {
 	unsigned int ll_hw_enabled:1;
 	unsigned int hibernated:1;
 	unsigned int reset_phy_on_wake:1;
+	unsigned int need_phy_for_wake:1;
+	unsigned int phy_off_for_suspend:1;
 	u16 frame_number;
 
 	struct phy *phy;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 9b65b766e0b9..6f0271c5d163 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -47,7 +47,9 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_data/s3c-hsotg.h>
 #include <linux/reset.h>
+#include <linux/usb.h>
 
+#include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
 
 #include "core.h"
@@ -450,6 +452,10 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	if (retval)
 		goto error;
 
+	hsotg->need_phy_for_wake =
+		of_property_read_bool(dev->dev.of_node,
+				      "snps,need-phy-for-wake");
+
 	/*
 	 * Reset before dwc2_get_hwparams() then it could get power-on real
 	 * reset value form registers.
@@ -481,6 +487,14 @@ static int dwc2_driver_probe(struct platform_device *dev)
 		hsotg->gadget_enabled = 1;
 	}
 
+	/*
+	 * If we need PHY for wakeup we must be wakeup capable.
+	 * When we have a device that can wake without the PHY we
+	 * can adjust this condition.
+	 */
+	if (hsotg->need_phy_for_wake)
+		device_set_wakeup_capable(&dev->dev, true);
+
 	hsotg->reset_phy_on_wake =
 		of_property_read_bool(dev->dev.of_node,
 				      "snps,reset-phy-on-wake");
@@ -516,6 +530,28 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	return retval;
 }
 
+static bool __maybe_unused dwc2_can_poweroff_phy(struct dwc2_hsotg *dwc2)
+{
+	struct usb_device *root_hub = dwc2_hsotg_to_hcd(dwc2)->self.root_hub;
+
+	if (!dwc2->ll_hw_enabled)
+		return false;
+
+	/* If the controller isn't allowed to wakeup then we can power off. */
+	if (!device_may_wakeup(dwc2->dev))
+		return true;
+
+	/*
+	 * We don't want to power off the PHY if something under the
+	 * root hub has wakeup enabled.
+	 */
+	if (usb_wakeup_enabled_descendants(root_hub))
+		return false;
+
+	/* No reason to keep the PHY powered, so allow poweroff */
+	return true;
+}
+
 static int __maybe_unused dwc2_suspend(struct device *dev)
 {
 	struct dwc2_hsotg *dwc2 = dev_get_drvdata(dev);
@@ -524,8 +560,10 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
 	if (dwc2_is_device_mode(dwc2))
 		dwc2_hsotg_suspend(dwc2);
 
-	if (dwc2->ll_hw_enabled)
+	if (dwc2_can_poweroff_phy(dwc2)) {
 		ret = __dwc2_lowlevel_hw_disable(dwc2);
+		dwc2->phy_off_for_suspend = true;
+	}
 
 	return ret;
 }
@@ -535,11 +573,12 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 	struct dwc2_hsotg *dwc2 = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (dwc2->ll_hw_enabled) {
+	if (dwc2->phy_off_for_suspend && dwc2->ll_hw_enabled) {
 		ret = __dwc2_lowlevel_hw_enable(dwc2);
 		if (ret)
 			return ret;
 	}
+	dwc2->phy_off_for_suspend = false;
 
 	if (dwc2_is_device_mode(dwc2))
 		ret = dwc2_hsotg_resume(dwc2);
-- 
2.21.0.593.g511ec345e18-goog

