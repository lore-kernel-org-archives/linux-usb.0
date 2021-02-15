Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45159C433E6
	for <linux-usb@archiver.kernel.org>; Mon, 15 Feb 2021 12:37:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11E40601FC
	for <linux-usb@archiver.kernel.org>; Mon, 15 Feb 2021 12:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhBOMg4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:36:56 -0500
Received: from m12-14.163.com ([220.181.12.14]:47252 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230090AbhBOMgz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Feb 2021 07:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=BfrXPQ2i0LKTFeJkWi
        8u/4OhhnLAlxqSd0QYpk+AWAM=; b=LY62XCJ/d2aZiQFPguOmw+sSxKQ7c7Vr4A
        Vpx6hqP5uK+CLEIyGavZ6Rsom+MmfFts8T7QRekBmAjR7axXNRNfwpA3gFY/ry0O
        HLByAqcXY18cPHyN4PpAm9QylFMlOmBY3TsRYvWfm7tVljp0JbzCGQoXWqPCsG/S
        OHn0mt2+U=
Received: from localhost.localdomain (unknown [125.70.196.55])
        by smtp10 (Coremail) with SMTP id DsCowABXlrJMRSpgRqr9kw--.59310S2;
        Mon, 15 Feb 2021 17:57:33 +0800 (CST)
From:   Chen Lin <chen45464546@163.com>
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, gustavoars@kernel.org,
        martin.petersen@oracle.com, bvanassche@acm.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen Lin <chen45464546@163.com>,
        Chen Lin <chen.lin5@zte.com.cn>
Subject: [PATCH] usb: gadget: storage: Remove unused function pointer typedef fsg_routine_t
Date:   Mon, 15 Feb 2021 17:56:07 +0800
Message-Id: <1613382967-2850-1-git-send-email-chen45464546@163.com>
X-Mailer: git-send-email 1.7.9.5
X-CM-TRANSID: DsCowABXlrJMRSpgRqr9kw--.59310S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4xAFy8Cry5Kr1UuF43Awb_yoW3ZrgEkr
        1jvr1xJryqga9Ikr1Yg3y3ZrW8u3WUZr4kW3Wv9r93Ca4q9w4kuw4UZrn5AFyUuryxGFZI
        y3s8XF97Ww1xXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUWv37UUUUU==
X-Originating-IP: [125.70.196.55]
X-CM-SenderInfo: hfkh0kqvuwkkiuw6il2tof0z/1tbiGg06nlaD822+8wAAs1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove the 'fsg_routine_t' typedef as it is not used.

Signed-off-by: Chen Lin <chen.lin5@zte.com.cn>
---
 drivers/usb/gadget/function/f_mass_storage.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 950c943..4a47036 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -351,8 +351,6 @@ static inline struct fsg_dev *fsg_from_func(struct usb_function *f)
 	return container_of(f, struct fsg_dev, function);
 }
 
-typedef void (*fsg_routine_t)(struct fsg_dev *);
-
 static int exception_in_progress(struct fsg_common *common)
 {
 	return common->state > FSG_STATE_NORMAL;
-- 
1.7.9.5


