Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B6FC2D0A3
	for <linux-usb@archiver.kernel.org>; Tue, 10 Nov 2020 00:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C3A9206D8
	for <linux-usb@archiver.kernel.org>; Tue, 10 Nov 2020 00:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgKJAim (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 9 Nov 2020 19:38:42 -0500
Received: from mga04.intel.com ([192.55.52.120]:25963 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKJAim (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 19:38:42 -0500
IronPort-SDR: u3LE/cDVZHf4C+T+XHHpBHbOQ8PyZ6JizOKDUMyb2looWcfJauUESrnBkTnx468cdNMSAn+CEM
 0uzLul9HoaMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="167308551"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="167308551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 16:38:41 -0800
IronPort-SDR: ESU9vytw1+VG+BGHTlecnEW01Ieh6jWXhy+9L1jKnTCuaTj7PKv8UDYXyGPbOl9pRfyd11Cf0M
 V5Kf+AonnFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; 
   d="scan'208";a="354312323"
Received: from uhpatel-desk4.jf.intel.com (HELO uhpatel-desk4.intel.com) ([10.23.15.15])
  by orsmga008.jf.intel.com with ESMTP; 09 Nov 2020 16:38:41 -0800
From:   Utkarsh Patel <utkarsh.h.patel@intel.com>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, pmalani@chromium.org,
        enric.balletbo@collabora.com, rajmohan.mani@intel.com,
        azhar.shaikh@intel.com, Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH 0/8] Thunderbolt3/USB4 cable rounded and active cable plug link training support
Date:   Mon,  9 Nov 2020 16:37:08 -0800
Message-Id: <20201110003716.5164-1-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds the support for Thunderbolt3/USB4 rounded and
non-rounded frequencies cables and fixes the active cable plug link
training support.

Utkarsh Patel (8):
  usb: typec: Correct the bit values for the Thunderbolt
    rounded/non-rounded cable support
  platform/chrome: cros_ec_typec: Correct the Thunderbolt
    rounded/non-rounded cable support
  usb: typec: intel_pmc_mux: Configure Thunderbolt cable generation bits
  usb: typec: Remove one bit support for the Thunderbolt
    rounded/non-rounded cable
  usb: typec: Use Thunderbolt 3 cable discover mode VDO in Enter_USB
    message
  platform/chrome: cros_ec_typec: Use Thunderbolt 3 cable discover mode
    VDO in USB4 mode
  usb: typec: intel_pmc_mux: Configure active cable properties for USB4
  usb: typec: Remove active_link_training variable from Enter_USB
    message

 drivers/platform/chrome/cros_ec_typec.c | 17 +++++++++++++----
 drivers/usb/typec/mux/intel_pmc_mux.c   | 21 ++++++++++++++++++---
 include/linux/usb/typec.h               |  8 ++------
 include/linux/usb/typec_tbt.h           |  6 +++++-
 4 files changed, 38 insertions(+), 14 deletions(-)

-- 
2.17.1

