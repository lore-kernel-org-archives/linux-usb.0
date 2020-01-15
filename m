Return-Path: <SRS0=3jNv=3E=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD549C33CB1
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 15:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B77E924679
	for <linux-usb@archiver.kernel.org>; Wed, 15 Jan 2020 15:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgAOPO7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 15 Jan 2020 10:14:59 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:32818 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728909AbgAOPO7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 10:14:59 -0500
Received: (qmail 2660 invoked by uid 2102); 15 Jan 2020 10:14:58 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Jan 2020 10:14:58 -0500
Date:   Wed, 15 Jan 2020 10:14:58 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Andrew P. Lentvorski" <bsder@allcaps.org>
cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to set "iInterface" in usb gadget via configfs
In-Reply-To: <994f33ae-fa5f-460c-67c8-92fc5352ebae@allcaps.org>
Message-ID: <Pine.LNX.4.44L0.2001151011520.1788-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 14 Jan 2020, Andrew P. Lentvorski wrote:

> I've been trying to report what I think is a bug, but I can't seem to
> get through to the mailing list.  If these are coming through
> duplicated, please let me know so I can quit sending them.

I don't think any earlier messages in this thread made it through the 
mailing list, but this one definitely did.

> Thanks,
> -a
> 
> 
> > I've been trying to set "iInterface" in my usb gadget to a specific string, but I simply can't find a way to make configfs accept this.
> > 
> > When I set my gadget up on my Beaglebone Black (uname -a: Linux beaglebone 4.14.108-ti-r113 #1 SMP PREEMPT Wed Jul 31 00:01:10 UTC 2019 armv7l GNU/Linux).
> > 
> > I get (output from lsusb):
> > 
> > iInterface 5 HID Interface
> > 
> > 
> > But I want it to be something like:
> > 
> > iInterface 4 LPC-LINK2 CMSIS-DAP V5.224
> > 
> > 
> > This seems to be wired up as a fixed value in f_hid.c and doesn't seem to have a corresponding way to actually change it via configfs.
> > 
> > 
> > #define CT_FUNC_HID_IDX 0
> > 
> > static struct usb_string ct_func_string_defs[] = {
> >         [CT_FUNC_HID_IDX].s     = "HID Interface",
> >         {},                     /* end of list */
> > };

Then maybe you need to fix f_hid.c.  Or maybe configfs isn't meant to
allow the user to specify these string index values (I don't know any
of the configfs details).

Alan Stern

