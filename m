Return-Path: <SRS0=BMk0=2A=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BAEC43603
	for <linux-usb@archiver.kernel.org>; Tue, 10 Dec 2019 14:18:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B10D1214AF
	for <linux-usb@archiver.kernel.org>; Tue, 10 Dec 2019 14:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfLJOSa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 10 Dec 2019 09:18:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:35818 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727061AbfLJOSa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 09:18:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A9D9EB1DE;
        Tue, 10 Dec 2019 14:18:29 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH for-5.6 0/2] usb:gadget: ALSA PCM API updates
Date:   Tue, 10 Dec 2019 15:18:20 +0100
Message-Id: <20191210141822.18705-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

this is a patch set to adapt the latest ALSA PCM API to staging
drivers.  Basically these are merely cleanups, as shown in diffstat,
and there should be no functional changes.

As the corresponding ALSA PCM API change is found in 5.5-rc1, please
apply these on 5.5-rc1 or later.  Or if you prefer, I can merge them
through sound tree, too.  Let me know.


thanks,

Takashi

===

Takashi Iwai (2):
  usb: gadget: u_audio: Use managed buffer allocation
  usb: gadget: u_audio: Drop superfluous ioctl PCM ops

 drivers/usb/gadget/function/u_audio.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

-- 
2.16.4

