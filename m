Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D223CC77B73
	for <linux-usb@archiver.kernel.org>; Thu, 27 Apr 2023 16:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244120AbjD0QLv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 27 Apr 2023 12:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243023AbjD0QLu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 12:11:50 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 80C0740EC
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 09:11:49 -0700 (PDT)
Received: (qmail 168595 invoked by uid 1000); 27 Apr 2023 12:11:48 -0400
Date:   Thu, 27 Apr 2023 12:11:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Wlodzimierz Lipert <wlodzimierz.lipert@gmail.com>
Cc:     gregkh@linuxfoundation.org, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: prevent duplicate bEndpointAddress by
 usb_ep_autoconfig_ss (bitmap).
Message-ID: <a32c221c-a163-4456-ad43-93fd370abd1c@rowland.harvard.edu>
References: <20230426114528.3996-1-wlodzimierz.lipert@gmail.com>
 <99b09680-b362-431c-aa9f-a07722d0eba3@rowland.harvard.edu>
 <CABygZEqTLfa3ydW_HAdGmBVCgr0nXyj9k0ZFeHGcy+tMDmgm_g@mail.gmail.com>
 <8b0684fc-c312-4315-ab01-d45ef7a87725@rowland.harvard.edu>
 <CABygZEq1u6FXbvjWPsnuiVzRvKNDF+EUYZ8Ze0QARZr3A=amWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABygZEq1u6FXbvjWPsnuiVzRvKNDF+EUYZ8Ze0QARZr3A=amWA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 27, 2023 at 05:36:34PM +0200, Wlodzimierz Lipert wrote:
> Indeed, easier to follow. What you think about adding the check (below),
> IMHO we should not test bits outside of valid range, and it will cover
> bugs in ep name.

> >         if (isdigit(ep->name[2])) {             /* Number encoded in name */
> >                 num = simple_strtoul(&ep->name[2], NULL, 10);
>                  if (num > 15 || *epmap & (1 << num))
> >                         return NULL;            /* Endpoint is unavailable */

We don't want to cover up bugs; we want to _fix_ them.  That's why I 
suggested adding a WARN_ON(), so that people will be aware there's a bug 
that needs fixing.  If you prefer, you could do it like this:

		if (num > 15) {
			WARN_ON(1);	/* Invalid endpoint number */
			return NULL;
		}
		if (*epmap & (1 << num))
			return NULL;	/* Endpoint is unavailable */

That would be okay.

Alan Stern
