Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E29C10F0E
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 14:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9AB9920830
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 14:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfDIOOu (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 10:14:50 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:45882 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726374AbfDIOOu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Apr 2019 10:14:50 -0400
Received: (qmail 1647 invoked by uid 2102); 9 Apr 2019 10:14:49 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Apr 2019 10:14:49 -0400
Date:   Tue, 9 Apr 2019 10:14:49 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Miquel Raynal <miquel.raynal@bootlin.com>
cc:     Hans de Goede <hdegoede@redhat.com>, <linux-usb@vger.kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@kernel.org>
Subject: Re: Question about regulators
In-Reply-To: <20190409094132.22d2d827@xps13>
Message-ID: <Pine.LNX.4.44L0.1904091007190.1599-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 9 Apr 2019, Miquel Raynal wrote:

> Hi Hans,
> 
> Hans de Goede <hdegoede@redhat.com> wrote on Tue, 9 Apr 2019 09:38:01
> +0200:
> 
> > Hi,
> > 
> > On 09-04-19 09:26, Miquel Raynal wrote:
> > > Hello,
> > > 
> > > Adding Greg & Hans just in case they have an idea, or someone else to
> > > ping in mind.
> > > 
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote on Wed, 3 Apr 2019
> > > 10:13:43 +0200:
> > >   
> > >> Hello,
> > >>
> > >> I am reading the document named "xHCI interoperability testing v0.94"
> > >> available on usb.org. There is this paragraph:
> > >>
> > >>          Devices operating at Enhanced SuperSpeed GenX are allowed to
> > >>          draw a maximum configured current of 900mA and unconfigured
> > >>          current of 150mA. Devices operating at High-Speed or below may
> > >>          draw a maximum configured current of 500mA and unconfigured
> > >>          current of 100mA*. Devices must report their maximum configured
> > >>          current draw and their power configuration as self or bus
> > >>          powered to the host and must operate within the regions
> > >>          reported. Additionally any device that is in the suspended
> > >>          state may draw no more than 2.5 mA.
> > >>
> > >> My understanding is that the current limitation on Vbus should be tuned
> > >> dynamically between 100, 150, 500 and 900mA depending on the type of
> > >> device and if has been configured or not.
> > >>
> > >> Despite some researches in the USB core I can't find any mechanism
> > >> handling this in Linux implementation.
> > >>
> > >> Behind this remark, I actually have boards (Armada 7040/8040 DB) with a
> > >> regulator on Vbus to limit the current to either 500 or 900mA. I
> > >> checked the xhci-platform driver which is used with these SoCs and I
> > >> don't find any mean to tweak this value depending on the inserted
> > >> device.
> > >>
> > >> Should I actually care? Is it enough to limit to 900mA whenever the
> > >> xHCI driver is probed?  
> > 
> > To be clear you are talking about a regulator producing Vbus for device
> > plugged into the system, right ?
> > 
> > In that case just configuring th current-limit at 900mA is fine, it really
> > is up to the device to not consume more then it may and even if it does since
> > the port is capable of delivering 900mA anyways that is not a problem.
> > 
> > There is code in various places in the kernel for Linux devices to not
> > consume too much energy (mostly in charger ic drivers) when the Linux
> > device itself is an USB device drawing power.
> > 
> > Regards,
> > 
> > Hans
> > 
> 
> Thank you very much for answering my questions. I'll just stick to a
> 900mA limitation in all cases then.

If you want to be more strict about it, in theory you could enforce the
lower current limits.  We do know when they are supposed to take
effect, although that knowledge is currently not used.  The Linux USB
core has no mechanism for informing regulators about maximum current
limits, but some such mechanism certainly could be added.

For example, one relatively simple thing you could do is set the limit
to 900 mA when the device connection is SuperSpeed or faster, and 500
mA when the device connection is High speed or slower.  (And 2.5 mA 
when the device is suspended.)  But you would have to write the code to 
do this and insert it in the correct place in the xhci-hcd driver.

Alan Stern

