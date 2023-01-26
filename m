Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F54AC54E94
	for <linux-usb@archiver.kernel.org>; Thu, 26 Jan 2023 16:24:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbjAZQYJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232678AbjAZQYH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 11:24:07 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C9D15211E
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 08:23:42 -0800 (PST)
Received: (qmail 264950 invoked by uid 1000); 26 Jan 2023 11:23:42 -0500
Date:   Thu, 26 Jan 2023 11:23:42 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     Hans Petter Selasky <hps@selasky.org>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y9KpDvYEag++ec4t@rowland.harvard.edu>
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
 <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <236997e1-d2db-ad2d-7161-c9e3845318f6@selasky.org>
 <CAHHqYPPh43XccGvA6Dt9Ofy7PoXJsJxQvZDVima671Kq1bOn1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPPh43XccGvA6Dt9Ofy7PoXJsJxQvZDVima671Kq1bOn1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 26, 2023 at 04:26:24PM +0100, Troels Liebe Bentsen wrote:
> But that's another question, how do I get Linux to re-enumerating the
> device and update the sysfs files?

You can force a device reset using libusb or the usb-reset program 
floating around the Internet.  After the kernel resets a device, it 
checks to make sure the device, BOS, configuration, and serial-number 
string descriptors have not changed.  If any of them is different from 
what it used to be, the kernel will re-enumerate the device.

Or, you can get the same effect by unplugging the device and then 
plugging it back in.  But with direct-wired connections, that's not 
possible.

Alan Stern
