Return-Path: <SRS0=pefB=4R=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEA3C3F2C6
	for <linux-usb@archiver.kernel.org>; Sat, 29 Feb 2020 23:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68EBC24650
	for <linux-usb@archiver.kernel.org>; Sat, 29 Feb 2020 23:05:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgB2XF4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 29 Feb 2020 18:05:56 -0500
Received: from netrider.rowland.org ([192.131.102.5]:54149 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726786AbgB2XF4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 18:05:56 -0500
Received: (qmail 434 invoked by uid 500); 29 Feb 2020 18:05:55 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Feb 2020 18:05:55 -0500
Date:   Sat, 29 Feb 2020 18:05:55 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 device?
In-Reply-To: <78bb6ff8-6c8b-1347-7f09-cfc9b6096004@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2002291803310.32621-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 29 Feb 2020, James wrote:

> I forgot sudo.
> 
> This looks like the interface is USB 3 but the device internals are USB 2.
> Does that make sense?

No.

>    SuperSpeed USB Device Capability:
>      bLength                10
>      bDescriptorType        16
>      bDevCapabilityType      3
>      bmAttributes         0x00
>      wSpeedsSupported   0x0006
>        Device can operate at Full Speed (12Mbps)
>        Device can operate at High Speed (480Mbps)

> $ sudo lsusb -v -d 0bda:b812
> 
> Bus 003 Device 002: ID 0bda:b812 Realtek Semiconductor Corp. 802.11ac NIC
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.10
>    bDeviceClass            0
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    idVendor           0x0bda Realtek Semiconductor Corp.
>    idProduct          0xb812
>    bcdDevice            2.10

These are exactly the same vendor, product, and serial IDs as the first 
device.  So you should expect them to be the same.

Alan Stern

