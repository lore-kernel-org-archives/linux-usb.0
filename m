Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E033AC10F14
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 14:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B811C214AE
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 14:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfDWOVy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 10:21:54 -0400
Received: from mga01.intel.com ([192.55.52.88]:63190 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfDWOVy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 10:21:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Apr 2019 07:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,386,1549958400"; 
   d="scan'208";a="167139955"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2019 07:21:52 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH v4 0/7] usb: typec: ucsi: Remaining changes for v5.2
Date:   Tue, 23 Apr 2019 17:21:44 +0300
Message-Id: <20190423142151.26135-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Ajay noticed that I was not considering earlier releases of the UCSI
specification with a specific UCSI command, GET_CURRENT_CAM, in v3.
The definition for the command was changed in UCSI specification v1.1.
The issue is now fixed.

v3 cover letter.

This is the third version of this collection of UCSI driver related
changes. I fixed the header problem I caused in Ajay's patch adding the
NVIDIA alt mode support (patch 7/7), and I also took the liberty of
writing the missing ABI documentation for the extra sysfs file that's
created in the driver for Cypress CCGx Type-C controller (ucsi_ccg.c).

v2 cover letter

This is the second version of this series. The sparse warning, that
was the only issue with the first version, is now fixed. The fix was
made by adding the first patch ("i2c: nvidia-gpu: Supply CCGx driver
the fw build info"). It add a device property for the CCGx device
that the CCGx driver can use to identify the required firmware build.

I also decided to include two extra patches from Ajay where NVIDIA
probing driver is added for the DisplayPort alternate mode:
https://www.spinics.net/lists/linux-usb/msg178847.html

v1 cover letter:

Here are the remaining patches from me and Ajay for the UCSI driver. I
took the liberty of collecting them for you, and resending everything
together.

There are two patches from Ajay adding support for firmware upgrading
with the Cypress CCGx controllers [1], and two patches from me
enabling DisplayPort alt mode with the UCSI driver [2].

[1] https://marc.info/?l=linux-usb&m=154957412422108&w=2
[2] https://www.spinics.net/lists/linux-usb/msg178192.html

Let us know if you want anything to be changed.

thanks,

Ajay Gupta (5):
  usb: typec: ucsi: ccg: add get_fw_info function
  i2c: nvidia-gpu: Supply CCGx driver the fw build info
  usb: typec: ucsi: ccg: add firmware flashing support
  usb: typec: displayport: Export probe and remove functions
  usb: typec: Add driver for NVIDIA Alt Modes

Heikki Krogerus (2):
  usb: typec: ucsi: Preliminary support for alternate modes
  usb: typec: ucsi: Support for DisplayPort alt mode

 .../ABI/testing/sysfs-driver-ucsi-ccg         |   6 +
 drivers/i2c/busses/i2c-nvidia-gpu.c           |   7 +
 drivers/usb/typec/altmodes/Kconfig            |  10 +
 drivers/usb/typec/altmodes/Makefile           |   2 +
 drivers/usb/typec/altmodes/displayport.c      |  12 +-
 drivers/usb/typec/altmodes/displayport.h      |   8 +
 drivers/usb/typec/altmodes/nvidia.c           |  44 +
 drivers/usb/typec/ucsi/Makefile               |  15 +-
 drivers/usb/typec/ucsi/displayport.c          | 315 +++++++
 drivers/usb/typec/ucsi/trace.c                |  12 +
 drivers/usb/typec/ucsi/trace.h                |  26 +
 drivers/usb/typec/ucsi/ucsi.c                 | 404 ++++++--
 drivers/usb/typec/ucsi/ucsi.h                 | 118 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 883 +++++++++++++++++-
 include/linux/usb/typec_dp.h                  |   5 +
 15 files changed, 1754 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-ucsi-ccg
 create mode 100644 drivers/usb/typec/altmodes/displayport.h
 create mode 100644 drivers/usb/typec/altmodes/nvidia.c
 create mode 100644 drivers/usb/typec/ucsi/displayport.c

-- 
2.20.1

