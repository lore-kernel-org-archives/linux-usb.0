Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A0EC433EF
	for <linux-usb@archiver.kernel.org>; Tue, 15 Mar 2022 08:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345986AbiCOInu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 15 Mar 2022 04:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345950AbiCOInt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 04:43:49 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B4B4CD6C
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647333758; x=1678869758;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SLY4BkMbxyyE1XmF7ckpV0DY8c10kkOccz+RQQLkXDs=;
  b=h6z6S0/wtRb9zM0Ii84UjUP5DI674nBKCM4OtbxvVyHkgjfyWygaBgjs
   mf2GHcQ5/ZycriWAZW6o7o+jUHzX7eGwXLMdh+gHK134UQMd//m0FtZnL
   U+elVYfF0d7v+wBIHjZtlwbMGAvgf+2qZxAILvpjNrykchEF6CHXAzj85
   4=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 01:42:38 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 01:42:38 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 01:42:37 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 01:42:36 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH] usb: gadget: Makefile: remove ccflags-y
Date:   Tue, 15 Mar 2022 16:42:31 +0800
Message-ID: <1647333751-32367-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No header file used from udc directory, so remove line below
ccflags-y += -I$(srctree)/drivers/usb/gadget/udc.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 130dad7..33f1ef9 100644
--- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -4,7 +4,6 @@
 #
 subdir-ccflags-$(CONFIG_USB_GADGET_DEBUG)	:= -DDEBUG
 subdir-ccflags-$(CONFIG_USB_GADGET_VERBOSE)	+= -DVERBOSE_DEBUG
-ccflags-y				+= -I$(srctree)/drivers/usb/gadget/udc
 
 obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
 libcomposite-y			:= usbstring.o config.o epautoconf.o
-- 
2.7.4

