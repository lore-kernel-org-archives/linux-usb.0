Return-Path: <SRS0=16bF=WD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFACC433FF
	for <linux-usb@archiver.kernel.org>; Wed,  7 Aug 2019 07:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EDF12217F4
	for <linux-usb@archiver.kernel.org>; Wed,  7 Aug 2019 07:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbfHGHht (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 7 Aug 2019 03:37:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:60174 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727190AbfHGHht (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 03:37:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DE110AFCF;
        Wed,  7 Aug 2019 07:37:47 +0000 (UTC)
Message-ID: <1565163465.8136.36.camel@suse.com>
Subject: Re: [PATCH] usbfs: Add ioctls for runtime power management
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Date:   Wed, 07 Aug 2019 09:37:45 +0200
In-Reply-To: <Pine.LNX.4.44L0.1908061542140.1571-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908061542140.1571-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 06.08.2019, 15:46 -0400 schrieb Alan Stern:
> +static int proc_wait_for_resume(struct usb_dev_state *ps)
> +{
> +       int ret;
> +
> +       usb_unlock_device(ps->dev);
> +       ret = wait_event_interruptible(ps->wait_for_resume,
> +                       READ_ONCE(ps->not_yet_resumed) == 0);
> +       usb_lock_device(ps->dev);
> +
> +       if (ret != 0)
> +               return ret;
> +       return proc_forbid_suspend(ps);

One nitpick, this seems to return raw -ERESTARTSYS in the interrupt
case. Should it?

	Regards
		Oliver

