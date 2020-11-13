Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C97C388F7
	for <linux-usb@archiver.kernel.org>; Fri, 13 Nov 2020 07:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D05AD20936
	for <linux-usb@archiver.kernel.org>; Fri, 13 Nov 2020 07:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FniPWTty"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgKMHr5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:47:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:47966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726142AbgKMHr5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 02:47:57 -0500
Received: from localhost.localdomain (unknown [222.65.215.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61893208D5;
        Fri, 13 Nov 2020 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605253676;
        bh=KvalIJSwdqvPkC/p8CuF/gk2CuMigEM5XixnkJJJ7QA=;
        h=From:To:Cc:Subject:Date:From;
        b=FniPWTtyVYZerkPoSAnTKBUN5GhdiW8QGY4JsEwTpU4OcmxQatKy5od7iSYo21wSx
         VMoM6YX/VOhEstxACcWPy/Il+/Qvr32xVirZgsFg0rPcvmO5ys+e8S8BRdExwEqYJL
         pniz9qZBI7z88+tkk+FOkyY6SBlN8vFnoXKMF/e0=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: trace: fix the endian issue
Date:   Fri, 13 Nov 2020 15:47:42 +0800
Message-Id: <20201113074742.22927-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

"sparse warnings: (new ones prefixed by >>)"
   drivers/usb/chipidea/trace.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, drivers/usb/chipidea/trace.h):
>> drivers/usb/chipidea/./trace.h:39:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] next @@     got restricted __le32 [usertype] next @@
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     expected unsigned int [usertype] next
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     got restricted __le32 [usertype] next
>> drivers/usb/chipidea/./trace.h:39:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] token @@     got restricted __le32 [usertype] token @@
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     expected unsigned int [usertype] token
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     got restricted __le32 [usertype] token
   drivers/usb/chipidea/trace.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, drivers/usb/chipidea/trace.h):
>> drivers/usb/chipidea/./trace.h:39:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] next @@     got restricted __le32 [usertype] next @@
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     expected unsigned int [usertype] next
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     got restricted __le32 [usertype] next
>> drivers/usb/chipidea/./trace.h:39:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] token @@     got restricted __le32 [usertype] token @@
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     expected unsigned int [usertype] token
>> drivers/usb/chipidea/./trace.h:39:1: sparse:     got restricted __le32 [usertype] token

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/trace.h b/drivers/usb/chipidea/trace.h
index 44ffb2bb625e..1601fd86c4c1 100644
--- a/drivers/usb/chipidea/trace.h
+++ b/drivers/usb/chipidea/trace.h
@@ -56,8 +56,8 @@ DECLARE_EVENT_CLASS(ci_log_trb,
 		__entry->td = td;
 		__entry->dma = td->dma;
 		__entry->td_remaining_size = td->td_remaining_size;
-		__entry->next = td->ptr->next;
-		__entry->token = td->ptr->token;
+		__entry->next = le32_to_cpu(td->ptr->next);
+		__entry->token = le32_to_cpu(td->ptr->token);
 		__entry->type = usb_endpoint_type(hwep->ep.desc);
 	),
 	TP_printk("%s: req: %p, td: %p, td_dma_address: %pad, remaining_size: %d, "
-- 
2.17.1

