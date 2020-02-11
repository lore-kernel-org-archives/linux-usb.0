Return-Path: <SRS0=9l+J=37=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B89DC352A3
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 11:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8AAB206D7
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 11:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgBKLZf (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Feb 2020 06:25:35 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbgBKLZf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261815"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:32 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/6] typec changes
Date:   Tue, 11 Feb 2020 14:25:25 +0300
Message-Id: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here all the "trivial" changes I have for the USB Type-C class at this
stage. The first patch I already send before [1]. You told me to leave
the checks in, so I did. The rest of the patches in that series were
about USB4, which I'm not including here. I decided to propose them
separately.

The third patch in this series make's it possible to swap the power
role even when USB Power Delivery is not supported since the latest
specification now allows it. The rest of the patches are cleanups.

Let me know if you want me to change anything.

thanks,

[1] https://lore.kernel.org/linux-usb/20191230142611.24921-1-heikki.krogerus@linux.intel.com/

Heikki Krogerus (6):
  usb: typec: Make the attributes read-only when writing is not possible
  usb: typec: Hide the port_type attribute when it's not supported
  usb: typec: Allow power role swapping even without USB PD
  usb: typec: Fix the description of struct typec_capability
  usb: typec: altmode: Remove the notification chain
  usb: typec: mux: Drop support for device name matching

 Documentation/ABI/testing/sysfs-class-typec |  14 +-
 Documentation/driver-api/usb/typec_bus.rst  |  22 +---
 drivers/usb/typec/bus.c                     |  12 +-
 drivers/usb/typec/bus.h                     |   2 -
 drivers/usb/typec/class.c                   | 137 +++++++++-----------
 drivers/usb/typec/mux.c                     |  25 +---
 include/linux/usb/typec.h                   |   2 -
 include/linux/usb/typec_altmode.h           |   7 -
 8 files changed, 77 insertions(+), 144 deletions(-)

-- 
2.25.0

