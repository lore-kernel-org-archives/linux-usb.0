Return-Path: <SRS0=fO8s=YD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE63C4360C
	for <linux-usb@archiver.kernel.org>; Thu, 10 Oct 2019 14:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABEFD206B6
	for <linux-usb@archiver.kernel.org>; Thu, 10 Oct 2019 14:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfJJOTR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 10 Oct 2019 10:19:17 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55262 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725901AbfJJOTQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Oct 2019 10:19:16 -0400
Received: (qmail 2421 invoked by uid 2102); 10 Oct 2019 10:19:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Oct 2019 10:19:15 -0400
Date:   Thu, 10 Oct 2019 10:19:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 4/5] USB: Select better matching USB drivers when available
In-Reply-To: <ae7c3e3abfce7cc6d69e8453c3964245db160143.camel@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910101017260.1581-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 10 Oct 2019, Bastien Nocera wrote:

> On Wed, 2019-10-09 at 14:45 -0400, Alan Stern wrote:
> > 
> On Wed, 9 Oct 2019, Bastien Nocera wrote:
> > 
> > <snip>
> > > +               return
> > device_driver_attach(usb_generic_driver.drvwrap.driver, dev);
> > > +       return error;
> > 
> > I think that's right.  A little testing wouldn't hurt.
> 
> device_driver_attach() isn't available to this part of the code.
> 
> I think the only way to do things here might be to set status bit for
> the usb_device and launch device_reprobe(). The second time around, we
> wouldn't match or probe the specific driver.

That would mean probing generic_driver twice, right?  You probably
should call its disconnect routine in between.

That sounds pretty awkward, but if there's no other way then go ahead 
and do it.

Ala Stern

