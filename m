Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF36ECE58D
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 14:41:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90BAC20B7C
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 14:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731578AbfJIOlh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 10:41:37 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51046 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731574AbfJIOlg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 10:41:36 -0400
Received: (qmail 2864 invoked by uid 2102); 9 Oct 2019 10:41:35 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Oct 2019 10:41:35 -0400
Date:   Wed, 9 Oct 2019 10:41:35 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 2/5] USB: Make it possible to "subclass" usb_device_driver
In-Reply-To: <Pine.LNX.4.44L0.1910091025500.1603-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1910091040210.1603-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 9 Oct 2019, Alan Stern wrote:

> On Wed, 9 Oct 2019, Bastien Nocera wrote:
> 
> > The kernel currenly has only 2 usb_device_drivers, one generic one, one
> > that completely replaces the generic one to make USB devices usable over
> > a network.
> 
> Presumably your first driver is in generic.c.  Where is the second one?
> 
> > Use the newly exported generic driver functions when a driver declares
> > to want them run, in addition to its own code. This makes it possible to
> > write drivers that extend the generic USB driver.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> This has a few problems.  The biggest one is that the device core does 
> not guarantee any order of driver probing.  If generic.c is probed 
> first, the subclass driver will never get probed -- which is a pretty 
> fatal flaw.

I wrote this before reading patch 4/5.  So the situation isn't so bad.

Alan Stern

