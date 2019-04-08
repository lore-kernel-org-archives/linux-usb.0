Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDFBC10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 17:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A72020880
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 17:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfDHRXz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 13:23:55 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52414 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726105AbfDHRXz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 13:23:55 -0400
Received: (qmail 6172 invoked by uid 2102); 8 Apr 2019 13:23:54 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Apr 2019 13:23:54 -0400
Date:   Mon, 8 Apr 2019 13:23:54 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <BE0E8950-4652-482E-9464-ADFBF8923EA6@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904081309531.1440-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 8 Apr 2019, Bollinger, Seth wrote:

> On Apr 8, 2019, at 9:33 AM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:
> 
> In theory, the device should report a block size of 1024.  Does it
> actually do this?  A usbmon trace (on the host) showing what happens
> when the device is first plugged in will provide the answer.  Can you
> collect one and post it?
> 
> Here it is:

And here's the important part:

> ffff8000722380c0 209057099 S Bo:2:006:2 -115 31 = 55534243 03000000 08000000 80000a25 00000000 00000000 00000000 000000
> ffff8000722380c0 209057109 C Bo:2:006:2 0 31 >
> ffff800073cf8f00 209057115 S Bi:2:006:1 -115 8 <
> ffff800073cf8f00 209057185 C Bi:2:006:1 0 8 = 0e69ffff 00000200

The two big-endian numbers at the end of this line are the logical
block address of the device's last block and the logical block size in
bytes.  Thus the device claims to have 512-byte blocks.

I suspect you have run across a bug in the device.  It shouldn't mind 
that it was asked to send 3584 bytes of data; it ought to send 3 
1024-byte packets followed by a short 512-byte packet.  Instead it 
seems to be sending 4 1024-byte packets, thus causing an error.  At 
least, that's my guess.

To help verify this, can you send a similar usbmon trace on the server
showing what happens when the EOVERFLOW error occurs?  The debug
messages in your April 6 email don't contain all the detailed
information.

Alan Stern

