Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ECFC433DB
	for <linux-usb@archiver.kernel.org>; Fri,  8 Jan 2021 08:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 988042343F
	for <linux-usb@archiver.kernel.org>; Fri,  8 Jan 2021 08:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbhAHINh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 8 Jan 2021 03:13:37 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:62773 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbhAHINh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jan 2021 03:13:37 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 108884J1092446;
        Fri, 8 Jan 2021 16:08:04 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 8 Jan
 2021 16:12:45 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     <BMC-SW@aspeedtech.com>, Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC:     Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/1] Fix vhub engine stop dma register setting.
Date:   Fri, 8 Jan 2021 16:12:37 +0800
Message-ID: <20210108081238.10199-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 108884J1092446
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch fixes vhub engine stop dma should have different register
setting.

Ryan Chen (1):
  usb: gadget: aspeed: fix stop dma register setting.

 drivers/usb/gadget/udc/aspeed-vhub/epn.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.17.1

