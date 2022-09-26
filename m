Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CF4C32771
	for <linux-usb@archiver.kernel.org>; Mon, 26 Sep 2022 16:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiIZQaG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 26 Sep 2022 12:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiIZQ3p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Sep 2022 12:29:45 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 307637FE74
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 08:18:28 -0700 (PDT)
Received: (qmail 410830 invoked by uid 1000); 26 Sep 2022 11:18:27 -0400
Date:   Mon, 26 Sep 2022 11:18:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fix: add XHCI_SPURIOUS_SUCCESS to ASM1042 despite being
 a V0.96 controller
Message-ID: <YzHCw2FP+CdDK62Y@rowland.harvard.edu>
References: <20220925172236.2288-1-jens.glathe@oldschoolsolutions.biz>
 <c1857a88-2303-43d7-5539-37afd2401a12@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1857a88-2303-43d7-5539-37afd2401a12@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 26, 2022 at 02:31:42PM +0300, Mathias Nyman wrote:
> Hi
> 
> Thanks for the patch, some small changes still needed:
> 
> Include subsystem in subject line, something like
> usb: xhci: Add XHCI_SPURIOUS...

And don't forget to include a revision number inside the []'s on the 
Subject line for all revised submissions.

> On 25.9.2022 20.22, Jens Glathe wrote:
> > only if it reports as a V0.96 XHCI controller. Appears to fix the errors

It would be nice if the first sentence (not to mention the later ones) 
of the patch description actually was a complete sentence.  I realize 
that lots of commits don't bother to do this, but IMNSHO they ought to.

> > "xhci_hcd <address>; ERROR Transfer event TRB DMA ptr not part of
> > current TD ep_index 2 comp_code 13" that appear spuriously (or pretty
> > often) when using a r8152 USB3 ethernet adapter with integrated hub.
> > 
> > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > ---

Likewise, for resubmissions don't forget to include a quick description 
here (just below the "---" line) of how the resubmission differs from 
the earlier versions.

Alan Stern
