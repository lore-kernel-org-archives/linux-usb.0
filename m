Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DB1C43381
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 11:18:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF7BD221F8
	for <linux-usb@archiver.kernel.org>; Mon, 18 Jan 2021 11:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390125AbhARLSb (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 18 Jan 2021 06:18:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:57294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390065AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3986D22AB0;
        Mon, 18 Jan 2021 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968475;
        bh=3312tomEZXi96piv6nh/oGdopZw+YFazo/XKp9euQvM=;
        h=From:To:Cc:Subject:Date:From;
        b=C+rXDPzrWYFTLUnJB4guJUoa0WyfgYdKAhRgScadzF9NZoNcrqwUo3xbeensyBqLJ
         bnmsquYwC5+MxUEAcd/hfkdBbWZSCEVKNUHAwsiJKZCbQD97uDTxqnGjXbKuU8QBKX
         FuGD0j+pQ5YGSXXcFI7Z6ec+60FDlRgDSKBEMNhu5Pa6NzQ33hxGI1/+7UVy3uj2D3
         QHQODqHjL5SsfUiJ3WEv/4XbRmOKsiRtKcf6jW60/aAnWzeXpPOasKPPNRE4GJdRMe
         uyc1XGtMiwgZexMx7icW5M4P10SiXbNDMYgZJFriwbmz/WBaT98YXW7O+bTW/u7Ucu
         F4CCLFxPnuAtw==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1SUb-0001Ls-Mo; Mon, 18 Jan 2021 12:14:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/6] USB: serial: drop short control-transfer checks
Date:   Mon, 18 Jan 2021 12:14:20 +0100
Message-Id: <20210118111426.5147-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to check for short control transfers when sending data
so remove the redundant sanity checks from the drivers that had them.

Included is also a related fix of a copy-paste error in a debug message.

Johan


Johan Hovold (6):
  USB: serial: mxuport: drop short control-transfer check
  USB: serial: upd78f0730: drop short control-transfer check
  USB: serial: io_ti: drop short control-transfer check
  USB: serial: io_ti: fix a debug-message copy-paste error
  USB: serial: f81232: drop short control-transfer checks
  USB: serial: f81534: drop short control-transfer check

 drivers/usb/serial/f81232.c     | 12 ++----------
 drivers/usb/serial/f81534.c     |  4 +---
 drivers/usb/serial/io_ti.c      |  8 ++------
 drivers/usb/serial/mxuport.c    |  7 -------
 drivers/usb/serial/upd78f0730.c |  5 +----
 5 files changed, 6 insertions(+), 30 deletions(-)

-- 
2.26.2

