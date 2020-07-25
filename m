Return-Path: <SRS0=C/te=BE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5605C433E0
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 19:57:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5F6C2070B
	for <linux-usb@archiver.kernel.org>; Sat, 25 Jul 2020 19:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgGYT5I (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 25 Jul 2020 15:57:08 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41769 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727954AbgGYT5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 15:57:08 -0400
Received: (qmail 1426717 invoked by uid 1000); 25 Jul 2020 15:57:07 -0400
Date:   Sat, 25 Jul 2020 15:57:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3 v5] USB: Fix device driver race
Message-ID: <20200725195707.GB1426415@rowland.harvard.edu>
References: <ab1fcd9c7e8f4aecd1f709a74a763bcc239fe6c4.camel@hadess.net>
 <20200725145922.GC1421097@rowland.harvard.edu>
 <fa8f94ff5d62b42569b559a10638f952b2037145.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa8f94ff5d62b42569b559a10638f952b2037145.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 05:24:20PM +0200, Bastien Nocera wrote:
> On Sat, 2020-07-25 at 10:59 -0400, Alan Stern wrote:
> <snip>
> > > +	udev = to_usb_device(dev);
> > > +	if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
> > > +	    (!new_udriver->match || new_udriver->match(udev) != 0))
> > > +		return 0;
> > > +
> > > +	(void)!device_reprobe(dev);
> > 
> > What's that '!' doing hiding in there?  It doesn't affect the final 
> > outcome, but it sure looks weird -- if people notice it at all.
> 
> It's how we stop gcc from complaining about the warn_unused_result
> attribute on device_reprobe()... (void) is enough with clang, but not
> with gcc.

Hmmm.  Maybe this is an indication that device_reprobe() doesn't really 
need to be __must_check.

Greg, do you know why it's annotated this way?

Alan Stern
