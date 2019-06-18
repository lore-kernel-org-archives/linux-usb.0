Return-Path: <SRS0=9UCG=UR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D138C31E5B
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jun 2019 14:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EB50213F2
	for <linux-usb@archiver.kernel.org>; Tue, 18 Jun 2019 14:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbfFRO0Y (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 18 Jun 2019 10:26:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:34364 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725919AbfFRO0Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 10:26:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 516BFAC2D;
        Tue, 18 Jun 2019 14:26:23 +0000 (UTC)
Message-ID: <1560867168.3184.8.camel@suse.com>
Subject: possible deadlock in 3b6054da68f9b0d5ed6a7ed0f42a79e61904352c ("usb
 hub: send clear_tt_buffer_complete events when canceling TT clear work")
From:   Oliver Neukum <oneukum@suse.com>
To:     Octavian Purdila <octavian.purdila@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 18 Jun 2019 16:12:48 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

looking at this code,  which fixed a deadlock,it looks to me
like it has introduced another deadlock.

[assume a storage device on a hub being suspended]

hub_suspend() -> hub_quiesce() -> flush_work(&hub->tt.clear_work) ->

/* note that tt.clear_work is not on its own queue, it uses
simple schedule_work(). Hence the work lands on system_wq,
shared with arbitrary works */

kmalloc(... , GFP_KERNEL) -> usb_storage or uas ->
usb_autopm_get_interface() -> DEADLOCK

I think you need to use a dedicated workqueue for the hub driver.

	Regards
		Oliver


