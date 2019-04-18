Return-Path: <SRS0=JW0E=SU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C33C282DC
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D2D72183E
	for <linux-usb@archiver.kernel.org>; Thu, 18 Apr 2019 00:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IVSeUaSO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387791AbfDRAPB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 20:15:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46161 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387782AbfDRAPB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 20:15:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id q1so284834pgv.13
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 17:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8a+BZEe7v/lxE++Jk26DJvDIeRtcgS+edmxjVgSar6E=;
        b=IVSeUaSONgbK9dI1ta/UwuOc1HRfMQvPSCtcNOmVBdiHzUEh6REoeZBCONmL+PZwSV
         gdii0s7Vx/s52jH8A1PQYwkkHw9YqXyjHxrrr/jGLWyyR7H1KXSZpkgeusUpVeqsGy6D
         hURXqfMjL0W5jtLLmOK6G1hVPp3iOLlOrIF3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8a+BZEe7v/lxE++Jk26DJvDIeRtcgS+edmxjVgSar6E=;
        b=BmCSoLXeZzvZgfjcHbivHOSqGqYNapG6CyWM6AYhHolZi/K5hUMGyAx2JwnEEhbi3t
         /ThZ4ZupItdmMbqMHg5guLdm5emqIocSO9eZtXuLEXexRYbXj7Efcg1sf/btek0Vu77M
         pHe/18u7xooD6odPDmzxFKkMDQuZIOdrLUirQAIoPFD19fu81Tjt79lfUzhX7WZAqjc0
         qT4VFlegtlpJ6DSwNLPnZOwvVi6Sws6HOC7+dLvkncy+h9/yHLycTcKdKQjggylkGEVU
         WuKD93dssy9eWfP18+BYVhOXy+54KGJ5Ho12rlBtxoIF2iS22e9gap1MNqKYyXq8F3KE
         CH1w==
X-Gm-Message-State: APjAAAVwnpyAVgs2jX3HjNdV2hmtyG7O4FQOKASOuPIBGWAqcnqARRM+
        KLBmBwA20Ldc5HbttCDVXmgzGg==
X-Google-Smtp-Source: APXvYqxYqSg78iVNlYmCW86sspNg6ANcr7iduniZLCDqL6dcz9Jy0fjB/9qbeZkfU6namPKEZg5IPQ==
X-Received: by 2002:a62:6fc6:: with SMTP id k189mr74302179pfc.154.1555546500578;
        Wed, 17 Apr 2019 17:15:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id q5sm447668pff.97.2019.04.17.17.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 17:15:00 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 3/5] Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
Date:   Wed, 17 Apr 2019 17:13:54 -0700
Message-Id: <20190418001356.124334-4-dianders@chromium.org>
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
Message-ID: <20190418001354.2ZgW0wE-HkIbQKtBAEHc0CuaQ1OPE6vouTDqr8Unh0M@z>

Some SoCs with a dwc2 USB controller may need to keep the PHY on to
support remote wakeup.  Allow specifying this as a device tree
property.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
For relevant prior discussion on this patch, see:

https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org

I didn't make any changes from the prior version since I never found
out what Rob thought of my previous arguments.  If folks want a
change, perhaps they could choose from these options:

1. Assume that all dwc2 hosts would like to keep their PHY on for
   suspend if there's a USB wakeup enabled, thus we totally drop this
   binding.  This doesn't seem super great to me since I'd bet that
   many devices that use dwc2 weren't designed for USB wakeup (they
   may not keep enough clocks or rails on) so we might be wasting
   power for nothing.
2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
   it more obvious that this property is intended both to document
   that wakeup from suspend is possible and that we need the PHY for
   said wakeup.
3. Rename this property to "snps,can-wakeup-from-suspend" and assume
   it's implicit that if we can wakeup from suspend that we need to
   keep the PHY on.  If/when someone shows that a device exists using
   dwc2 where we can wakeup from suspend without the PHY they can add
   a new property.

Changes in v2: None

 Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index f70f3aee4bfc..1c5e29d23c51 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -37,6 +37,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+- snps,need-phy-for-wake: If present indicates that the phy needs to be left
+                          on for remote wakeup during suspend.
 - snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
                           we detect a wakeup.  This is due to a hardware errata.
 
@@ -53,4 +55,5 @@ Example:
 		clock-names = "otg";
 		phys = <&usbphy>;
 		phy-names = "usb2-phy";
+		snps,need-phy-for-wake;
         };
-- 
2.21.0.593.g511ec345e18-goog

