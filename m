Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608D5C4338F
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 20:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E46361040
	for <linux-usb@archiver.kernel.org>; Mon,  9 Aug 2021 20:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhHIUVk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Aug 2021 16:21:40 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:49418 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhHIUVj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 16:21:39 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 1C688224368B
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH v2 1/9] usb: dwc3: meson-g12a: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
CC:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>
Organization: Open Mobile Platform
Message-ID: <96106462-5538-0b2f-f2ab-ee56e4853912@omp.ru>
Date:   Mon, 9 Aug 2021 23:21:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver neglects to check the result of platform_get_irq()'s call and
blithely passes the negative error codes to devm_request_threaded_irq()
(which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
an original error code. Stop calling devm_request_threaded_irq() with the
invalid IRQ #s.

Fixes: f90db10779ad ("usb: dwc3: meson-g12a: Add support for IRQ based OTG switching")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Felipe Balbi <balbi@kernel.org>

---
Changes in version 2:
- added Martin's and Felipe's tags.

drivers/usb/dwc3/dwc3-meson-g12a.c |    2 ++
 1 file changed, 2 insertions(+)

Index: usb/drivers/usb/dwc3/dwc3-meson-g12a.c
===================================================================
--- usb.orig/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ usb/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -598,6 +598,8 @@ static int dwc3_meson_g12a_otg_init(stru
 				   USB_R5_ID_DIG_IRQ, 0);
 
 		irq = platform_get_irq(pdev, 0);
+		if (irq < 0)
+			return irq;
 		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 						dwc3_meson_g12a_irq_thread,
 						IRQF_ONESHOT, pdev->name, priv);
