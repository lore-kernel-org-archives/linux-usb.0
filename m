Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0D4C433EF
	for <linux-usb@archiver.kernel.org>; Wed,  1 Jun 2022 04:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbiFAEQA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Jun 2022 00:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbiFAEP7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 00:15:59 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FAC59CF64
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 21:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654056958; x=1685592958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nNCOA0Xb/Vydyork6QOAfUO2Y2Gkm1AhMAj+H0m/n/I=;
  b=E/5Y8I0FCLwSw3cSOvZUmVtSToTOcC9S751XPSb8ltpmlu26i/MYck+e
   Rx6euVysKnM3sRlFCOf3XTXsHOIwws7v9jhpuAQEO5liIrCSOhkmMD2z8
   8XnT+uMzEeXA5Biqu6QMUGdWa1aGCCdH0L5FsTzY3AvW5Hq0Ou65BOhKR
   g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2022 21:15:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 21:15:57 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 21:15:57 -0700
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 21:15:56 -0700
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Michael Wu <michael@allwinnertech.com>,
        "John Keeping" <john@metanate.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH v3 2/2] usb: gadget: f_fs: change ep->ep safe in ffs_epfile_io()
Date:   Wed, 1 Jun 2022 12:15:16 +0800
Message-ID: <1654056916-2062-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654056916-2062-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1654056916-2062-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In ffs_epfile_io(), when read/write data in blocking mode, it will wait
the completion in interruptible mode, if task receive a signal, it will
terminate the wait, at same time, if function unbind occurs,
ffs_func_unbind() will kfree all eps, ffs_epfile_io() still try to
dequeue request by dereferencing ep which may become invalid.

Fix it by add ep spinlock and will not dereference ep if it is not valid.

Reported-by: Michael Wu <michael@allwinnertech.com>
Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
v2: add Reviewed-by from John keeping
v3: add Reported-by from Michael Wu

 drivers/usb/gadget/function/f_fs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index d4d8940..9bf9287 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1077,6 +1077,11 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 		spin_unlock_irq(&epfile->ffs->eps_lock);
 
 		if (wait_for_completion_interruptible(&io_data->done)) {
+			spin_lock_irq(&epfile->ffs->eps_lock);
+			if (epfile->ep != ep) {
+				ret = -ESHUTDOWN;
+				goto error_lock;
+			}
 			/*
 			 * To avoid race condition with ffs_epfile_io_complete,
 			 * dequeue the request first then check
@@ -1084,6 +1089,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			 * condition with req->complete callback.
 			 */
 			usb_ep_dequeue(ep->ep, req);
+			spin_unlock_irq(&epfile->ffs->eps_lock);
 			wait_for_completion(&io_data->done);
 			interrupted = io_data->status < 0;
 		}
-- 
2.7.4

