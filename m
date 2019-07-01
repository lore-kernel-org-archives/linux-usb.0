Return-Path: <SRS0=acVg=U6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3403CC0650E
	for <linux-usb@archiver.kernel.org>; Mon,  1 Jul 2019 09:32:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1144F206E0
	for <linux-usb@archiver.kernel.org>; Mon,  1 Jul 2019 09:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfGAJcY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 1 Jul 2019 05:32:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:51598 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728143AbfGAJcY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Jul 2019 05:32:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5DE6EB035;
        Mon,  1 Jul 2019 09:32:23 +0000 (UTC)
Message-ID: <1561972691.10014.8.camel@suse.com>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        patches@opensource.cirrus.com, USB list <linux-usb@vger.kernel.org>
Date:   Mon, 01 Jul 2019 11:18:11 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906270944150.1492-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906270944150.1492-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 27.06.2019, 09:52 -0400 schrieb Alan Stern:

> 
> Or maybe the WAIT_FOR_RESUME ioctl returns because there was a remote 
> wakeup.  In this case also you would call FORBID_SUSPEND.
> 
> In fact, you should call FORBID_SUSPEND _whenever_ WAIT_FOR_RESUME

Well, this kind of indicates that the original syscall should bump
the counter.

> returns, unless your program has decided not to use the device any more
> (in which case you don't care whether the device is suspended or
> resumed).

Then you should close the device.

	Regards
		Oliver

