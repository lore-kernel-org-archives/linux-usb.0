Return-Path: <SRS0=uLNa=V5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7335C19759
	for <linux-usb@archiver.kernel.org>; Thu,  1 Aug 2019 17:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81F8620838
	for <linux-usb@archiver.kernel.org>; Thu,  1 Aug 2019 17:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731549AbfHARvQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 1 Aug 2019 13:51:16 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:46522 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727899AbfHARvP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Aug 2019 13:51:15 -0400
Received: (qmail 3115 invoked by uid 2102); 1 Aug 2019 13:51:14 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Aug 2019 13:51:14 -0400
Date:   Thu, 1 Aug 2019 13:51:14 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: About usb_new_device() API
In-Reply-To: <1564670980.22099.3.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1908011341010.1305-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 1 Aug 2019, Mayuresh Kulkarni wrote:

> Hi All,
> 
> I am seeing a peculiar behaviour which I think *might* be 
> caused by usb_new_device(). Since usb_new_device() is one of the core
> APIs, I cannot explain how PM works for USB device at later point in
> time.
> 
> In a particular use-case, our composite USB device
> exposes HID interface with vendor report descriptor. Since the standard
> HID-class driver's HID-input part is unable to decode this vendor report
> descriptor, it is unable to bind itself to this interface.
> After this, we don't see any L2 requests on USB bus analyser.
> Obvious reason seems to be, since no driver is bound to interface, there
> cannot be PM call-backs since driver has these call-backs.

There are other possible reasons.  For example, what is the setting 
stored in /sys/bus/usb/devices/.../power/control (fill in the "..." 
with the appropriate name for your device)?

If the file contains "on" then runtime PM is forbidden and the device 
will always remain at full power.  If the file contains "auto" then the 
device will be subject to normal runtime-PM suspends and resumes.

> But I am expecting that the USB device (which is parent of HID
> interface) should see L2. The reason being, USB-core seems to properly
> do runtime get/put wherever needed. And HID interface has no driver, so
> from USB-core point of view, it is a USB device w/o any interface.
> (please correct if this is incorrect expectation).

More accurately, it is a USB device with one interface which is not 
bound to a driver.

> With that said, I am confused about usb_new_device() in this context. It
> seems to call usb_disable_autosuspend() ==> pm_runtime_forbid() ==>
> increment usage_count.

Correct.  By default, all USB devices except hubs are forbidden to go 
into runtime suspend.  This setting can be changed by userspace (by 
writing to the sysfs file mentioned above).

> However, it never calls usb_enable_autosuspend() itself.
> Now since USB PM (and L2) works fine at later point in time (i.e.: after
> all the interfaces are bound to their appropriate drivers), I think
> somewhere the equivalent of usb_enable_autosuspend() gets called for the
> USB device and hence USB PM works fine.

There are programs, like powertop, which will automatically write
"auto" to the power/control sysfs file when a new device appears.  
Doing so calls pm_runtime_allow(), which decrements usage_count.

> I wonder this *may be* be an issue I am seeing with the use-case
> mentioned above. But definitely confused about it and hence thought of
> sending this email.
> 
> Does this description makes sense? Is it necessary to
> call usb_enable_autosuspend() in usb_new_device()?

It is not necessary.  Check that sysfs file and see what it contains.  
In fact, you can check the contents of all the files in the device's 
sysfs power/ subdirectory.

Alan Stern

