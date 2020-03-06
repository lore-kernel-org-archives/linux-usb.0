Return-Path: <SRS0=xv5D=4X=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9492C10DCE
	for <linux-usb@archiver.kernel.org>; Fri,  6 Mar 2020 17:27:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8EB820658
	for <linux-usb@archiver.kernel.org>; Fri,  6 Mar 2020 17:27:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCFR11 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Mar 2020 12:27:27 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:42638 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725873AbgCFR10 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 12:27:26 -0500
Received: (qmail 4319 invoked by uid 2102); 6 Mar 2020 12:27:25 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Mar 2020 12:27:25 -0500
Date:   Fri, 6 Mar 2020 12:27:25 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Crash while capturing with usbmon
In-Reply-To: <yw1x36alk6a3.fsf@mansr.com>
Message-ID: <Pine.LNX.4.44L0.2003061211340.1480-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 6 Mar 2020, [iso-8859-1] Måns Rullgård wrote:

> Alan Stern <stern@rowland.harvard.edu> writes:
> 
> > On Thu, 5 Mar 2020, Måns Rullgård wrote:
> >
> >> While trying to capture some USB traffic, this happened:
> >> 
> >> 8<--- cut here ---
> >> Unable to handle kernel paging request at virtual address ffeff000
> > ...
> >> [<c069e0a8>] (memcpy) from [<c050c88c>] (mon_copy_to_buff+0x4c/0x6c)
> >> [<c050c88c>] (mon_copy_to_buff) from [<c050cd2c>] (mon_bin_event+0x480/0x7b8)
> >> [<c050cd2c>] (mon_bin_event) from [<c050ade4>] (mon_bus_complete+0x50/0x6c)
> > ...
> >
> >> It is easily reproducible.  What can I do to narrow down the cause?
> >
> > What kind of USB traffic were you monitoring?  Isochronous?  
> > Scatter-gather?
> >
> > Can you add printk statements in drivers/usb/mon/mon_bin.c: 
> > mon_bin_get_data() to determine which of the pathways was used for 
> > calling mon_copy_buff() and what the values of the arguments were?
> 
> OK, I added a printk to mon_bin_get_data(), and the bad call has
> offset=4736, length=4096 urb->num_sgs=0 urb->transfer_flags=0x281,
> urb->transfer_buffer=0xffefee00.

The values seem reasonable enough, except for transfer_buffer.

> I guess the question now is how transfer_buffer got assigned that value.

Depending on how your kernel is configured (in particular, whether
CONFIG_MUSB_PIO_ONLY is enabled), it might be assigned in
musb_alloc_temp_buffer() (in drivers/usb/musb/musb_host.c) or
usb_sg_init() (in drivers/usb/core/message.c).

With a little more detective work you ought to be to determine which 
pathway is being used and what its important values are.  I wouldn't be 
surprised to learn that 0xffefee0 was the value from sg_virt(sg) in 
usb_sg_init().

Alan Stern

