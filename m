Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16957C433DB
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 03:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5E1464ECC
	for <linux-usb@archiver.kernel.org>; Tue,  2 Feb 2021 03:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhBBDnw (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 1 Feb 2021 22:43:52 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:54158 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231501AbhBBDnr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:47 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 756F14016B;
        Tue,  2 Feb 2021 03:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237367; bh=vf4B72nLjteLpBChNda28il0sUaqyoWfFg0QOkj8lOE=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=VQL4u5HMQp4TmlANB6GlNjvGQylJqpvssLVZ8ZcM66NOpp29A3ZL6bxW764X7R2kn
         Lm0NAp4BGs4u3Wa/eVuuccI8L7WAiILroSYhGhGt06ZqIQMwIJB1m0KrePw7uBiR1G
         VTdrJjbRkysmGJQxp54fzoaE5fJe/6HCRZQBBbGmFHghq8MzF867N03sOXbmL/GVy6
         uhCX20f/T+zk8xrdLDzj0m72UxThpl5JFFl0vgLUk1kG6g7mOQhYnXI7mLl7bSHaIE
         bicD8ab5YV8hyMmKv/2tKG39ZGyRkg0G08q+xNxSkkrJOK6jweB4NETaYOxDexS9HY
         jjvpuNAGhLVbg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5A2DCA007C;
        Tue,  2 Feb 2021 03:42:46 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:46 -0800
Date:   Mon, 01 Feb 2021 19:42:46 -0800
Message-Id: <1162209cd819aa3f20eb1c18b1a35d1ad861ec17.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 5/8] usb: xhci: Init root hub SSP rate
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Initialize USB 3.x root hub SuperSpeed Plus rate.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f232dc9c172d..7da03a1a5084 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5226,10 +5226,12 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
 			hcd->self.root_hub->rx_lanes = 2;
 			hcd->self.root_hub->tx_lanes = 2;
+			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
 			break;
 		case 1:
 			hcd->speed = HCD_USB31;
 			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
 			break;
 		}
 		xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
-- 
2.28.0

