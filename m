Return-Path: <SRS0=9a5V=CZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD404C433E2
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 09:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8140B2053B
	for <linux-usb@archiver.kernel.org>; Wed, 16 Sep 2020 09:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgIPJkp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Sep 2020 05:40:45 -0400
Received: from mx2.suse.de ([195.135.220.15]:48286 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726243AbgIPJkk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 05:40:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A49BEB1FE;
        Wed, 16 Sep 2020 09:40:54 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2] updates to UAS 
Date:   Wed, 16 Sep 2020 11:40:24 +0200
Message-Id: <20200916094026.30085-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The first patch fixes a corner case where a whole tree of devices
is removed and I got a report of a live lock

The second patch just modernizes to new helpers. No functional change
intended

v2: reversed order of patches so the first patch can cleanly go into
the stable series

Signed-off-by: Oliver Neukum <oneukum@suse.com>

