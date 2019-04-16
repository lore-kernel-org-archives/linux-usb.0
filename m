Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5429FC10F14
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 21:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23D86206B6
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 21:54:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iAutK9hi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730671AbfDPVyO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 17:54:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44098 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730596AbfDPVyN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Apr 2019 17:54:13 -0400
Received: by mail-pg1-f193.google.com with SMTP id i2so10967910pgj.11
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2019 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XsFf4LEh0pktHURaMfPnlhrkOmI1Owbh5PPEFMjaE6c=;
        b=iAutK9hipedEuHpce3EVCQiVHg1QIADXgE6iqLm1r6d1fj7U2UxC7EQiQB9cxDi8Ii
         SfBS68X6Kezeq3ah8uFonHpSA+3J6bahOeI5qcPe3sJRjsHoOFtB8xueB7usSKAPIseB
         t4vRGdujBdSPadp44iYqSkCoHtvKGS+e621f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsFf4LEh0pktHURaMfPnlhrkOmI1Owbh5PPEFMjaE6c=;
        b=iG/WAiuDX6kUSUAJ9/VQ4QTBCb61EXt/UZIPGvULHEJh6VGW/p8wHYgTHHK3Ag+zwc
         5XyhxaCFXAEttRo6RIBt6JxEIQvsM6iv4d2lF670vFxyqLN+oc2hitnEdI3r5dsv/LAe
         QyjqVGSMiCI1ihwgFWXrRWb49/AEZq3tNGq3/2rqMUJuIvjlmaAb3RgVZ8KKxRKYho9n
         uQ9WWQPQ1JkDuI/7kImDY8Ayb7WY9IJboU2PL7npSqL/ECGBGmPh7sh3nwaF7BwA55MO
         e28JXC+Ws6ZxcGFpUM9/WA5+/lX+lVINcIh0KKsmUXCKSmOiM2VbzB5NjiRey//mw4GP
         1Qaw==
X-Gm-Message-State: APjAAAWCu9iotdfZY4pqvT/Fpe9UxMPRcWzJpsfqARjSGIxioAZPriL5
        jYPwI+Ptx/prYJ1cSLuW7DsAog==
X-Google-Smtp-Source: APXvYqx9Echs2wcQSIcKJnQgMM0GXGhmDvbnb5yHOmCUV3xMZ9JzJrqQ4WwBfzBGesIzMap8lN9mAQ==
X-Received: by 2002:a63:4144:: with SMTP id o65mr75004207pga.241.1555451653028;
        Tue, 16 Apr 2019 14:54:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id b6sm8156770pgt.58.2019.04.16.14.54.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 14:54:12 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     amstan@chromium.org, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>,
        mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/4] dt-bindings: usb: dwc2: Document quirk to reset PHY upon wakeup
Date:   Tue, 16 Apr 2019 14:53:48 -0700
Message-Id: <20190416215351.242246-2-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190416215351.242246-1-dianders@chromium.org>
References: <20190416215351.242246-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416215348.Ujo3sriVVySZbNayzPIH53H1btV79XSJJGsMDDKQqMo@z>

On Rockchip rk3288 there's a hardware quirk where we need to assert
the reset signal to the PHY when we get a remote wakeup on one of the
two ports.  Document this quirk in the bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2: None

 Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6dc3c4a34483..f70f3aee4bfc 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -37,6 +37,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+- snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
+                          we detect a wakeup.  This is due to a hardware errata.
 
 Deprecated properties:
 - g-use-dma: gadget DMA mode is automatically detected
-- 
2.21.0.593.g511ec345e18-goog

