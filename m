Return-Path: <SRS0=VIq2=CK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2894C433E6
	for <linux-usb@archiver.kernel.org>; Tue,  1 Sep 2020 07:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 790C32071B
	for <linux-usb@archiver.kernel.org>; Tue,  1 Sep 2020 07:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgIAHhL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 1 Sep 2020 03:37:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:59193 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbgIAHhK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 03:37:10 -0400
IronPort-SDR: zz4V4ZtfK2yqVryFovKV94Z64K/rOF6k2/lRKej4JbPZ4c3QtYUniq95IhYhKJlPIZVrbqYSJj
 1HI0RWJgPGxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="218675533"
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="218675533"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2020 00:37:09 -0700
IronPort-SDR: wKKONugBdNWQrOywIEI+MalJiWZAHfKrNjVojkPnWA94zyuOTTIz+LirgG8bKGmFSZqXi0bifL
 gADNjjKdk/9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,378,1592895600"; 
   d="scan'208";a="404694894"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Sep 2020 00:37:06 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Sep 2020 10:37:06 +0300
Date:   Tue, 1 Sep 2020 10:37:06 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v5.9-rc4
Message-ID: <20200901073706.GS1375436@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.9-rc4

for you to fetch changes up to 813050e0a9b871ac575abfd3d321f74916df609d:

  thunderbolt: Use maximum USB3 link rate when reclaiming if link is not up (2020-08-25 11:29:01 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v5.9-rc4

This includes two fixes, one that fixes a regression around reboot and
other that uses a correct link rate when USB3 bandwidth is reclaimed
when the link is not up.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (1):
      thunderbolt: Use maximum USB3 link rate when reclaiming if link is not up

Nikunj A. Dadhania (1):
      thunderbolt: Disable ports that are not implemented

 drivers/thunderbolt/switch.c |  1 +
 drivers/thunderbolt/tb.h     |  2 +-
 drivers/thunderbolt/tunnel.c | 12 ++++++++++--
 3 files changed, 12 insertions(+), 3 deletions(-)
