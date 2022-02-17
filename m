Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D133BC433EF
	for <linux-usb@archiver.kernel.org>; Thu, 17 Feb 2022 01:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbiBQBxG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 16 Feb 2022 20:53:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiBQBxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 20:53:06 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8457E1074E6
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 17:52:52 -0800 (PST)
Received: (qmail 803299 invoked by uid 1000); 16 Feb 2022 20:52:51 -0500
Date:   Wed, 16 Feb 2022 20:52:51 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Sergey Shtylyov' <s.shtylyov@omp.ru>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: host: ehci-q: make qtd_fill() return 'u16'
Message-ID: <Yg2qc6Xjbp0NwRDJ@rowland.harvard.edu>
References: <7f2e3194-c897-7ffd-756e-8a9c93d652cd@omp.ru>
 <db41f36420cc4d8585665bf586c1e26e@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db41f36420cc4d8585665bf586c1e26e@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 16, 2022 at 10:33:15PM +0000, David Laight wrote:
> From: Sergey Shtylyov
> > Sent: 16 February 2022 20:19
> > 
> > At the end of qtd_fill(), we assign the 'int count' variable to the 'size_t
> > length' field of 'struct ehci_qtd'.  In order not to mix the *signed* and
> > *unsigned* values let's make that variable and the function's result 'u16'
> > as qTD's maximum length is a 15-bit quantity anyway...
> 
> Except that you really don't want to be doing arithmetic on sub-register
> sized values.
> On everything except x86 the compiler will have to add instructions
> to mask the value to 16 bits (unless its logic can detect that overflow
> can never happen).
> 
> There is a similar problem with parameters and return values.
> They need masking one side of the call (or maybe both).
> 
> > Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> > analysis tool.
> 
> Which clearly doesn't understand the implications of its reports.
> 
> 	David

Agreed.  It would be acceptable to change the types to "unsigned int", 
but there's no reason to make them "u16".

In general, the only situation where a size should be smaller than the 
native register size is when you're defining fields in a structure or 
union, or doing memory-mapped I/O (which often involves the same 
thing).

Alan Stern
