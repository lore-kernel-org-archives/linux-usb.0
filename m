Return-Path: <SRS0=5Qiu=SY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334C7C282CE
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 19:52:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB524204EC
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 19:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555962726;
	bh=Z6AFRKBiIi6vepKUj43GQxqiaTd5c2RvMlH8AgV8j30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=LFt+FkZEuaRRpQ4JfKeFXaCfzeN69Genx2eBVcLyJWgxLKBXrwAfGA2ETUxeZ6IuF
	 ubj8TRs6lZtTWoqTglcSCPu5zGOId9eCIZIqze6oVB9W5YnFUucefT5B9W0d7HjZuH
	 2pE5WZucUrlV/ojnS6uvnpVlXGKzLPp9B9eB/Jjg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbfDVTub (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Apr 2019 15:50:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:54526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731062AbfDVTua (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Apr 2019 15:50:30 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7C4220643;
        Mon, 22 Apr 2019 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555962629;
        bh=Z6AFRKBiIi6vepKUj43GQxqiaTd5c2RvMlH8AgV8j30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EtkF5CIBYFWYajrEbaG1GP1sqxUsb+Fozu/QOI1I4DVuDwk2nl/5E2A1pARwxcA33
         PaNEdfoJKzIiFJUcTt5x2o//gZX2N6KhbsNheI/KISsYx8IEZ1UgkM9WWkGSAM2pVm
         Jxxc9Vito4kaDp830rLF1qeijc5xesAn4gIwMxv0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Guido Kiener <guido@kiener-muenchen.de>,
        Guido Kiener <guido.kiener@rohde-schwarz.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 3.18 03/15] usb: gadget: net2272: Fix net2272_dequeue()
Date:   Mon, 22 Apr 2019 15:50:10 -0400
Message-Id: <20190422195022.13760-3-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190422195022.13760-1-sashal@kernel.org>
References: <20190422195022.13760-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Guido Kiener <guido@kiener-muenchen.de>

[ Upstream commit 091dacc3cc10979ab0422f0a9f7fcc27eee97e69 ]

Restore the status of ep->stopped in function net2272_dequeue().

When the given request is not found in the endpoint queue
the function returns -EINVAL without restoring the state of
ep->stopped. Thus the endpoint keeps blocked and does not transfer
any data anymore.

This fix is only compile-tested, since we do not have a
corresponding hardware. An analogous fix was tested in the sibling
driver. See "usb: gadget: net2280: Fix net2280_dequeue()"

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Sasha Levin (Microsoft) <sashal@kernel.org>
---
 drivers/usb/gadget/udc/net2272.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 4b2444e75840..83d0544338ca 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -962,6 +962,7 @@ net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 			break;
 	}
 	if (&req->req != _req) {
+		ep->stopped = stopped;
 		spin_unlock_irqrestore(&ep->dev->lock, flags);
 		return -EINVAL;
 	}
-- 
2.19.1

