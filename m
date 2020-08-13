Return-Path: <SRS0=ET2A=BX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE69C433DF
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 482CF20716
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597299949;
	bh=RxZSywwUjM7t+PF7lnR/LsgIuwxf6BBZyopTs7zv51I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TcyOvqzCLvoZuvgnCWj9LAAEl6Goji3j1F8XEeeOuv3RTdJGH+7moueNAm0xnwTVt
	 bLGcclCEngWlyWx3GMjwvYZeW84KGevRjCCiJhzYQ6nevoJj2Ok3yJPWpIfTKA0RPW
	 TBKPqMv7isxy3+NtpbciQJsitWEJpGA6B/4Oj8qg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgHMGZr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Aug 2020 02:25:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgHMGZp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:45 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC77A2078B;
        Thu, 13 Aug 2020 06:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299945;
        bh=RxZSywwUjM7t+PF7lnR/LsgIuwxf6BBZyopTs7zv51I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0lV893FstK9YmHYQClN0dzK+/ZD+N74OpyxGMHJmfqRLM94El5vwHtRVN7zYv7evh
         7snszShLEL3LCTRxN54w1aPJefgGl90RL6RuBhiEnRtQ4wopDCXzcOggzWdGrmdpif
         Cr7EGjL92Z385Ve+reCzuzgu8gzioHfXAiPigfx4=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 06/11] dwc3: debug: fix checkpatch warning
Date:   Thu, 13 Aug 2020 09:25:27 +0300
Message-Id: <20200813062532.829720-6-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
index 8e03bcb77da8..8ab394942360 100644
--- a/drivers/usb/dwc3/debug.h
+++ b/drivers/usb/dwc3/debug.h
@@ -413,8 +413,8 @@ static inline const char *dwc3_gadget_generic_cmd_status_string(int status)
 
 
 #ifdef CONFIG_DEBUG_FS
-extern void dwc3_debugfs_init(struct dwc3 *);
-extern void dwc3_debugfs_exit(struct dwc3 *);
+extern void dwc3_debugfs_init(struct dwc3 *d);
+extern void dwc3_debugfs_exit(struct dwc3 *d);
 #else
 static inline void dwc3_debugfs_init(struct dwc3 *d)
 {  }
-- 
2.28.0

