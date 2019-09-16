Return-Path: <SRS0=IHuJ=XL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67DEC4CECE
	for <linux-usb@archiver.kernel.org>; Mon, 16 Sep 2019 11:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B17F7214AF
	for <linux-usb@archiver.kernel.org>; Mon, 16 Sep 2019 11:41:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="hvcrs6ts";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="aGuVDYCO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732102AbfIPLlU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 16 Sep 2019 07:41:20 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48298 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfIPLlT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 07:41:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 904D46119F; Mon, 16 Sep 2019 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634078;
        bh=2PJhMQSA3xklJdMu+Ik6oPsLb1zpvS8xrkWgejzklR0=;
        h=From:To:Cc:Subject:Date:From;
        b=hvcrs6ts1KbuWsXG0cCbfNXGvFLMWx0DDjSx80JpL1Y7LOkNE1/MWfOBqFivD6u8z
         FgPYyBPaaf30/4iQ2O0e+wxzyr/SR1c+70TeITzttLI+vBIxPhDhoMgD3V+/AknDut
         XX/IuxbuF1+w5t9i2I+G4bZUd9mH6fR9t+vQTZGk=
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B98361231;
        Mon, 16 Sep 2019 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634077;
        bh=2PJhMQSA3xklJdMu+Ik6oPsLb1zpvS8xrkWgejzklR0=;
        h=From:To:Cc:Subject:Date:From;
        b=aGuVDYCOcXvtnqEUMnb4ZGWBd1rW2RyQL9nKB320EAFsH9o0nViQdcIrySJ4vvHy9
         wNWHrNYfXihAKG4X/UlJoPkMMO0umN37aRTchCwD4BjhebHIitfwPSAXKHE0N1Iep1
         HC997ZR6xZ/TlpzMiydn3dpQ70hEXaX6EbCiEm1Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B98361231
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V2 0/3] ADD interconnect support for USB
Date:   Mon, 16 Sep 2019 17:10:58 +0530
Message-Id: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This path series aims to add interconnect support in
dwc3-qcom driver on SDM845 SoCs.

Changes since V1:
  > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
  > [PATCH 1/3] and [PATCH 3/3] remains unchanged

Chandana Kishori Chiluveru (3):
  dt-bindings: Introduce interconnect bindings for usb
  usb: dwc3: qcom: Add interconnect support in dwc3 driver
  arm64: dts: sdm845: Add interconnect properties for USB

 .../devicetree/bindings/usb/qcom,dwc3.txt          |  13 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  12 ++
 drivers/usb/dwc3/dwc3-qcom.c                       | 145 ++++++++++++++++++++-
 3 files changed, 168 insertions(+), 2 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

