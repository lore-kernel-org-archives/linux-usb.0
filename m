Return-Path: <SRS0=CXPl=ZC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316C3C43331
	for <linux-usb@archiver.kernel.org>; Sun, 10 Nov 2019 03:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE1EE208C3
	for <linux-usb@archiver.kernel.org>; Sun, 10 Nov 2019 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573355108;
	bh=ChU4/sQIlhrMtWXNKZFawHzXhtYBs37P5LZKj8KiEgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=joLsaqFX31/yrv5B5dLTyG2wHFHChSVi9+BbO1Y7GmsmQLjBJ78HvJc5dmByDCeCG
	 a9XYW0fH64rxKbnmDjC5lJLlksw1uQqF6rjHY1+XFghCTEhebfl1QgaS5Ybcnzd4eC
	 At3RDARFXMH8aK6E7jdA9sFThNfAyjec/8nCF9jE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbfKJDFG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 9 Nov 2019 22:05:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:50638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729127AbfKJCql (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 Nov 2019 21:46:41 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7B4921D7E;
        Sun, 10 Nov 2019 02:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573354000;
        bh=ChU4/sQIlhrMtWXNKZFawHzXhtYBs37P5LZKj8KiEgw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M4oJpsZ3JQBrZe5F1fbIGfzwUgrjQurKpv1BiwC5IuI1ijTmFDDPNMy5jazFRMt/4
         tQKC2xuZNryK7w/eK4eFSaMM63lBpZbUQzNVPXMw9KQJ1dugC3mhrpKP4Tl+rNxCPw
         HHDmuJ5S7Qbxi+tkY0rNWhfXsWsp/Ng4mlw0th4Q=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicolas Adell <nicolas.adell@actia.fr>,
        Peter Chen <peter.chen@nxp.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 027/109] usb: chipidea: imx: enable OTG overcurrent in case USB subsystem is already started
Date:   Sat,  9 Nov 2019 21:44:19 -0500
Message-Id: <20191110024541.31567-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024541.31567-1-sashal@kernel.org>
References: <20191110024541.31567-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Nicolas Adell <nicolas.adell@actia.fr>

[ Upstream commit 1dedbdf2bbb1ede8d96f35f9845ecae179dc1988 ]

When initializing the USB subsystem before starting the kernel,
OTG overcurrent detection is disabled. In case the OTG polarity of
overcurrent is low active, the overcurrent detection is never enabled
again and events cannot be reported as expected. Because imx usb
overcurrent polarity is low active by default, only detection needs
to be enable in usbmisc init function.

Signed-off-by: Nicolas Adell <nicolas.adell@actia.fr>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9f4a0185dd609..b7477fd4443a3 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -343,6 +343,8 @@ static int usbmisc_imx6q_init(struct imx_usbmisc_data *data)
 	} else if (data->oc_polarity == 1) {
 		/* High active */
 		reg &= ~(MX6_BM_OVER_CUR_DIS | MX6_BM_OVER_CUR_POLARITY);
+	} else {
+		reg &= ~(MX6_BM_OVER_CUR_DIS);
 	}
 	writel(reg, usbmisc->base + data->index * 4);
 
-- 
2.20.1

