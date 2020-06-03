Return-Path: <SRS0=gvS/=7Q=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C951FC433E0
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jun 2020 12:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3540207D8
	for <linux-usb@archiver.kernel.org>; Wed,  3 Jun 2020 12:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgFCML4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 3 Jun 2020 08:11:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48702 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgFCML4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Jun 2020 08:11:56 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jgSFN-0004zv-7D; Wed, 03 Jun 2020 12:11:53 +0000
From:   Colin King <colin.king@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] usb: xhci: fix spelling mistake in Kconfig "firwmare" -> "firmware"
Date:   Wed,  3 Jun 2020 13:11:52 +0100
Message-Id: <20200603121152.16550-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in the Kconfig text. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 62c348062e48..5f4b6c71392c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -44,10 +44,10 @@ config USB_XHCI_PCI
 	default y
 
 config USB_XHCI_PCI_RENESAS
-	tristate "Support for additional Renesas xHCI controller with firwmare"
+	tristate "Support for additional Renesas xHCI controller with firmware"
 	---help---
 	  Say 'Y' to enable the support for the Renesas xHCI controller with
-	  firwmare. Make sure you have the firwmare for the device and
+	  firmware. Make sure you have the firwmare for the device and
 	  installed on your system for this device to work.
 	  If unsure, say 'N'.
 
-- 
2.25.1

