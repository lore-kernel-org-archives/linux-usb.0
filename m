Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AFFC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 22:42:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B225F20818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 22:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P5nTYPh6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfDLWmV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 18:42:21 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40600 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbfDLWmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 18:42:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id c207so5797068pfc.7
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/YuEmfQg8iFJSPB8k83tnNDUSXUSqQSeLxTTSLbTTIw=;
        b=P5nTYPh6nN+ghxubaHuPvzgMsTS6c1Xt/Xvkr9w2rsv7ycd0UBEp43vGHPMABrMA44
         8M1S92pVD/nXq/g4qcsJrJE3pQ5hdDPeaPGzBY08joVJz2pRCq+R/45s9T/NDQcNvwmK
         0SeL6Og/rn6RzOK+wrkEtwZYp1WhY7HOYCVIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/YuEmfQg8iFJSPB8k83tnNDUSXUSqQSeLxTTSLbTTIw=;
        b=N9ntZt7goe6CG+ftiOQEEFhwAK/cv931eSOWN19LK/V/D7FDA10ZL14Al8/6FYsWE3
         CEbnNom54mXPi3mr42T2lgAOfEgsiBgrh3zcq1z3SPP6NTbHZHuPc43/07G5nfwqhHmq
         fHRpoLwtfkda1e9bm/ZCJF1bX2TbSrdnLjgVtk5IRgmhWvg5GxmTBRX8oz/bCpkFvbAQ
         7+/SCMWKPM3ArlBR5F/+eST5/zJFJkwhbY2rHwZYS1ROZqXMFuaZcAoMEJkoFOhC2UnH
         ufRfbxfAG1GMDGIzy1Dgq5Kyn+whM7tM53T5SZij/N9wlxngEno4d1s7sj8NH5g0p0gj
         tByg==
X-Gm-Message-State: APjAAAXdfdcCVlshVreYWkXdKKGsuMPDr+bRI6c5/SJ0kJgZaoP+DVH4
        NZIq8DXHnPn08+5fFKZSn5ubLw==
X-Google-Smtp-Source: APXvYqz6+8oEj+Agjb0SozX8O6BNiaCaZRMvO2ErsDU5sbBvwehG9ytDclHC9I/t9H4hjjFzy2iowQ==
X-Received: by 2002:a63:25c4:: with SMTP id l187mr57149864pgl.202.1555108940140;
        Fri, 12 Apr 2019 15:42:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id j22sm57170579pfn.129.2019.04.12.15.42.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 15:42:19 -0700 (PDT)
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
Subject: [PATCH 4/4] ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on wakeup
Date:   Fri, 12 Apr 2019 15:41:49 -0700
Message-Id: <20190412224149.106971-5-dianders@chromium.org>
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
Message-ID: <20190412224149.ydP_LnMwrfJkxYAqf-fSKDppGS3GHaBmCYh2QvVu7qE@z>

The "host" USB port on rk3288 has a hardware errata where we've got to
assert a PHY reset whenever we see a remote wakeup.  Add that quirk
property to the device tree.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 92e0600595f8..6367c1b50fd7 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -617,6 +617,7 @@
 		dr_mode = "host";
 		phys = <&usbphy2>;
 		phy-names = "usb2-phy";
+		snps,reset-phy-on-wake;
 		status = "disabled";
 	};
 
-- 
2.21.0.392.gf8f6787159e-goog

