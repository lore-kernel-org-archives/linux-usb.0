Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2471FC10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:57:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0358820869
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 15:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfDLP5k (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 11:57:40 -0400
Received: from mga12.intel.com ([192.55.52.136]:29396 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbfDLP5j (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Apr 2019 11:57:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Apr 2019 08:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,341,1549958400"; 
   d="scan'208";a="163892717"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2019 08:57:37 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 0/2] usb: typec: ucsi: ccgx: FW build device property
Date:   Fri, 12 Apr 2019 18:57:34 +0300
Message-Id: <20190412155736.17274-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

This the example I promised. I prepared these on top of your
patches. The second patch ("usb: typec: ucsi: ccgx: Read the
fw build property") I want to squash into your patch adding
the firmware handing to the CCGx driver.

If you want to add modifications to these, resend the
series. Otherwise if you are OK with these, I'll squash the
first one into your patch, and resend everything to Greg.

I'll also picked the VirtualLink patches.

cheers,

Heikki Krogerus (2):
  i2c: nvidia-gpu: Supply CCGx driver the firmware build information
  usb: typec: ucsi: ccgx: Read the fw build property

 drivers/i2c/busses/i2c-nvidia-gpu.c |  6 ++++++
 drivers/usb/typec/ucsi/ucsi_ccg.c   | 23 ++++++++++++++++-------
 2 files changed, 22 insertions(+), 7 deletions(-)

-- 
2.20.1

