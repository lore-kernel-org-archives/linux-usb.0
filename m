Return-Path: <SRS0=rQJG=U7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACA2C5B57D
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jul 2019 07:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76D2A216C8
	for <linux-usb@archiver.kernel.org>; Tue,  2 Jul 2019 07:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfGBHHv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Jul 2019 03:07:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:45786 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725802AbfGBHHu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 03:07:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B8490AFB1;
        Tue,  2 Jul 2019 07:07:49 +0000 (UTC)
Message-ID: <1562050423.5819.1.camel@suse.com>
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
From:   Oliver Neukum <oneukum@suse.com>
To:     JC Kuo <jckuo@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>
Cc:     usb-storage@lists.one-eyed-alien.net, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Date:   Tue, 02 Jul 2019 08:53:43 +0200
In-Reply-To: <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
         <20190701085248.GA28681@kroah.com>
         <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 02.07.2019, 10:36 +0800 schrieb JC Kuo:

> An user might want to completely disable uas for some reason so he/she adds "blacklist uas" to modprobe conf file. I think in case of this, usb-storage driver has to enable this device with the legacy Bulk-only protocol instead of ignoring the device.
> 
> As an alternative to this patch, I thought I could get uas driver loaded before usb-storage driver so I tried moving the functions in drivers/usb/storage/uas-detect.h into uas.c and letting usb-storage links uas_use_uas_driver() of uas.ko. However, that didn't work because uas driver actually depends on usb-storage driver for usb_stor_adjust_quirks(). There will be a recursive dependency.
> 
> Please let me know if there is better approach to avoid the issue.

Use US_FL_IGNORE_UAS. You can trigger this with a module parameter.
We cannot just use another driver because the user block a module
load.

	Regards
		Oliver

