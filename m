Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80243C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85E6D206BF
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 21:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F3lzC1fN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfDYVGM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 17:06:12 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:46244 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726429AbfDYVGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 17:06:12 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1470CC0352;
        Thu, 25 Apr 2019 21:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556226372; bh=iHU/GZ3/Nm/rWfyUJT2oIC2yqyBfrPAguLCEDT2YF0I=;
        h=Date:From:Subject:To:CC:From;
        b=F3lzC1fN760Syiggajx8aUMMrvVOfsxAD9PHGjP5x9xKbZ00VQKC5DrbUjYr2ojz8
         yEE/4RWHeOJRls/0LhrXBvYKGLyoGUK8Ey9pGX9vx6YI04XYVdOvx60YZFjP0qTRAz
         fLuphCfZbRBVATppO/ZVEltqbhZV4xQRgw+Dw3cryKYkxJ9dP9CYq7s4jBf26KudMF
         qLyVHJSDoW8m2SyedxB05/DO4O3imbMqfAd+4dfSAxrW44lK5h3RbQQsS+Q1PcWXAM
         PRDYMldQIYPqLJ4uHWv/ll+uUpUJOblJjgEjB5YNjMl2dAicrhQK8ruFBqjwZNPYrQ
         nP3Qd2cxKykJA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1101DA0079;
        Thu, 25 Apr 2019 21:06:12 +0000 (UTC)
Received: from US01WEHTC1.internal.synopsys.com (10.12.239.236) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Apr 2019 14:06:11 -0700
Received: from te-lab16 (10.13.184.19) by us01wehtc1.internal.synopsys.com
 (10.12.239.236) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 25 Apr
 2019 14:06:10 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 25 Apr 2019 14:06:10
 -0700
Date:   Thu, 25 Apr 2019 14:06:10 -0700
Message-ID:
 <0576542b255f26d2c89f358a1eacd66c4c3dce8b.1556226012.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: debug: Print GET_STATUS(device) tracepoint
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425210610.vFp4dCHUI14S4_IL4D0nC3irRbgL41WuQYnPCtN19Jo@z>

DWC3 is missing the printing of control request GET_STATUS(device)
tracepoint. This patch prints that.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/debug.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 6759a7efd8d5..068259fdfb0c 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -250,6 +250,9 @@ static inline void dwc3_decode_get_status(__u8 t, __u16 i, __u16 l, char *str,
 		size_t size)
 {
 	switch (t & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		snprintf(str, size, "Get Device Status(Length = %d)", l);
+		break;
 	case USB_RECIP_INTERFACE:
 		snprintf(str, size, "Get Interface Status(Intf = %d, Length = %d)",
 				i, l);
-- 
2.11.0

