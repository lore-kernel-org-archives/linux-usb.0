Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDC9C10F14
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 22:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62F8F20818
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 22:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kaVMx2CG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfDLWmQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 18:42:16 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41320 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfDLWmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 18:42:15 -0400
Received: by mail-pl1-f195.google.com with SMTP id d1so5780328plj.8
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ngcn1hFw8Idtgog7uZA26fpDBwfRZfsO4S5EVa4nB8=;
        b=kaVMx2CGUv+F7QdUeNhXNc/025lldoXzYYDRCbNP7+PY5frjU14guCrDchjyU6XpBg
         xejnxDmCPSe/eAokqL/btZ5wgexyJjKfpHkEBebyTAuQ7xXl0+oERBxsISqel4ZrrJZt
         +LYyLMysprW1iip6meQ2OMEE2KUkObENhVuv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ngcn1hFw8Idtgog7uZA26fpDBwfRZfsO4S5EVa4nB8=;
        b=kodPyyUEC3FtlqQVP8+Spk7upMbfklRvQmKwgPEWxSRGEioWb6M7asUzrrSGCeCdaQ
         uSFYMGe8q3FUbAQBQgCc6mTXSzv5Ky+AqdfCpUDT97BbRIVPejadFMeAtzzu2P3iFFW5
         vLrL8FIdWJrCK0vk/RxNkqANCoJL04TYrBz8UaQSA6YnDkxUzedmsSHzJ/SJw05XtBeO
         C6JlRm1Z1W3n3wBQcsOvgk0DNInvrGBi68iEmHM/zoHjA2eP+/bd3kdXkS9GPgxlVkkV
         W2UoXaruPuROd/h6GqUltNHXtbI27/bs1gfyzBEM0tvZZIF0Jz3h4TbWtkzzHFxooKOW
         0t3g==
X-Gm-Message-State: APjAAAU/PheGL/TobzWV5flqXKSNqRkmtGeXR8xR6jS25/uu/vjDzzlK
        10pTdcKGn5ZPcgumJ+EWSUn6iQ==
X-Google-Smtp-Source: APXvYqw9fJqLJ4H66fWrkQ0rZ0t7wvUSM0mOB4NGTtWkpxku760IEJjfA5ga0WKH+gGKJNjXqExSAA==
X-Received: by 2002:a17:902:6949:: with SMTP id k9mr59815428plt.59.1555108934928;
        Fri, 12 Apr 2019 15:42:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id j22sm57170579pfn.129.2019.04.12.15.42.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 15:42:14 -0700 (PDT)
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
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] usb: dwc2: Another attempt handling rk3288's remote wake quirk
Date:   Fri, 12 Apr 2019 15:41:45 -0700
Message-Id: <20190412224149.106971-1-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is another attempt to upstream the code to unwedge the rk3288's
"host" USB port when it sees a remote wakeup.  Previously I attempted
this [1] and it appears that Randy Li made some attempts too [2] which
resulted in at least the PHY bindings for the USB PHY landing as well
as the USB PHY support.  Nice!

Hopefully this addresses previous comments and could land this time?

[1] https://lkml.kernel.org/r/1446236275-12698-2-git-send-email-dianders@chromium.org
[2] https://lkml.kernel.org/r/1472939729-15187-4-git-send-email-ayaka@soulik.info


Douglas Anderson (4):
  dt-bindings: usb: dwc2: Document quirk to reset PHY upon wakeup
  usb: dwc2: optionally assert phy reset when waking up
  ARM: dts: rockchip: Hook resets up to USB PHYs on rk3288.
  ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on
    wakeup

 Documentation/devicetree/bindings/usb/dwc2.txt |  2 ++
 arch/arm/boot/dts/rk3288.dtsi                  |  7 +++++++
 drivers/usb/dwc2/core.h                        |  5 +++++
 drivers/usb/dwc2/core_intr.c                   | 12 ++++++++++++
 drivers/usb/dwc2/hcd.c                         | 16 +++++++++++++---
 drivers/usb/dwc2/platform.c                    |  9 +++++++++
 6 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.21.0.392.gf8f6787159e-goog

