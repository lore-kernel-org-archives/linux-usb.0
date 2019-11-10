Return-Path: <SRS0=CXPl=ZC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D36C17440
	for <linux-usb@archiver.kernel.org>; Sun, 10 Nov 2019 02:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11816214E0
	for <linux-usb@archiver.kernel.org>; Sun, 10 Nov 2019 02:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573353926;
	bh=Kp/Eu11Lwj/6ezzthePY2DchczQanvDiubDrKEivNAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=uvOrqCg9HSQO7Yw7xqEHFhQr5s/8uu5VlQM2ZXVbdxlFQbExJjYJTyRyS0NjHe5rV
	 94BIUx0luRBxQ3Xv+AN6WlBRG/9nlhbOtTMMWU+0bVCSigDiGlV91cTcr0lsaEEmHR
	 Q3CvsFkHyCJhCJ7v3QSD4OZlk9Ka+GiKl+0W9rgQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbfKJCpY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 9 Nov 2019 21:45:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:46772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbfKJCpY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 Nov 2019 21:45:24 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C2EE21655;
        Sun, 10 Nov 2019 02:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573353924;
        bh=Kp/Eu11Lwj/6ezzthePY2DchczQanvDiubDrKEivNAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Vj4LKPpKsfmhgTNORmA8diwLqWEi3pg7hajGwKz/NPyAjDn9un10C8rWmaXKBhQ3q
         OfjCAqFwr60nn6DHAwazvaSgGGvGV1mFvFlKyUYmrmVfjGiFki3QxcNyqSiFvQYz6j
         ErdD9MkoGVqP/hLUJ1kGbw0qyDoZrYw/CPW5uNds=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guido Kiener <guido.kiener@rohde-schwarz.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 185/191] usb: usbtmc: uninitialized symbol 'actual' in usbtmc_ioctl_clear
Date:   Sat,  9 Nov 2019 21:40:07 -0500
Message-Id: <20191110024013.29782-185-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Guido Kiener <guido.kiener@rohde-schwarz.com>

[ Upstream commit 9a83190300867fb024d53f47c31088e34188efc1 ]

Fix uninitialized symbol 'actual' in function usbtmc_ioctl_clear.

When symbol 'actual' is not initialized and usb_bulk_msg() fails,
the subsequent kernel debug message shows a random value.

Signed-off-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
Fixes: dfee02ac4bce ("usb: usbtmc: Fix ioctl USBTMC_IOCTL_CLEAR")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/class/usbtmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 3ce45c9e9d20d..e6a7c86b70f25 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -1016,6 +1016,7 @@ static int usbtmc_ioctl_clear(struct usbtmc_device_data *data)
 		do {
 			dev_dbg(dev, "Reading from bulk in EP\n");
 
+			actual = 0;
 			rv = usb_bulk_msg(data->usb_dev,
 					  usb_rcvbulkpipe(data->usb_dev,
 							  data->bulk_in),
-- 
2.20.1

