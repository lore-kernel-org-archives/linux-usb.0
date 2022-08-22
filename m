Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDACC28D13
	for <linux-usb@archiver.kernel.org>; Mon, 22 Aug 2022 09:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbiHVJTk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Aug 2022 05:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbiHVJTP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 05:19:15 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C74D2D1E0
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661159955; x=1692695955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QUpvs1QROQvTbtG9K5Pms7hp7IjclqvQWF75NoRbhG4=;
  b=QxGq/yZ9ykL3sEPZU77W+Xa/ZyAyqegNi9CFr/i/7osa7M58o5PpvBUm
   QUGnZFeHF8L455g6d7ZKErJ/ircIayglFcDDjca2YjxVpuX05Zx3bq39F
   leHsF38MnLwk8u05DPexou2/KranffN0m5o6aLiLoEMFA7VzU1kdItATx
   4sWTgBDEBLj+wyV3pidGiiOLlVSffAuYKzQP/b2pnWqrr6Rdm77/1tYzc
   ZeotWiH0ScKtj83cVs8d7O52RXPOqeMsR5mqIhBY3ybv5HLK6oYny4AzS
   Y6bAxFFblpQRT4DgOt+DGZrhp0XE1NiRIL0rSdXuoGSwZGq7RThLr6izC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="273121600"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="273121600"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 02:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; 
   d="scan'208";a="677142189"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2022 02:19:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 262EB174; Mon, 22 Aug 2022 12:19:26 +0300 (EEST)
Date:   Mon, 22 Aug 2022 12:19:26 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [GIT PULL] Thunderbolt/USB4 fixes for v6.0-rc3
Message-ID: <YwNKHkS3G+vk/J4r@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v6.0-rc3

for you to fetch changes up to 93a3c0d4e8bfbb15145e5dd7da68a3de4b904aba:

  thunderbolt: Check router generation before connecting xHCI (2022-08-18 11:55:52 +0300)

----------------------------------------------------------------
thunderbolt: Fixes for v6.0-rc3

This includes two fixes: one that corrects the buffer usage in
tb_async_error() and another one that limits the xHCI connect operations
to Thunderbolt 3 routers.

Both have been in linux-next with no reported issues.

----------------------------------------------------------------
Mika Westerberg (2):
      thunderbolt: Use the actual buffer in tb_async_error()
      thunderbolt: Check router generation before connecting xHCI

 drivers/thunderbolt/ctl.c    | 2 +-
 drivers/thunderbolt/switch.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)
