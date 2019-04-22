Return-Path: <SRS0=5Qiu=SY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08473C282CE
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 19:57:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8C37204EC
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 19:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555963073;
	bh=rdhfLSfSb+9wabCku/XMEhRo3Kp9c9dLD+jQwWZjK7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TECPc3djvo9k8R2lwTksA3oqS5bik79hbVFisLuBq0Ri4xiw53VYCf5JHEfxeSd1C
	 UGB6BiI+Zmy9po160WL/OPC58XanWCfHes0EGk/bz9uUOwGE7DijhgV0M1sbJOADIG
	 /cp+GIFa/5MhaypM0d2vK6RqOe+8Wx/I/dQmgmLI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbfDVT5r (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Apr 2019 15:57:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730573AbfDVTsf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Apr 2019 15:48:35 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51FC421905;
        Mon, 22 Apr 2019 19:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555962515;
        bh=rdhfLSfSb+9wabCku/XMEhRo3Kp9c9dLD+jQwWZjK7c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GzmHjMilN3lGxkmjnkzpyXmrMJpuWBRLNLZp+PJbnwgUOukn71dl+TL1GAFhGx76y
         7EpqtztdNfvXoagLn1pNlyBe1fk2ydHGpcMevESDtZrBbTHjOFjEooZbzq+n8P8a8Y
         k6IPZ4UVcwTZN2rxe/nHxqemiWW2c2n4sKe32aaY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mukesh Ojha <mojha@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 34/43] usb: u132-hcd: fix resource leak
Date:   Mon, 22 Apr 2019 15:47:18 -0400
Message-Id: <20190422194727.12495-34-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190422194727.12495-1-sashal@kernel.org>
References: <20190422194727.12495-1-sashal@kernel.org>
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
index 65c0086e25ae..8d349230b2c7 100644
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

