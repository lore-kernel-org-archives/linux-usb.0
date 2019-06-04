Return-Path: <SRS0=VYZK=UD=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4151C282CE
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 14:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1CE9239C8
	for <linux-usb@archiver.kernel.org>; Tue,  4 Jun 2019 14:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfFDOR0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 4 Jun 2019 10:17:26 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:49066 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727169AbfFDOR0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 10:17:26 -0400
Received: (qmail 2558 invoked by uid 2102); 4 Jun 2019 10:17:25 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Jun 2019 10:17:25 -0400
Date:   Tue, 4 Jun 2019 10:17:25 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: Extending USB_CONNECTINFO ioctl
In-Reply-To: <20190604002410.GA36666@dtor-ws>
Message-ID: <Pine.LNX.4.44L0.1906040952480.1731-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 3 Jun 2019, Dmitry Torokhov wrote:

> Hi Alan, Greg,
> 
> When running software in a jailed environment where sysfs or udev is not
> readily available and one can only have an FD to usbdevfs device passed
> into the jail, there is a desire to allow libusb working. Alan recently
> added USBDEVFS_GET_SPEED, but we are still missing bus number and list
> of port numbers on the way to the root to be able to better identify the
> device in question.
> 
> What do you think about adding a new ioctl:
> 
> struct usbdevfs_connectinfo_ex {
> 	__u32 size;		/* size of the structure from the kernel POV */

This should be an input/output parameter.  That is, the original value
says how big the userspace structure is, and the value stored by the
kernel says how much space was actually filled in.  Or alternatively, 
have two size fields (one for input and one for output).

> 	__u32 busnum;
> 	__u32 devnum;
> 	__u32 speed;		/* USB_SPEED_* form ch9.h */
> 	u8 num_ports;		/* Number of entries in port_numbers array */
> 	u8 port_numbers[31];	/* Current limit in USB3.0 spec is 7 */
> };

Yeah, 31 is overkill.  Even the USB-2.0 spec limits the topology to 7
tiers (including the root hub), meaning that only 6 port numbers are
needed.

> /*
>  * Returns struct usbdevfs_connectinfo_ex; length is variable to allow
>  * extending size of the data returned.
>  */
> #define USBDEVFS_CONNINFO_EX(len)  _IOC(_IOC_READ, 'U', 32, len)

Sounds okay to me.  Have you asked the libusb Linux-port maintainers
what they think and if they have any suggestions for additional fields?

Also, if you implement this, remember to add a USBDEVFS_CAP_CONNINFO_EX
capability flag for the new ioctl (see the USBDEVFS_GET_CAPABILITIES 
handler).

Alan Stern

