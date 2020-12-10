Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1980AC433FE
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 16:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D214E23D56
	for <linux-usb@archiver.kernel.org>; Thu, 10 Dec 2020 16:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390017AbgLJQFn (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Dec 2020 11:05:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:34592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389857AbgLJQFd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 11:05:33 -0500
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     heikki.krogerus@linux.intel.com, linux@roeck-us.net
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Will McVicker <willmcvicker@google.com>
Subject: [PATCH 0/5] USB: typec: various patches
Date:   Thu, 10 Dec 2020 17:05:16 +0100
Message-Id: <20201210160521.3417426-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In digging through a large set of proposed typec patches for the Android
common kernel, I've picked out 5 "easy" patches that should all go
upstream (they all should go upstream, just will take a while to clean
them up it seems...)

Badhri Jagan Sridharan (2):
  USB: typec: tcpm: Prevent log overflow by removing old entries
  USB: typec: tcpci: Add Bleed discharge to POWER_CONTROL definition

Kyle Tso (2):
  USB: typec: tcpm: Fix PR_SWAP error handling
  USB: typec: tcpm: Add a 30ms room for tPSSourceOn in PR_SWAP

pumahsu (1):
  USB: typec: tcpm: Hard Reset after not receiving a Request

 drivers/usb/typec/tcpm/tcpci.h |  1 +
 drivers/usb/typec/tcpm/tcpm.c  | 30 +++++++++++++++---------------
 include/linux/usb/pd.h         |  1 +
 3 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.29.2

