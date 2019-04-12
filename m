Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A89C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 22:42:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF8EA20818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 22:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I51Nr8Nv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfDLWmU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 18:42:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34015 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfDLWmT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 18:42:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id v12so5863944pgq.1
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 15:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzD3qq/PMUVMpjWUpPygcIhbopx0mZxT37qNcK5sZeg=;
        b=I51Nr8NvO7I03CvvyUyTROENQTyD5o14qi2nx7dIdi+6gWVZccni3+8Y7liLPOoM6S
         y9AG/P3jxdIb+NZo10L2IGrB8/rc53LHv3xCCHWPWM+fMXpDiqO5LcdzLIgZz+NkIkQb
         YE2yvYHVcGNlyAKI03VIkTIuDLRqZg1dLbm2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzD3qq/PMUVMpjWUpPygcIhbopx0mZxT37qNcK5sZeg=;
        b=fAZpT3fPQJZ2HesSiyTx8B/HLht4WilC2uh2hYGQX0XmLn2w/WQRXvJx0BKFNANRSn
         4G0qvwJ8kR8FZM9bnFcM9QffB9mq1TaHKdNgtWIDsmXtL7PGjNKqnaZiceXC+Qs27K3n
         dMGOCB3lfMo+oHqizhG7yYZ355QpQALNVgwG982P5RFqBVGvouyXYB/DdfFqjfCzC3Yl
         HSI9P7LhajSXESiBvbB7zYFxYrwdkfZ8gqwrO7TESuqytAZQsC/EI12K40laQimcMg68
         iY2q3+kYPpgQUabDNXghS0azsTRdqXN9RTCDdK6PEL3Vt0VEkl23lCK0QcRhD7QXbmDH
         wujg==
X-Gm-Message-State: APjAAAVZQ3OPBTkvTxck/Pm4HqWxEyiomd8eyvifnNHaylFzqAksvW9w
        ffm1olf2i9lHTXoS8LlPAUeDRA==
X-Google-Smtp-Source: APXvYqwsHgmjXC6uKa5IaBxOFT2e9eBfb4WK9JupK/WhHmuI1mKfXXGN9jIgHYYXdygBtHRX1fxrvA==
X-Received: by 2002:aa7:8384:: with SMTP id u4mr59216540pfm.214.1555108938477;
        Fri, 12 Apr 2019 15:42:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id j22sm57170579pfn.129.2019.04.12.15.42.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 15:42:17 -0700 (PDT)
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
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] ARM: dts: rockchip: Hook resets up to USB PHYs on rk3288.
Date:   Fri, 12 Apr 2019 15:41:48 -0700
Message-Id: <20190412224149.106971-4-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
In-Reply-To: <20190412224149.106971-1-dianders@chromium.org>
References: <20190412224149.106971-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412224148.W5ETBN2IvHWCaA0Tja02ar84MZ5KHLBbOEeZGOrQWHA@z>

Let's hook up the resets to the three USB PHYs on rk3288 as per the
bindings.  This is in preparation for a future patch that will set the
"snps,reset-phy-on-wake" on the host port.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 2e604f0afa98..92e0600595f8 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -905,6 +905,8 @@
 				clocks = <&cru SCLK_OTGPHY0>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBOTG_PHY>;
+				reset-names = "phy-reset";
 			};
 
 			usbphy1: usb-phy@334 {
@@ -913,6 +915,8 @@
 				clocks = <&cru SCLK_OTGPHY1>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBHOST0_PHY>;
+				reset-names = "phy-reset";
 			};
 
 			usbphy2: usb-phy@348 {
@@ -921,6 +925,8 @@
 				clocks = <&cru SCLK_OTGPHY2>;
 				clock-names = "phyclk";
 				#clock-cells = <0>;
+				resets = <&cru SRST_USBHOST1_PHY>;
+				reset-names = "phy-reset";
 			};
 		};
 	};
-- 
2.21.0.392.gf8f6787159e-goog

