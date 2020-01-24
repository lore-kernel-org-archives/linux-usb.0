Return-Path: <SRS0=idDB=3N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CCFC35242
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 14:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AFD0218AC
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579876371;
	bh=sylBhcPV/WArk9Quqk3f4ifmgbNrAvlqu6VbOY6GwjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=p7Zf/ZOeEO891ZkGsGsLNJ8bQtW7RoxBj6Ag78K8MgR3/xYPPqB8DNYKfT/vbOpnH
	 cTAw77k0JlLPbrATqIk1WbBx2waCY1yds/fGtCkrHJCln3770S1SE5ffKviI/VYpwa
	 BNrRdmuhVPJGNNE0U8t6yedCCo01oK7NbR2XBn7U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404327AbgAXOUA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Jan 2020 09:20:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:40036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391847AbgAXOTg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jan 2020 09:19:36 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9AB0D20838;
        Fri, 24 Jan 2020 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579875575;
        bh=sylBhcPV/WArk9Quqk3f4ifmgbNrAvlqu6VbOY6GwjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AwdaAQtaUf4irRAPcD53AIqbXRB46jkO7DoDqtIlOOJIcaWHnB77Y+6lhK27alkv5
         DSK88uLaHpD8VW94BWPdEZxaU/TcObglZeSjck5ofQ85bMzlUgpW9ihvYIUFymBYQv
         PNSRL616FsTrs2P9s4kgYI+4OsikRKH44kpKntpM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, hayeswang <hayeswang@realtek.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 067/107] r8152: add missing endpoint sanity check
Date:   Fri, 24 Jan 2020 09:17:37 -0500
Message-Id: <20200124141817.28793-67-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124141817.28793-1-sashal@kernel.org>
References: <20200124141817.28793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Johan Hovold <johan@kernel.org>

[ Upstream commit 86f3f4cd53707ceeec079b83205c8d3c756eca93 ]

Add missing endpoint sanity check to probe in order to prevent a
NULL-pointer dereference (or slab out-of-bounds access) when retrieving
the interrupt-endpoint bInterval on ndo_open() in case a device lacks
the expected endpoints.

Fixes: 40a82917b1d3 ("net/usb/r8152: enable interrupt transfer")
Cc: hayeswang <hayeswang@realtek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/r8152.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index b2507c59ba8b3..9e4b7a4002843 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -5587,6 +5587,9 @@ static int rtl8152_probe(struct usb_interface *intf,
 		return -ENODEV;
 	}
 
+	if (intf->cur_altsetting->desc.bNumEndpoints < 3)
+		return -ENODEV;
+
 	usb_reset_device(udev);
 	netdev = alloc_etherdev(sizeof(struct r8152));
 	if (!netdev) {
-- 
2.20.1

