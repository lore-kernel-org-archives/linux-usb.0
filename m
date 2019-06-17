Return-Path: <SRS0=mHtA=UQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA99C31E49
	for <linux-usb@archiver.kernel.org>; Mon, 17 Jun 2019 01:47:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EB2420861
	for <linux-usb@archiver.kernel.org>; Mon, 17 Jun 2019 01:47:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfFQBrU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 16 Jun 2019 21:47:20 -0400
Received: from inva020.nxp.com ([92.121.34.13]:39534 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbfFQBrU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 Jun 2019 21:47:20 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C9841A00D8;
        Mon, 17 Jun 2019 03:47:17 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9DB2D1A0BC4;
        Mon, 17 Jun 2019 03:47:15 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F045E402C7;
        Mon, 17 Jun 2019 09:47:12 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for v5.2
Date:   Mon, 17 Jun 2019 09:49:06 +0800
Message-Id: <20190617014907.9184-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

We have found an IP bug recently, it will cause the audio device
stop working at the HUB downstream face port, and the commit can
reduce the possibilities for failures, needs to improve RTL code
to fix it totally.

Peter Chen (1):
  usb: chipidea: udc: workaround for endpoint conflict issue

 drivers/usb/chipidea/udc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.14.1

