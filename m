Return-Path: <SRS0=Cs0a=7S=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D2C433E0
	for <linux-usb@archiver.kernel.org>; Fri,  5 Jun 2020 12:28:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B88E02075B
	for <linux-usb@archiver.kernel.org>; Fri,  5 Jun 2020 12:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591360105;
	bh=190JLV0gOcwxDInkyWUEGInDFzgDvb8MAPlIROCkhmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=fpUdi3aADCW+obHkKuWDOpIXqH23ktcvXYJv5+3mtCU14kfLm5xb39wd2m+7eBNAY
	 kRPmLzciaP3zM4p3eWin45N1OV6cVxG5pJBw8ct0BtYeN4OeuKtyb+DwHyClnVitMf
	 IOjTiOHVpsVCRG9pSeDaysT511r64cgHXv96n1Z4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgFEM0H (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 5 Jun 2020 08:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727040AbgFEM0F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Jun 2020 08:26:05 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EE1F20899;
        Fri,  5 Jun 2020 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591359964;
        bh=190JLV0gOcwxDInkyWUEGInDFzgDvb8MAPlIROCkhmY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fp5K34e8CgXkk4wwwXw1H1kfFO7cWK9VI96g2V5G9XpU2O8FOpUVuMi/6rWTZQ0Lp
         G9aSWl+jsB2lPHTujAtx/bg4CeXTWsungFs7tBUosj0RZaKuCnCnEYmn4i41sOM4LX
         +FTdJBGVEQA9H2XDafz6JKqdLSYQerAgOag0DwlI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Daniele Palmas <dnlplm@gmail.com>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 5/9] net: usb: qmi_wwan: add Telit LE910C1-EUX composition
Date:   Fri,  5 Jun 2020 08:25:53 -0400
Message-Id: <20200605122558.2882712-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605122558.2882712-1-sashal@kernel.org>
References: <20200605122558.2882712-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniele Palmas <dnlplm@gmail.com>

[ Upstream commit 591612aa578cd7148b7b9d74869ef40118978389 ]

Add support for Telit LE910C1-EUX composition

0x1031: tty, tty, tty, rmnet
Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Acked-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index c8222cdf755d..1f70e00838f2 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1260,6 +1260,7 @@ static const struct usb_device_id products[] = {
 	{QMI_FIXED_INTF(0x1bbb, 0x0203, 2)},	/* Alcatel L800MA */
 	{QMI_FIXED_INTF(0x2357, 0x0201, 4)},	/* TP-LINK HSUPA Modem MA180 */
 	{QMI_FIXED_INTF(0x2357, 0x9000, 4)},	/* TP-LINK MA260 */
+	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1031, 3)}, /* Telit LE910C1-EUX */
 	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1040, 2)},	/* Telit LE922A */
 	{QMI_FIXED_INTF(0x1bc7, 0x1100, 3)},	/* Telit ME910 */
 	{QMI_FIXED_INTF(0x1bc7, 0x1101, 3)},	/* Telit ME910 dual modem */
-- 
2.25.1

