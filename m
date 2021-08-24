Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEBBC4338F
	for <linux-usb@archiver.kernel.org>; Tue, 24 Aug 2021 03:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35A1361058
	for <linux-usb@archiver.kernel.org>; Tue, 24 Aug 2021 03:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbhHXD4L (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 23 Aug 2021 23:56:11 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:65129 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbhHXDz4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Aug 2021 23:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629777313; x=1661313313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NXGWrHEYB4sSzdu9YW922C7tszszO+TjV0An8VGqRNg=;
  b=NL+QUCtc9B5y1XV1/cgNAQK9fBHNiOFK//XWG/vG8QE62xrDvAM1JOEo
   ydrcOSRVVYVA8RSU8mQyDkPttrgbtFAly3naT2Tn+VysFatnY7S07vg6W
   Uc6aiSBnhPc2SRkG0O1qRtDigKHl2jvZd2cK/SgqUz7cZU+3iqgeSCAVT
   0=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Aug 2021 20:55:12 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 20:55:13 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7;
 Mon, 23 Aug 2021 20:55:11 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH V4 2/3] usb: gadget: configfs: add function link trace entry
Date:   Tue, 24 Aug 2021 11:54:40 +0800
Message-ID: <1629777281-30188-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

add trace in function config_usb_cfg_link()
will show which function was added to gadget configuration.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c       |  4 ++++
 drivers/usb/gadget/configfs_trace.h | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index f7f3af8..8c64640 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -426,6 +426,10 @@ static int config_usb_cfg_link(
 	struct usb_function *f;
 	int ret;
 
+	trace_config_usb_cfg_link(config_item_name(&gi->group.cg_item),
+				config_item_name(usb_cfg_ci),
+				config_item_name(usb_func_ci));
+
 	mutex_lock(&gi->lock);
 	/*
 	 * Make sure this function is from within our _this_ gadget and not
diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
index f2e17e4..5c666f1 100644
--- a/drivers/usb/gadget/configfs_trace.h
+++ b/drivers/usb/gadget/configfs_trace.h
@@ -26,6 +26,23 @@ TRACE_EVENT(gadget_dev_desc_UDC_store,
 		__get_str(udc_name))
 );
 
+TRACE_EVENT(config_usb_cfg_link,
+	TP_PROTO(char *name, char *cfg, char *func),
+	TP_ARGS(name, cfg, func),
+	TP_STRUCT__entry(
+		__string(group_name, name)
+		__string(cfg_name, cfg)
+		__string(func_name, func)
+	),
+	TP_fast_assign(
+		__assign_str(group_name, name);
+		__assign_str(cfg_name, cfg);
+		__assign_str(func_name, func)
+	),
+	TP_printk("gadget:%s cfg:%s link func:%s", __get_str(group_name),
+		__get_str(cfg_name), __get_str(func_name))
+);
+
 #endif /* __GADGET_TRACE_H */
 
 /* this part has to be here */
-- 
2.7.4

