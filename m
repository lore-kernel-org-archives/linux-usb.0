Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6D9C07E9A
	for <linux-usb@archiver.kernel.org>; Wed, 14 Jul 2021 16:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8619E61377
	for <linux-usb@archiver.kernel.org>; Wed, 14 Jul 2021 16:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhGNQau (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 14 Jul 2021 12:30:50 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37717 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229576AbhGNQat (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 12:30:49 -0400
Received: (qmail 385431 invoked by uid 1000); 14 Jul 2021 12:27:57 -0400
Date:   Wed, 14 Jul 2021 12:27:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Jeffery <djeffery@redhat.com>
Cc:     linux-usb@vger.kernel.org, Laurence Oberman <loberman@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ewan Milne <emilne@redhat.com>, apanagio@redhat.com,
        torez@redhat.com
Subject: Re: [PATCH] usb: ehci: Prevent missed ehci interrupts with
 edge-triggered MSI
Message-ID: <20210714162757.GD380727@rowland.harvard.edu>
References: <20210714140309.GA27799@redhat>
 <20210714142923.GA380727@rowland.harvard.edu>
 <CA+-xHTGb73f_nCHg=D0qyFp2v-UaCpyisdbWvoUKTaVB077Zeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+-xHTGb73f_nCHg=D0qyFp2v-UaCpyisdbWvoUKTaVB077Zeg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 12:10:26PM -0400, David Jeffery wrote:
> On Wed, Jul 14, 2021 at 10:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Does this issue affect any other PCI-based host controller drivers?
> >
> > Alan Stern
> >
> 
> Possibly.  The uhci driver should have the same issue if hardware
> exists with it and has MSI for it.  I suspect the ohci driver has a
> similar issue, but I'm not familiar enough with its interfaces and
> specification to say for sure.

Hmmm.  I've never heard of an MSI implementation of either of those, 
although it may be possible for OHCI.  UHCI was used only by Intel and 
one or two others; as far as I know none of them are producing those 
controllers any more.  Nowadays when people want to support USB-1.1 
devices but not USB-3, they use an EHCI controller together with a 
"rate-matching" hub, which avoids the need for any UHCI or OHCI 
controller.

I was wondering more about dwc2 or other non-EHCI USB-2 controller 
drivers.

Alan Stern
