Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59EAC56202
	for <linux-usb@archiver.kernel.org>; Thu, 26 Nov 2020 18:10:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A6C721D7E
	for <linux-usb@archiver.kernel.org>; Thu, 26 Nov 2020 18:10:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nu97cKBi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404646AbgKZSJo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Nov 2020 13:09:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:54796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404399AbgKZSJo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 13:09:44 -0500
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl [82.217.20.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44E9B20B80;
        Thu, 26 Nov 2020 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606414183;
        bh=3JjTDOyYVxukDfVxy4bxD1p5JbBf7cND6hzFY+V/ZV8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nu97cKBiFiQmxrR6doWBifgnMeO01sSsbMuOAFMjS7fv03BjlNpzSZogdFHv+pqj9
         wKZ5VzEGDDRTzewGu2rMFlv3mlUDf66CgfxxGD8YHelNN/tYj0avWjoHPJWZf/QtKa
         D5yEP1UegjSXsI1EjUn0NdFD0ohxzRR17/htoelY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "taehyun.cho" <taehyun.cho@samsung.com>,
        stable <stable@vger.kernel.org>,
        Will McVicker <willmcvicker@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/4] USB: gadget: f_acm: add support for SuperSpeed Plus
Date:   Thu, 26 Nov 2020 19:09:35 +0100
Message-Id: <20201126180937.255892-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126180937.255892-1-gregkh@linuxfoundation.org>
References: <20201126180937.255892-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "taehyun.cho" <taehyun.cho@samsung.com>

Setup the SuperSpeed Plus descriptors for f_acm.  This allows the gadget
to work properly without crashing at SuperSpeed rates.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: stable <stable@vger.kernel.org>
Signed-off-by: taehyun.cho <taehyun.cho@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_acm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_acm.c b/drivers/usb/gadget/function/f_acm.c
index 46647bfac2ef..349945e064bb 100644
--- a/drivers/usb/gadget/function/f_acm.c
+++ b/drivers/usb/gadget/function/f_acm.c
@@ -686,7 +686,7 @@ acm_bind(struct usb_configuration *c, struct usb_function *f)
 	acm_ss_out_desc.bEndpointAddress = acm_fs_out_desc.bEndpointAddress;
 
 	status = usb_assign_descriptors(f, acm_fs_function, acm_hs_function,
-			acm_ss_function, NULL);
+			acm_ss_function, acm_ss_function);
 	if (status)
 		goto fail;
 
-- 
2.29.2

