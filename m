Return-Path: <SRS0=ET2A=BX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4987DC433E1
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D0F2078B
	for <linux-usb@archiver.kernel.org>; Thu, 13 Aug 2020 06:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597299948;
	bh=4yEjk+cVQYA9n4X8Fems/byxVRMAGU/R28g8/ZrYIyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=sxEDauBqmFgQHzfU2GdQLunN65Ny+zO1WgMyaINknTSG7roX/bHfrZB55rxgAlQth
	 qyl4Ia7ZKNQk7wioaXoklB4UCvQv/cG5qjlh5P0zKibKSmYgZKTqpJXnkPjXzMGkpj
	 Rh+2CoDb74XqLWaZPvucUk+tji8awf7AXXSJnRbo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgHMGZr (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Aug 2020 02:25:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgHMGZn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:43 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DDE32080C;
        Thu, 13 Aug 2020 06:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299942;
        bh=4yEjk+cVQYA9n4X8Fems/byxVRMAGU/R28g8/ZrYIyY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nb4SdKMpP0vzFR8tGh7Kot08vQqJaTy3/iWPGuCMYEI2XksrCt9OCxx+lfuHckRlt
         z6kCrie2y5j4E8tkSDzxVY2TK/fbOn205l45lkRAun8H+8pYP0pQTI/ZaoI2aD6GRG
         QtjJXTL2cxhjV0cZeVvaAqSEEgISV2W41Cz3zB30=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 04/11] dwc3: ulpi: fix checkpatch warning
Date:   Thu, 13 Aug 2020 09:25:25 +0300
Message-Id: <20200813062532.829720-4-balbi@kernel.org>
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

no functional changes.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/ulpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/ulpi.c b/drivers/usb/dwc3/ulpi.c
index e6e6176386a4..aa213c9815f6 100644
--- a/drivers/usb/dwc3/ulpi.c
+++ b/drivers/usb/dwc3/ulpi.c
@@ -19,7 +19,7 @@
 
 static int dwc3_ulpi_busyloop(struct dwc3 *dwc)
 {
-	unsigned count = 1000;
+	unsigned int count = 1000;
 	u32 reg;
 
 	while (count--) {
-- 
2.28.0

