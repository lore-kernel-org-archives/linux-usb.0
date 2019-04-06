Return-Path: <SRS0=peg9=SI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B77DC10F06
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 16:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F09CF213A2
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 16:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbfDFQIV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 6 Apr 2019 12:08:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35211 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726435AbfDFQIV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Apr 2019 12:08:21 -0400
Received: (qmail 20275 invoked by uid 500); 6 Apr 2019 12:08:19 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Apr 2019 12:08:19 -0400
Date:   Sat, 6 Apr 2019 12:08:19 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Bug: VHCI + USB 3.0
In-Reply-To: <ABA60E4B-AA6E-4FB9-8D74-AAA0C8045222@digi.com>
Message-ID: <Pine.LNX.4.44L0.1904061204070.19196-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 6 Apr 2019, Bollinger, Seth wrote:

> On Apr 6, 2019, at 10:34 AM, Alan Stern <stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>> wrote:
> 
> Why does a 3-KB read cause a failure?  It should work perfectly well.
> 
> I thought because the scsi command asked to read 32K.
> 
> If I’m incorrect in my assumption, and the chunked read should work,  do you have any theories?  I enabled debug spew on xhci, but nothing presented itself more than the EOVERFLOW being set when it detects babble.  I would appreciate any debug guidance you might be able to offer.  :)
> 
> [  179.330047] usb 2-1.3: usbdev_do_ioctl: SUBMITURB
> [  179.334761] usb 2-1.3: userurb 0000ffff70001640, ep1 bulk-in, length 3584
> [  179.341565] usb 2-1.3: usbdev_do_ioctl: SUBMITURB
> [  179.341569] xhci_hcd 0001:01:00.0: Babble error for slot 8 ep 2 on endpoint
> [  179.341574] xhci_hcd 0001:01:00.0: // Ding dong!
> [  179.341578] xhci_hcd 0001:01:00.0: Giveback URB ffff800073b48a80, len = 3584, expected = 3584, status = -75
> [  179.341581] usb 2-1.3: urb complete

Can you provide the "lsusb -v" output for the storage device as shown
on both computers?  I want to see if the server and the client disagree
on the maxpacket sizes for the bulk endpoints.  The key is that 3584 is
a multiple of 512 but not of 1024.

Alan Stern

