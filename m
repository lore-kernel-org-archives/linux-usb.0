Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C345ECE58C
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 21:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FA3821929
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 21:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731589AbfJIVV5 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 17:21:57 -0400
Received: from muru.com ([72.249.23.125]:36544 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731155AbfJIVV5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 17:21:57 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 103968140;
        Wed,  9 Oct 2019 21:22:29 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marcel Partap <mpartap@gmx.net>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Michael Scott <hashcode0f@gmail.com>,
        NeKit <nekit1000@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv2 0/7] musb host improvments mostly for omap2430 glue
Date:   Wed,  9 Oct 2019 14:21:37 -0700
Message-Id: <20191009212145.28495-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Here's v2 set of musb clean-up mostly for the 2430 glue layer.

Regards,

Tony


Changes since v1:

- Get rid of set_vbus stuff


Tony Lindgren (7):
  usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
  usb: musb: omap2430: Wait on enable to avoid babble
  usb: musb: omap2430: Handle multiple ID ground interrupts
  usb: musb: Add musb_set_host and peripheral and use them for omap2430
  usb: musb: omap2430: Clean up enable and remove devctl tinkering
  usb: musb: omap2430: Idle musb on init
  usb: musb: Get rid of omap2430_musb_set_vbus()

 drivers/usb/musb/musb_core.c | 103 ++++++++++++++++++++++
 drivers/usb/musb/musb_core.h |   3 +
 drivers/usb/musb/omap2430.c  | 164 ++++++++++-------------------------
 3 files changed, 152 insertions(+), 118 deletions(-)

-- 
2.23.0
