Return-Path: <SRS0=KSfo=44=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B44DC10F27
	for <linux-usb@archiver.kernel.org>; Wed, 11 Mar 2020 13:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 091C72146E
	for <linux-usb@archiver.kernel.org>; Wed, 11 Mar 2020 13:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgCKNAK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 11 Mar 2020 09:00:10 -0400
Received: from mga05.intel.com ([192.55.52.43]:34246 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729358AbgCKNAK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Mar 2020 09:00:10 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 06:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="353878513"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2020 06:00:08 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/2] ucsi driver fixes for usb-linus
Date:   Wed, 11 Mar 2020 16:00:04 +0300
Message-Id: <20200311130006.41288-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Heikki Krogerus (2):
  usb: typec: ucsi: displayport: Fix NULL pointer dereference
  usb: typec: ucsi: displayport: Fix a potential race during
    registration

 drivers/usb/typec/ucsi/displayport.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.25.1

