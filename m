Return-Path: <SRS0=5Qiu=SY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F71C10F11
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 19:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55C11204EC
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555962908;
	bh=5yrX+NZnk/srg8xIsuMK1Wz8yeCcevL7p2sb+rBER+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Qul0QQBg1Zmsb4R8E0WwP1BYQ3EwXRsSXnHGOjsqubtQGW/tcudm0I5/Hv2V04iXU
	 BXRVr5rAJl/8DfLMw5wRZL4Si3ActKr9bwCLpo2O4S0rqPbHHZiHQUNaXsZjwULM03
	 aHmlPIiLHEuZZjVIzonRL9MDFoWmDly1ddtrCSrY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730882AbfDVTtf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Apr 2019 15:49:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:53330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730867AbfDVTtc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Apr 2019 15:49:32 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C90E2175B;
        Mon, 22 Apr 2019 19:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555962572;
        bh=5yrX+NZnk/srg8xIsuMK1Wz8yeCcevL7p2sb+rBER+s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uPs4c35i4ZfOrUSJbPuqe5xgAZTATVS5d5E1iMKLM7k1i77JyY9u0dMLE2eXkIccL
         IuTpdUK5k1cIsLhgl6s+kT7kgFngJkHxYL2LqunI3PKFuH5vktxv49DQlzORUgB1QB
         lJCwRzFACS6A/8Tj10MIHQpabFPERb8oaEXwa1nM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mukesh Ojha <mojha@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 22/29] usb: u132-hcd: fix resource leak
Date:   Mon, 22 Apr 2019 15:48:41 -0400
Message-Id: <20190422194848.13049-22-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190422194848.13049-1-sashal@kernel.org>
References: <20190422194848.13049-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mukesh Ojha <mojha@codeaurora.org>

[ Upstream commit f276e002793cdb820862e8ea8f76769d56bba575 ]

if platform_driver_register fails, cleanup the allocated resource
gracefully.

Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin (Microsoft) <sashal@kernel.org>
---
 drivers/usb/host/u132-hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 43618976d68a..3efb7b0e8269 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -3208,6 +3208,9 @@ static int __init u132_hcd_init(void)
 	printk(KERN_INFO "driver %s\n", hcd_name);
 	workqueue = create_singlethread_workqueue("u132");
 	retval = platform_driver_register(&u132_platform_driver);
+	if (retval)
+		destroy_workqueue(workqueue);
+
 	return retval;
 }
 
-- 
2.19.1

