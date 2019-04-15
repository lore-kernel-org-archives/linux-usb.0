Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A26AC10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 18:10:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7034F218A1
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 18:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfDOSKB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 14:10:01 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39924 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726740AbfDOSKB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 14:10:01 -0400
Received: (qmail 6428 invoked by uid 2102); 15 Apr 2019 14:10:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 15 Apr 2019 14:10:00 -0400
Date:   Mon, 15 Apr 2019 14:10:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Georg Chini <georg@chini.tk>
cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: Problem with USB2 devices connected to a hub
In-Reply-To: <33a1722e-dd48-2d44-328c-66dd40995edf@chini.tk>
Message-ID: <Pine.LNX.4.44L0.1904151407490.1575-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 15 Apr 2019, Georg Chini wrote:

> On 15.04.19 17:17, Mathias Nyman wrote:
> > On 12.4.2019 22.48, Georg Chini wrote:
> >> On 08.04.19 08:46, Georg Chini wrote:
> >>> On 02.04.19 16:52, Mathias Nyman wrote:
> >>>> On 28.3.2019 15.41, Mathias Nyman wrote:
> >>>>>
> >>>>>>> The issue happens when only a single hub and a single device is 
> >>>>>>> connected to the
> >>>>>>> USB subsystem. On my previous board, I had two USB dongles and 
> >>>>>>> two sound
> >>>>>>> devices connected to the same hub and it worked without issues. 
> >>>>>>> So I guess it
> >>>>>>> is not a real bandwidth limit. Somehow the hub seems to eat the 
> >>>>>>> bandwidth.
> >>>>>>
> >>>>>>
> >>>>> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git 
> >>>>> bandwidth-debug
> >>>>>
> >>>>> New traces using the bandwidth-debug testbranch could be useful, 
> >>>>> even without the "available bandwidth"
> >>>>> support
> >>>>>
> >> Here are the traces. In the beginning, there is no USB device 
> >> connected. Then I connect a hub
> >> (this time a simple 4 port USB 2.0 hub). After that I connect an USB 
> >> sound device to the hub.
> >>
> >> Hope it helps.
> >>
> >
> > Traces show secondary bandwidth error response from xHC hardware when 
> > adding ISOC OUT endpoint 1:
> >
> > 321.773182: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 
> > interval 1000 us max ESIT payload 200 CErr 0 Type Isoc OUT burst 0 
> > maxp 200 deq 00000000fffb2001 avg trb len 200
> > 321.773198: xhci_configure_endpoint_ctrl_ctx: Add: slot 1out
> > 321.773199: xhci_configure_endpoint: RS 00001 full-speed multi-TT Ctx 
> > Entries 7 MEL 0 us Port# 2/0 [TT Slot 7 Port# 1 TTT 0 Intr 0] Addr 0 
> > State enabled/disabled
> > 321.773200: xhci_queue_trb: CMD: Configure Endpoint Command: ctx 
> > 00000000fffaf000 slot 8 flags d:C
> > 321.773380: xhci_handle_event: EVENT: TRB 00000000ffffeb60 status 
> > 'Secondary Bandwidth Error' len 0 slot 8 ep 0 type 'Command Completion 
> > Event' flags e:c
> >
> > That endpoint only moves 200 bytes every 1ms (every FS frame), which 
> > is 1.6Mbit/s.
> > There was another periodic endpoint added before this one, but it only 
> > moves 4 bytes every 32ms, equals ~1kbit/s
> >
> > which together are still far from the ~12Mbit/s supported by FS bus, 
> > even with the TT think time etc.
> > Traces doesn't show any incorrect values being given to xHC hw in the 
> > context either.
> >
> > Only thing I can think of is that there are other parameters affecting 
> > the available bandwidth calculations,
> > such as the average TRB length, and Link powermanagement related exit 
> > latencies.
> >
> > xhci specs say:
> >
> > The xHC uses the value of the Average TRB Length field in the Endpoint 
> > Context as a metric to help
> > compute the system bus bandwidth requirements of an endpoint. The 
> > accuracy of this parameter is
> > particularly important for periodic endpoints. An xHC will use the 
> > Average TRB Length and other metrics to
> > allocate/distribute system bus bandwidth to endpoints. These “other” 
> > metrics are xHC implementation
> > specific and outside the scope of this specification.
> >
> > I'm out for a week, so response will be slow.
> >
> > -Mathias
> 
> So what you are saying is that it's a "bug" or "feature" of the C3858 
> CPU and can't be fixed, right?

An unfortunate feature of the xHCI design is that bandwidth 
computations are all done internally by the xHC controller.  There's no 
way to tell _how_ they were done, what the results were in detail, or 
to fix any mistakes.

Alan Stern

