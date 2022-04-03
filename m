Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB5FC433EF
	for <linux-usb@archiver.kernel.org>; Sun,  3 Apr 2022 15:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238987AbiDCPT2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 3 Apr 2022 11:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232531AbiDCPT2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Apr 2022 11:19:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 247801DA64
        for <linux-usb@vger.kernel.org>; Sun,  3 Apr 2022 08:17:34 -0700 (PDT)
Received: (qmail 88839 invoked by uid 1000); 3 Apr 2022 11:17:33 -0400
Date:   Sun, 3 Apr 2022 11:17:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: Buffer overflow in drivers/usb/host/ehci-sched.c?
Message-ID: <Ykm6ja7RggR367cC@rowland.harvard.edu>
References: <2f9e5b99-c527-9c54-7fd3-0f052be982dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f9e5b99-c527-9c54-7fd3-0f052be982dc@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 03, 2022 at 12:12:48AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
>    The following function in the EHCI scheduling code causes the SVACE static analyzer to
> report possible buffer overflow (see the last assignment below), e.g.:
> 
> Buffer 'ehci->bandwidth' of size 64 accessed at ehci-sched.c:240 can overflow, since its
> index 'i + j' can have value 66 that is out of range, as indicated by preceding conditional
> expression at ehci-sched.c:240.

Not sure what you mean.  In my copy of the file, line 240 is the assignment.  
There is a conditional in line 239 and in line 238 (the "for" condition), 
but I don't see how either one indicates that i+j could be as large as 66.

>    I tried hard to analyze this code but couldn't quite figure out whether an overflow could
> actually happen... Maybe Alan (or Greg?) could please help me out?

All right.  Hold on to your hat...

> static void reserve_release_intr_bandwidth(struct ehci_hcd *ehci,
> 		struct ehci_qh *qh, int sign)
> {
> 	unsigned		start_uf;
> 	unsigned		i, j, m;
> 	int			usecs = qh->ps.usecs;
> 	int			c_usecs = qh->ps.c_usecs;
> 	int			tt_usecs = qh->ps.tt_usecs;
> 	struct ehci_tt		*tt;
> 
> 	if (qh->ps.phase == NO_FRAME)	/* Bandwidth wasn't reserved */
> 		return;
> 	start_uf = qh->ps.bw_phase << 3;

This guarantees that start_uf is a multiple of 8.

> 	bandwidth_dbg(ehci, sign, "intr", &qh->ps);
> 
> 	if (sign < 0) {		/* Release bandwidth */
> 		usecs = -usecs;
> 		c_usecs = -c_usecs;
> 		tt_usecs = -tt_usecs;
> 	}
> 
> 	/* Entire transaction (high speed) or start-split (full/low speed) */
> 	for (i = start_uf + qh->ps.phase_uf; i < EHCI_BANDWIDTH_SIZE;
> 			i += qh->ps.bw_uperiod)
> 		ehci->bandwidth[i] += usecs;
> 
> 	/* Complete-split (full/low speed) */
> 	if (qh->ps.c_usecs) {

The fact that c_usecs is nonzero guarantees that we are dealing with a 
full/low-speed endpoint.  High-speed transfers don't use split 
transactions, so they don't reserve any bandwidth for complete-splits.

> 		/* NOTE: adjustments needed for FSTN */
> 		for (i = start_uf; i < EHCI_BANDWIDTH_SIZE;
> 				i += qh->ps.bw_uperiod) {

It takes a little checking to make sure, but in fact bw_uperiod is always a 
multiple of 8 for full/low-speed endpoints.  (Such endpoints don't make use 
of microframes; everything is in multiples of frames, i.e., multiples of 8 
microframes.)

Therefore i is always a multiple of 8 between 0 and 56 (inclusive), since 
EHCI_BANDWIDTH_SIZE is 64.

> 			for ((j = 2, m = 1 << (j+8)); j < 8; (++j, m <<= 1)) {

We always have 2 <= j < 8.

> 				if (qh->ps.cs_mask & m)
> 					ehci->bandwidth[i+j] += c_usecs;

Therefore 2 <= i+j < 56+8 = 64.

> 			}
> 		}
> 	}
> [...]
> 
>    There shouldn't be a buffer overflow iff qh->ps.bw_uperiod is a 
>    multiple of 8, right?

Correct; see above.  To probe that qh->ps.bw_uperiod is always a multiple of 
8, search the driver for assignments to qh->ps.bw_uperiod.  (The only such 
assignments occur in ehci-q.c:qh_make() -- the assignments in ehci-sched.c 
are all to stream->ps.bw_uperiod, and a stream is different from a qh.)  The
first assigment is for high-speed endpoints and the second is for 
full/low-speed endpoints.  That second assignment does:

			qh->ps.bw_uperiod = qh->ps.bw_period << 3;

which is always a multiple of 8.

Alan Stern
