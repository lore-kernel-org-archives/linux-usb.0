Return-Path: <SRS0=uAmH=24=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A018CC282DD
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jan 2020 18:27:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72A33206F0
	for <linux-usb@archiver.kernel.org>; Tue,  7 Jan 2020 18:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgAGS1j (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 7 Jan 2020 13:27:39 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:47884 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728235AbgAGS1i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 13:27:38 -0500
Received: (qmail 6352 invoked by uid 2102); 7 Jan 2020 13:27:37 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Jan 2020 13:27:37 -0500
Date:   Tue, 7 Jan 2020 13:27:37 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: Use of address 0 in usbmon
In-Reply-To: <CAOHtt3_3_C36nhqjiNnYHH0DjE5ZM2nxdXXgamzPvQzNH6Co1g@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001071325390.1567-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Jan 2020, Tomasz Moń wrote:

> On Tue, Jan 7, 2020 at 6:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > Before the patch you sent in yesterday, usbmon reported these requests
> > as directed to device number 1 (which is the number assigned to root
> > hubs since they are the first devices registered on their USB buses),
> > not 0.
> 
> Thank you for mentioning this.
> 
> > > Would it be possible to modify the usbmon format, so the
> > > is_root_hub(urb->dev) flag would be somehow available to the
> > > user-space tools?
> >
> > How about using address 255 in the usbmon output to represent root
> > hubs?  That wouldn't require any format change at all.
> 
> Yes, that's one possibility.
> 
> > By the way, there is one bad aspect to your patch.  Although the device
> > addresses output by usbmon will now correspond exactly to the physical
> > addresses on the bus, they will not correspond to the device numbers
> > used everywhere else in the kernel.  For example, someone monitoring
> > communcations with /dev/bus/usb/001/005 won't know what device address
> > to look for in the usbmon output -- it might not be 005.
> 
> Initially I have modified also the drivers/usb/core/devices.c to
> change the format_topo to use devaddr instead of devnum. Then I
> realised it could cause a snowball effect and decided to limit the
> change to usbmon only.
> 
> I think the solution to would be to extend usbmon format to include
> both devnum and devaddr. This unfortunately would require format
> change.

Maybe a better answer is to leave usbmon alone and instead add a new
devaddr attribute file to sysfs, containing the device's physical
address.  Then user programs could easily perform the conversion.

Alan Stern

