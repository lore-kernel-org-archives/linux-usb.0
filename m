Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4D3C10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E077B2084B
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 08:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbfDJIPs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 04:15:48 -0400
Received: from mga11.intel.com ([192.55.52.93]:63332 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729179AbfDJIPs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Apr 2019 04:15:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Apr 2019 01:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,332,1549958400"; 
   d="scan'208";a="162980346"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2019 01:15:46 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/4] usb: typec: ucsi: Remaining changes for v5.2
Date:   Wed, 10 Apr 2019 11:15:41 +0300
Message-Id: <20190410081545.78464-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are the remaining patches from me and Ajay for the UCSI driver. I
took the liberty of collecting them for you, and resending everything
together.

There are two patches from Ajay adding support for firmware upgrading
with the Cypress CCGx controllers [1], and two patches from me
enabling DisplayPort alt mode with the UCSI driver [2].

[1] https://marc.info/?l=linux-usb&m=154957412422108&w=2
[2] https://www.spinics.net/lists/linux-usb/msg178192.html

Let us know if there if you want anything to be changed.

thanks,

--
heikki

Ajay Gupta (2):
  usb: typec: ucsi: ccg: add get_fw_info function
  usb: typec: ucsi: ccg: add firmware flashing support

Heikki Krogerus (2):
  usb: typec: ucsi: Preliminary support for alternate modes
  usb: typec: ucsi: Support for DisplayPort alt mode

 drivers/usb/typec/ucsi/Makefile      |  15 +-
 drivers/usb/typec/ucsi/displayport.c | 297 +++++++++
 drivers/usb/typec/ucsi/trace.c       |  12 +
 drivers/usb/typec/ucsi/trace.h       |  26 +
 drivers/usb/typec/ucsi/ucsi.c        | 371 +++++++++--
 drivers/usb/typec/ucsi/ucsi.h        |  93 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c    | 884 ++++++++++++++++++++++++++-
 7 files changed, 1617 insertions(+), 81 deletions(-)
 create mode 100644 drivers/usb/typec/ucsi/displayport.c

-- 
2.20.1

