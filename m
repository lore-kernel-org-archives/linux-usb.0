Return-Path: <SRS0=WwEB=DG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48341C4727F
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 10:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1763B20C09
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 10:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgI2KsT (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:48:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59739 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgI2KsN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:48:13 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 29 Sep 2020 03:48:13 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 29 Sep 2020 03:48:11 -0700
X-QCInternal: smtphost
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Sep 2020 16:17:39 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id BAB882D57; Tue, 29 Sep 2020 16:17:38 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 0/5] USB DWC3 host wake up support from system suspend
Date:   Tue, 29 Sep 2020 16:17:27 +0530
Message-Id: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Avoiding phy powerdown in host mode so that it can be wake up by devices.
Set GENPD_FLAG_ACTIVE_WAKEUP flag to keep usb30_prim gdsc active
when wakeup capable devices are connected to the host.
Using PDC interrupts instead of GIC interrupst to support wakeup in
xo shutdown case.

Changes in v3:
Removed need_phy_for_wakeup flag and by default avoiding phy powerdown.
Addressed Matthias comments and added entry for DEV_SUPERSPEED.
Added suspend_quirk in dwc3 host and moved the dwc3_set_phy_speed_flags.
Added wakeup-source dt entry and reading in dwc-qcom.c glue driver.

Changes in v2:
Dropped the patch in clock to set GENPD_FLAG_ACTIVE_WAKEUP flag and 
setting in usb dwc3 driver.
Separated the core patch and glue driver patch.
Made need_phy_for_wakeup flag part of dwc structure and 
hs_phy_flags as unsgined int.
Adrressed the comment on device_init_wakeup call.
Corrected offset for reading portsc register.
Added pacth to support wakeup in xo shutdown case.

Sandeep Maheswaram (5):
  usb: dwc3: core: Host wake up support from system suspend
  usb: dwc3: host: Add suspend_quirk for dwc3 host
  usb: dwc3: qcom: Configure wakeup interrupts and set genpd active
    wakeup flag
  arm64: dts: qcom: sc7180: Use pdc interrupts for USB instead of GIC
    interrupts
  arm64: dts: qcom: sc7180: Add wakeup-source property for USB
    controller node

 arch/arm64/boot/dts/qcom/sc7180-idp.dts      |  1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi         |  8 +--
 drivers/usb/dwc3/core.c                      | 14 ++----
 drivers/usb/dwc3/core.h                      |  3 ++
 drivers/usb/dwc3/dwc3-qcom.c                 | 74 ++++++++++++++++++++++------
 drivers/usb/dwc3/host.c                      | 49 ++++++++++++++++++
 7 files changed, 120 insertions(+), 30 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

