Return-Path: <SRS0=rzjp=YX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323FCA9EC6
	for <linux-usb@archiver.kernel.org>; Wed, 30 Oct 2019 15:59:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D60AA217D9
	for <linux-usb@archiver.kernel.org>; Wed, 30 Oct 2019 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572451194;
	bh=x8Cfy8ltv+5u7ZV5lSMae+39UiLroe1qUIdwBVjHK90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=S97Q881fOBNVZWpsGsGt0ZgO6dxsbhh9PsSBCsHYdymMs3sdVButw8ODTFV9rJ4k7
	 acqdHyCtI3M+RVt/z4j550DAo0dMd5BKqGxAYGSExyJQkGvI9GUum0/zYH2XjmJCdL
	 QRUzSPMLRRP1+Mle3jhOPtNslq9PvzpFzRrVKOGs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfJ3P4b (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 30 Oct 2019 11:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:58174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728840AbfJ3P4b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 30 Oct 2019 11:56:31 -0400
Received: from sasha-vm.mshome.net (100.50.158.77.rev.sfr.net [77.158.50.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EBD3A218DE;
        Wed, 30 Oct 2019 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572450990;
        bh=x8Cfy8ltv+5u7ZV5lSMae+39UiLroe1qUIdwBVjHK90=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=arSg9iRuhaiUg6XUl/hbEdm3GIm5azCRoHUx+ztnmjEdj2euYOam8y4q9n0oQUHtV
         Wgr2HQFUyQLInINmIvkK53ku/d9UpzQiHNcHBdCTnBuXX3P5pSHVYnMxchKHD+O0Zd
         JtZ0jUuqsNbxvK/UEcg0GlYH0oouTPbd1qHRUTR4=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 14/24] USB: legousbtower: fix a signedness bug in tower_probe()
Date:   Wed, 30 Oct 2019 11:55:45 -0400
Message-Id: <20191030155555.10494-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030155555.10494-1-sashal@kernel.org>
References: <20191030155555.10494-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit fd47a417e75e2506eb3672ae569b1c87e3774155 ]

The problem is that sizeof() is unsigned long so negative error codes
are type promoted to high positive values and the condition becomes
false.

Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/r/20191011141115.GA4521@mwanda
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 378a565ec989f..a1ed6be874715 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
 				  get_version_reply,
 				  sizeof(*get_version_reply),
 				  1000);
-	if (result < sizeof(*get_version_reply)) {
+	if (result != sizeof(*get_version_reply)) {
 		if (result >= 0)
 			result = -EIO;
 		dev_err(idev, "get version request failed: %d\n", result);
-- 
2.20.1

