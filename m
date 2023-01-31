Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F181C38142
	for <linux-usb@archiver.kernel.org>; Tue, 31 Jan 2023 20:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbjAaUlN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 31 Jan 2023 15:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbjAaUlM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Jan 2023 15:41:12 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id EEFE5485BF
        for <linux-usb@vger.kernel.org>; Tue, 31 Jan 2023 12:41:08 -0800 (PST)
Received: (qmail 462383 invoked by uid 1000); 31 Jan 2023 15:41:08 -0500
Date:   Tue, 31 Jan 2023 15:41:08 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y9l85PAcc/i/tgnS@rowland.harvard.edu>
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
 <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
 <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
 <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu>
 <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 31, 2023 at 04:59:36PM +0100, Troels Liebe Bentsen wrote:
> On Fri, 27 Jan 2023 at 17:07, Alan Stern <stern@rowland.harvard.edu> wrote:
> > Now that I know the config descriptors won't get reallocated after all,
> > I can remove the locking from the descriptors file entirely.  A patch to
> > do this is below.  It ought to fix your problem.  Try it and see.
> 
> Thank you very much, I built a new kernel with the patch and can confirm
> that it fixes my issue.
> 
> Will the patch make it into any of the LTS kernels as it could seem like a
> bugfix depending on how you look at it or is it only destined mainline, fx. 6.2
> or 6.3?

I don't know.  I will submit it for the -stable kernels, but the 
decision on whether to accept it will be up to Greg KH.

Alan Stern
