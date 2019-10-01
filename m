Return-Path: <SRS0=EQXy=X2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB36ECE587
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 16:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A824C21783
	for <linux-usb@archiver.kernel.org>; Tue,  1 Oct 2019 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569948604;
	bh=NPxWEqizqtLzG93Y2C2C6VM1BXQQqeCGs5qHflWBBw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TowYH0boFSHAWUHqYrnTn2+OWsULiGBp/wSXqhulAmqIJvfZUVCWpNZ8E4id5i3xJ
	 9y+YwgzhA0N+/Y1dFcTebypy2IdlZoEdGrJndVXxkb5bN/RTxuf92qbtRuDKxwEvzV
	 S5lTuqbrMJahMFYY6nxBPEKGHn1clML/AyH+/vu8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390053AbfJAQoo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Oct 2019 12:44:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390039AbfJAQon (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 12:44:43 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D06D92168B;
        Tue,  1 Oct 2019 16:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569948282;
        bh=NPxWEqizqtLzG93Y2C2C6VM1BXQQqeCGs5qHflWBBw0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c00nD6DtMoaRg/qt1fUuVOHKuZuczGfdDT6XieeYsOLtl7LUUZFocb3qVa6/HbDtm
         TqkBz5ilP9Rw12BTpmu9Ln758zRliCksjtVi92f/f0evyBp/E8aKqnrRoWxwKzNGar
         ZBy/Kt/Bt51uK+stGONFWzFluOzwEmM7v2+thHBY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 15/29] usbnet: ignore endpoints with invalid wMaxPacketSize
Date:   Tue,  1 Oct 2019 12:44:09 -0400
Message-Id: <20191001164423.16406-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164423.16406-1-sashal@kernel.org>
References: <20191001164423.16406-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bjørn Mork <bjorn@mork.no>

[ Upstream commit 8d3d7c2029c1b360f1a6b0a2fca470b57eb575c0 ]

Endpoints with zero wMaxPacketSize are not usable for transferring
data. Ignore such endpoints when looking for valid in, out and
status pipes, to make the drivers more robust against invalid and
meaningless descriptors.

The wMaxPacketSize of these endpoints are used for memory allocations
and as divisors in many usbnet minidrivers. Avoiding zero is therefore
critical.

Signed-off-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/usbnet.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 831a9cec700ca..42e3244d3a705 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -112,6 +112,11 @@ int usbnet_get_endpoints(struct usbnet *dev, struct usb_interface *intf)
 			int				intr = 0;
 
 			e = alt->endpoint + ep;
+
+			/* ignore endpoints which cannot transfer data */
+			if (!usb_endpoint_maxp(&e->desc))
+				continue;
+
 			switch (e->desc.bmAttributes) {
 			case USB_ENDPOINT_XFER_INT:
 				if (!usb_endpoint_dir_in(&e->desc))
-- 
2.20.1

