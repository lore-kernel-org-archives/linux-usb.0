Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C32C10F13
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 19:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6CF820879
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 19:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfDHTAA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 15:00:00 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52534 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726544AbfDHS77 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Apr 2019 14:59:59 -0400
Received: (qmail 6534 invoked by uid 2102); 8 Apr 2019 14:59:58 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Apr 2019 14:59:58 -0400
Date:   Mon, 8 Apr 2019 14:59:58 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <2BD36DBB-21E5-4776-820C-BAA3C87F707C@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904081453480.1440-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 8 Apr 2019, Bollinger, Seth wrote:

> On Apr 8, 2019, at 12:23 PM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:
> 
> The two big-endian numbers at the end of this line are the logical
> block address of the device's last block and the logical block size in
> bytes.  Thus the device claims to have 512-byte blocks.
> 
> I suspect you have run across a bug in the device.  It shouldn't mind
> that it was asked to send 3584 bytes of data; it ought to send 3
> 1024-byte packets followed by a short 512-byte packet.  Instead it
> seems to be sending 4 1024-byte packets, thus causing an error.  At
> least, that's my guess.
> 
> I am confused as to how this could be a device bug.  They have worked in every machine we’ve used them in so far, save for the USBIP use case.  I’ve spent quite some time trying to reproduce in physical machines, even the same one that experiences the problem using USBIP.

I don't know.  That's just my best guess based on the data seen so far.

> To help verify this, can you send a similar usbmon trace on the server
> showing what happens when the EOVERFLOW error occurs?  The debug
> messages in your April 6 email don't contain all the detailed
> information.
> 
> I believe this trace should have captured the failure, although I’m not seeing the odd read here...

No, that trace did not show any failure.  Did you see the corresponding 
error messages in the kernel log while you were collecting the trace?
Maybe you can try again.

Alan

PS: Why doesn't your email client insert some sort of "reply indent"  
string, such as "> "?  Looking at the messages you send, it's not so
easy to tell which parts were written by you and which you are replying
to.

