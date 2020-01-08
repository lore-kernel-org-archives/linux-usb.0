Return-Path: <SRS0=ucs1=25=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BDCC282DD
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jan 2020 13:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B12E205F4
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jan 2020 13:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgAHNNu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 8 Jan 2020 08:13:50 -0500
Received: from mga07.intel.com ([134.134.136.100]:59114 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgAHNNu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 08:13:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 05:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="225901607"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2020 05:13:48 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/2] ucsi driver fixes
Date:   Wed,  8 Jan 2020 16:13:45 +0300
Message-Id: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are two fixes for the ucsi driver. Both fix issues with the Set
Notification Enable command.

Heikki Krogerus (2):
  usb: typec: ucsi: Fix the notification bit offsets
  usb: typec: ucsi: Actually enable all the interface notifications

 drivers/usb/typec/ucsi/ucsi.c |  1 +
 drivers/usb/typec/ucsi/ucsi.h | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.24.1

