Return-Path: <SRS0=G3IJ=VJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DFBC742A2
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 02:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0344120863
	for <linux-usb@archiver.kernel.org>; Fri, 12 Jul 2019 02:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbfGLCyA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 11 Jul 2019 22:54:00 -0400
Received: from gate.crashing.org ([63.228.1.57]:54425 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfGLCyA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:54:00 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2rnGb010240;
        Thu, 11 Jul 2019 21:53:50 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 00/10] usb: gadget: aspeed: Bug fixes
Date:   Fri, 12 Jul 2019 12:53:36 +1000
Message-Id: <20190712025348.21019-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So I finally got back an Aspeed eval board, and thus resumed maintaining
and handling bug reports for this driver.

This is a series that fixes a number of enumeration related issues with
a variety of hosts, OSes, and circumstances (ie, plugging/unplugging at
funny times, etc...).

I also added dummy support for the TT requests, it doesn't hurt as some
host seem to send them even when TT support isn't advertized.

Most of this is bug fixes and probably shouldn't wait for another
merge window, except possibly the last 2 patches.

v2: - Fix a space vs. tab issue in patch 2 reported by Sergei Shtylyov
    - Put the TT patches at the end of the list as they aren't
     as clear cut "bug fixes".


