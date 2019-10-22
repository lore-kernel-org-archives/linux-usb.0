Return-Path: <SRS0=MnUw=YP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35531CA9EA0
	for <linux-usb@archiver.kernel.org>; Tue, 22 Oct 2019 16:53:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11B4A20B7C
	for <linux-usb@archiver.kernel.org>; Tue, 22 Oct 2019 16:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731549AbfJVQxR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Oct 2019 12:53:17 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:33198 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1731481AbfJVQxR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 12:53:17 -0400
Received: (qmail 5273 invoked by uid 2102); 22 Oct 2019 12:53:16 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Oct 2019 12:53:16 -0400
Date:   Tue, 22 Oct 2019 12:53:16 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Harald Dunkel <harri@afaics.de>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: 5.3.6: I/O error on writing SD card via USB3
In-Reply-To: <8b9b00f1-aec6-5c38-064a-83c04c8b1a9e@afaics.de>
Message-ID: <Pine.LNX.4.44L0.1910221249300.1468-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 22 Oct 2019, Harald Dunkel wrote:

> Hi Alan,
> 
> On 10/21/19 7:48 PM, Alan Stern wrote:
> > On Mon, 21 Oct 2019, Harald Dunkel wrote:
> > 
> >>
> >> The USB2 cable worked, too. Actually I had expected that the speed is
> >> reduced automatically according to the specs of the card. ???
> > 
> > That is doubtful.  The speed of the connection is determined when the
> > connection is first set up.  Unless the reader disconnects itself from
> > the USB bus when a card is removed and reconnects when a card is
> > inserted, the speed can't change.
> > 
> :
> :
> > 
> > At any rate, it sounds like the 133x card is just too slow to keep up.
> > 
> 
> 
> AFAIU the SD card is accessed similar to other block devices. There shouldn't
> be any I/O errors on writing to a slow device, unless hardware or software are
> faulty. The data to write is cached.
> 
> Anyway, I got a new USB3 card reader today: No problem with it, even though
> I wrote to the same slow SD card. Since the old SD card reader works OK using
> USB2, I would either assume a bug in the XHCI driver for the old device, or a
> hardware failure.
> 
> Would you agree to this conclusion?

Yes, except that I would go even farther.  Since the same xhci-hcd
driver works okay for your new card reader and the old card, I would
rule out an error in the driver or the card.  This means that the
hardware/firmware in the old reader is most likely to be at fault.

Alan Stern

