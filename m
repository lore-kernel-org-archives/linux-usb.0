Return-Path: <SRS0=YZLH=DT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E11C43457
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7047421D7F
	for <linux-usb@archiver.kernel.org>; Mon, 12 Oct 2020 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602529609;
	bh=l/GTNDyNPgVOAEVq8nHsDo7HB+ZI41peWrC4brwwVlU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=JiWugv986qyictimJ8qGO+dzNUufLQvqIKQuNJqjZWkH4AQQlj/PTzW5Ljm0nbJKd
	 ByFosyrt0HVbJ5WabHcKAmjmZwfKZOJbR2bYNyux4kjb7H14muUvokqYS/qCigYo6Y
	 NVDp0zymeZZ0BRfLsKgVwz+V8ljPEbgNbH2pXu7g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbgJLTGl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 12 Oct 2020 15:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:53900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391217AbgJLTEH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 15:04:07 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E421322228;
        Mon, 12 Oct 2020 19:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602529431;
        bh=l/GTNDyNPgVOAEVq8nHsDo7HB+ZI41peWrC4brwwVlU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EsYAAYAcIMHWWvJvNu9r8Erm6sq/WnbUsNkcjxuA/BvrCtO9eCbVp0f+FHKUZysJs
         pM7zWY8Mc4S+HEC/U+kZLu+uQYaTpC3qfsvsRdbTh7zNZkx1nC4hdFyo/GIzp+WM25
         r7dxytQCsG1F/PbY17F/3LySMwcEZ+wg9/UBLNGY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wilken Gottwalt <wilken.gottwalt@mailbox.org>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/12] net: usb: qmi_wwan: add Cellient MPL200 card
Date:   Mon, 12 Oct 2020 15:03:35 -0400
Message-Id: <20201012190335.3279538-12-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012190335.3279538-1-sashal@kernel.org>
References: <20201012190335.3279538-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wilken Gottwalt <wilken.gottwalt@mailbox.org>

[ Upstream commit 28802e7c0c9954218d1830f7507edc9d49b03a00 ]

Add usb ids of the Cellient MPL200 card.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@mailbox.org>
Acked-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index af58bf54aa9b6..d2612b69257ea 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1312,6 +1312,7 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0104, 4)},	/* Fibocom NL678 series */
 	{QMI_FIXED_INTF(0x0489, 0xe0b4, 0)},	/* Foxconn T77W968 LTE */
 	{QMI_FIXED_INTF(0x0489, 0xe0b5, 0)},	/* Foxconn T77W968 LTE with eSIM support*/
+	{QMI_FIXED_INTF(0x2692, 0x9025, 4)},    /* Cellient MPL200 (rebranded Qualcomm 05c6:9025) */
 
 	/* 4. Gobi 1000 devices */
 	{QMI_GOBI1K_DEVICE(0x05c6, 0x9212)},	/* Acer Gobi Modem Device */
-- 
2.25.1

