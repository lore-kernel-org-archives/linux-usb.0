Return-Path: <SRS0=r4gL=VX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E207C7618F
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jul 2019 05:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCBC82238C
	for <linux-usb@archiver.kernel.org>; Fri, 26 Jul 2019 05:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfGZFBR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Jul 2019 01:01:17 -0400
Received: from gate.crashing.org ([63.228.1.57]:53496 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZFBR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 01:01:17 -0400
Received: from ufdda393ec48b57.ant.amazon.com (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6Q4x6PR017198;
        Thu, 25 Jul 2019 23:59:07 -0500
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Linux USB List <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Micha=C5=82=20Nazarewicz?= <mina86@mina86.com>
Subject: [PATCH 0/2] usb: gadget: Composite and Mass Storage fixes
Date:   Fri, 26 Jul 2019 14:59:02 +1000
Message-Id: <20190726045904.17860-1-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These two fixes have been rotting on the list for a while. The mass
storage one should probably go to stable as well (Felipe ? Alan ?)
as people have been chasing that for years and it can crash your
kernel.


