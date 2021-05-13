Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B24C433ED
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 04:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6061A61420
	for <linux-usb@archiver.kernel.org>; Thu, 13 May 2021 04:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhEMEQL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 May 2021 00:16:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49185 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhEMEQJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 00:16:09 -0400
Received: from 111-240-128-202.dynamic-ip.hinet.net ([111.240.128.202] helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lh2kS-000084-1d; Thu, 13 May 2021 04:14:56 +0000
From:   chris.chiu@canonical.com
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        m.v.b@runbox.com, hadess@hadess.net
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH v3 0/2] USB: propose a generic fix for PORT_SUSPEND set feature timeout
Date:   Thu, 13 May 2021 12:14:44 +0800
Message-Id: <20210513041446.3082-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chris Chiu <chris.chiu@canonical.com>

For the Realtek Hub which fails to resume the port which has wakeup
enable descendants, trying to propose a more generic and better fix
to have the runtime suspend/resume work instead of a reset-resume quirk.

Chris Chiu (2):
  USB: Verify the port status when timeout happens during port suspend
  Revert "USB: Add reset-resume quirk for WD19's Realtek Hub"

 drivers/usb/core/hub.c    | 16 ++++++++++++++++
 drivers/usb/core/quirks.c |  1 -
 2 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.20.1

